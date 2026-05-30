package system

import "time"

type UserWalletNonce struct {
	ID            uint      `gorm:"primarykey" json:"ID"`
	CreatedAt     time.Time `json:"createdAt"`
	UpdatedAt     time.Time `json:"updatedAt"`
	WalletAddress string    `json:"walletAddress" gorm:"column:wallet_address;type:varchar(42);uniqueIndex;comment:钱包地址"`
	Nonce         string    `json:"nonce" gorm:"column:nonce;type:varchar(128);comment:随机nonce"`
	ExpiresAt     time.Time `json:"expiresAt" gorm:"column:expires_at;comment:过期时间"`
}

func (UserWalletNonce) TableName() string {
	return "user_wallet_nonces"
}
