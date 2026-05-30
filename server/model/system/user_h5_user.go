package system

import "github.com/flipped-aurora/gin-vue-admin/server/global"

type UserH5User struct {
	global.GVA_MODEL
	WalletAddress  string `json:"walletAddress" gorm:"column:wallet_address;type:varchar(42);uniqueIndex;comment:钱包地址"`
	Nickname       string `json:"nickname" gorm:"column:nickname;type:varchar(64);comment:昵称"`
	Username       string `json:"username" gorm:"column:username;type:varchar(64);uniqueIndex;comment:唯一句柄"`
	Avatar         string `json:"avatar" gorm:"column:avatar;type:varchar(512);comment:头像URL"`
	Bio            string `json:"bio" gorm:"column:bio;type:varchar(512);comment:简介"`
	FollowingCount int    `json:"followingCount" gorm:"column:following_count;default:0;comment:关注数"`
	FollowerCount  int    `json:"followerCount" gorm:"column:follower_count;default:0;comment:粉丝数"`
	PostCount      int    `json:"postCount" gorm:"column:post_count;default:0;comment:发帖数"`
	Status         int    `json:"status" gorm:"column:status;type:tinyint;default:1;comment:状态(1正常/0冻结)"`
}

func (UserH5User) TableName() string {
	return "user_h5_users"
}
