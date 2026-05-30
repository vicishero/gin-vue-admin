package app

import (
	"encoding/json"
	"fmt"
	"strings"

	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/system"
	systemReq "github.com/flipped-aurora/gin-vue-admin/server/model/system/request"
	"gorm.io/gorm"
)

type UserPostService struct{}

func (s *UserPostService) CreatePost(userID uint, req systemReq.CreatePostReq, ip string) (*system.UserPost, error) {
	if req.Visibility == 0 {
		req.Visibility = 90
	}

	tagsJSON := "[]"
	if len(req.Tags) > 0 {
		tagBytes, _ := json.Marshal(req.Tags)
		tagsJSON = string(tagBytes)
	}

	post := system.UserPost{
		UserID:     userID,
		Visibility: req.Visibility,
		Tags:       tagsJSON,
		IP:         ip,
	}

	err := global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		if err := tx.Create(&post).Error; err != nil {
			return err
		}

		for i := range req.Contents {
			req.Contents[i].Sort = i
			content := system.UserPostContent{
				PostID:  post.ID,
				UserID:  userID,
				Content: req.Contents[i].Content,
				Type:    req.Contents[i].Type,
				Sort:    i,
			}
			if err := tx.Create(&content).Error; err != nil {
				return err
			}
			post.Contents = append(post.Contents, content)
		}

		if err := tx.Model(&system.UserH5User{}).Where("id = ?", userID).
			UpdateColumn("post_count", gorm.Expr("post_count + 1")).Error; err != nil {
			return err
		}

		for _, tag := range req.Tags {
			if strings.TrimSpace(tag) == "" {
				continue
			}
			tagName := strings.TrimSpace(tag)
			tagRecord := system.UserTag{Tag: tagName}
			tx.Where("tag = ?", tagName).FirstOrCreate(&tagRecord)
			tx.Model(&system.UserTag{}).Where("tag = ?", tagName).
				UpdateColumn("quote_num", gorm.Expr("quote_num + 1"))
		}

		return nil
	})

	if err != nil {
		return nil, err
	}

	return &post, nil
}

func (s *UserPostService) GetPostByID(id uint) (*system.UserPost, error) {
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

func (s *UserPostService) DeletePost(postID, userID uint) error {
	return global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		var post system.UserPost
		if err := tx.First(&post, postID).Error; err != nil {
			return err
		}
		if post.UserID != userID {
			return fmt.Errorf("permission denied")
		}

		if err := tx.Where("post_id = ?", postID).Delete(&system.UserPostContent{}).Error; err != nil {
			return err
		}
		if err := tx.Delete(&post).Error; err != nil {
			return err
		}

		tx.Model(&system.UserH5User{}).Where("id = ?", userID).
			UpdateColumn("post_count", gorm.Expr("GREATEST(post_count - 1, 0)"))

		return nil
	})
}

func (s *UserPostService) GetFeed(userID uint, req systemReq.PostFeedSearch) ([]system.UserPost, int64, error) {
	limit := req.PageSize
	offset := req.PageSize * (req.Page - 1)
	if limit <= 0 {
		limit = 20
	}
	if offset < 0 {
		offset = 0
	}

	var posts []system.UserPost
	var total int64

	query := global.GVA_DB.Model(&system.UserPost{})

	switch req.Type {
	case "following":
		if userID == 0 {
			return posts, 0, nil
		}
		subQuery := global.GVA_DB.Model(&system.UserFollowing{}).
			Select("follow_id").Where("user_id = ?", userID)
		query = query.Where("user_id IN (?)", subQuery)
	case "hot":
		query = query.Order("(upvote_count + comment_count * 2) DESC")
	}

	if req.UserID > 0 {
		query = query.Where("user_id = ?", req.UserID)
	}
	if req.Tag != "" {
		query = query.Where("tags LIKE ?", "%\""+req.Tag+"\"%")
	}
	if req.Keyword != "" {
		query = query.Where("id IN (SELECT DISTINCT post_id FROM user_post_contents WHERE content LIKE ?)", "%"+req.Keyword+"%")
	}

	query = query.Where("visibility = ?", 90)

	if err := query.Count(&total).Error; err != nil {
		return nil, 0, err
	}

	if req.Type != "hot" {
		query = query.Order("created_at DESC")
	}

	if err := query.Limit(limit).Offset(offset).Find(&posts).Error; err != nil {
		return nil, 0, err
	}

	userIDs := make([]uint, 0, len(posts))
	for _, p := range posts {
		userIDs = append(userIDs, p.UserID)
	}

	var users []system.UserH5User
	global.GVA_DB.Where("id IN ?", userIDs).Find(&users)
	userMap := make(map[uint]*system.UserH5User)
	for i := range users {
		userMap[users[i].ID] = &users[i]
	}

	for i := range posts {
		if u, ok := userMap[posts[i].UserID]; ok {
			posts[i].User = u
		}
		if req.UserID == 0 {
			posts[i].IP = ""
			posts[i].IPLoc = ""
		}
	}

	return posts, total, nil
}
