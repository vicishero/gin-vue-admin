package system

import (
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type BscSyncedEventRouter struct{}

func (s *BscSyncedEventRouter) InitBscSyncedEventRouter(Router *gin.RouterGroup, PublicRouter *gin.RouterGroup) {
	bscEventRouter := Router.Group("bscSyncedEvent").Use(middleware.OperationRecord())
	bscEventRouterWithoutRecord := Router.Group("bscSyncedEvent")
	{
		bscEventRouter.PUT("updateStatus", bscSyncedEventApi.UpdateBscSyncedEventStatus)
	}
	{
		bscEventRouterWithoutRecord.GET("getBscSyncedEventList", bscSyncedEventApi.GetBscSyncedEventList)
	}
}
