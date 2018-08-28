/*
 Navicat Premium Data Transfer

 Source Server         : nicestore
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : nicestore2

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 28/08/2018 12:07:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES (1, 'Can add permission', 1, 'add_permission');
INSERT INTO `auth_permission` VALUES (2, 'Can change permission', 1, 'change_permission');
INSERT INTO `auth_permission` VALUES (3, 'Can delete permission', 1, 'delete_permission');
INSERT INTO `auth_permission` VALUES (4, 'Can add group', 2, 'add_group');
INSERT INTO `auth_permission` VALUES (5, 'Can change group', 2, 'change_group');
INSERT INTO `auth_permission` VALUES (6, 'Can delete group', 2, 'delete_group');
INSERT INTO `auth_permission` VALUES (7, 'Can view group', 2, 'view_group');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 1, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add content type', 3, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (10, 'Can change content type', 3, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (11, 'Can delete content type', 3, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (12, 'Can view content type', 3, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (13, 'Can add session', 4, 'add_session');
INSERT INTO `auth_permission` VALUES (14, 'Can change session', 4, 'change_session');
INSERT INTO `auth_permission` VALUES (15, 'Can delete session', 4, 'delete_session');
INSERT INTO `auth_permission` VALUES (16, 'Can view session', 4, 'view_session');
INSERT INTO `auth_permission` VALUES (17, 'Can add Phone Verification Code', 5, 'add_verifycode');
INSERT INTO `auth_permission` VALUES (18, 'Can change Phone Verification Code', 5, 'change_verifycode');
INSERT INTO `auth_permission` VALUES (19, 'Can delete Phone Verification Code', 5, 'delete_verifycode');
INSERT INTO `auth_permission` VALUES (20, 'Can add User Profile', 6, 'add_userprofile');
INSERT INTO `auth_permission` VALUES (21, 'Can change User Profile', 6, 'change_userprofile');
INSERT INTO `auth_permission` VALUES (22, 'Can delete User Profile', 6, 'delete_userprofile');
INSERT INTO `auth_permission` VALUES (23, 'Can view User Profile', 6, 'view_userprofile');
INSERT INTO `auth_permission` VALUES (24, 'Can view Phone Verification Code', 5, 'view_verifycode');
INSERT INTO `auth_permission` VALUES (25, 'Can add Slider Image', 7, 'add_banner');
INSERT INTO `auth_permission` VALUES (26, 'Can change Slider Image', 7, 'change_banner');
INSERT INTO `auth_permission` VALUES (27, 'Can delete Slider Image', 7, 'delete_banner');
INSERT INTO `auth_permission` VALUES (28, 'Can add Product Detail', 8, 'add_goods');
INSERT INTO `auth_permission` VALUES (29, 'Can change Product Detail', 8, 'change_goods');
INSERT INTO `auth_permission` VALUES (30, 'Can delete Product Detail', 8, 'delete_goods');
INSERT INTO `auth_permission` VALUES (31, 'Can add Product Brand', 9, 'add_goodscategorybrand');
INSERT INTO `auth_permission` VALUES (32, 'Can change Product Brand', 9, 'change_goodscategorybrand');
INSERT INTO `auth_permission` VALUES (33, 'Can delete Product Brand', 9, 'delete_goodscategorybrand');
INSERT INTO `auth_permission` VALUES (34, 'Can add Goods Category', 10, 'add_goodscategory');
INSERT INTO `auth_permission` VALUES (35, 'Can change Goods Category', 10, 'change_goodscategory');
INSERT INTO `auth_permission` VALUES (36, 'Can delete Goods Category', 10, 'delete_goodscategory');
INSERT INTO `auth_permission` VALUES (37, 'Can add Item Image Roller', 11, 'add_goodsimage');
INSERT INTO `auth_permission` VALUES (38, 'Can change Item Image Roller', 11, 'change_goodsimage');
INSERT INTO `auth_permission` VALUES (39, 'Can delete Item Image Roller', 11, 'delete_goodsimage');
INSERT INTO `auth_permission` VALUES (40, 'Can view Slider Image', 7, 'view_banner');
INSERT INTO `auth_permission` VALUES (41, 'Can view Product Detail', 8, 'view_goods');
INSERT INTO `auth_permission` VALUES (42, 'Can view Goods Category', 10, 'view_goodscategory');
INSERT INTO `auth_permission` VALUES (43, 'Can view Product Brand', 9, 'view_goodscategorybrand');
INSERT INTO `auth_permission` VALUES (44, 'Can view Item Image Roller', 11, 'view_goodsimage');
INSERT INTO `auth_permission` VALUES (45, 'Can add Order Detail with Items', 12, 'add_ordergoods');
INSERT INTO `auth_permission` VALUES (46, 'Can change Order Detail with Items', 12, 'change_ordergoods');
INSERT INTO `auth_permission` VALUES (47, 'Can delete Order Detail with Items', 12, 'delete_ordergoods');
INSERT INTO `auth_permission` VALUES (48, 'Can add Order Transaction Detail', 13, 'add_orderinfo');
INSERT INTO `auth_permission` VALUES (49, 'Can change Order Transaction Detail', 13, 'change_orderinfo');
INSERT INTO `auth_permission` VALUES (50, 'Can delete Order Transaction Detail', 13, 'delete_orderinfo');
INSERT INTO `auth_permission` VALUES (51, 'Can add Shopping Cart', 14, 'add_shoppingcart');
INSERT INTO `auth_permission` VALUES (52, 'Can change Shopping Cart', 14, 'change_shoppingcart');
INSERT INTO `auth_permission` VALUES (53, 'Can delete Shopping Cart', 14, 'delete_shoppingcart');
INSERT INTO `auth_permission` VALUES (54, 'Can view Order Detail with Items', 12, 'view_ordergoods');
INSERT INTO `auth_permission` VALUES (55, 'Can view Order Transaction Detail', 13, 'view_orderinfo');
INSERT INTO `auth_permission` VALUES (56, 'Can view Shopping Cart', 14, 'view_shoppingcart');
INSERT INTO `auth_permission` VALUES (57, 'Can add User Favorite Items', 15, 'add_userfav');
INSERT INTO `auth_permission` VALUES (58, 'Can change User Favorite Items', 15, 'change_userfav');
INSERT INTO `auth_permission` VALUES (59, 'Can delete User Favorite Items', 15, 'delete_userfav');
INSERT INTO `auth_permission` VALUES (60, 'Can add User Address', 16, 'add_useraddress');
INSERT INTO `auth_permission` VALUES (61, 'Can change User Address', 16, 'change_useraddress');
INSERT INTO `auth_permission` VALUES (62, 'Can delete User Address', 16, 'delete_useraddress');
INSERT INTO `auth_permission` VALUES (63, 'Can add User Messages', 17, 'add_usermessages');
INSERT INTO `auth_permission` VALUES (64, 'Can change User Messages', 17, 'change_usermessages');
INSERT INTO `auth_permission` VALUES (65, 'Can delete User Messages', 17, 'delete_usermessages');
INSERT INTO `auth_permission` VALUES (66, 'Can view User Address', 16, 'view_useraddress');
INSERT INTO `auth_permission` VALUES (67, 'Can view User Favorite Items', 15, 'view_userfav');
INSERT INTO `auth_permission` VALUES (68, 'Can view User Messages', 17, 'view_usermessages');
INSERT INTO `auth_permission` VALUES (69, 'Can add User Setting', 18, 'add_usersettings');
INSERT INTO `auth_permission` VALUES (70, 'Can change User Setting', 18, 'change_usersettings');
INSERT INTO `auth_permission` VALUES (71, 'Can delete User Setting', 18, 'delete_usersettings');
INSERT INTO `auth_permission` VALUES (72, 'Can add User Widget', 19, 'add_userwidget');
INSERT INTO `auth_permission` VALUES (73, 'Can change User Widget', 19, 'change_userwidget');
INSERT INTO `auth_permission` VALUES (74, 'Can delete User Widget', 19, 'delete_userwidget');
INSERT INTO `auth_permission` VALUES (75, 'Can add log entry', 20, 'add_log');
INSERT INTO `auth_permission` VALUES (76, 'Can change log entry', 20, 'change_log');
INSERT INTO `auth_permission` VALUES (77, 'Can delete log entry', 20, 'delete_log');
INSERT INTO `auth_permission` VALUES (78, 'Can add Bookmark', 21, 'add_bookmark');
INSERT INTO `auth_permission` VALUES (79, 'Can change Bookmark', 21, 'change_bookmark');
INSERT INTO `auth_permission` VALUES (80, 'Can delete Bookmark', 21, 'delete_bookmark');
INSERT INTO `auth_permission` VALUES (81, 'Can view Bookmark', 21, 'view_bookmark');
INSERT INTO `auth_permission` VALUES (82, 'Can view log entry', 20, 'view_log');
INSERT INTO `auth_permission` VALUES (83, 'Can view User Setting', 18, 'view_usersettings');
INSERT INTO `auth_permission` VALUES (84, 'Can view User Widget', 19, 'view_userwidget');
INSERT INTO `auth_permission` VALUES (85, 'Can add Token', 22, 'add_token');
INSERT INTO `auth_permission` VALUES (86, 'Can change Token', 22, 'change_token');
INSERT INTO `auth_permission` VALUES (87, 'Can delete Token', 22, 'delete_token');
INSERT INTO `auth_permission` VALUES (88, 'Can view Token', 22, 'view_token');
COMMIT;

-- ----------------------------
-- Table structure for authtoken_token
-- ----------------------------
DROP TABLE IF EXISTS `authtoken_token`;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES (2, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (1, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (22, 'authtoken', 'token');
INSERT INTO `django_content_type` VALUES (3, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (7, 'goods', 'banner');
INSERT INTO `django_content_type` VALUES (8, 'goods', 'goods');
INSERT INTO `django_content_type` VALUES (10, 'goods', 'goodscategory');
INSERT INTO `django_content_type` VALUES (9, 'goods', 'goodscategorybrand');
INSERT INTO `django_content_type` VALUES (11, 'goods', 'goodsimage');
INSERT INTO `django_content_type` VALUES (4, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (12, 'trade', 'ordergoods');
INSERT INTO `django_content_type` VALUES (13, 'trade', 'orderinfo');
INSERT INTO `django_content_type` VALUES (14, 'trade', 'shoppingcart');
INSERT INTO `django_content_type` VALUES (6, 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES (5, 'users', 'verifycode');
INSERT INTO `django_content_type` VALUES (16, 'user_operation', 'useraddress');
INSERT INTO `django_content_type` VALUES (15, 'user_operation', 'userfav');
INSERT INTO `django_content_type` VALUES (17, 'user_operation', 'usermessages');
INSERT INTO `django_content_type` VALUES (21, 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES (20, 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES (18, 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES (19, 'xadmin', 'userwidget');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2018-08-20 21:23:13.896099');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2018-08-20 21:23:13.926048');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2018-08-20 21:23:14.028019');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2018-08-20 21:23:14.051226');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2018-08-20 21:23:14.059288');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2018-08-20 21:23:14.066641');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2018-08-20 21:23:14.075360');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2018-08-20 21:23:14.078696');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2018-08-20 21:23:14.085720');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2018-08-20 21:23:14.094136');
INSERT INTO `django_migrations` VALUES (11, 'users', '0001_initial', '2018-08-20 21:23:14.231109');
INSERT INTO `django_migrations` VALUES (12, 'authtoken', '0001_initial', '2018-08-20 21:23:14.275790');
INSERT INTO `django_migrations` VALUES (13, 'authtoken', '0002_auto_20160226_1747', '2018-08-20 21:23:14.392215');
INSERT INTO `django_migrations` VALUES (14, 'goods', '0001_initial', '2018-08-20 21:23:14.629770');
INSERT INTO `django_migrations` VALUES (15, 'goods', '0002_auto_20180814_1403', '2018-08-20 21:23:14.644069');
INSERT INTO `django_migrations` VALUES (16, 'goods', '0003_auto_20180814_1624', '2018-08-20 21:23:14.653763');
INSERT INTO `django_migrations` VALUES (17, 'goods', '0004_auto_20180817_2056', '2018-08-20 21:23:14.666720');
INSERT INTO `django_migrations` VALUES (18, 'goods', '0005_auto_20180818_0124', '2018-08-20 21:23:14.716059');
INSERT INTO `django_migrations` VALUES (19, 'sessions', '0001_initial', '2018-08-20 21:23:14.733196');
INSERT INTO `django_migrations` VALUES (20, 'trade', '0001_initial', '2018-08-20 21:23:14.794972');
INSERT INTO `django_migrations` VALUES (21, 'trade', '0002_auto_20180813_2047', '2018-08-20 21:23:14.973454');
INSERT INTO `django_migrations` VALUES (22, 'user_operation', '0001_initial', '2018-08-20 21:23:15.010048');
INSERT INTO `django_migrations` VALUES (23, 'user_operation', '0002_auto_20180813_2047', '2018-08-20 21:23:15.188918');
INSERT INTO `django_migrations` VALUES (24, 'users', '0002_auto_20180813_2207', '2018-08-20 21:23:15.310460');
INSERT INTO `django_migrations` VALUES (25, 'users', '0003_auto_20180813_2216', '2018-08-20 21:23:15.432915');
INSERT INTO `django_migrations` VALUES (26, 'users', '0004_auto_20180814_1403', '2018-08-20 21:23:15.588027');
INSERT INTO `django_migrations` VALUES (27, 'xadmin', '0001_initial', '2018-08-20 21:23:15.735655');
INSERT INTO `django_migrations` VALUES (28, 'xadmin', '0002_log', '2018-08-20 21:23:15.805722');
INSERT INTO `django_migrations` VALUES (29, 'xadmin', '0003_auto_20160715_0100', '2018-08-20 21:23:15.846756');
INSERT INTO `django_migrations` VALUES (30, 'user_operation', '0003_auto_20180821_1513', '2018-08-21 15:13:48.219964');
INSERT INTO `django_migrations` VALUES (31, 'user_operation', '0004_auto_20180824_1815', '2018-08-24 18:15:18.719137');
INSERT INTO `django_migrations` VALUES (32, 'users', '0005_auto_20180824_1815', '2018-08-24 18:15:19.119446');
INSERT INTO `django_migrations` VALUES (33, 'users', '0006_auto_20180824_1921', '2018-08-24 19:21:59.487771');
INSERT INTO `django_migrations` VALUES (34, 'user_operation', '0005_auto_20180825_0217', '2018-08-25 02:18:02.078754');
INSERT INTO `django_migrations` VALUES (35, 'user_operation', '0006_auto_20180825_0225', '2018-08-25 02:25:41.907749');
INSERT INTO `django_migrations` VALUES (36, 'user_operation', '0007_auto_20180825_0246', '2018-08-25 02:46:37.320615');
INSERT INTO `django_migrations` VALUES (37, 'user_operation', '0008_auto_20180825_0254', '2018-08-25 02:54:26.277392');
INSERT INTO `django_migrations` VALUES (38, 'user_operation', '0009_auto_20180825_0255', '2018-08-25 02:55:56.578876');
INSERT INTO `django_migrations` VALUES (39, 'user_operation', '0010_auto_20180825_1453', '2018-08-25 14:53:37.346075');
INSERT INTO `django_migrations` VALUES (40, 'user_operation', '0011_auto_20180825_1459', '2018-08-25 14:59:24.071604');
INSERT INTO `django_migrations` VALUES (41, 'user_operation', '0012_auto_20180825_1635', '2018-08-25 16:35:42.793913');
INSERT INTO `django_migrations` VALUES (42, 'trade', '0003_auto_20180827_1522', '2018-08-27 15:22:35.833921');
INSERT INTO `django_migrations` VALUES (43, 'trade', '0004_auto_20180827_1525', '2018-08-27 15:25:36.892470');
INSERT INTO `django_migrations` VALUES (44, 'trade', '0005_auto_20180827_1612', '2018-08-27 16:12:35.765197');
INSERT INTO `django_migrations` VALUES (45, 'trade', '0006_auto_20180827_1801', '2018-08-27 18:02:01.838824');
INSERT INTO `django_migrations` VALUES (46, 'trade', '0007_auto_20180827_1911', '2018-08-27 19:11:41.914302');
INSERT INTO `django_migrations` VALUES (47, 'user_operation', '0013_auto_20180827_2006', '2018-08-27 20:06:08.515835');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('av79t698a1mox4tnm8vm8f9onrjf4w8q', 'MDg5YzViOTE1YTE2NmRmZjZiMzU2OGE3ZjBkZWFiZjg0ZTRjODc0NDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk4Nzg3YWUxNmY1ZDVjOWQ5ZTFiOTIwZDgyNmVkYWIyNWY3NmNmOTYiLCJMSVNUX1FVRVJZIjpbWyJ0cmFkZSIsInNob3BwaW5nY2FydCJdLCIiXSwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIn0=', '2018-09-09 21:50:38.055853');
INSERT INTO `django_session` VALUES ('i8az9zj0llaag2qpg3cwl18szcioy6j3', 'OWU0NmQzNzk4YjkyZmNlYTRmYjAyNzQzMjFiZjM3YWUwM2U4OGUwMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjFmZTUxZjQ4MGQ3ZWQzODY0MGRmMzM0ZTM1ODlmODA5ZjExZjRmMWIiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQifQ==', '2018-09-04 15:51:02.975176');
INSERT INTO `django_session` VALUES ('u96qslogsr5maqs5ssztk71n7rd8lpcx', 'MWEzYzkyNGNmOGU4OWE1ZTYxZjdmZDQ4M2NkODEwNTRmMmY4NjU0ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjFmZTUxZjQ4MGQ3ZWQzODY0MGRmMzM0ZTM1ODlmODA5ZjExZjRmMWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIifQ==', '2018-09-04 16:19:56.778523');
INSERT INTO `django_session` VALUES ('uhig1825ayrv6l6emhpxudopdqk5m73a', 'M2JkZDkxYjBjNDA3ZjRjZTFlZDAwNTNhMGNkZjBlOWYzNjQwMTU3Yjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODc4N2FlMTZmNWQ1YzlkOWUxYjkyMGQ4MjZlZGFiMjVmNzZjZjk2IiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2018-09-04 15:10:43.780949');
COMMIT;

-- ----------------------------
-- Table structure for goods_banner
-- ----------------------------
DROP TABLE IF EXISTS `goods_banner`;
CREATE TABLE `goods_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_banner_goods_id_99e23129_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `goods_banner_goods_id_99e23129_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for goods_goods
-- ----------------------------
DROP TABLE IF EXISTS `goods_goods`;
CREATE TABLE `goods_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_sn` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `goods_size` varchar(10) COLLATE utf8mb4_general_ci,
  `goods_color` varchar(10) COLLATE utf8mb4_general_ci,
  `click_num` int(11) NOT NULL,
  `sold_num` int(11) NOT NULL,
  `fav_num` int(11) NOT NULL,
  `goods_num` int(11) DEFAULT NULL,
  `market_price` double NOT NULL,
  `shop_price` double NOT NULL,
  `goods_brief` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `goods_desc` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `ship_free` tinyint(1) NOT NULL,
  `goods_front_image` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_new` tinyint(1) NOT NULL,
  `is_hot` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goods_brand_id_d27ef2d8_fk_goods_goodscategorybrand_id` (`brand_id`),
  KEY `goods_goods_category_id_da3507dd_fk_goods_goodscategory_id` (`category_id`),
  CONSTRAINT `goods_goods_brand_id_d27ef2d8_fk_goods_goodscategorybrand_id` FOREIGN KEY (`brand_id`) REFERENCES `goods_goodscategorybrand` (`id`),
  CONSTRAINT `goods_goods_category_id_da3507dd_fk_goods_goodscategory_id` FOREIGN KEY (`category_id`) REFERENCES `goods_goodscategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of goods_goods
-- ----------------------------
BEGIN;
INSERT INTO `goods_goods` VALUES (1, '12234345', '新鲜水果甜蜜香脆单果约800克', 'OneSize', 'OneColor', 0, 0, 0, 0, 232, 156, '食用百香果可以增加胃部饱腹感，减少余热量的摄入，还可以吸附胆固醇和胆汁之类有机分子，抑制人体对脂肪的吸收。因此，长期食用有利于改善人体营养吸收结构，降低体内脂肪，塑造健康优美体态。', '<p></p><p></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/> </p>', 0, 'goods/images/1_P_1449024889889.jpg', 1, 1, '2018-08-20 21:23:29.000000', NULL, 20);
INSERT INTO `goods_goods` VALUES (2, '', '田然牛肉大黄瓜条生鲜牛肉冷冻真空黄牛', 'OneSize', 'OneColor', 0, 0, 0, 0, 106, 88, '前腿+后腿+羊排共8斤，原生态大山放牧羊羔，曾经的皇室贡品，央视推荐，2005年北京招待全球财金首脑。五层专用包装箱+真空包装+冰袋+保鲜箱+顺丰冷链发货，路途保质期8天', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/2_P_1448945810202.jpg', 0, 0, '2018-08-20 21:23:29.762423', NULL, 7);
INSERT INTO `goods_goods` VALUES (3, '', '酣畅家庭菲力牛排10片澳洲生鲜牛肉团购套餐', 'OneSize', 'OneColor', 0, 0, 0, 0, 286, 238, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/7_P_1448945104883.jpg', 0, 0, '2018-08-20 21:23:29.768051', NULL, 15);
INSERT INTO `goods_goods` VALUES (4, '', '日本蒜蓉粉丝扇贝270克6只装', 'OneSize', 'OneColor', 0, 0, 0, 0, 156, 108, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/47_P_1448946213263.jpg', 0, 0, '2018-08-20 21:23:29.772849', NULL, 20);
INSERT INTO `goods_goods` VALUES (5, '', '内蒙新鲜牛肉1斤清真生鲜牛肉火锅食材', 'OneSize', 'OneColor', 0, 0, 0, 0, 106, 88, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/10_P_1448944572085.jpg', 0, 0, '2018-08-20 21:23:29.777392', NULL, 7);
INSERT INTO `goods_goods` VALUES (6, '', '乌拉圭进口牛肉卷特级肥牛卷', 'OneSize', 'OneColor', 0, 0, 0, 0, 90, 75, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/4_P_1448945381985.jpg', 0, 0, '2018-08-20 21:23:29.783102', NULL, 21);
INSERT INTO `goods_goods` VALUES (7, '', '五星眼肉牛排套餐8片装原味原切生鲜牛肉', 'OneSize', 'OneColor', 0, 0, 0, 0, 150, 125, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/8_P_1448945032810.jpg', 0, 0, '2018-08-20 21:23:29.787807', NULL, 23);
INSERT INTO `goods_goods` VALUES (8, '', '澳洲进口120天谷饲牛仔骨4份原味生鲜', 'OneSize', 'OneColor', 0, 0, 0, 0, 31, 26, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/11_P_1448944388277.jpg', 0, 0, '2018-08-20 21:23:29.792476', NULL, 7);
INSERT INTO `goods_goods` VALUES (9, '', '潮香村澳洲进口牛排家庭团购套餐20片', 'OneSize', 'OneColor', 0, 0, 0, 0, 239, 199, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/6_P_1448945167279.jpg', 0, 0, '2018-08-20 21:23:29.798161', NULL, 22);
INSERT INTO `goods_goods` VALUES (10, '', '爱食派内蒙古呼伦贝尔冷冻生鲜牛腱子肉1000g', 'OneSize', 'OneColor', 0, 0, 0, 0, 202, 168, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/9_P_1448944791617.jpg', 0, 0, '2018-08-20 21:23:29.802902', NULL, 20);
INSERT INTO `goods_goods` VALUES (11, '', '澳洲进口牛尾巴300g新鲜肥牛肉', 'OneSize', 'OneColor', 0, 0, 0, 0, 306, 255, '新鲜羊羔肉整只共15斤，原生态大山放牧羊羔，曾经的皇室贡品，央视推荐，2005年北京招待全球财金首脑。五层专用包装箱+真空包装+冰袋+保鲜箱+顺丰冷链发货，路途保质期8天', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/3_P_1448945490837.jpg', 0, 0, '2018-08-20 21:23:29.809626', NULL, 2);
INSERT INTO `goods_goods` VALUES (12, '', '新疆巴尔鲁克生鲜牛排眼肉牛扒1200g', 'OneSize', 'OneColor', 0, 0, 0, 0, 126, 88, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/48_P_1448943988970.jpg', 0, 0, '2018-08-20 21:23:29.814350', NULL, 7);
INSERT INTO `goods_goods` VALUES (13, '', '澳洲进口安格斯牛切片上脑牛排1000g', 'OneSize', 'OneColor', 0, 0, 0, 0, 144, 120, '澳大利亚是国际公认的没有疯牛病和口蹄疫的国家。为了保持澳大利亚产品的高标准，澳大利亚牛肉业和各级政府共同努力简历了严格的标准和体系，以保证生产的整体化和产品的可追溯性', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/5_P_1448945270390.jpg', 0, 0, '2018-08-20 21:23:29.819954', NULL, 12);
INSERT INTO `goods_goods` VALUES (14, '', '帐篷出租', 'OneSize', 'OneColor', 0, 0, 0, 0, 120, 100, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'images/201705/goods_img/53_P_1495068879687.jpg', 0, 0, '2018-08-20 21:23:29.825729', NULL, 21);
INSERT INTO `goods_goods` VALUES (15, '', '52度茅台集团国隆双喜酒500mlx6', 'OneSize', 'OneColor', 0, 0, 0, 0, 23, 19, '贵州茅台酒厂（集团）保健酒业有限公司生产，是以“龙”字打头的酒水。中国龙文化上下8000年，源远而流长，龙的形象是一种符号、一种意绪、一种血肉相联的情感。', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/16_P_1448947194687.jpg', 0, 0, '2018-08-20 21:23:29.829201', NULL, 37);
INSERT INTO `goods_goods` VALUES (16, '', '52度水井坊臻酿八號500ml', 'OneSize', 'OneColor', 0, 0, 0, 0, 43, 36, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/14_P_1448947354031.jpg', 0, 0, '2018-08-20 21:23:29.832599', NULL, 36);
INSERT INTO `goods_goods` VALUES (17, '', '53度茅台仁酒500ml', 'OneSize', 'OneColor', 0, 0, 0, 0, 190, 158, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/12_P_1448947547989.jpg', 0, 0, '2018-08-20 21:23:29.837158', NULL, 32);
INSERT INTO `goods_goods` VALUES (18, '', '双响炮洋酒JimBeamwhiskey美国白占边', 'OneSize', 'OneColor', 0, 0, 0, 0, 38, 28, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/46_P_1448946598711.jpg', 0, 0, '2018-08-20 21:23:29.840630', NULL, 29);
INSERT INTO `goods_goods` VALUES (19, '', '西夫拉姆进口洋酒小酒版', 'OneSize', 'OneColor', 0, 0, 0, 0, 55, 46, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/21_P_1448946793276.jpg', 0, 0, '2018-08-20 21:23:29.845232', NULL, 36);
INSERT INTO `goods_goods` VALUES (20, '', '茅台53度飞天茅台500ml', 'OneSize', 'OneColor', 0, 0, 0, 0, 22, 18, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/15_P_1448947257324.jpg', 0, 0, '2018-08-20 21:23:29.849874', NULL, 30);
INSERT INTO `goods_goods` VALUES (21, '', '52度兰陵·紫气东来1600mL山东名酒', 'OneSize', 'OneColor', 0, 0, 0, 0, 42, 35, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/13_P_1448947460386.jpg', 0, 0, '2018-08-20 21:23:29.854515', NULL, 29);
INSERT INTO `goods_goods` VALUES (22, '', 'JohnnieWalker尊尼获加黑牌威士忌', 'OneSize', 'OneColor', 0, 0, 0, 0, 24, 20, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/50_P_1448946543091.jpg', 0, 0, '2018-08-20 21:23:29.860168', NULL, 36);
INSERT INTO `goods_goods` VALUES (23, '', '人头马CLUB特优香槟干邑350ml', 'OneSize', 'OneColor', 0, 0, 0, 0, 31, 26, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/51_P_1448946466595.jpg', 0, 0, '2018-08-20 21:23:29.865130', NULL, 30);
INSERT INTO `goods_goods` VALUES (24, '', '张裕干红葡萄酒750ml*6支', 'OneSize', 'OneColor', 0, 0, 0, 0, 54, 45, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/17_P_1448947102246.jpg', 0, 0, '2018-08-20 21:23:29.869723', NULL, 31);
INSERT INTO `goods_goods` VALUES (25, '', '原瓶原装进口洋酒烈酒法国云鹿XO白兰地', 'OneSize', 'OneColor', 0, 0, 0, 0, 46, 38, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/20_P_1448946850602.jpg', 0, 0, '2018-08-20 21:23:29.873283', NULL, 29);
INSERT INTO `goods_goods` VALUES (26, '', '法国原装进口圣贝克干红葡萄酒750ml', 'OneSize', 'OneColor', 0, 0, 0, 0, 82, 68, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/19_P_1448946951581.jpg', 0, 0, '2018-08-20 21:23:29.876792', NULL, 25);
INSERT INTO `goods_goods` VALUES (27, '', '法国百利威干红葡萄酒AOP级6支装', 'OneSize', 'OneColor', 0, 0, 0, 0, 67, 56, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/18_P_1448947011435.jpg', 0, 0, '2018-08-20 21:23:29.881438', NULL, 25);
INSERT INTO `goods_goods` VALUES (28, '', '芝华士12年苏格兰威士忌700ml', 'OneSize', 'OneColor', 0, 0, 0, 0, 71, 59, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/22_P_1448946729629.jpg', 0, 0, '2018-08-20 21:23:29.884820', NULL, 30);
INSERT INTO `goods_goods` VALUES (29, '', '深蓝伏特加巴维兰利口酒送预调酒', 'OneSize', 'OneColor', 0, 0, 0, 0, 31, 18, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/45_P_1448946661303.jpg', 0, 0, '2018-08-20 21:23:29.888278', NULL, 36);
INSERT INTO `goods_goods` VALUES (30, '', '赣南脐橙特级果10斤装', 'OneSize', 'OneColor', 0, 0, 0, 0, 43, 36, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/32_P_1448948525620.jpg', 0, 0, '2018-08-20 21:23:29.891687', NULL, 62);
INSERT INTO `goods_goods` VALUES (31, '', '泰国菠萝蜜16-18斤1个装', 'OneSize', 'OneColor', 0, 0, 0, 0, 11, 9, '【懒人吃法】菠萝蜜果肉，冰袋保鲜，收货就吃，冰爽Q脆甜，2斤装，全国顺丰空运包邮，发出后48小时内可达，一线城市基本隔天可达', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/30_P_1448948663450.jpg', 0, 0, '2018-08-20 21:23:29.895137', NULL, 66);
INSERT INTO `goods_goods` VALUES (32, '', '四川双流草莓新鲜水果礼盒2盒', 'OneSize', 'OneColor', 0, 0, 0, 0, 22, 18, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/31_P_1448948598947.jpg', 0, 0, '2018-08-20 21:23:29.900915', NULL, 70);
INSERT INTO `goods_goods` VALUES (33, '', '新鲜头茬非洲冰草冰菜', 'OneSize', 'OneColor', 0, 0, 0, 0, 67, 56, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/35_P_1448948333610.jpg', 0, 0, '2018-08-20 21:23:29.905470', NULL, 58);
INSERT INTO `goods_goods` VALUES (34, '', '仿真蔬菜水果果蔬菜模型', 'OneSize', 'OneColor', 0, 0, 0, 0, 6, 5, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/36_P_1448948234405.jpg', 0, 0, '2018-08-20 21:23:29.910627', NULL, 58);
INSERT INTO `goods_goods` VALUES (35, '', '现摘芭乐番石榴台湾珍珠芭乐', 'OneSize', 'OneColor', 0, 0, 0, 0, 28, 23, '海南产精品释迦果,\n        释迦是水果中的贵族,\n        产量少,\n        味道很甜,\n        奶香十足,\n        非常可口,\n        果裹果园顺丰空运,\n        保证新鲜.果子个大,\n        一斤1-2个左右,\n        大个头的果子更尽兴!\n        ', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/33_P_1448948479966.jpg', 0, 0, '2018-08-20 21:23:29.915251', NULL, 62);
INSERT INTO `goods_goods` VALUES (36, '', '潍坊萝卜5斤/箱礼盒', 'OneSize', 'OneColor', 0, 0, 0, 0, 46, 38, '脐橙规格是65-90MM左右（标准果果径平均70MM左右，精品果果径平均80MM左右），一斤大概有2-4个左右，脐橙产自江西省赣州市信丰县安西镇，全过程都是采用农家有机肥种植，生态天然', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/34_P_1448948399009.jpg', 0, 0, '2018-08-20 21:23:29.919868', NULL, 70);
INSERT INTO `goods_goods` VALUES (37, '', '休闲零食膨化食品焦糖/奶油/椒麻味', 'OneSize', 'OneColor', 0, 0, 0, 0, 154, 99, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/43_P_1448948762645.jpg', 0, 0, '2018-08-20 21:23:29.923393', NULL, 74);
INSERT INTO `goods_goods` VALUES (38, '', '蒙牛未来星儿童成长牛奶骨力型190ml*15盒', 'OneSize', 'OneColor', 0, 0, 0, 0, 84, 70, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/38_P_1448949220255.jpg', 0, 0, '2018-08-20 21:23:29.926863', NULL, 105);
INSERT INTO `goods_goods` VALUES (39, '', '蒙牛特仑苏有机奶250ml×12盒', 'OneSize', 'OneColor', 0, 0, 0, 0, 70, 32, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/44_P_1448948850187.jpg', 0, 0, '2018-08-20 21:23:29.930885', NULL, 103);
INSERT INTO `goods_goods` VALUES (40, '', '1元支付测试商品', 'OneSize', 'OneColor', 0, 0, 0, 0, 1, 1, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'images/201511/goods_img/49_P_1448162819889.jpg', 0, 0, '2018-08-20 21:23:29.935159', NULL, 102);
INSERT INTO `goods_goods` VALUES (41, '123234234', '德运全脂新鲜纯牛奶1L*10盒装整箱', 'OneSize', 'OneColor', 0, 0, 0, 0, 70, 58, '德运全脂新鲜纯牛奶1L*10盒装整箱德运全脂新鲜纯牛奶1L*10盒装整箱德运全脂新鲜纯牛奶1L*10盒装整箱德运全脂新鲜纯牛奶1L*10盒装整箱', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/> </p>', 1, 'goods/images/40_P_1448949038702.jpg', 1, 1, '2018-08-20 21:23:29.000000', NULL, 103);
INSERT INTO `goods_goods` VALUES (42, '', '木糖醇红枣早餐奶即食豆奶粉538g', 'OneSize', 'OneColor', 0, 0, 0, 0, 38, 32, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/39_P_1448949115481.jpg', 0, 0, '2018-08-20 21:23:29.942868', NULL, 106);
INSERT INTO `goods_goods` VALUES (43, '', '高钙液体奶200ml*24盒', 'OneSize', 'OneColor', 0, 0, 0, 0, 26, 22, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/41_P_1448948980358.jpg', 0, 0, '2018-08-20 21:23:29.947034', NULL, 107);
INSERT INTO `goods_goods` VALUES (44, '', '新西兰进口全脂奶粉900g', 'OneSize', 'OneColor', 0, 0, 0, 0, 720, 600, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/37_P_1448949284365.jpg', 0, 0, '2018-08-20 21:23:29.950733', NULL, 104);
INSERT INTO `goods_goods` VALUES (45, '', '伊利官方直营全脂营养舒化奶250ml*12盒*2提', 'OneSize', 'OneColor', 0, 0, 0, 0, 43, 36, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/42_P_1448948895193.jpg', 0, 0, '2018-08-20 21:23:29.954236', NULL, 103);
INSERT INTO `goods_goods` VALUES (46, '', '维纳斯橄榄菜籽油5L/桶', 'OneSize', 'OneColor', 0, 0, 0, 0, 187, 156, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/27_P_1448947771805.jpg', 0, 0, '2018-08-20 21:23:29.957844', NULL, 51);
INSERT INTO `goods_goods` VALUES (47, '', '糙米450gx3包粮油米面', 'OneSize', 'OneColor', 0, 0, 0, 0, 18, 15, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/23_P_1448948070348.jpg', 0, 0, '2018-08-20 21:23:29.962233', NULL, 41);
INSERT INTO `goods_goods` VALUES (48, '', '精炼一级大豆油5L色拉油粮油食用油', 'OneSize', 'OneColor', 0, 0, 0, 0, 54, 45, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/26_P_1448947825754.jpg', 0, 0, '2018-08-20 21:23:29.966122', NULL, 56);
INSERT INTO `goods_goods` VALUES (49, '', '橄榄玉米油5L*2桶', 'OneSize', 'OneColor', 0, 0, 0, 0, 31, 26, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/28_P_1448947699948.jpg', 0, 0, '2018-08-20 21:23:29.969976', NULL, 54);
INSERT INTO `goods_goods` VALUES (50, '', '山西黑米农家黑米4斤', 'OneSize', 'OneColor', 0, 0, 0, 0, 11, 9, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/24_P_1448948023823.jpg', 0, 0, '2018-08-20 21:23:29.975098', NULL, 55);
INSERT INTO `goods_goods` VALUES (51, '2353454', '稻园牌稻米油粮油米糠油绿色植物油', 'OneSize', 'OneColor', 0, 0, 0, 0, 14, 12, '稻园牌稻米油粮油米糠油绿色植物油稻园牌稻米油粮油米糠油绿色植物油稻园牌稻米油粮油米糠油绿色植物油稻园牌稻米油粮油米糠油绿色植物油稻园牌稻米油粮油米糠油绿色植物油稻园牌稻米油粮油米糠油绿色植物油', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/> </p>', 1, 'goods/images/25_P_1448947875346.jpg', 1, 1, '2018-08-20 21:23:29.000000', NULL, 47);
INSERT INTO `goods_goods` VALUES (52, '', '融氏纯玉米胚芽油5l桶', 'OneSize', 'OneColor', 0, 0, 0, 0, 14, 12, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0, 'goods/images/29_P_1448947631994.jpg', 0, 0, '2018-08-20 21:23:29.984770', NULL, 41);
COMMIT;

-- ----------------------------
-- Table structure for goods_goodscategory
-- ----------------------------
DROP TABLE IF EXISTS `goods_goodscategory`;
CREATE TABLE `goods_goodscategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `code` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `desc` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `category_type` int(11) NOT NULL,
  `is_tab` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `parent_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goodscategory_parent_category_id_ccec2509_fk_goods_goo` (`parent_category_id`),
  CONSTRAINT `goods_goodscategory_parent_category_id_ccec2509_fk_goods_goo` FOREIGN KEY (`parent_category_id`) REFERENCES `goods_goodscategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of goods_goodscategory
-- ----------------------------
BEGIN;
INSERT INTO `goods_goodscategory` VALUES (1, '生鲜食品', 'sxsp', 'Some Category Description...', 1, 1, '2018-08-20 21:23:25.000000', NULL);
INSERT INTO `goods_goodscategory` VALUES (2, '精品肉类', 'jprl', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.335133', 1);
INSERT INTO `goods_goodscategory` VALUES (3, '羊肉', 'yr', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.338307', 2);
INSERT INTO `goods_goodscategory` VALUES (4, '禽类', 'ql', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.340155', 2);
INSERT INTO `goods_goodscategory` VALUES (5, '猪肉', 'zr', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.341900', 2);
INSERT INTO `goods_goodscategory` VALUES (6, '牛肉', 'nr', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.343527', 2);
INSERT INTO `goods_goodscategory` VALUES (7, '海鲜水产', 'hxsc', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.344965', 1);
INSERT INTO `goods_goodscategory` VALUES (8, '参鲍', 'cb', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.346410', 7);
INSERT INTO `goods_goodscategory` VALUES (9, '鱼', 'yu', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.347799', 7);
INSERT INTO `goods_goodscategory` VALUES (10, '虾', 'xia', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.349006', 7);
INSERT INTO `goods_goodscategory` VALUES (11, '蟹/贝', 'xb', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.350271', 7);
INSERT INTO `goods_goodscategory` VALUES (12, '蛋制品', 'dzp', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.351418', 1);
INSERT INTO `goods_goodscategory` VALUES (13, '松花蛋/咸鸭蛋', 'xhd_xyd', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.352659', 12);
INSERT INTO `goods_goodscategory` VALUES (14, '鸡蛋', 'jd', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.353803', 12);
INSERT INTO `goods_goodscategory` VALUES (15, '叶菜类', 'ycl', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.354958', 1);
INSERT INTO `goods_goodscategory` VALUES (16, '生菜', 'sc', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.356031', 15);
INSERT INTO `goods_goodscategory` VALUES (17, '菠菜', 'bc', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.357158', 15);
INSERT INTO `goods_goodscategory` VALUES (18, '圆椒', 'yj', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.358297', 15);
INSERT INTO `goods_goodscategory` VALUES (19, '西兰花', 'xlh', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.359393', 15);
INSERT INTO `goods_goodscategory` VALUES (20, '根茎类', 'gjl', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.360582', 1);
INSERT INTO `goods_goodscategory` VALUES (21, '茄果类', 'qgl', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.361728', 1);
INSERT INTO `goods_goodscategory` VALUES (22, '菌菇类', 'jgl', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.362845', 1);
INSERT INTO `goods_goodscategory` VALUES (23, '进口生鲜', 'jksx', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.363930', 1);
INSERT INTO `goods_goodscategory` VALUES (24, '酒水饮料', 'jsyl', 'Some Category Description...', 1, 1, '2018-08-20 21:23:25.000000', NULL);
INSERT INTO `goods_goodscategory` VALUES (25, '白酒', 'bk', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.366158', 24);
INSERT INTO `goods_goodscategory` VALUES (26, '五粮液', 'wly', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.367257', 25);
INSERT INTO `goods_goodscategory` VALUES (27, '泸州老窖', 'lzlj', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.368416', 25);
INSERT INTO `goods_goodscategory` VALUES (28, '茅台', 'mt', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.369513', 25);
INSERT INTO `goods_goodscategory` VALUES (29, '葡萄酒', 'ptj', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.370712', 24);
INSERT INTO `goods_goodscategory` VALUES (30, '洋酒', 'yj', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.371822', 24);
INSERT INTO `goods_goodscategory` VALUES (31, '啤酒', 'pj', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.372916', 24);
INSERT INTO `goods_goodscategory` VALUES (32, '其他酒品', 'qtjp', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.374022', 24);
INSERT INTO `goods_goodscategory` VALUES (33, '其他品牌', 'qtpp', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.375166', 32);
INSERT INTO `goods_goodscategory` VALUES (34, '黄酒', 'hj', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.376318', 32);
INSERT INTO `goods_goodscategory` VALUES (35, '养生酒', 'ysj', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.377404', 32);
INSERT INTO `goods_goodscategory` VALUES (36, '饮料/水', 'yls', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.378585', 24);
INSERT INTO `goods_goodscategory` VALUES (37, '红酒', 'hj', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.379721', 24);
INSERT INTO `goods_goodscategory` VALUES (38, '白兰地', 'bld', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.380818', 37);
INSERT INTO `goods_goodscategory` VALUES (39, '威士忌', 'wsj', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.381901', 37);
INSERT INTO `goods_goodscategory` VALUES (40, '粮油副食', '粮油副食', 'Some Category Description...', 1, 0, '2018-08-20 21:23:25.383074', NULL);
INSERT INTO `goods_goodscategory` VALUES (41, '食用油', '食用油', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.384210', 40);
INSERT INTO `goods_goodscategory` VALUES (42, '其他食用油', '其他食用油', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.385384', 41);
INSERT INTO `goods_goodscategory` VALUES (43, '菜仔油', '菜仔油', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.386565', 41);
INSERT INTO `goods_goodscategory` VALUES (44, '花生油', '花生油', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.387670', 41);
INSERT INTO `goods_goodscategory` VALUES (45, '橄榄油', '橄榄油', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.388781', 41);
INSERT INTO `goods_goodscategory` VALUES (46, '礼盒', '礼盒', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.389881', 41);
INSERT INTO `goods_goodscategory` VALUES (47, '米面杂粮', '米面杂粮', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.391036', 40);
INSERT INTO `goods_goodscategory` VALUES (48, '面粉/面条', '面粉/面条', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.392147', 47);
INSERT INTO `goods_goodscategory` VALUES (49, '大米', '大米', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.393277', 47);
INSERT INTO `goods_goodscategory` VALUES (50, '意大利面', '意大利面', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.394403', 47);
INSERT INTO `goods_goodscategory` VALUES (51, '厨房调料', '厨房调料', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.395500', 40);
INSERT INTO `goods_goodscategory` VALUES (52, '调味油/汁', '调味油/汁', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.396613', 51);
INSERT INTO `goods_goodscategory` VALUES (53, '酱油/醋', '酱油/醋', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.397735', 51);
INSERT INTO `goods_goodscategory` VALUES (54, '南北干货', '南北干货', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.398875', 40);
INSERT INTO `goods_goodscategory` VALUES (55, '方便速食', '方便速食', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.400062', 40);
INSERT INTO `goods_goodscategory` VALUES (56, '调味品', '调味品', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.401212', 40);
INSERT INTO `goods_goodscategory` VALUES (57, '蔬菜水果', '蔬菜水果', 'Some Category Description...', 1, 1, '2018-08-20 21:23:25.000000', NULL);
INSERT INTO `goods_goodscategory` VALUES (58, '有机蔬菜', '有机蔬菜', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.403419', 57);
INSERT INTO `goods_goodscategory` VALUES (59, '西红柿', '西红柿', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.404547', 58);
INSERT INTO `goods_goodscategory` VALUES (60, '韭菜', '韭菜', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.405705', 58);
INSERT INTO `goods_goodscategory` VALUES (61, '青菜', '青菜', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.406805', 58);
INSERT INTO `goods_goodscategory` VALUES (62, '精选蔬菜', '精选蔬菜', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.407932', 57);
INSERT INTO `goods_goodscategory` VALUES (63, '甘蓝', '甘蓝', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.409118', 62);
INSERT INTO `goods_goodscategory` VALUES (64, '胡萝卜', '胡萝卜', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.410321', 62);
INSERT INTO `goods_goodscategory` VALUES (65, '黄瓜', '黄瓜', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.411471', 62);
INSERT INTO `goods_goodscategory` VALUES (66, '进口水果', '进口水果', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.412596', 57);
INSERT INTO `goods_goodscategory` VALUES (67, '火龙果', '火龙果', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.413755', 66);
INSERT INTO `goods_goodscategory` VALUES (68, '菠萝蜜', '菠萝蜜', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.414929', 66);
INSERT INTO `goods_goodscategory` VALUES (69, '奇异果', '奇异果', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.416028', 66);
INSERT INTO `goods_goodscategory` VALUES (70, '国产水果', '国产水果', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.417244', 57);
INSERT INTO `goods_goodscategory` VALUES (71, '水果礼盒', '水果礼盒', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.418621', 70);
INSERT INTO `goods_goodscategory` VALUES (72, '苹果', '苹果', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.419901', 70);
INSERT INTO `goods_goodscategory` VALUES (73, '雪梨', '雪梨', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.421120', 70);
INSERT INTO `goods_goodscategory` VALUES (74, '休闲食品', '休闲食品', 'Some Category Description...', 1, 0, '2018-08-20 21:23:25.422243', NULL);
INSERT INTO `goods_goodscategory` VALUES (75, '休闲零食', '休闲零食', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.423338', 74);
INSERT INTO `goods_goodscategory` VALUES (76, '果冻', '果冻', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.424545', 75);
INSERT INTO `goods_goodscategory` VALUES (77, '枣类', '枣类', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.425856', 75);
INSERT INTO `goods_goodscategory` VALUES (78, '蜜饯', '蜜饯', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.427040', 75);
INSERT INTO `goods_goodscategory` VALUES (79, '肉类零食', '肉类零食', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.428234', 75);
INSERT INTO `goods_goodscategory` VALUES (80, '坚果炒货', '坚果炒货', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.429362', 75);
INSERT INTO `goods_goodscategory` VALUES (81, '糖果', '糖果', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.430605', 74);
INSERT INTO `goods_goodscategory` VALUES (82, '创意喜糖', '创意喜糖', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.431757', 81);
INSERT INTO `goods_goodscategory` VALUES (83, '口香糖', '口香糖', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.432825', 81);
INSERT INTO `goods_goodscategory` VALUES (84, '软糖', '软糖', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.433989', 81);
INSERT INTO `goods_goodscategory` VALUES (85, '棒棒糖', '棒棒糖', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.435214', 81);
INSERT INTO `goods_goodscategory` VALUES (86, '巧克力', '巧克力', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.436489', 74);
INSERT INTO `goods_goodscategory` VALUES (87, '夹心巧克力', '夹心巧克力', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.437765', 86);
INSERT INTO `goods_goodscategory` VALUES (88, '白巧克力', '白巧克力', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.439257', 86);
INSERT INTO `goods_goodscategory` VALUES (89, '松露巧克力', '松露巧克力', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.440577', 86);
INSERT INTO `goods_goodscategory` VALUES (90, '黑巧克力', '黑巧克力', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.441941', 86);
INSERT INTO `goods_goodscategory` VALUES (91, '肉干肉脯/豆干', '肉干肉脯/豆干', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.443344', 74);
INSERT INTO `goods_goodscategory` VALUES (92, '牛肉干', '牛肉干', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.444636', 91);
INSERT INTO `goods_goodscategory` VALUES (93, '猪肉脯', '猪肉脯', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.445819', 91);
INSERT INTO `goods_goodscategory` VALUES (94, '牛肉粒', '牛肉粒', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.447095', 91);
INSERT INTO `goods_goodscategory` VALUES (95, '猪肉干', '猪肉干', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.448431', 91);
INSERT INTO `goods_goodscategory` VALUES (96, '鱿鱼丝/鱼干', '鱿鱼丝/鱼干', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.449620', 74);
INSERT INTO `goods_goodscategory` VALUES (97, '鱿鱼足', '鱿鱼足', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.450832', 96);
INSERT INTO `goods_goodscategory` VALUES (98, '鱿鱼丝', '鱿鱼丝', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.452012', 96);
INSERT INTO `goods_goodscategory` VALUES (99, '墨鱼/乌贼', '墨鱼/乌贼', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.453142', 96);
INSERT INTO `goods_goodscategory` VALUES (100, '鱿鱼仔', '鱿鱼仔', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.454295', 96);
INSERT INTO `goods_goodscategory` VALUES (101, '鱿鱼片', '鱿鱼片', 'Some Category Description...', 3, 0, '2018-08-20 21:23:25.455422', 96);
INSERT INTO `goods_goodscategory` VALUES (102, '奶类食品', '奶类食品', 'Some Category Description...', 1, 0, '2018-08-20 21:23:25.456546', NULL);
INSERT INTO `goods_goodscategory` VALUES (103, '进口奶品', '进口奶品', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.457644', 102);
INSERT INTO `goods_goodscategory` VALUES (104, '国产奶品', '国产奶品', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.458760', 102);
INSERT INTO `goods_goodscategory` VALUES (105, '奶粉', '奶粉', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.459921', 102);
INSERT INTO `goods_goodscategory` VALUES (106, '有机奶', '有机奶', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.461438', 102);
INSERT INTO `goods_goodscategory` VALUES (107, '原料奶', '原料奶', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.462755', 102);
INSERT INTO `goods_goodscategory` VALUES (108, '天然干货', '天然干货', 'Some Category Description...', 1, 1, '2018-08-20 21:23:25.000000', NULL);
INSERT INTO `goods_goodscategory` VALUES (109, '菌菇类', '菌菇类', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.465026', 108);
INSERT INTO `goods_goodscategory` VALUES (110, '腌干海产', '腌干海产', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.466187', 108);
INSERT INTO `goods_goodscategory` VALUES (111, '汤料', '汤料', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.467335', 108);
INSERT INTO `goods_goodscategory` VALUES (112, '豆类', '豆类', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.468469', 108);
INSERT INTO `goods_goodscategory` VALUES (113, '干菜/菜干', '干菜/菜干', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.469579', 108);
INSERT INTO `goods_goodscategory` VALUES (114, '干果/果干', '干果/果干', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.470699', 108);
INSERT INTO `goods_goodscategory` VALUES (115, '豆制品', '豆制品', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.471838', 108);
INSERT INTO `goods_goodscategory` VALUES (116, '腊味', '腊味', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.472932', 108);
INSERT INTO `goods_goodscategory` VALUES (117, '精选茗茶', '精选茗茶', 'Some Category Description...', 1, 1, '2018-08-20 21:23:25.000000', NULL);
INSERT INTO `goods_goodscategory` VALUES (118, '白茶', '白茶', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.475511', 117);
INSERT INTO `goods_goodscategory` VALUES (119, '红茶', '红茶', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.476683', 117);
INSERT INTO `goods_goodscategory` VALUES (120, '绿茶', '绿茶', 'Some Category Description...', 2, 0, '2018-08-20 21:23:25.477800', 117);
COMMIT;

-- ----------------------------
-- Table structure for goods_goodscategorybrand
-- ----------------------------
DROP TABLE IF EXISTS `goods_goodscategorybrand`;
CREATE TABLE `goods_goodscategorybrand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `desc` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goodscategoryb_category_id_528934b3_fk_goods_goo` (`category_id`),
  CONSTRAINT `goods_goodscategoryb_category_id_528934b3_fk_goods_goo` FOREIGN KEY (`category_id`) REFERENCES `goods_goodscategory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for goods_goodsimage
-- ----------------------------
DROP TABLE IF EXISTS `goods_goodsimage`;
CREATE TABLE `goods_goodsimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image_url` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goodsimage_goods_id_08cb23b1_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `goods_goodsimage_goods_id_08cb23b1_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of goods_goodsimage
-- ----------------------------
BEGIN;
INSERT INTO `goods_goodsimage` VALUES (1, 'goods/images/1_P_1449024889889.jpg', NULL, '2018-08-20 21:23:29.751933', 1);
INSERT INTO `goods_goodsimage` VALUES (2, 'goods/images/1_P_1449024889264.jpg', NULL, '2018-08-20 21:23:29.755665', 1);
INSERT INTO `goods_goodsimage` VALUES (3, '3.jpg', NULL, '2018-08-20 21:23:29.757671', 1);
INSERT INTO `goods_goodsimage` VALUES (4, '1_P_1449024889287.jpg', NULL, '2018-08-20 21:23:29.759415', 1);
INSERT INTO `goods_goodsimage` VALUES (5, '1_P_1449024889018.jpg', NULL, '2018-08-20 21:23:29.760988', 1);
INSERT INTO `goods_goodsimage` VALUES (6, 'goods/images/2_P_1448945810202.jpg', NULL, '2018-08-20 21:23:29.765514', 2);
INSERT INTO `goods_goodsimage` VALUES (7, 'goods/images/2_P_1448945810814.jpg', NULL, '2018-08-20 21:23:29.766899', 2);
INSERT INTO `goods_goodsimage` VALUES (8, 'goods/images/7_P_1448945104883.jpg', NULL, '2018-08-20 21:23:29.770478', 3);
INSERT INTO `goods_goodsimage` VALUES (9, 'goods/images/7_P_1448945104734.jpg', NULL, '2018-08-20 21:23:29.771631', 3);
INSERT INTO `goods_goodsimage` VALUES (10, 'goods/images/47_P_1448946213263.jpg', NULL, '2018-08-20 21:23:29.775169', 4);
INSERT INTO `goods_goodsimage` VALUES (11, 'goods/images/47_P_1448946213157.jpg', NULL, '2018-08-20 21:23:29.776260', 4);
INSERT INTO `goods_goodsimage` VALUES (12, 'goods/images/10_P_1448944572085.jpg', NULL, '2018-08-20 21:23:29.779733', 5);
INSERT INTO `goods_goodsimage` VALUES (13, 'goods/images/10_P_1448944572532.jpg', NULL, '2018-08-20 21:23:29.780894', 5);
INSERT INTO `goods_goodsimage` VALUES (14, 'goods/images/10_P_1448944572872.jpg', NULL, '2018-08-20 21:23:29.782008', 5);
INSERT INTO `goods_goodsimage` VALUES (15, 'goods/images/4_P_1448945381985.jpg', NULL, '2018-08-20 21:23:29.785508', 6);
INSERT INTO `goods_goodsimage` VALUES (16, 'goods/images/4_P_1448945381013.jpg', NULL, '2018-08-20 21:23:29.786657', 6);
INSERT INTO `goods_goodsimage` VALUES (17, 'goods/images/8_P_1448945032810.jpg', NULL, '2018-08-20 21:23:29.790219', 7);
INSERT INTO `goods_goodsimage` VALUES (18, 'goods/images/8_P_1448945032646.jpg', NULL, '2018-08-20 21:23:29.791340', 7);
INSERT INTO `goods_goodsimage` VALUES (19, 'goods/images/11_P_1448944388277.jpg', NULL, '2018-08-20 21:23:29.794838', 8);
INSERT INTO `goods_goodsimage` VALUES (20, 'goods/images/11_P_1448944388034.jpg', NULL, '2018-08-20 21:23:29.795960', 8);
INSERT INTO `goods_goodsimage` VALUES (21, 'goods/images/11_P_1448944388201.jpg', NULL, '2018-08-20 21:23:29.797053', 8);
INSERT INTO `goods_goodsimage` VALUES (22, 'goods/images/6_P_1448945167279.jpg', NULL, '2018-08-20 21:23:29.800675', 9);
INSERT INTO `goods_goodsimage` VALUES (23, 'goods/images/6_P_1448945167015.jpg', NULL, '2018-08-20 21:23:29.801817', 9);
INSERT INTO `goods_goodsimage` VALUES (24, 'goods/images/9_P_1448944791617.jpg', NULL, '2018-08-20 21:23:29.805227', 10);
INSERT INTO `goods_goodsimage` VALUES (25, 'goods/images/9_P_1448944791129.jpg', NULL, '2018-08-20 21:23:29.806356', 10);
INSERT INTO `goods_goodsimage` VALUES (26, 'goods/images/9_P_1448944791077.jpg', NULL, '2018-08-20 21:23:29.807439', 10);
INSERT INTO `goods_goodsimage` VALUES (27, 'goods/images/9_P_1448944791229.jpg', NULL, '2018-08-20 21:23:29.808516', 10);
INSERT INTO `goods_goodsimage` VALUES (28, 'goods/images/3_P_1448945490837.jpg', NULL, '2018-08-20 21:23:29.812144', 11);
INSERT INTO `goods_goodsimage` VALUES (29, 'goods/images/3_P_1448945490084.jpg', NULL, '2018-08-20 21:23:29.813269', 11);
INSERT INTO `goods_goodsimage` VALUES (30, 'goods/images/48_P_1448943988970.jpg', NULL, '2018-08-20 21:23:29.816616', 12);
INSERT INTO `goods_goodsimage` VALUES (31, 'goods/images/48_P_1448943988898.jpg', NULL, '2018-08-20 21:23:29.817697', 12);
INSERT INTO `goods_goodsimage` VALUES (32, 'goods/images/48_P_1448943988439.jpg', NULL, '2018-08-20 21:23:29.818846', 12);
INSERT INTO `goods_goodsimage` VALUES (33, 'goods/images/5_P_1448945270390.jpg', NULL, '2018-08-20 21:23:29.822417', 13);
INSERT INTO `goods_goodsimage` VALUES (34, 'goods/images/5_P_1448945270067.jpg', NULL, '2018-08-20 21:23:29.823487', 13);
INSERT INTO `goods_goodsimage` VALUES (35, 'goods/images/5_P_1448945270432.jpg', NULL, '2018-08-20 21:23:29.824555', 13);
INSERT INTO `goods_goodsimage` VALUES (36, 'images/201705/goods_img/53_P_1495068879687.jpg', NULL, '2018-08-20 21:23:29.828098', 14);
INSERT INTO `goods_goodsimage` VALUES (37, 'goods/images/16_P_1448947194687.jpg', NULL, '2018-08-20 21:23:29.831521', 15);
INSERT INTO `goods_goodsimage` VALUES (38, 'goods/images/14_P_1448947354031.jpg', NULL, '2018-08-20 21:23:29.834926', 16);
INSERT INTO `goods_goodsimage` VALUES (39, 'goods/images/14_P_1448947354433.jpg', NULL, '2018-08-20 21:23:29.836050', 16);
INSERT INTO `goods_goodsimage` VALUES (40, 'goods/images/12_P_1448947547989.jpg', NULL, '2018-08-20 21:23:29.839511', 17);
INSERT INTO `goods_goodsimage` VALUES (41, 'goods/images/46_P_1448946598711.jpg', NULL, '2018-08-20 21:23:29.842976', 18);
INSERT INTO `goods_goodsimage` VALUES (42, 'goods/images/46_P_1448946598301.jpg', NULL, '2018-08-20 21:23:29.844101', 18);
INSERT INTO `goods_goodsimage` VALUES (43, 'goods/images/21_P_1448946793276.jpg', NULL, '2018-08-20 21:23:29.847611', 19);
INSERT INTO `goods_goodsimage` VALUES (44, 'goods/images/21_P_1448946793153.jpg', NULL, '2018-08-20 21:23:29.848739', 19);
INSERT INTO `goods_goodsimage` VALUES (45, 'goods/images/15_P_1448947257324.jpg', NULL, '2018-08-20 21:23:29.852243', 20);
INSERT INTO `goods_goodsimage` VALUES (46, 'goods/images/15_P_1448947257580.jpg', NULL, '2018-08-20 21:23:29.853375', 20);
INSERT INTO `goods_goodsimage` VALUES (47, 'goods/images/13_P_1448947460386.jpg', NULL, '2018-08-20 21:23:29.856806', 21);
INSERT INTO `goods_goodsimage` VALUES (48, 'goods/images/13_P_1448947460276.jpg', NULL, '2018-08-20 21:23:29.857922', 21);
INSERT INTO `goods_goodsimage` VALUES (49, 'goods/images/13_P_1448947460353.jpg', NULL, '2018-08-20 21:23:29.859096', 21);
INSERT INTO `goods_goodsimage` VALUES (50, 'goods/images/50_P_1448946543091.jpg', NULL, '2018-08-20 21:23:29.862571', 22);
INSERT INTO `goods_goodsimage` VALUES (51, 'goods/images/50_P_1448946542182.jpg', NULL, '2018-08-20 21:23:29.864016', 22);
INSERT INTO `goods_goodsimage` VALUES (52, 'goods/images/51_P_1448946466595.jpg', NULL, '2018-08-20 21:23:29.867527', 23);
INSERT INTO `goods_goodsimage` VALUES (53, 'goods/images/51_P_1448946466208.jpg', NULL, '2018-08-20 21:23:29.868620', 23);
INSERT INTO `goods_goodsimage` VALUES (54, 'goods/images/17_P_1448947102246.jpg', NULL, '2018-08-20 21:23:29.872171', 24);
INSERT INTO `goods_goodsimage` VALUES (55, 'goods/images/20_P_1448946850602.jpg', NULL, '2018-08-20 21:23:29.875627', 25);
INSERT INTO `goods_goodsimage` VALUES (56, 'goods/images/19_P_1448946951581.jpg', NULL, '2018-08-20 21:23:29.879226', 26);
INSERT INTO `goods_goodsimage` VALUES (57, 'goods/images/19_P_1448946951726.jpg', NULL, '2018-08-20 21:23:29.880334', 26);
INSERT INTO `goods_goodsimage` VALUES (58, 'goods/images/18_P_1448947011435.jpg', NULL, '2018-08-20 21:23:29.883717', 27);
INSERT INTO `goods_goodsimage` VALUES (59, 'goods/images/22_P_1448946729629.jpg', NULL, '2018-08-20 21:23:29.887152', 28);
INSERT INTO `goods_goodsimage` VALUES (60, 'goods/images/45_P_1448946661303.jpg', NULL, '2018-08-20 21:23:29.890580', 29);
INSERT INTO `goods_goodsimage` VALUES (61, 'goods/images/32_P_1448948525620.jpg', NULL, '2018-08-20 21:23:29.894031', 30);
INSERT INTO `goods_goodsimage` VALUES (62, 'goods/images/30_P_1448948663450.jpg', NULL, '2018-08-20 21:23:29.897519', 31);
INSERT INTO `goods_goodsimage` VALUES (63, 'goods/images/30_P_1448948662571.jpg', NULL, '2018-08-20 21:23:29.898612', 31);
INSERT INTO `goods_goodsimage` VALUES (64, 'goods/images/30_P_1448948663221.jpg', NULL, '2018-08-20 21:23:29.899767', 31);
INSERT INTO `goods_goodsimage` VALUES (65, 'goods/images/31_P_1448948598947.jpg', NULL, '2018-08-20 21:23:29.903214', 32);
INSERT INTO `goods_goodsimage` VALUES (66, 'goods/images/31_P_1448948598475.jpg', NULL, '2018-08-20 21:23:29.904387', 32);
INSERT INTO `goods_goodsimage` VALUES (67, 'goods/images/35_P_1448948333610.jpg', NULL, '2018-08-20 21:23:29.908330', 33);
INSERT INTO `goods_goodsimage` VALUES (68, 'goods/images/35_P_1448948333313.jpg', NULL, '2018-08-20 21:23:29.909455', 33);
INSERT INTO `goods_goodsimage` VALUES (69, 'goods/images/36_P_1448948234405.jpg', NULL, '2018-08-20 21:23:29.913006', 34);
INSERT INTO `goods_goodsimage` VALUES (70, 'goods/images/36_P_1448948234250.jpg', NULL, '2018-08-20 21:23:29.914142', 34);
INSERT INTO `goods_goodsimage` VALUES (71, 'goods/images/33_P_1448948479966.jpg', NULL, '2018-08-20 21:23:29.917626', 35);
INSERT INTO `goods_goodsimage` VALUES (72, 'goods/images/33_P_1448948479886.jpg', NULL, '2018-08-20 21:23:29.918757', 35);
INSERT INTO `goods_goodsimage` VALUES (73, 'goods/images/34_P_1448948399009.jpg', NULL, '2018-08-20 21:23:29.922203', 36);
INSERT INTO `goods_goodsimage` VALUES (74, 'goods/images/43_P_1448948762645.jpg', NULL, '2018-08-20 21:23:29.925739', 37);
INSERT INTO `goods_goodsimage` VALUES (75, 'goods/images/38_P_1448949220255.jpg', NULL, '2018-08-20 21:23:29.929568', 38);
INSERT INTO `goods_goodsimage` VALUES (76, 'goods/images/44_P_1448948850187.jpg', NULL, '2018-08-20 21:23:29.933899', 39);
INSERT INTO `goods_goodsimage` VALUES (77, 'images/201511/goods_img/49_P_1448162819889.jpg', NULL, '2018-08-20 21:23:29.937749', 40);
INSERT INTO `goods_goodsimage` VALUES (78, 'goods/images/40_P_1448949038702.jpg', NULL, '2018-08-20 21:23:29.941471', 41);
INSERT INTO `goods_goodsimage` VALUES (79, 'goods/images/39_P_1448949115481.jpg', NULL, '2018-08-20 21:23:29.945697', 42);
INSERT INTO `goods_goodsimage` VALUES (80, 'goods/images/41_P_1448948980358.jpg', NULL, '2018-08-20 21:23:29.949646', 43);
INSERT INTO `goods_goodsimage` VALUES (81, 'goods/images/37_P_1448949284365.jpg', NULL, '2018-08-20 21:23:29.953143', 44);
INSERT INTO `goods_goodsimage` VALUES (82, 'goods/images/42_P_1448948895193.jpg', NULL, '2018-08-20 21:23:29.956544', 45);
INSERT INTO `goods_goodsimage` VALUES (83, 'goods/images/27_P_1448947771805.jpg', NULL, '2018-08-20 21:23:29.960975', 46);
INSERT INTO `goods_goodsimage` VALUES (84, 'goods/images/23_P_1448948070348.jpg', NULL, '2018-08-20 21:23:29.964929', 47);
INSERT INTO `goods_goodsimage` VALUES (85, 'goods/images/26_P_1448947825754.jpg', NULL, '2018-08-20 21:23:29.968541', 48);
INSERT INTO `goods_goodsimage` VALUES (86, 'goods/images/28_P_1448947699948.jpg', NULL, '2018-08-20 21:23:29.972677', 49);
INSERT INTO `goods_goodsimage` VALUES (87, 'goods/images/28_P_1448947699777.jpg', NULL, '2018-08-20 21:23:29.973933', 49);
INSERT INTO `goods_goodsimage` VALUES (88, 'goods/images/24_P_1448948023823.jpg', NULL, '2018-08-20 21:23:29.978020', 50);
INSERT INTO `goods_goodsimage` VALUES (89, 'goods/images/24_P_1448948023977.jpg', NULL, '2018-08-20 21:23:29.979151', 50);
INSERT INTO `goods_goodsimage` VALUES (90, 'goods/images/25_P_1448947875346.jpg', NULL, '2018-08-20 21:23:29.983515', 51);
INSERT INTO `goods_goodsimage` VALUES (91, 'goods/images/29_P_1448947631994.jpg', NULL, '2018-08-20 21:23:29.987924', 52);
COMMIT;

-- ----------------------------
-- Table structure for trade_ordergoods
-- ----------------------------
DROP TABLE IF EXISTS `trade_ordergoods`;
CREATE TABLE `trade_ordergoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `goods_num` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trade_ordergoods_goods_id_e77dc520_fk_goods_goods_id` (`goods_id`),
  KEY `trade_ordergoods_order_id_e046f633_fk_trade_orderinfo_id` (`order_id`),
  CONSTRAINT `trade_ordergoods_goods_id_e77dc520_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`),
  CONSTRAINT `trade_ordergoods_order_id_e046f633_fk_trade_orderinfo_id` FOREIGN KEY (`order_id`) REFERENCES `trade_orderinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of trade_ordergoods
-- ----------------------------
BEGIN;
INSERT INTO `trade_ordergoods` VALUES (11, '2018-08-27 20:49:09.126981', 1, 12, 4);
INSERT INTO `trade_ordergoods` VALUES (12, '2018-08-27 20:49:09.137738', 16, 12, 4);
COMMIT;

-- ----------------------------
-- Table structure for trade_orderinfo
-- ----------------------------
DROP TABLE IF EXISTS `trade_orderinfo`;
CREATE TABLE `trade_orderinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `trade_no` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pay_status` varchar(20) COLLATE utf8mb4_general_ci,
  `pay_type` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `post_script` longtext COLLATE utf8mb4_general_ci,
  `order_amount` double NOT NULL,
  `pay_time` datetime(6) DEFAULT NULL,
  `add_time` datetime(6) NOT NULL,
  `address` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `signer_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `signer_mobile` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  UNIQUE KEY `trade_no` (`trade_no`),
  KEY `trade_orderinfo_user_id_08ffa22c_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `trade_orderinfo_user_id_08ffa22c_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of trade_orderinfo
-- ----------------------------
BEGIN;
INSERT INTO `trade_orderinfo` VALUES (5, '20180827185110239', NULL, 'pending', 'paypal', 'asd', 12, NULL, '2018-08-27 18:51:10.933546', 'asd', 'awdasd', '213123123', 2, '');
INSERT INTO `trade_orderinfo` VALUES (12, '20180827204909171', NULL, 'pending', NULL, '', 768, NULL, '2018-08-27 20:49:09.031040', '', 'awdasd', '123123', 1, '');
COMMIT;

-- ----------------------------
-- Table structure for trade_shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `trade_shoppingcart`;
CREATE TABLE `trade_shoppingcart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trade_shoppingcart_user_id_goods_id_92225e66_uniq` (`user_id`,`goods_id`),
  KEY `trade_shoppingcart_goods_id_8b0f3cb4_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `trade_shoppingcart_goods_id_8b0f3cb4_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`),
  CONSTRAINT `trade_shoppingcart_user_id_da423c9c_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_operation_useraddress
-- ----------------------------
DROP TABLE IF EXISTS `user_operation_useraddress`;
CREATE TABLE `user_operation_useraddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `signer_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `signer_mobile` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `apt_num` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `postcode` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `province` varchar(20) COLLATE utf8mb4_general_ci,
  `street` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_operation_usera_user_id_fe128593_fk_users_use` (`user_id`),
  CONSTRAINT `user_operation_usera_user_id_fe128593_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of user_operation_useraddress
-- ----------------------------
BEGIN;
INSERT INTO `user_operation_useraddress` VALUES (7, 'awdasd', '123123123', '2018-08-27 19:31:24.855441', 1, '1132', 'montea', 'h3x2s3', 'qc', 'mntrea', NULL);
INSERT INTO `user_operation_useraddress` VALUES (8, 'awdasd', '123123', '2018-08-27 20:07:09.842113', 1, '123', 'asd', 'asd', 'awd', 'asd', NULL);
COMMIT;

-- ----------------------------
-- Table structure for user_operation_userfav
-- ----------------------------
DROP TABLE IF EXISTS `user_operation_userfav`;
CREATE TABLE `user_operation_userfav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_operation_userfav_user_id_goods_id_2dbadda7_uniq` (`user_id`,`goods_id`),
  KEY `user_operation_userfav_goods_id_57fc554f_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `user_operation_userfav_goods_id_57fc554f_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`),
  CONSTRAINT `user_operation_userfav_user_id_4e4de070_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of user_operation_userfav
-- ----------------------------
BEGIN;
INSERT INTO `user_operation_userfav` VALUES (13, '2018-08-21 15:41:21.034494', 14, 1);
INSERT INTO `user_operation_userfav` VALUES (15, '2018-08-21 15:48:13.217168', 1, 2);
INSERT INTO `user_operation_userfav` VALUES (16, '2018-08-21 15:48:15.601296', 3, 2);
INSERT INTO `user_operation_userfav` VALUES (17, '2018-08-21 15:48:18.883774', 20, 2);
INSERT INTO `user_operation_userfav` VALUES (18, '2018-08-21 16:27:24.156817', 2, 2);
INSERT INTO `user_operation_userfav` VALUES (29, '2018-08-26 20:53:40.523195', 32, 1);
INSERT INTO `user_operation_userfav` VALUES (33, '2018-08-26 20:55:13.114408', 15, 1);
INSERT INTO `user_operation_userfav` VALUES (34, '2018-08-26 20:55:43.450659', 31, 1);
INSERT INTO `user_operation_userfav` VALUES (36, '2018-08-27 13:40:44.758919', 1, 1);
INSERT INTO `user_operation_userfav` VALUES (37, '2018-08-27 15:22:54.360844', 2, 1);
INSERT INTO `user_operation_userfav` VALUES (38, '2018-08-27 19:19:25.240636', 6, 1);
COMMIT;

-- ----------------------------
-- Table structure for user_operation_usermessages
-- ----------------------------
DROP TABLE IF EXISTS `user_operation_usermessages`;
CREATE TABLE `user_operation_usermessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_type` int(11) NOT NULL,
  `subject` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `file` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_operation_userm_user_id_7fa713e8_fk_users_use` (`user_id`),
  CONSTRAINT `user_operation_userm_user_id_7fa713e8_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of user_operation_usermessages
-- ----------------------------
BEGIN;
INSERT INTO `user_operation_usermessages` VALUES (11, 2, 'Redeem GC', 'asdasdasd', '', '2018-08-25 15:15:21.688557', 1);
COMMIT;

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `mobile` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `membershipNumber` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `apt_num` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `street` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `city` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `province` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `country` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `postcode` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `preferred_language` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `firstname` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lastname` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `firstname` (`firstname`),
  UNIQUE KEY `lastname` (`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
BEGIN;
INSERT INTO `users_userprofile` VALUES (1, 'pbkdf2_sha256$36000$D7jwmRzSh1t3$FevNEDa4DandaO45zHITLod0lFTUWLOaQ8gRAFqm2Cg=', '2018-08-24 18:27:52.000000', 1, 'admin', 'Merlin', 'Jake', 1, 1, '2018-08-20 21:24:25.000000', '5149951234', '123231223456', '12asd@s.asd', '1143765', 'bourget', 'longueuil', 'Quebec', 'Canada', 'J4K2V8', 'English', 'Merlin', 'Jake');
INSERT INTO `users_userprofile` VALUES (2, 'pbkdf2_sha256$36000$OGGuFtIqB88D$wUyk9la/ct8Q6szAjO19vRQaMWa9/qfjrncYCIVcw50=', '2018-08-21 16:19:56.772735', 0, 'root', '', '', 0, 1, '2018-08-21 15:47:41.674568', '', NULL, '', NULL, NULL, NULL, 'Quebec', 'Canada', NULL, 'French', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for users_verifycode
-- ----------------------------
DROP TABLE IF EXISTS `users_verifycode`;
CREATE TABLE `users_verifycode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `add_time` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `url_name` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `query` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `object_id` longtext COLLATE utf8mb4_general_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
BEGIN;
INSERT INTO `xadmin_log` VALUES (1, '2018-08-20 21:32:33.147285', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'change', 'Changed goods_sn and goods_desc.', 8, 1);
INSERT INTO `xadmin_log` VALUES (2, '2018-08-20 21:34:06.725612', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'change', 'No fields changed.', 8, 1);
INSERT INTO `xadmin_log` VALUES (3, '2018-08-20 21:45:14.682869', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'change', 'Changed goods_desc, is_new and is_hot.', 8, 1);
INSERT INTO `xadmin_log` VALUES (4, '2018-08-20 21:45:38.175127', '127.0.0.1', '51', '稻园牌稻米油粮油米糠油绿色植物油', 'change', 'Changed goods_sn, goods_brief, goods_desc, ship_free, is_new and is_hot.', 8, 1);
INSERT INTO `xadmin_log` VALUES (5, '2018-08-20 21:45:57.350655', '127.0.0.1', '41', '德运全脂新鲜纯牛奶1L*10盒装整箱', 'change', 'Changed goods_sn, goods_brief, goods_desc, ship_free, is_new and is_hot.', 8, 1);
INSERT INTO `xadmin_log` VALUES (6, '2018-08-21 14:37:50.706823', '127.0.0.1', '117', '精选茗茶', 'change', 'Changed is_tab.', 10, 1);
INSERT INTO `xadmin_log` VALUES (7, '2018-08-21 14:37:58.463987', '127.0.0.1', '108', '天然干货', 'change', 'Changed is_tab.', 10, 1);
INSERT INTO `xadmin_log` VALUES (8, '2018-08-21 14:38:05.244034', '127.0.0.1', '57', '蔬菜水果', 'change', 'Changed is_tab.', 10, 1);
INSERT INTO `xadmin_log` VALUES (9, '2018-08-21 14:38:11.513870', '127.0.0.1', '1', '生鲜食品', 'change', 'Changed is_tab.', 10, 1);
INSERT INTO `xadmin_log` VALUES (10, '2018-08-21 14:38:22.986455', '127.0.0.1', '24', '酒水饮料', 'change', 'Changed is_tab.', 10, 1);
INSERT INTO `xadmin_log` VALUES (11, '2018-08-21 15:47:41.849009', '127.0.0.1', '2', 'root', 'create', 'Added.', 6, 1);
INSERT INTO `xadmin_log` VALUES (12, '2018-08-24 19:17:17.306287', '127.0.0.1', '1', 'admin', 'change', 'Changed first_name and last_name.', 6, 1);
INSERT INTO `xadmin_log` VALUES (13, '2018-08-26 21:44:48.211654', '127.0.0.1', '3', '%s(%d)', 'change', 'No fields changed.', 14, 1);
INSERT INTO `xadmin_log` VALUES (14, '2018-08-26 21:44:58.939732', '127.0.0.1', '6', '%s(%d)', 'create', 'Added.', 14, 1);
INSERT INTO `xadmin_log` VALUES (15, '2018-08-26 21:50:28.140526', '127.0.0.1', '7', '%s(%d)', 'create', 'Added.', 14, 1);
INSERT INTO `xadmin_log` VALUES (16, '2018-08-26 21:50:37.893584', '127.0.0.1', '8', '%s(%d)', 'create', 'Added.', 14, 1);
COMMIT;

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) COLLATE utf8mb4_general_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
BEGIN;
INSERT INTO `xadmin_usersettings` VALUES (1, 'dashboard:home:pos', '', 1);
COMMIT;

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) COLLATE utf8mb4_general_ci NOT NULL,
  `widget_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

SET FOREIGN_KEY_CHECKS = 1;
