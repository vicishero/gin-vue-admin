package app

import (
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type H5SocialRouter struct{}

func (r *H5SocialRouter) InitH5SocialRouter(Router *gin.RouterGroup) {
	g := Router.Group("app")
	g.Use(middleware.H5Auth())
	{
		g.POST("user/follow", h5Api.Follow)
		g.DELETE("user/unfollow", h5Api.Unfollow)
		g.GET("user/followings", h5Api.GetFollowings)
		g.GET("user/followers", h5Api.GetFollowers)
		g.POST("post/collect", h5Api.ToggleCollect)
		g.GET("post/collected", h5Api.GetCollected)
		g.GET("post/liked", h5Api.GetLiked)
		g.GET("tag/list", h5Api.GetTags)
		g.GET("notification/list", h5Api.GetMessages)
		g.PUT("notification/read", h5Api.MarkRead)
		g.GET("notification/unread-count", h5Api.UnreadCount)
		g.POST("upload/image", h5Api.UploadImage)
	}
}
