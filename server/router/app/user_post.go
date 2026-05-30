package app

import (
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type H5PostRouter struct{}

func (r *H5PostRouter) InitH5PostRouter(Router *gin.RouterGroup) {
	postGroup := Router.Group("app/post")
	postGroup.GET("feed", h5Api.GetFeed) // public: no auth required

	postGroup.Use(middleware.H5Auth())
	{
		postGroup.POST("", h5Api.CreatePost)
		postGroup.GET(":id", h5Api.GetPost)
		postGroup.DELETE(":id", h5Api.DeletePost)
	}
}
