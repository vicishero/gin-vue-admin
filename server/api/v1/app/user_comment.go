package app

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
	"github.com/flipped-aurora/gin-vue-admin/server/utils"
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

type H5CommentApi struct{}

type createCommentReq struct {
	PostID  uint   `json:"postId" binding:"required"`
	Content string `json:"content" binding:"required"`
}

func (api *H5CommentApi) CreateComment(c *gin.Context) {
	var req createCommentReq
	if err := c.ShouldBindJSON(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	uid := utils.GetUserID(c)
	comment, err := commentService.CreateComment(req.PostID, uid, req.Content, c.ClientIP())
	if err != nil {
		global.GVA_LOG.Error("create comment failed", zap.Error(err))
		response.FailWithMessage("create failed: "+err.Error(), c)
		return
	}
	response.OkWithData(comment, c)
}

func (api *H5CommentApi) GetCommentList(c *gin.Context) {
	pid, err := parseUintParam(c, "pid")
	if err != nil {
		response.FailWithMessage("invalid post id", c)
		return
	}
	page := 1
	pageSize := 20
	if p := c.Query("page"); p != "" {
		page, _ = parseUintStr(p)
	}
	if ps := c.Query("pageSize"); ps != "" {
		pageSize, _ = parseUintStr(ps)
	}
	list, total, err := commentService.GetCommentList(uint(pid), page, pageSize)
	if err != nil {
		response.FailWithMessage("get failed: "+err.Error(), c)
		return
	}
	response.OkWithDetailed(response.PageResult{
		List: list, Total: total, Page: page, PageSize: pageSize,
	}, "success", c)
}

func (api *H5CommentApi) DeleteComment(c *gin.Context) {
	id, err := parseUintParam(c, "id")
	if err != nil {
		response.FailWithMessage("invalid comment id", c)
		return
	}
	uid := utils.GetUserID(c)
	if err := commentService.DeleteComment(uint(id), uid); err != nil {
		response.FailWithMessage("delete failed: "+err.Error(), c)
		return
	}
	response.OkWithMessage("deleted", c)
}

type createReplyReq struct {
	CommentID uint   `json:"commentId" binding:"required"`
	Content   string `json:"content" binding:"required"`
	AtUserID  uint   `json:"atUserId"`
}

func (api *H5CommentApi) CreateReply(c *gin.Context) {
	var req createReplyReq
	if err := c.ShouldBindJSON(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	uid := utils.GetUserID(c)
	reply, err := commentService.CreateReply(req.CommentID, uid, req.AtUserID, req.Content, c.ClientIP())
	if err != nil {
		global.GVA_LOG.Error("create reply failed", zap.Error(err))
		response.FailWithMessage("create failed: "+err.Error(), c)
		return
	}
	response.OkWithData(reply, c)
}

func (api *H5CommentApi) GetReplies(c *gin.Context) {
	cid, err := parseUintParam(c, "cid")
	if err != nil {
		response.FailWithMessage("invalid comment id", c)
		return
	}
	page := 1
	pageSize := 20
	if p := c.Query("page"); p != "" {
		page, _ = parseUintStr(p)
	}
	if ps := c.Query("pageSize"); ps != "" {
		pageSize, _ = parseUintStr(ps)
	}
	list, total, err := commentService.GetReplies(uint(cid), page, pageSize)
	if err != nil {
		response.FailWithMessage("get failed: "+err.Error(), c)
		return
	}
	response.OkWithDetailed(response.PageResult{
		List: list, Total: total, Page: page, PageSize: pageSize,
	}, "success", c)
}

type toggleLikeReq struct {
	PostID uint `json:"postId" binding:"required"`
}

func (api *H5CommentApi) ToggleLike(c *gin.Context) {
	var req toggleLikeReq
	if err := c.ShouldBindJSON(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	uid := utils.GetUserID(c)
	liked, err := commentService.ToggleLike(req.PostID, uid)
	if err != nil {
		response.FailWithMessage("toggle failed: "+err.Error(), c)
		return
	}
	response.OkWithData(map[string]interface{}{"liked": liked}, c)
}
