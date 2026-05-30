package system

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/system"
	"gorm.io/gorm"
)

type H5AdminService struct{}

// --- User Management ---

func (s *H5AdminService) GetH5UserList(page, pageSize int, keyword, nickname, username, walletAddress string, status *int) ([]system.UserH5User, int64, error) {
	var list []system.UserH5User
	var total int64
	db := global.GVA_DB.Model(&system.UserH5User{})
	if keyword != "" {
		like := "%" + keyword + "%"
		db = db.Where("nickname LIKE ? OR username LIKE ? OR wallet_address LIKE ?", like, like, like)
	}
	if nickname != "" {
		db = db.Where("nickname LIKE ?", "%"+nickname+"%")
	}
	if username != "" {
		db = db.Where("username LIKE ?", "%"+username+"%")
	}
	if walletAddress != "" {
		db = db.Where("wallet_address LIKE ?", "%"+walletAddress+"%")
	}
	if status != nil {
		db = db.Where("status = ?", *status)
	}
	db.Count(&total)
	if err := db.Order("id DESC").Offset(pageSize * (page - 1)).Limit(pageSize).Find(&list).Error; err != nil {
		return nil, 0, err
	}
	return list, total, nil
}

func (s *H5AdminService) GetH5UserByID(id uint) (*system.UserH5User, error) {
	var u system.UserH5User
	if err := global.GVA_DB.First(&u, id).Error; err != nil {
		return nil, err
	}
	return &u, nil
}

func (s *H5AdminService) UpdateH5User(id uint, updates map[string]interface{}) error {
	return global.GVA_DB.Model(&system.UserH5User{}).Where("id = ?", id).Updates(updates).Error
}

func (s *H5AdminService) DeleteH5User(id uint) error {
	return global.GVA_DB.Delete(&system.UserH5User{}, id).Error
}

// --- Post Management ---

func (s *H5AdminService) GetH5PostList(page, pageSize int, keyword string, userID *uint, tag string, visibility *int) ([]system.UserPost, int64, error) {
	var list []system.UserPost
	var total int64
	db := global.GVA_DB.Model(&system.UserPost{})
	if keyword != "" {
		db = db.Where("id IN (SELECT DISTINCT post_id FROM user_post_contents WHERE content LIKE ?)", "%"+keyword+"%")
	}
	if userID != nil {
		db = db.Where("user_id = ?", *userID)
	}
	if tag != "" {
		db = db.Where("tags LIKE ?", "%\""+tag+"\"%")
	}
	if visibility != nil {
		db = db.Where("visibility = ?", *visibility)
	}
	db.Count(&total)
	if err := db.Order("id DESC").Offset(pageSize * (page - 1)).Limit(pageSize).Find(&list).Error; err != nil {
		return nil, 0, err
	}
	userIDs := make([]uint, 0, len(list))
	for _, p := range list {
		userIDs = append(userIDs, p.UserID)
	}
	var users []system.UserH5User
	global.GVA_DB.Where("id IN ?", userIDs).Find(&users)
	userMap := make(map[uint]*system.UserH5User)
	for i := range users {
		userMap[users[i].ID] = &users[i]
	}
	for i := range list {
		if u, ok := userMap[list[i].UserID]; ok {
			list[i].User = u
		}
	}
	return list, total, nil
}

func (s *H5AdminService) GetH5PostByID(id uint) (*system.UserPost, error) {
	var post system.UserPost
	if err := global.GVA_DB.First(&post, id).Error; err != nil {
		return nil, err
	}
	var contents []system.UserPostContent
	global.GVA_DB.Where("post_id = ?", id).Order("sort ASC").Find(&contents)
	post.Contents = contents
	var user system.UserH5User
	if err := global.GVA_DB.First(&user, post.UserID).Error; err == nil {
		post.User = &user
	}
	return &post, nil
}

func (s *H5AdminService) UpdateH5Post(id uint, updates map[string]interface{}) error {
	return global.GVA_DB.Model(&system.UserPost{}).Where("id = ?", id).Updates(updates).Error
}

func (s *H5AdminService) DeleteH5Post(id uint) error {
	return global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		tx.Where("post_id = ?", id).Delete(&system.UserPostContent{})
		tx.Where("post_id = ?", id).Delete(&system.UserPostStar{})
		tx.Where("post_id = ?", id).Delete(&system.UserPostCollection{})
		tx.Where("post_id = ?", id).Delete(&system.UserComment{})
		tx.Delete(&system.UserPost{}, id)
		return nil
	})
}

// --- Comment Management ---

func (s *H5AdminService) GetH5CommentList(page, pageSize int, keyword string, postID *uint, userID *uint) ([]system.UserComment, int64, error) {
	var list []system.UserComment
	var total int64
	db := global.GVA_DB.Model(&system.UserComment{})
	if keyword != "" {
		db = db.Where("content LIKE ?", "%"+keyword+"%")
	}
	if postID != nil {
		db = db.Where("post_id = ?", *postID)
	}
	if userID != nil {
		db = db.Where("user_id = ?", *userID)
	}
	db.Count(&total)
	if err := db.Order("id DESC").Offset(pageSize * (page - 1)).Limit(pageSize).Find(&list).Error; err != nil {
		return nil, 0, err
	}
	userIDs := make([]uint, 0, len(list))
	for _, c := range list {
		userIDs = append(userIDs, c.UserID)
	}
	var users []system.UserH5User
	global.GVA_DB.Where("id IN ?", userIDs).Find(&users)
	userMap := make(map[uint]*system.UserH5User)
	for i := range users {
		userMap[users[i].ID] = &users[i]
	}
	for i := range list {
		if u, ok := userMap[list[i].UserID]; ok {
			list[i].User = u
		}
	}
	return list, total, nil
}

func (s *H5AdminService) DeleteH5Comment(id uint) error {
	return global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		tx.Where("comment_id = ?", id).Delete(&system.UserCommentReply{})
		tx.Delete(&system.UserComment{}, id)
		return nil
	})
}

// --- Tag Management ---

func (s *H5AdminService) GetH5TagList(page, pageSize int, keyword string) ([]system.UserTag, int64, error) {
	var list []system.UserTag
	var total int64
	db := global.GVA_DB.Model(&system.UserTag{})
	if keyword != "" {
		db = db.Where("tag LIKE ?", "%"+keyword+"%")
	}
	db.Count(&total)
	if err := db.Order("id DESC").Offset(pageSize * (page - 1)).Limit(pageSize).Find(&list).Error; err != nil {
		return nil, 0, err
	}
	return list, total, nil
}

func (s *H5AdminService) UpdateH5Tag(id uint, updates map[string]interface{}) error {
	return global.GVA_DB.Model(&system.UserTag{}).Where("id = ?", id).Updates(updates).Error
}

func (s *H5AdminService) DeleteH5Tag(id uint) error {
	return global.GVA_DB.Delete(&system.UserTag{}, id).Error
}

// --- Collection Management ---

func (s *H5AdminService) GetH5CollectionList(page, pageSize int, userID *uint, postID *uint) ([]system.UserPostCollection, int64, error) {
	var list []system.UserPostCollection
	var total int64
	db := global.GVA_DB.Model(&system.UserPostCollection{})
	if userID != nil {
		db = db.Where("user_id = ?", *userID)
	}
	if postID != nil {
		db = db.Where("post_id = ?", *postID)
	}
	db.Count(&total)
	if err := db.Order("id DESC").Offset(pageSize * (page - 1)).Limit(pageSize).Find(&list).Error; err != nil {
		return nil, 0, err
	}
	return list, total, nil
}

func (s *H5AdminService) DeleteH5Collection(id uint) error {
	return global.GVA_DB.Delete(&system.UserPostCollection{}, id).Error
}

// --- Following Management ---

func (s *H5AdminService) GetH5FollowingList(page, pageSize int, userID *uint, followID *uint) ([]system.UserFollowing, int64, error) {
	var list []system.UserFollowing
	var total int64
	db := global.GVA_DB.Model(&system.UserFollowing{})
	if userID != nil {
		db = db.Where("user_id = ?", *userID)
	}
	if followID != nil {
		db = db.Where("follow_id = ?", *followID)
	}
	db.Count(&total)
	if err := db.Order("id DESC").Offset(pageSize * (page - 1)).Limit(pageSize).Find(&list).Error; err != nil {
		return nil, 0, err
	}
	return list, total, nil
}

func (s *H5AdminService) DeleteH5Following(id uint) error {
	return global.GVA_DB.Delete(&system.UserFollowing{}, id).Error
}
