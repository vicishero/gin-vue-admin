package system

import "github.com/flipped-aurora/gin-vue-admin/server/global"

type UserPostContent struct {
	global.GVA_MODEL
	PostID  uint   `json:"postId" gorm:"column:post_id;index;comment:帖子ID"`
	UserID  uint   `json:"userId" gorm:"column:user_id;comment:用户ID"`
	Content string `json:"content" gorm:"column:content;type:text;comment:内容(文本或媒体URL)"`
	Type    int8   `json:"type" gorm:"column:type;type:tinyint;comment:1标题/2文本/3图片/4视频/5音频/6链接/7附件"`
	Sort    int    `json:"sort" gorm:"column:sort;default:0;comment:排序"`
}

func (UserPostContent) TableName() string {
	return "user_post_contents"
}
