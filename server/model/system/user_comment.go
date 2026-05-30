package system

import "github.com/flipped-aurora/gin-vue-admin/server/global"

type UserComment struct {
	global.GVA_MODEL
	PostID          uint              `json:"postId" gorm:"column:post_id;index;comment:帖子ID"`
	UserID          uint              `json:"userId" gorm:"column:user_id;index;comment:用户ID"`
	Content         string            `json:"content" gorm:"column:content;type:text;comment:评论内容"`
	ReplyCount      int32             `json:"replyCount" gorm:"column:reply_count;default:0;comment:回复数"`
	ThumbsUpCount   int32             `json:"thumbsUpCount" gorm:"column:thumbs_up_count;default:0;comment:点赞数"`
	IP              string            `json:"ip" gorm:"column:ip;type:varchar(45);comment:IP"`
	IPLoc           string            `json:"ipLoc" gorm:"column:ip_loc;type:varchar(128);comment:IP归属地"`
	User            *UserH5User       `json:"user" gorm:"-"`
	Replies         []UserCommentReply `json:"replies" gorm:"-"`
}

func (UserComment) TableName() string {
	return "user_comments"
}
