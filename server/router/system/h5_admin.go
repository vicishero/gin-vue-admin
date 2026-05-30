package system

import (
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type H5AdminRouter struct{}

func (r *H5AdminRouter) InitH5AdminRouter(Router *gin.RouterGroup) {
	g := Router.Group("h5Admin").Use(middleware.OperationRecord())
	{
		g.GET("userList", h5AdminApi.GetH5UserList)
		g.GET("user", h5AdminApi.GetH5User)
		g.PUT("user", h5AdminApi.UpdateH5User)
		g.DELETE("user", h5AdminApi.DeleteH5User)

		g.GET("postList", h5AdminApi.GetH5PostList)
		g.GET("post", h5AdminApi.GetH5Post)
		g.PUT("post", h5AdminApi.UpdateH5Post)
		g.DELETE("post", h5AdminApi.DeleteH5Post)

		g.GET("commentList", h5AdminApi.GetH5CommentList)
		g.DELETE("comment", h5AdminApi.DeleteH5Comment)

		g.GET("tagList", h5AdminApi.GetH5TagList)
		g.PUT("tag", h5AdminApi.UpdateH5Tag)
		g.DELETE("tag", h5AdminApi.DeleteH5Tag)

		g.GET("collectionList", h5AdminApi.GetH5CollectionList)
		g.DELETE("collection", h5AdminApi.DeleteH5Collection)

		g.GET("followingList", h5AdminApi.GetH5FollowingList)
		g.DELETE("following", h5AdminApi.DeleteH5Following)
	}
}
