package request

import (
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
)

type BscSyncInfoSearch struct {
	ChainId *int `json:"chainId" form:"chainId"`
	request.PageInfo
}
