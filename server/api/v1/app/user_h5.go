package app

import (
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
	systemReq "github.com/flipped-aurora/gin-vue-admin/server/model/system/request"
	"github.com/flipped-aurora/gin-vue-admin/server/utils"
	"github.com/gin-gonic/gin"
)

type H5AuthApi struct{}

func (api *H5AuthApi) GetNonce(c *gin.Context) {
	var req systemReq.WalletNonceReq
	if err := c.ShouldBindQuery(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	nonce, expiresAt, err := walletAuthService.GenerateNonce(req.WalletAddress)
	if err != nil {
		response.FailWithMessage("generate nonce failed: "+err.Error(), c)
		return
	}
	response.OkWithDetailed(map[string]interface{}{
		"nonce":     nonce,
		"expiresAt": expiresAt.Unix(),
	}, "success", c)
}

func (api *H5AuthApi) Login(c *gin.Context) {
	var req systemReq.WalletLoginReq
	if err := c.ShouldBindJSON(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	user, token, expiresAt, err := walletAuthService.VerifyAndLogin(req.WalletAddress, req.Signature)
	if err != nil {
		response.FailWithMessage("login failed: "+err.Error(), c)
		return
	}
	response.OkWithDetailed(map[string]interface{}{
		"user":      user,
		"token":     token,
		"expiresAt": expiresAt,
	}, "login success", c)
}

type H5UserApi struct{}

func (api *H5UserApi) GetProfile(c *gin.Context) {
	uid := utils.GetUserID(c)
	user, err := userH5Service.FindByID(uid)
	if err != nil {
		response.FailWithMessage("user not found", c)
		return
	}
	response.OkWithData(user, c)
}

func (api *H5UserApi) UpdateProfile(c *gin.Context) {
	var req systemReq.UpdateH5ProfileReq
	if err := c.ShouldBindJSON(&req); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	uid := utils.GetUserID(c)
	if err := userH5Service.UpdateProfile(uid, req.Nickname, req.Avatar, req.Bio); err != nil {
		response.FailWithMessage("update failed: "+err.Error(), c)
		return
	}
	user, _ := userH5Service.FindByID(uid)
	response.OkWithData(user, c)
}

func (api *H5UserApi) GetUserProfile(c *gin.Context) {
	id, err := parseUintParam(c, "id")
	if err != nil {
		response.FailWithMessage("invalid user id", c)
		return
	}
	user, err := userH5Service.FindByID(uint(id))
	if err != nil {
		response.FailWithMessage("user not found", c)
		return
	}
	response.OkWithData(user, c)
}
