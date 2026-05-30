package system

import (
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type BscSyncInfoRouter struct{}

func (s *BscSyncInfoRouter) InitBscSyncInfoRouter(Router *gin.RouterGroup, PublicRouter *gin.RouterGroup) {
	bscSyncInfoRouter := Router.Group("bscSyncInfo").Use(middleware.OperationRecord())
	bscSyncInfoRouterWithoutRecord := Router.Group("bscSyncInfo")
	{
		bscSyncInfoRouter.POST("createBscSyncInfo", bscSyncInfoApi.CreateBscSyncInfo)
		bscSyncInfoRouter.DELETE("deleteBscSyncInfo", bscSyncInfoApi.DeleteBscSyncInfo)
		bscSyncInfoRouter.PUT("updateBscSyncInfo", bscSyncInfoApi.UpdateBscSyncInfo)
	}
	{
		bscSyncInfoRouterWithoutRecord.GET("findBscSyncInfo", bscSyncInfoApi.FindBscSyncInfo)
		bscSyncInfoRouterWithoutRecord.GET("getBscSyncInfoList", bscSyncInfoApi.GetBscSyncInfoList)
	}
}
