package system

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/system"
	systemReq "github.com/flipped-aurora/gin-vue-admin/server/model/system/request"
)

type BscSyncedEventService struct{}

func (s *BscSyncedEventService) GetBscSyncedEventList(info systemReq.BscSyncedEventSearch) (list []system.SysBscSyncedEvent, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
	db := global.GVA_DB.Model(&system.SysBscSyncedEvent{})
	if info.ContractConfigId != nil {
		db = db.Where("contract_config_id = ?", *info.ContractConfigId)
	}
	if info.Status != nil {
		db = db.Where("status = ?", *info.Status)
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

func (s *BscSyncedEventService) UpdateStatus(id uint, status int) error {
	return global.GVA_DB.Model(&system.SysBscSyncedEvent{}).Where("id = ?", id).Update("status", status).Error
}
