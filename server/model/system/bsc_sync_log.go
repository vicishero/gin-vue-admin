package system

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"time"
)

// 同步日志
type SysBscSyncLog struct {
	global.GVA_MODEL
	ContractConfigId uint      `json:"contractConfigId" form:"contractConfigId" gorm:"column:contract_config_id;index;comment:合约配置ID;"`
	StartBlock       int64     `json:"startBlock" form:"startBlock" gorm:"column:start_block;comment:起始区块号;"`
	EndBlock         int64     `json:"endBlock" form:"endBlock" gorm:"column:end_block;comment:结束区块号;"`
	EventsFound      int       `json:"eventsFound" form:"eventsFound" gorm:"column:events_found;default:0;comment:发现事件数;"`
	EventsNew        int       `json:"eventsNew" form:"eventsNew" gorm:"column:events_new;default:0;comment:新增事件数;"`
	Status           string    `json:"status" form:"status" gorm:"column:status;default:success;comment:状态(success/failed);"`
	ErrorMessage     string    `json:"errorMessage" form:"errorMessage" gorm:"column:error_message;type:text;comment:错误信息;"`
	StartedAt        time.Time `json:"startedAt" form:"startedAt" gorm:"column:started_at;comment:开始时间;"`
	FinishedAt       time.Time `json:"finishedAt" form:"finishedAt" gorm:"column:finished_at;comment:结束时间;"`
}

func (SysBscSyncLog) TableName() string {
	return "bsc_sync_logs"
}
