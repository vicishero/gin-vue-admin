package app

import (
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type H5Router struct{}

func (r *H5Router) InitH5Router(Router *gin.RouterGroup) {
	h5Group := Router.Group("app")

	authGroup := h5Group.Group("auth")
	{
		authGroup.GET("nonce", h5Api.GetNonce)
		authGroup.POST("login", h5Api.Login)
	}

	apiGroup := h5Group.Group("")
	apiGroup.Use(middleware.H5Auth())
	{
		apiGroup.GET("user/profile", h5Api.GetProfile)
		apiGroup.PUT("user/profile", h5Api.UpdateProfile)
		apiGroup.GET("user/profile/:id", h5Api.GetUserProfile)
	}
}
