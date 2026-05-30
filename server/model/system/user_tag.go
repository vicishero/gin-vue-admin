package system

import "github.com/flipped-aurora/gin-vue-admin/server/global"

type UserTag struct {
	global.GVA_MODEL
	UserID   uint   `json:"userId" gorm:"column:user_id;comment:创建者ID"`
	Tag      string `json:"tag" gorm:"column:tag;type:varchar(64);uniqueIndex;comment:话题名"`
	QuoteNum int64  `json:"quoteNum" gorm:"column:quote_num;default:0;comment:引用次数"`
}

func (UserTag) TableName() string {
	return "user_tags"
}
