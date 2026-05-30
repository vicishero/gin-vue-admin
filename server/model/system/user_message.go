package system

import "github.com/flipped-aurora/gin-vue-admin/server/global"

type UserMessage struct {
	global.GVA_MODEL
	SenderUserID   uint   `json:"senderUserId" gorm:"column:sender_user_id;comment:发送者ID"`
	ReceiverUserID uint   `json:"receiverUserId" gorm:"column:receiver_user_id;index;comment:接收者ID"`
	Type           int8   `json:"type" gorm:"column:type;type:tinyint;comment:1点赞/2评论/3回复/4关注/5系统"`
	Brief          string `json:"brief" gorm:"column:brief;type:varchar(256);comment:摘要"`
	Content        string `json:"content" gorm:"column:content;type:text;comment:内容"`
	PostID         uint   `json:"postId" gorm:"column:post_id;default:0;comment:关联帖子ID"`
	CommentID      uint   `json:"commentId" gorm:"column:comment_id;default:0;comment:关联评论ID"`
	IsRead         bool   `json:"isRead" gorm:"column:is_read;default:false;comment:已读"`
}

func (UserMessage) TableName() string {
	return "user_messages"
}
