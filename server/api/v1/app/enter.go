package app

import (
	"github.com/flipped-aurora/gin-vue-admin/server/service"
)

type ApiGroup struct {
	H5AuthApi
	H5UserApi
	H5PostApi
	H5CommentApi
	H5SocialApi
}

var (
	walletAuthService = service.ServiceGroupApp.AppServiceGroup.WalletAuthService
	userH5Service     = service.ServiceGroupApp.AppServiceGroup.UserH5Service
	userPostService   = service.ServiceGroupApp.AppServiceGroup.UserPostService
	commentService    = service.ServiceGroupApp.AppServiceGroup.UserCommentService
	followingService  = service.ServiceGroupApp.AppServiceGroup.UserFollowingService
	socialService     = service.ServiceGroupApp.AppServiceGroup.UserSocialService
)
