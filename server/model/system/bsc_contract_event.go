package system

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// 合约事件定义
type SysBscContractEvent struct {
	global.GVA_MODEL
	ContractConfigId uint   `json:"contractConfigId" form:"contractConfigId" gorm:"column:contract_config_id;index;comment:合约配置ID;" binding:"required"`
	EventName        string `json:"eventName" form:"eventName" gorm:"column:event_name;comment:事件名称;" binding:"required"`
	TopicHash        string `json:"topicHash" form:"topicHash" gorm:"column:topic_hash;comment:事件签名Hash;" binding:"required"`
	AbiSignature     string `json:"abiSignature" form:"abiSignature" gorm:"column:abi_signature;type:text;comment:ABI签名;"`
	Enabled          *bool  `json:"enabled" form:"enabled" gorm:"column:enabled;default:true;comment:是否启用;"`
}

func (SysBscContractEvent) TableName() string {
	return "bsc_contract_events"
}
