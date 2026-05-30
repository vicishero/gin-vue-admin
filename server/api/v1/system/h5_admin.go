package system

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
	"go.uber.org/zap"

	"github.com/gin-gonic/gin"
)

type H5AdminApi struct{}

// ----- User -----

type h5UserSearch struct {
	request.PageInfo
	Nickname      string `json:"nickname" form:"nickname"`
	Username      string `json:"username" form:"username"`
	WalletAddress string `json:"walletAddress" form:"walletAddress"`
	Status        *int   `json:"status" form:"status"`
}

func (api *H5AdminApi) GetH5UserList(c *gin.Context) {
	var req h5UserSearch
	if err := c.ShouldBindQuery(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	list, total, err := h5AdminService.GetH5UserList(req.Page, req.PageSize, req.Keyword, req.Nickname, req.Username, req.WalletAddress, req.Status)
	if err != nil {
		global.GVA_LOG.Error("get h5 user list failed", zap.Error(err))
		response.FailWithMessage(err.Error(), c)
		return
	}
	response.OkWithDetailed(response.PageResult{List: list, Total: total, Page: req.Page, PageSize: req.PageSize}, "success", c)
}

func (api *H5AdminApi) GetH5User(c *gin.Context) {
	var req request.GetById
	if err := c.ShouldBindQuery(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	u, err := h5AdminService.GetH5UserByID(req.Uint())
	if err != nil {
		response.FailWithMessage("user not found", c)
		return
	}
	response.OkWithData(u, c)
}

func (api *H5AdminApi) UpdateH5User(c *gin.Context) {
	var req map[string]interface{}
	if err := c.ShouldBindJSON(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	idFloat, ok := req["ID"].(float64)
	if !ok {
		response.FailWithMessage("missing ID", c)
		return
	}
	delete(req, "ID")
	if err := h5AdminService.UpdateH5User(uint(idFloat), req); err != nil {
		global.GVA_LOG.Error("update h5 user failed", zap.Error(err))
		response.FailWithMessage(err.Error(), c)
		return
	}
	response.Ok(c)
}

func (api *H5AdminApi) DeleteH5User(c *gin.Context) {
	var req request.GetById
	if err := c.ShouldBindJSON(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := h5AdminService.DeleteH5User(req.Uint()); err != nil {
		global.GVA_LOG.Error("delete h5 user failed", zap.Error(err))
		response.FailWithMessage(err.Error(), c)
		return
	}
	response.Ok(c)
}

// ----- Post -----

type h5PostSearch struct {
	request.PageInfo
	UserID     *uint  `json:"userId" form:"userId"`
	Tag        string `json:"tag" form:"tag"`
	Visibility *int   `json:"visibility" form:"visibility"`
}

func (api *H5AdminApi) GetH5PostList(c *gin.Context) {
	var req h5PostSearch
	if err := c.ShouldBindQuery(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	list, total, err := h5AdminService.GetH5PostList(req.Page, req.PageSize, req.Keyword, req.UserID, req.Tag, req.Visibility)
	if err != nil {
		global.GVA_LOG.Error("get h5 post list failed", zap.Error(err))
		response.FailWithMessage(err.Error(), c)
		return
	}
	response.OkWithDetailed(response.PageResult{List: list, Total: total, Page: req.Page, PageSize: req.PageSize}, "success", c)
}

func (api *H5AdminApi) GetH5Post(c *gin.Context) {
	var req request.GetById
	if err := c.ShouldBindQuery(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	p, err := h5AdminService.GetH5PostByID(req.Uint())
	if err != nil {
		response.FailWithMessage("post not found", c)
		return
	}
	response.OkWithData(p, c)
}

func (api *H5AdminApi) UpdateH5Post(c *gin.Context) {
	var req map[string]interface{}
	if err := c.ShouldBindJSON(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	idFloat, ok := req["ID"].(float64)
	if !ok {
		response.FailWithMessage("missing ID", c)
		return
	}
	delete(req, "ID")
	if err := h5AdminService.UpdateH5Post(uint(idFloat), req); err != nil {
		global.GVA_LOG.Error("update h5 post failed", zap.Error(err))
		response.FailWithMessage(err.Error(), c)
		return
	}
	response.Ok(c)
}

func (api *H5AdminApi) DeleteH5Post(c *gin.Context) {
	var req request.GetById
	if err := c.ShouldBindJSON(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := h5AdminService.DeleteH5Post(req.Uint()); err != nil {
		global.GVA_LOG.Error("delete h5 post failed", zap.Error(err))
		response.FailWithMessage(err.Error(), c)
		return
	}
	response.Ok(c)
}

// ----- Comment -----

type h5CommentSearch struct {
	request.PageInfo
	PostID *uint `json:"postId" form:"postId"`
	UserID *uint `json:"userId" form:"userId"`
}

func (api *H5AdminApi) GetH5CommentList(c *gin.Context) {
	var req h5CommentSearch
	if err := c.ShouldBindQuery(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	list, total, err := h5AdminService.GetH5CommentList(req.Page, req.PageSize, req.Keyword, req.PostID, req.UserID)
	if err != nil {
		global.GVA_LOG.Error("get h5 comment list failed", zap.Error(err))
		response.FailWithMessage(err.Error(), c)
		return
	}
	response.OkWithDetailed(response.PageResult{List: list, Total: total, Page: req.Page, PageSize: req.PageSize}, "success", c)
}

func (api *H5AdminApi) DeleteH5Comment(c *gin.Context) {
	var req request.GetById
	if err := c.ShouldBindJSON(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := h5AdminService.DeleteH5Comment(req.Uint()); err != nil {
		global.GVA_LOG.Error("delete h5 comment failed", zap.Error(err))
		response.FailWithMessage(err.Error(), c)
		return
	}
	response.Ok(c)
}

// ----- Tag -----

func (api *H5AdminApi) GetH5TagList(c *gin.Context) {
	var req request.PageInfo
	if err := c.ShouldBindQuery(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	list, total, err := h5AdminService.GetH5TagList(req.Page, req.PageSize, req.Keyword)
	if err != nil {
		global.GVA_LOG.Error("get h5 tag list failed", zap.Error(err))
		response.FailWithMessage(err.Error(), c)
		return
	}
	response.OkWithDetailed(response.PageResult{List: list, Total: total, Page: req.Page, PageSize: req.PageSize}, "success", c)
}

func (api *H5AdminApi) UpdateH5Tag(c *gin.Context) {
	var req map[string]interface{}
	if err := c.ShouldBindJSON(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	idFloat, ok := req["ID"].(float64)
	if !ok {
		response.FailWithMessage("missing ID", c)
		return
	}
	delete(req, "ID")
	if err := h5AdminService.UpdateH5Tag(uint(idFloat), req); err != nil {
		global.GVA_LOG.Error("update h5 tag failed", zap.Error(err))
		response.FailWithMessage(err.Error(), c)
		return
	}
	response.Ok(c)
}

func (api *H5AdminApi) DeleteH5Tag(c *gin.Context) {
	var req request.GetById
	if err := c.ShouldBindJSON(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := h5AdminService.DeleteH5Tag(req.Uint()); err != nil {
		global.GVA_LOG.Error("delete h5 tag failed", zap.Error(err))
		response.FailWithMessage(err.Error(), c)
		return
	}
	response.Ok(c)
}

// ----- Collection -----

type h5CollectionSearch struct {
	request.PageInfo
	UserID *uint `json:"userId" form:"userId"`
	PostID *uint `json:"postId" form:"postId"`
}

func (api *H5AdminApi) GetH5CollectionList(c *gin.Context) {
	var req h5CollectionSearch
	if err := c.ShouldBindQuery(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	list, total, err := h5AdminService.GetH5CollectionList(req.Page, req.PageSize, req.UserID, req.PostID)
	if err != nil {
		global.GVA_LOG.Error("get h5 collection list failed", zap.Error(err))
		response.FailWithMessage(err.Error(), c)
		return
	}
	response.OkWithDetailed(response.PageResult{List: list, Total: total, Page: req.Page, PageSize: req.PageSize}, "success", c)
}

func (api *H5AdminApi) DeleteH5Collection(c *gin.Context) {
	var req request.GetById
	if err := c.ShouldBindJSON(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := h5AdminService.DeleteH5Collection(req.Uint()); err != nil {
		global.GVA_LOG.Error("delete h5 collection failed", zap.Error(err))
		response.FailWithMessage(err.Error(), c)
		return
	}
	response.Ok(c)
}

// ----- Following -----

type h5FollowingSearch struct {
	request.PageInfo
	UserID   *uint `json:"userId" form:"userId"`
	FollowID *uint `json:"followId" form:"followId"`
}

func (api *H5AdminApi) GetH5FollowingList(c *gin.Context) {
	var req h5FollowingSearch
	if err := c.ShouldBindQuery(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	list, total, err := h5AdminService.GetH5FollowingList(req.Page, req.PageSize, req.UserID, req.FollowID)
	if err != nil {
		global.GVA_LOG.Error("get h5 following list failed", zap.Error(err))
		response.FailWithMessage(err.Error(), c)
		return
	}
	response.OkWithDetailed(response.PageResult{List: list, Total: total, Page: req.Page, PageSize: req.PageSize}, "success", c)
}

func (api *H5AdminApi) DeleteH5Following(c *gin.Context) {
	var req request.GetById
	if err := c.ShouldBindJSON(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := h5AdminService.DeleteH5Following(req.Uint()); err != nil {
		global.GVA_LOG.Error("delete h5 following failed", zap.Error(err))
		response.FailWithMessage(err.Error(), c)
		return
	}
	response.Ok(c)
}
