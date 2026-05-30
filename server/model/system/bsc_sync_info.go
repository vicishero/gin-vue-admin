package system

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

type SysBscSyncInfo struct {
	global.GVA_MODEL
	ChainId             int    `json:"chainId" form:"chainId" gorm:"column:chain_id;uniqueIndex;comment:链ID;"`
	RpcUrl              string `json:"rpcUrl" form:"rpcUrl" gorm:"column:rpc_url;comment:RPC节点地址;"`
	StartBlock          int64  `json:"startBlock" form:"startBlock" gorm:"column:start_block;default:0;comment:起始同步区块号;"`
	LastSyncedBlock     int64  `json:"lastSyncedBlock" form:"lastSyncedBlock" gorm:"column:last_synced_block;default:0;comment:最后同步区块号;"`
	BlockStep           int64  `json:"blockStep" form:"blockStep" gorm:"column:block_step;default:5000;comment:区块步长;"`
	SyncIntervalSeconds int    `json:"syncIntervalSeconds" form:"syncIntervalSeconds" gorm:"column:sync_interval_seconds;default:1;comment:请求时间间隔(秒);"`
	Enabled             *bool  `json:"enabled" form:"enabled" gorm:"column:enabled;default:true;comment:是否启用;"`
}

func (SysBscSyncInfo) TableName() string {
	return "bsc_sync_infos"
}
