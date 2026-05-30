package system

import (
	"strconv"

	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
	"github.com/flipped-aurora/gin-vue-admin/server/model/system"
	systemReq "github.com/flipped-aurora/gin-vue-admin/server/model/system/request"
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

type BscSyncInfoApi struct{}

func (api *BscSyncInfoApi) CreateBscSyncInfo(c *gin.Context) {
	var info system.SysBscSyncInfo
	if err := c.ShouldBindJSON(&info); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := bscSyncInfoService.CreateBscSyncInfo(&info); err != nil {
		global.GVA_LOG.Error("创建链配置失败!", zap.Error(err))
		response.FailWithMessage("创建失败:"+err.Error(), c)
		return
	}
	response.OkWithMessage("创建成功", c)
}

func (api *BscSyncInfoApi) UpdateBscSyncInfo(c *gin.Context) {
	var info system.SysBscSyncInfo
	if err := c.ShouldBindJSON(&info); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := bscSyncInfoService.UpdateBscSyncInfo(&info); err != nil {
		global.GVA_LOG.Error("更新链配置失败!", zap.Error(err))
		response.FailWithMessage("更新失败:"+err.Error(), c)
		return
	}
	response.OkWithMessage("更新成功", c)
}

func (api *BscSyncInfoApi) DeleteBscSyncInfo(c *gin.Context) {
	idStr := c.Query("ID")
	id, err := strconv.ParseUint(idStr, 10, 64)
	if err != nil {
		response.FailWithMessage("ID格式错误", c)
		return
	}
	if err := bscSyncInfoService.DeleteBscSyncInfo(uint(id)); err != nil {
		global.GVA_LOG.Error("删除链配置失败!", zap.Error(err))
		response.FailWithMessage("删除失败:"+err.Error(), c)
		return
	}
	response.OkWithMessage("删除成功", c)
}

func (api *BscSyncInfoApi) FindBscSyncInfo(c *gin.Context) {
	idStr := c.Query("ID")
	id, err := strconv.ParseUint(idStr, 10, 64)
	if err != nil {
		response.FailWithMessage("ID格式错误", c)
		return
	}
	info, err := bscSyncInfoService.GetBscSyncInfo(uint(id))
	if err != nil {
		global.GVA_LOG.Error("查询链配置失败!", zap.Error(err))
		response.FailWithMessage("查询失败:"+err.Error(), c)
		return
	}
	response.OkWithData(info, c)
}

func (api *BscSyncInfoApi) GetBscSyncInfoList(c *gin.Context) {
	var pageInfo systemReq.BscSyncInfoSearch
	if err := c.ShouldBindQuery(&pageInfo); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	list, total, err := bscSyncInfoService.GetBscSyncInfoList(pageInfo)
	if err != nil {
		global.GVA_LOG.Error("获取链配置列表失败!", zap.Error(err))
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
