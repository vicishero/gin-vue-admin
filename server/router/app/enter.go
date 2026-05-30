package app

import api "github.com/flipped-aurora/gin-vue-admin/server/api/v1"

type RouterGroup struct {
	H5Router
	H5PostRouter
	H5CommentRouter
	H5SocialRouter
}

var h5Api = api.ApiGroupApp.AppApiGroup
