package system

import (
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type BscContractConfigRouter struct{}

func (s *BscContractConfigRouter) InitBscContractConfigRouter(Router *gin.RouterGroup, PublicRouter *gin.RouterGroup) {
	bscRouter := Router.Group("bsc").Use(middleware.OperationRecord())
	bscRouterWithoutRecord := Router.Group("bsc")
	{
		bscRouter.POST("createBscContractConfig", bscApi.CreateBscContractConfig)
		bscRouter.DELETE("deleteBscContractConfig", bscApi.DeleteBscContractConfig)
		bscRouter.PUT("updateBscContractConfig", bscApi.UpdateBscContractConfig)
	}
	{
		bscRouterWithoutRecord.GET("findBscContractConfig", bscApi.FindBscContractConfig)
		bscRouterWithoutRecord.GET("getBscContractConfigList", bscApi.GetBscContractConfigList)
	}
}
