package initialize

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/service"
)

var bscSyncEngine = service.ServiceGroupApp.SystemServiceGroup.BscSyncEngineService

func BscSync() {
	if global.GVA_DB == nil {
		return
	}
	go bscSyncEngine.Start()
}

func BscSyncStop() {
	bscSyncEngine.Stop()
}
