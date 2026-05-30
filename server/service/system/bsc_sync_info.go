package system

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/system"
	systemReq "github.com/flipped-aurora/gin-vue-admin/server/model/system/request"
	"gorm.io/gorm"
)

type BscSyncInfoService struct{}

func (s *BscSyncInfoService) CreateBscSyncInfo(info *system.SysBscSyncInfo) error {
	return global.GVA_DB.Create(info).Error
}

func (s *BscSyncInfoService) UpdateBscSyncInfo(info *system.SysBscSyncInfo) error {
	return global.GVA_DB.Model(&system.SysBscSyncInfo{}).Where("id = ?", info.ID).Updates(info).Error
}

func (s *BscSyncInfoService) DeleteBscSyncInfo(id uint) error {
	return global.GVA_DB.Delete(&system.SysBscSyncInfo{}, id).Error
}

func (s *BscSyncInfoService) GetBscSyncInfo(id uint) (info system.SysBscSyncInfo, err error) {
	err = global.GVA_DB.Where("id = ?", id).First(&info).Error
	return
}

func (s *BscSyncInfoService) GetBscSyncInfoList(info systemReq.BscSyncInfoSearch) (list []system.SysBscSyncInfo, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
	db := global.GVA_DB.Model(&system.SysBscSyncInfo{})
	if info.ChainId != nil {
		db = db.Where("chain_id = ?", *info.ChainId)
	}
	if err = db.Count(&total).Error; err != nil {
		return
	}
	if limit != 0 {
		db = db.Limit(limit).Offset(offset)
	}
	err = db.Order("id DESC").Find(&list).Error
	return
}

func (s *BscSyncInfoService) GetEnabledList() (list []system.SysBscSyncInfo, err error) {
	err = global.GVA_DB.Where("enabled = ?", true).Find(&list).Error
	return
}

func (s *BscSyncInfoService) UpdateLastSyncedBlock(tx *gorm.DB, id uint, block int64) error {
	return tx.Model(&system.SysBscSyncInfo{}).Where("id = ?", id).Update("last_synced_block", block).Error
}
