package system

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/system"
	systemReq "github.com/flipped-aurora/gin-vue-admin/server/model/system/request"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
)

type BscContractConfigService struct{}

func (s *BscContractConfigService) CreateBscContractConfig(cfg *system.SysBscContractConfig) error {
	return global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		events := cfg.Events
		cfg.Events = nil
		if err := tx.Omit("Events").Create(cfg).Error; err != nil {
			return err
		}
		for i := range events {
			events[i].ContractConfigId = cfg.ID
			events[i].ID = 0
		}
		if len(events) > 0 {
			if err := tx.Create(&events).Error; err != nil {
				return err
			}
		}
		cfg.Events = events
		return nil
	})
}

func (s *BscContractConfigService) UpdateBscContractConfig(cfg system.SysBscContractConfig) error {
	return global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		if err := tx.Model(&system.SysBscContractConfig{}).Where("id = ?", cfg.ID).Omit("Events").Updates(&cfg).Error; err != nil {
			return err
		}

		// 收集提交的事件ID列表
		keepIds := make([]uint, 0)
		for _, e := range cfg.Events {
			if e.ID > 0 {
				keepIds = append(keepIds, e.ID)
			}
		}

		// 删除不再存在的事件
		if len(keepIds) > 0 {
			if err := tx.Where("contract_config_id = ? AND id NOT IN ?", cfg.ID, keepIds).Delete(&system.SysBscContractEvent{}).Error; err != nil {
				return err
			}
		} else {
			if err := tx.Where("contract_config_id = ?", cfg.ID).Delete(&system.SysBscContractEvent{}).Error; err != nil {
				return err
			}
		}

		// 更新已有事件，创建新事件
		for i := range cfg.Events {
			cfg.Events[i].ContractConfigId = cfg.ID
			if cfg.Events[i].ID > 0 {
				if err := tx.Model(&cfg.Events[i]).Where("id = ?", cfg.Events[i].ID).Updates(&cfg.Events[i]).Error; err != nil {
					return err
				}
			} else {
				cfg.Events[i].ID = 0
				if err := tx.Create(&cfg.Events[i]).Error; err != nil {
					return err
				}
			}
		}
		return nil
	})
}

func (s *BscContractConfigService) DeleteBscContractConfig(id uint) error {
	return global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		if err := tx.Where("contract_config_id = ?", id).Delete(&system.SysBscContractEvent{}).Error; err != nil {
			return err
		}
		if err := tx.Delete(&system.SysBscContractConfig{}, id).Error; err != nil {
			return err
		}
		return nil
	})
}

func (s *BscContractConfigService) GetBscContractConfig(id uint) (cfg system.SysBscContractConfig, err error) {
	err = global.GVA_DB.Where("id = ?", id).First(&cfg).Error
	if err != nil {
		return
	}
	var events []system.SysBscContractEvent
	global.GVA_DB.Where("contract_config_id = ?", id).Find(&events)
	cfg.Events = events
	return
}

func (s *BscContractConfigService) GetBscContractConfigList(info systemReq.BscContractConfigSearch) (list []system.SysBscContractConfig, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
	db := global.GVA_DB.Model(&system.SysBscContractConfig{})
	if info.Name != "" {
		db = db.Where("name LIKE ?", "%"+info.Name+"%")
	}
	if info.ContractAddress != "" {
		db = db.Where("contract_address = ?", info.ContractAddress)
	}
	if info.Enabled != nil {
		db = db.Where("enabled = ?", *info.Enabled)
	}
	if err = db.Count(&total).Error; err != nil {
		return
	}
	if limit != 0 {
		db = db.Limit(limit).Offset(offset)
	}
	err = db.Order("id DESC").Find(&list).Error
	for i := range list {
		var events []system.SysBscContractEvent
		global.GVA_DB.Where("contract_config_id = ?", list[i].ID).Find(&events)
		list[i].Events = events
	}
	return
}

func (s *BscContractConfigService) GetEnabledContracts() (list []system.SysBscContractConfig, err error) {
	err = global.GVA_DB.Where("enabled = ?", true).Find(&list).Error
	if err != nil {
		return
	}
	for i := range list {
		var events []system.SysBscContractEvent
		global.GVA_DB.Where("contract_config_id = ? AND enabled = ?", list[i].ID, true).Find(&events)
		list[i].Events = events
	}
	return
}

func (s *BscContractConfigService) GetEnabledContractsByChainId(chainId int) (list []system.SysBscContractConfig, err error) {
	err = global.GVA_DB.Where("chain_id = ? AND enabled = ?", chainId, true).Find(&list).Error
	if err != nil {
		return
	}
	for i := range list {
		var events []system.SysBscContractEvent
		global.GVA_DB.Where("contract_config_id = ? AND enabled = ?", list[i].ID, true).Find(&events)
		list[i].Events = events
	}
	return
}

func (s *BscContractConfigService) InsertSyncedEvents(tx *gorm.DB, events []system.SysBscSyncedEvent) (int, error) {
	if len(events) == 0 {
		return 0, nil
	}
	result := tx.Clauses(clause.OnConflict{DoNothing: true}).Create(&events)
	return int(result.RowsAffected), result.Error
}

func (s *BscContractConfigService) InsertSyncLog(tx *gorm.DB, log *system.SysBscSyncLog) error {
	return tx.Create(log).Error
}
