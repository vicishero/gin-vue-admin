package app

import (
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type H5CommentRouter struct{}

func (r *H5CommentRouter) InitH5CommentRouter(Router *gin.RouterGroup) {
	g := Router.Group("app")
	g.Use(middleware.H5Auth())
	{
		g.POST("comment", h5Api.CreateComment)
		g.GET("comment/list/:pid", h5Api.GetCommentList)
		g.DELETE("comment/:id", h5Api.DeleteComment)
		g.POST("comment/reply", h5Api.CreateReply)
		g.GET("comment/replies/:cid", h5Api.GetReplies)
		g.POST("post/like", h5Api.ToggleLike)
	}
}
