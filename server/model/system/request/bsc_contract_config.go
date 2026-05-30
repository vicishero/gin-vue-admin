package request

import (
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
)

type BscContractConfigSearch struct {
	Name            string `json:"name" form:"name"`
	ContractAddress string `json:"contractAddress" form:"contractAddress"`
	Enabled         *bool  `json:"enabled" form:"enabled"`
	request.PageInfo
}
