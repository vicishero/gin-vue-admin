package app

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/system"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
)

type UserFollowingService struct{}

func (s *UserFollowingService) Follow(userID, targetID uint) error {
	if userID == targetID {
		return errSelfFollow
	}
	err := global.GVA_DB.Clauses(clause.OnConflict{DoNothing: true}).Create(&system.UserFollowing{
		UserID:   userID,
		FollowID: targetID,
	}).Error
	if err != nil {
		return err
	}
	global.GVA_DB.Model(&system.UserH5User{}).Where("id = ?", userID).
		UpdateColumn("following_count", gorm.Expr("following_count + 1"))
	global.GVA_DB.Model(&system.UserH5User{}).Where("id = ?", targetID).
		UpdateColumn("follower_count", gorm.Expr("follower_count + 1"))
	return nil
}

func (s *UserFollowingService) Unfollow(userID, targetID uint) error {
	result := global.GVA_DB.Where("user_id = ? AND follow_id = ?", userID, targetID).Delete(&system.UserFollowing{})
	if result.RowsAffected == 0 {
		return nil
	}
	global.GVA_DB.Model(&system.UserH5User{}).Where("id = ? AND following_count > 0", userID).
		UpdateColumn("following_count", gorm.Expr("following_count - 1"))
	global.GVA_DB.Model(&system.UserH5User{}).Where("id = ? AND follower_count > 0", targetID).
		UpdateColumn("follower_count", gorm.Expr("follower_count - 1"))
	return nil
}

func (s *UserFollowingService) GetFollowings(userID uint, page, pageSize int) ([]system.UserFollowing, int64, error) {
	var list []system.UserFollowing
	var total int64
	query := global.GVA_DB.Model(&system.UserFollowing{}).Where("user_id = ?", userID)
	query.Count(&total)
	if err := query.Order("created_at DESC").Offset(pageSize * (page - 1)).Limit(pageSize).Find(&list).Error; err != nil {
		return nil, 0, err
	}
	for i := range list {
		var u system.UserH5User
		if err := global.GVA_DB.First(&u, list[i].FollowID).Error; err == nil {
			list[i].User = &u
		}
	}
	return list, total, nil
}

func (s *UserFollowingService) GetFollowers(userID uint, page, pageSize int) ([]system.UserFollowing, int64, error) {
	var list []system.UserFollowing
	var total int64
	query := global.GVA_DB.Model(&system.UserFollowing{}).Where("follow_id = ?", userID)
	query.Count(&total)
	if err := query.Order("created_at DESC").Offset(pageSize * (page - 1)).Limit(pageSize).Find(&list).Error; err != nil {
		return nil, 0, err
	}
	for i := range list {
		var u system.UserH5User
		if err := global.GVA_DB.First(&u, list[i].UserID).Error; err == nil {
			list[i].User = &u
		}
	}
	return list, total, nil
}

var errSelfFollow = errStr("cannot follow yourself")
