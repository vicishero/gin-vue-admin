package request

import "github.com/flipped-aurora/gin-vue-admin/server/model/common/request"

type CreatePostReq struct {
	Contents   []PostContentItem `json:"contents" binding:"required"`
	Visibility int8              `json:"visibility"`
	Tags       []string          `json:"tags"`
}

type PostContentItem struct {
	Content string `json:"content" binding:"required"`
	Type    int8   `json:"type" binding:"required"`
	Sort    int    `json:"sort"`
}

type PostFeedSearch struct {
	request.PageInfo
	Type     string `json:"type" form:"type"` // newest, hot, following
	UserID   uint   `json:"userId" form:"userId"`
	Tag      string `json:"tag" form:"tag"`
	Keyword  string `json:"keyword" form:"keyword"`
}
