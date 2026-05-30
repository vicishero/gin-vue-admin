package system

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"time"
)

// 已同步事件
type SysBscSyncedEvent struct {
	global.GVA_MODEL
	ContractConfigId uint      `json:"contractConfigId" form:"contractConfigId" gorm:"column:contract_config_id;index;comment:合约配置ID;"`
	EventId          uint      `json:"eventId" form:"eventId" gorm:"column:event_id;comment:事件定义ID;"`
	BlockNumber      int64     `json:"blockNumber" form:"blockNumber" gorm:"column:block_number;index;comment:区块号;"`
	BlockHash        string    `json:"blockHash" form:"blockHash" gorm:"column:block_hash;comment:区块Hash;"`
	TxHash           string    `json:"txHash" form:"txHash" gorm:"column:tx_hash;uniqueIndex:idx_tx_log;comment:交易Hash;"`
	LogIndex         uint      `json:"logIndex" form:"logIndex" gorm:"column:log_index;uniqueIndex:idx_tx_log;comment:日志索引;"`
	Topics           string    `json:"topics" form:"topics" gorm:"column:topics;type:text;comment:事件Topics(JSON);"`
	Data             string    `json:"data" form:"data" gorm:"column:data;type:text;comment:事件原始数据;"`
	EventData        string    `json:"eventData" form:"eventData" gorm:"column:event_data;type:text;comment:解码后事件数据(JSON);"`
	SyncedAt         time.Time `json:"syncedAt" form:"syncedAt" gorm:"column:synced_at;comment:同步时间;"`
	Status           int       `json:"status" form:"status" gorm:"column:status;type:tinyint;default:0;comment:状态(0未处理/1已处理);"`
}

func (SysBscSyncedEvent) TableName() string {
	return "bsc_synced_events"
}
