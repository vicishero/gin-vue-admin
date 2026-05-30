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

type BscContractConfigApi struct{}

func (api *BscContractConfigApi) CreateBscContractConfig(c *gin.Context) {
	var cfg system.SysBscContractConfig
	if err := c.ShouldBindJSON(&cfg); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := bscContractConfigService.CreateBscContractConfig(&cfg); err != nil {
		global.GVA_LOG.Error("创建合约配置失败!", zap.Error(err))
		response.FailWithMessage("创建失败:"+err.Error(), c)
		return
	}
	response.OkWithMessage("创建成功", c)
}

func (api *BscContractConfigApi) UpdateBscContractConfig(c *gin.Context) {
	var cfg system.SysBscContractConfig
	if err := c.ShouldBindJSON(&cfg); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := bscContractConfigService.UpdateBscContractConfig(cfg); err != nil {
		global.GVA_LOG.Error("更新合约配置失败!", zap.Error(err))
		response.FailWithMessage("更新失败:"+err.Error(), c)
		return
	}
	response.OkWithMessage("更新成功", c)
}

func (api *BscContractConfigApi) DeleteBscContractConfig(c *gin.Context) {
	idStr := c.Query("ID")
	id, err := strconv.ParseUint(idStr, 10, 64)
	if err != nil {
		response.FailWithMessage("ID格式错误", c)
		return
	}
	if err := bscContractConfigService.DeleteBscContractConfig(uint(id)); err != nil {
		global.GVA_LOG.Error("删除合约配置失败!", zap.Error(err))
		response.FailWithMessage("删除失败:"+err.Error(), c)
		return
	}
	response.OkWithMessage("删除成功", c)
}

func (api *BscContractConfigApi) FindBscContractConfig(c *gin.Context) {
	idStr := c.Query("ID")
	id, err := strconv.ParseUint(idStr, 10, 64)
	if err != nil {
		response.FailWithMessage("ID格式错误", c)
		return
	}
	cfg, err := bscContractConfigService.GetBscContractConfig(uint(id))
	if err != nil {
		global.GVA_LOG.Error("查询合约配置失败!", zap.Error(err))
		response.FailWithMessage("查询失败:"+err.Error(), c)
		return
	}
	response.OkWithData(cfg, c)
}

func (api *BscContractConfigApi) GetBscContractConfigList(c *gin.Context) {
	var pageInfo systemReq.BscContractConfigSearch
	if err := c.ShouldBindQuery(&pageInfo); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	list, total, err := bscContractConfigService.GetBscContractConfigList(pageInfo)
	if err != nil {
		global.GVA_LOG.Error("获取合约配置列表失败!", zap.Error(err))
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
