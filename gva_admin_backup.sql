mysqldump: [Warning] Using a password on the command line interface can be insecure.
-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: gva_admin
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `casbin_rule`
--

DROP TABLE IF EXISTS `casbin_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casbin_rule` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ptype` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v0` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v1` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v2` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v3` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v4` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v5` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_casbin_rule` (`ptype`,`v0`,`v1`,`v2`,`v3`,`v4`,`v5`)
) ENGINE=InnoDB AUTO_INCREMENT=383 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casbin_rule`
--

LOCK TABLES `casbin_rule` WRITE;
/*!40000 ALTER TABLE `casbin_rule` DISABLE KEYS */;
INSERT INTO `casbin_rule` VALUES (193,'p','888','/api/createApi','POST','','',''),(196,'p','888','/api/deleteApi','POST','','',''),(199,'p','888','/api/deleteApisByIds','DELETE','','',''),(202,'p','888','/api/enterSyncApi','POST','','',''),(198,'p','888','/api/getAllApis','POST','','',''),(195,'p','888','/api/getApiById','POST','','',''),(201,'p','888','/api/getApiGroups','GET','','',''),(194,'p','888','/api/getApiList','POST','','',''),(204,'p','888','/api/getApiRoles','GET','','',''),(203,'p','888','/api/ignoreApi','POST','','',''),(205,'p','888','/api/setApiRoles','POST','','',''),(200,'p','888','/api/syncApi','GET','','',''),(197,'p','888','/api/updateApi','POST','','',''),(367,'p','888','/attachmentCategory/addCategory','POST','','',''),(368,'p','888','/attachmentCategory/deleteCategory','POST','','',''),(366,'p','888','/attachmentCategory/getCategoryList','GET','','',''),(206,'p','888','/authority/copyAuthority','POST','','',''),(208,'p','888','/authority/createAuthority','POST','','',''),(209,'p','888','/authority/deleteAuthority','POST','','',''),(210,'p','888','/authority/getAuthorityList','POST','','',''),(212,'p','888','/authority/getUsersByAuthority','GET','','',''),(211,'p','888','/authority/setDataAuthority','POST','','',''),(213,'p','888','/authority/setRoleUsers','POST','','',''),(207,'p','888','/authority/updateAuthority','PUT','','',''),(335,'p','888','/authorityBtn/canRemoveAuthorityBtn','POST','','',''),(334,'p','888','/authorityBtn/getAuthorityBtn','POST','','',''),(333,'p','888','/authorityBtn/setAuthorityBtn','POST','','',''),(293,'p','888','/autoCode/addFunc','POST','','',''),(284,'p','888','/autoCode/createPackage','POST','','',''),(288,'p','888','/autoCode/createPlug','POST','','',''),(281,'p','888','/autoCode/createTemp','POST','','',''),(304,'p','888','/autoCode/deleteAIWorkflowSession','POST','','',''),(287,'p','888','/autoCode/delPackage','POST','','',''),(282,'p','888','/autoCode/delSysHistory','POST','','',''),(305,'p','888','/autoCode/dumpAIWorkflowMarkdown','POST','','',''),(303,'p','888','/autoCode/getAIWorkflowSessionDetail','POST','','',''),(302,'p','888','/autoCode/getAIWorkflowSessionList','POST','','',''),(279,'p','888','/autoCode/getColumn','GET','','',''),(275,'p','888','/autoCode/getDB','GET','','',''),(276,'p','888','/autoCode/getMeta','POST','','',''),(286,'p','888','/autoCode/getPackage','POST','','',''),(292,'p','888','/autoCode/getPluginList','GET','','',''),(283,'p','888','/autoCode/getSysHistory','POST','','',''),(278,'p','888','/autoCode/getTables','GET','','',''),(285,'p','888','/autoCode/getTemplates','GET','','',''),(289,'p','888','/autoCode/installPlugin','POST','','',''),(294,'p','888','/autoCode/mcp','POST','','',''),(300,'p','888','/autoCode/mcpList','POST','','',''),(298,'p','888','/autoCode/mcpRoutes','POST','','',''),(296,'p','888','/autoCode/mcpStart','POST','','',''),(295,'p','888','/autoCode/mcpStatus','POST','','',''),(297,'p','888','/autoCode/mcpStop','POST','','',''),(299,'p','888','/autoCode/mcpTest','POST','','',''),(277,'p','888','/autoCode/preview','POST','','',''),(290,'p','888','/autoCode/pubPlug','POST','','',''),(291,'p','888','/autoCode/removePlugin','POST','','',''),(280,'p','888','/autoCode/rollback','POST','','',''),(301,'p','888','/autoCode/saveAIWorkflowSession','POST','','',''),(245,'p','888','/casbin/getPolicyPathByAuthorityId','POST','','',''),(244,'p','888','/casbin/updateCasbin','POST','','',''),(273,'p','888','/customer/customer','DELETE','','',''),(270,'p','888','/customer/customer','GET','','',''),(272,'p','888','/customer/customer','POST','','',''),(271,'p','888','/customer/customer','PUT','','',''),(274,'p','888','/customer/customerList','GET','','',''),(328,'p','888','/email/emailTest','POST','','',''),(329,'p','888','/email/sendEmail','POST','','',''),(237,'p','888','/fileUploadAndDownload/breakpointContinue','POST','','',''),(236,'p','888','/fileUploadAndDownload/breakpointContinueFinish','POST','','',''),(240,'p','888','/fileUploadAndDownload/deleteFile','POST','','',''),(241,'p','888','/fileUploadAndDownload/editFileName','POST','','',''),(235,'p','888','/fileUploadAndDownload/findFile','GET','','',''),(242,'p','888','/fileUploadAndDownload/getFileList','POST','','',''),(243,'p','888','/fileUploadAndDownload/importURL','POST','','',''),(238,'p','888','/fileUploadAndDownload/removeChunk','POST','','',''),(239,'p','888','/fileUploadAndDownload/upload','POST','','',''),(353,'p','888','/info/createInfo','POST','','',''),(354,'p','888','/info/deleteInfo','DELETE','','',''),(355,'p','888','/info/deleteInfoByIds','DELETE','','',''),(357,'p','888','/info/findInfo','GET','','',''),(358,'p','888','/info/getInfoList','GET','','',''),(356,'p','888','/info/updateInfo','PUT','','',''),(246,'p','888','/jwt/jsonInBlacklist','POST','','',''),(216,'p','888','/menu/addBaseMenu','POST','','',''),(218,'p','888','/menu/addMenuAuthority','POST','','',''),(222,'p','888','/menu/deleteBaseMenu','POST','','',''),(224,'p','888','/menu/getBaseMenuById','POST','','',''),(217,'p','888','/menu/getBaseMenuTree','POST','','',''),(214,'p','888','/menu/getMenu','POST','','',''),(219,'p','888','/menu/getMenuAuthority','POST','','',''),(215,'p','888','/menu/getMenuList','POST','','',''),(220,'p','888','/menu/getMenuRoles','GET','','',''),(221,'p','888','/menu/setMenuRoles','POST','','',''),(223,'p','888','/menu/updateBaseMenu','POST','','',''),(331,'p','888','/simpleUploader/checkFileMd5','GET','','',''),(332,'p','888','/simpleUploader/mergeFileMd5','GET','','',''),(330,'p','888','/simpleUploader/upload','POST','','',''),(261,'p','888','/skills/createReference','POST','','',''),(258,'p','888','/skills/createResource','POST','','',''),(255,'p','888','/skills/createScript','POST','','',''),(264,'p','888','/skills/createTemplate','POST','','',''),(254,'p','888','/skills/deleteSkill','POST','','',''),(267,'p','888','/skills/getGlobalConstraint','POST','','',''),(262,'p','888','/skills/getReference','POST','','',''),(259,'p','888','/skills/getResource','POST','','',''),(256,'p','888','/skills/getScript','POST','','',''),(252,'p','888','/skills/getSkillDetail','POST','','',''),(251,'p','888','/skills/getSkillList','POST','','',''),(265,'p','888','/skills/getTemplate','POST','','',''),(250,'p','888','/skills/getTools','GET','','',''),(269,'p','888','/skills/packageSkill','POST','','',''),(268,'p','888','/skills/saveGlobalConstraint','POST','','',''),(263,'p','888','/skills/saveReference','POST','','',''),(260,'p','888','/skills/saveResource','POST','','',''),(257,'p','888','/skills/saveScript','POST','','',''),(253,'p','888','/skills/saveSkill','POST','','',''),(266,'p','888','/skills/saveTemplate','POST','','',''),(380,'p','888','/sysApiToken/createApiToken','POST','','',''),(382,'p','888','/sysApiToken/deleteApiToken','POST','','',''),(381,'p','888','/sysApiToken/getApiTokenList','POST','','',''),(318,'p','888','/sysDictionary/createSysDictionary','POST','','',''),(319,'p','888','/sysDictionary/deleteSysDictionary','DELETE','','',''),(321,'p','888','/sysDictionary/exportSysDictionary','GET','','',''),(315,'p','888','/sysDictionary/findSysDictionary','GET','','',''),(317,'p','888','/sysDictionary/getSysDictionaryList','GET','','',''),(320,'p','888','/sysDictionary/importSysDictionary','POST','','',''),(316,'p','888','/sysDictionary/updateSysDictionary','PUT','','',''),(308,'p','888','/sysDictionaryDetail/createSysDictionaryDetail','POST','','',''),(310,'p','888','/sysDictionaryDetail/deleteSysDictionaryDetail','DELETE','','',''),(306,'p','888','/sysDictionaryDetail/findSysDictionaryDetail','GET','','',''),(313,'p','888','/sysDictionaryDetail/getDictionaryDetailsByParent','GET','','',''),(314,'p','888','/sysDictionaryDetail/getDictionaryPath','GET','','',''),(311,'p','888','/sysDictionaryDetail/getDictionaryTreeList','GET','','',''),(312,'p','888','/sysDictionaryDetail/getDictionaryTreeListByType','GET','','',''),(309,'p','888','/sysDictionaryDetail/getSysDictionaryDetailList','GET','','',''),(307,'p','888','/sysDictionaryDetail/updateSysDictionaryDetail','PUT','','',''),(346,'p','888','/sysError/createSysError','POST','','',''),(347,'p','888','/sysError/deleteSysError','DELETE','','',''),(348,'p','888','/sysError/deleteSysErrorByIds','DELETE','','',''),(350,'p','888','/sysError/findSysError','GET','','',''),(351,'p','888','/sysError/getSysErrorList','GET','','',''),(352,'p','888','/sysError/getSysErrorSolution','GET','','',''),(349,'p','888','/sysError/updateSysError','PUT','','',''),(336,'p','888','/sysExportTemplate/createSysExportTemplate','POST','','',''),(337,'p','888','/sysExportTemplate/deleteSysExportTemplate','DELETE','','',''),(338,'p','888','/sysExportTemplate/deleteSysExportTemplateByIds','DELETE','','',''),(342,'p','888','/sysExportTemplate/exportExcel','GET','','',''),(343,'p','888','/sysExportTemplate/exportTemplate','GET','','',''),(340,'p','888','/sysExportTemplate/findSysExportTemplate','GET','','',''),(341,'p','888','/sysExportTemplate/getSysExportTemplateList','GET','','',''),(345,'p','888','/sysExportTemplate/importExcel','POST','','',''),(344,'p','888','/sysExportTemplate/previewSQL','GET','','',''),(339,'p','888','/sysExportTemplate/updateSysExportTemplate','PUT','','',''),(376,'p','888','/sysLoginLog/deleteLoginLog','DELETE','','',''),(377,'p','888','/sysLoginLog/deleteLoginLogByIds','DELETE','','',''),(378,'p','888','/sysLoginLog/findLoginLog','GET','','',''),(379,'p','888','/sysLoginLog/getLoginLogList','GET','','',''),(324,'p','888','/sysOperationRecord/createSysOperationRecord','POST','','',''),(326,'p','888','/sysOperationRecord/deleteSysOperationRecord','DELETE','','',''),(327,'p','888','/sysOperationRecord/deleteSysOperationRecordByIds','DELETE','','',''),(322,'p','888','/sysOperationRecord/findSysOperationRecord','GET','','',''),(325,'p','888','/sysOperationRecord/getSysOperationRecordList','GET','','',''),(323,'p','888','/sysOperationRecord/updateSysOperationRecord','PUT','','',''),(359,'p','888','/sysParams/createSysParams','POST','','',''),(360,'p','888','/sysParams/deleteSysParams','DELETE','','',''),(361,'p','888','/sysParams/deleteSysParamsByIds','DELETE','','',''),(363,'p','888','/sysParams/findSysParams','GET','','',''),(365,'p','888','/sysParams/getSysParam','GET','','',''),(364,'p','888','/sysParams/getSysParamsList','GET','','',''),(362,'p','888','/sysParams/updateSysParams','PUT','','',''),(249,'p','888','/system/getServerInfo','POST','','',''),(247,'p','888','/system/getSystemConfig','POST','','',''),(248,'p','888','/system/setSystemConfig','POST','','',''),(374,'p','888','/sysVersion/deleteSysVersion','DELETE','','',''),(375,'p','888','/sysVersion/deleteSysVersionByIds','DELETE','','',''),(371,'p','888','/sysVersion/downloadVersionJson','GET','','',''),(372,'p','888','/sysVersion/exportVersion','POST','','',''),(369,'p','888','/sysVersion/findSysVersion','GET','','',''),(370,'p','888','/sysVersion/getSysVersionList','GET','','',''),(373,'p','888','/sysVersion/importVersion','POST','','',''),(192,'p','888','/user/admin_register','POST','','',''),(230,'p','888','/user/changePassword','POST','','',''),(229,'p','888','/user/deleteUser','DELETE','','',''),(225,'p','888','/user/getUserInfo','GET','','',''),(228,'p','888','/user/getUserList','POST','','',''),(233,'p','888','/user/resetPassword','POST','','',''),(227,'p','888','/user/setSelfInfo','PUT','','',''),(234,'p','888','/user/setSelfSetting','PUT','','',''),(232,'p','888','/user/setUserAuthorities','POST','','',''),(231,'p','888','/user/setUserAuthority','POST','','',''),(226,'p','888','/user/setUserInfo','PUT','','','');
/*!40000 ALTER TABLE `casbin_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exa_attachment_category`
--

DROP TABLE IF EXISTS `exa_attachment_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exa_attachment_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分类名称',
  `pid` bigint DEFAULT '0' COMMENT '父节点ID',
  PRIMARY KEY (`id`),
  KEY `idx_exa_attachment_category_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exa_attachment_category`
--

LOCK TABLES `exa_attachment_category` WRITE;
/*!40000 ALTER TABLE `exa_attachment_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `exa_attachment_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exa_customers`
--

DROP TABLE IF EXISTS `exa_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exa_customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户名',
  `customer_phone_data` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户手机号',
  `sys_user_id` bigint unsigned DEFAULT NULL COMMENT '管理ID',
  `sys_user_authority_id` bigint unsigned DEFAULT NULL COMMENT '管理角色ID',
  PRIMARY KEY (`id`),
  KEY `idx_exa_customers_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exa_customers`
--

LOCK TABLES `exa_customers` WRITE;
/*!40000 ALTER TABLE `exa_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `exa_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exa_file_chunks`
--

DROP TABLE IF EXISTS `exa_file_chunks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exa_file_chunks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `exa_file_id` bigint unsigned DEFAULT NULL,
  `file_chunk_number` bigint DEFAULT NULL,
  `file_chunk_path` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_exa_file_chunks_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exa_file_chunks`
--

LOCK TABLES `exa_file_chunks` WRITE;
/*!40000 ALTER TABLE `exa_file_chunks` DISABLE KEYS */;
/*!40000 ALTER TABLE `exa_file_chunks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exa_file_upload_and_downloads`
--

DROP TABLE IF EXISTS `exa_file_upload_and_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exa_file_upload_and_downloads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件名',
  `class_id` bigint DEFAULT '0' COMMENT '分类id',
  `url` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件地址',
  `tag` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件标签',
  `key` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '编号',
  PRIMARY KEY (`id`),
  KEY `idx_exa_file_upload_and_downloads_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exa_file_upload_and_downloads`
--

LOCK TABLES `exa_file_upload_and_downloads` WRITE;
/*!40000 ALTER TABLE `exa_file_upload_and_downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `exa_file_upload_and_downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exa_files`
--

DROP TABLE IF EXISTS `exa_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exa_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file_md5` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file_path` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `chunk_total` bigint DEFAULT NULL,
  `is_finish` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_exa_files_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exa_files`
--

LOCK TABLES `exa_files` WRITE;
/*!40000 ALTER TABLE `exa_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `exa_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gva_announcements_info`
--

DROP TABLE IF EXISTS `gva_announcements_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gva_announcements_info` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '公告标题',
  `content` text COLLATE utf8mb4_general_ci COMMENT '公告内容',
  `user_id` bigint DEFAULT NULL COMMENT '发布者',
  `attachments` json DEFAULT NULL COMMENT '相关附件',
  PRIMARY KEY (`id`),
  KEY `idx_gva_announcements_info_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gva_announcements_info`
--

LOCK TABLES `gva_announcements_info` WRITE;
/*!40000 ALTER TABLE `gva_announcements_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `gva_announcements_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jwt_blacklists`
--

DROP TABLE IF EXISTS `jwt_blacklists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jwt_blacklists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `jwt` text COLLATE utf8mb4_general_ci COMMENT 'jwt',
  PRIMARY KEY (`id`),
  KEY `idx_jwt_blacklists_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jwt_blacklists`
--

LOCK TABLES `jwt_blacklists` WRITE;
/*!40000 ALTER TABLE `jwt_blacklists` DISABLE KEYS */;
/*!40000 ALTER TABLE `jwt_blacklists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_ai_workflow_sessions`
--

DROP TABLE IF EXISTS `sys_ai_workflow_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_ai_workflow_sessions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL COMMENT '用户ID',
  `tab` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '会话类型',
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '会话标题',
  `summary` text COLLATE utf8mb4_general_ci COMMENT '摘要',
  `conversation_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Dify会话ID',
  `message_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Dify消息ID',
  `current_node_id` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '当前选中节点ID',
  `settings` json DEFAULT NULL COMMENT '页面设置',
  `form_data` json DEFAULT NULL COMMENT '表单数据',
  `result_data` json DEFAULT NULL COMMENT '当前展示结果',
  `messages` json DEFAULT NULL COMMENT '会话消息',
  PRIMARY KEY (`id`),
  KEY `idx_sys_ai_workflow_sessions_deleted_at` (`deleted_at`),
  KEY `idx_sys_ai_workflow_sessions_user_id` (`user_id`),
  KEY `idx_sys_ai_workflow_sessions_tab` (`tab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_ai_workflow_sessions`
--

LOCK TABLES `sys_ai_workflow_sessions` WRITE;
/*!40000 ALTER TABLE `sys_ai_workflow_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_ai_workflow_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_api_tokens`
--

DROP TABLE IF EXISTS `sys_api_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_api_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL COMMENT '用户ID',
  `authority_id` bigint unsigned DEFAULT NULL COMMENT '角色ID',
  `token` text COLLATE utf8mb4_general_ci COMMENT 'Token',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `expires_at` datetime(3) DEFAULT NULL COMMENT '过期时间',
  `remark` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `idx_sys_api_tokens_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_api_tokens`
--

LOCK TABLES `sys_api_tokens` WRITE;
/*!40000 ALTER TABLE `sys_api_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_api_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_apis`
--

DROP TABLE IF EXISTS `sys_apis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_apis` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'api路径',
  `description` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'api中文描述',
  `api_group` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'api组',
  `method` varchar(191) COLLATE utf8mb4_general_ci DEFAULT 'POST' COMMENT '方法',
  PRIMARY KEY (`id`),
  KEY `idx_sys_apis_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_apis`
--

LOCK TABLES `sys_apis` WRITE;
/*!40000 ALTER TABLE `sys_apis` DISABLE KEYS */;
INSERT INTO `sys_apis` VALUES (1,'2026-05-25 17:32:16.982','2026-05-25 17:32:16.982',NULL,'/info/createInfo','新建公告','公告','POST'),(2,'2026-05-25 17:32:16.983','2026-05-25 17:32:16.983',NULL,'/info/deleteInfo','删除公告','公告','DELETE'),(3,'2026-05-25 17:32:16.983','2026-05-25 17:32:16.983',NULL,'/info/deleteInfoByIds','批量删除公告','公告','DELETE'),(4,'2026-05-25 17:32:16.984','2026-05-25 17:32:16.984',NULL,'/info/updateInfo','更新公告','公告','PUT'),(5,'2026-05-25 17:32:16.984','2026-05-25 17:32:16.984',NULL,'/info/findInfo','根据ID获取公告','公告','GET'),(6,'2026-05-25 17:32:16.985','2026-05-25 17:32:16.985',NULL,'/info/getInfoList','获取公告列表','公告','GET'),(7,'2026-05-25 17:32:17.001','2026-05-25 17:32:17.001',NULL,'/autoCode/getDB','获取数据库列表','代码生成器','GET'),(8,'2026-05-25 17:32:17.002','2026-05-25 17:32:17.002',NULL,'/autoCode/getTables','获取数据表列表','代码生成器','GET'),(9,'2026-05-25 17:32:17.002','2026-05-25 17:32:17.002',NULL,'/autoCode/getColumn','获取字段列表','代码生成器','GET'),(10,'2026-05-25 17:32:17.002','2026-05-25 17:32:17.002',NULL,'/autoCode/preview','预览自动代码','代码生成器','POST'),(11,'2026-05-25 17:32:17.003','2026-05-25 17:32:17.003',NULL,'/autoCode/createTemp','生成自动代码','代码生成器','POST'),(12,'2026-05-25 17:32:17.003','2026-05-25 17:32:17.003',NULL,'/autoCode/mcp','生成 MCP 工具','代码生成器','POST'),(13,'2026-05-25 17:32:17.003','2026-05-25 17:32:17.003',NULL,'/autoCode/mcpStatus','获取 MCP 状态','代码生成器','POST'),(14,'2026-05-25 17:32:17.003','2026-05-25 17:32:17.003',NULL,'/autoCode/mcpStart','启动 MCP','代码生成器','POST'),(15,'2026-05-25 17:32:17.004','2026-05-25 17:32:17.004',NULL,'/autoCode/mcpStop','停止 MCP','代码生成器','POST'),(16,'2026-05-25 17:32:17.004','2026-05-25 17:32:17.004',NULL,'/autoCode/mcpList','获取 MCP 工具列表','代码生成器','POST'),(17,'2026-05-25 17:32:17.004','2026-05-25 17:32:17.004',NULL,'/autoCode/mcpRoutes','获取 MCP 路由','代码生成器','POST'),(18,'2026-05-25 17:32:17.004','2026-05-25 17:32:17.004',NULL,'/autoCode/mcpTest','测试 MCP 调用','代码生成器','POST'),(19,'2026-05-25 17:32:17.004','2026-05-25 17:32:17.004',NULL,'/autoCode/pubPlug','打包插件','代码生成器','POST'),(20,'2026-05-25 17:32:17.005','2026-05-25 17:32:17.005',NULL,'/autoCode/installPlugin','安装插件','代码生成器','POST'),(21,'2026-05-25 17:32:17.005','2026-05-25 17:32:17.005',NULL,'/autoCode/removePlugin','移除插件','代码生成器','POST'),(22,'2026-05-25 17:32:17.005','2026-05-25 17:32:17.005',NULL,'/autoCode/getPluginList','获取插件列表','代码生成器','GET'),(23,'2026-05-25 17:32:17.005','2026-05-25 17:32:17.005',NULL,'/autoCode/saveAIWorkflowSession','保存 AI 工作流会话','代码生成器','POST'),(24,'2026-05-25 17:32:17.005','2026-05-25 17:32:17.005',NULL,'/autoCode/getAIWorkflowSessionList','获取 AI 工作流列表','代码生成器','POST'),(25,'2026-05-25 17:32:17.006','2026-05-25 17:32:17.006',NULL,'/autoCode/getAIWorkflowSessionDetail','获取 AI 工作流详情','代码生成器','POST'),(26,'2026-05-25 17:32:17.006','2026-05-25 17:32:17.006',NULL,'/autoCode/deleteAIWorkflowSession','删除 AI 工作流会话','代码生成器','POST'),(27,'2026-05-25 17:32:17.006','2026-05-25 17:32:17.006',NULL,'/autoCode/dumpAIWorkflowMarkdown','导出 AI 工作流 Markdown','代码生成器','POST'),(28,'2026-05-25 17:32:17.006','2026-05-25 17:32:17.006',NULL,'/autoCode/getPackage','获取自动化包列表','模板配置','POST'),(29,'2026-05-25 17:32:17.006','2026-05-25 17:32:17.006',NULL,'/autoCode/delPackage','删除自动化包','模板配置','POST'),(30,'2026-05-25 17:32:17.007','2026-05-25 17:32:17.007',NULL,'/autoCode/createPackage','创建自动化包','模板配置','POST'),(31,'2026-05-25 17:32:17.007','2026-05-25 17:32:17.007',NULL,'/autoCode/getTemplates','获取模板列表','模板配置','GET'),(32,'2026-05-25 17:32:17.007','2026-05-25 17:32:17.007',NULL,'/autoCode/getMeta','获取自动代码历史元数据','代码生成器历史','POST'),(33,'2026-05-25 17:32:17.007','2026-05-25 17:32:17.007',NULL,'/autoCode/rollback','回滚自动代码历史','代码生成器历史','POST'),(34,'2026-05-25 17:32:17.007','2026-05-25 17:32:17.007',NULL,'/autoCode/delSysHistory','删除自动代码历史','代码生成器历史','POST'),(35,'2026-05-25 17:32:17.008','2026-05-25 17:32:17.008',NULL,'/autoCode/getSysHistory','获取自动代码历史列表','代码生成器历史','POST'),(36,'2026-05-25 17:32:17.008','2026-05-25 17:32:17.008',NULL,'/autoCode/addFunc','追加自动代码方法','代码生成器历史','POST'),(37,'2026-05-25 17:32:17.008','2026-05-25 17:32:17.008',NULL,'/skills/getTools','获取 AI 工具列表','skills','GET'),(38,'2026-05-25 17:32:17.009','2026-05-25 17:32:17.009',NULL,'/skills/getSkillList','获取技能列表','skills','POST'),(39,'2026-05-25 17:32:17.009','2026-05-25 17:32:17.009',NULL,'/skills/getSkillDetail','获取技能详情','skills','POST'),(40,'2026-05-25 17:32:17.009','2026-05-25 17:32:17.009',NULL,'/skills/saveSkill','保存技能','skills','POST'),(41,'2026-05-25 17:32:17.009','2026-05-25 17:32:17.009',NULL,'/skills/deleteSkill','删除技能','skills','POST'),(42,'2026-05-25 17:32:17.010','2026-05-25 17:32:17.010',NULL,'/skills/createScript','创建脚本','skills','POST'),(43,'2026-05-25 17:32:17.010','2026-05-25 17:32:17.010',NULL,'/skills/getScript','获取脚本','skills','POST'),(44,'2026-05-25 17:32:17.010','2026-05-25 17:32:17.010',NULL,'/skills/saveScript','保存脚本','skills','POST'),(45,'2026-05-25 17:32:17.010','2026-05-25 17:32:17.010',NULL,'/skills/createResource','创建资源','skills','POST'),(46,'2026-05-25 17:32:17.010','2026-05-25 17:32:17.010',NULL,'/skills/getResource','获取资源','skills','POST'),(47,'2026-05-25 17:32:17.011','2026-05-25 17:32:17.011',NULL,'/skills/saveResource','保存资源','skills','POST'),(48,'2026-05-25 17:32:17.011','2026-05-25 17:32:17.011',NULL,'/skills/createReference','创建参考资料','skills','POST'),(49,'2026-05-25 17:32:17.011','2026-05-25 17:32:17.011',NULL,'/skills/getReference','获取参考资料','skills','POST'),(50,'2026-05-25 17:32:17.011','2026-05-25 17:32:17.011',NULL,'/skills/saveReference','保存参考资料','skills','POST'),(51,'2026-05-25 17:32:17.012','2026-05-25 17:32:17.012',NULL,'/skills/createTemplate','创建模板','skills','POST'),(52,'2026-05-25 17:32:17.013','2026-05-25 17:32:17.013',NULL,'/skills/getTemplate','获取模板','skills','POST'),(53,'2026-05-25 17:32:17.013','2026-05-25 17:32:17.013',NULL,'/skills/saveTemplate','保存模板','skills','POST'),(54,'2026-05-25 17:32:17.014','2026-05-25 17:32:17.014',NULL,'/skills/getGlobalConstraint','获取全局约束','skills','POST'),(55,'2026-05-25 17:32:17.014','2026-05-25 17:32:17.014',NULL,'/skills/saveGlobalConstraint','保存全局约束','skills','POST'),(56,'2026-05-25 17:32:17.015','2026-05-25 17:32:17.015',NULL,'/skills/packageSkill','打包技能','skills','POST'),(57,'2026-05-25 17:32:17.015','2026-05-25 17:32:17.015',NULL,'/skills/downloadOnlineSkill','下载在线技能','skills','POST');
/*!40000 ALTER TABLE `sys_apis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_authorities`
--

DROP TABLE IF EXISTS `sys_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_authorities` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `authority_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `authority_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色名',
  `parent_id` bigint unsigned DEFAULT NULL COMMENT '父角色ID',
  `default_router` varchar(191) COLLATE utf8mb4_general_ci DEFAULT 'dashboard' COMMENT '默认菜单',
  PRIMARY KEY (`authority_id`),
  UNIQUE KEY `uni_sys_authorities_authority_id` (`authority_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9529 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_authorities`
--

LOCK TABLES `sys_authorities` WRITE;
/*!40000 ALTER TABLE `sys_authorities` DISABLE KEYS */;
INSERT INTO `sys_authorities` VALUES ('2026-05-25 17:53:02.094','2026-05-25 17:53:02.108',NULL,888,'普通用户',0,'dashboard'),('2026-05-25 17:53:02.094','2026-05-25 17:53:02.112',NULL,8881,'普通用户子角色',888,'dashboard'),('2026-05-25 17:53:02.094','2026-05-25 17:53:02.110',NULL,9528,'测试角色',0,'dashboard');
/*!40000 ALTER TABLE `sys_authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_authority_btns`
--

DROP TABLE IF EXISTS `sys_authority_btns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_authority_btns` (
  `authority_id` bigint unsigned DEFAULT NULL COMMENT '角色ID',
  `sys_menu_id` bigint unsigned DEFAULT NULL COMMENT '菜单ID',
  `sys_base_menu_btn_id` bigint unsigned DEFAULT NULL COMMENT '菜单按钮ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_authority_btns`
--

LOCK TABLES `sys_authority_btns` WRITE;
/*!40000 ALTER TABLE `sys_authority_btns` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_authority_btns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_authority_menus`
--

DROP TABLE IF EXISTS `sys_authority_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_authority_menus` (
  `sys_base_menu_id` bigint unsigned NOT NULL,
  `sys_authority_authority_id` bigint unsigned NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`sys_base_menu_id`,`sys_authority_authority_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_authority_menus`
--

LOCK TABLES `sys_authority_menus` WRITE;
/*!40000 ALTER TABLE `sys_authority_menus` DISABLE KEYS */;
INSERT INTO `sys_authority_menus` VALUES (16,888),(16,8881),(16,9528),(18,888),(18,8881),(19,888),(19,8881),(19,9528),(20,888),(20,8881),(23,888),(23,8881),(23,9528),(25,888),(26,888),(27,888),(28,888),(29,888),(30,888),(31,888),(32,888),(33,888),(34,888),(35,888),(36,888),(37,888),(37,8881),(38,888),(38,8881),(39,888),(39,8881);
/*!40000 ALTER TABLE `sys_authority_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_auto_code_histories`
--

DROP TABLE IF EXISTS `sys_auto_code_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_auto_code_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表名',
  `package` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '模块名或插件名',
  `request` text COLLATE utf8mb4_general_ci COMMENT '前端传入的结构化信息',
  `struct_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '结构体名称',
  `abbreviation` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '结构体简称',
  `business_db` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '业务库',
  `description` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '结构体中文名',
  `templates` text COLLATE utf8mb4_general_ci COMMENT '模板信息',
  `injections` text COLLATE utf8mb4_general_ci COMMENT '注入信息',
  `flag` bigint DEFAULT NULL COMMENT '[0:创建,1:回滚]',
  `api_ids` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联API ID',
  `menu_id` bigint unsigned DEFAULT NULL COMMENT '菜单ID',
  `export_template_id` bigint unsigned DEFAULT NULL COMMENT '导出模板ID',
  `package_id` bigint unsigned DEFAULT NULL COMMENT '包ID',
  PRIMARY KEY (`id`),
  KEY `idx_sys_auto_code_histories_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_auto_code_histories`
--

LOCK TABLES `sys_auto_code_histories` WRITE;
/*!40000 ALTER TABLE `sys_auto_code_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_auto_code_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_auto_code_packages`
--

DROP TABLE IF EXISTS `sys_auto_code_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_auto_code_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `desc` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `label` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '显示名称',
  `template` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '模板',
  `package_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '包名',
  `module` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sys_auto_code_packages_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_auto_code_packages`
--

LOCK TABLES `sys_auto_code_packages` WRITE;
/*!40000 ALTER TABLE `sys_auto_code_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_auto_code_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_base_menu_btns`
--

DROP TABLE IF EXISTS `sys_base_menu_btns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_base_menu_btns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '按钮关键key',
  `desc` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sys_base_menu_id` bigint unsigned DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`),
  KEY `idx_sys_base_menu_btns_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_base_menu_btns`
--

LOCK TABLES `sys_base_menu_btns` WRITE;
/*!40000 ALTER TABLE `sys_base_menu_btns` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_base_menu_btns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_base_menu_parameters`
--

DROP TABLE IF EXISTS `sys_base_menu_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_base_menu_parameters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `sys_base_menu_id` bigint unsigned DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址栏携带参数为params还是query',
  `key` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址栏携带参数的key',
  `value` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址栏携带参数的值',
  PRIMARY KEY (`id`),
  KEY `idx_sys_base_menu_parameters_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_base_menu_parameters`
--

LOCK TABLES `sys_base_menu_parameters` WRITE;
/*!40000 ALTER TABLE `sys_base_menu_parameters` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_base_menu_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_base_menus`
--

DROP TABLE IF EXISTS `sys_base_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_base_menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `menu_level` bigint unsigned DEFAULT NULL,
  `parent_id` bigint unsigned DEFAULT NULL COMMENT '父菜单ID',
  `path` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由path',
  `name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由name',
  `hidden` tinyint(1) DEFAULT NULL COMMENT '是否在列表隐藏',
  `component` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '对应前端文件路径',
  `sort` bigint DEFAULT NULL COMMENT '排序标记',
  `active_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '高亮菜单',
  `keep_alive` tinyint(1) DEFAULT NULL COMMENT '是否缓存',
  `default_menu` tinyint(1) DEFAULT NULL COMMENT '是否是基础路由（开发中）',
  `title` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单名',
  `icon` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单图标',
  `close_tab` tinyint(1) DEFAULT NULL COMMENT '自动关闭tab',
  `transition_type` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由切换动画',
  PRIMARY KEY (`id`),
  KEY `idx_sys_base_menus_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_base_menus`
--

LOCK TABLES `sys_base_menus` WRITE;
/*!40000 ALTER TABLE `sys_base_menus` DISABLE KEYS */;
INSERT INTO `sys_base_menus` VALUES (16,'2026-05-25 17:53:02.104','2026-05-25 17:53:02.104',NULL,0,0,'dashboard','dashboard',0,'view/dashboard/index.vue',1,'',0,0,'仪表盘','odometer',0,''),(18,'2026-05-25 17:53:02.104','2026-05-25 17:53:02.104',NULL,0,0,'admin','superAdmin',0,'view/superAdmin/index.vue',3,'',0,0,'超级管理员','user',0,''),(19,'2026-05-25 17:53:02.104','2026-05-25 17:53:02.104',NULL,0,0,'person','person',1,'view/person/person.vue',4,'',0,0,'个人信息','message',0,''),(20,'2026-05-25 17:53:02.104','2026-05-25 17:53:02.104',NULL,0,0,'example','example',0,'view/example/index.vue',7,'',0,0,'示例文件','management',0,''),(23,'2026-05-25 17:53:02.104','2026-05-25 17:53:02.104',NULL,0,0,'state','state',0,'view/system/state.vue',8,'',0,0,'服务器状态','cloudy',0,''),(25,'2026-05-25 17:53:02.105','2026-05-25 17:53:02.105',NULL,1,18,'authority','authority',0,'view/superAdmin/authority/authority.vue',1,'',0,0,'角色管理','avatar',0,''),(26,'2026-05-25 17:53:02.105','2026-05-25 17:53:02.105',NULL,1,18,'menu','menu',0,'view/superAdmin/menu/menu.vue',2,'',1,0,'菜单管理','tickets',0,''),(27,'2026-05-25 17:53:02.105','2026-05-25 17:53:02.105',NULL,1,18,'api','api',0,'view/superAdmin/api/api.vue',3,'',1,0,'api管理','platform',0,''),(28,'2026-05-25 17:53:02.105','2026-05-25 17:53:02.105',NULL,1,18,'user','user',0,'view/superAdmin/user/user.vue',4,'',0,0,'用户管理','coordinate',0,''),(29,'2026-05-25 17:53:02.105','2026-05-25 17:53:02.105',NULL,1,18,'dictionary','dictionary',0,'view/superAdmin/dictionary/sysDictionary.vue',5,'',0,0,'字典管理','notebook',0,''),(30,'2026-05-25 17:53:02.105','2026-05-25 17:53:02.105',NULL,1,18,'operation','operation',0,'view/superAdmin/operation/sysOperationRecord.vue',6,'',0,0,'操作历史','pie-chart',0,''),(31,'2026-05-25 17:53:02.105','2026-05-25 17:53:02.105',NULL,1,18,'sysParams','sysParams',0,'view/superAdmin/params/sysParams.vue',7,'',0,0,'参数管理','compass',0,''),(32,'2026-05-25 17:53:02.105','2026-05-25 17:53:02.105',NULL,1,18,'system','system',0,'view/systemTools/system/system.vue',8,'',0,0,'系统配置','operation',0,''),(33,'2026-05-25 17:53:02.105','2026-05-25 17:53:02.105',NULL,1,18,'apiToken','apiToken',0,'view/systemTools/apiToken/index.vue',9,'',0,0,'API Token','key',0,''),(34,'2026-05-25 17:53:02.105','2026-05-25 17:53:02.105',NULL,1,18,'loginLog','loginLog',0,'view/systemTools/loginLog/index.vue',10,'',0,0,'登录日志','monitor',0,''),(35,'2026-05-25 17:53:02.105','2026-05-25 17:53:02.105',NULL,1,18,'sysVersion','sysVersion',0,'view/systemTools/version/version.vue',11,'',0,0,'版本管理','server',0,''),(36,'2026-05-25 17:53:02.105','2026-05-25 17:53:02.105',NULL,1,18,'sysError','sysError',0,'view/systemTools/sysError/sysError.vue',12,'',0,0,'错误日志','warn',0,''),(37,'2026-05-25 17:53:02.105','2026-05-25 17:53:02.105',NULL,1,20,'upload','upload',0,'view/example/upload/upload.vue',5,'',0,0,'媒体库（上传下载）','upload',0,''),(38,'2026-05-25 17:53:02.105','2026-05-25 17:53:02.105',NULL,1,20,'breakpoint','breakpoint',0,'view/example/breakpoint/breakpoint.vue',6,'',0,0,'断点续传','upload-filled',0,''),(39,'2026-05-25 17:53:02.105','2026-05-25 17:53:02.105',NULL,1,20,'customer','customer',0,'view/example/customer/customer.vue',7,'',0,0,'客户列表（资源示例）','avatar',0,'');
/*!40000 ALTER TABLE `sys_base_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_data_authority_id`
--

DROP TABLE IF EXISTS `sys_data_authority_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_data_authority_id` (
  `sys_authority_authority_id` bigint unsigned NOT NULL COMMENT '角色ID',
  `data_authority_id_authority_id` bigint unsigned NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`sys_authority_authority_id`,`data_authority_id_authority_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_data_authority_id`
--

LOCK TABLES `sys_data_authority_id` WRITE;
/*!40000 ALTER TABLE `sys_data_authority_id` DISABLE KEYS */;
INSERT INTO `sys_data_authority_id` VALUES (888,888),(888,8881),(888,9528),(9528,8881),(9528,9528);
/*!40000 ALTER TABLE `sys_data_authority_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dictionaries`
--

DROP TABLE IF EXISTS `sys_dictionaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dictionaries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典名（中）',
  `type` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典名（英）',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `desc` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `parent_id` bigint unsigned DEFAULT NULL COMMENT '父级字典ID',
  PRIMARY KEY (`id`),
  KEY `idx_sys_dictionaries_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dictionaries`
--

LOCK TABLES `sys_dictionaries` WRITE;
/*!40000 ALTER TABLE `sys_dictionaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_dictionaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dictionary_details`
--

DROP TABLE IF EXISTS `sys_dictionary_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dictionary_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `label` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '展示值',
  `value` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典值',
  `extend` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '扩展值',
  `status` tinyint(1) DEFAULT NULL COMMENT '启用状态',
  `sort` bigint DEFAULT NULL COMMENT '排序标记',
  `sys_dictionary_id` bigint unsigned DEFAULT NULL COMMENT '关联标记',
  `parent_id` bigint unsigned DEFAULT NULL COMMENT '父级字典详情ID',
  `level` bigint DEFAULT NULL COMMENT '层级深度',
  `path` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '层级路径',
  PRIMARY KEY (`id`),
  KEY `idx_sys_dictionary_details_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dictionary_details`
--

LOCK TABLES `sys_dictionary_details` WRITE;
/*!40000 ALTER TABLE `sys_dictionary_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_dictionary_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_error`
--

DROP TABLE IF EXISTS `sys_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_error` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `form` text COLLATE utf8mb4_general_ci COMMENT '错误来源',
  `info` text COLLATE utf8mb4_general_ci COMMENT '错误内容',
  `level` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日志等级',
  `solution` text COLLATE utf8mb4_general_ci COMMENT '解决方案',
  `status` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '未处理' COMMENT '处理状态',
  PRIMARY KEY (`id`),
  KEY `idx_sys_error_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_error`
--

LOCK TABLES `sys_error` WRITE;
/*!40000 ALTER TABLE `sys_error` DISABLE KEYS */;
INSERT INTO `sys_error` VALUES (1,'2026-05-25 17:32:17.077','2026-05-25 17:32:17.077',NULL,'后端','server启动失败 | 错误: listen tcp :8888: bind: address already in use \n 源文件:/home/v3/workspace/gin-vue-admin/server/core/server_run.go:36 \n 调用栈：github.com/flipped-aurora/gin-vue-admin/server/core.initServer.func1\n	/home/v3/workspace/gin-vue-admin/server/core/server_run.go:36','error',NULL,'未处理'),(2,'2026-05-25 17:37:20.765','2026-05-25 17:37:20.765',NULL,'前端','错误信息: TypeError: can\'t access property \"forEach\", asyncRouters.value[0].children is undefined\nStack: 调用栈: useRouterStore</<@http://localhost:8080/src/pinia/modules/router.js:145:5\ncallWithErrorHandling@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2085:17\ncallWithAsyncErrorHandling@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2092:36\ndoWatch/baseWatchOptions.call@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2538:72\ngetter@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1209:18\nrun@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1476:17\njob@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1256:17\ncallWithErrorHandling@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2085:31\nflushJobs@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2225:26\n','error',NULL,'未处理'),(3,'2026-05-25 17:37:29.003','2026-05-25 17:37:29.003',NULL,'前端','错误信息: TypeError: can\'t access property \"forEach\", asyncRouters.value[0].children is undefined\nStack: 调用栈: useRouterStore</<@http://localhost:8080/src/pinia/modules/router.js:145:5\ncallWithErrorHandling@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2085:17\ncallWithAsyncErrorHandling@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2092:36\ndoWatch/baseWatchOptions.call@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2538:72\ngetter@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1209:18\nrun@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1476:17\njob@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1256:17\ncallWithErrorHandling@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2085:31\nflushJobs@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2225:26\npromise callback*queueFlush@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2168:66\nqueueJob@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2164:3\ndoWatch/baseWatchOptions.scheduler@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2547:17\nwatch$1/effect.scheduler<@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1260:48\ntrigger@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1496:34\nendBatch@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:543:7\nnotify@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1587:5\ntrigger@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1579:9\nset value@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1817:14\nSetAsyncRouter@http://localhost:8080/src/pinia/modules/router.js:191:5\nasync*wrappedAction@http://localhost:8080/node_modules/.vite/deps/pinia.js?v=44ac4499:1029:14\npatchActionForGrouping/store[actionName]@http://localhost:8080/node_modules/.vite/deps/pinia.js?v=44ac4499:716:40\nsetupRouter@http://localhost:8080/src/permission.js:120:36\n@http://localhost:8080/src/permission.js:176:15\nasync*guardToPromiseFn/</</guardReturn<@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:700:50\nrunWithContext@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:682:83\nguardToPromiseFn/</<@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:700:37\nguardToPromiseFn/<@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:684:15\nrunWithContext@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4094:13\nrunWithContext@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:2455:64\ncreateRouter/runGuardQueue/</<@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:2657:77\npromise callback*createRouter/runGuardQueue/<@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:2657:52\nrunGuardQueue@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:2657:17\ncreateRouter/navigate/<@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:2470:11\npromise callback*navigate@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:2466:32\npushWithRedirect@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:2427:48\npushWithRedirect@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:2412:30\npush@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:2380:10\ninstall@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:2627:9\nuse@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4020:13\n@http://localhost:8080/src/main.js:35:4\nsetTimeout handler*@http://localhost:8080/__uno.css:19:42\n@http://localhost:8080/__uno.css:19:9\n','error',NULL,'未处理'),(4,'2026-05-25 17:37:34.345','2026-05-25 17:37:34.345',NULL,'前端','错误信息: TypeError: can\'t access property \"forEach\", asyncRouters.value[0].children is undefined\nStack: 调用栈: useRouterStore</<@http://localhost:8080/src/pinia/modules/router.js:145:5\ncallWithErrorHandling@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2085:17\ncallWithAsyncErrorHandling@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2092:36\ndoWatch/baseWatchOptions.call@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2538:72\ngetter@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1209:18\nrun@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1476:17\njob@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1256:17\ncallWithErrorHandling@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2085:31\nflushJobs@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2225:26\n','error',NULL,'未处理'),(5,'2026-05-25 17:37:40.695','2026-05-25 17:37:40.695',NULL,'前端','错误信息: TypeError: can\'t access property \"forEach\", asyncRouters.value[0].children is undefined\nStack: 调用栈: useRouterStore</<@http://localhost:8080/src/pinia/modules/router.js:145:5\ncallWithErrorHandling@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2085:17\ncallWithAsyncErrorHandling@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2092:36\ndoWatch/baseWatchOptions.call@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2538:72\ngetter@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1209:18\nrun@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1476:17\njob@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1256:17\ncallWithErrorHandling@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2085:31\nflushJobs@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2225:26\npromise callback*queueFlush@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2168:66\nqueueJob@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2164:3\ndoWatch/baseWatchOptions.scheduler@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2547:17\nwatch$1/effect.scheduler<@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1260:48\ntrigger@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1496:34\nendBatch@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:543:7\nnotify@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1587:5\ntrigger@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1579:9\nset value@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1817:14\nSetAsyncRouter@http://localhost:8080/src/pinia/modules/router.js:191:5\nasync*wrappedAction@http://localhost:8080/node_modules/.vite/deps/pinia.js?v=44ac4499:1029:14\npatchActionForGrouping/store[actionName]@http://localhost:8080/node_modules/.vite/deps/pinia.js?v=44ac4499:716:40\nsetupRouter@http://localhost:8080/src/permission.js:120:36\n@http://localhost:8080/src/permission.js:176:15\nasync*guardToPromiseFn/</</guardReturn<@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:700:50\nrunWithContext@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:682:83\nguardToPromiseFn/</<@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:700:37\nguardToPromiseFn/<@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:684:15\nrunWithContext@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4094:13\nrunWithContext@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:2455:64\ncreateRouter/runGuardQueue/</<@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:2657:77\npromise callback*createRouter/runGuardQueue/<@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:2657:52\nrunGuardQueue@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:2657:17\ncreateRouter/navigate/<@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:2470:11\npromise callback*navigate@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:2466:32\npushWithRedirect@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:2427:48\npush@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:2380:10\ninstall@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:2627:9\nuse@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4020:13\n@http://localhost:8080/src/main.js:35:4\nsetTimeout handler*@http://localhost:8080/__uno.css:19:42\n@http://localhost:8080/__uno.css:19:9\n','error',NULL,'未处理'),(6,'2026-05-25 17:39:12.461','2026-05-25 17:39:12.461',NULL,'后端','重新写入cookie token失败,未能成功解析token,请检查请求头是否存在x-token且claims是否为规定结构 \n 源文件:/home/v3/workspace/gin-vue-admin/server/utils/claims.go:49 \n 调用栈：github.com/flipped-aurora/gin-vue-admin/server/utils.GetToken\n	/home/v3/workspace/gin-vue-admin/server/utils/claims.go:49\ngithub.com/flipped-aurora/gin-vue-admin/server/initialize.Routers.JWTAuth.func3\n	/home/v3/workspace/gin-vue-admin/server/middleware/jwt.go:19\ngithub.com/gin-gonic/gin.(*Context).Next\n	/home/v3/go/pkg/mod/github.com/gin-gonic/gin@v1.10.0/context.go:185\ngithub.com/gin-gonic/gin.LoggerWithConfig.func1\n	/home/v3/go/pkg/mod/github.com/gin-gonic/gin@v1.10.0/logger.go:249\ngithub.com/gin-gonic/gin.(*Context).Next\n	/home/v3/go/pkg/mod/github.com/gin-gonic/gin@v1.10.0/context.go:185\ngithub.com/flipped-aurora/gin-vue-admin/server/initialize.Routers.GinRecovery.func2\n	/home/v3/workspace/gin-vue-admin/server/middleware/error.go:78\ngithub.com/gin-gonic/gin.(*Context).Next\n	/home/v3/go/pkg/mod/github.com/gin-gonic/gin@v1.10.0/context.go:185\ngithub.com/gin-gonic/gin.(*Engine).handleHTTPRequest\n	/home/v3/go/pkg/mod/github.com/gin-gonic/gin@v1.10.0/gin.go:633\ngithub.com/gin-gonic/gin.(*Engine).ServeHTTP\n	/home/v3/go/pkg/mod/github.com/gin-gonic/gin@v1.10.0/gin.go:589\nnet/http.serverHandler.ServeHTTP\n	/snap/go/11127/src/net/http/server.go:3311\nnet/http.(*conn).serve\n	/snap/go/11127/src/net/http/server.go:2073 \n 最终调用方法:/home/v3/workspace/gin-vue-admin/server/utils/claims.go:49 (GetToken lines 42-55)\n----- 产生日志的方法代码如下 -----\nfunc GetToken(c *gin.Context) string {\n	token := c.Request.Header.Get(\"x-token\")\n	if token == \"\" {\n		j := NewJWT()\n		token, _ = c.Cookie(\"x-token\")\n		claims, err := j.ParseToken(token)\n		if err != nil {\n			global.GVA_LOG.Error(\"重新写入cookie token失败,未能成功解析token,请检查请求头是否存在x-token且claims是否为规定结构\")\n			return token\n		}\n		SetToken(c, token, int(claims.ExpiresAt.Unix()-time.Now().Unix()))\n	}\n	return token\n}','error',NULL,'未处理'),(7,'2026-05-25 17:46:22.776','2026-05-25 17:46:22.776',NULL,'前端','错误信息: TypeError: can\'t access property \"forEach\", asyncRouters.value[0].children is undefined\nStack: 调用栈: useRouterStore</<@http://localhost:8080/src/pinia/modules/router.js:145:5\ncallWithErrorHandling@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2085:17\ncallWithAsyncErrorHandling@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2092:36\ndoWatch/baseWatchOptions.call@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2538:72\ngetter@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1209:18\nrun@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1476:17\njob@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1256:17\ncallWithErrorHandling@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2085:31\nflushJobs@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2225:26\npromise callback*queueFlush@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2168:66\nqueueJob@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2164:3\ndoWatch/baseWatchOptions.scheduler@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2547:17\nwatch$1/effect.scheduler<@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1260:48\ntrigger@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1496:34\nendBatch@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:543:7\nnotify@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1587:5\ntrigger@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1579:9\nset value@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1817:14\nSetAsyncRouter@http://localhost:8080/src/pinia/modules/router.js:191:5\nasync*wrappedAction@http://localhost:8080/node_modules/.vite/deps/pinia.js?v=44ac4499:1029:14\npatchActionForGrouping/store[actionName]@http://localhost:8080/node_modules/.vite/deps/pinia.js?v=44ac4499:716:40\nsetupRouter@http://localhost:8080/src/permission.js:120:36\n@http://localhost:8080/src/permission.js:176:15\nasync*guardToPromiseFn/</</guardReturn<@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:700:50\nrunWithContext@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:682:83\nguardToPromiseFn/</<@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:700:37\nguardToPromiseFn/<@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:684:15\nrunWithContext@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4094:13\nrunWithContext@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:2455:64\ncreateRouter/runGuardQueue/</<@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:2657:77\npromise callback*createRouter/runGuardQueue/<@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:2657:52\nrunGuardQueue@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:2657:17\ncreateRouter/navigate/<@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:2470:11\npromise callback*navigate@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:2466:32\npushWithRedirect@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:2427:48\npush@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:2380:10\ninstall@http://localhost:8080/node_modules/.vite/deps/vue-router.js?v=78c52a94:2627:9\nuse@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4020:13\n@http://localhost:8080/src/main.js:35:4\nsetTimeout handler*@http://localhost:8080/__uno.css:19:42\n@http://localhost:8080/__uno.css:19:9\n','error',NULL,'未处理'),(8,'2026-05-25 17:46:41.680','2026-05-25 17:46:41.680',NULL,'前端','错误信息: TypeError: can\'t access property \"forEach\", asyncRouters.value[0].children is undefined\nStack: 调用栈: useRouterStore</<@http://localhost:8080/src/pinia/modules/router.js:145:5\ncallWithErrorHandling@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2085:17\ncallWithAsyncErrorHandling@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2092:36\ndoWatch/baseWatchOptions.call@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2538:72\ngetter@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1209:18\nrun@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1476:17\njob@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1256:17\ncallWithErrorHandling@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2085:31\nflushJobs@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2225:26\npromise callback*queueFlush@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2168:66\nqueueJob@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2164:3\ndoWatch/baseWatchOptions.scheduler@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2547:17\nwatch$1/effect.scheduler<@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1260:48\ntrigger@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1496:34\nendBatch@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:543:7\nnotify@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1587:5\ntrigger@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1579:9\nset value@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1817:14\nSetAsyncRouter@http://localhost:8080/src/pinia/modules/router.js:191:5\nasync*wrappedAction@http://localhost:8080/node_modules/.vite/deps/pinia.js?v=44ac4499:1029:14\npatchActionForGrouping/store[actionName]@http://localhost:8080/node_modules/.vite/deps/pinia.js?v=44ac4499:716:40\nLoginIn@http://localhost:8080/src/pinia/modules/user.js:81:25\nasync*wrappedAction@http://localhost:8080/node_modules/.vite/deps/pinia.js?v=44ac4499:1029:14\npatchActionForGrouping/store[actionName]@http://localhost:8080/node_modules/.vite/deps/pinia.js?v=44ac4499:716:40\nlogin@http://localhost:8080/src/view/login/index.vue:103:28\nsetup/submitForm/<@http://localhost:8080/src/view/login/index.vue:118:26\nvalidateField@http://localhost:8080/node_modules/.vite/deps/es-Dg0EwXc_.js?v=da719756:10752:32\nasync*validate@http://localhost:8080/node_modules/.vite/deps/es-Dg0EwXc_.js?v=da719756:10729:53\nsubmitForm@http://localhost:8080/src/view/login/index.vue:106:21\ncallWithErrorHandling@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2085:17\ncallWithAsyncErrorHandling@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2092:36\nemit@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4188:41\ncreateSetupContext/get emit/<@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:6186:41\nhandleClick@http://localhost:8080/node_modules/.vite/deps/es-Dg0EwXc_.js?v=da719756:16145:7\ncallWithErrorHandling@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2085:17\ncallWithAsyncErrorHandling@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2092:36\ninvoker@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:7939:29\nEventListener.handleEvent*addEventListener@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:7905:5\npatchEvent@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:7916:34\npatchProp@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:8374:41\nmountElement@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4796:87\nprocessElement@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4775:31\npatch@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4721:46\ncomponentUpdateFn@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4995:11\nrun@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1476:17\nsetupRenderEffect@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:5063:3\nmountComponent@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4947:27\nprocessComponent@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4927:22\npatch@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4722:44\nmountChildren@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4834:54\nprocessFragment@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4918:17\npatch@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4719:20\nmountChildren@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4834:54\nmountElement@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4792:41\nprocessElement@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4775:31\npatch@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4721:46\nmountChildren@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4834:54\nmountElement@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4792:41\nprocessElement@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4775:31\npatch@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4721:46\ncomponentUpdateFn@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4995:11\nrun@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1476:17\nsetupRenderEffect@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:5063:3\nmountComponent@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4947:27\nprocessComponent@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4927:22\npatch@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4722:44\nmountChildren@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:4834:54\n','error',NULL,'未处理'),(9,'2026-05-25 17:47:37.015','2026-05-25 17:47:37.015',NULL,'前端','错误信息: TypeError: can\'t access property \"forEach\", asyncRouters.value[0].children is undefined\nStack: 调用栈: useRouterStore</<@http://localhost:8080/src/pinia/modules/router.js:145:5\ncallWithErrorHandling@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2085:17\ncallWithAsyncErrorHandling@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2092:36\ndoWatch/baseWatchOptions.call@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2538:72\ngetter@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1209:18\nrun@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1476:17\njob@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:1256:17\ncallWithErrorHandling@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2085:31\nflushJobs@http://localhost:8080/node_modules/.vite/deps/runtime-dom.esm-bundler-CtfAi8Ci.js?v=da719756:2225:26\n','error',NULL,'未处理'),(10,'2026-05-25 17:53:44.492','2026-05-25 17:53:44.492',NULL,'后端','获取失败! | 错误: record not found \n 源文件:/home/v3/workspace/gin-vue-admin/server/api/v1/system/sys_user.go:487 \n 调用栈：github.com/flipped-aurora/gin-vue-admin/server/api/v1/system.(*BaseApi).GetUserInfo\n	/home/v3/workspace/gin-vue-admin/server/api/v1/system/sys_user.go:487\ngithub.com/gin-gonic/gin.(*Context).Next\n	/home/v3/go/pkg/mod/github.com/gin-gonic/gin@v1.10.0/context.go:185\ngithub.com/flipped-aurora/gin-vue-admin/server/initialize.Routers.CasbinHandler.func4\n	/home/v3/workspace/gin-vue-admin/server/middleware/casbin_rbac.go:30\ngithub.com/gin-gonic/gin.(*Context).Next\n	/home/v3/go/pkg/mod/github.com/gin-gonic/gin@v1.10.0/context.go:185\ngithub.com/flipped-aurora/gin-vue-admin/server/initialize.Routers.JWTAuth.func3\n	/home/v3/workspace/gin-vue-admin/server/middleware/jwt.go:69\ngithub.com/gin-gonic/gin.(*Context).Next\n	/home/v3/go/pkg/mod/github.com/gin-gonic/gin@v1.10.0/context.go:185\ngithub.com/gin-gonic/gin.LoggerWithConfig.func1\n	/home/v3/go/pkg/mod/github.com/gin-gonic/gin@v1.10.0/logger.go:249\ngithub.com/gin-gonic/gin.(*Context).Next\n	/home/v3/go/pkg/mod/github.com/gin-gonic/gin@v1.10.0/context.go:185\ngithub.com/flipped-aurora/gin-vue-admin/server/initialize.Routers.GinRecovery.func2\n	/home/v3/workspace/gin-vue-admin/server/middleware/error.go:78\ngithub.com/gin-gonic/gin.(*Context).Next\n	/home/v3/go/pkg/mod/github.com/gin-gonic/gin@v1.10.0/context.go:185\ngithub.com/gin-gonic/gin.(*Engine).handleHTTPRequest\n	/home/v3/go/pkg/mod/github.com/gin-gonic/gin@v1.10.0/gin.go:633\ngithub.com/gin-gonic/gin.(*Engine).ServeHTTP\n	/home/v3/go/pkg/mod/github.com/gin-gonic/gin@v1.10.0/gin.go:589\nnet/http.serverHandler.ServeHTTP\n	/snap/go/11127/src/net/http/server.go:3311\nnet/http.(*conn).serve\n	/snap/go/11127/src/net/http/server.go:2073 \n 最终调用方法:/home/v3/workspace/gin-vue-admin/server/api/v1/system/sys_user.go:487 (GetUserInfo lines 483-492)\n----- 产生日志的方法代码如下 -----\nfunc (b *BaseApi) GetUserInfo(c *gin.Context) {\n	uuid := utils.GetUserUuid(c)\n	ReqUser, err := userService.GetUserInfo(uuid)\n	if err != nil {\n		global.GVA_LOG.Error(\"获取失败!\", zap.Error(err))\n		response.FailWithMessage(\"获取失败\", c)\n		return\n	}\n	response.OkWithDetailed(gin.H{\"userInfo\": ReqUser}, \"获取成功\", c)\n}','error',NULL,'未处理'),(11,'2026-05-25 17:53:47.425','2026-05-25 17:53:47.425',NULL,'后端','获取失败! | 错误: record not found \n 源文件:/home/v3/workspace/gin-vue-admin/server/api/v1/system/sys_user.go:487 \n 调用栈：github.com/flipped-aurora/gin-vue-admin/server/api/v1/system.(*BaseApi).GetUserInfo\n	/home/v3/workspace/gin-vue-admin/server/api/v1/system/sys_user.go:487\ngithub.com/gin-gonic/gin.(*Context).Next\n	/home/v3/go/pkg/mod/github.com/gin-gonic/gin@v1.10.0/context.go:185\ngithub.com/flipped-aurora/gin-vue-admin/server/initialize.Routers.CasbinHandler.func4\n	/home/v3/workspace/gin-vue-admin/server/middleware/casbin_rbac.go:30\ngithub.com/gin-gonic/gin.(*Context).Next\n	/home/v3/go/pkg/mod/github.com/gin-gonic/gin@v1.10.0/context.go:185\ngithub.com/flipped-aurora/gin-vue-admin/server/initialize.Routers.JWTAuth.func3\n	/home/v3/workspace/gin-vue-admin/server/middleware/jwt.go:69\ngithub.com/gin-gonic/gin.(*Context).Next\n	/home/v3/go/pkg/mod/github.com/gin-gonic/gin@v1.10.0/context.go:185\ngithub.com/gin-gonic/gin.LoggerWithConfig.func1\n	/home/v3/go/pkg/mod/github.com/gin-gonic/gin@v1.10.0/logger.go:249\ngithub.com/gin-gonic/gin.(*Context).Next\n	/home/v3/go/pkg/mod/github.com/gin-gonic/gin@v1.10.0/context.go:185\ngithub.com/flipped-aurora/gin-vue-admin/server/initialize.Routers.GinRecovery.func2\n	/home/v3/workspace/gin-vue-admin/server/middleware/error.go:78\ngithub.com/gin-gonic/gin.(*Context).Next\n	/home/v3/go/pkg/mod/github.com/gin-gonic/gin@v1.10.0/context.go:185\ngithub.com/gin-gonic/gin.(*Engine).handleHTTPRequest\n	/home/v3/go/pkg/mod/github.com/gin-gonic/gin@v1.10.0/gin.go:633\ngithub.com/gin-gonic/gin.(*Engine).ServeHTTP\n	/home/v3/go/pkg/mod/github.com/gin-gonic/gin@v1.10.0/gin.go:589\nnet/http.serverHandler.ServeHTTP\n	/snap/go/11127/src/net/http/server.go:3311\nnet/http.(*conn).serve\n	/snap/go/11127/src/net/http/server.go:2073 \n 最终调用方法:/home/v3/workspace/gin-vue-admin/server/api/v1/system/sys_user.go:487 (GetUserInfo lines 483-492)\n----- 产生日志的方法代码如下 -----\nfunc (b *BaseApi) GetUserInfo(c *gin.Context) {\n	uuid := utils.GetUserUuid(c)\n	ReqUser, err := userService.GetUserInfo(uuid)\n	if err != nil {\n		global.GVA_LOG.Error(\"获取失败!\", zap.Error(err))\n		response.FailWithMessage(\"获取失败\", c)\n		return\n	}\n	response.OkWithDetailed(gin.H{\"userInfo\": ReqUser}, \"获取成功\", c)\n}','error',NULL,'未处理');
/*!40000 ALTER TABLE `sys_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_export_template_condition`
--

DROP TABLE IF EXISTS `sys_export_template_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_export_template_condition` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `template_id` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '模板标识',
  `from` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '条件取的key',
  `column` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '作为查询条件的字段',
  `operator` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作符',
  PRIMARY KEY (`id`),
  KEY `idx_sys_export_template_condition_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_export_template_condition`
--

LOCK TABLES `sys_export_template_condition` WRITE;
/*!40000 ALTER TABLE `sys_export_template_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_export_template_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_export_template_join`
--

DROP TABLE IF EXISTS `sys_export_template_join`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_export_template_join` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `template_id` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '模板标识',
  `joins` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联',
  `table` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联表',
  `on` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联条件',
  PRIMARY KEY (`id`),
  KEY `idx_sys_export_template_join_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_export_template_join`
--

LOCK TABLES `sys_export_template_join` WRITE;
/*!40000 ALTER TABLE `sys_export_template_join` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_export_template_join` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_export_templates`
--

DROP TABLE IF EXISTS `sys_export_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_export_templates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `db_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '数据库名称',
  `name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '模板名称',
  `table_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表名称',
  `template_id` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '模板标识',
  `template_info` text COLLATE utf8mb4_general_ci,
  `sql` text COLLATE utf8mb4_general_ci COMMENT '自定义导出SQL',
  `import_sql` text COLLATE utf8mb4_general_ci COMMENT '自定义导入SQL',
  `limit` bigint DEFAULT NULL COMMENT '导出限制',
  `order` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `idx_sys_export_templates_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_export_templates`
--

LOCK TABLES `sys_export_templates` WRITE;
/*!40000 ALTER TABLE `sys_export_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_export_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_ignore_apis`
--

DROP TABLE IF EXISTS `sys_ignore_apis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_ignore_apis` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'api路径',
  `method` varchar(191) COLLATE utf8mb4_general_ci DEFAULT 'POST' COMMENT '方法',
  PRIMARY KEY (`id`),
  KEY `idx_sys_ignore_apis_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_ignore_apis`
--

LOCK TABLES `sys_ignore_apis` WRITE;
/*!40000 ALTER TABLE `sys_ignore_apis` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_ignore_apis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_login_logs`
--

DROP TABLE IF EXISTS `sys_login_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_login_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `ip` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求ip',
  `status` tinyint(1) DEFAULT NULL COMMENT '登录状态',
  `error_message` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '错误信息',
  `agent` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '代理',
  `user_id` bigint unsigned DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `idx_sys_login_logs_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_login_logs`
--

LOCK TABLES `sys_login_logs` WRITE;
/*!40000 ALTER TABLE `sys_login_logs` DISABLE KEYS */;
INSERT INTO `sys_login_logs` VALUES (1,'2026-05-25 17:45:16.383','2026-05-25 17:45:16.383',NULL,'admin','::1',0,'验证码错误','curl/8.5.0',0),(2,'2026-05-25 17:46:41.363','2026-05-25 17:46:41.363',NULL,'admin','127.0.0.1',1,'登录成功','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:150.0) Gecko/20100101 Firefox/150.0',1),(3,'2026-05-25 17:49:37.363','2026-05-25 17:49:37.363',NULL,'admin','127.0.0.1',0,'验证码错误','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:150.0) Gecko/20100101 Firefox/150.0',0),(4,'2026-05-25 17:49:44.824','2026-05-25 17:49:44.824',NULL,'admin','127.0.0.1',1,'登录成功','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:150.0) Gecko/20100101 Firefox/150.0',1),(5,'2026-05-25 17:53:59.632','2026-05-25 17:53:59.632',NULL,'admin','127.0.0.1',1,'登录成功','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:150.0) Gecko/20100101 Firefox/150.0',3);
/*!40000 ALTER TABLE `sys_login_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_operation_records`
--

DROP TABLE IF EXISTS `sys_operation_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_operation_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `ip` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求ip',
  `method` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求方法',
  `path` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求路径',
  `status` bigint DEFAULT NULL COMMENT '请求状态',
  `latency` bigint DEFAULT NULL COMMENT '延迟',
  `agent` text COLLATE utf8mb4_general_ci COMMENT '代理',
  `error_message` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '错误信息',
  `body` text COLLATE utf8mb4_general_ci COMMENT '请求Body',
  `resp` text COLLATE utf8mb4_general_ci COMMENT '响应Body',
  `user_id` bigint unsigned DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `idx_sys_operation_records_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_operation_records`
--

LOCK TABLES `sys_operation_records` WRITE;
/*!40000 ALTER TABLE `sys_operation_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_operation_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_params`
--

DROP TABLE IF EXISTS `sys_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_params` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '参数名称',
  `key` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '参数键',
  `value` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '参数值',
  `desc` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '参数说明',
  PRIMARY KEY (`id`),
  KEY `idx_sys_params_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_params`
--

LOCK TABLES `sys_params` WRITE;
/*!40000 ALTER TABLE `sys_params` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_authority`
--

DROP TABLE IF EXISTS `sys_user_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_authority` (
  `sys_user_id` bigint unsigned NOT NULL,
  `sys_authority_authority_id` bigint unsigned NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`sys_user_id`,`sys_authority_authority_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_authority`
--

LOCK TABLES `sys_user_authority` WRITE;
/*!40000 ALTER TABLE `sys_user_authority` DISABLE KEYS */;
INSERT INTO `sys_user_authority` VALUES (3,888),(3,8881),(3,9528),(4,888);
/*!40000 ALTER TABLE `sys_user_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_users`
--

DROP TABLE IF EXISTS `sys_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户UUID',
  `username` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户登录名',
  `password` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户登录密码',
  `nick_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT '系统用户' COMMENT '用户昵称',
  `header_img` varchar(191) COLLATE utf8mb4_general_ci DEFAULT 'https://qmplusimg.henrongyi.top/gva_header.jpg' COMMENT '用户头像',
  `authority_id` bigint unsigned DEFAULT '888' COMMENT '用户角色ID',
  `phone` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户手机号',
  `email` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户邮箱',
  `enable` bigint DEFAULT '1' COMMENT '用户是否被冻结 1正常 2冻结',
  `origin_setting` json DEFAULT NULL COMMENT '配置',
  PRIMARY KEY (`id`),
  KEY `idx_sys_users_deleted_at` (`deleted_at`),
  KEY `idx_sys_users_uuid` (`uuid`),
  KEY `idx_sys_users_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_users`
--

LOCK TABLES `sys_users` WRITE;
/*!40000 ALTER TABLE `sys_users` DISABLE KEYS */;
INSERT INTO `sys_users` VALUES (3,'2026-05-25 17:53:02.100','2026-05-25 17:53:02.101',NULL,'b94ed65c-c1c0-4ea6-b8eb-18323c3abb02','admin','$2a$10$MRlsLRotONzJqBRpjlIfw.2hWP6JhtIZeDfZFe4RvrO/0bDI/ZDKO','Mr.奇淼','https://qmplusimg.henrongyi.top/gva_header.jpg',888,'17611111111','333333333@qq.com',1,NULL),(4,'2026-05-25 17:53:02.100','2026-05-25 17:53:02.103',NULL,'a6593696-b22c-4ed2-9da0-1be09aa38c1e','a303176530','$2a$10$MRlsLRotONzJqBRpjlIfw.2hWP6JhtIZeDfZFe4RvrO/0bDI/ZDKO','用户1','https://qmplusimg.henrongyi.top/1572075907logo.png',9528,'17611111111','333333333@qq.com',1,NULL);
/*!40000 ALTER TABLE `sys_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_versions`
--

DROP TABLE IF EXISTS `sys_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_versions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `version_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '版本名称',
  `version_code` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '版本号',
  `description` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '版本描述',
  `version_data` text COLLATE utf8mb4_general_ci COMMENT '版本数据JSON',
  PRIMARY KEY (`id`),
  KEY `idx_sys_versions_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_versions`
--

LOCK TABLES `sys_versions` WRITE;
/*!40000 ALTER TABLE `sys_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_versions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-25 18:08:45
