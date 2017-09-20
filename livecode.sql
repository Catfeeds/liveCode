/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100119
 Source Host           : localhost:3306
 Source Schema         : liveCode

 Target Server Type    : MySQL
 Target Server Version : 100119
 File Encoding         : 65001

 Date: 20/09/2017 16:41:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fw_admin_access
-- ----------------------------
DROP TABLE IF EXISTS `fw_admin_access`;
CREATE TABLE `fw_admin_access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `group` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户组',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='后台管理员与用户组对应关系表';

-- ----------------------------
-- Records of fw_admin_access
-- ----------------------------
BEGIN;
INSERT INTO `fw_admin_access` VALUES (1, 1, 1, 1438651748, 1438651748, 0, 1);
INSERT INTO `fw_admin_access` VALUES (3, 2, 1, 1505118943, 1505119057, 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for fw_admin_addon
-- ----------------------------
DROP TABLE IF EXISTS `fw_admin_addon`;
CREATE TABLE `fw_admin_addon` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '插件名或标识',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text NOT NULL COMMENT '插件描述',
  `config` text COMMENT '配置',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '作者',
  `version` varchar(8) NOT NULL DEFAULT '' COMMENT '版本号',
  `adminlist` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  `type` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '插件类型',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sort` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of fw_admin_addon
-- ----------------------------
BEGIN;
INSERT INTO `fw_admin_addon` VALUES (2, 'RocketToTop', '小火箭返回顶部', '小火箭返回顶部', '{\"status\":\"1\"}', 'OpenCMF', '1.2.0', 0, 0, 1505875334, 1505875334, 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for fw_admin_config
-- ----------------------------
DROP TABLE IF EXISTS `fw_admin_config`;
CREATE TABLE `fw_admin_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '配置标题',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '配置名称',
  `value` text NOT NULL COMMENT '配置值',
  `group` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `type` varchar(16) NOT NULL DEFAULT '' COMMENT '配置类型',
  `options` varchar(255) NOT NULL DEFAULT '' COMMENT '配置额外值',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of fw_admin_config
-- ----------------------------
BEGIN;
INSERT INTO `fw_admin_config` VALUES (1, '站点开关', 'TOGGLE_WEB_SITE', '1', 1, 'select', '0:关闭\r\n1:开启', '站点关闭后将不能访问', 1378898976, 1406992386, 1, 1);
INSERT INTO `fw_admin_config` VALUES (2, '网站标题', 'WEB_SITE_TITLE', '网址跳转活码系统_网页跳转_链接跳转活码_爱活码活码管理系统_', 1, 'text', '', '网站标题前台显示标题', 1378898976, 1379235274, 2, 1);
INSERT INTO `fw_admin_config` VALUES (3, '网站口号', 'WEB_SITE_SLOGAN', '爱活码 爱上活码', 1, 'text', '', '网站口号、宣传标语、一句话介绍', 1434081649, 1434081649, 3, 1);
INSERT INTO `fw_admin_config` VALUES (5, '网站描述', 'WEB_SITE_DESCRIPTION', '爱活码二维码是一家提供免费的在线二维码生成服务，可以生成静态码、活码、微信二维码、淘宝二维码,网址跳转活码,微信群活码，比其他二维码服务商提供更优质的活码二维码服务', 1, 'textarea', '', '网站搜索引擎描述', 1378898976, 1379235841, 5, 1);
INSERT INTO `fw_admin_config` VALUES (6, '网站关键字', 'WEB_SITE_KEYWORD', '网址跳转活码,网页跳转活码,链接跳转活码系统,活码管理系统,活码二维码,活码生成器,草料,码云,活码生成', 1, 'textarea', '', '网站搜索引擎关键字', 1378898976, 1381390100, 6, 1);
INSERT INTO `fw_admin_config` VALUES (7, '版权信息', 'WEB_SITE_COPYRIGHT', 'Copyright © 爱活码 All rights reserved.', 1, 'text', '', '设置在网站底部显示的版权信息，如“版权所有 © 2014-2015 科斯克网络科技”', 1406991855, 1406992583, 7, 1);
INSERT INTO `fw_admin_config` VALUES (8, '网站备案号', 'WEB_SITE_ICP', '皖ICP备17007700号-1', 1, 'text', '', '设置在网站底部显示的备案号，如“苏ICP备1502009-2号\"', 1378900335, 1415983236, 8, 1);
INSERT INTO `fw_admin_config` VALUES (9, '站点统计', 'WEB_SITE_STATISTICS', '', 1, 'textarea', '', '支持百度、Google、cnzz等所有Javascript的统计代码', 1378900335, 1415983236, 9, 1);
INSERT INTO `fw_admin_config` VALUES (11, '文件上传大小', 'UPLOAD_FILE_SIZE', '10', 2, 'num', '', '文件上传大小单位：MB', 1428681031, 1428681031, 1, 1);
INSERT INTO `fw_admin_config` VALUES (12, '图片上传大小', 'UPLOAD_IMAGE_SIZE', '2', 2, 'num', '', '图片上传大小单位：MB', 1428681071, 1428681071, 2, 1);
INSERT INTO `fw_admin_config` VALUES (13, '后台多标签', 'ADMIN_TABS', '0', 2, 'radio', '0:关闭\r\n1:开启', '', 1453445526, 1453445526, 3, 1);
INSERT INTO `fw_admin_config` VALUES (14, '分页数量', 'ADMIN_PAGE_ROWS', '50', 2, 'num', '', '分页时每页的记录数', 1434019462, 1434019481, 4, 1);
INSERT INTO `fw_admin_config` VALUES (15, '后台主题', 'ADMIN_THEME', 'green', 2, 'select', 'default:默认主题\r\nblue:蓝色理想\r\ngreen:绿色生活', '后台界面主题', 1436678171, 1436690570, 5, 1);
INSERT INTO `fw_admin_config` VALUES (16, '开发模式', 'DEVELOP_MODE', '1', 3, 'select', '1:开启\r\n0:关闭', '开发模式下会显示菜单管理、配置管理、数据字典等开发者工具', 1432393583, 1432393583, 1, 1);
INSERT INTO `fw_admin_config` VALUES (17, '是否显示页面Trace', 'SHOW_PAGE_TRACE', '0', 3, 'select', '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 2, 1);
INSERT INTO `fw_admin_config` VALUES (19, 'URL模式', 'URL_MODEL', '3', 4, 'select', '0:普通模式\r\n1:PATHINFO模式\r\n2:REWRITE模式\r\n3:兼容模式', '', 1438423248, 1438423248, 1, 1);
INSERT INTO `fw_admin_config` VALUES (21, '配置分组', 'CONFIG_GROUP_LIST', '1:基本\r\n2:系统\r\n3:开发\r\n4:部署\r\n', 2, 'array', '', '配置分组', 1379228036, 1426930700, 5, 1);
INSERT INTO `fw_admin_config` VALUES (29, '邮箱服务器', 'EMAIL_HOST', 'smtp.163.com', 0, '', '', '', 0, 0, 0, 1);
INSERT INTO `fw_admin_config` VALUES (30, '邮箱服务器端口', 'EMAIL_PORT', '25', 0, '', '', '', 0, 0, 0, 1);
INSERT INTO `fw_admin_config` VALUES (31, '邮箱服务器帐号', 'EMAIL_ADDR', 'newbie91521@163.com', 0, '', '', '', 0, 0, 0, 1);
INSERT INTO `fw_admin_config` VALUES (32, '邮箱服务器密码', 'EMAIL_PASS', 'aopming91', 0, '', '', '', 0, 0, 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for fw_admin_group
-- ----------------------------
DROP TABLE IF EXISTS `fw_admin_group`;
CREATE TABLE `fw_admin_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级部门ID',
  `title` varchar(31) NOT NULL DEFAULT '' COMMENT '部门名称',
  `icon` varchar(31) NOT NULL DEFAULT '' COMMENT '图标',
  `menu_auth` text NOT NULL COMMENT '权限列表',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='部门信息表';

-- ----------------------------
-- Records of fw_admin_group
-- ----------------------------
BEGIN;
INSERT INTO `fw_admin_group` VALUES (1, 0, '超级管理员', '', '', 1426881003, 1427552428, 0, 1);
INSERT INTO `fw_admin_group` VALUES (3, 0, '网址跳转', '', '{\"Admin\":[\"59\",\"61\",\"63\",\"60\",\"62\",\"64\",\"65\",\"67\",\"66\"]}', 1496210172, 1505117600, 0, 1);
INSERT INTO `fw_admin_group` VALUES (4, 0, '多网址跳转', '', '{\"Admin\":[\"68\",\"69\",\"70\",\"71\",\"72\",\"73\",\"74\",\"75\"]}', 1496210208, 1505117571, 0, 1);
INSERT INTO `fw_admin_group` VALUES (5, 0, '活码管理', '', '{\"Admin\":[\"58\",\"59\",\"61\",\"63\",\"60\",\"62\",\"64\",\"65\",\"67\",\"66\",\"68\",\"69\",\"70\",\"71\",\"72\",\"73\",\"74\",\"75\"]}', 1496210230, 1496210240, 0, 1);
INSERT INTO `fw_admin_group` VALUES (6, 0, '发送发生的发生的发生的', 'fa-search', '{\"Admin\":[\"1\",\"58\",\"59\",\"61\",\"63\",\"60\",\"62\",\"64\",\"65\",\"67\",\"66\",\"68\",\"69\",\"70\",\"71\",\"72\",\"73\",\"74\",\"75\",\"2\",\"3\",\"4\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"44\",\"45\",\"46\",\"47\",\"48\"]}', 1505117366, 1505117550, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for fw_admin_hook
-- ----------------------------
DROP TABLE IF EXISTS `fw_admin_hook`;
CREATE TABLE `fw_admin_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '钩子ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件',
  `type` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='钩子表';

-- ----------------------------
-- Records of fw_admin_hook
-- ----------------------------
BEGIN;
INSERT INTO `fw_admin_hook` VALUES (1, 'AdminIndex', '后台首页小工具', '后台首页小工具', 1, 1446522155, 1446522155, 1);
INSERT INTO `fw_admin_hook` VALUES (2, 'FormBuilderExtend', 'FormBuilder类型扩展Builder', '', 1, 1447831268, 1447831268, 1);
INSERT INTO `fw_admin_hook` VALUES (3, 'UploadFile', '上传文件钩子', '', 1, 1407681961, 1407681961, 1);
INSERT INTO `fw_admin_hook` VALUES (4, 'PageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '', 1, 1407681961, 1407681961, 1);
INSERT INTO `fw_admin_hook` VALUES (5, 'PageFooter', '页面footer钩子，一般用于加载插件CSS文件和代码', 'RocketToTop', 1, 1407681961, 1407681961, 1);
COMMIT;

-- ----------------------------
-- Table structure for fw_admin_link
-- ----------------------------
DROP TABLE IF EXISTS `fw_admin_link`;
CREATE TABLE `fw_admin_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级',
  `title` varchar(31) NOT NULL DEFAULT '' COMMENT '标题',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `icon` varchar(31) NOT NULL DEFAULT '' COMMENT '图标',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='快捷链接表';

-- ----------------------------
-- Records of fw_admin_link
-- ----------------------------
BEGIN;
INSERT INTO `fw_admin_link` VALUES (1, 0, '快捷功能', '', 'fa-folder-open-o', 1446713441, 1446713450, 0, 1);
INSERT INTO `fw_admin_link` VALUES (3, 1, '系统设置', 'Admin/Config/group', 'fa-wrench', 1446713460, 1446713460, 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for fw_admin_livecode
-- ----------------------------
DROP TABLE IF EXISTS `fw_admin_livecode`;
CREATE TABLE `fw_admin_livecode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `menuId` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '1文本,2图文,3文件,4网址,5名片',
  `content` text NOT NULL COMMENT '活码内容',
  `count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '扫描次数',
  `huoma` varchar(255) DEFAULT NULL,
  `d` varchar(255) DEFAULT NULL,
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态0禁用1启用',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fw_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `fw_admin_menu`;
CREATE TABLE `fw_admin_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '1',
  `user_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `user_type` tinyint(3) NOT NULL DEFAULT '2' COMMENT '1管理员菜单，2用户菜单',
  `url` varchar(50) NOT NULL DEFAULT '',
  `icon` varchar(31) NOT NULL DEFAULT '' COMMENT '字体图标',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of fw_admin_menu
-- ----------------------------
BEGIN;
INSERT INTO `fw_admin_menu` VALUES (1, 0, 0, '系统', 0, '', 'fa fa-cog', 0, 1505210029, 1);
INSERT INTO `fw_admin_menu` VALUES (4, 1, 0, '活码管理', 2, '', 'fa fa-folder-open-o', 0, 1505210029, 1);
INSERT INTO `fw_admin_menu` VALUES (5, 1, 0, '系统功能', 1, '', 'fa fa-folder-open-o', 0, 1505554799, 1);
INSERT INTO `fw_admin_menu` VALUES (6, 1, 0, '用户管理', 1, '', 'fa fa-folder-open-o', 0, 1505210055, 1);
INSERT INTO `fw_admin_menu` VALUES (7, 4, 0, '网址跳转', 2, 'Admin/Phone/index', 'fa fa-list', 0, 1505210029, 1);
INSERT INTO `fw_admin_menu` VALUES (8, 4, 0, '多网址跳转', 2, 'Admin/Duourl/index', 'fa fa-list', 0, 1505210066, 1);
INSERT INTO `fw_admin_menu` VALUES (9, 4, 0, '产品活码', 2, 'Admin/Product/index', 'fa fa-list', 0, 1505210029, 1);
INSERT INTO `fw_admin_menu` VALUES (10, 4, 0, '视频活码', 2, 'Admin/Video/index', 'fa fa-list', 0, 1505210029, 1);
INSERT INTO `fw_admin_menu` VALUES (11, 4, 0, '活码生成', 2, 'Admin/Livecode/index', 'fa fa-list', 0, 1505210029, 1);
INSERT INTO `fw_admin_menu` VALUES (13, 5, 0, '系统设置', 1, 'Admin/Config/group', 'fa fa-wrench', 0, 1505210777, 1);
INSERT INTO `fw_admin_menu` VALUES (14, 6, 0, '会员管理', 1, 'Admin/User/index', 'fa fa-user', 0, 1505210028, 1);
INSERT INTO `fw_admin_menu` VALUES (15, 7, 0, '添加', 2, 'Admin/Phone/add', '', 0, 0, 1);
INSERT INTO `fw_admin_menu` VALUES (17, 11, 0, '新建目录', 2, 'Admin/Livecode/addmenu', '', 0, 0, -1);
INSERT INTO `fw_admin_menu` VALUES (42, 38, 3, '编辑活码', 2, 'Admin/Livecode/edit/type/1505457893', '', 0, 1505457893, -1);
INSERT INTO `fw_admin_menu` VALUES (41, 38, 3, '查看数据统计', 2, 'Admin/Livecode/view/type/1505457893', '', 0, 1505457893, -1);
INSERT INTO `fw_admin_menu` VALUES (27, 8, 0, '添加多网址跳转', 2, 'admin/duourl/add', '', 0, 1505439785, 1);
INSERT INTO `fw_admin_menu` VALUES (40, 38, 3, '下载二维码', 2, 'Admin/Livecode/xzewm/type/1505457893', '', 0, 1505457893, -1);
INSERT INTO `fw_admin_menu` VALUES (39, 38, 3, '新增活码', 2, 'Admin/Livecode/add/type/1505457893', '', 0, 1505457893, -1);
INSERT INTO `fw_admin_menu` VALUES (38, 11, 3, '新目录一号', 2, 'Admin/Livecode/child/type/1505457893', '', 0, 1505457893, 1);
INSERT INTO `fw_admin_menu` VALUES (34, 11, 0, '新增活码', 2, 'Admin/Livecode/add', '', 0, 1505455366, -1);
INSERT INTO `fw_admin_menu` VALUES (35, 11, 0, '下载二维码', 2, 'Admin/Livecode/xzewm', '', 0, 1505455452, -1);
INSERT INTO `fw_admin_menu` VALUES (36, 11, 0, '查看数据统计', 2, 'Admin/Livecode/view', '', 0, 1505457007, -1);
INSERT INTO `fw_admin_menu` VALUES (37, 11, 0, '编辑活码', 2, 'Admin/Livecode/edit', '', 0, 1505457343, -1);
INSERT INTO `fw_admin_menu` VALUES (43, 9, 0, '新增', 2, 'Admin/Product/add', '', 0, 1505550934, -1);
INSERT INTO `fw_admin_menu` VALUES (44, 9, 0, '新建目录', 2, 'Admin/Product/addmenu', '', 0, 1505551306, -1);
INSERT INTO `fw_admin_menu` VALUES (45, 9, 0, '下载二维码', 2, 'Admin/Product/xzewm', '', 0, 1505551431, -1);
INSERT INTO `fw_admin_menu` VALUES (46, 9, 0, '查看数据统计', 2, 'Admin/Product/view', '', 0, 1505551487, -1);
INSERT INTO `fw_admin_menu` VALUES (47, 9, 0, '编辑活码', 2, 'Admin/Product/edit', '', 0, 1505551588, -1);
INSERT INTO `fw_admin_menu` VALUES (48, 1, 0, '财务管理', 1, '', 'fa fa-folder-open-o', 0, 1505553794, 1);
INSERT INTO `fw_admin_menu` VALUES (49, 48, 0, '订单中心', 1, 'Admin/Order/index', 'fa fa-bar-chart-o', 0, 1505553995, 1);
INSERT INTO `fw_admin_menu` VALUES (50, 1, 0, '支付管理', 1, '', 'fa fa-folder-open-o', 0, 1505553799, 1);
INSERT INTO `fw_admin_menu` VALUES (51, 50, 0, '支付宝', 1, 'Admin/Ali/index', 'fa fa-credit-card', 0, 1505554606, 1);
INSERT INTO `fw_admin_menu` VALUES (52, 50, 0, '微信', 1, 'Admin/Wechat/index', 'fa fa-credit-card', 0, 1505554695, 1);
INSERT INTO `fw_admin_menu` VALUES (53, 50, 0, '汇款账号', 1, 'Admin/Bank/index', 'fa fa-credit-card', 0, 1505554725, 1);
INSERT INTO `fw_admin_menu` VALUES (54, 50, 0, '套餐价格', 1, 'Admin/Vip/index', 'fa fa-credit-card', 0, 1505554792, 1);
INSERT INTO `fw_admin_menu` VALUES (55, 54, 0, '新增套餐', 1, 'Admin/Vip/add', '', 0, 1505805835, -1);
INSERT INTO `fw_admin_menu` VALUES (56, 54, 0, '编辑套餐', 1, 'Admin/Vip/edit', '', 0, 1505805956, -1);
INSERT INTO `fw_admin_menu` VALUES (57, 1, 0, '账号管理', 2, '', 'fa fa-folder-open-o', 0, 1505814677, 1);
INSERT INTO `fw_admin_menu` VALUES (58, 1, 0, '财务管理', 2, '', 'fa fa-folder-open-o', 0, 1505814780, 1);
INSERT INTO `fw_admin_menu` VALUES (59, 57, 0, '密码修改', 2, 'Admin/Account/editPass', 'fa fa-list', 0, 1505815020, 1);
INSERT INTO `fw_admin_menu` VALUES (60, 57, 0, '续费管理', 2, 'Admin/Account/fee', 'fa fa-list', 0, 1505815097, 1);
INSERT INTO `fw_admin_menu` VALUES (61, 58, 0, '订单中心', 2, 'Admin/Account/order', 'fa fa-list', 0, 1505815175, 1);
COMMIT;

-- ----------------------------
-- Table structure for fw_admin_module
-- ----------------------------
DROP TABLE IF EXISTS `fw_admin_module`;
CREATE TABLE `fw_admin_module` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(31) NOT NULL DEFAULT '' COMMENT '名称',
  `title` varchar(63) NOT NULL DEFAULT '' COMMENT '标题',
  `logo` varchar(63) NOT NULL DEFAULT '' COMMENT '图片图标',
  `icon` varchar(31) NOT NULL DEFAULT '' COMMENT '字体图标',
  `icon_color` varchar(7) NOT NULL DEFAULT '' COMMENT '字体图标颜色',
  `description` varchar(127) NOT NULL DEFAULT '' COMMENT '描述',
  `developer` varchar(31) NOT NULL DEFAULT '' COMMENT '开发者',
  `version` varchar(7) NOT NULL DEFAULT '' COMMENT '版本',
  `user_nav` text NOT NULL COMMENT '个人中心导航',
  `config` text NOT NULL COMMENT '配置',
  `admin_menu` text NOT NULL COMMENT '菜单节点',
  `is_system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许卸载',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='模块功能表';

-- ----------------------------
-- Records of fw_admin_module
-- ----------------------------
BEGIN;
INSERT INTO `fw_admin_module` VALUES (1, 'Admin', '系统', '', 'fa fa-cog', '#3CA6F1', '核心系统', '', '1.2.0', '', '', '{\"1\":{\"pid\":\"0\",\"title\":\"\\u7cfb\\u7edf\",\"icon\":\"fa fa-cog\",\"level\":\"system\",\"id\":\"1\"},\"58\":{\"pid\":\"1\",\"title\":\"\\u6d3b\\u7801\\u7ba1\\u7406\",\"icon\":\"fa fa-folder-open-o\",\"id\":\"58\"},\"59\":{\"pid\":\"58\",\"title\":\"\\u7f51\\u5740\\u8df3\\u8f6c\",\"icon\":\"fa fa-list\",\"url\":\"Admin\\/Phone\\/index\",\"id\":\"59\"},\"61\":{\"pid\":\"59\",\"title\":\"\\u6dfb\\u52a0\",\"url\":\"Admin\\/Phone\\/add\",\"id\":\"61\"},\"63\":{\"pid\":\"59\",\"title\":\"\\u7f16\\u8f91\",\"url\":\"Admin\\/Phone\\/edit\",\"id\":\"63\"},\"60\":{\"pid\":\"59\",\"title\":\"\\u5220\\u9664\",\"url\":\"Admin\\/Phone\\/setStatus\",\"id\":\"60\"},\"62\":{\"pid\":\"59\",\"title\":\"\\u6279\\u91cf\\u5bfc\\u5165\\u7f51\\u5740\",\"url\":\"Admin\\/Phone\\/drurl\",\"id\":\"62\"},\"64\":{\"pid\":\"59\",\"title\":\"\\u5bfc\\u51fa\",\"url\":\"Admin\\/Phone\\/outurl\",\"id\":\"64\"},\"65\":{\"pid\":\"59\",\"title\":\"\\u4e0b\\u8f7d\\u4e8c\\u7ef4\\u7801\",\"url\":\"Admin\\/Phone\\/xzewm\",\"id\":\"65\"},\"67\":{\"pid\":\"59\",\"title\":\"\\u6279\\u91cf\\u4fee\\u6539\\u8df3\\u8f6c\\u7f51\\u5740\",\"url\":\"Admin\\/Phone\\/edittzwz\",\"id\":\"67\"},\"66\":{\"pid\":\"59\",\"title\":\"\\u4e0a\\u4f20\\u6587\\u4ef6\",\"url\":\"Admin\\/Upload\\/upload\",\"id\":\"66\"},\"68\":{\"pid\":\"58\",\"title\":\"\\u591a\\u7f51\\u5740\\u8df3\\u8f6c\",\"icon\":\"fa fa-list\",\"url\":\"Admin\\/Duourl\\/index\",\"id\":\"68\"},\"69\":{\"pid\":\"68\",\"title\":\"\\u6dfb\\u52a0\",\"url\":\"Admin\\/Duourl\\/add\",\"id\":\"69\"},\"70\":{\"pid\":\"68\",\"title\":\"\\u7f16\\u8f91\",\"url\":\"Admin\\/Duourl\\/edit\",\"id\":\"70\"},\"71\":{\"pid\":\"68\",\"title\":\"\\u5220\\u9664\",\"url\":\"Admin\\/Duourl\\/setStatus\",\"id\":\"71\"},\"72\":{\"pid\":\"68\",\"title\":\"\\u5bfc\\u51fa\",\"url\":\"Admin\\/Duourl\\/outurl\",\"id\":\"72\"},\"73\":{\"pid\":\"68\",\"title\":\"\\u4e0b\\u8f7d\\u4e8c\\u7ef4\\u7801\",\"url\":\"Admin\\/Duourl\\/xzewm\",\"id\":\"73\"},\"74\":{\"pid\":\"68\",\"title\":\"\\u6279\\u91cf\\u4fee\\u6539\\u8df3\\u8f6c\\u7f51\\u5740\",\"url\":\"Admin\\/Duourl\\/edittzwz\",\"id\":\"74\"},\"75\":{\"pid\":\"68\",\"title\":\"\\u4e0a\\u4f20\\u6587\\u4ef6\",\"url\":\"Admin\\/Upload\\/upload\",\"id\":\"75\"},\"2\":{\"pid\":\"1\",\"title\":\"\\u7cfb\\u7edf\\u529f\\u80fd\",\"icon\":\"fa fa-folder-open-o\",\"id\":\"2\"},\"3\":{\"pid\":\"2\",\"title\":\"\\u7cfb\\u7edf\\u8bbe\\u7f6e\",\"icon\":\"fa fa-wrench\",\"url\":\"Admin\\/Config\\/group\",\"id\":\"3\"},\"4\":{\"pid\":\"3\",\"title\":\"\\u4fee\\u6539\\u8bbe\\u7f6e\",\"url\":\"Admin\\/Config\\/groupSave\",\"id\":\"4\"},\"5\":{\"pid\":\"2\",\"title\":\"\\u5bfc\\u822a\\u7ba1\\u7406\",\"icon\":\"fa fa-map-signs\",\"url\":\"Admin\\/Nav\\/index\",\"id\":\"5\"},\"6\":{\"pid\":\"5\",\"title\":\"\\u65b0\\u589e\",\"url\":\"Admin\\/Nav\\/add\",\"id\":\"6\"},\"7\":{\"pid\":\"5\",\"title\":\"\\u7f16\\u8f91\",\"url\":\"Admin\\/Nav\\/edit\",\"id\":\"7\"},\"8\":{\"pid\":\"5\",\"title\":\"\\u8bbe\\u7f6e\\u72b6\\u6001\",\"url\":\"Admin\\/Nav\\/setStatus\",\"id\":\"8\"},\"9\":{\"pid\":\"2\",\"title\":\"\\u5feb\\u6377\\u94fe\\u63a5\",\"icon\":\"fa fa-link\",\"url\":\"Admin\\/Link\\/index\",\"id\":\"9\"},\"10\":{\"pid\":\"9\",\"title\":\"\\u65b0\\u589e\",\"url\":\"Admin\\/Link\\/add\",\"id\":\"10\"},\"11\":{\"pid\":\"9\",\"title\":\"\\u7f16\\u8f91\",\"url\":\"Admin\\/Link\\/edit\",\"id\":\"11\"},\"12\":{\"pid\":\"9\",\"title\":\"\\u8bbe\\u7f6e\\u72b6\\u6001\",\"url\":\"Admin\\/Link\\/setStatus\",\"id\":\"12\"},\"13\":{\"pid\":\"2\",\"title\":\"\\u914d\\u7f6e\\u7ba1\\u7406\",\"icon\":\"fa fa-cogs\",\"url\":\"Admin\\/Config\\/index\",\"id\":\"13\"},\"14\":{\"pid\":\"13\",\"title\":\"\\u65b0\\u589e\",\"url\":\"Admin\\/Config\\/add\",\"id\":\"14\"},\"15\":{\"pid\":\"13\",\"title\":\"\\u7f16\\u8f91\",\"url\":\"Admin\\/Config\\/edit\",\"id\":\"15\"},\"16\":{\"pid\":\"13\",\"title\":\"\\u8bbe\\u7f6e\\u72b6\\u6001\",\"url\":\"Admin\\/Config\\/setStatus\",\"id\":\"16\"},\"17\":{\"pid\":\"2\",\"title\":\"\\u4e0a\\u4f20\\u7ba1\\u7406\",\"icon\":\"fa fa-upload\",\"url\":\"Admin\\/Upload\\/index\",\"id\":\"17\"},\"18\":{\"pid\":\"17\",\"title\":\"\\u4e0a\\u4f20\\u6587\\u4ef6\",\"url\":\"Admin\\/Upload\\/upload\",\"id\":\"18\"},\"19\":{\"pid\":\"17\",\"title\":\"\\u5220\\u9664\\u6587\\u4ef6\",\"url\":\"Admin\\/Upload\\/delete\",\"id\":\"19\"},\"20\":{\"pid\":\"17\",\"title\":\"\\u8bbe\\u7f6e\\u72b6\\u6001\",\"url\":\"Admin\\/Upload\\/setStatus\",\"id\":\"20\"},\"21\":{\"pid\":\"17\",\"title\":\"\\u4e0b\\u8f7d\\u8fdc\\u7a0b\\u56fe\\u7247\",\"url\":\"Admin\\/Upload\\/downremoteimg\",\"id\":\"21\"},\"22\":{\"pid\":\"17\",\"title\":\"\\u6587\\u4ef6\\u6d4f\\u89c8\",\"url\":\"Admin\\/Upload\\/fileManager\",\"id\":\"22\"},\"23\":{\"pid\":\"1\",\"title\":\"\\u7cfb\\u7edf\\u6743\\u9650\",\"icon\":\"fa fa-folder-open-o\",\"id\":\"23\"},\"24\":{\"pid\":\"23\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa fa-user\",\"url\":\"Admin\\/User\\/index\",\"id\":\"24\"},\"25\":{\"pid\":\"24\",\"title\":\"\\u65b0\\u589e\",\"url\":\"Admin\\/User\\/add\",\"id\":\"25\"},\"26\":{\"pid\":\"24\",\"title\":\"\\u7f16\\u8f91\",\"url\":\"Admin\\/User\\/edit\",\"id\":\"26\"},\"27\":{\"pid\":\"24\",\"title\":\"\\u8bbe\\u7f6e\\u72b6\\u6001\",\"url\":\"Admin\\/User\\/setStatus\",\"id\":\"27\"},\"28\":{\"pid\":\"23\",\"title\":\"\\u7ba1\\u7406\\u5458\\u7ba1\\u7406\",\"icon\":\"fa fa-lock\",\"url\":\"Admin\\/Access\\/index\",\"id\":\"28\"},\"29\":{\"pid\":\"28\",\"title\":\"\\u65b0\\u589e\",\"url\":\"Admin\\/Access\\/add\",\"id\":\"29\"},\"30\":{\"pid\":\"28\",\"title\":\"\\u7f16\\u8f91\",\"url\":\"Admin\\/Access\\/edit\",\"id\":\"30\"},\"31\":{\"pid\":\"28\",\"title\":\"\\u8bbe\\u7f6e\\u72b6\\u6001\",\"url\":\"Admin\\/Access\\/setStatus\",\"id\":\"31\"},\"32\":{\"pid\":\"23\",\"title\":\"\\u7528\\u6237\\u7ec4\\u7ba1\\u7406\",\"icon\":\"fa fa-sitemap\",\"url\":\"Admin\\/Group\\/index\",\"id\":\"32\"},\"33\":{\"pid\":\"32\",\"title\":\"\\u65b0\\u589e\",\"url\":\"Admin\\/Group\\/add\",\"id\":\"33\"},\"34\":{\"pid\":\"32\",\"title\":\"\\u7f16\\u8f91\",\"url\":\"Admin\\/Group\\/edit\",\"id\":\"34\"},\"35\":{\"pid\":\"32\",\"title\":\"\\u8bbe\\u7f6e\\u72b6\\u6001\",\"url\":\"Admin\\/Group\\/setStatus\",\"id\":\"35\"},\"36\":{\"pid\":\"1\",\"title\":\"\\u6269\\u5c55\\u4e2d\\u5fc3\",\"icon\":\"fa fa-folder-open-o\",\"id\":\"36\"},\"37\":{\"pid\":\"36\",\"title\":\"\\u524d\\u53f0\\u4e3b\\u9898\",\"icon\":\"fa fa-adjust\",\"url\":\"Admin\\/Theme\\/index\",\"id\":\"37\"},\"38\":{\"pid\":\"37\",\"title\":\"\\u5b89\\u88c5\",\"url\":\"Admin\\/Theme\\/install\",\"id\":\"38\"},\"39\":{\"pid\":\"37\",\"title\":\"\\u5378\\u8f7d\",\"url\":\"Admin\\/Theme\\/uninstall\",\"id\":\"39\"},\"40\":{\"pid\":\"37\",\"title\":\"\\u66f4\\u65b0\\u4fe1\\u606f\",\"url\":\"Admin\\/Theme\\/updateInfo\",\"id\":\"40\"},\"41\":{\"pid\":\"37\",\"title\":\"\\u8bbe\\u7f6e\\u72b6\\u6001\",\"url\":\"Admin\\/Theme\\/setStatus\",\"id\":\"41\"},\"42\":{\"pid\":\"37\",\"title\":\"\\u5207\\u6362\\u4e3b\\u9898\",\"url\":\"Admin\\/Theme\\/setCurrent\",\"id\":\"42\"},\"43\":{\"pid\":\"37\",\"title\":\"\\u53d6\\u6d88\\u4e3b\\u9898\",\"url\":\"Admin\\/Theme\\/cancel\",\"id\":\"43\"},\"44\":{\"pid\":\"36\",\"title\":\"\\u529f\\u80fd\\u6a21\\u5757\",\"icon\":\"fa fa-th-large\",\"url\":\"Admin\\/Module\\/index\",\"id\":\"44\"},\"45\":{\"pid\":\"44\",\"title\":\"\\u5b89\\u88c5\",\"url\":\"Admin\\/Module\\/install\",\"id\":\"45\"},\"46\":{\"pid\":\"44\",\"title\":\"\\u5378\\u8f7d\",\"url\":\"Admin\\/Module\\/uninstall\",\"id\":\"46\"},\"47\":{\"pid\":\"44\",\"title\":\"\\u66f4\\u65b0\\u4fe1\\u606f\",\"url\":\"Admin\\/Module\\/updateInfo\",\"id\":\"47\"},\"48\":{\"pid\":\"44\",\"title\":\"\\u8bbe\\u7f6e\\u72b6\\u6001\",\"url\":\"Admin\\/Module\\/setStatus\",\"id\":\"48\"},\"49\":{\"pid\":\"36\",\"title\":\"\\u63d2\\u4ef6\\u7ba1\\u7406\",\"icon\":\"fa fa-th\",\"url\":\"Admin\\/Addon\\/index\",\"id\":\"49\"},\"50\":{\"pid\":\"49\",\"title\":\"\\u5b89\\u88c5\",\"url\":\"Admin\\/Addon\\/install\",\"id\":\"50\"},\"51\":{\"pid\":\"49\",\"title\":\"\\u5378\\u8f7d\",\"url\":\"Admin\\/Addon\\/uninstall\",\"id\":\"51\"},\"52\":{\"pid\":\"49\",\"title\":\"\\u8fd0\\u884c\",\"url\":\"Admin\\/Addon\\/execute\",\"id\":\"52\"},\"53\":{\"pid\":\"49\",\"title\":\"\\u8bbe\\u7f6e\",\"url\":\"Admin\\/Addon\\/config\",\"id\":\"53\"},\"54\":{\"pid\":\"49\",\"title\":\"\\u540e\\u53f0\\u7ba1\\u7406\",\"url\":\"Admin\\/Addon\\/adminList\",\"id\":\"54\"},\"55\":{\"pid\":\"54\",\"title\":\"\\u65b0\\u589e\\u6570\\u636e\",\"url\":\"Admin\\/Addon\\/adminAdd\",\"id\":\"55\"},\"56\":{\"pid\":\"54\",\"title\":\"\\u7f16\\u8f91\\u6570\\u636e\",\"url\":\"Admin\\/Addon\\/adminEdit\",\"id\":\"56\"},\"57\":{\"pid\":\"54\",\"title\":\"\\u8bbe\\u7f6e\\u72b6\\u6001\",\"url\":\"Admin\\/Addon\\/setStatus\",\"id\":\"57\"}}', 1, 1438651748, 1453274303, 0, 1);
INSERT INTO `fw_admin_module` VALUES (2, 'User', '用户后台', '', 'fa fa-cog', '#3CA6F1', '核心系统', 'Hung', '1.3.0', '', '', '{\"1\":{\"pid\":\"0\",\"title\":\"\\u7cfb\\u7edf\",\"icon\":\"fa fa-cog\",\"level\":\"system\",\"id\":\"1\"},\"58\":{\"pid\":\"1\",\"title\":\"\\u6d3b\\u7801\\u7ba1\\u7406\",\"icon\":\"fa fa-folder-open-o\",\"id\":\"58\"},\"59\":{\"pid\":\"58\",\"title\":\"\\u7f51\\u5740\\u8df3\\u8f6c\",\"icon\":\"fa fa-list\",\"url\":\"Admin\\/Phone\\/index\",\"id\":\"59\"},\"61\":{\"pid\":\"59\",\"title\":\"\\u6dfb\\u52a0\",\"url\":\"Admin\\/Phone\\/add\",\"id\":\"61\"},\"63\":{\"pid\":\"59\",\"title\":\"\\u7f16\\u8f91\",\"url\":\"Admin\\/Phone\\/edit\",\"id\":\"63\"},\"60\":{\"pid\":\"59\",\"title\":\"\\u5220\\u9664\",\"url\":\"Admin\\/Phone\\/setStatus\",\"id\":\"60\"},\"62\":{\"pid\":\"59\",\"title\":\"\\u6279\\u91cf\\u5bfc\\u5165\\u7f51\\u5740\",\"url\":\"Admin\\/Phone\\/drurl\",\"id\":\"62\"},\"64\":{\"pid\":\"59\",\"title\":\"\\u5bfc\\u51fa\",\"url\":\"Admin\\/Phone\\/outurl\",\"id\":\"64\"},\"65\":{\"pid\":\"59\",\"title\":\"\\u4e0b\\u8f7d\\u4e8c\\u7ef4\\u7801\",\"url\":\"Admin\\/Phone\\/xzewm\",\"id\":\"65\"},\"67\":{\"pid\":\"59\",\"title\":\"\\u6279\\u91cf\\u4fee\\u6539\\u8df3\\u8f6c\\u7f51\\u5740\",\"url\":\"Admin\\/Phone\\/edittzwz\",\"id\":\"67\"},\"66\":{\"pid\":\"59\",\"title\":\"\\u4e0a\\u4f20\\u6587\\u4ef6\",\"url\":\"Admin\\/Upload\\/upload\",\"id\":\"66\"},\"68\":{\"pid\":\"58\",\"title\":\"\\u591a\\u7f51\\u5740\\u8df3\\u8f6c\",\"icon\":\"fa fa-list\",\"url\":\"Admin\\/Duourl\\/index\",\"id\":\"68\"},\"69\":{\"pid\":\"68\",\"title\":\"\\u6dfb\\u52a0\",\"url\":\"Admin\\/Duourl\\/add\",\"id\":\"69\"},\"70\":{\"pid\":\"68\",\"title\":\"\\u7f16\\u8f91\",\"url\":\"Admin\\/Duourl\\/edit\",\"id\":\"70\"},\"71\":{\"pid\":\"68\",\"title\":\"\\u5220\\u9664\",\"url\":\"Admin\\/Duourl\\/setStatus\",\"id\":\"71\"},\"72\":{\"pid\":\"68\",\"title\":\"\\u5bfc\\u51fa\",\"url\":\"Admin\\/Duourl\\/outurl\",\"id\":\"72\"},\"73\":{\"pid\":\"68\",\"title\":\"\\u4e0b\\u8f7d\\u4e8c\\u7ef4\\u7801\",\"url\":\"Admin\\/Duourl\\/xzewm\",\"id\":\"73\"},\"74\":{\"pid\":\"68\",\"title\":\"\\u6279\\u91cf\\u4fee\\u6539\\u8df3\\u8f6c\\u7f51\\u5740\",\"url\":\"Admin\\/Duourl\\/edittzwz\",\"id\":\"74\"},\"75\":{\"pid\":\"68\",\"title\":\"\\u4e0a\\u4f20\\u6587\\u4ef6\",\"url\":\"Admin\\/Upload\\/upload\",\"id\":\"75\"},\"2\":{\"pid\":\"1\",\"title\":\"\\u7cfb\\u7edf\\u529f\\u80fd\",\"icon\":\"fa fa-folder-open-o\",\"id\":\"2\"},\"3\":{\"pid\":\"2\",\"title\":\"\\u7cfb\\u7edf\\u8bbe\\u7f6e\",\"icon\":\"fa fa-wrench\",\"url\":\"Admin\\/Config\\/group\",\"id\":\"3\"},\"4\":{\"pid\":\"3\",\"title\":\"\\u4fee\\u6539\\u8bbe\\u7f6e\",\"url\":\"Admin\\/Config\\/groupSave\",\"id\":\"4\"},\"23\":{\"pid\":\"1\",\"title\":\"\\u7cfb\\u7edf\\u6743\\u9650\",\"icon\":\"fa fa-folder-open-o\",\"id\":\"23\"},\"24\":{\"pid\":\"23\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa fa-user\",\"url\":\"Admin\\/User\\/index\",\"id\":\"24\"},\"25\":{\"pid\":\"24\",\"title\":\"\\u65b0\\u589e\",\"url\":\"Admin\\/User\\/add\",\"id\":\"25\"},\"26\":{\"pid\":\"24\",\"title\":\"\\u7f16\\u8f91\",\"url\":\"Admin\\/User\\/edit\",\"id\":\"26\"},\"27\":{\"pid\":\"24\",\"title\":\"\\u8bbe\\u7f6e\\u72b6\\u6001\",\"url\":\"Admin\\/User\\/setStatus\",\"id\":\"27\"},\"28\":{\"pid\":\"23\",\"title\":\"\\u7ba1\\u7406\\u5458\\u7ba1\\u7406\",\"icon\":\"fa fa-lock\",\"url\":\"Admin\\/Access\\/index\",\"id\":\"28\"},\"29\":{\"pid\":\"28\",\"title\":\"\\u65b0\\u589e\",\"url\":\"Admin\\/Access\\/add\",\"id\":\"29\"},\"30\":{\"pid\":\"28\",\"title\":\"\\u7f16\\u8f91\",\"url\":\"Admin\\/Access\\/edit\",\"id\":\"30\"},\"31\":{\"pid\":\"28\",\"title\":\"\\u8bbe\\u7f6e\\u72b6\\u6001\",\"url\":\"Admin\\/Access\\/setStatus\",\"id\":\"31\"},\"32\":{\"pid\":\"23\",\"title\":\"\\u7528\\u6237\\u7ec4\\u7ba1\\u7406\",\"icon\":\"fa fa-sitemap\",\"url\":\"Admin\\/Group\\/index\",\"id\":\"32\"},\"33\":{\"pid\":\"32\",\"title\":\"\\u65b0\\u589e\",\"url\":\"Admin\\/Group\\/add\",\"id\":\"33\"},\"34\":{\"pid\":\"32\",\"title\":\"\\u7f16\\u8f91\",\"url\":\"Admin\\/Group\\/edit\",\"id\":\"34\"},\"35\":{\"pid\":\"32\",\"title\":\"\\u8bbe\\u7f6e\\u72b6\\u6001\",\"url\":\"Admin\\/Group\\/setStatus\",\"id\":\"35\"},\"36\":{\"pid\":\"1\",\"title\":\"\\u6269\\u5c55\\u4e2d\\u5fc3\",\"icon\":\"fa fa-folder-open-o\",\"id\":\"36\"},\"44\":{\"pid\":\"36\",\"title\":\"\\u529f\\u80fd\\u6a21\\u5757\",\"icon\":\"fa fa-th-large\",\"url\":\"Admin\\/Module\\/index\",\"id\":\"44\"},\"45\":{\"pid\":\"44\",\"title\":\"\\u5b89\\u88c5\",\"url\":\"Admin\\/Module\\/install\",\"id\":\"45\"},\"46\":{\"pid\":\"44\",\"title\":\"\\u5378\\u8f7d\",\"url\":\"Admin\\/Module\\/uninstall\",\"id\":\"46\"},\"47\":{\"pid\":\"44\",\"title\":\"\\u66f4\\u65b0\\u4fe1\\u606f\",\"url\":\"Admin\\/Module\\/updateInfo\",\"id\":\"47\"},\"48\":{\"pid\":\"44\",\"title\":\"\\u8bbe\\u7f6e\\u72b6\\u6001\",\"url\":\"Admin\\/Module\\/setStatus\",\"id\":\"48\"}}', 1, 1505180658, 1505180658, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for fw_admin_nav
-- ----------------------------
DROP TABLE IF EXISTS `fw_admin_nav`;
CREATE TABLE `fw_admin_nav` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(63) NOT NULL DEFAULT '' COMMENT '导航名称',
  `title` varchar(31) NOT NULL DEFAULT '' COMMENT '导航标题',
  `type` varchar(15) NOT NULL DEFAULT '0' COMMENT '导航类型',
  `value` varchar(127) NOT NULL DEFAULT '' COMMENT '导航值',
  `target` varchar(11) NOT NULL DEFAULT '' COMMENT '打开方式',
  `icon` varchar(32) NOT NULL DEFAULT '' COMMENT '图标',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='前台导航表';

-- ----------------------------
-- Records of fw_admin_nav
-- ----------------------------
BEGIN;
INSERT INTO `fw_admin_nav` VALUES (1, 0, 'home', '首页', 'link', '', '', 'fa-archive', 1441293186, 1441297331, 0, 1);
INSERT INTO `fw_admin_nav` VALUES (2, 0, 'user', '用户', 'module', 'User', '', 'fa fa-users', 1453102131, 1453102131, 0, 1);
INSERT INTO `fw_admin_nav` VALUES (3, 0, 'cms', 'CMS', 'module', 'Cms', '', 'fa fa-newspaper-o', 1453102270, 1453102270, 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for fw_admin_theme
-- ----------------------------
DROP TABLE IF EXISTS `fw_admin_theme`;
CREATE TABLE `fw_admin_theme` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '名称',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '标题',
  `description` varchar(127) NOT NULL DEFAULT '' COMMENT '描述',
  `developer` varchar(32) NOT NULL DEFAULT '' COMMENT '开发者',
  `version` varchar(8) NOT NULL DEFAULT '' COMMENT '版本',
  `config` text COMMENT '主题配置',
  `current` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否当前主题',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='前台主题表';

-- ----------------------------
-- Table structure for fw_admin_upload
-- ----------------------------
DROP TABLE IF EXISTS `fw_admin_upload`;
CREATE TABLE `fw_admin_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'UID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '文件链接',
  `ext` char(4) NOT NULL DEFAULT '' COMMENT '文件类型',
  `size` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件sha1编码',
  `location` varchar(15) NOT NULL DEFAULT '' COMMENT '文件存储位置',
  `download` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='文件上传表';

-- ----------------------------
-- Records of fw_admin_upload
-- ----------------------------
BEGIN;
INSERT INTO `fw_admin_upload` VALUES (25, 1, '新建文本文档.txt', '/Uploads/2017-09/59b628a9337bd.txt', '', 'txt', 62, 'c051ec633060723e7936a0d1f7c706d2', '4a5ee8d84e0f3ad4824bef2521a1b76caa76b4ed', 'Local', 0, 1505110185, 1505110185, 0, 1);
INSERT INTO `fw_admin_upload` VALUES (26, 3, '1.txt', '/Uploads/2017-09/59b8fedbc3c97.txt', '', 'txt', 16, '49cded5debcf38a6eafc45cec49666cd', 'ec73df76fa785ab5171a473b774a1f4ec91b4760', 'Local', 0, 1505296091, 1505296091, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for fw_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `fw_admin_user`;
CREATE TABLE `fw_admin_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'UID',
  `user_type` int(11) NOT NULL DEFAULT '1' COMMENT '用户类型',
  `nickname` varchar(63) NOT NULL DEFAULT '' COMMENT '昵称',
  `username` varchar(31) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(63) NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(63) NOT NULL DEFAULT '' COMMENT '邮箱',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `avatar` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '头像',
  `score` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_type` varchar(15) NOT NULL DEFAULT '' COMMENT '注册方式',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  `vipId` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员有效期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='用户账号表';

-- ----------------------------
-- Records of fw_admin_user
-- ----------------------------
BEGIN;
INSERT INTO `fw_admin_user` VALUES (1, 1, '超级管理员', 'admin', '7e6a885b019bfc492d3ff6d209f47ac2', '', '', 0, 0, 0.00, 0, '', 1438651748, 1501578198, 1, 1, 0);
INSERT INTO `fw_admin_user` VALUES (2, 2, '', 'admin2', '7e6a885b019bfc492d3ff6d209f47ac2', '', '', 0, 0, 0.00, 0, 'admin', 1496210259, 1505108530, 1, 1, 0);
INSERT INTO `fw_admin_user` VALUES (3, 2, '', 'user1', 'b7aebc807e9844d9148e5cb32c6ff885', 'newbie91521@163.com', '18121029523', 0, 0, 0.00, 2130706433, 'admin', 1505117796, 1505545389, 1, 2, 1631944781);
INSERT INTO `fw_admin_user` VALUES (13, 2, '', '我师父', '9119f83e18b15aaaf90ce87624522cce', '发的发的发', 'fasdfsdf', 0, 0, 0.00, 0, '', 0, 1505812506, 0, 1, 0);
INSERT INTO `fw_admin_user` VALUES (14, 2, '', '哈哈哈', '3f236576d213b9a818cc5b9ef96610f1', '447936059@qq.com', '13333333333', 0, 0, 0.00, 0, '', 1505548436, 0, 1, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for fw_cms_duourl
-- ----------------------------
DROP TABLE IF EXISTS `fw_cms_duourl`;
CREATE TABLE `fw_cms_duourl` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` text NOT NULL COMMENT '题标',
  `tztime` text,
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态0禁用1启用',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `huoma` varchar(255) DEFAULT NULL,
  `d` varchar(255) DEFAULT NULL,
  `uid` int(11) DEFAULT '0',
  `type` tinyint(1) unsigned DEFAULT '2' COMMENT '1单网址2多网址',
  `tztype` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `status` (`status`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fw_cms_duourl
-- ----------------------------
BEGIN;
INSERT INTO `fw_cms_duourl` VALUES (2, 'www.livecode1.com|||www.livecode2.com', NULL, 0, 1, 1505110505, 1505887545, 'http://www.livecode.com/index.php/huoma/duo?d=5m5bn5uqx', '5m5bn5uqx', 1, 2, 2);
COMMIT;

-- ----------------------------
-- Table structure for fw_cms_phone
-- ----------------------------
DROP TABLE IF EXISTS `fw_cms_phone`;
CREATE TABLE `fw_cms_phone` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(500) NOT NULL COMMENT '题标',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态0禁用1启用',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `huoma` varchar(255) DEFAULT NULL,
  `d` varchar(255) DEFAULT NULL,
  `uid` int(11) DEFAULT '0',
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '1单网址2多网址',
  `tztype` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `status` (`status`) USING BTREE,
  KEY `title` (`title`(333))
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fw_cms_phone
-- ----------------------------
BEGIN;
INSERT INTO `fw_cms_phone` VALUES (1, 'www.livecode.com1', 0, 1, 1505108175, 1505444122, 'http://www.livecode.com/index.php/huoma/?d=jmusvduj3', 'jmusvduj3', 1, 1, 1);
INSERT INTO `fw_cms_phone` VALUES (2, 'www.livecode.com', 0, 1, 1505110103, 1505110103, 'http://www.livecode.com/index.php/huoma/?d=eooadp6xj', 'eooadp6xj', 1, 1, 1);
INSERT INTO `fw_cms_phone` VALUES (8, '1112', 0, 1, 1505459680, 1505459712, 'http://www.livecode.com/index.php/huoma/?d=9mzwfp2hs', '9mzwfp2hs', 3, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for fw_cms_sales_moban
-- ----------------------------
DROP TABLE IF EXISTS `fw_cms_sales_moban`;
CREATE TABLE `fw_cms_sales_moban` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) NOT NULL COMMENT '题标',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态0禁用1启用',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for fw_orders
-- ----------------------------
DROP TABLE IF EXISTS `fw_orders`;
CREATE TABLE `fw_orders` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(30) NOT NULL,
  `userId` int(11) NOT NULL,
  `orderStatus` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '-1待付款,1已付款',
  `vipId` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1基础会员,2高级会员,3定制会员',
  `year` tinyint(10) NOT NULL DEFAULT '1' COMMENT '有效期',
  `isNew` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1新开,0续费',
  `payType` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0支付宝,1微信,2汇款',
  `payMoney` decimal(11,2) NOT NULL DEFAULT '0.00',
  `tradeNo` varchar(50) DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `pay_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`orderId`),
  KEY `userId` (`userId`),
  KEY `orderStatus` (`orderStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_orders
-- ----------------------------
BEGIN;
INSERT INTO `fw_orders` VALUES (3, '20170919150578733245', 3, -1, 2, 1, 1, 0, 3200.00, NULL, 1505787332, 0, 1);
INSERT INTO `fw_orders` VALUES (4, '2017091915057876713579', 3, -1, 2, 3, 1, 0, 8400.00, NULL, 1505787671, 1505798826, 1);
INSERT INTO `fw_orders` VALUES (5, '2017091915057877316572', 3, -1, 2, 2, 0, 0, 6000.00, NULL, 1505787731, 0, 1);
INSERT INTO `fw_orders` VALUES (6, '2017091915057898523251', 3, -1, 3, 2, 1, 0, 9600.00, NULL, 1505789852, 0, 1);
INSERT INTO `fw_orders` VALUES (7, '2017091915057900821991', 14, 1, 2, 1, 1, 0, 3200.00, NULL, 1505790082, 1505878080, 1);
INSERT INTO `fw_orders` VALUES (8, '2017091915057900911085', 3, 1, 3, 2, 1, 2, 9600.00, '暂无', 1505790091, 1505798726, 1);
INSERT INTO `fw_orders` VALUES (15, '2017091915058144990960', 14, 1, 6, 9, 0, 1, 2997.00, '暂无', 1505814499, 1505814505, 1);
COMMIT;

-- ----------------------------
-- Table structure for fw_vip
-- ----------------------------
DROP TABLE IF EXISTS `fw_vip`;
CREATE TABLE `fw_vip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '套餐名称',
  `is_recommed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否前台推荐',
  `is_show` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否前台显示',
  `sort` tinyint(4) NOT NULL DEFAULT '1',
  `livecode_count` int(11) NOT NULL COMMENT '活码数量',
  `jump_url_count` int(11) NOT NULL COMMENT '网址数量',
  `batch_upload` tinyint(4) NOT NULL DEFAULT '0' COMMENT '批量上传网址',
  `batch_edit` tinyint(4) NOT NULL DEFAULT '0' COMMENT '批量修改网址',
  `batch_download` tinyint(4) NOT NULL DEFAULT '0' COMMENT '批量下载活码图片',
  `special_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '特殊类型定制',
  `single_url` tinyint(4) NOT NULL DEFAULT '0' COMMENT '独立域名',
  `single_host` tinyint(4) NOT NULL DEFAULT '0' COMMENT '独立主机',
  `count_track` tinyint(4) NOT NULL DEFAULT '0' COMMENT '统计追踪',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_vip
-- ----------------------------
BEGIN;
INSERT INTO `fw_vip` VALUES (1, '基础版', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0);
INSERT INTO `fw_vip` VALUES (2, '高级版', 0, 1, 112, 11, 5, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `fw_vip` VALUES (3, '定制版', 0, 1, 1, 12, 3, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `fw_vip` VALUES (12, '来个新套餐', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0);
INSERT INTO `fw_vip` VALUES (13, 'fdsf', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `fw_vip` VALUES (22, 'fdsf浮动', 0, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for fw_vip_price
-- ----------------------------
DROP TABLE IF EXISTS `fw_vip_price`;
CREATE TABLE `fw_vip_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vipId` tinyint(1) NOT NULL DEFAULT '1',
  `year` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员年限',
  `price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '会员价格',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_vip_price
-- ----------------------------
BEGIN;
INSERT INTO `fw_vip_price` VALUES (1, 1, 11, 2000.00);
INSERT INTO `fw_vip_price` VALUES (2, 14, 2, 3.00);
INSERT INTO `fw_vip_price` VALUES (3, 1, 3, 1600.00);
INSERT INTO `fw_vip_price` VALUES (4, 1, 4, 1400.00);
INSERT INTO `fw_vip_price` VALUES (5, 1, 5, 1200.00);
INSERT INTO `fw_vip_price` VALUES (6, 2, 1, 3200.00);
INSERT INTO `fw_vip_price` VALUES (7, 2, 2, 3000.00);
INSERT INTO `fw_vip_price` VALUES (8, 2, 3, 2800.00);
INSERT INTO `fw_vip_price` VALUES (9, 2, 4, 2600.00);
INSERT INTO `fw_vip_price` VALUES (10, 2, 5, 2400.00);
INSERT INTO `fw_vip_price` VALUES (11, 3, 1, 5000.00);
INSERT INTO `fw_vip_price` VALUES (12, 3, 2, 4800.00);
INSERT INTO `fw_vip_price` VALUES (13, 6, 12, 2222.00);
INSERT INTO `fw_vip_price` VALUES (14, 7, 11, 5555.00);
INSERT INTO `fw_vip_price` VALUES (15, 8, 44, 33.00);
INSERT INTO `fw_vip_price` VALUES (16, 6, 127, 55555.00);
INSERT INTO `fw_vip_price` VALUES (17, 6, 9, 333.00);
INSERT INTO `fw_vip_price` VALUES (18, 6, 12, 34.00);
INSERT INTO `fw_vip_price` VALUES (20, 12, 5, 50000.00);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
