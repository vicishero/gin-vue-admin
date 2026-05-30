package system

import (
	"encoding/json"
	"fmt"
	"strconv"
	"sync"
	"time"

	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/system"
	"github.com/flipped-aurora/gin-vue-admin/server/utils/request"
	"go.uber.org/zap"
	"gorm.io/gorm"
)

type BscSyncEngineService struct {
	stopCh        chan struct{}
	once          sync.Once
	lastSyncTimes map[uint]time.Time
}

type jsonRPCRequest struct {
	Jsonrpc string        `json:"jsonrpc"`
	Method  string        `json:"method"`
	Params  []interface{} `json:"params"`
	ID      int           `json:"id"`
}

type jsonRPCResponse struct {
	Jsonrpc string          `json:"jsonrpc"`
	ID      int             `json:"id"`
	Result  json.RawMessage `json:"result"`
	Error   *jsonRPCError   `json:"error,omitempty"`
}

type jsonRPCError struct {
	Code    int    `json:"code"`
	Message string `json:"message"`
}

type ethLog struct {
	Address         string   `json:"address"`
	Topics          []string `json:"topics"`
	Data            string   `json:"data"`
	BlockNumber     string   `json:"blockNumber"`
	TransactionHash string   `json:"transactionHash"`
	BlockHash       string   `json:"blockHash"`
	LogIndex        string   `json:"logIndex"`
	Removed         bool     `json:"removed"`
}

func (s *BscSyncEngineService) Start() {
	s.stopCh = make(chan struct{})
	s.lastSyncTimes = make(map[uint]time.Time)
	ticker := time.NewTicker(1 * time.Second)
	defer ticker.Stop()

	global.GVA_LOG.Info("BSC sync engine started")

	for {
		select {
		case <-ticker.C:
			s.syncAllChains()
		case <-s.stopCh:
			global.GVA_LOG.Info("BSC sync engine stopped")
			return
		}
	}
}

func (s *BscSyncEngineService) Stop() {
	s.once.Do(func() {
		close(s.stopCh)
	})
}

func (s *BscSyncEngineService) syncAllChains() {
	infos, err := bscSyncInfoSvc.GetEnabledList()
	if err != nil {
		global.GVA_LOG.Error("failed to get enabled chains", zap.Error(err))
		return
	}
	now := time.Now()
	for i := range infos {
		info := &infos[i]
		interval := time.Duration(info.SyncIntervalSeconds) * time.Second
		if interval <= 0 {
			interval = 1 * time.Second
		}
		if last, ok := s.lastSyncTimes[info.ID]; ok && now.Sub(last) < interval {
			continue
		}
		if err := s.syncChain(info); err != nil {
			global.GVA_LOG.Error("failed to sync chain",
				zap.Int("chainId", info.ChainId),
				zap.Error(err))
		}
		s.lastSyncTimes[info.ID] = now
	}
}

func (s *BscSyncEngineService) syncChain(info *system.SysBscSyncInfo) error {
	contracts, err := bscContractConfigService.GetEnabledContractsByChainId(info.ChainId)
	if err != nil {
		return fmt.Errorf("get contracts: %w", err)
	}
	if len(contracts) == 0 {
		return nil
	}

	rpcURL := info.RpcUrl
	if rpcURL == "" {
		rpcURL = global.GVA_CONFIG.Bsc.DefaultRpcUrl
	}

	latestBlock, err := s.fetchLatestBlock(rpcURL)
	if err != nil {
		s.recordFailedSync(info.ID, 0, 0, err)
		return err
	}

	fromBlock := info.LastSyncedBlock + 1
	if fromBlock <= 0 {
		fromBlock = info.StartBlock
	}
	if fromBlock > latestBlock {
		return nil
	}

	step := info.BlockStep
	if step <= 0 {
		step = 5000
	}
	endBlock := fromBlock + step - 1
	if endBlock > latestBlock {
		endBlock = latestBlock
	}

	startedAt := time.Now()
	var totalFound, totalNew int

	for _, contract := range contracts {
		logs, err := s.fetchLogs(rpcURL, contract.ContractAddress, fromBlock, endBlock, contract.Events)
		if err != nil {
			s.recordFailedSync(info.ID, fromBlock, endBlock, err)
			return err
		}
		events := s.parseLogs(logs, &contract)
		totalFound += len(logs)

		err = global.GVA_DB.Transaction(func(tx *gorm.DB) error {
			n, e := bscContractConfigService.InsertSyncedEvents(tx, events)
			if e != nil {
				return e
			}
			totalNew += n

			syncLog := &system.SysBscSyncLog{
				ContractConfigId: contract.ID,
				StartBlock:       fromBlock,
				EndBlock:         endBlock,
				EventsFound:      len(logs),
				EventsNew:        n,
				Status:           "success",
				StartedAt:        startedAt,
				FinishedAt:       time.Now(),
			}
			return bscContractConfigService.InsertSyncLog(tx, syncLog)
		})
		if err != nil {
			s.recordFailedSync(info.ID, fromBlock, endBlock, err)
			return err
		}
	}

	info.LastSyncedBlock = endBlock
	return global.GVA_DB.Model(&system.SysBscSyncInfo{}).Where("id = ?", info.ID).Update("last_synced_block", endBlock).Error
}

func (s *BscSyncEngineService) fetchLatestBlock(rpcURL string) (int64, error) {
	return s.callEthBlockNumber(rpcURL)
}

func (s *BscSyncEngineService) callEthBlockNumber(rpcURL string) (int64, error) {
	rpcReq := jsonRPCRequest{
		Jsonrpc: "2.0",
		Method:  "eth_blockNumber",
		Params:  []interface{}{},
		ID:      1,
	}
	resp, err := s.callRPC(rpcURL, rpcReq)
	if err != nil {
		return 0, err
	}
	var hexStr string
	if err := json.Unmarshal(resp.Result, &hexStr); err != nil {
		return 0, fmt.Errorf("failed to parse blockNumber: %w", err)
	}
	return hexToInt64(hexStr)
}

func (s *BscSyncEngineService) fetchLogs(rpcURL, address string, fromBlock, toBlock int64, eventDefs []system.SysBscContractEvent) ([]ethLog, error) {
	topics := make([][]string, 0)
	if len(eventDefs) > 0 {
		topicList := make([]string, 0, len(eventDefs))
		for _, e := range eventDefs {
			topicList = append(topicList, e.TopicHash)
		}
		topics = append(topics, topicList)
	}

	params := map[string]interface{}{
		"fromBlock": fmt.Sprintf("0x%x", fromBlock),
		"toBlock":   fmt.Sprintf("0x%x", toBlock),
		"address":   address,
	}
	if len(topics) > 0 {
		params["topics"] = topics
	}

	rpcReq := jsonRPCRequest{
		Jsonrpc: "2.0",
		Method:  "eth_getLogs",
		Params:  []interface{}{params},
		ID:      1,
	}
	resp, err := s.callRPC(rpcURL, rpcReq)
	if err != nil {
		return nil, err
	}
	var logs []ethLog
	if err := json.Unmarshal(resp.Result, &logs); err != nil {
		return nil, fmt.Errorf("failed to parse logs: %w", err)
	}
	return logs, nil
}

func (s *BscSyncEngineService) callRPC(rpcURL string, rpcReq jsonRPCRequest) (*jsonRPCResponse, error) {
	headers := map[string]string{"Content-Type": "application/json"}
	resp, err := request.HttpRequestWithTimeout(rpcURL, "POST", headers, nil, rpcReq, 30*time.Second)
	if err != nil {
		return nil, fmt.Errorf("rpc call failed: %w", err)
	}
	defer resp.Body.Close()
	var rpcResp jsonRPCResponse
	if err := json.NewDecoder(resp.Body).Decode(&rpcResp); err != nil {
		return nil, fmt.Errorf("failed to decode rpc response: %w", err)
	}
	if rpcResp.Error != nil {
		return nil, fmt.Errorf("rpc error %d: %s", rpcResp.Error.Code, rpcResp.Error.Message)
	}
	return &rpcResp, nil
}

func (s *BscSyncEngineService) parseLogs(logs []ethLog, contract *system.SysBscContractConfig) []system.SysBscSyncedEvent {
	topicEventMap := make(map[string]uint)
	for _, e := range contract.Events {
		topicEventMap[e.TopicHash] = e.ID
	}
	now := time.Now()
	events := make([]system.SysBscSyncedEvent, 0, len(logs))
	for _, l := range logs {
		if l.Removed {
			continue
		}
		if len(l.Topics) == 0 {
			continue
		}
		eventId := topicEventMap[l.Topics[0]]
		blockNum, _ := hexToInt64(l.BlockNumber)
		logIdx, _ := hexToInt64(l.LogIndex)
		topicsJSON, _ := json.Marshal(l.Topics)
		events = append(events, system.SysBscSyncedEvent{
			ContractConfigId: contract.ID,
			EventId:          eventId,
			BlockNumber:      blockNum,
			BlockHash:        l.BlockHash,
			TxHash:           l.TransactionHash,
			LogIndex:         uint(logIdx),
			Topics:           string(topicsJSON),
			Data:             l.Data,
			SyncedAt:         now,
		})
	}
	return events
}

func (s *BscSyncEngineService) recordFailedSync(syncInfoId uint, fromBlock, endBlock int64, err error) {
	now := time.Now()
	log := &system.SysBscSyncLog{
		ContractConfigId: 0,
		StartBlock:       fromBlock,
		EndBlock:         endBlock,
		Status:           "failed",
		ErrorMessage:     err.Error(),
		StartedAt:        now,
		FinishedAt:       now,
	}
	global.GVA_DB.Create(log)
}

func hexToInt64(hexStr string) (int64, error) {
	if len(hexStr) < 3 {
		return 0, fmt.Errorf("invalid hex: %s", hexStr)
	}
	return strconv.ParseInt(hexStr[2:], 16, 64)
}

var bscContractConfigService = &BscContractConfigService{}
var bscSyncInfoSvc = &BscSyncInfoService{}
