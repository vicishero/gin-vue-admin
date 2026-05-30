package system

import "github.com/flipped-aurora/gin-vue-admin/server/global"

type UserPostStar struct {
	global.GVA_MODEL
	PostID uint `json:"postId" gorm:"column:post_id;uniqueIndex:idx_post_user"`
	UserID uint `json:"userId" gorm:"column:user_id;uniqueIndex:idx_post_user"`
}

func (UserPostStar) TableName() string {
	return "user_post_stars"
}
