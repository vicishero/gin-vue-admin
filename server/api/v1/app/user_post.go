package app

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
	systemReq "github.com/flipped-aurora/gin-vue-admin/server/model/system/request"
	"github.com/flipped-aurora/gin-vue-admin/server/utils"
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

type H5PostApi struct{}

func (api *H5PostApi) CreatePost(c *gin.Context) {
	var req systemReq.CreatePostReq
	if err := c.ShouldBindJSON(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if len(req.Contents) == 0 {
		response.FailWithMessage("content is required", c)
		return
	}
	uid := utils.GetUserID(c)
	post, err := userPostService.CreatePost(uid, req, c.ClientIP())
	if err != nil {
		global.GVA_LOG.Error("create post failed", zap.Error(err))
		response.FailWithMessage("create failed: "+err.Error(), c)
		return
	}
	response.OkWithDetailed(post, "success", c)
}

func (api *H5PostApi) GetPost(c *gin.Context) {
	id, err := parseUintParam(c, "id")
	if err != nil {
		response.FailWithMessage("invalid post id", c)
		return
	}
	post, err := userPostService.GetPostByID(uint(id))
	if err != nil {
		response.FailWithMessage("post not found", c)
		return
	}
	response.OkWithData(post, c)
}

func (api *H5PostApi) DeletePost(c *gin.Context) {
	id, err := parseUintParam(c, "id")
	if err != nil {
		response.FailWithMessage("invalid post id", c)
		return
	}
	uid := utils.GetUserID(c)
	if err := userPostService.DeletePost(uint(id), uid); err != nil {
		response.FailWithMessage("delete failed: "+err.Error(), c)
		return
	}
	response.OkWithMessage("deleted", c)
}

func (api *H5PostApi) GetFeed(c *gin.Context) {
	var req systemReq.PostFeedSearch
	if err := c.ShouldBindQuery(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	uid := utils.GetUserID(c)
	posts, total, err := userPostService.GetFeed(uid, req)
	if err != nil {
		global.GVA_LOG.Error("get feed failed", zap.Error(err))
		response.FailWithMessage("get feed failed: "+err.Error(), c)
		return
	}
	response.OkWithDetailed(response.PageResult{
		List:     posts,
		Total:    total,
		Page:     req.Page,
		PageSize: req.PageSize,
	}, "success", c)
}
