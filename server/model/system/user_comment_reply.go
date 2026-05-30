package system

import "github.com/flipped-aurora/gin-vue-admin/server/global"

type UserCommentReply struct {
	global.GVA_MODEL
	CommentID uint        `json:"commentId" gorm:"column:comment_id;index;comment:评论ID"`
	UserID    uint        `json:"userId" gorm:"column:user_id;comment:用户ID"`
	AtUserID  uint        `json:"atUserId" gorm:"column:at_user_id;comment:@的用户ID"`
	Content   string      `json:"content" gorm:"column:content;type:text;comment:回复内容"`
	IP        string      `json:"ip" gorm:"column:ip;type:varchar(45);comment:IP"`
	User      *UserH5User `json:"user" gorm:"-"`
	AtUser    *UserH5User `json:"atUser" gorm:"-"`
}

func (UserCommentReply) TableName() string {
	return "user_comment_replies"
}
