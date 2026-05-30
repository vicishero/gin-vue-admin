package app

import (
	"fmt"
	"strings"
	"time"

	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/system"
	systemReq "github.com/flipped-aurora/gin-vue-admin/server/model/system/request"
	"github.com/flipped-aurora/gin-vue-admin/server/utils"
	"github.com/google/uuid"
	"gorm.io/gorm/clause"
)

type WalletAuthService struct{}

func (s *WalletAuthService) GenerateNonce(walletAddr string) (string, time.Time, error) {
	nonce := "Sign this message to login to Chirp: " + uuid.New().String()
	expiresAt := time.Now().Add(5 * time.Minute)
	record := system.UserWalletNonce{
		WalletAddress: strings.ToLower(walletAddr),
		Nonce:         nonce,
		ExpiresAt:     expiresAt,
	}
	err := global.GVA_DB.Clauses(clause.OnConflict{
		Columns:   []clause.Column{{Name: "wallet_address"}},
		DoUpdates: clause.AssignmentColumns([]string{"nonce", "expires_at", "updated_at"}),
	}).Create(&record).Error
	return nonce, expiresAt, err
}

func (s *WalletAuthService) VerifyAndLogin(walletAddr, signature string) (system.UserH5User, string, int64, error) {
	addr := strings.ToLower(walletAddr)

	var nonceRecord system.UserWalletNonce
	if err := global.GVA_DB.Where("wallet_address = ?", addr).First(&nonceRecord).Error; err != nil {
		return system.UserH5User{}, "", 0, fmt.Errorf("nonce not found, please request a new one")
	}
	if time.Now().After(nonceRecord.ExpiresAt) {
		global.GVA_DB.Delete(&nonceRecord)
		return system.UserH5User{}, "", 0, fmt.Errorf("nonce expired, please request a new one")
	}

	recoveredAddr, err := ecRecover(nonceRecord.Nonce, signature)
	if err != nil {
		return system.UserH5User{}, "", 0, fmt.Errorf("signature verification failed: %w", err)
	}
	if !strings.EqualFold(recoveredAddr, addr) {
		return system.UserH5User{}, "", 0, fmt.Errorf("signature does not match wallet address")
	}

	global.GVA_DB.Delete(&nonceRecord)

	var userService UserH5Service
	user, err := userService.CreateOrGetByWallet(addr)
	if err != nil {
		return system.UserH5User{}, "", 0, err
	}

	token, expiresAt, err := s.issueJWT(user)
	if err != nil {
		return system.UserH5User{}, "", 0, err
	}

	return user, token, expiresAt, nil
}

func (s *WalletAuthService) issueJWT(user system.UserH5User) (string, int64, error) {
	j := utils.NewJWT()
	claims := j.CreateClaims(systemReq.BaseClaims{
		UUID:        uuid.New(),
		ID:          user.ID,
		NickName:    user.Nickname,
		Username:    user.Username,
		AuthorityId: 9528,
	})
	token, err := j.CreateToken(claims)
	if err != nil {
		return "", 0, err
	}
	return token, claims.ExpiresAt.Unix(), nil
}
