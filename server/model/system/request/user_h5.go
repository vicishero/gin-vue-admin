package request

import "github.com/flipped-aurora/gin-vue-admin/server/model/common/request"

type WalletNonceReq struct {
	WalletAddress string `json:"walletAddress" form:"walletAddress" binding:"required"`
}

type WalletLoginReq struct {
	WalletAddress string `json:"walletAddress" binding:"required"`
	Signature     string `json:"signature" binding:"required"`
}

type UpdateH5ProfileReq struct {
	Nickname string `json:"nickname"`
	Avatar   string `json:"avatar"`
	Bio      string `json:"bio"`
}

type H5UserSearch struct {
	request.PageInfo
	Keyword string `json:"keyword" form:"keyword"`
}
