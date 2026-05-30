package initialize

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/system"
	"go.uber.org/zap"
)

func seedH5AdminMenu() {
	db := global.GVA_DB
	if db == nil {
		return
	}

	// check if already seeded
	var parent system.SysBaseMenu
	if err := db.Where("name = ? AND parent_id = ?", "opsManagement", 0).First(&parent).Error; err == nil {
		return
	}

	parent = system.SysBaseMenu{
		MenuLevel: 0,
		ParentId:  0,
		Path:      "ops",
		Name:      "opsManagement",
		Hidden:    false,
		Component: "view/routerHolder.vue",
		Sort:      20,
		Meta: system.Meta{
			Title: "运营管理",
			Icon:  "data-analysis",
		},
	}
	if err := db.Create(&parent).Error; err != nil {
		global.GVA_LOG.Error("seed h5 admin parent menu failed", zap.Error(err))
		return
	}

	children := []struct {
		Path      string
		Name      string
		Component string
		Title     string
		Icon      string
	}{
		{"/ops/users", "h5Users", "view/ops/h5Users/h5Users.vue", "用户管理", "user"},
		{"/ops/posts", "h5Posts", "view/ops/h5Posts/h5Posts.vue", "贴文管理", "post"},
		{"/ops/comments", "h5Comments", "view/ops/h5Comments/h5Comments.vue", "评论管理", "chat"},
		{"/ops/tags", "h5Tags", "view/ops/h5Tags/h5Tags.vue", "话题管理", "collection-tag"},
		{"/ops/collections", "h5Collections", "view/ops/h5Collections/h5Collections.vue", "收藏管理", "star"},
		{"/ops/followings", "h5Followings", "view/ops/h5Followings/h5Followings.vue", "用户关系", "connection"},
	}

	for i, child := range children {
		menu := system.SysBaseMenu{
			MenuLevel: 1,
			ParentId:  parent.ID,
			Path:      child.Path,
			Name:      child.Name,
			Hidden:    false,
			Component: child.Component,
			Sort:      i,
			Meta: system.Meta{
				Title:   child.Title,
				Icon:    child.Icon,
				CloseTab: false,
			},
		}
		if err := db.Where("name = ? AND parent_id = ?", child.Name, parent.ID).FirstOrCreate(&menu).Error; err != nil {
			global.GVA_LOG.Error("seed h5 admin child menu failed", zap.Error(err))
		}
	}

	// assign to the "admin" role (authorityId=888) via raw insert
	var childMenus []system.SysBaseMenu
	db.Where("parent_id = ?", parent.ID).Find(&childMenus)
	for _, m := range append([]system.SysBaseMenu{parent}, childMenus...) {
		db.Exec("INSERT IGNORE INTO sys_authority_menus (sys_base_menu_id, sys_authority_authority_id) VALUES (?, 888)", m.ID)
	}

	// seed Casbin policies for the H5 admin API endpoints
	rules := []struct{ Path, Method string }{
		{"/h5Admin/userList", "GET"},
		{"/h5Admin/user", "GET"},
		{"/h5Admin/user", "PUT"},
		{"/h5Admin/user", "DELETE"},
		{"/h5Admin/postList", "GET"},
		{"/h5Admin/post", "GET"},
		{"/h5Admin/post", "PUT"},
		{"/h5Admin/post", "DELETE"},
		{"/h5Admin/commentList", "GET"},
		{"/h5Admin/comment", "DELETE"},
		{"/h5Admin/tagList", "GET"},
		{"/h5Admin/tag", "PUT"},
		{"/h5Admin/tag", "DELETE"},
		{"/h5Admin/collectionList", "GET"},
		{"/h5Admin/collection", "DELETE"},
		{"/h5Admin/followingList", "GET"},
		{"/h5Admin/following", "DELETE"},
	}
	for _, r := range rules {
		db.Exec("INSERT IGNORE INTO casbin_rule (ptype, v0, v1, v2) VALUES ('p', '888', ?, ?)", r.Path, r.Method)
	}

	global.GVA_LOG.Info("h5 admin menu seed completed")
}

// ensure tables exist before seeding
func seedH5MenusIfReady() {
	if global.GVA_DB == nil {
		return
	}
	if global.GVA_DB.Migrator().HasTable(&system.SysBaseMenu{}) {
		seedH5AdminMenu()
	}
}
