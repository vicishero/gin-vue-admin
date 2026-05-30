package system

import "github.com/flipped-aurora/gin-vue-admin/server/global"

type UserFollowing struct {
	global.GVA_MODEL
	UserID   uint        `json:"userId" gorm:"column:user_id;uniqueIndex:idx_user_follow"`
	FollowID uint        `json:"followId" gorm:"column:follow_id;uniqueIndex:idx_user_follow"`
	User     *UserH5User `json:"user" gorm:"-"`
}

func (UserFollowing) TableName() string {
	return "user_followings"
}
