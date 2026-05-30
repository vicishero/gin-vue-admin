package system

import "github.com/flipped-aurora/gin-vue-admin/server/global"

type UserPost struct {
	global.GVA_MODEL
	UserID          uint   `json:"userId" gorm:"column:user_id;index;comment:用户ID"`
	CommentCount    int64  `json:"commentCount" gorm:"column:comment_count;default:0;comment:评论数"`
	CollectionCount int64  `json:"collectionCount" gorm:"column:collection_count;default:0;comment:收藏数"`
	UpvoteCount     int64  `json:"upvoteCount" gorm:"column:upvote_count;default:0;comment:点赞数"`
	Visibility      int8   `json:"visibility" gorm:"column:visibility;type:tinyint;default:90;comment:可见性(90公开/0私密/50好友)"`
	IsTop           bool   `json:"isTop" gorm:"column:is_top;default:false;comment:置顶"`
	IsEssence       bool   `json:"isEssence" gorm:"column:is_essence;default:false;comment:精选"`
	IsLock          bool   `json:"isLock" gorm:"column:is_lock;default:false;comment:锁定"`
	Tags            string `json:"tags" gorm:"column:tags;type:varchar(512);comment:标签JSON数组"`
	IP              string `json:"ip" gorm:"column:ip;type:varchar(45);comment:IP地址"`
	IPLoc           string `json:"ipLoc" gorm:"column:ip_loc;type:varchar(128);comment:IP归属地"`
	Contents        []UserPostContent `json:"contents" gorm:"-"`
	User            *UserH5User       `json:"user" gorm:"-"`
}

func (UserPost) TableName() string {
	return "user_posts"
}
