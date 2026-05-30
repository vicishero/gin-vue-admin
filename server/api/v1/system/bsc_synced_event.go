package system

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
	systemReq "github.com/flipped-aurora/gin-vue-admin/server/model/system/request"
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

type BscSyncedEventApi struct{}

func (api *BscSyncedEventApi) GetBscSyncedEventList(c *gin.Context) {
	var pageInfo systemReq.BscSyncedEventSearch
	if err := c.ShouldBindQuery(&pageInfo); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	list, total, err := bscSyncedEventService.GetBscSyncedEventList(pageInfo)
	if err != nil {
		global.GVA_LOG.Error("获取同步事件列表失败!", zap.Error(err))
		response.FailWithMessage("获取失败:"+err.Error(), c)
		return
	}
	response.OkWithDetailed(response.PageResult{
		List:     list,
		Total:    total,
		Page:     pageInfo.Page,
		PageSize: pageInfo.PageSize,
	}, "获取成功", c)
}

func (api *BscSyncedEventApi) UpdateBscSyncedEventStatus(c *gin.Context) {
	var req struct {
		ID     uint `json:"ID"`
		Status int  `json:"status"`
	}
	if err := c.ShouldBindJSON(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := bscSyncedEventService.UpdateStatus(req.ID, req.Status); err != nil {
		global.GVA_LOG.Error("更新事件状态失败!", zap.Error(err))
		response.FailWithMessage("更新失败:"+err.Error(), c)
		return
	}
	response.OkWithMessage("更新成功", c)
}
