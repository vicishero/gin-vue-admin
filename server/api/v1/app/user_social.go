package app

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
	"github.com/flipped-aurora/gin-vue-admin/server/utils"
	"github.com/gin-gonic/gin"
)

type H5SocialApi struct{}

// --- Follow ---

type followReq struct {
	TargetID uint `json:"targetId" binding:"required"`
}

func (api *H5SocialApi) Follow(c *gin.Context) {
	var req followReq
	if err := c.ShouldBindJSON(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	uid := utils.GetUserID(c)
	if err := followingService.Follow(uid, req.TargetID); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	response.OkWithMessage("followed", c)
}

func (api *H5SocialApi) Unfollow(c *gin.Context) {
	var req followReq
	if err := c.ShouldBindJSON(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	uid := utils.GetUserID(c)
	if err := followingService.Unfollow(uid, req.TargetID); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	response.OkWithMessage("unfollowed", c)
}

func (api *H5SocialApi) GetFollowings(c *gin.Context) {
	uid := utils.GetUserID(c)
	page, pageSize := getPageParams(c)
	list, total, _ := followingService.GetFollowings(uid, page, pageSize)
	response.OkWithDetailed(response.PageResult{List: list, Total: total, Page: page, PageSize: pageSize}, "success", c)
}

func (api *H5SocialApi) GetFollowers(c *gin.Context) {
	uid := utils.GetUserID(c)
	page, pageSize := getPageParams(c)
	list, total, _ := followingService.GetFollowers(uid, page, pageSize)
	response.OkWithDetailed(response.PageResult{List: list, Total: total, Page: page, PageSize: pageSize}, "success", c)
}

// --- Collection ---

type collectReq struct {
	PostID uint `json:"postId" binding:"required"`
}

func (api *H5SocialApi) ToggleCollect(c *gin.Context) {
	var req collectReq
	if err := c.ShouldBindJSON(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	uid := utils.GetUserID(c)
	collected, err := socialService.ToggleCollect(req.PostID, uid)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	response.OkWithData(map[string]interface{}{"collected": collected}, c)
}

func (api *H5SocialApi) GetCollected(c *gin.Context) {
	uid := utils.GetUserID(c)
	page, pageSize := getPageParams(c)
	list, total, _ := socialService.GetCollected(uid, page, pageSize)
	response.OkWithDetailed(response.PageResult{List: list, Total: total, Page: page, PageSize: pageSize}, "success", c)
}

func (api *H5SocialApi) GetLiked(c *gin.Context) {
	uid := utils.GetUserID(c)
	page, pageSize := getPageParams(c)
	list, total, _ := socialService.GetCollected(uid, page, pageSize)
	response.OkWithDetailed(response.PageResult{List: list, Total: total, Page: page, PageSize: pageSize}, "success", c)
}

// --- Tags ---

func (api *H5SocialApi) GetTags(c *gin.Context) {
	tags, _ := socialService.GetTrendingTags(20)
	response.OkWithData(tags, c)
}

// --- Messages ---

type markReadReq struct {
	IDs []uint `json:"ids"`
}

func (api *H5SocialApi) GetMessages(c *gin.Context) {
	uid := utils.GetUserID(c)
	page, pageSize := getPageParams(c)
	list, total, _ := socialService.GetMessages(uid, page, pageSize)
	response.OkWithDetailed(response.PageResult{List: list, Total: total, Page: page, PageSize: pageSize}, "success", c)
}

func (api *H5SocialApi) MarkRead(c *gin.Context) {
	var req markReadReq
	if err := c.ShouldBindJSON(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	uid := utils.GetUserID(c)
	_ = socialService.MarkRead(req.IDs, uid)
	response.OkWithMessage("ok", c)
}

func (api *H5SocialApi) UnreadCount(c *gin.Context) {
	uid := utils.GetUserID(c)
	count, _ := socialService.UnreadCount(uid)
	response.OkWithData(map[string]interface{}{"count": count}, c)
}

// --- Upload ---

func (api *H5SocialApi) UploadImage(c *gin.Context) {
	_, header, err := c.Request.FormFile("file")
	if err != nil {
		response.FailWithMessage("no file uploaded", c)
		return
	}
	uid := utils.GetUserID(c)
	storePath := global.GVA_CONFIG.Local.StorePath // e.g. "uploads/file"
	filename := storePath + "/h5/" + randStr(16) + "_" + header.Filename
	if err := c.SaveUploadedFile(header, filename); err != nil {
		response.FailWithMessage("upload failed", c)
		return
	}
	response.OkWithData(map[string]interface{}{"url": "/" + filename, "userId": uid}, c)
}
