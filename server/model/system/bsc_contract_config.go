package system

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// 合约配置
type SysBscContractConfig struct {
	global.GVA_MODEL
	Name            string                `json:"name" form:"name" gorm:"column:name;comment:合约名称;" binding:"required"`
	ContractAddress string                `json:"contractAddress" form:"contractAddress" gorm:"column:contract_address;comment:合约地址;" binding:"required"`
	ChainId         int                   `json:"chainId" form:"chainId" gorm:"column:chain_id;default:56;comment:链ID;"`
	Enabled         *bool                 `json:"enabled" form:"enabled" gorm:"column:enabled;default:true;comment:是否启用;"`
	Events          []SysBscContractEvent `json:"events" form:"events" gorm:"-"`
}

func (SysBscContractConfig) TableName() string {
	return "bsc_contract_configs"
}
