package request

import (
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
)

type BscSyncedEventSearch struct {
	ContractConfigId *uint `json:"contractConfigId" form:"contractConfigId"`
	Status           *int  `json:"status" form:"status"`
	request.PageInfo
}
