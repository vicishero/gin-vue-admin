package app

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/system"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
)

type UserSocialService struct{}

// --- Collection / Bookmark ---

func (s *UserSocialService) ToggleCollect(postID, userID uint) (bool, error) {
	var coll system.UserPostCollection
	err := global.GVA_DB.Unscoped().Where("post_id = ? AND user_id = ?", postID, userID).First(&coll).Error
	if err == nil {
		global.GVA_DB.Transaction(func(tx *gorm.DB) error {
			tx.Unscoped().Delete(&coll)
			tx.Model(&system.UserPost{}).Where("id = ?", postID).
				UpdateColumn("collection_count", gorm.Expr("GREATEST(collection_count - 1, 0)"))
			return nil
		})
		return false, nil
	}
	coll = system.UserPostCollection{PostID: postID, UserID: userID}
	global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		if err := tx.Clauses(clause.OnConflict{DoNothing: true}).Create(&coll).Error; err != nil {
			return err
		}
		tx.Model(&system.UserPost{}).Where("id = ?", postID).
			UpdateColumn("collection_count", gorm.Expr("collection_count + 1"))
		return nil
	})
	return true, nil
}

func (s *UserSocialService) GetCollected(userID uint, page, pageSize int) ([]system.UserPost, int64, error) {
	var total int64
	var colls []system.UserPostCollection
	query := global.GVA_DB.Where("user_id = ?", userID).Order("created_at DESC")
	query.Model(&system.UserPostCollection{}).Count(&total)
	if err := query.Offset(pageSize * (page - 1)).Limit(pageSize).Find(&colls).Error; err != nil {
		return nil, 0, err
	}
	postIDs := make([]uint, len(colls))
	for i, c := range colls {
		postIDs[i] = c.PostID
	}
	var posts []system.UserPost
	if len(postIDs) > 0 {
		global.GVA_DB.Where("id IN ?", postIDs).Find(&posts)
	}
	return posts, total, nil
}

// --- Tags ---

func (s *UserSocialService) GetTrendingTags(limit int) ([]system.UserTag, error) {
	var tags []system.UserTag
	if limit <= 0 {
		limit = 20
	}
	if err := global.GVA_DB.Order("quote_num DESC").Limit(limit).Find(&tags).Error; err != nil {
		return nil, err
	}
	return tags, nil
}

// --- Messages ---

func (s *UserSocialService) CreateMessage(msg system.UserMessage) error {
	return global.GVA_DB.Create(&msg).Error
}

func (s *UserSocialService) GetMessages(userID uint, page, pageSize int) ([]system.UserMessage, int64, error) {
	var list []system.UserMessage
	var total int64
	query := global.GVA_DB.Model(&system.UserMessage{}).Where("receiver_user_id = ?", userID)
	query.Count(&total)
	if err := query.Order("created_at DESC").Offset(pageSize * (page - 1)).Limit(pageSize).Find(&list).Error; err != nil {
		return nil, 0, err
	}
	return list, total, nil
}

func (s *UserSocialService) MarkRead(msgIDs []uint, userID uint) error {
	return global.GVA_DB.Model(&system.UserMessage{}).
		Where("id IN ? AND receiver_user_id = ?", msgIDs, userID).
		Update("is_read", true).Error
}

func (s *UserSocialService) UnreadCount(userID uint) (int64, error) {
	var count int64
	err := global.GVA_DB.Model(&system.UserMessage{}).
		Where("receiver_user_id = ? AND is_read = ?", userID, false).Count(&count).Error
	return count, err
}
