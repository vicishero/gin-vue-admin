package app

import (
	"errors"
	"strings"
	"time"

	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/system"
	"github.com/google/uuid"
	"gorm.io/gorm"
)

type UserH5Service struct{}

func (s *UserH5Service) FindByWalletAddress(addr string) (system.UserH5User, error) {
	var user system.UserH5User
	err := global.GVA_DB.Where("wallet_address = ?", addr).First(&user).Error
	return user, err
}

func (s *UserH5Service) FindByID(id uint) (system.UserH5User, error) {
	var user system.UserH5User
	err := global.GVA_DB.First(&user, id).Error
	return user, err
}

func (s *UserH5Service) FindByUsername(username string) (system.UserH5User, error) {
	var user system.UserH5User
	err := global.GVA_DB.Where("username = ?", username).First(&user).Error
	return user, err
}

func (s *UserH5Service) CreateOrGetByWallet(addr string) (system.UserH5User, error) {
	user, err := s.FindByWalletAddress(addr)
	if err == nil {
		global.GVA_DB.Model(&user).Update("updated_at", time.Now())
		return user, nil
	}
	if !errors.Is(err, gorm.ErrRecordNotFound) {
		return user, err
	}

	shortAddr := strings.ToLower(addr[:6] + "..." + addr[len(addr)-4:])
	username := "user_" + shortAddr
	nickname := "User_" + shortAddr

	user = system.UserH5User{
		WalletAddress: strings.ToLower(addr),
		Nickname:      nickname,
		Username:      username,
		Status:        1,
	}
	if createErr := global.GVA_DB.Create(&user).Error; createErr != nil {
		if strings.Contains(createErr.Error(), "Duplicate") || strings.Contains(createErr.Error(), "UNIQUE") {
			username = "user_" + strings.ToLower(addr[2:8]) + "_" + uuid.New().String()[:6]
			user.Username = username
			createErr = global.GVA_DB.Create(&user).Error
		}
		if createErr != nil {
			return user, createErr
		}
	}
	return user, nil
}

func (s *UserH5Service) UpdateProfile(id uint, nickname, avatar, bio string) error {
	updates := map[string]interface{}{}
	if nickname != "" {
		updates["nickname"] = nickname
	}
	if avatar != "" {
		updates["avatar"] = avatar
	}
	if bio != "" {
		updates["bio"] = bio
	}
	if len(updates) == 0 {
		return nil
	}
	return global.GVA_DB.Model(&system.UserH5User{}).Where("id = ?", id).Updates(updates).Error
}
