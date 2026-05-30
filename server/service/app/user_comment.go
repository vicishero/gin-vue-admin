package app

import (
	"fmt"

	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/system"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
)

type UserCommentService struct{}

func (s *UserCommentService) CreateComment(postID, userID uint, content, ip string) (*system.UserComment, error) {
	comment := system.UserComment{
		PostID:  postID,
		UserID:  userID,
		Content: content,
		IP:      ip,
	}
	err := global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		if err := tx.Create(&comment).Error; err != nil {
			return err
		}
		if err := tx.Model(&system.UserPost{}).Where("id = ?", postID).
			UpdateColumn("comment_count", gorm.Expr("comment_count + 1")).Error; err != nil {
			return err
		}
		return nil
	})
	if err != nil {
		return nil, err
	}
	return &comment, nil
}

func (s *UserCommentService) DeleteComment(commentID, userID uint) error {
	return global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		var comment system.UserComment
		if err := tx.First(&comment, commentID).Error; err != nil {
			return err
		}
		if comment.UserID != userID {
			return fmt.Errorf("permission denied")
		}
		if err := tx.Where("comment_id = ?", commentID).Delete(&system.UserCommentReply{}).Error; err != nil {
			return err
		}
		if err := tx.Delete(&comment).Error; err != nil {
			return err
		}
		tx.Model(&system.UserPost{}).Where("id = ?", comment.PostID).
			UpdateColumn("comment_count", gorm.Expr("GREATEST(comment_count - 1, 0)"))
		return nil
	})
}

func (s *UserCommentService) GetCommentList(postID uint, page, pageSize int) ([]system.UserComment, int64, error) {
	var comments []system.UserComment
	var total int64

	query := global.GVA_DB.Model(&system.UserComment{}).Where("post_id = ?", postID)
	query.Count(&total)

	if err := query.Order("created_at DESC").Offset(pageSize * (page - 1)).Limit(pageSize).Find(&comments).Error; err != nil {
		return nil, 0, err
	}

	for i := range comments {
		var user system.UserH5User
		if err := global.GVA_DB.First(&user, comments[i].UserID).Error; err == nil {
			comments[i].User = &user
		}
		var replies []system.UserCommentReply
		global.GVA_DB.Where("comment_id = ?", comments[i].ID).Order("created_at ASC").Limit(3).Find(&replies)
		for j := range replies {
			var u system.UserH5User
			if err := global.GVA_DB.First(&u, replies[j].UserID).Error; err == nil {
				replies[j].User = &u
			}
			if replies[j].AtUserID > 0 {
				var au system.UserH5User
				if err := global.GVA_DB.First(&au, replies[j].AtUserID).Error; err == nil {
					replies[j].AtUser = &au
				}
			}
		}
		comments[i].Replies = replies
	}

	return comments, total, nil
}

func (s *UserCommentService) CreateReply(commentID, userID, atUserID uint, content, ip string) (*system.UserCommentReply, error) {
	reply := system.UserCommentReply{
		CommentID: commentID,
		UserID:    userID,
		AtUserID:  atUserID,
		Content:   content,
		IP:        ip,
	}
	err := global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		if err := tx.Create(&reply).Error; err != nil {
			return err
		}
		if err := tx.Model(&system.UserComment{}).Where("id = ?", commentID).
			UpdateColumn("reply_count", gorm.Expr("reply_count + 1")).Error; err != nil {
			return err
		}
		return nil
	})
	if err != nil {
		return nil, err
	}
	return &reply, nil
}

func (s *UserCommentService) GetReplies(commentID uint, page, pageSize int) ([]system.UserCommentReply, int64, error) {
	var replies []system.UserCommentReply
	var total int64
	query := global.GVA_DB.Model(&system.UserCommentReply{}).Where("comment_id = ?", commentID)
	query.Count(&total)
	if err := query.Order("created_at ASC").Offset(pageSize * (page - 1)).Limit(pageSize).Find(&replies).Error; err != nil {
		return nil, 0, err
	}
	for i := range replies {
		var u system.UserH5User
		if err := global.GVA_DB.First(&u, replies[i].UserID).Error; err == nil {
			replies[i].User = &u
		}
		if replies[i].AtUserID > 0 {
			var au system.UserH5User
			if err := global.GVA_DB.First(&au, replies[i].AtUserID).Error; err == nil {
				replies[i].AtUser = &au
			}
		}
	}
	return replies, total, nil
}

func (s *UserCommentService) ToggleLike(postID, userID uint) (bool, error) {
	var star system.UserPostStar
	err := global.GVA_DB.Unscoped().Where("post_id = ? AND user_id = ?", postID, userID).First(&star).Error
	if err == nil {
		global.GVA_DB.Transaction(func(tx *gorm.DB) error {
			tx.Unscoped().Delete(&star)
			tx.Model(&system.UserPost{}).Where("id = ?", postID).
				UpdateColumn("upvote_count", gorm.Expr("GREATEST(upvote_count - 1, 0)"))
			return nil
		})
		return false, nil
	}

	star = system.UserPostStar{PostID: postID, UserID: userID}
	global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		if err := tx.Clauses(clause.OnConflict{DoNothing: true}).Create(&star).Error; err != nil {
			return err
		}
		tx.Model(&system.UserPost{}).Where("id = ?", postID).
			UpdateColumn("upvote_count", gorm.Expr("upvote_count + 1"))
		return nil
	})
	return true, nil
}
