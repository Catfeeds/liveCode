/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50614
Source Host           : localhost:3306
Source Database       : crmihuoma

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2017-11-29 15:33:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `fw_admin_access`
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='后台管理员与用户组对应关系表';

-- ----------------------------
-- Records of fw_admin_access
-- ----------------------------
INSERT INTO `fw_admin_access` VALUES ('1', '1', '1', '1438651748', '1510900457', '0', '1');
INSERT INTO `fw_admin_access` VALUES ('2', '2', '2', '1510838928', '1510838928', '0', '1');
INSERT INTO `fw_admin_access` VALUES ('3', '3', '4', '1510838940', '1510900477', '0', '1');
INSERT INTO `fw_admin_access` VALUES ('4', '6', '3', '1510900711', '1510900711', '0', '1');

-- ----------------------------
-- Table structure for `fw_admin_addon`
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
INSERT INTO `fw_admin_addon` VALUES ('2', 'RocketToTop', '小火箭返回顶部', '小火箭返回顶部', '{\"status\":\"1\"}', 'OpenCMF', '1.2.0', '0', '0', '1505875334', '1505875334', '0', '1');

-- ----------------------------
-- Table structure for `fw_admin_banks`
-- ----------------------------
DROP TABLE IF EXISTS `fw_admin_banks`;
CREATE TABLE `fw_admin_banks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank` varchar(50) NOT NULL DEFAULT '',
  `userName` varchar(50) NOT NULL DEFAULT '',
  `bankName` varchar(255) NOT NULL DEFAULT '',
  `bankAccount` varchar(30) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_admin_banks
-- ----------------------------
INSERT INTO `fw_admin_banks` VALUES ('30', '招商银行', '夏泽中', '招商银行合肥肥西路支行', '6226 0955 1152 6803', '1', '1505962166');
INSERT INTO `fw_admin_banks` VALUES ('32', '徽商银行', '合肥泽琪信息科技有限公司', '徽商银行合肥稻香楼支行', '1020 9010 2100 1002 379', '1', '1505965401');
INSERT INTO `fw_admin_banks` VALUES ('29', '中国农业银行', '夏泽中', '中国农业银行安徽分行', '6228 4806 6840 7311 871', '1', '1505960940');

-- ----------------------------
-- Table structure for `fw_admin_config`
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
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of fw_admin_config
-- ----------------------------
INSERT INTO `fw_admin_config` VALUES ('1', '站点开关', 'TOGGLE_WEB_SITE', '1', '1', 'select', '0:关闭\r\n1:开启', '站点关闭后将不能访问', '1378898976', '1406992386', '1', '1');
INSERT INTO `fw_admin_config` VALUES ('2', '网站标题', 'WEB_SITE_TITLE', '活码管理系统-爱活码', '1', 'text', '', '网站标题前台显示标题', '1378898976', '1379235274', '2', '1');
INSERT INTO `fw_admin_config` VALUES ('3', '网站口号', 'WEB_SITE_SLOGAN', '爱活码 爱上活码', '1', 'text', '', '网站口号、宣传标语、一句话介绍', '1434081649', '1434081649', '3', '1');
INSERT INTO `fw_admin_config` VALUES ('5', '网站描述', 'WEB_SITE_DESCRIPTION', '爱活码二维码是一家提供免费的在线二维码生成服务，可以生成静态码、活码、微信二维码、淘宝二维码,网址跳转活码,微信群活码，比其他二维码服务商提供更优质的活码二维码服务', '1', 'textarea', '', '网站搜索引擎描述', '1378898976', '1379235841', '5', '1');
INSERT INTO `fw_admin_config` VALUES ('6', '网站关键字', 'WEB_SITE_KEYWORD', '活码,活码二维码,活码生成器,活码系统,活码二维码管理系统,草料二维码生成器,活码生成,码云,微信群活码系统,微信群活码裂变工具,网址跳转活码,网页跳转活码,链接跳转活码系统,活码管理系统,微信群活码,微信活码系统,微信群二维码工具,微信群活码裂变工具,微信二维码活码,永不过期群二维码,活码管理系统,爱活码,草料活码,群裂变系统,活码裂变,群二维码分流裂变,微信机器人,微群管家,淘客机器人,淘客助手', '1', 'textarea', '', '网站搜索引擎关键字', '1378898976', '1381390100', '6', '1');
INSERT INTO `fw_admin_config` VALUES ('7', '版权信息', 'WEB_SITE_COPYRIGHT', 'Copyright © 爱活码 All rights reserved.', '1', 'text', '', '设置在网站底部显示的版权信息，如“版权所有 © 2014-2015 科斯克网络科技”', '1406991855', '1406992583', '7', '1');
INSERT INTO `fw_admin_config` VALUES ('8', '网站备案号', 'WEB_SITE_ICP', '皖ICP备17007700号-1', '1', 'text', '', '设置在网站底部显示的备案号，如“苏ICP备1502009-2号\"', '1378900335', '1415983236', '8', '1');
INSERT INTO `fw_admin_config` VALUES ('9', '站点统计', 'WEB_SITE_STATISTICS', '<script>\r\nvar _hmt = _hmt || [];\r\n(function() {\r\n  var hm = document.createElement(\"script\");\r\n  hm.src = \"https://hm.baidu.com/hm.js?700c816fb6f01ac9de5ab2920ad619e7\";\r\n  var s = document.getElementsByTagName(\"script\")[0]; \r\n  s.parentNode.insertBefore(hm, s);\r\n})();\r\n</script>', '1', 'textarea', '', '支持百度、Google、cnzz等所有Javascript的统计代码', '1378900335', '1415983236', '9', '1');
INSERT INTO `fw_admin_config` VALUES ('11', '文件上传大小', 'UPLOAD_FILE_SIZE', '20', '2', 'num', '', '文件上传大小单位：MB', '1428681031', '1428681031', '1', '1');
INSERT INTO `fw_admin_config` VALUES ('12', '图片上传大小', 'UPLOAD_IMAGE_SIZE', '20', '2', 'num', '', '图片上传大小单位：MB', '1428681071', '1428681071', '2', '1');
INSERT INTO `fw_admin_config` VALUES ('13', '后台多标签', 'ADMIN_TABS', '0', '2', 'radio', '0:关闭\r\n1:开启', '', '1453445526', '1453445526', '3', '1');
INSERT INTO `fw_admin_config` VALUES ('14', '分页数量', 'ADMIN_PAGE_ROWS', '15', '2', 'num', '', '分页时每页的记录数', '1434019462', '1434019481', '4', '1');
INSERT INTO `fw_admin_config` VALUES ('15', '后台主题', 'ADMIN_THEME', 'green', '2', 'select', 'default:默认主题\r\nblue:蓝色理想\r\ngreen:绿色生活', '后台界面主题', '1436678171', '1436690570', '5', '1');
INSERT INTO `fw_admin_config` VALUES ('16', '开发模式', 'DEVELOP_MODE', '1', '3', 'select', '1:开启\r\n0:关闭', '开发模式下会显示菜单管理、配置管理、数据字典等开发者工具', '1432393583', '1432393583', '1', '1');
INSERT INTO `fw_admin_config` VALUES ('17', '是否显示页面Trace', 'SHOW_PAGE_TRACE', '0', '3', 'select', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '2', '1');
INSERT INTO `fw_admin_config` VALUES ('19', 'URL模式', 'URL_MODEL', '3', '4', 'select', '0:普通模式\r\n1:PATHINFO模式\r\n2:REWRITE模式\r\n3:兼容模式', '', '1438423248', '1438423248', '1', '1');
INSERT INTO `fw_admin_config` VALUES ('21', '配置分组', 'CONFIG_GROUP_LIST', '1:基本\r\n2:系统\r\n3:开发\r\n5:运营', '2', 'array', '', '配置分组', '1379228036', '1426930700', '5', '1');
INSERT INTO `fw_admin_config` VALUES ('35', '邮箱服务器端口', 'EMAIL_PORT', '465', '5', 'text', '', '', '1508375440', '1508375440', '11', '1');
INSERT INTO `fw_admin_config` VALUES ('36', '邮箱服务器帐号', 'EMAIL_ADDR', 'system@ihuoma.cn', '5', 'text', '', '用于发送注册/忘记密码邮件验证', '1508375570', '1508375570', '12', '1');
INSERT INTO `fw_admin_config` VALUES ('37', '邮箱服务器密码', 'EMAIL_PASS', 'XIAzezhong2017@6688..', '5', 'text', '', '', '1508375691', '1508375691', '13', '1');
INSERT INTO `fw_admin_config` VALUES ('34', '邮箱服务器', 'EMAIL_HOST', 'smtp.mxhichina.com', '5', 'text', '', '', '1508375330', '1508375330', '10', '1');
INSERT INTO `fw_admin_config` VALUES ('38', '通用活码域名', 'DOMAIN_URL', 'zeqiqr.com', '5', 'text', '', '用户未自定义域名的活码将解析到这个地址', '1508375938', '1508375938', '1', '1');
INSERT INTO `fw_admin_config` VALUES ('43', '首页联系电话', 'KEFU_TEL', '0551-65567790', '5', 'text', '', '', '1509530579', '1509530579', '16', '1');
INSERT INTO `fw_admin_config` VALUES ('39', '找回密码邮件', 'UPDATEPASS_CONTENT', '尊敬的会员: \r\n您好！您正在进行爱活码活码管理系统密码找回功能，验证码为【{#验证码#}】。如果此次操作不是您本人行为，那么当前账户可能存在安全隐患，请保存好验证码，不要泄漏给他人。', '5', 'textarea', '', '', '1509088008', '1509088128', '15', '1');
INSERT INTO `fw_admin_config` VALUES ('40', '注册邮件', 'REGIST_CONTENT', '尊敬的会员: \r\n您好！您正在进行爱活码活码管理系统注册操作，验证码为【{#验证码#}】。请保存好验证码，不要泄漏给他人。', '5', 'textarea', '', '', '1509088188', '1509088188', '14', '1');
INSERT INTO `fw_admin_config` VALUES ('41', '用户端域名', 'USER_DOMAIN', 'user.ihuoma.cn', '5', 'text', '', '', '1509342287', '1509342287', '2', '1');
INSERT INTO `fw_admin_config` VALUES ('42', '管理员后台域名', 'ADMIN_DOMAIN', 'crm.ihuoma.cn', '5', 'text', '', '', '1509342361', '1509342361', '3', '1');
INSERT INTO `fw_admin_config` VALUES ('44', '首页联系邮箱', 'KEFU_EMAIL', 'admin@ihuoma.cn', '5', 'text', '', '', '1509530656', '1509530656', '17', '1');
INSERT INTO `fw_admin_config` VALUES ('45', '首页联系QQ', 'KEFU_QQ', '673524506', '5', 'text', '', '', '1509530704', '1509530704', '18', '1');

-- ----------------------------
-- Table structure for `fw_admin_group`
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='部门信息表';

-- ----------------------------
-- Records of fw_admin_group
-- ----------------------------
INSERT INTO `fw_admin_group` VALUES ('1', '0', '超级管理员', '', '', '1426881003', '1427552428', '0', '1');
INSERT INTO `fw_admin_group` VALUES ('2', '0', '审核专员', '', '[[\"152\",\"160\",\"163\"]]', '1510831889', '1510831889', '1', '1');
INSERT INTO `fw_admin_group` VALUES ('3', '0', '客服专员', '', '[[\"14\",\"62\",\"63\",\"66\",\"115\",\"161\",\"162\",\"152\",\"160\",\"163\",\"48\",\"49\"]]', '1510831923', '1510832759', '2', '1');
INSERT INTO `fw_admin_group` VALUES ('4', '0', '运营总监', '', '[[\"1\",\"6\",\"14\",\"62\",\"63\",\"66\",\"115\",\"161\",\"162\",\"152\",\"160\",\"163\",\"153\",\"158\",\"159\",\"165\",\"154\",\"156\",\"157\",\"166\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"64\",\"65\",\"167\",\"54\",\"55\",\"56\",\"168\",\"5\",\"13\"]]', '1510838889', '1510838889', '3', '1');

-- ----------------------------
-- Table structure for `fw_admin_hook`
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
INSERT INTO `fw_admin_hook` VALUES ('1', 'AdminIndex', '后台首页小工具', '后台首页小工具', '1', '1446522155', '1446522155', '1');
INSERT INTO `fw_admin_hook` VALUES ('2', 'FormBuilderExtend', 'FormBuilder类型扩展Builder', '', '1', '1447831268', '1447831268', '1');
INSERT INTO `fw_admin_hook` VALUES ('3', 'UploadFile', '上传文件钩子', '', '1', '1407681961', '1407681961', '1');
INSERT INTO `fw_admin_hook` VALUES ('4', 'PageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '', '1', '1407681961', '1407681961', '1');
INSERT INTO `fw_admin_hook` VALUES ('5', 'PageFooter', '页面footer钩子，一般用于加载插件CSS文件和代码', 'RocketToTop', '1', '1407681961', '1407681961', '1');

-- ----------------------------
-- Table structure for `fw_admin_link`
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
INSERT INTO `fw_admin_link` VALUES ('1', '0', '快捷功能', '', 'fa-folder-open-o', '1446713441', '1446713450', '0', '1');
INSERT INTO `fw_admin_link` VALUES ('3', '1', '系统设置', 'Admin/Config/group', 'fa-wrench', '1446713460', '1446713460', '0', '1');

-- ----------------------------
-- Table structure for `fw_admin_menu`
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
) ENGINE=MyISAM AUTO_INCREMENT=260 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of fw_admin_menu
-- ----------------------------
INSERT INTO `fw_admin_menu` VALUES ('1', '0', '0', '系统', '0', '', 'fa fa-cog', '0', '1505210029', '1');
INSERT INTO `fw_admin_menu` VALUES ('4', '1', '0', '活码管理', '2', '', 'fa fa-folder-open-o', '0', '1505210029', '1');
INSERT INTO `fw_admin_menu` VALUES ('5', '1', '0', '系统功能', '1', '', 'fa fa-folder-open-o', '0', '1505554799', '1');
INSERT INTO `fw_admin_menu` VALUES ('6', '1', '0', '用户管理', '1', '', 'fa fa-folder-open-o', '0', '1505210055', '1');
INSERT INTO `fw_admin_menu` VALUES ('7', '4', '0', '网址跳转', '2', 'Admin/Phone/index', 'fa fa-list', '0', '1505210129', '1');
INSERT INTO `fw_admin_menu` VALUES ('8', '4', '0', '多网址跳转', '2', 'Admin/Duourl/index', 'fa fa-list', '0', '1505210266', '1');
INSERT INTO `fw_admin_menu` VALUES ('9', '4', '0', '产品活码', '2', 'Admin/Product/index', 'fa fa-list', '0', '1505210122', '1');
INSERT INTO `fw_admin_menu` VALUES ('10', '4', '0', '视频活码', '2', 'Admin/Video/index', 'fa fa-list', '0', '1505210128', '1');
INSERT INTO `fw_admin_menu` VALUES ('11', '4', '0', '活码生成', '2', 'Admin/Livecode/index', 'fa fa-list', '0', '1505210029', '1');
INSERT INTO `fw_admin_menu` VALUES ('13', '5', '0', '系统设置', '1', 'Admin/Config/group', 'fa fa-wrench', '0', '1505210777', '1');
INSERT INTO `fw_admin_menu` VALUES ('14', '6', '0', '会员管理', '1', 'Admin/User/index', 'fa fa-user', '0', '1505210028', '1');
INSERT INTO `fw_admin_menu` VALUES ('15', '7', '0', '新增', '2', 'Admin/Phone/add', '', '0', '1505210029', '-1');
INSERT INTO `fw_admin_menu` VALUES ('17', '11', '0', '新建目录', '2', 'Admin/Livecode/addmenu', '', '0', '1505210030', '-1');
INSERT INTO `fw_admin_menu` VALUES ('27', '8', '0', '新增', '2', 'Admin/Duourl/add', '', '0', '1505439785', '-1');
INSERT INTO `fw_admin_menu` VALUES ('207', '205', '25', '导出', '2', 'Admin/Video/outurl/type/1510119902', '', '0', '1510119902', '-1');
INSERT INTO `fw_admin_menu` VALUES ('208', '205', '25', '下载二维码', '2', 'Admin/Video/xzewm/type/1510119902', '', '0', '1510119902', '-1');
INSERT INTO `fw_admin_menu` VALUES ('211', '9', '25', '小产品', '2', 'Admin/Product/child/type/1510120134', '', '0', '1510120134', '1');
INSERT INTO `fw_admin_menu` VALUES ('34', '11', '0', '新增活码', '2', 'Admin/Livecode/add', '', '0', '1505455366', '-1');
INSERT INTO `fw_admin_menu` VALUES ('35', '11', '0', '下载二维码', '2', 'Admin/Livecode/xzewm', '', '0', '1505455452', '-1');
INSERT INTO `fw_admin_menu` VALUES ('36', '11', '0', '查看数据统计', '2', 'Admin/Livecode/view', '', '0', '1505457007', '-1');
INSERT INTO `fw_admin_menu` VALUES ('37', '11', '0', '编辑活码', '2', 'Admin/Livecode/edit', '', '0', '1505457343', '-1');
INSERT INTO `fw_admin_menu` VALUES ('43', '9', '0', '新增', '2', 'Admin/Product/add', '', '0', '1505550934', '-1');
INSERT INTO `fw_admin_menu` VALUES ('44', '9', '0', '新建目录', '2', 'Admin/Product/addmenu', '', '0', '1505551306', '-1');
INSERT INTO `fw_admin_menu` VALUES ('45', '9', '0', '下载二维码', '2', 'Admin/Product/xzewm', '', '0', '1505551431', '-1');
INSERT INTO `fw_admin_menu` VALUES ('46', '9', '0', '查看数据统计', '2', 'Admin/Product/view', '', '0', '1505551487', '-1');
INSERT INTO `fw_admin_menu` VALUES ('47', '9', '0', '编辑活码', '2', 'Admin/Product/edit', '', '0', '1505551588', '-1');
INSERT INTO `fw_admin_menu` VALUES ('48', '1', '0', '财务管理', '1', '', 'fa fa-folder-open-o', '0', '1505553794', '1');
INSERT INTO `fw_admin_menu` VALUES ('49', '48', '0', '订单中心', '1', 'Admin/Order/index', 'fa fa-bar-chart-o', '0', '1505553995', '1');
INSERT INTO `fw_admin_menu` VALUES ('50', '1', '0', '支付管理', '1', '', 'fa fa-folder-open-o', '0', '1505553799', '1');
INSERT INTO `fw_admin_menu` VALUES ('51', '50', '0', '支付宝', '1', 'Admin/Payconf/alipay', 'fa fa-credit-card', '0', '1505554606', '1');
INSERT INTO `fw_admin_menu` VALUES ('52', '50', '0', '微信', '1', 'Admin/Payconf/wechat', 'fa fa-credit-card', '0', '1505554695', '1');
INSERT INTO `fw_admin_menu` VALUES ('53', '50', '0', '汇款账号', '1', 'Admin/Payconf/bank', 'fa fa-credit-card', '0', '1505554725', '1');
INSERT INTO `fw_admin_menu` VALUES ('54', '50', '0', '套餐价格', '1', 'Admin/Vip/index', 'fa fa-credit-card', '0', '1505554792', '1');
INSERT INTO `fw_admin_menu` VALUES ('55', '54', '0', '新增', '1', 'Admin/Vip/add', '', '0', '1505805835', '-1');
INSERT INTO `fw_admin_menu` VALUES ('56', '54', '0', '编辑', '1', 'Admin/Vip/edit', '', '0', '1505805956', '-1');
INSERT INTO `fw_admin_menu` VALUES ('57', '1', '0', '账号管理', '2', '', 'fa fa-folder-open-o', '0', '1505814677', '1');
INSERT INTO `fw_admin_menu` VALUES ('58', '1', '0', '财务管理', '2', '', 'fa fa-folder-open-o', '0', '1505814780', '1');
INSERT INTO `fw_admin_menu` VALUES ('59', '57', '0', '密码修改', '2', 'Admin/Account/editPass', 'fa fa-list', '0', '1505815020', '1');
INSERT INTO `fw_admin_menu` VALUES ('60', '57', '0', '续费管理', '2', 'Admin/Account/fee', 'fa fa-list', '0', '1505815097', '1');
INSERT INTO `fw_admin_menu` VALUES ('61', '58', '0', '订单中心', '2', 'Admin/Account/order', 'fa fa-list', '0', '1505815175', '1');
INSERT INTO `fw_admin_menu` VALUES ('62', '14', '0', '新增', '1', 'Admin/User/add', '', '0', '1505899117', '-1');
INSERT INTO `fw_admin_menu` VALUES ('63', '14', '0', '编辑', '1', 'Admin/User/edit', '', '0', '1505899659', '-1');
INSERT INTO `fw_admin_menu` VALUES ('64', '53', '0', '新增汇款账号', '1', 'Admin/Payconf/add', '', '0', '1505959361', '-1');
INSERT INTO `fw_admin_menu` VALUES ('65', '53', '0', '编辑汇款账号', '1', 'Admin/Payconf/edit', '', '0', '1505959443', '-1');
INSERT INTO `fw_admin_menu` VALUES ('66', '14', '0', '续费', '1', 'Admin/User/fee', '', '0', '1505976986', '-1');
INSERT INTO `fw_admin_menu` VALUES ('194', '190', '25', '编辑活码', '2', 'Admin/Livecode/edit/type/1510042346', '', '0', '1510042346', '-1');
INSERT INTO `fw_admin_menu` VALUES ('92', '7', '0', '编辑', '2', 'Admin/Phone/edit', '', '0', '1506066075', '-1');
INSERT INTO `fw_admin_menu` VALUES ('93', '8', '0', '编辑', '2', 'Admin/Duourl/edit', '', '0', '1506066156', '-1');
INSERT INTO `fw_admin_menu` VALUES ('94', '8', '0', '导出网址', '2', 'Admin/Duourl/outurl', '', '0', '1506066214', '-1');
INSERT INTO `fw_admin_menu` VALUES ('95', '8', '0', '下载二维码', '2', 'Admin/Duourl/xzewm', '', '0', '1506066258', '-1');
INSERT INTO `fw_admin_menu` VALUES ('96', '8', '0', '批量修改跳转地址', '2', 'Admin/Duourl/edittzwz', '', '0', '1506066291', '-1');
INSERT INTO `fw_admin_menu` VALUES ('97', '7', '0', '批量修改跳转地址', '2', 'Admin/Phone/edittzwz', '', '0', '1506066342', '-1');
INSERT INTO `fw_admin_menu` VALUES ('98', '7', '0', '导出网址', '2', 'Admin/Phone/outurl', '', '0', '1506066372', '-1');
INSERT INTO `fw_admin_menu` VALUES ('99', '7', '0', '下载二维码', '2', 'Admin/Phone/xzewm', '', '0', '1506066390', '-1');
INSERT INTO `fw_admin_menu` VALUES ('100', '7', '0', '批量导入', '2', 'Admin/Phone/drurl', '', '0', '1506066411', '-1');
INSERT INTO `fw_admin_menu` VALUES ('103', '10', '0', '编辑', '2', 'Admin/Video/edit', '', '0', '1506309573', '-1');
INSERT INTO `fw_admin_menu` VALUES ('102', '10', '0', '新增', '2', 'Admin/Video/add', '', '0', '1506309507', '-1');
INSERT INTO `fw_admin_menu` VALUES ('104', '10', '0', '导出', '2', 'Admin/Video/outurl', '', '0', '1506309620', '-1');
INSERT INTO `fw_admin_menu` VALUES ('105', '10', '0', '下载', '2', 'Admin/Video/xzewm', '', '0', '1506309635', '-1');
INSERT INTO `fw_admin_menu` VALUES ('106', '7', '0', '数据统计', '2', 'Admin/Phone/view', '', '0', '1506416316', '-1');
INSERT INTO `fw_admin_menu` VALUES ('107', '8', '0', '数据统计', '2', 'Admin/Duourl/view', '', '0', '1506566192', '-1');
INSERT INTO `fw_admin_menu` VALUES ('108', '10', '0', '数据统计', '2', 'Admin/Video/view', '', '0', '1506568502', '-1');
INSERT INTO `fw_admin_menu` VALUES ('115', '14', '0', '域名管理', '1', 'Admin/User/domain', '', '0', '1508381295', '-1');
INSERT INTO `fw_admin_menu` VALUES ('114', '57', '0', '域名管理', '2', 'Admin/Account/domain', 'fa fa-list', '0', '1508311233', '1');
INSERT INTO `fw_admin_menu` VALUES ('116', '10', '0', '新建目录', '2', 'Admin/Video/addmenu', '', '0', '1509067666', '-1');
INSERT INTO `fw_admin_menu` VALUES ('215', '211', '25', '编辑活码', '2', 'Admin/Product/edit/type/1510120134', '', '0', '1510120134', '-1');
INSERT INTO `fw_admin_menu` VALUES ('206', '205', '25', '新增', '2', 'Admin/Video/add/type/1510119902', '', '0', '1510119902', '-1');
INSERT INTO `fw_admin_menu` VALUES ('214', '211', '25', '查看数据统计', '2', 'Admin/Product/view/type/1510120134', '', '0', '1510120134', '-1');
INSERT INTO `fw_admin_menu` VALUES ('205', '10', '25', '视频子目录', '2', 'Admin/Video/child/type/1510119902', '', '0', '1510119902', '1');
INSERT INTO `fw_admin_menu` VALUES ('128', '7', '0', '新建目录', '2', 'Admin/Phone/addmenu', '', '0', '1509075802', '-1');
INSERT INTO `fw_admin_menu` VALUES ('209', '205', '25', '查看数据统计', '2', 'Admin/Video/view/type/1510119902', '', '0', '1510119902', '-1');
INSERT INTO `fw_admin_menu` VALUES ('210', '205', '25', '编辑', '2', 'Admin/Video/edit/type/1510119902', '', '0', '1510119902', '-1');
INSERT INTO `fw_admin_menu` VALUES ('137', '8', '0', '新建目录', '2', 'Admin/Duourl/addmenu', '', '0', '1509082543', '-1');
INSERT INTO `fw_admin_menu` VALUES ('193', '190', '25', '查看数据统计', '2', 'Admin/Livecode/view/type/1510042346', '', '0', '1510042346', '-1');
INSERT INTO `fw_admin_menu` VALUES ('192', '190', '25', '下载二维码', '2', 'Admin/Livecode/xzewm/type/1510042346', '', '0', '1510042346', '-1');
INSERT INTO `fw_admin_menu` VALUES ('191', '190', '25', '新增活码', '2', 'Admin/Livecode/add/type/1510042346', '', '0', '1510042346', '-1');
INSERT INTO `fw_admin_menu` VALUES ('190', '11', '25', '子目录一', '2', 'Admin/Livecode/child/type/1510042346', '', '0', '1510042346', '1');
INSERT INTO `fw_admin_menu` VALUES ('213', '211', '25', '下载二维码', '2', 'Admin/Product/xzewm/type/1510120134', '', '0', '1510120134', '-1');
INSERT INTO `fw_admin_menu` VALUES ('212', '211', '25', '新增活码', '2', 'Admin/Product/add/type/1510120134', '', '0', '1510120134', '-1');
INSERT INTO `fw_admin_menu` VALUES ('152', '6', '0', '活码管理', '1', 'Admin/Checkcode/index', 'fa fa-th', '0', '1505210035', '1');
INSERT INTO `fw_admin_menu` VALUES ('162', '14', '0', '后台管理', '1', 'Admin/User/adminmanage', '', '0', '1509611265', '-1');
INSERT INTO `fw_admin_menu` VALUES ('153', '6', '0', '管理员管理', '1', 'Admin/Access/index', 'fa fa-lock', '0', '1509586641', '1');
INSERT INTO `fw_admin_menu` VALUES ('154', '6', '0', '用户组管理', '1', 'Admin/Group/index', 'fa fa-sitemap', '0', '1509586895', '1');
INSERT INTO `fw_admin_menu` VALUES ('156', '154', '0', '新增', '1', 'Admin/Group/add', '', '0', '1509587609', '-1');
INSERT INTO `fw_admin_menu` VALUES ('157', '154', '0', '编辑', '1', 'Admin/Group/edit', '', '0', '1509587646', '-1');
INSERT INTO `fw_admin_menu` VALUES ('158', '153', '0', '编辑', '1', 'Admin/Access/edit', '', '0', '1509587706', '-1');
INSERT INTO `fw_admin_menu` VALUES ('159', '153', '0', '新增', '1', 'Admin/Access/add', '', '0', '1509587748', '-1');
INSERT INTO `fw_admin_menu` VALUES ('160', '152', '0', '编辑', '1', 'Admin/Checkcode/edit', '', '0', '1509610489', '-1');
INSERT INTO `fw_admin_menu` VALUES ('161', '14', '0', '设置状态', '1', 'Admin/User/setStatus', '', '0', '1509610839', '-1');
INSERT INTO `fw_admin_menu` VALUES ('163', '152', '0', '设置状态', '1', 'Admin/Checkcode/setStatus', '', '0', '1509611415', '-1');
INSERT INTO `fw_admin_menu` VALUES ('165', '153', '0', '设置状态', '1', 'Admin/Access/setStatus', '', '0', '1509611530', '-1');
INSERT INTO `fw_admin_menu` VALUES ('166', '154', '0', '设置状态', '1', 'Admin/Group/setStatus', '', '0', '1509611566', '-1');
INSERT INTO `fw_admin_menu` VALUES ('167', '53', '0', '设置状态', '1', 'Admin/Payconf/setStatus', '', '0', '1509611652', '-1');
INSERT INTO `fw_admin_menu` VALUES ('168', '54', '0', '设置状态', '1', 'Admin/Vip/setStatus', '', '0', '1509611682', '-1');

-- ----------------------------
-- Table structure for `fw_admin_module`
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
INSERT INTO `fw_admin_module` VALUES ('1', 'Admin', '系统', '', 'fa fa-cog', '#3CA6F1', '核心系统', '', '1.2.0', '', '', '{\"1\":{\"pid\":\"0\",\"title\":\"\\u7cfb\\u7edf\",\"icon\":\"fa fa-cog\",\"level\":\"system\",\"id\":\"1\"},\"58\":{\"pid\":\"1\",\"title\":\"\\u6d3b\\u7801\\u7ba1\\u7406\",\"icon\":\"fa fa-folder-open-o\",\"id\":\"58\"},\"59\":{\"pid\":\"58\",\"title\":\"\\u7f51\\u5740\\u8df3\\u8f6c\",\"icon\":\"fa fa-list\",\"url\":\"Admin\\/Phone\\/index\",\"id\":\"59\"},\"61\":{\"pid\":\"59\",\"title\":\"\\u6dfb\\u52a0\",\"url\":\"Admin\\/Phone\\/add\",\"id\":\"61\"},\"63\":{\"pid\":\"59\",\"title\":\"\\u7f16\\u8f91\",\"url\":\"Admin\\/Phone\\/edit\",\"id\":\"63\"},\"60\":{\"pid\":\"59\",\"title\":\"\\u5220\\u9664\",\"url\":\"Admin\\/Phone\\/setStatus\",\"id\":\"60\"},\"62\":{\"pid\":\"59\",\"title\":\"\\u6279\\u91cf\\u5bfc\\u5165\\u7f51\\u5740\",\"url\":\"Admin\\/Phone\\/drurl\",\"id\":\"62\"},\"64\":{\"pid\":\"59\",\"title\":\"\\u5bfc\\u51fa\",\"url\":\"Admin\\/Phone\\/outurl\",\"id\":\"64\"},\"65\":{\"pid\":\"59\",\"title\":\"\\u4e0b\\u8f7d\\u4e8c\\u7ef4\\u7801\",\"url\":\"Admin\\/Phone\\/xzewm\",\"id\":\"65\"},\"67\":{\"pid\":\"59\",\"title\":\"\\u6279\\u91cf\\u4fee\\u6539\\u8df3\\u8f6c\\u7f51\\u5740\",\"url\":\"Admin\\/Phone\\/edittzwz\",\"id\":\"67\"},\"66\":{\"pid\":\"59\",\"title\":\"\\u4e0a\\u4f20\\u6587\\u4ef6\",\"url\":\"Admin\\/Upload\\/upload\",\"id\":\"66\"},\"68\":{\"pid\":\"58\",\"title\":\"\\u591a\\u7f51\\u5740\\u8df3\\u8f6c\",\"icon\":\"fa fa-list\",\"url\":\"Admin\\/Duourl\\/index\",\"id\":\"68\"},\"69\":{\"pid\":\"68\",\"title\":\"\\u6dfb\\u52a0\",\"url\":\"Admin\\/Duourl\\/add\",\"id\":\"69\"},\"70\":{\"pid\":\"68\",\"title\":\"\\u7f16\\u8f91\",\"url\":\"Admin\\/Duourl\\/edit\",\"id\":\"70\"},\"71\":{\"pid\":\"68\",\"title\":\"\\u5220\\u9664\",\"url\":\"Admin\\/Duourl\\/setStatus\",\"id\":\"71\"},\"72\":{\"pid\":\"68\",\"title\":\"\\u5bfc\\u51fa\",\"url\":\"Admin\\/Duourl\\/outurl\",\"id\":\"72\"},\"73\":{\"pid\":\"68\",\"title\":\"\\u4e0b\\u8f7d\\u4e8c\\u7ef4\\u7801\",\"url\":\"Admin\\/Duourl\\/xzewm\",\"id\":\"73\"},\"74\":{\"pid\":\"68\",\"title\":\"\\u6279\\u91cf\\u4fee\\u6539\\u8df3\\u8f6c\\u7f51\\u5740\",\"url\":\"Admin\\/Duourl\\/edittzwz\",\"id\":\"74\"},\"75\":{\"pid\":\"68\",\"title\":\"\\u4e0a\\u4f20\\u6587\\u4ef6\",\"url\":\"Admin\\/Upload\\/upload\",\"id\":\"75\"},\"2\":{\"pid\":\"1\",\"title\":\"\\u7cfb\\u7edf\\u529f\\u80fd\",\"icon\":\"fa fa-folder-open-o\",\"id\":\"2\"},\"3\":{\"pid\":\"2\",\"title\":\"\\u7cfb\\u7edf\\u8bbe\\u7f6e\",\"icon\":\"fa fa-wrench\",\"url\":\"Admin\\/Config\\/group\",\"id\":\"3\"},\"4\":{\"pid\":\"3\",\"title\":\"\\u4fee\\u6539\\u8bbe\\u7f6e\",\"url\":\"Admin\\/Config\\/groupSave\",\"id\":\"4\"},\"5\":{\"pid\":\"2\",\"title\":\"\\u5bfc\\u822a\\u7ba1\\u7406\",\"icon\":\"fa fa-map-signs\",\"url\":\"Admin\\/Nav\\/index\",\"id\":\"5\"},\"6\":{\"pid\":\"5\",\"title\":\"\\u65b0\\u589e\",\"url\":\"Admin\\/Nav\\/add\",\"id\":\"6\"},\"7\":{\"pid\":\"5\",\"title\":\"\\u7f16\\u8f91\",\"url\":\"Admin\\/Nav\\/edit\",\"id\":\"7\"},\"8\":{\"pid\":\"5\",\"title\":\"\\u8bbe\\u7f6e\\u72b6\\u6001\",\"url\":\"Admin\\/Nav\\/setStatus\",\"id\":\"8\"},\"9\":{\"pid\":\"2\",\"title\":\"\\u5feb\\u6377\\u94fe\\u63a5\",\"icon\":\"fa fa-link\",\"url\":\"Admin\\/Link\\/index\",\"id\":\"9\"},\"10\":{\"pid\":\"9\",\"title\":\"\\u65b0\\u589e\",\"url\":\"Admin\\/Link\\/add\",\"id\":\"10\"},\"11\":{\"pid\":\"9\",\"title\":\"\\u7f16\\u8f91\",\"url\":\"Admin\\/Link\\/edit\",\"id\":\"11\"},\"12\":{\"pid\":\"9\",\"title\":\"\\u8bbe\\u7f6e\\u72b6\\u6001\",\"url\":\"Admin\\/Link\\/setStatus\",\"id\":\"12\"},\"13\":{\"pid\":\"2\",\"title\":\"\\u914d\\u7f6e\\u7ba1\\u7406\",\"icon\":\"fa fa-cogs\",\"url\":\"Admin\\/Config\\/index\",\"id\":\"13\"},\"14\":{\"pid\":\"13\",\"title\":\"\\u65b0\\u589e\",\"url\":\"Admin\\/Config\\/add\",\"id\":\"14\"},\"15\":{\"pid\":\"13\",\"title\":\"\\u7f16\\u8f91\",\"url\":\"Admin\\/Config\\/edit\",\"id\":\"15\"},\"16\":{\"pid\":\"13\",\"title\":\"\\u8bbe\\u7f6e\\u72b6\\u6001\",\"url\":\"Admin\\/Config\\/setStatus\",\"id\":\"16\"},\"17\":{\"pid\":\"2\",\"title\":\"\\u4e0a\\u4f20\\u7ba1\\u7406\",\"icon\":\"fa fa-upload\",\"url\":\"Admin\\/Upload\\/index\",\"id\":\"17\"},\"18\":{\"pid\":\"17\",\"title\":\"\\u4e0a\\u4f20\\u6587\\u4ef6\",\"url\":\"Admin\\/Upload\\/upload\",\"id\":\"18\"},\"19\":{\"pid\":\"17\",\"title\":\"\\u5220\\u9664\\u6587\\u4ef6\",\"url\":\"Admin\\/Upload\\/delete\",\"id\":\"19\"},\"20\":{\"pid\":\"17\",\"title\":\"\\u8bbe\\u7f6e\\u72b6\\u6001\",\"url\":\"Admin\\/Upload\\/setStatus\",\"id\":\"20\"},\"21\":{\"pid\":\"17\",\"title\":\"\\u4e0b\\u8f7d\\u8fdc\\u7a0b\\u56fe\\u7247\",\"url\":\"Admin\\/Upload\\/downremoteimg\",\"id\":\"21\"},\"22\":{\"pid\":\"17\",\"title\":\"\\u6587\\u4ef6\\u6d4f\\u89c8\",\"url\":\"Admin\\/Upload\\/fileManager\",\"id\":\"22\"},\"23\":{\"pid\":\"1\",\"title\":\"\\u7cfb\\u7edf\\u6743\\u9650\",\"icon\":\"fa fa-folder-open-o\",\"id\":\"23\"},\"24\":{\"pid\":\"23\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa fa-user\",\"url\":\"Admin\\/User\\/index\",\"id\":\"24\"},\"25\":{\"pid\":\"24\",\"title\":\"\\u65b0\\u589e\",\"url\":\"Admin\\/User\\/add\",\"id\":\"25\"},\"26\":{\"pid\":\"24\",\"title\":\"\\u7f16\\u8f91\",\"url\":\"Admin\\/User\\/edit\",\"id\":\"26\"},\"27\":{\"pid\":\"24\",\"title\":\"\\u8bbe\\u7f6e\\u72b6\\u6001\",\"url\":\"Admin\\/User\\/setStatus\",\"id\":\"27\"},\"28\":{\"pid\":\"23\",\"title\":\"\\u7ba1\\u7406\\u5458\\u7ba1\\u7406\",\"icon\":\"fa fa-lock\",\"url\":\"Admin\\/Access\\/index\",\"id\":\"28\"},\"29\":{\"pid\":\"28\",\"title\":\"\\u65b0\\u589e\",\"url\":\"Admin\\/Access\\/add\",\"id\":\"29\"},\"30\":{\"pid\":\"28\",\"title\":\"\\u7f16\\u8f91\",\"url\":\"Admin\\/Access\\/edit\",\"id\":\"30\"},\"31\":{\"pid\":\"28\",\"title\":\"\\u8bbe\\u7f6e\\u72b6\\u6001\",\"url\":\"Admin\\/Access\\/setStatus\",\"id\":\"31\"},\"32\":{\"pid\":\"23\",\"title\":\"\\u7528\\u6237\\u7ec4\\u7ba1\\u7406\",\"icon\":\"fa fa-sitemap\",\"url\":\"Admin\\/Group\\/index\",\"id\":\"32\"},\"33\":{\"pid\":\"32\",\"title\":\"\\u65b0\\u589e\",\"url\":\"Admin\\/Group\\/add\",\"id\":\"33\"},\"34\":{\"pid\":\"32\",\"title\":\"\\u7f16\\u8f91\",\"url\":\"Admin\\/Group\\/edit\",\"id\":\"34\"},\"35\":{\"pid\":\"32\",\"title\":\"\\u8bbe\\u7f6e\\u72b6\\u6001\",\"url\":\"Admin\\/Group\\/setStatus\",\"id\":\"35\"},\"36\":{\"pid\":\"1\",\"title\":\"\\u6269\\u5c55\\u4e2d\\u5fc3\",\"icon\":\"fa fa-folder-open-o\",\"id\":\"36\"},\"37\":{\"pid\":\"36\",\"title\":\"\\u524d\\u53f0\\u4e3b\\u9898\",\"icon\":\"fa fa-adjust\",\"url\":\"Admin\\/Theme\\/index\",\"id\":\"37\"},\"38\":{\"pid\":\"37\",\"title\":\"\\u5b89\\u88c5\",\"url\":\"Admin\\/Theme\\/install\",\"id\":\"38\"},\"39\":{\"pid\":\"37\",\"title\":\"\\u5378\\u8f7d\",\"url\":\"Admin\\/Theme\\/uninstall\",\"id\":\"39\"},\"40\":{\"pid\":\"37\",\"title\":\"\\u66f4\\u65b0\\u4fe1\\u606f\",\"url\":\"Admin\\/Theme\\/updateInfo\",\"id\":\"40\"},\"41\":{\"pid\":\"37\",\"title\":\"\\u8bbe\\u7f6e\\u72b6\\u6001\",\"url\":\"Admin\\/Theme\\/setStatus\",\"id\":\"41\"},\"42\":{\"pid\":\"37\",\"title\":\"\\u5207\\u6362\\u4e3b\\u9898\",\"url\":\"Admin\\/Theme\\/setCurrent\",\"id\":\"42\"},\"43\":{\"pid\":\"37\",\"title\":\"\\u53d6\\u6d88\\u4e3b\\u9898\",\"url\":\"Admin\\/Theme\\/cancel\",\"id\":\"43\"},\"44\":{\"pid\":\"36\",\"title\":\"\\u529f\\u80fd\\u6a21\\u5757\",\"icon\":\"fa fa-th-large\",\"url\":\"Admin\\/Module\\/index\",\"id\":\"44\"},\"45\":{\"pid\":\"44\",\"title\":\"\\u5b89\\u88c5\",\"url\":\"Admin\\/Module\\/install\",\"id\":\"45\"},\"46\":{\"pid\":\"44\",\"title\":\"\\u5378\\u8f7d\",\"url\":\"Admin\\/Module\\/uninstall\",\"id\":\"46\"},\"47\":{\"pid\":\"44\",\"title\":\"\\u66f4\\u65b0\\u4fe1\\u606f\",\"url\":\"Admin\\/Module\\/updateInfo\",\"id\":\"47\"},\"48\":{\"pid\":\"44\",\"title\":\"\\u8bbe\\u7f6e\\u72b6\\u6001\",\"url\":\"Admin\\/Module\\/setStatus\",\"id\":\"48\"},\"49\":{\"pid\":\"36\",\"title\":\"\\u63d2\\u4ef6\\u7ba1\\u7406\",\"icon\":\"fa fa-th\",\"url\":\"Admin\\/Addon\\/index\",\"id\":\"49\"},\"50\":{\"pid\":\"49\",\"title\":\"\\u5b89\\u88c5\",\"url\":\"Admin\\/Addon\\/install\",\"id\":\"50\"},\"51\":{\"pid\":\"49\",\"title\":\"\\u5378\\u8f7d\",\"url\":\"Admin\\/Addon\\/uninstall\",\"id\":\"51\"},\"52\":{\"pid\":\"49\",\"title\":\"\\u8fd0\\u884c\",\"url\":\"Admin\\/Addon\\/execute\",\"id\":\"52\"},\"53\":{\"pid\":\"49\",\"title\":\"\\u8bbe\\u7f6e\",\"url\":\"Admin\\/Addon\\/config\",\"id\":\"53\"},\"54\":{\"pid\":\"49\",\"title\":\"\\u540e\\u53f0\\u7ba1\\u7406\",\"url\":\"Admin\\/Addon\\/adminList\",\"id\":\"54\"},\"55\":{\"pid\":\"54\",\"title\":\"\\u65b0\\u589e\\u6570\\u636e\",\"url\":\"Admin\\/Addon\\/adminAdd\",\"id\":\"55\"},\"56\":{\"pid\":\"54\",\"title\":\"\\u7f16\\u8f91\\u6570\\u636e\",\"url\":\"Admin\\/Addon\\/adminEdit\",\"id\":\"56\"},\"57\":{\"pid\":\"54\",\"title\":\"\\u8bbe\\u7f6e\\u72b6\\u6001\",\"url\":\"Admin\\/Addon\\/setStatus\",\"id\":\"57\"}}', '1', '1438651748', '1453274303', '0', '1');
INSERT INTO `fw_admin_module` VALUES ('2', 'User', '用户后台', '', 'fa fa-cog', '#3CA6F1', '核心系统', 'Hung', '1.3.0', '', '', '{\"1\":{\"pid\":\"0\",\"title\":\"\\u7cfb\\u7edf\",\"icon\":\"fa fa-cog\",\"level\":\"system\",\"id\":\"1\"},\"58\":{\"pid\":\"1\",\"title\":\"\\u6d3b\\u7801\\u7ba1\\u7406\",\"icon\":\"fa fa-folder-open-o\",\"id\":\"58\"},\"59\":{\"pid\":\"58\",\"title\":\"\\u7f51\\u5740\\u8df3\\u8f6c\",\"icon\":\"fa fa-list\",\"url\":\"Admin\\/Phone\\/index\",\"id\":\"59\"},\"61\":{\"pid\":\"59\",\"title\":\"\\u6dfb\\u52a0\",\"url\":\"Admin\\/Phone\\/add\",\"id\":\"61\"},\"63\":{\"pid\":\"59\",\"title\":\"\\u7f16\\u8f91\",\"url\":\"Admin\\/Phone\\/edit\",\"id\":\"63\"},\"60\":{\"pid\":\"59\",\"title\":\"\\u5220\\u9664\",\"url\":\"Admin\\/Phone\\/setStatus\",\"id\":\"60\"},\"62\":{\"pid\":\"59\",\"title\":\"\\u6279\\u91cf\\u5bfc\\u5165\\u7f51\\u5740\",\"url\":\"Admin\\/Phone\\/drurl\",\"id\":\"62\"},\"64\":{\"pid\":\"59\",\"title\":\"\\u5bfc\\u51fa\",\"url\":\"Admin\\/Phone\\/outurl\",\"id\":\"64\"},\"65\":{\"pid\":\"59\",\"title\":\"\\u4e0b\\u8f7d\\u4e8c\\u7ef4\\u7801\",\"url\":\"Admin\\/Phone\\/xzewm\",\"id\":\"65\"},\"67\":{\"pid\":\"59\",\"title\":\"\\u6279\\u91cf\\u4fee\\u6539\\u8df3\\u8f6c\\u7f51\\u5740\",\"url\":\"Admin\\/Phone\\/edittzwz\",\"id\":\"67\"},\"66\":{\"pid\":\"59\",\"title\":\"\\u4e0a\\u4f20\\u6587\\u4ef6\",\"url\":\"Admin\\/Upload\\/upload\",\"id\":\"66\"},\"68\":{\"pid\":\"58\",\"title\":\"\\u591a\\u7f51\\u5740\\u8df3\\u8f6c\",\"icon\":\"fa fa-list\",\"url\":\"Admin\\/Duourl\\/index\",\"id\":\"68\"},\"69\":{\"pid\":\"68\",\"title\":\"\\u6dfb\\u52a0\",\"url\":\"Admin\\/Duourl\\/add\",\"id\":\"69\"},\"70\":{\"pid\":\"68\",\"title\":\"\\u7f16\\u8f91\",\"url\":\"Admin\\/Duourl\\/edit\",\"id\":\"70\"},\"71\":{\"pid\":\"68\",\"title\":\"\\u5220\\u9664\",\"url\":\"Admin\\/Duourl\\/setStatus\",\"id\":\"71\"},\"72\":{\"pid\":\"68\",\"title\":\"\\u5bfc\\u51fa\",\"url\":\"Admin\\/Duourl\\/outurl\",\"id\":\"72\"},\"73\":{\"pid\":\"68\",\"title\":\"\\u4e0b\\u8f7d\\u4e8c\\u7ef4\\u7801\",\"url\":\"Admin\\/Duourl\\/xzewm\",\"id\":\"73\"},\"74\":{\"pid\":\"68\",\"title\":\"\\u6279\\u91cf\\u4fee\\u6539\\u8df3\\u8f6c\\u7f51\\u5740\",\"url\":\"Admin\\/Duourl\\/edittzwz\",\"id\":\"74\"},\"75\":{\"pid\":\"68\",\"title\":\"\\u4e0a\\u4f20\\u6587\\u4ef6\",\"url\":\"Admin\\/Upload\\/upload\",\"id\":\"75\"},\"2\":{\"pid\":\"1\",\"title\":\"\\u7cfb\\u7edf\\u529f\\u80fd\",\"icon\":\"fa fa-folder-open-o\",\"id\":\"2\"},\"3\":{\"pid\":\"2\",\"title\":\"\\u7cfb\\u7edf\\u8bbe\\u7f6e\",\"icon\":\"fa fa-wrench\",\"url\":\"Admin\\/Config\\/group\",\"id\":\"3\"},\"4\":{\"pid\":\"3\",\"title\":\"\\u4fee\\u6539\\u8bbe\\u7f6e\",\"url\":\"Admin\\/Config\\/groupSave\",\"id\":\"4\"},\"23\":{\"pid\":\"1\",\"title\":\"\\u7cfb\\u7edf\\u6743\\u9650\",\"icon\":\"fa fa-folder-open-o\",\"id\":\"23\"},\"24\":{\"pid\":\"23\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa fa-user\",\"url\":\"Admin\\/User\\/index\",\"id\":\"24\"},\"25\":{\"pid\":\"24\",\"title\":\"\\u65b0\\u589e\",\"url\":\"Admin\\/User\\/add\",\"id\":\"25\"},\"26\":{\"pid\":\"24\",\"title\":\"\\u7f16\\u8f91\",\"url\":\"Admin\\/User\\/edit\",\"id\":\"26\"},\"27\":{\"pid\":\"24\",\"title\":\"\\u8bbe\\u7f6e\\u72b6\\u6001\",\"url\":\"Admin\\/User\\/setStatus\",\"id\":\"27\"},\"28\":{\"pid\":\"23\",\"title\":\"\\u7ba1\\u7406\\u5458\\u7ba1\\u7406\",\"icon\":\"fa fa-lock\",\"url\":\"Admin\\/Access\\/index\",\"id\":\"28\"},\"29\":{\"pid\":\"28\",\"title\":\"\\u65b0\\u589e\",\"url\":\"Admin\\/Access\\/add\",\"id\":\"29\"},\"30\":{\"pid\":\"28\",\"title\":\"\\u7f16\\u8f91\",\"url\":\"Admin\\/Access\\/edit\",\"id\":\"30\"},\"31\":{\"pid\":\"28\",\"title\":\"\\u8bbe\\u7f6e\\u72b6\\u6001\",\"url\":\"Admin\\/Access\\/setStatus\",\"id\":\"31\"},\"32\":{\"pid\":\"23\",\"title\":\"\\u7528\\u6237\\u7ec4\\u7ba1\\u7406\",\"icon\":\"fa fa-sitemap\",\"url\":\"Admin\\/Group\\/index\",\"id\":\"32\"},\"33\":{\"pid\":\"32\",\"title\":\"\\u65b0\\u589e\",\"url\":\"Admin\\/Group\\/add\",\"id\":\"33\"},\"34\":{\"pid\":\"32\",\"title\":\"\\u7f16\\u8f91\",\"url\":\"Admin\\/Group\\/edit\",\"id\":\"34\"},\"35\":{\"pid\":\"32\",\"title\":\"\\u8bbe\\u7f6e\\u72b6\\u6001\",\"url\":\"Admin\\/Group\\/setStatus\",\"id\":\"35\"},\"36\":{\"pid\":\"1\",\"title\":\"\\u6269\\u5c55\\u4e2d\\u5fc3\",\"icon\":\"fa fa-folder-open-o\",\"id\":\"36\"},\"44\":{\"pid\":\"36\",\"title\":\"\\u529f\\u80fd\\u6a21\\u5757\",\"icon\":\"fa fa-th-large\",\"url\":\"Admin\\/Module\\/index\",\"id\":\"44\"},\"45\":{\"pid\":\"44\",\"title\":\"\\u5b89\\u88c5\",\"url\":\"Admin\\/Module\\/install\",\"id\":\"45\"},\"46\":{\"pid\":\"44\",\"title\":\"\\u5378\\u8f7d\",\"url\":\"Admin\\/Module\\/uninstall\",\"id\":\"46\"},\"47\":{\"pid\":\"44\",\"title\":\"\\u66f4\\u65b0\\u4fe1\\u606f\",\"url\":\"Admin\\/Module\\/updateInfo\",\"id\":\"47\"},\"48\":{\"pid\":\"44\",\"title\":\"\\u8bbe\\u7f6e\\u72b6\\u6001\",\"url\":\"Admin\\/Module\\/setStatus\",\"id\":\"48\"}}', '1', '1505180658', '1505180658', '1', '1');

-- ----------------------------
-- Table structure for `fw_admin_nav`
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
INSERT INTO `fw_admin_nav` VALUES ('1', '0', 'home', '首页', 'link', '', '', 'fa-archive', '1441293186', '1441297331', '0', '1');
INSERT INTO `fw_admin_nav` VALUES ('2', '0', 'user', '用户', 'module', 'User', '', 'fa fa-users', '1453102131', '1453102131', '0', '1');
INSERT INTO `fw_admin_nav` VALUES ('3', '0', 'cms', 'CMS', 'module', 'Cms', '', 'fa fa-newspaper-o', '1453102270', '1453102270', '0', '1');

-- ----------------------------
-- Table structure for `fw_admin_theme`
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
-- Records of fw_admin_theme
-- ----------------------------

-- ----------------------------
-- Table structure for `fw_admin_upload`
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='文件上传表';

-- ----------------------------
-- Records of fw_admin_upload
-- ----------------------------
INSERT INTO `fw_admin_upload` VALUES ('1', '4', '1.txt', '/Uploads/2017-11/5a0dc67a79697.txt', '', 'txt', '130', '5eef63643127708c16f1f2fa783b5346', '4cf4c3875838f5b7e9e099c11ad71a5ccdcb9503', 'Local', '0', '1510852218', '1510852218', '0', '1');
INSERT INTO `fw_admin_upload` VALUES ('2', '4', 'wangzhi.txt', '/Uploads/2017-11/5a0e32d53159c.txt', '', 'txt', '65', '5f79cfe1df25229b47014e708f38cc93', '982af447911455df50c592ab6d3eb1e994583105', 'Local', '0', '1510879957', '1510879957', '0', '1');

-- ----------------------------
-- Table structure for `fw_admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `fw_admin_user`;
CREATE TABLE `fw_admin_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'UID',
  `user_type` int(11) NOT NULL DEFAULT '1' COMMENT '用户类型',
  `username` varchar(31) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(63) NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(63) NOT NULL DEFAULT '' COMMENT '邮箱',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_type` varchar(15) NOT NULL DEFAULT '' COMMENT '注册方式',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  `vipId` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员有效期',
  `ifCheck` tinyint(4) NOT NULL DEFAULT '1' COMMENT '新增活码时是否需要审核',
  `url` varchar(255) NOT NULL DEFAULT '',
  `url_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0域名待审核，1审核通过',
  `visitCount` int(11) NOT NULL DEFAULT '0' COMMENT '活码已访问次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='用户账号表';

-- ----------------------------
-- Records of fw_admin_user
-- ----------------------------
INSERT INTO `fw_admin_user` VALUES ('1', '1', 'shqcyj', '23dc8bf16551eb6413877869e8a5f80a', '', '', '0', '', '1438651748', '1501578198', '1', '0', '0', '1', '', '0', '0');
INSERT INTO `fw_admin_user` VALUES ('2', '1', 'user', 'f532653412627108c678efc42217ab7a', 'admin@hfzeqi.cn', '18156535692', '3080735695', 'admin', '1510838645', '1510838839', '1', '0', '0', '1', '', '0', '0');
INSERT INTO `fw_admin_user` VALUES ('3', '1', 'admin', 'b7aebc807e9844d9148e5cb32c6ff885', 'admin@ihuoma.cn', '18156535691', '3080735695', 'admin', '1510838827', '1510838827', '1', '0', '0', '1', '', '0', '0');
INSERT INTO `fw_admin_user` VALUES ('4', '2', '测试专用', 'b7aebc807e9844d9148e5cb32c6ff885', '673524506@qq.com', '18156535690', '0', '', '1510839860', '1511854440', '1', '5', '1542519334', '-1', 'zeqiqr.com', '1', '4');
INSERT INTO `fw_admin_user` VALUES ('5', '2', 'aihuoma', 'cfe487a8f6f83e0793b45c77a6edce32', 'wyfdc178178@sina.com', '18692483393', '0', '', '1510897380', '0', '1', '2', '1542433948', '1', 'www.baidu.com', '-1', '0');
INSERT INTO `fw_admin_user` VALUES ('11', '2', '曾磊', '1f33b2bb8cf7465b15d16b3fccdc1444', '936245015@qq.com', '18820158180', '0', '', '1511573735', '0', '1', '0', '0', '1', '', '0', '0');
INSERT INTO `fw_admin_user` VALUES ('6', '1', 'ihuoma', 'f532653412627108c678efc42217ab7a', 'admin@hfzeqi.com', '18156535693', '3080735695', 'admin', '1510900691', '1510900691', '1', '0', '0', '1', '', '0', '0');
INSERT INTO `fw_admin_user` VALUES ('7', '2', 'gfhhfghhf', 'b09c7a7c82f910eb502ae65aef1412d9', '1920403655@qq.com', '13277897793', '0', '', '1511092227', '0', '1', '0', '0', '1', '', '0', '0');
INSERT INTO `fw_admin_user` VALUES ('8', '2', '小晨0909197', 'a58e482f3597f9fc1db713ae15bdcb3c', 'fc197@qq.com', '18758258251', '0', '', '1511171573', '0', '1', '0', '0', '1', '', '0', '0');
INSERT INTO `fw_admin_user` VALUES ('9', '2', 'rehuo8', 'f90ad4b983c72a9619e0fa197eb9526c', '289697005@qq.com', '15619534340', '0', '', '1511368592', '0', '1', '0', '0', '1', '', '0', '0');
INSERT INTO `fw_admin_user` VALUES ('10', '2', 'aa123000', 'cf2e543f2741776195c85c6c5057d343', '4040385@qq.com', '15070707050', '0', '', '1511413646', '0', '1', '2', '1543129418', '-1', 'www.daka88.cn', '1', '4');
INSERT INTO `fw_admin_user` VALUES ('13', '2', '金淼', '0856c6e3ec8dea1160e7823c961d5e3d', '361854034@qq.com', '13667604923', '0', '', '1511660487', '0', '1', '0', '0', '1', '', '0', '0');
INSERT INTO `fw_admin_user` VALUES ('12', '2', 'marcocai', '7d02ff0d0a88ec889e5bfeb1c0a7cd99', '2761668631@qq.com', '18122379090', '0', '', '1511596337', '0', '1', '0', '0', '1', '', '0', '0');
INSERT INTO `fw_admin_user` VALUES ('14', '2', '四眼科技', '357e5df23ff8e66bdaccadee5d72d7cf', '358291833@qq.com', '15813704440', '0', '', '1511773198', '0', '1', '3', '1543310036', '-1', 'www.siyankeji.cn', '1', '65');
INSERT INTO `fw_admin_user` VALUES ('15', '2', 'q4238662', 'baf9f371f138789aa19fa0d983ee97f3', '4238662@qq.com', '13030200179', '0', '', '1511812463', '0', '1', '0', '0', '1', '', '0', '0');
INSERT INTO `fw_admin_user` VALUES ('16', '2', 'feiyi', 'fbd385674e0de6464d2d7ef596e2a23f', '1918511934@qq.com', '13696869386', '0', '', '1511932075', '0', '1', '0', '0', '1', '', '0', '0');

-- ----------------------------
-- Table structure for `fw_cms_duourl`
-- ----------------------------
DROP TABLE IF EXISTS `fw_cms_duourl`;
CREATE TABLE `fw_cms_duourl` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` tinyint(1) unsigned DEFAULT '2' COMMENT '1单网址2多网址',
  `menuId` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `title` text NOT NULL COMMENT '题标',
  `tztime` text,
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `huoma` varchar(255) DEFAULT NULL,
  `d` varchar(255) DEFAULT NULL,
  `tztype` tinyint(1) DEFAULT '1',
  `count` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fw_cms_duourl
-- ----------------------------
INSERT INTO `fw_cms_duourl` VALUES ('1', '2', '0', '4', '名站导航', 'https://www.baidu.com/|||https://www.360.cn/|||http://www.163.com/|||https://www.sogou.com/|||http://www.qq.com/|||http://www.sohu.com/', null, '1510973567', '1511827729', 'http://zeqiqr.com/index.php/huoma/duo?d=q5yo8s70f', 'q5yo8s70f', '2', '50', '1');
INSERT INTO `fw_cms_duourl` VALUES ('6', '2', '0', '14', '客服号', 'http://www.siyankeji.cn/index.php/huoma/live?d=b2i0lnf2b|||http://www.siyankeji.cn/index.php/huoma/live?d=knnp2j237|||http://www.siyankeji.cn/index.php/huoma/live?d=ibdeg2cud|||http://www.siyankeji.cn/index.php/huoma/live?d=hyndw09eb|||http://www.siyankeji.cn/index.php/huoma/live?d=ehhni1iue|||http://www.siyankeji.cn/index.php/huoma/live?d=d5uqi84ao|||http://www.siyankeji.cn/index.php/huoma/live?d=fi6eqt8es', null, '1511776262', '1511845903', 'http://www.siyankeji.cn/index.php/huoma/duo?d=p2sc2ixvq', 'p2sc2ixvq', '2', '231', '1');
INSERT INTO `fw_cms_duourl` VALUES ('5', '2', '0', '10', '口碑信用卡', '多少', null, '1511623832', '1511779906', 'http://www.daka88.cn/index.php/huoma/duo?d=d6masjqfs', 'd6masjqfs', '1', '5', '1');
INSERT INTO `fw_cms_duourl` VALUES ('4', '2', '0', '10', '糯米信用卡', '多少', null, '1511595340', '1511773734', 'http://www.daka88.cn/index.php/huoma/duo?d=u2h229a30', 'u2h229a30', '1', '339', '1');

-- ----------------------------
-- Table structure for `fw_cms_livecode`
-- ----------------------------
DROP TABLE IF EXISTS `fw_cms_livecode`;
CREATE TABLE `fw_cms_livecode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1图文,2文本,3文件,4网址,5名片',
  `menuId` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL COMMENT '活码内容',
  `size` decimal(11,2) NOT NULL DEFAULT '0.00',
  `count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '扫描次数',
  `huoma` varchar(255) NOT NULL DEFAULT '',
  `d` varchar(255) NOT NULL DEFAULT '',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_cms_livecode
-- ----------------------------
INSERT INTO `fw_cms_livecode` VALUES ('10', '4', '0', '5', '测试', '[{\"desc\":\"\\u6d4b\\u8bd5\",\"link\":\"http:\\/\\/www.sina.com.cn\\/\",\"content\":\"\"},{\"desc\":\"\\u6d4b\\u8bd5w\",\"link\":\"http:\\/\\/www.sina.com.cn\\/\"}]', '0.00', '3', 'http://zeqiqr.com/index.php/huoma/live?d=5t7dcq6n0', '5t7dcq6n0', '1511228956', '1511228956', '1');
INSERT INTO `fw_cms_livecode` VALUES ('4', '5', '0', '4', '夏泽中的名片', '{\"head\":\"\\/Uploads\\/livecode\\/file\\/2017-11-17\\/5a0e9b1c6d45b.jpg\",\"face\":\"\\/Uploads\\/livecode\\/file\\/2017-11-17\\/5a0e9a51893e4.jpg\",\"name\":\"\\u590f\\u6cfd\\u4e2d\",\"appointment\":\"\\u603b\\u76d1\",\"company\":\"\\u5408\\u80a5\\u6cfd\\u742a\\u4fe1\\u606f\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"layoutbg\":\"0\",\"left_phone\":[{\"ch\":\"\\u56fa\\u5b9a\\u7535\\u8bdd\",\"en\":\"Telephone\",\"val\":\"0551-65567790\",\"class\":\"vcard_data_value vcard_data_phone\",\"id\":\"\"},{\"ch\":\"\\u79fb\\u52a8\\u7535\\u8bdd\",\"en\":\"Mobile\",\"val\":\"18156535690\",\"class\":\"vcard_data_value vcard_data_mobile\",\"id\":\"left_addable_phone\",\"child\":[]},{\"ch\":\"\\u4f20\\u771f\",\"en\":\"Fax\",\"val\":\"0551-65567790\",\"class\":\"vcard_data_value vcard_data_fax\",\"id\":\"left_addable_fax\",\"child\":[]},{\"ch\":\"\\u7535\\u5b50\\u90ae\\u4ef6\",\"en\":\"Email\",\"val\":\"xiazezhong@hfzeqi.com\",\"class\":\"vcard_data_value vcard_data_email\",\"id\":\"left_addable_email\",\"child\":[]}],\"left_internet\":[{\"ch\":\"\\u5fae\\u4fe1\",\"en\":\"Wechat\",\"val\":\"xiazezhong\",\"class\":\"vcard_data_value vcard_data_wechat\",\"id\":\"left_addable_message\",\"child\":[]},{\"ch\":\"\\u4e3b\\u9875\\u7f51\\u5740\",\"en\":\"Website\",\"val\":\"http:\\/\\/www.ihuoma.cn\",\"class\":\"vcard_data_value vcard_data_site\",\"id\":\"left_addable_site\",\"child\":[]},{\"ch\":\"\\u5fae\\u535a\",\"en\":\"Weibo\",\"val\":\"http:\\/\\/t.qq.com\\/hfzeqi\",\"class\":\"vcard_data_value vcard_data_weibo\",\"id\":\"\"},{\"ch\":\"QQ\",\"en\":\"QQ\",\"val\":\"673524506\",\"class\":\"vcard_data_value vcard_data_qq\",\"id\":\"\"}],\"left_address\":[{\"ch\":\"\\u5730\\u5740\",\"en\":\"Address\",\"val\":\"\\u5b89\\u5fbd\\u7701\\u5408\\u80a5\\u5e02\\u9ad8\\u65b0\\u533a\\u671b\\u6c5f\\u897f\\u8def539\\u53f75F\\u521b\\u4e1a\\u56ed2.0\\uff08\\u9cb2\\u9e4f\\u56ed\\u533a\\uff096#206\",\"class\":\"vcard_data_value vcard_data_address vcard-mapaddr\",\"id\":\"left_addable_address\",\"child\":[]}],\"left_intro\":[{\"ch\":\"\\u4e2a\\u4eba\\u8bf4\\u660e\",\"en\":\"Self-intro\",\"val\":\"\\u7231\\u6d3b\\u7801 \\u7231\\u4e0a\\u6d3b\\u7801\",\"class\":\"vcard_data_value vcard_data_introduce\"}],\"lang\":\"cn\"}', '0.00', '78', 'http://zeqiqr.com/index.php/huoma/live?d=ira9j43dx', 'ira9j43dx', '1510906661', '1511835669', '1');
INSERT INTO `fw_cms_livecode` VALUES ('5', '3', '0', '4', '下载文件', '{\"fileName\":\"\\u65b0\\u5efa\\u6587\\u4ef6\\u5939.zip\",\"url\":\"2017-11-18\\/5a0f9f832e5c9.zip\",\"size\":\"3.056 MB\"}', '0.00', '33', 'http://zeqiqr.com/index.php/huoma/live?d=m0p58yegw', 'm0p58yegw', '1510973362', '1510973362', '1');
INSERT INTO `fw_cms_livecode` VALUES ('6', '2', '0', '4', '设备机房出入管理办法', '设备机房出入管理办法\n\n1.为保证机房设备的正常运行，防止人为故障的发生，特制定本管理办法。\n2.本管理办法适用于：项目管理工程管辖的：变配电、BA、消防监控、电梯、空调、水泵房等设备机房的出入管理。\n3.出入管理\n3.1各工程专业人员可以进出本专业所辖机房。\n3.2各工程专业人员进出设备机房应随手关门、人离锁门。\n3.3变配电房、BA控制室作为特别重要机房，其当值人员进出必须随手关门、人离必须锁门。非本专业人员或其他人员因工作需要欲进入，当值人员应报请主管以上管理者同意，按出入登记表要求，办理登记手续后方可进入。3.4 其他专业人员或其他部门员工欲进入专业设备机房，由本专业人员或主管以上管理者同意，并进行出入登记，登记表每月存档，保存期为贰年。\n3.5 外单位人员欲进入设备机房，须经部门主管或经理以上领导同意，有专业人员全过程陪同，在出入登记表中做好登记。\n3.6 设备机房的钥匙管理，按《设备机房钥匙管理办法》执行。', '0.00', '31', 'http://www.qr003.com/index.php/huoma/live?d=53tmxfofu', '53tmxfofu', '1511835660', '1511835660', '1');
INSERT INTO `fw_cms_livecode` VALUES ('11', '1', '0', '14', '长按识别二维码添加-66', '{\"picUrl\":\"2017-11-27\\/5a1bdea0c8b4f.jpg\",\"content\":\"<br \\/>\"}', '0.00', '139', 'http://www.siyankeji.cn/index.php/huoma/live?d=b2i0lnf2b', 'b2i0lnf2b', '1511839083', '1511839083', '1');
INSERT INTO `fw_cms_livecode` VALUES ('22', '3', '0', '4', 'sdfasdd', '{\"fileName\":\"anheqiao.mp3\",\"url\":\"Uploads\\/livecode\\/file\\/2017-11-28\\/anheqiao.mp3\",\"size\":\"6.05\"}', '6.05', '26', 'http://zeqiqr.com/index.php/huoma/live?d=h52ienywe', 'h52ienywe', '1511857979', '1511857979', '1');
INSERT INTO `fw_cms_livecode` VALUES ('13', '1', '0', '14', '长按识别二维码添加-77', '{\"picUrl\":\"2017-11-28\\/5a1cd5398e777.JPG\",\"content\":\"\\u00a0\"}', '0.00', '14', 'http://www.siyankeji.cn/index.php/huoma/live?d=knnp2j237', 'knnp2j237', '1511839090', '1511839090', '1');
INSERT INTO `fw_cms_livecode` VALUES ('14', '1', '0', '14', '长按二维码识别添加-88', '{\"picUrl\":\"2017-11-28\\/5a1cd57cd33c7.jpg\",\"content\":\"&nbsp;\"}', '0.00', '6', 'http://www.siyankeji.cn/index.php/huoma/live?d=ibdeg2cud', 'ibdeg2cud', '1511839109', '1511839109', '1');
INSERT INTO `fw_cms_livecode` VALUES ('15', '1', '0', '14', '长按识别二维码添加-520', '{\"picUrl\":\"2017-11-28\\/5a1cd58b555fb.jpg\",\"content\":\"&nbsp;\"}', '0.00', '11', 'http://www.siyankeji.cn/index.php/huoma/live?d=hyndw09eb', 'hyndw09eb', '1511839123', '1511839123', '1');
INSERT INTO `fw_cms_livecode` VALUES ('16', '1', '0', '14', '长按二维码识别添加-567', '{\"picUrl\":\"2017-11-28\\/5a1cd59acba75.jpg\",\"content\":\"&nbsp;\"}', '0.00', '11', 'http://www.siyankeji.cn/index.php/huoma/live?d=ehhni1iue', 'ehhni1iue', '1511839142', '1511839142', '1');
INSERT INTO `fw_cms_livecode` VALUES ('17', '1', '0', '14', '长按二维码识别添加-VIP', '{\"picUrl\":\"2017-11-28\\/5a1cd5b08705e.jpg\",\"content\":\"\\u00a0\"}', '0.00', '11', 'http://www.siyankeji.cn/index.php/huoma/live?d=d5uqi84ao', 'd5uqi84ao', '1511840008', '1511840008', '1');
INSERT INTO `fw_cms_livecode` VALUES ('18', '1', '0', '14', '长按识别二维码添加-V', '{\"picUrl\":\"2017-11-28\\/5a1cd5c860e9d.JPG\",\"content\":\"&nbsp;\"}', '0.00', '28', 'http://www.siyankeji.cn/index.php/huoma/live?d=fi6eqt8es', 'fi6eqt8es', '1511839188', '1511839188', '1');

-- ----------------------------
-- Table structure for `fw_cms_phone`
-- ----------------------------
DROP TABLE IF EXISTS `fw_cms_phone`;
CREATE TABLE `fw_cms_phone` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1网址2视频',
  `menuId` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(500) NOT NULL DEFAULT '' COMMENT '题标',
  `videourl` varchar(255) NOT NULL DEFAULT '' COMMENT '视频地址',
  `size` decimal(11,2) NOT NULL DEFAULT '0.00',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `huoma` varchar(255) NOT NULL DEFAULT '',
  `d` varchar(30) NOT NULL DEFAULT '',
  `tztype` tinyint(4) NOT NULL DEFAULT '1',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT '播放次数',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`) USING BTREE,
  KEY `title` (`title`(333))
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fw_cms_phone
-- ----------------------------
INSERT INTO `fw_cms_phone` VALUES ('11', '2', '0', '4', '视频', 'Uploads/video/1.mp4', '0.00', '1510983483', '1510983483', 'http://zeqiqr.com/index.php/huoma/?d=l6ssbahbv', 'l6ssbahbv', '1', '3', '1');
INSERT INTO `fw_cms_phone` VALUES ('10', '1', '0', '4', '百度', 'https://www.baidu.com/', '0.00', '1510973837', '1510973837', 'http://zeqiqr.com/index.php/huoma/?d=gz4w55aj1', 'gz4w55aj1', '1', '1', '1');
INSERT INTO `fw_cms_phone` VALUES ('12', '2', '0', '4', '来个', 'Uploads/video/music1.mp4', '3.34', '1511149832', '1511149832', 'http://zeqiqr.com/index.php/huoma/?d=a8hzcku14', 'a8hzcku14', '1', '2', '1');
INSERT INTO `fw_cms_phone` VALUES ('18', '1', '0', '4', '2', 'https://www.baidu.com/', '0.00', '1511155880', '1511155880', 'http://www.qr003.com/index.php/huoma/?d=xckaanxrc', 'xckaanxrc', '1', '8', '1');
INSERT INTO `fw_cms_phone` VALUES ('17', '1', '0', '4', '1', 'http://www.qq.com/', '0.00', '1511155533', '1511155533', 'http://www.qr003.com/index.php/huoma/?d=ighm8pdn1', 'ighm8pdn1', '1', '5', '1');

-- ----------------------------
-- Table structure for `fw_cms_product`
-- ----------------------------
DROP TABLE IF EXISTS `fw_cms_product`;
CREATE TABLE `fw_cms_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `menuId` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL COMMENT '活码内容',
  `count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '扫描次数',
  `huoma` varchar(255) NOT NULL DEFAULT '',
  `d` varchar(255) NOT NULL DEFAULT '',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_cms_product
-- ----------------------------
INSERT INTO `fw_cms_product` VALUES ('2', '0', '4', '爱活码-活码管理系统', '{\"picUrl\":\"2017-11-17\\/5a0e9cc640a63.jpg\",\"content\":\"<p><ppp>\\n\\t<\\/ppp><\\/p><section class=\\\"clistyle-section\\\" style=\\\"border:none;margin: 0.5em 0.3em\\\">\\n\\t\\t<span style=\\\"display: none;\\\">a<\\/span>\\n\\t\\t<section style=\\\"background-color: transparent !important;\\\">\\n\\t\\t\\t<section data-clistyle-brushtype=\\\"bd\\\" style=\\\"display: inline-block; float: left; width: 45%; margin-top: 0.2em; border: 1px dotted rgb(76, 175, 80);\\\"><\\/section>\\n\\t\\t\\t<section data-clistyle-brushtype=\\\"bd\\\" style=\\\"display: inline-block; float: right; width: 45%; margin-top: 0.2em; border: 1px dotted rgb(76, 175, 80);\\\"><\\/section>\\n\\t\\t\\t<section data-clistyle-brushtype=\\\"bg\\\" style=\\\"width: 0.5em; height: 0.5em; margin: auto; transform: rotate(45deg); background-color: rgb(76, 175, 80);\\\"><br><\\/section><\\/section><\\/section><section style=\\\"margin:0 auto;width:68%\\\"><\\/section><section style=\\\"font-size:14px;font-family:\'Microsoft YaHei\';margin: 5px auto;white-space: normal;\\\">\\n\\t\\t\\t<fieldset style=\\\"padding:0;margin:.5em 0;border:none;min-width:0;max-width:100%;box-sizing:border-box!important;word-wrap:break-word!important\\\">\\n\\t\\t\\t\\t<section style=\\\"max-width:100%;width:100%;border:2px solid rgba(76,175,80,.9);font-family:inherit;text-align:justify;text-decoration:inherit;background-color:#fff;box-sizing:border-box!important;word-wrap:break-word!important\\\">\\n\\t\\t\\t\\t\\t<section style=\\\"max-width:100%;font-size:1.2em;font-family:inherit;text-align:center;text-decoration:inherit;color:#fff;background-color:transparent;border-color:rgba(76,175,80,.9);box-sizing:border-box!important;word-wrap:break-word!important\\\">\\n\\t\\t\\t\\t\\t\\t<section style=\\\"max-width:100%;width:0;border-left-width:1.2em;border-left-style:solid;border-left-color:rgba(76,175,80,.9);border-top-width:1.2em;border-top-style:solid;border-top-color:rgba(76,175,80,.9);box-sizing:border-box!important;word-wrap:break-word!important;border-right-width:1.2em!important;border-right-style:solid!important;border-right-color:transparent!important;border-bottom-width:1.2em!important;border-bottom-style:solid!important;border-bottom-color:transparent!important\\\"><\\/section>\\n\\t\\t\\t\\t\\t\\t<section style=\\\"max-width:100%;width:1.2em;height:2em;line-height:2em;overflow:hidden;white-space:nowrap;margin:-2.5em 0 0 .1em;box-sizing:border-box!important;word-wrap:break-word!important\\\">\\n\\t\\t\\t\\t\\t\\t\\t<section style=\\\"max-width:100%;box-sizing:border-box!important;word-wrap:break-word!important\\\">1<\\/section>\\n\\t\\t\\t\\t\\t\\t<\\/section>\\n\\t\\t\\t\\t\\t<\\/section>\\n\\t\\t\\t\\t\\t<section style=\\\"max-width:100%;margin:-1em 1.5em 0;font-size:22px;font-family:inherit;text-align:center;text-decoration:inherit;color:#333;box-sizing:border-box!important;word-wrap:break-word!important\\\">\\n\\t\\t\\t\\t\\t\\t<section style=\\\"max-width:100%;box-sizing:border-box!important;word-wrap:break-word!important;margin-top: 7px;\\\">\\u5173\\u4e8e\\u6211\\u4eec<\\/section><\\/section><section style=\\\"max-width:100%;padding:0 15px;margin:20px 0;box-sizing:border-box!important;word-wrap:break-word!important\\\"><p style=\\\"max-width:100%;box-sizing:border-box!important;word-wrap:break-word!important\\\"><span style=\\\"box-sizing: border-box; margin: 0px; padding: 0px; word-wrap: break-word; word-break: break-all; color: rgb(102, 102, 102); font-size: 14px; text-align: justify; text-indent: 28px; background-color: rgb(255, 255, 255); font-family: Tahoma, &quot;Microsoft Yahei&quot;, Simsun;\\\">&nbsp; &nbsp; &nbsp; \\u7231\\u6d3b\\u7801\\u4e8c\\u7ef4\\u7801\\u662f\\u4e8c\\u7ef4\\u7801\\u4e00\\u7ad9\\u5f0f\\u670d\\u52a1\\u63d0\\u4f9b\\u5546\\uff0c\\u63d0\\u4f9b\\u4e13\\u4e1a\\u53ef\\u9760\\u7684\\u4e8c\\u7ef4\\u7801\\u751f\\u6210\\u3001\\u7f8e\\u5316\\u3001\\u7ba1\\u7406\\u548c\\u89e3\\u51b3\\u65b9\\u6848\\u670d\\u52a1\\u3002\\u7231\\u6d3b\\u7801\\u6d3b\\u7801\\u7ba1\\u7406\\u7cfb\\u7edf\\uff0c\\u89e3\\u51b3\\u4e8c\\u7ef4\\u7801\\u56fe\\u6848\\u4e0e\\u5185\\u5bb9\\u53ef\\u4ee5\\u5206\\u522b\\u7ba1\\u7406\\u7684\\u884c\\u4e1a\\u75db\\u70b9\\u3002\\u4ee5\\u6210\\u719f\\u3001\\u53ef\\u9760\\u3001\\u6613\\u6269\\u5c55\\u7684\\u5e73\\u53f0\\u67b6\\u6784\\u53ca\\u529f\\u80fd\\u7ec4\\u4ef6\\uff0c\\u80fd\\u591f\\u5feb\\u901f\\u5b9e\\u73b0\\u4e0d\\u540c\\u884c\\u4e1a\\u5e94\\u7528\\u573a\\u666f\\u7684\\u4e8c\\u6b21\\u5f00\\u53d1\\u548c\\u529f\\u80fd\\u5b9a\\u5236\\uff0c\\u5e26\\u7ed9\\u7528\\u6237\\u66f4\\u597d\\u7684\\u4f7f\\u7528\\u4f53\\u9a8c\\u3002\\u76ee\\u524d\\uff0c\\u7231\\u6d3b\\u7801\\u4e8c\\u7ef4\\u7801\\u5df2\\u7ecf\\u4e3a\\u4e0d\\u540c\\u884c\\u4e1a\\u3001\\u4e0d\\u540c\\u9886\\u57df\\u3001\\u63d0\\u4f9b\\u4e86\\u5168\\u65b9\\u4f4d\\u7684\\u89e3\\u51b3\\u65b9\\u6848\\u4e0e\\u670d\\u52a1\\u3002\\u6211\\u4eec\\u575a\\u4fe1\\u4e8c\\u7ef4\\u7801\\u80fd\\u591f\\u5e2e\\u52a9\\u6211\\u4eec\\u62b9\\u5e73\\u4fe1\\u606f\\u5824\\u575d\\uff0c\\u8ba9\\u4eba\\u4e0e\\u4eba\\u5b9e\\u73b0\\u66f4\\u597d\\u7684\\u4fe1\\u606f\\u4f20\\u9012\\u548c\\u6c9f\\u901a\\u3002\\u4e8c\\u7ef4\\u7801\\u53ef\\u4ee5\\u5e94\\u7528\\u5728\\u66f4\\u591a\\u573a\\u666f\\uff0c\\u6253\\u5f00\\u7ebf\\u4e0a\\u4e0e\\u7ebf\\u4e0b\\u7684\\u5165\\u53e3\\uff0c\\u7ed9\\u7528\\u6237\\u5e26\\u6765\\u79fb\\u52a8\\u4e92\\u8054\\u7f51\\u7684\\u4fbf\\u5229\\uff0c\\u5b9e\\u73b0\\u66f4\\u591a\\u7684\\u4ef7\\u503c\\u3002<\\/span><\\/p><p style=\\\"max-width:100%;box-sizing:border-box!important;word-wrap:break-word!important\\\"><span style=\\\"box-sizing: border-box; margin: 0px; padding: 0px; word-wrap: break-word; word-break: break-all; color: rgb(102, 102, 102); font-size: 14px; text-align: justify; text-indent: 28px; background-color: rgb(255, 255, 255); font-family: Tahoma, &quot;Microsoft Yahei&quot;, Simsun;\\\"><span style=\\\"color: rgb(102, 102, 102); font-family: Tahoma, &quot;Microsoft Yahei&quot;, Simsun; font-size: 14px; text-align: justify; text-indent: 28px; background-color: rgb(255, 255, 255);\\\">&nbsp; &nbsp; &nbsp; \\u8d8a\\u6765\\u8d8a\\u591a\\u7684\\u4f01\\u4e1a\\u751a\\u81f3\\u4e2a\\u4eba\\u9700\\u8981\\u6d3b\\u7801\\u670d\\u52a1\\u7684\\u9700\\u6c42\\uff0c\\u4e3a\\u4e86\\u9002\\u5e94\\u5e02\\u573a\\u9700\\u6c42\\uff0c\\u63d0\\u9ad8\\u6d3b\\u7801\\u670d\\u52a1\\u8d28\\u91cf\\uff0c\\u5408\\u80a5\\u6cfd\\u742a\\u4fe1\\u606f\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\\u7279\\u6b64\\u6210\\u7acb\\u4e86\\u7231\\u6d3b\\u7801\\u3002\\u6cfd\\u742a\\u79d1\\u6280\\u662f\\u4e00\\u5bb6\\u81f4\\u529b\\u4e8e\\u7535\\u5b50\\u5546\\u52a1\\u53d1\\u5c55\\u7684\\u4e0d\\u5e72\\u80f6\\u6807\\u7b7e\\u751f\\u4ea7\\u5546\\uff0c\\u516c\\u53f8\\u6210\\u7acb\\u4e8e2013\\u5e749\\u6708\\u4efd\\uff0c\\u516c\\u53f8\\u62e5\\u6709\\u81ea\\u5df1\\u7684\\u5927\\u578b\\u6807\\u7b7e\\u5de5\\u5382\\uff0c\\u4e3a\\u4e2a\\u4eba\\u548c\\u9500\\u552e\\u4f01\\u4e1a\\u63d0\\u4f9b\\u4e86\\u4f18\\u8d28\\u7684\\u670d\\u52a1\\u548c\\u5feb\\u6377\\u7684\\u8d2d\\u7269\\u65b9\\u5f0f\\uff0c\\u4ee5\\u53ca\\u8d28\\u91cf\\u4e0e\\u5ec9\\u4ef7\\u4e8e\\u4e00\\u4f53\\u7684\\u54c1\\u8d28\\u4fdd\\u969c\\u3002<\\/span><\\/span><\\/p>\\n\\t\\t\\t\\t\\t<\\/section>\\n\\t\\t\\t\\t<\\/section>\\n\\t\\t\\t<\\/fieldset>\\n\\t\\t\\t<fieldset style=\\\"padding:0;margin:0;border:0;min-width:0;max-width:100%;clear:both;font-size:1em;font-family:inherit;text-align:justify;text-decoration:inherit;color:inherit;box-sizing:border-box!important;word-wrap:break-word!important\\\"><\\/fieldset>\\n\\t\\t<\\/section><p>\\n\\t<\\/p><section style=\\\"font-size:14px;font-family:\'Microsoft YaHei\';margin: 5px auto;white-space: normal;\\\">\\n\\t\\t\\t<fieldset style=\\\"padding:0;margin:.5em 0;border:none;min-width:0;max-width:100%;box-sizing:border-box!important;word-wrap:break-word!important\\\">\\n\\t\\t\\t\\t<section style=\\\"max-width:100%;width:100%;border:2px solid rgba(76,175,80,.9);font-family:inherit;text-align:justify;text-decoration:inherit;background-color:#fff;box-sizing:border-box!important;word-wrap:break-word!important\\\">\\n\\t\\t\\t\\t\\t<section style=\\\"max-width:100%;font-size:1.2em;font-family:inherit;text-align:center;text-decoration:inherit;color:#fff;background-color:transparent;border-color:rgba(76,175,80,.9);box-sizing:border-box!important;word-wrap:break-word!important\\\">\\n\\t\\t\\t\\t\\t\\t<section style=\\\"max-width:100%;width:0;border-left-width:1.2em;border-left-style:solid;border-left-color:rgba(76,175,80,.9);border-top-width:1.2em;border-top-style:solid;border-top-color:rgba(76,175,80,.9);box-sizing:border-box!important;word-wrap:break-word!important;border-right-width:1.2em!important;border-right-style:solid!important;border-right-color:transparent!important;border-bottom-width:1.2em!important;border-bottom-style:solid!important;border-bottom-color:transparent!important\\\"><\\/section>\\n\\t\\t\\t\\t\\t\\t<section style=\\\"max-width:100%;width:1.2em;height:2em;line-height:2em;overflow:hidden;white-space:nowrap;margin:-2.5em 0 0 .1em;box-sizing:border-box!important;word-wrap:break-word!important\\\">\\n\\t\\t\\t\\t\\t\\t\\t<section style=\\\"max-width:100%;box-sizing:border-box!important;word-wrap:break-word!important\\\">2<\\/section>\\n\\t\\t\\t\\t\\t\\t<\\/section>\\n\\t\\t\\t\\t\\t<\\/section>\\n\\t\\t\\t\\t\\t<section style=\\\"max-width:100%;margin:-1em 1.5em 0;font-size:22px;font-family:inherit;text-align:center;text-decoration:inherit;color:#333;box-sizing:border-box!important;word-wrap:break-word!important\\\">\\n\\t\\t\\t\\t\\t\\t<section style=\\\"max-width:100%;box-sizing:border-box!important;word-wrap:break-word!important;margin-top: 7px;\\\">\\u6d3b\\u7801\\u4ecb\\u7ecd<\\/section>\\n\\t\\t\\t\\t\\t<\\/section>\\n\\t\\t\\t\\t\\t<section style=\\\"max-width:100%;padding:0 15px;margin:20px 0;box-sizing:border-box!important;word-wrap:break-word!important\\\">\\n\\t\\t\\t\\t\\t\\t<section style=\\\"max-width:100%;box-sizing:border-box!important;word-wrap:break-word!important\\\"><span style=\\\"font-size: 14px; text-align: justify; box-sizing: border-box; margin: 0px; padding: 0px; word-wrap: break-word; word-break: break-all; color: rgb(102, 102, 102); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: Tahoma, &quot;Microsoft Yahei&quot;, Simsun;\\\">\\u4ec0\\u4e48\\u662f\\u6d3b\\u7801\\uff1f<\\/span><br data-filtered=\\\"filtered\\\" style=\\\"font-size: 14px; text-align: justify; white-space: normal; box-sizing: border-box; color: rgb(102, 102, 102); text-indent: 28px; background-color: rgb(255, 255, 255); word-wrap: break-word; font-family: Tahoma, &quot;Microsoft Yahei&quot;, Simsun;\\\"><span style=\\\"font-size: 14px; text-align: justify; box-sizing: border-box; margin: 0px; padding: 0px; word-wrap: break-word; word-break: break-all; color: rgb(102, 102, 102); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: Tahoma, &quot;Microsoft Yahei&quot;, Simsun;\\\">&nbsp; &nbsp; &nbsp;\\u6d3b\\u7801\\u662f\\u4e8c\\u7ef4\\u7801\\u7684\\u4e00\\u79cd\\u9ad8\\u7ea7\\u5f62\\u6001\\uff0c\\u901a\\u8fc7\\u77ed\\u7f51\\u5740\\u6307\\u5411\\u4fdd\\u5b58\\u5728\\u4e91\\u7aef\\u7684\\u4fe1\\u606f\\u3002<\\/span><br data-filtered=\\\"filtered\\\" style=\\\"font-size: 14px; text-align: justify; white-space: normal; box-sizing: border-box; color: rgb(102, 102, 102); text-indent: 28px; background-color: rgb(255, 255, 255); word-wrap: break-word; font-family: Tahoma, &quot;Microsoft Yahei&quot;, Simsun;\\\"><span style=\\\"font-size: 14px; text-align: justify; box-sizing: border-box; margin: 0px; padding: 0px; word-wrap: break-word; word-break: break-all; color: rgb(102, 102, 102); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: Tahoma, &quot;Microsoft Yahei&quot;, Simsun;\\\">&nbsp; &nbsp; &nbsp; \\u4e3a\\u4ec0\\u4e48\\u7528\\u6d3b\\u7801\\uff1f<\\/span><br data-filtered=\\\"filtered\\\" style=\\\"font-size: 14px; text-align: justify; white-space: normal; box-sizing: border-box; color: rgb(102, 102, 102); text-indent: 28px; background-color: rgb(255, 255, 255); word-wrap: break-word; font-family: Tahoma, &quot;Microsoft Yahei&quot;, Simsun;\\\"><span style=\\\"font-size: 14px; text-align: justify; box-sizing: border-box; margin: 0px; padding: 0px; word-wrap: break-word; word-break: break-all; color: rgb(102, 102, 102); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: Tahoma, &quot;Microsoft Yahei&quot;, Simsun;\\\">&nbsp; &nbsp; &nbsp; \\u6d3b\\u7801\\u662f\\u4e8c\\u7ef4\\u7801\\u7684\\u9ad8\\u7ea7\\u5f62\\u5f0f\\uff0c\\u4ee5\\u4e8c\\u7ef4\\u7801\\u4e3a\\u8f7d\\u4f53\\u94fe\\u63a5\\u5404\\u7c7b\\u4e91\\u7aef\\u4fe1\\u606f\\uff0c\\u52a9\\u529b\\u8425\\u9500\\u8fd0\\u8425\\u3002\\u4f7f\\u7528\\u6d3b\\u7801\\u4e8c\\u7ef4\\u7801\\uff0c\\u5b8c\\u7f8e\\u89e3\\u51b3\\u4ece\\u4e8c\\u7ef4\\u7801\\u521b\\u5efa\\u3001\\u7f8e\\u5316\\u3001\\u4fee\\u6539\\uff0c\\u5230\\u626b\\u7801\\u8ffd\\u8e2a\\u3001 \\u6279\\u91cf\\u7ba1\\u7406\\u3001\\u4fee\\u6539\\u9875\\u9762\\u5185\\u5bb9\\u3002\\u8f7b\\u677e\\u6ee1\\u8db3\\u5404\\u79cd\\u4e8c\\u7ef4\\u7801\\u9700\\u6c42\\uff0c\\u52a0\\u901f\\u60a8\\u7684\\u8425\\u9500\\u4e1a\\u52a1!<\\/span><\\/section><\\/section><\\/section><\\/fieldset><\\/section><p>\\n\\t<\\/p><p><br><\\/p><p><ppp>\\n\\t<\\/ppp><\\/p><section class=\\\"clistyle-section\\\" style=\\\"box-sizing: border-box; word-break: break-all; word-wrap: break-word; white-space: normal; max-width: 100%; color: rgb(0, 0, 0); font-family: Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px;\\\">\\n\\t\\t<section data-clistyle-brushtype=\\\"bd\\\" style=\\\"box-sizing: border-box; word-break: break-all; word-wrap: break-word; max-width: 100%; opacity: 0.8; border-width: 2px 2px 8px; border-style: solid; border-color: #4caf50; padding: 15px;\\\">\\n\\t\\t\\t<p style=\\\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; max-width: 100%; clear: both; line-height: 1.6em; color: inherit; text-align: center;\\\">\\n\\t\\t\\t\\t<strong style=\\\"box-sizing: border-box; word-break: break-all; word-wrap: break-word; max-width: 100%; color: inherit;\\\">\\n\\t\\t\\t\\t\\t<span style=\\\"box-sizing: border-box; max-width: 100%; color: inherit; font-size: 18px;\\\">\\u529f\\u80fd\\u6f14\\u793a<\\/span><\\/strong><\\/p>\\n\\t\\t<\\/section>\\n\\t<\\/section><p><br><\\/p><p><br><\\/p><p><ppp>\\n\\t<\\/ppp><\\/p><section class=\\\"clistyle-section\\\">\\n\\t\\t<h2 data-clistyle-brushtype=\\\"bd\\\" style=\\\"margin: 0; padding: 0px; font-weight: bold; font-size: 16px; line-height: 28px; max-width: 100%; color: #4caf50; min-height: 32px; border-bottom-width: 1.5px; border-bottom-style: solid; border-color: #4caf50; text-align: justify; \\\">\\n\\t\\t\\t<span data-clistyle-brushtype=\\\"bg\\\" style=\\\"background-color:#4caf50; color:#fff; display:block; float:left; line-height:20px; margin:0px 8px 0px 0px; max-width:100%; padding:4px 10px; word-wrap:break-word !important\\\" title=\\\"\\\">1<\\/span>\\n\\t\\t\\t<strong data-clistyle-brushtype=\\\"text\\\" style=\\\"color: rgb(76, 175, 80);\\\">\\u97f3\\u9891\\u64ad\\u653e<\\/strong><\\/h2><\\/section><div><audio src=\\\"\\/Uploads\\/product\\/file\\/2017-11-17\\/5a0ea8261c558.mp3\\\" controls=\\\"controls\\\" style=\\\"width: 100%;\\\">\\u60a8\\u7684\\u6d4f\\u89c8\\u5668\\u4e0d\\u652f\\u6301 audio \\u6807\\u7b7e\\u3002<\\/audio><\\/div><p><ppp>\\n\\t<\\/ppp><\\/p><section class=\\\"clistyle-section\\\">\\n\\t\\t<h2 data-clistyle-brushtype=\\\"bd\\\" style=\\\"margin: 0; padding: 0px; font-weight: bold; font-size: 16px; line-height: 28px; max-width: 100%; color: #4caf50; min-height: 32px; border-bottom-width: 1.5px; border-bottom-style: solid; border-color: #4caf50; text-align: justify; \\\">\\n\\t\\t\\t<span data-clistyle-brushtype=\\\"bg\\\" style=\\\"background-color:#4caf50; color:#fff; display:block; float:left; line-height:20px; margin:0px 8px 0px 0px; max-width:100%; padding:4px 10px; word-wrap:break-word !important\\\" title=\\\"\\\">2<\\/span>\\n\\t\\t\\t<strong data-clistyle-brushtype=\\\"text\\\" style=\\\"color: rgb(76, 175, 80);\\\">\\u89c6\\u9891\\u64ad\\u653e<\\/strong><\\/h2>\\n\\t<\\/section><p><br><\\/p><div><video style=\\\"width:100%; max-height:480px;\\\" controls=\\\"\\\"><source src=\\\"\\/Uploads\\/product\\/file\\/2017-11-17\\/5a0eb35d382a6.mp4\\\" type=\\\"video\\/mp4\\\"><source src=\\\"\\/Uploads\\/product\\/file\\/2017-11-17\\/5a0eb35d382a6.mp4\\\" type=\\\"video\\/ogg\\\">\\u60a8\\u7684\\u6d4f\\u89c8\\u5668\\u4e0d\\u652f\\u6301Video\\u6807\\u7b7e\\u3002<\\/video><div><\\/div><\\/div><p><br><\\/p><p><ppp>\\n\\t<\\/ppp><\\/p><section class=\\\"clistyle-section\\\">\\n\\t\\t<h2 data-clistyle-brushtype=\\\"bd\\\" style=\\\"margin: 0; padding: 0px; font-weight: bold; font-size: 16px; line-height: 28px; max-width: 100%; color: #4caf50; min-height: 32px; border-bottom-width: 1.5px; border-bottom-style: solid; border-color: #4caf50; text-align: justify; \\\">\\n\\t\\t\\t<span data-clistyle-brushtype=\\\"bg\\\" style=\\\"background-color:#4caf50; color:#fff; display:block; float:left; line-height:20px; margin:0px 8px 0px 0px; max-width:100%; padding:4px 10px; word-wrap:break-word !important\\\" title=\\\"\\\">3<\\/span>\\n\\t\\t\\t\\u5730\\u5740\\u5730\\u56fe<\\/h2><div class=\\\"card_module\\\"><div class=\\\"card_module_con\\\"><p><br><\\/p><div class=\\\"card_module\\\"><h2 class=\\\"card_module_tit\\\">\\u8054\\u7cfb\\u6211\\u4eec<\\/h2><div class=\\\"card_module_con\\\"><div class=\\\"card_module_vcard\\\"><div class=\\\"weui-article\\\"><p><\\/p><\\/div><div class=\\\"card_module_info\\\"><div class=\\\"weui-address\\\"><span class=\\\"address_icon\\\"><\\/span><\\/div><div class=\\\"weui-address_info\\\"><h4>\\u5730\\u5740<\\/h4><p>\\u5b89\\u5fbd\\u7701\\u5408\\u80a5\\u5e02\\u8700\\u5c71\\u533a\\u671b\\u6c5f\\u897f\\u8def539\\u53f7<\\/p><\\/div><div class=\\\"weui-address-btn\\\"><a href=\\\"javascript:;\\\" lng=\\\"117.195676\\\" lat=\\\"31.835988\\\">\\u5730\\u56fe<\\/a><\\/div><div class=\\\"cl\\\"><\\/div><\\/div><div class=\\\"card_module_info\\\"><div class=\\\"weui-address tel\\\"><span><\\/span><\\/div><div class=\\\"weui-address_info\\\"><h4>\\u8054\\u7cfb\\u7535\\u8bdd<\\/h4><a class=\\\"atel\\\" href=\\\"tel:0551-65567790\\\" target=\\\"_self\\\" _href=\\\"tel:0551-65567790\\\">0551-65567790<\\/a><\\/div><div class=\\\"cl\\\"><\\/div><\\/div><div class=\\\"card_module_info\\\"><div class=\\\"weui-address mobile\\\"><span><\\/span><\\/div><div class=\\\"weui-address_info\\\"><h4>\\u624b\\u673a\\u53f7\\u7801<\\/h4><a class=\\\"atel\\\" href=\\\"tel:18156535690\\\" target=\\\"_self\\\" _href=\\\"tel:18156535690\\\">18156535690<\\/a><\\/div><div class=\\\"cl\\\"><\\/div><\\/div><div class=\\\"card_module_info\\\"><div class=\\\"weui-address email\\\"><span><\\/span><\\/div><div class=\\\"weui-address_info\\\"><h4>\\u7535\\u5b50\\u90ae\\u7bb1<\\/h4><p>xiazezhong@hfzeqi.com<\\/p><\\/div><div class=\\\"cl\\\"><\\/div><\\/div><div class=\\\"card_module_info\\\"><div class=\\\"weui-address qq\\\"><span><\\/span><\\/div><div class=\\\"weui-address_info\\\"><h4>QQ\\u53f7\\u7801<\\/h4><p>673524506<\\/p><\\/div><div class=\\\"cl\\\"><\\/div><\\/div><div class=\\\"cl\\\"><\\/div><\\/div><\\/div><\\/div><div class=\\\"card_module_vcard\\\"><div class=\\\"card_module_info\\\"><div class=\\\"cl\\\"><\\/div><\\/div><div class=\\\"cl\\\"><\\/div><\\/div><\\/div><\\/div><p><ppp>\\n\\t<\\/ppp><\\/p><section class=\\\"clistyle-section\\\">\\n\\t\\t<h2 data-clistyle-brushtype=\\\"bd\\\" style=\\\"margin: 0; padding: 0px; font-weight: bold; font-size: 16px; line-height: 28px; max-width: 100%; color: #4caf50; min-height: 32px; border-bottom-width: 1.5px; border-bottom-style: solid; border-color: #4caf50; text-align: justify; \\\">\\n\\t\\t\\t<span data-clistyle-brushtype=\\\"bg\\\" style=\\\"background-color:#4caf50; color:#fff; display:block; float:left; line-height:20px; margin:0px 8px 0px 0px; max-width:100%; padding:4px 10px; word-wrap:break-word !important\\\" title=\\\"\\\">4<\\/span>\\n\\t\\t\\t<strong data-clistyle-brushtype=\\\"text\\\" style=\\\"color:inherit\\\">\\u626b\\u63cf\\u6dfb\\u52a0\\u5fae\\u4fe1<\\/strong><\\/h2><p><strong data-clistyle-brushtype=\\\"text\\\" style=\\\"color:inherit\\\"><\\/strong><\\/p><div class=\\\"weui-panel\\\"><div class=\\\"weui-icon\\\"><\\/div><div class=\\\"weui-cell\\\">\\u5fae\\u4fe1\\u597d\\u53cb<\\/div><div class=\\\"weui-btn\\\"><input type=\\\"button\\\" value=\\\"\\u5173\\u6ce8\\\"><\\/div><\\/div><p><input type=\\\"hidden\\\" class=\\\"wechatPic\\\" value=\\\"\\/Uploads\\/product\\/6ffa0cb852ee33cbe3247ea8db5c197e.png\\\"><\\/p><p><ppp>\\n\\t<\\/ppp><\\/p><section class=\\\"clistyle-section\\\">\\n\\t\\t<h2 data-clistyle-brushtype=\\\"bd\\\" style=\\\"margin: 0; padding: 0px; font-weight: bold; font-size: 16px; line-height: 28px; max-width: 100%; color: #4caf50; min-height: 32px; border-bottom-width: 1.5px; border-bottom-style: solid; border-color: #4caf50; text-align: justify; \\\">\\n\\t\\t\\t<span data-clistyle-brushtype=\\\"bg\\\" style=\\\"background-color:#4caf50; color:#fff; display:block; float:left; line-height:20px; margin:0px 8px 0px 0px; max-width:100%; padding:4px 10px; word-wrap:break-word !important\\\" title=\\\"\\\">5<\\/span>\\n\\t\\t\\t<strong data-clistyle-brushtype=\\\"text\\\" style=\\\"color:inherit\\\">\\u626b\\u4e00\\u626b\\u67e5\\u770b\\u540d\\u7247<\\/strong><\\/h2><p><strong data-clistyle-brushtype=\\\"text\\\" style=\\\"color:inherit\\\"><\\/strong><\\/p><div class=\\\"card_module\\\"><h2 class=\\\"card_module_tit\\\">\\u540d\\u7247<\\/h2><div class=\\\"card_module_con\\\"><div class=\\\"card_module_vcard\\\"><a href=\\\"http:\\/\\/zeqiqr.com\\/index.php\\/huoma\\/live?d=ira9j43dx\\\" _href=\\\"http:\\/\\/zeqiqr.com\\/index.php\\/huoma\\/live?d=ira9j43dx\\\"><div class=\\\"card_module_face\\\"><img src=\\\"\\/Uploads\\/livecode\\/file\\/2017-11-17\\/5a0e9a51893e4.jpg\\\"><\\/div><div class=\\\"card_module_info1\\\"><div class=\\\"vcard_info_name\\\">\\u590f\\u6cfd\\u4e2d<\\/div><div class=\\\"vcard_info_position\\\">\\u603b\\u76d1<\\/div><div class=\\\"vcard_info_tel\\\">18156535690<\\/div><\\/div><div class=\\\"cl\\\"><\\/div><\\/a><\\/div><\\/div><\\/div><p><ppp>\\n\\t<\\/ppp><\\/p><section class=\\\"clistyle-section\\\">\\n\\t\\t<h2 data-clistyle-brushtype=\\\"bd\\\" style=\\\"margin: 0; padding: 0px; font-weight: bold; font-size: 16px; line-height: 28px; max-width: 100%; color: #4caf50; min-height: 32px; border-bottom-width: 1.5px; border-bottom-style: solid; border-color: #4caf50; text-align: justify; \\\">\\n\\t\\t\\t<span data-clistyle-brushtype=\\\"bg\\\" style=\\\"background-color:#4caf50; color:#fff; display:block; float:left; line-height:20px; margin:0px 8px 0px 0px; max-width:100%; padding:4px 10px; word-wrap:break-word !important\\\" title=\\\"\\\">6<\\/span>\\n\\t\\t\\t<strong data-clistyle-brushtype=\\\"text\\\" style=\\\"color:inherit\\\">\\u6587\\u4ef6\\u4e0b\\u8f7d<\\/strong><\\/h2><p><strong data-clistyle-brushtype=\\\"text\\\" style=\\\"color:inherit\\\"><\\/strong><\\/p><p><br><\\/p><div class=\\\"weui_wd\\\"><a href=\\\"http:\\/\\/\\\" class=\\\"weui_access\\\" target=\\\"_blank\\\" _href=\\\"http:\\/\\/\\\"><div class=\\\"weui_hd\\\"><img src=\\\"\\/Public\\/images\\/fileicon.png\\\"><\\/div><div class=\\\"weui_bd\\\"><p class=\\\"overflow\\\">1.zip<\\/p>205 bytes<\\/div><div class=\\\"xiazai\\\"><\\/div><\\/a><\\/div><p><br><\\/p><p><ppp>\\n\\t<\\/ppp><\\/p><section class=\\\"clistyle-section\\\">\\n\\t\\t<h2 data-clistyle-brushtype=\\\"bd\\\" style=\\\"margin: 0; padding: 0px; font-weight: bold; font-size: 16px; line-height: 28px; max-width: 100%; color: #4caf50; min-height: 32px; border-bottom-width: 1.5px; border-bottom-style: solid; border-color: #4caf50; text-align: justify; \\\">\\n\\t\\t\\t<span data-clistyle-brushtype=\\\"bg\\\" style=\\\"background-color:#4caf50; color:#fff; display:block; float:left; line-height:20px; margin:0px 8px 0px 0px; max-width:100%; padding:4px 10px; word-wrap:break-word !important\\\" title=\\\"\\\">7<\\/span>\\n\\t\\t\\t<strong data-clistyle-brushtype=\\\"text\\\" style=\\\"color:inherit\\\">\\u8054\\u7cfb\\u6211\\u4eec<\\/strong><\\/h2><p><strong data-clistyle-brushtype=\\\"text\\\" style=\\\"color:inherit\\\"><\\/strong><\\/p><section class=\\\"wwei-editor\\\">\\n\\t\\t\\t<section style=\\\"background-color:#fbfbfb;padding:10px;\\\">\\n\\t\\t\\t\\t<p style=\\\"font-family:\'Microsoft Yahei\';color:#333;margin:0;padding:10px;\\\">\\u8054\\u7cfb\\u6211\\u4eec<\\/p>\\n\\t\\t\\t\\t<a href=\\\"tel:0551-65567790\\\" class=\\\"phonen\\\" style=\\\"display:block;\\\" _href=\\\"tel:0551-65567790\\\">\\n\\t\\t\\t\\t\\t<section style=\\\"overflow:hidden;border-bottom:1px solid #ddd;font-size:14px;color:#545454;background-color:#fbfbfb;\\\">\\n\\t\\t\\t\\t\\t\\t<span style=\\\"background-image:url(\\/\\/static.clewm.net\\/cli\\/images\\/icon_list.png);background-position:0 -135px ; background-repeat:no-repeat;display:block;width:24px;height:24px;float:left;margin-top:6px;margin-left:10px;\\\"><\\/span>\\n\\t\\t\\t\\t\\t\\t<span style=\\\"display:block;float:left;margin-left:10px;line-height:38px;font-family:\'Microsoft Yahei\';\\\">\\u7535\\u8bdd\\uff1a<\\/span>\\n\\t\\t\\t\\t\\t\\t<span class=\\\"phone_num\\\" style=\\\"display:block;float:left;margin-left:10px;line-height:38px;font-family:\'Microsoft Yahei\';\\\">0551-65567790<\\/span>\\n\\t\\t\\t\\t\\t\\t<span style=\\\"display:block;float:right;margin-right:10px;font-weight:bold;line-height:38px;width:20px;height:36px;background-image:url(\\/\\/static.clewm.net\\/cli\\/images\\/icon_list.png);background-repeat:no-repeat;background-position:0 -197px;\\\"><\\/span>\\n\\t\\t\\t\\t\\t<\\/section>\\n\\t\\t\\t\\t<\\/a>\\n\\t\\t\\t\\t<section style=\\\"overflow:hidden;border-bottom:1px solid #ddd;font-size:14px;color:#545454;background-color:#fbfbfb;\\\">\\n\\t\\t\\t\\t\\t<span style=\\\"background-image:url(\\/\\/static.clewm.net\\/cli\\/images\\/icon_list.png);background-position:0 -472px ; background-repeat:no-repeat;display:block;width:24px;height:24px;float:left;margin-top:6px;margin-left:10px;\\\"><\\/span>\\n\\t\\t\\t\\t\\t<span style=\\\"display:block;float:left;margin-left:11px;line-height:38px;font-family:\'Microsoft Yahei\';\\\">QQ \\uff1a<\\/span>\\n\\t\\t\\t\\t\\t<span style=\\\"display:block;float:left;margin-left:10px;line-height:38px;font-family:\'Microsoft Yahei\';\\\">673524506<\\/span>\\n\\t\\t\\t\\t<\\/section>\\n\\t\\t\\t\\t<section style=\\\"overflow:hidden;border-bottom:1px solid #ddd;font-size:14px;color:#545454;background-color:#fbfbfb;\\\">\\n\\t\\t\\t\\t\\t<span style=\\\"background-image:url(\\/\\/static.clewm.net\\/cli\\/images\\/icon_list.png);background-position:0 0px ; background-repeat:no-repeat;display:block;width:24px;height:24px;float:left;margin-top:8px;margin-left:10px;\\\"><\\/span>\\n\\t\\t\\t\\t\\t<span style=\\\"display:block;float:left;margin-left:10px;line-height:38px;font-family:\'Microsoft Yahei\';\\\">\\u5fae\\u4fe1\\uff1a<\\/span>\\n\\t\\t\\t\\t\\t<span style=\\\"display:block;float:left;margin-left:10px;line-height:38px;font-family:\'Microsoft Yahei\';\\\">xiazezhong<\\/span>\\n\\t\\t\\t\\t<\\/section>\\n\\t\\t\\t\\t<section style=\\\"overflow:hidden;border-bottom:1px solid #ddd;font-size:14px;color:#545454;background-color:#fbfbfb;\\\">\\n\\t\\t\\t\\t\\t<span style=\\\"background-image:url(\\/\\/static.clewm.net\\/cli\\/images\\/icon_list.png);background-position:0 -270px ; background-repeat:no-repeat;display:block;width:24px;height:24px;float:left;margin-top:6px;margin-left:10px;\\\"><\\/span>\\n\\t\\t\\t\\t\\t<span style=\\\"display:block;float:left;margin-left:10px;line-height:38px;font-family:\'Microsoft Yahei\';\\\">\\u5730\\u5740\\uff1a<\\/span>\\n\\t\\t\\t\\t\\t<span style=\\\"display:block;float:left;margin-left:10px;line-height:38px;font-family:\'Microsoft Yahei\';\\\">\\u5b89\\u5fbd\\u7701\\u5408\\u80a5\\u5e02\\u9ad8\\u65b0\\u533a<\\/span>\\n\\t\\t\\t\\t\\t<span style=\\\"display:block;float:right;margin-right:10px;font-weight:bold;line-height:38px;\\\"><\\/span>\\n\\t\\t\\t\\t<\\/section>\\n\\t\\t\\t\\t<section style=\\\"overflow:hidden;font-size:14px;border-bottom:1px solid #ddd;color:#545454;background-color:#fbfbfb;\\\">\\n\\t\\t\\t\\t\\t<span style=\\\"background-image:url(\\/\\/static.clewm.net\\/cli\\/images\\/icon_list.png);background-position:0 -99px ; background-repeat:no-repeat;display:block;width:24px;height:24px;float:left;margin-top:6px;margin-left:10px;\\\"><\\/span>\\n\\t\\t\\t\\t\\t<span style=\\\"display:block;float:left;margin-left:10px;line-height:38px;font-family:\'Microsoft Yahei\';\\\">\\u90ae\\u7bb1\\uff1a<\\/span>\\n\\t\\t\\t\\t\\t<span style=\\\"display:block;float:left;margin-left:10px;line-height:38px;font-family:\'Microsoft Yahei\';\\\">xiazezhong@hfzeqi.com<\\/span>\\n\\t\\t\\t\\t<\\/section>\\n\\t\\t\\t<\\/section>\\n\\t\\t<\\/section><p>\\n\\t<\\/p><p><br><\\/p><p><strong data-clistyle-brushtype=\\\"text\\\" style=\\\"color:inherit\\\"><\\/strong><br><\\/p>\\n\\t<\\/section><p><br><\\/p><p><br><\\/p><p><br><\\/p><\\/section><\\/section><\\/section><\\/section><p><input type=\\\"hidden\\\" class=\\\"wechatPic\\\" value=\\\"\\/Uploads\\/product\\/c90070e4ea33c6be445265540770e9cd.png\\\"><\\/p><p><ppp>\\n\\t<\\/ppp><\\/p><section class=\\\"clistyle-section\\\">\\n\\t\\t<\\/section><p><ppp>\\n\\t<\\/ppp><\\/p><section class=\\\"clistyle-section\\\">\\n\\t\\t<\\/section>\"}', '153', 'http://zeqiqr.com/index.php/huoma/product?d=c9xbzgy66', 'c9xbzgy66', '1511855831', '1511855831', '1');
INSERT INTO `fw_cms_product` VALUES ('3', '0', '4', '中粮广场设备房巡查（总）', '{\"picUrl\":\"2017-11-22\\/5a14d84a30234.jpg\",\"content\":\"<p><ppp>\\n\\t<\\/ppp><\\/p><section class=\\\"clistyle-section clistyle-section-table\\\">\\n\\t\\t<section style=\\\"width: 100%; box-sizing: border-box !important; background: #f8f8f8; padding: 5px 10px; border: 1px solid #ddd; border-bottom: 0; font-size: 14px; color: #444; word-break: break-all; word-wrap: break-word !important; font-weight: bold; line-height: 30px; text-align: center;\\\">\\u4e2d\\u7cae\\u5e7f\\u573a\\u8bbe\\u5907\\u623f\\u5de1\\u67e5\\uff08\\u603b\\uff09<\\/section>\\n\\t\\t<table style=\\\"width: 100%; border-collapse: collapse; margin: 0; \\\">\\n\\t\\t\\t<tbody style=\\\"max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\\\">\\n\\t\\t\\t\\t<tr style=\\\"max-width: 100%; box-sizing: border-box !important;  line-height: 30px; word-wrap: break-word !important; \\\">\\n\\t\\t\\t\\t\\t<td style=\\\"width: 30%; box-sizing: border-box !important; padding: 5px 10px; border: 1px solid #ddd; font-size: 14px; color: #888; word-break: break-all; word-wrap: break-word !important;\\\"><div class=\\\"imgsize\\\" style=\\\"text-align: center;\\\"><a href=\\\"http:\\/\\/www.qr003.com\\/index.php\\/huoma\\/product?d=urw63gjzb\\\" target=\\\"_self\\\" title=\\\"\\\" _href=\\\"http:\\/\\/www.qr003.com\\/index.php\\/huoma\\/product?d=urw63gjzb\\\"><img class=\\\"layui-upload-img\\\" id=\\\"demo6\\\" src=\\\"\\/Uploads\\/product\\/file\\/2017-11-22\\/5a14da4e1c421.png\\\"><\\/a><\\/div><div style=\\\"text-align: center;\\\"><a href=\\\"http:\\/\\/www.qr003.com\\/index.php\\/huoma\\/product?d=urw63gjzb\\\" target=\\\"_self\\\" title=\\\"\\\" _href=\\\"http:\\/\\/www.qr003.com\\/index.php\\/huoma\\/product?d=urw63gjzb\\\"><span style=\\\"background-color: transparent;\\\"><\\/span><span style=\\\"background-color: transparent;\\\">\\u914d\\u7535\\u5ba4<\\/span><\\/a><\\/div><\\/td>\\n\\t\\t\\t\\t\\t<td style=\\\"width:100px; max-width: 100%; box-sizing: border-box !important; padding: 5px 10px; border: 1px solid #ddd; font-size: 14px; color: #888; word-break: break-all; word-wrap: break-word !important;\\\"><div class=\\\"imgsize\\\" style=\\\"text-align: center;\\\"><img class=\\\"layui-upload-img\\\" id=\\\"demo6\\\" src=\\\"\\/Uploads\\/product\\/file\\/2017-11-22\\/5a14da7b017c3.png\\\"><\\/div><div style=\\\"text-align: center;\\\"><span style=\\\"background-color: transparent;\\\">\\u6d88\\u9632\\u6cf5\\u623f<\\/span><\\/div><\\/td>\\n\\t\\t\\t\\t\\t<td style=\\\"width:100px; max-width: 100%; box-sizing: border-box !important; padding: 5px 10px; border: 1px solid #ddd; font-size: 14px; color: #888; word-break: break-all; word-wrap: break-word !important;\\\"><div class=\\\"imgsize\\\" style=\\\"text-align: center;\\\"><img class=\\\"layui-upload-img\\\" id=\\\"demo6\\\" src=\\\"\\/Uploads\\/product\\/file\\/2017-11-22\\/5a14da80b4c45.png\\\"><\\/div><div style=\\\"text-align: center;\\\"><span style=\\\"background-color: transparent;\\\">\\u7535\\u68af\\u673a\\u623f<\\/span><\\/div><\\/td>\\n\\t\\t\\t\\t<\\/tr>\\n\\t\\t\\t\\t<tr style=\\\"max-width: 100%; box-sizing: border-box !important;  line-height: 30px; word-wrap: break-word !important; \\\">\\n\\t\\t\\t\\t\\t<td style=\\\"width: 30%; box-sizing: border-box !important; padding: 5px 10px; border: 1px solid #ddd; font-size: 14px; color: #888; word-break: break-all; word-wrap: break-word !important;\\\"><div class=\\\"imgsize\\\" style=\\\"text-align: center;\\\"><img class=\\\"layui-upload-img\\\" id=\\\"demo6\\\" src=\\\"\\/Uploads\\/product\\/file\\/2017-11-22\\/5a14da88cf750.png\\\"><\\/div><div style=\\\"text-align: center;\\\"><span style=\\\"background-color: transparent;\\\">\\u7a7a\\u8c03\\u673a\\u623f<\\/span><\\/div><\\/td>\\n\\t\\t\\t\\t\\t<td style=\\\"width:100px; max-width: 100%; box-sizing: border-box !important; padding: 5px 10px; border: 1px solid #ddd; font-size: 14px; color: #888; word-break: break-all; word-wrap: break-word !important;\\\"><div class=\\\"imgsize\\\" style=\\\"text-align: center;\\\"><img class=\\\"layui-upload-img\\\" id=\\\"demo6\\\" src=\\\"\\/Uploads\\/product\\/file\\/2017-11-22\\/5a14da9301729.png\\\"><\\/div><div style=\\\"text-align: center;\\\"><span style=\\\"background-color: transparent;\\\">\\u53d1\\u7535\\u673a\\u623f<\\/span><\\/div><\\/td>\\n\\t\\t\\t\\t\\t<td style=\\\"width:100px; max-width: 100%; box-sizing: border-box !important; padding: 5px 10px; border: 1px solid #ddd; font-size: 14px; color: #888; word-break: break-all; word-wrap: break-word !important;\\\"><div class=\\\"imgsize\\\" style=\\\"text-align: center;\\\"><img class=\\\"layui-upload-img\\\" id=\\\"demo6\\\" src=\\\"\\/Uploads\\/product\\/file\\/2017-11-22\\/5a14da999635e.png\\\"><\\/div><div style=\\\"text-align: center;\\\"><span style=\\\"background-color: transparent;\\\">\\u751f\\u6d3b\\u6c34\\u6cf5\\u623f<\\/span><\\/div><\\/td>\\n\\t\\t\\t\\t<\\/tr>\\n\\t\\t\\t\\t\\n\\t\\t\\t\\t\\n\\t\\t\\t<\\/tbody>\\n\\t\\t<\\/table>\\n\\t<\\/section><p><\\/p><p><br><\\/p><p><br><\\/p>\"}', '12', 'http://www.qr003.com/index.php/huoma/product?d=3qfs7gckn', '3qfs7gckn', '1511316697', '1511316697', '1');
INSERT INTO `fw_cms_product` VALUES ('4', '0', '4', '配电房巡查', '{\"picUrl\":\"2017-11-22\\/5a14dbb24d4af.jpg\",\"content\":\"<p><ppp>\\n\\t<\\/ppp><\\/p><section class=\\\"clistyle-section clistyle-section-table\\\">\\n\\t\\t<section style=\\\"width: 100%; box-sizing: border-box !important; background: #f8f8f8; padding: 5px 10px; border: 1px solid #ddd; border-bottom: 0; font-size: 14px; color: #444; word-break: break-all; word-wrap: break-word !important; font-weight: bold; line-height: 30px; text-align: center;\\\">\\u914d\\u7535\\u623f\\u5de1\\u67e5<\\/section>\\n\\t\\t<table style=\\\"width: 100%; border-collapse: collapse; margin: 0; \\\">\\n\\t\\t\\t<tbody style=\\\"max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\\\">\\n\\t\\t\\t\\t<tr style=\\\"max-width: 100%; box-sizing: border-box !important;  line-height: 30px; word-wrap: break-word !important; \\\">\\n\\t\\t\\t\\t\\t<td style=\\\"width: 30%; box-sizing: border-box !important; padding: 5px 10px; border: 1px solid #ddd; font-size: 14px; color: #888; word-break: break-all; word-wrap: break-word !important;\\\"><div class=\\\"imgsize\\\" style=\\\"text-align: center;\\\"><a href=\\\"http:\\/\\/www.qr003.com\\/index.php\\/huoma\\/live?d=53tmxfofu\\\" target=\\\"_self\\\" title=\\\"\\\" _href=\\\"http:\\/\\/www.qr003.com\\/index.php\\/huoma\\/live?d=53tmxfofu\\\"><img class=\\\"layui-upload-img\\\" id=\\\"demo6\\\" src=\\\"\\/Uploads\\/product\\/file\\/2017-11-22\\/5a14dbf7cb11b.png\\\"><\\/a><\\/div><div style=\\\"text-align: center;\\\"><span style=\\\"background-color: transparent;\\\"><a href=\\\"http:\\/\\/www.qr003.com\\/index.php\\/huoma\\/live?d=53tmxfofu\\\" target=\\\"_self\\\" title=\\\"\\\" _href=\\\"http:\\/\\/www.qr003.com\\/index.php\\/huoma\\/live?d=53tmxfofu\\\">\\u673a\\u623f\\u51fa\\u5165\\u7ba1\\u7406\\u89c4\\u5b9a<\\/a><\\/span><\\/div><\\/td>\\n\\t\\t\\t\\t\\t<td style=\\\"width:100px; max-width: 100%; box-sizing: border-box !important; padding: 5px 10px; border: 1px solid #ddd; font-size: 14px; color: #888; word-break: break-all; word-wrap: break-word !important;\\\"><div class=\\\"imgsize\\\" style=\\\"text-align: center;\\\"><img class=\\\"layui-upload-img\\\" id=\\\"demo6\\\" src=\\\"\\/Uploads\\/product\\/file\\/2017-11-22\\/5a14dbfc5c6f9.png\\\"><\\/div><div style=\\\"text-align: center;\\\"><span style=\\\"background-color: transparent;\\\">\\u673a\\u623f\\u94a5\\u5319\\u7ba1\\u7406\\u89c4\\u5b9a<\\/span><\\/div><\\/td>\\n\\t\\t\\t\\t\\t<td style=\\\"width:100px; max-width: 100%; box-sizing: border-box !important; padding: 5px 10px; border: 1px solid #ddd; font-size: 14px; color: #888; word-break: break-all; word-wrap: break-word !important;\\\"><div class=\\\"imgsize\\\" style=\\\"text-align: center;\\\"><img class=\\\"layui-upload-img\\\" id=\\\"demo6\\\" src=\\\"\\/Uploads\\/product\\/file\\/2017-11-22\\/5a14dc012ad65.png\\\"><\\/div><div style=\\\"text-align: center;\\\"><span style=\\\"background-color: transparent;\\\">\\u7ba1\\u7406\\u89c4\\u5b9a<\\/span><\\/div><\\/td>\\n\\t\\t\\t\\t<\\/tr>\\n\\t\\t\\t\\t<tr style=\\\"max-width: 100%; box-sizing: border-box !important;  line-height: 30px; word-wrap: break-word !important; \\\">\\n\\t\\t\\t\\t\\t<td style=\\\"width: 30%; box-sizing: border-box !important; padding: 5px 10px; border: 1px solid #ddd; font-size: 14px; color: #888; word-break: break-all; word-wrap: break-word !important;\\\"><div class=\\\"imgsize\\\" style=\\\"text-align: center;\\\"><img class=\\\"layui-upload-img\\\" id=\\\"demo6\\\" src=\\\"\\/Uploads\\/product\\/file\\/2017-11-22\\/5a14dc06603c2.png\\\"><\\/div><div style=\\\"text-align: center;\\\"><span style=\\\"background-color: transparent;\\\">\\u5de1\\u67e5\\u8bb0\\u5f55<\\/span><\\/div><\\/td>\\n\\t\\t\\t\\t\\t<td style=\\\"width:100px; max-width: 100%; box-sizing: border-box !important; padding: 5px 10px; border: 1px solid #ddd; font-size: 14px; color: #888; word-break: break-all; word-wrap: break-word !important;\\\"><div class=\\\"imgsize\\\" style=\\\"text-align: center;\\\"><img class=\\\"layui-upload-img\\\" id=\\\"demo6\\\" src=\\\"\\/Uploads\\/product\\/file\\/2017-11-22\\/5a14dc0d60395.png\\\"><\\/div><div style=\\\"text-align: center;\\\"><span style=\\\"background-color: transparent;\\\">\\u7ef4\\u4fee\\u8bb0\\u5f55<\\/span><\\/div><\\/td>\\n\\t\\t\\t\\t\\t<td style=\\\"width:100px; max-width: 100%; box-sizing: border-box !important; padding: 5px 10px; border: 1px solid #ddd; font-size: 14px; color: #888; word-break: break-all; word-wrap: break-word !important;\\\"><div class=\\\"imgsize\\\" style=\\\"text-align: center;\\\"><img class=\\\"layui-upload-img\\\" id=\\\"demo6\\\" src=\\\"\\/Uploads\\/product\\/file\\/2017-11-22\\/5a14dc11e5bb3.png\\\"><\\/div><div style=\\\"text-align: center;\\\"><span style=\\\"background-color: transparent;\\\">\\u73b0\\u573a\\u5de1\\u67e5\\u7167\\u7247<\\/span><\\/div><\\/td>\\n\\t\\t\\t\\t<\\/tr>\\n\\t\\t\\t\\t\\n\\t\\t\\t\\t\\n\\t\\t\\t<\\/tbody>\\n\\t\\t<\\/table>\\n\\t<\\/section><p><\\/p><p><br><\\/p><p><br><\\/p>\"}', '18', 'http://www.qr003.com/index.php/huoma/product?d=urw63gjzb', 'urw63gjzb', '1511316635', '1511316635', '1');

-- ----------------------------
-- Table structure for `fw_echarts_data`
-- ----------------------------
DROP TABLE IF EXISTS `fw_echarts_data`;
CREATE TABLE `fw_echarts_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codeId` int(11) NOT NULL COMMENT '活码id',
  `createTime` datetime NOT NULL COMMENT '扫码日期',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1活码生成2产品3视频4网址5多网址',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `region` varchar(50) NOT NULL DEFAULT '' COMMENT '省',
  `region_id` int(11) NOT NULL DEFAULT '0' COMMENT '省份id',
  `city` varchar(50) NOT NULL DEFAULT '' COMMENT '市',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '城市id',
  `isp` varchar(20) NOT NULL DEFAULT '' COMMENT '线路（运营商）',
  `os` varchar(20) NOT NULL DEFAULT '' COMMENT '操作系统',
  `browser` varchar(20) NOT NULL DEFAULT '' COMMENT '浏览器类型',
  PRIMARY KEY (`id`),
  KEY `codeId` (`codeId`)
) ENGINE=MyISAM AUTO_INCREMENT=1386 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_echarts_data
-- ----------------------------
INSERT INTO `fw_echarts_data` VALUES ('1', '1', '2017-11-17 13:50:05', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('2', '1', '2017-11-17 13:50:36', '2', '121.51.32.144', '上海市', '310000', '上海市', '310100', '腾讯', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('3', '1', '2017-11-17 14:03:38', '1', '43.250.201.64', '湖南省', '430000', '长沙市', '430100', '联通', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('4', '1', '2017-11-17 14:21:19', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('5', '3', '2017-11-17 14:21:22', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('6', '1', '2017-11-17 14:21:28', '2', '121.51.32.144', '上海市', '310000', '上海市', '310100', '腾讯', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('7', '3', '2017-11-17 14:21:32', '1', '120.204.17.69', '上海市', '310000', '上海市', '310100', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('8', '1', '2017-11-17 14:22:32', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('9', '1', '2017-11-17 14:22:48', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('10', '1', '2017-11-17 14:27:27', '2', '101.226.225.84', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('11', '3', '2017-11-17 15:39:53', '1', '183.160.75.207', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('12', '4', '2017-11-17 16:19:51', '1', '101.226.233.153', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('13', '4', '2017-11-17 16:19:51', '1', '101.226.233.143', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('14', '4', '2017-11-17 16:19:52', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('15', '4', '2017-11-17 16:19:53', '1', '101.226.233.157', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('16', '4', '2017-11-17 16:20:37', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('17', '4', '2017-11-17 16:21:01', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('18', '2', '2017-11-17 16:39:28', '2', '101.226.233.147', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('19', '2', '2017-11-17 16:39:28', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('20', '2', '2017-11-17 16:39:29', '2', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('21', '2', '2017-11-17 16:39:37', '2', '120.204.17.70', '上海市', '310000', '上海市', '310100', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('22', '2', '2017-11-17 16:39:58', '2', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('23', '2', '2017-11-17 17:25:05', '2', '101.226.233.155', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('24', '2', '2017-11-17 17:25:05', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('25', '2', '2017-11-17 17:25:08', '2', '101.226.233.158', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('26', '2', '2017-11-17 17:25:21', '2', '58.247.212.98', '上海市', '310000', '上海市', '310100', '联通', 'Windows', '微信');
INSERT INTO `fw_echarts_data` VALUES ('27', '2', '2017-11-17 17:30:22', '2', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('28', '2', '2017-11-17 17:30:26', '2', '101.226.233.142', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('29', '2', '2017-11-17 17:30:52', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('30', '2', '2017-11-17 17:30:52', '2', '183.160.75.207', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('31', '2', '2017-11-17 17:32:27', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('32', '2', '2017-11-17 17:34:55', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('33', '4', '2017-11-17 17:35:28', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('34', '4', '2017-11-17 17:35:28', '1', '101.226.233.147', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('35', '4', '2017-11-17 17:35:32', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('36', '2', '2017-11-17 17:36:55', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('37', '2', '2017-11-17 17:42:46', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('38', '2', '2017-11-17 17:43:04', '2', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('39', '2', '2017-11-17 17:43:05', '2', '101.226.233.147', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('40', '2', '2017-11-17 17:43:16', '2', '101.226.233.158', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('41', '2', '2017-11-17 17:43:35', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('42', '2', '2017-11-17 17:43:35', '2', '183.160.75.207', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('43', '2', '2017-11-17 17:43:40', '2', '101.226.233.143', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('44', '2', '2017-11-17 17:43:40', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('45', '2', '2017-11-17 17:43:40', '2', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('46', '4', '2017-11-17 17:45:11', '1', '183.160.75.207', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('47', '4', '2017-11-17 17:45:44', '1', '106.120.160.109', '北京市', '110000', '北京市', '110100', '电信', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('48', '4', '2017-11-17 17:45:57', '1', '101.199.112.53', '北京市', '110000', '北京市', '110100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('49', '2', '2017-11-17 17:46:54', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('50', '4', '2017-11-17 17:47:18', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('51', '4', '2017-11-17 17:47:18', '1', '101.226.233.153', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('52', '4', '2017-11-17 17:47:21', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('53', '4', '2017-11-17 17:47:48', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('54', '4', '2017-11-17 17:47:48', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('55', '4', '2017-11-17 17:47:48', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('56', '4', '2017-11-17 17:47:49', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('57', '4', '2017-11-17 17:48:18', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('58', '2', '2017-11-17 18:01:25', '2', '101.226.233.153', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('59', '2', '2017-11-17 18:01:25', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('60', '2', '2017-11-17 18:01:55', '2', '101.226.233.147', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('61', '4', '2017-11-17 18:02:13', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('62', '4', '2017-11-17 18:02:14', '1', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('63', '4', '2017-11-17 18:02:25', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('64', '2', '2017-11-17 18:02:27', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('65', '2', '2017-11-17 18:02:27', '2', '101.226.233.142', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('66', '4', '2017-11-17 18:02:44', '1', '120.204.17.70', '上海市', '310000', '上海市', '310100', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('67', '4', '2017-11-17 18:02:56', '1', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('68', '2', '2017-11-17 18:03:14', '2', '101.226.233.152', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('69', '4', '2017-11-17 18:03:44', '1', '', '', '0', '', '0', '', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('70', '4', '2017-11-17 18:03:44', '1', '183.160.75.207', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('71', '4', '2017-11-17 18:03:45', '1', '183.160.75.207', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('72', '5', '2017-11-17 18:28:34', '1', '101.226.233.147', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('73', '5', '2017-11-17 18:28:34', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('74', '5', '2017-11-17 18:28:34', '1', '101.226.233.153', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('75', '5', '2017-11-17 18:28:43', '1', '183.192.201.97', '上海市', '310000', '上海市', '310100', '移动', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('76', '2', '2017-11-17 18:34:57', '2', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('77', '2', '2017-11-17 18:34:58', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('78', '2', '2017-11-17 18:34:58', '2', '101.226.233.152', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('79', '2', '2017-11-17 18:35:42', '2', '101.226.233.147', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('80', '2', '2017-11-17 18:35:42', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('81', '2', '2017-11-17 18:35:43', '2', '101.226.233.142', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('82', '2', '2017-11-17 18:36:13', '2', '101.226.233.147', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('83', '2', '2017-11-17 18:36:17', '2', '101.226.233.152', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('84', '2', '2017-11-17 18:36:17', '2', '101.226.233.143', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('85', '2', '2017-11-17 18:36:27', '2', '36.57.162.113', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('86', '2', '2017-11-17 18:36:43', '2', '61.129.6.151', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('87', '4', '2017-11-17 18:37:01', '1', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('88', '4', '2017-11-17 18:37:13', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('89', '4', '2017-11-17 18:37:13', '1', '183.160.75.207', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('90', '4', '2017-11-17 18:38:11', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('91', '4', '2017-11-17 18:38:21', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('92', '4', '2017-11-18 10:43:31', '1', '101.226.233.153', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('93', '4', '2017-11-18 10:43:32', '1', '101.226.233.145', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('94', '4', '2017-11-18 10:44:02', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('95', '4', '2017-11-18 10:44:31', '1', '183.160.75.207', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('96', '4', '2017-11-18 10:46:05', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('97', '4', '2017-11-18 10:48:03', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('98', '5', '2017-11-18 11:13:43', '1', '101.226.233.155', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('99', '5', '2017-11-18 11:13:43', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('100', '5', '2017-11-18 11:13:43', '1', '101.226.233.148', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('101', '5', '2017-11-18 11:13:53', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('102', '5', '2017-11-18 11:14:03', '1', '61.151.178.171', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', 'UC浏览器');
INSERT INTO `fw_echarts_data` VALUES ('103', '5', '2017-11-18 11:14:15', '1', '101.226.233.143', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('104', '5', '2017-11-18 11:14:15', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('105', '5', '2017-11-18 11:14:23', '1', '101.226.233.148', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('106', '2', '2017-11-18 11:17:15', '2', '101.226.233.142', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('107', '2', '2017-11-18 11:17:15', '2', '101.226.233.155', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('108', '2', '2017-11-18 11:17:16', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('109', '2', '2017-11-18 11:17:16', '2', '101.226.233.147', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('110', '4', '2017-11-18 11:18:09', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('111', '4', '2017-11-18 11:18:10', '1', '101.226.233.148', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('112', '2', '2017-11-18 11:25:22', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('113', '2', '2017-11-18 12:05:41', '2', '101.226.233.145', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('114', '2', '2017-11-18 12:05:42', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('115', '2', '2017-11-18 12:06:11', '2', '101.226.233.145', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('116', '4', '2017-11-18 12:06:55', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('117', '4', '2017-11-18 12:06:55', '1', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('118', '4', '2017-11-18 12:07:03', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('119', '2', '2017-11-18 12:08:50', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('120', '2', '2017-11-18 12:17:37', '2', '101.226.233.143', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('121', '2', '2017-11-18 12:17:37', '2', '183.160.75.207', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('122', '2', '2017-11-18 12:17:39', '2', '101.226.233.152', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('123', '1', '2017-11-18 13:37:15', '5', '183.160.75.207', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('124', '11', '2017-11-18 13:38:22', '3', '101.226.233.142', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('125', '11', '2017-11-18 13:38:23', '3', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('126', '11', '2017-11-18 13:38:23', '3', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('127', '1', '2017-11-19 06:23:47', '5', '140.205.225.185', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('128', '1', '2017-11-19 06:23:48', '5', '140.205.201.11', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('129', '1', '2017-11-19 06:23:57', '5', '140.205.225.185', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('130', '1', '2017-11-19 06:24:00', '5', '140.205.225.185', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('131', '1', '2017-11-19 06:24:09', '5', '140.205.225.185', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('132', '1', '2017-11-19 06:24:18', '5', '140.205.225.185', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('133', '1', '2017-11-19 06:36:50', '5', '140.205.201.40', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('134', '1', '2017-11-19 06:36:53', '5', '140.205.201.14', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('135', '1', '2017-11-19 06:37:02', '5', '140.205.201.40', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('136', '1', '2017-11-19 06:37:12', '5', '140.205.201.40', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('137', '1', '2017-11-19 06:37:17', '5', '140.205.201.40', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('138', '1', '2017-11-19 06:37:23', '5', '140.205.201.40', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('139', '6', '2017-11-20 12:14:13', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('140', '6', '2017-11-20 12:15:53', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('141', '6', '2017-11-20 12:15:56', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('142', '6', '2017-11-20 12:16:00', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('143', '6', '2017-11-20 12:16:07', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('144', '6', '2017-11-20 12:16:44', '1', '183.160.74.222', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('145', '6', '2017-11-20 12:16:48', '1', '183.160.74.222', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('146', '6', '2017-11-20 12:16:50', '1', '183.160.74.222', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('147', '6', '2017-11-20 12:17:21', '1', '106.120.160.119', '北京市', '110000', '北京市', '110100', '电信', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('148', '6', '2017-11-20 12:17:37', '1', '101.199.108.55', '北京市', '110000', '北京市', '110100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('149', '6', '2017-11-20 12:19:56', '1', '183.160.74.222', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('150', '6', '2017-11-20 12:19:58', '1', '183.160.74.222', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('151', '6', '2017-11-20 12:19:58', '1', '183.160.74.222', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('152', '6', '2017-11-20 12:19:59', '1', '183.160.74.222', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('153', '6', '2017-11-20 12:20:00', '1', '183.160.74.222', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('154', '6', '2017-11-20 12:20:28', '1', '183.160.74.222', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('155', '6', '2017-11-20 12:20:28', '1', '183.160.74.222', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('156', '6', '2017-11-20 12:20:29', '1', '183.160.74.222', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('157', '13', '2017-11-20 12:45:34', '4', '183.160.74.222', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('158', '6', '2017-11-20 12:46:23', '1', '183.160.74.222', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('159', '14', '2017-11-20 12:59:43', '4', '183.160.74.222', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('160', '13', '2017-11-20 12:59:55', '4', '183.160.74.222', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('161', '13', '2017-11-20 12:59:59', '4', '183.160.74.222', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('162', '15', '2017-11-20 13:01:37', '4', '183.160.74.222', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('163', '15', '2017-11-20 13:01:50', '4', '183.160.74.222', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('164', '6', '2017-11-20 13:11:34', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('165', '15', '2017-11-20 13:11:52', '4', '183.160.74.222', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('166', '15', '2017-11-20 13:12:22', '4', '183.160.74.222', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('167', '16', '2017-11-20 13:12:52', '4', '183.160.74.222', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('168', '7', '2017-11-20 13:13:40', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('169', '7', '2017-11-20 13:13:47', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('170', '7', '2017-11-20 13:13:49', '1', '58.247.212.98', '上海市', '310000', '上海市', '310100', '联通', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('171', '7', '2017-11-20 13:13:55', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('172', '7', '2017-11-20 13:14:11', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('173', '7', '2017-11-20 13:14:18', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('174', '7', '2017-11-20 13:14:48', '1', '183.160.74.222', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('175', '7', '2017-11-20 13:14:52', '1', '183.160.74.222', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('176', '7', '2017-11-20 13:14:53', '1', '183.160.74.222', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('177', '7', '2017-11-20 13:15:23', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('178', '6', '2017-11-20 13:15:35', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('179', '6', '2017-11-20 13:15:41', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('180', '6', '2017-11-20 13:15:45', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('181', '7', '2017-11-20 13:15:53', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('182', '8', '2017-11-20 13:23:09', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('183', '8', '2017-11-20 13:23:13', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('184', '17', '2017-11-20 13:25:43', '4', '183.160.74.222', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('185', '17', '2017-11-20 13:26:03', '4', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('186', '18', '2017-11-20 13:33:02', '4', '183.160.74.222', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('187', '18', '2017-11-20 13:43:07', '4', '183.160.74.222', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('188', '12', '2017-11-20 14:12:40', '3', '183.160.74.222', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('189', '18', '2017-11-20 16:12:43', '4', '183.160.73.184', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('190', '17', '2017-11-20 16:12:51', '4', '183.160.73.184', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('191', '18', '2017-11-20 16:13:21', '4', '106.120.160.119', '北京市', '110000', '北京市', '110100', '电信', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('192', '17', '2017-11-20 16:13:26', '4', '106.120.161.66', '北京市', '110000', '北京市', '110100', '电信', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('193', '18', '2017-11-20 16:13:38', '4', '101.199.108.50', '北京市', '110000', '北京市', '110100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('194', '17', '2017-11-20 16:13:47', '4', '101.199.108.54', '北京市', '110000', '北京市', '110100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('195', '19', '2017-11-20 16:19:32', '4', '183.160.73.184', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('196', '19', '2017-11-20 16:19:38', '4', '183.160.73.184', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('197', '18', '2017-11-20 16:20:10', '4', '183.160.73.184', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('198', '19', '2017-11-20 16:20:20', '4', '183.160.73.184', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('199', '19', '2017-11-20 16:20:36', '4', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('200', '19', '2017-11-20 16:20:38', '4', '101.226.233.158', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('201', '19', '2017-11-20 16:20:44', '4', '120.204.17.46', '上海市', '310000', '上海市', '310100', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('202', '19', '2017-11-20 16:20:51', '4', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('203', '19', '2017-11-20 16:20:51', '4', '183.160.73.184', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('204', '19', '2017-11-20 16:20:51', '4', '101.226.66.193', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', 'Safari');
INSERT INTO `fw_echarts_data` VALUES ('205', '19', '2017-11-20 16:21:00', '4', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('206', '2', '2017-11-20 16:21:23', '2', '101.226.233.158', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('207', '2', '2017-11-20 16:21:23', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('208', '2', '2017-11-20 16:21:24', '2', '101.226.233.153', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('209', '19', '2017-11-20 16:21:31', '4', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('210', '19', '2017-11-20 16:22:00', '4', '', '', '0', '', '0', '', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('211', '10', '2017-11-21 09:50:26', '1', '101.226.233.147', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('212', '10', '2017-11-21 09:50:26', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('213', '10', '2017-11-21 09:50:26', '1', '101.226.233.155', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('214', '5', '2017-11-21 09:58:20', '1', '101.226.233.143', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('215', '5', '2017-11-21 09:58:21', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('216', '5', '2017-11-21 09:58:21', '1', '101.226.233.152', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('217', '5', '2017-11-21 09:58:52', '1', '120.204.17.71', '上海市', '310000', '上海市', '310100', '移动', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('218', '4', '2017-11-21 13:17:40', '1', '101.226.233.158', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('219', '4', '2017-11-21 13:17:41', '1', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('220', '4', '2017-11-21 13:17:41', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('221', '3', '2017-11-22 10:11:53', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('222', '3', '2017-11-22 10:12:03', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('223', '3', '2017-11-22 10:12:37', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('224', '4', '2017-11-22 10:12:41', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('225', '6', '2017-11-22 10:12:44', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('226', '2', '2017-11-22 10:13:17', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('227', '2', '2017-11-22 10:13:17', '2', '101.226.233.148', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('228', '2', '2017-11-22 10:13:17', '2', '101.226.233.149', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('229', '4', '2017-11-22 10:13:38', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('230', '6', '2017-11-22 10:14:27', '1', '183.160.73.184', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('231', '4', '2017-11-22 10:14:58', '2', '183.160.73.184', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('232', '4', '2017-11-22 10:15:06', '2', '183.160.73.184', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('233', '4', '2017-11-22 10:15:15', '2', '183.160.73.184', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('234', '4', '2017-11-22 10:15:58', '2', '106.120.160.119', '北京市', '110000', '北京市', '110100', '电信', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('235', '4', '2017-11-22 10:16:24', '2', '101.199.108.120', '北京市', '110000', '北京市', '110100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('236', '4', '2017-11-22 10:21:33', '2', '183.160.73.184', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('237', '3', '2017-11-22 10:22:05', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('238', '4', '2017-11-22 10:24:59', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('239', '6', '2017-11-22 10:25:02', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('240', '3', '2017-11-22 10:26:07', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('241', '4', '2017-11-22 10:26:12', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('242', '3', '2017-11-22 10:26:38', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('243', '4', '2017-11-22 10:26:42', '2', '183.160.73.184', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('244', '3', '2017-11-22 10:27:00', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('245', '4', '2017-11-22 10:27:07', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('246', '3', '2017-11-22 10:27:08', '2', '183.160.73.184', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('247', '4', '2017-11-22 10:27:14', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('248', '3', '2017-11-22 10:28:13', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('249', '3', '2017-11-22 10:29:20', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('250', '3', '2017-11-22 10:32:26', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('251', '4', '2017-11-22 10:32:33', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('252', '5', '2017-11-22 10:46:18', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('253', '5', '2017-11-22 10:46:18', '1', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('254', '5', '2017-11-22 10:46:21', '1', '101.226.233.149', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('255', '2', '2017-11-22 11:52:53', '2', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('256', '2', '2017-11-22 11:52:53', '2', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('257', '2', '2017-11-22 11:52:54', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('258', '2', '2017-11-22 11:52:54', '2', '101.226.233.158', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('259', '2', '2017-11-22 11:56:03', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('260', '2', '2017-11-22 11:56:16', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('261', '2', '2017-11-22 11:57:17', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('262', '2', '2017-11-22 12:00:52', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('263', '4', '2017-11-22 12:02:22', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('264', '4', '2017-11-22 12:02:22', '1', '101.226.233.145', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('265', '3', '2017-11-22 13:01:18', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('266', '2', '2017-11-23 13:18:26', '5', '203.209.234.64', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('267', '2', '2017-11-23 13:18:33', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('268', '2', '2017-11-23 13:18:37', '5', '183.192.201.97', '上海市', '310000', '上海市', '310100', '移动', 'Windows', '微信');
INSERT INTO `fw_echarts_data` VALUES ('269', '2', '2017-11-23 13:18:56', '5', '203.209.234.232', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('270', '2', '2017-11-23 13:18:57', '5', '110.75.242.110', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('271', '2', '2017-11-23 13:21:27', '5', '101.226.66.174', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('272', '2', '2017-11-23 13:21:39', '5', '203.209.234.10', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('273', '2', '2017-11-23 13:21:46', '5', '203.209.234.66', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('274', '2', '2017-11-23 13:22:17', '5', '203.209.234.143', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('275', '2', '2017-11-23 13:22:45', '5', '203.209.234.68', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('276', '2', '2017-11-23 13:23:15', '5', '203.209.234.10', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('277', '2', '2017-11-23 13:33:54', '5', '203.209.234.87', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('278', '2', '2017-11-23 13:34:11', '5', '203.209.234.236', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('279', '4', '2017-11-23 13:35:46', '1', '101.226.233.152', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('280', '4', '2017-11-23 13:35:51', '1', '101.226.225.84', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('281', '4', '2017-11-23 13:35:52', '1', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('282', '4', '2017-11-23 13:36:17', '1', '120.204.17.46', '上海市', '310000', '上海市', '310100', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('283', '6', '2017-11-23 13:37:01', '1', '36.57.162.246', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('284', '6', '2017-11-23 13:37:01', '1', '36.57.162.246', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('285', '4', '2017-11-23 13:37:17', '2', '101.226.225.84', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('286', '6', '2017-11-23 13:37:24', '1', '101.226.225.84', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('287', '4', '2017-11-23 13:37:26', '2', '120.204.17.73', '上海市', '310000', '上海市', '310100', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('288', '6', '2017-11-23 13:37:56', '1', '120.204.17.67', '上海市', '310000', '上海市', '310100', '移动', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('289', '18', '2017-11-24 13:44:15', '4', '183.160.72.21', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('290', '10', '2017-11-24 13:44:23', '4', '183.160.72.21', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('291', '3', '2017-11-25 15:10:59', '5', '203.209.234.77', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('292', '3', '2017-11-25 15:11:06', '5', '203.209.234.133', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('293', '3', '2017-11-25 15:11:55', '5', '203.209.234.78', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('294', '3', '2017-11-25 15:12:00', '5', '203.209.234.79', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('295', '3', '2017-11-25 15:15:15', '5', '203.209.234.58', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('296', '3', '2017-11-25 15:15:54', '5', '203.209.232.75', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('297', '3', '2017-11-25 15:16:45', '5', '203.209.234.114', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('298', '3', '2017-11-25 15:18:14', '5', '203.209.234.157', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('299', '20', '2017-11-25 15:26:56', '4', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('300', '3', '2017-11-25 15:29:12', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('301', '20', '2017-11-25 15:33:43', '4', '203.209.234.31', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('302', '4', '2017-11-25 15:35:52', '5', '203.209.234.94', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('303', '4', '2017-11-25 15:36:44', '5', '203.209.234.212', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('304', '4', '2017-11-25 15:40:10', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('305', '4', '2017-11-25 15:40:20', '5', '203.209.234.3', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('306', '20', '2017-11-25 15:40:39', '4', '106.120.160.119', '北京市', '110000', '北京市', '110100', '电信', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('307', '20', '2017-11-25 15:40:50', '4', '220.181.132.199', '北京市', '110000', '北京市', '110100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('308', '4', '2017-11-25 15:41:56', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('309', '4', '2017-11-25 15:42:12', '5', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('310', '4', '2017-11-25 15:43:33', '5', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('311', '4', '2017-11-25 15:43:48', '5', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('312', '4', '2017-11-25 15:43:48', '5', '113.96.218.50', '广东省', '440000', '深圳市', '440300', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('313', '4', '2017-11-25 15:44:03', '5', '101.226.233.145', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('314', '4', '2017-11-25 15:44:18', '5', '120.204.17.67', '上海市', '310000', '上海市', '310100', '移动', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('315', '4', '2017-11-25 15:44:22', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('316', '4', '2017-11-25 15:44:22', '5', '113.96.218.50', '广东省', '440000', '深圳市', '440300', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('317', '4', '2017-11-25 15:44:22', '5', '101.226.233.145', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('318', '4', '2017-11-25 15:46:25', '5', '101.226.233.154', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('319', '4', '2017-11-25 15:46:25', '5', '140.243.70.18', '福建省', '350000', '福州市', '350100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('320', '4', '2017-11-25 15:46:26', '5', '140.243.70.18', '福建省', '350000', '福州市', '350100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('321', '4', '2017-11-25 15:49:14', '5', '203.209.234.156', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('322', '4', '2017-11-25 15:49:20', '5', '101.226.233.139', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('323', '4', '2017-11-25 15:49:30', '5', '49.87.215.174', '江苏省', '320000', '淮安市', '320800', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('324', '4', '2017-11-25 15:49:30', '5', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('325', '4', '2017-11-25 15:49:35', '5', '49.87.215.174', '江苏省', '320000', '淮安市', '320800', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('326', '4', '2017-11-25 15:49:44', '5', '49.87.215.174', '江苏省', '320000', '淮安市', '320800', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('327', '4', '2017-11-25 15:50:00', '5', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('328', '4', '2017-11-25 15:51:02', '5', '203.209.232.79', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('329', '4', '2017-11-25 15:52:25', '5', '101.226.233.154', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('330', '4', '2017-11-25 15:52:25', '5', '223.104.174.83', '江西省', '360000', '赣州市', '360700', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('331', '4', '2017-11-25 15:52:33', '5', '223.104.174.83', '江西省', '360000', '赣州市', '360700', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('332', '4', '2017-11-25 15:53:20', '5', '113.96.218.50', '广东省', '440000', '深圳市', '440300', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('333', '4', '2017-11-25 15:53:20', '5', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('334', '4', '2017-11-25 15:53:21', '5', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('335', '4', '2017-11-25 15:53:54', '5', '117.167.39.206', '江西省', '360000', '赣州市', '360700', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('336', '4', '2017-11-25 15:54:25', '5', '203.209.234.115', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('337', '4', '2017-11-25 15:55:11', '5', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('338', '4', '2017-11-25 15:55:59', '5', '101.226.233.139', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('339', '4', '2017-11-25 15:57:19', '5', '203.209.234.87', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('340', '4', '2017-11-25 16:00:15', '5', '203.209.234.146', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('341', '4', '2017-11-25 16:00:41', '5', '203.209.234.143', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('342', '4', '2017-11-25 16:02:03', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('343', '4', '2017-11-25 16:05:01', '5', '203.209.234.149', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('344', '4', '2017-11-25 16:05:42', '5', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('345', '4', '2017-11-25 16:06:59', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('346', '4', '2017-11-25 16:06:59', '5', '119.131.142.0', '广东省', '440000', '广州市', '440100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('347', '4', '2017-11-25 16:09:21', '5', '61.129.6.72', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('348', '4', '2017-11-25 16:09:21', '5', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('349', '4', '2017-11-25 16:13:24', '5', '183.3.227.100', '广东省', '440000', '深圳市', '440300', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('350', '4', '2017-11-25 16:17:58', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('351', '4', '2017-11-25 16:31:22', '5', '203.209.232.70', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('352', '20', '2017-11-25 16:31:45', '4', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('353', '4', '2017-11-25 16:31:54', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('354', '4', '2017-11-25 16:33:04', '5', '203.209.232.211', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('355', '4', '2017-11-25 16:58:31', '5', '101.226.233.148', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('356', '4', '2017-11-25 17:06:01', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('357', '4', '2017-11-25 17:06:17', '5', '223.104.31.81', '江西省', '360000', '赣州市', '360700', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('358', '4', '2017-11-25 17:14:38', '5', '101.226.233.154', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('359', '4', '2017-11-25 17:17:00', '5', '101.226.233.143', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('360', '4', '2017-11-25 17:19:50', '5', '110.75.248.248', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('361', '4', '2017-11-25 17:19:52', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('362', '4', '2017-11-25 17:20:31', '5', '110.75.242.62', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('363', '4', '2017-11-25 17:20:37', '5', '110.75.242.210', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('364', '4', '2017-11-25 17:21:30', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('365', '4', '2017-11-25 17:22:00', '5', '101.226.233.149', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('366', '4', '2017-11-25 17:22:12', '5', '110.75.242.168', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('367', '4', '2017-11-25 17:22:30', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('368', '4', '2017-11-25 17:22:44', '5', '110.75.248.85', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('369', '4', '2017-11-25 17:24:26', '5', '182.97.240.222', '江西省', '360000', '南昌市', '360100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('370', '4', '2017-11-25 17:28:06', '5', '101.226.233.145', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('371', '20', '2017-11-25 17:28:36', '4', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('372', '20', '2017-11-25 17:28:41', '4', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('373', '4', '2017-11-25 17:29:13', '5', '106.6.76.3', '江西省', '360000', '赣州市', '360700', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('374', '4', '2017-11-25 17:37:40', '5', '110.75.242.219', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('375', '4', '2017-11-25 17:38:28', '5', '110.75.242.203', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('376', '4', '2017-11-25 17:39:18', '5', '110.75.242.18', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('377', '4', '2017-11-25 17:39:35', '5', '110.75.242.17', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('378', '4', '2017-11-25 17:40:33', '5', '110.75.242.5', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('379', '4', '2017-11-25 17:45:10', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('380', '4', '2017-11-25 17:45:25', '5', '101.226.233.144', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('381', '4', '2017-11-25 17:46:22', '5', '123.151.77.123', '天津市', '120000', '天津市', '120100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('382', '4', '2017-11-25 17:55:12', '5', '117.136.40.145', '广东省', '440000', '广州市', '440100', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('383', '4', '2017-11-25 18:22:52', '5', '110.75.248.61', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('384', '4', '2017-11-25 18:23:00', '5', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('385', '4', '2017-11-25 18:24:16', '5', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('386', '4', '2017-11-25 18:26:04', '5', '112.64.68.99', '上海市', '310000', '上海市', '310100', '联通', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('387', '4', '2017-11-25 18:28:51', '5', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('388', '4', '2017-11-25 18:35:42', '5', '112.17.245.188', '浙江省', '330000', '杭州市', '330100', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('389', '4', '2017-11-25 18:37:34', '5', '101.226.233.149', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('390', '4', '2017-11-25 18:37:49', '5', '101.226.233.153', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('391', '4', '2017-11-25 19:16:52', '5', '101.226.233.144', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('392', '4', '2017-11-25 19:47:40', '5', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('393', '4', '2017-11-25 20:21:18', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('394', '4', '2017-11-25 20:22:05', '5', '110.75.242.87', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('395', '4', '2017-11-25 20:33:11', '5', '27.154.24.126', '福建省', '350000', '厦门市', '350200', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('396', '4', '2017-11-25 20:56:44', '5', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('397', '4', '2017-11-25 20:57:22', '5', '110.75.248.252', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('398', '4', '2017-11-25 21:02:48', '5', '101.226.233.144', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('399', '4', '2017-11-25 21:08:36', '5', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('400', '4', '2017-11-25 21:10:18', '5', '203.209.234.87', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('401', '4', '2017-11-25 21:22:27', '5', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('402', '4', '2017-11-25 21:22:38', '5', '110.75.242.18', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('403', '4', '2017-11-25 21:23:05', '5', '110.75.242.113', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('404', '4', '2017-11-25 21:23:42', '5', '203.209.234.3', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('405', '4', '2017-11-25 21:23:51', '5', '203.209.234.66', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('406', '4', '2017-11-25 22:07:19', '5', '101.226.233.149', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('407', '4', '2017-11-25 22:07:38', '5', '110.75.242.64', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('408', '4', '2017-11-25 22:19:46', '5', '101.226.233.155', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('409', '4', '2017-11-25 22:20:53', '5', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('410', '4', '2017-11-25 22:21:47', '5', '101.226.225.85', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('411', '4', '2017-11-25 22:21:55', '5', '120.204.17.73', '上海市', '310000', '上海市', '310100', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('412', '4', '2017-11-25 22:22:15', '5', '101.226.233.152', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('413', '4', '2017-11-25 22:36:34', '5', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('414', '4', '2017-11-25 22:36:47', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('415', '4', '2017-11-25 22:36:52', '5', '113.96.218.51', '广东省', '440000', '深圳市', '440300', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('416', '4', '2017-11-25 22:36:57', '5', '110.75.242.7', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('417', '4', '2017-11-25 22:37:24', '5', '119.136.112.102', '广东省', '440000', '深圳市', '440300', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('418', '4', '2017-11-25 22:37:56', '5', '110.75.242.197', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('419', '4', '2017-11-25 22:40:42', '5', '101.226.233.139', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('420', '4', '2017-11-25 23:16:58', '5', '203.209.232.36', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('421', '4', '2017-11-25 23:19:33', '5', '101.226.233.153', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('422', '5', '2017-11-25 23:31:27', '5', '203.209.234.64', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('423', '4', '2017-11-25 23:50:55', '5', '110.75.242.217', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('424', '4', '2017-11-26 08:52:30', '5', '101.226.233.139', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('425', '4', '2017-11-26 08:56:16', '5', '220.170.187.205', '湖南省', '430000', '株洲市', '430200', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('426', '4', '2017-11-26 09:01:20', '5', '123.151.77.74', '天津市', '120000', '天津市', '120100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('427', '4', '2017-11-26 09:01:36', '5', '153.119.243.145', '山东省', '370000', '济南市', '370100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('428', '4', '2017-11-26 09:04:00', '5', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('429', '4', '2017-11-26 09:11:31', '5', '101.226.233.145', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('430', '4', '2017-11-26 09:27:07', '5', '101.226.233.139', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('431', '4', '2017-11-26 09:27:37', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('432', '4', '2017-11-26 09:33:24', '5', '183.240.202.42', '广东省', '440000', '深圳市', '440300', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('433', '4', '2017-11-26 09:33:34', '5', '183.240.202.42', '广东省', '440000', '深圳市', '440300', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('434', '4', '2017-11-26 09:42:04', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('435', '4', '2017-11-26 09:42:32', '5', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('436', '4', '2017-11-26 09:42:47', '5', '110.75.248.189', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('437', '4', '2017-11-26 09:43:24', '5', '110.75.248.32', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('438', '4', '2017-11-26 09:43:35', '5', '101.226.233.148', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('439', '4', '2017-11-26 09:43:57', '5', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('440', '4', '2017-11-26 09:44:23', '5', '123.151.77.71', '天津市', '120000', '天津市', '120100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('441', '4', '2017-11-26 09:46:48', '5', '123.151.77.71', '天津市', '120000', '天津市', '120100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('442', '4', '2017-11-26 09:49:19', '5', '101.226.233.139', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('443', '4', '2017-11-26 09:49:49', '5', '123.151.77.71', '天津市', '120000', '天津市', '120100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('444', '4', '2017-11-26 09:52:11', '5', '110.75.248.11', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('445', '4', '2017-11-26 10:03:21', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('446', '4', '2017-11-26 10:04:02', '5', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('447', '4', '2017-11-26 10:13:47', '5', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('448', '4', '2017-11-26 10:19:17', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('449', '4', '2017-11-26 10:20:33', '5', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('450', '4', '2017-11-26 10:25:16', '5', '114.242.250.171', '北京市', '110000', '北京市', '110100', '联通', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('451', '4', '2017-11-26 10:37:19', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('452', '4', '2017-11-26 10:44:57', '5', '101.226.233.145', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('453', '4', '2017-11-26 10:47:02', '5', '110.75.248.158', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('454', '4', '2017-11-26 10:51:59', '5', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('455', '4', '2017-11-26 10:52:10', '5', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('456', '4', '2017-11-26 10:52:33', '5', '110.75.248.36', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('457', '4', '2017-11-26 10:55:38', '5', '110.75.248.142', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('458', '4', '2017-11-26 10:58:30', '5', '101.226.233.154', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('459', '4', '2017-11-26 11:16:25', '5', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('460', '4', '2017-11-26 11:41:40', '5', '101.226.233.149', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('461', '4', '2017-11-26 11:46:27', '5', '117.136.31.220', '广东省', '440000', '广州市', '440100', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('462', '4', '2017-11-26 11:46:47', '5', '203.209.232.154', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('463', '4', '2017-11-26 11:58:45', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('464', '4', '2017-11-26 11:59:47', '5', '203.209.232.191', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('465', '4', '2017-11-26 12:05:38', '5', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('466', '4', '2017-11-26 12:06:26', '5', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('467', '4', '2017-11-26 12:07:07', '5', '101.226.233.139', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('468', '4', '2017-11-26 12:07:12', '5', '163.142.25.251', '广东省', '440000', '东莞市', '441900', '联通', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('469', '4', '2017-11-26 12:09:46', '5', '163.142.25.251', '广东省', '440000', '东莞市', '441900', '联通', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('470', '4', '2017-11-26 12:20:19', '5', '14.116.133.170', '广东省', '440000', '深圳市', '440300', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('471', '4', '2017-11-26 12:20:59', '5', '14.116.133.170', '广东省', '440000', '深圳市', '440300', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('472', '4', '2017-11-26 12:26:40', '5', '203.209.232.224', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('473', '4', '2017-11-26 12:26:56', '5', '42.156.251.205', '浙江省', '330000', '杭州市', '330100', '阿里巴巴', 'Android系统', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('474', '4', '2017-11-26 12:31:43', '5', '101.226.233.142', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('475', '4', '2017-11-26 12:31:55', '5', '203.209.232.183', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('476', '4', '2017-11-26 12:33:09', '5', '101.226.233.145', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('477', '4', '2017-11-26 12:34:40', '5', '101.226.233.149', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('478', '4', '2017-11-26 12:35:23', '5', '221.11.61.221', '陕西省', '610000', '西安市', '610100', '联通', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('479', '4', '2017-11-26 12:42:36', '5', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('480', '4', '2017-11-26 12:43:09', '5', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('481', '4', '2017-11-26 13:10:26', '5', '101.226.233.139', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('482', '4', '2017-11-26 13:11:36', '5', '110.75.242.180', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('483', '4', '2017-11-26 13:12:35', '5', '110.75.242.235', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('484', '4', '2017-11-26 13:19:15', '5', '203.209.234.115', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('485', '4', '2017-11-26 13:20:45', '5', '203.209.234.68', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('486', '4', '2017-11-26 13:25:45', '5', '110.75.248.246', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('487', '4', '2017-11-26 13:26:57', '5', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('488', '4', '2017-11-26 13:27:20', '5', '110.75.242.198', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('489', '4', '2017-11-26 13:27:34', '5', '110.75.248.123', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('490', '4', '2017-11-26 13:29:24', '5', '203.209.234.62', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('491', '4', '2017-11-26 13:38:39', '5', '203.209.234.171', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('492', '4', '2017-11-26 14:08:26', '5', '223.74.23.63', '广东省', '440000', '清远市', '441800', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('493', '4', '2017-11-26 14:15:21', '5', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('494', '4', '2017-11-26 14:16:28', '5', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('495', '4', '2017-11-26 20:04:41', '5', '101.226.233.144', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('496', '4', '2017-11-26 20:47:39', '5', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('497', '4', '2017-11-26 20:50:22', '5', '101.226.233.144', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('498', '4', '2017-11-26 20:50:46', '5', '101.226.225.86', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('499', '4', '2017-11-26 20:51:17', '5', '101.226.225.86', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('500', '4', '2017-11-26 20:51:18', '5', '118.212.200.155', '江西省', '360000', '南昌市', '360100', '联通', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('501', '4', '2017-11-26 21:01:19', '5', '101.226.226.221', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('502', '4', '2017-11-27 01:23:10', '5', '140.206.89.221', '上海市', '310000', '上海市', '310100', '联通', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('503', '4', '2017-11-27 01:23:14', '5', '140.206.89.221', '上海市', '310000', '上海市', '310100', '联通', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('504', '4', '2017-11-27 01:23:26', '5', '110.75.242.207', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('505', '4', '2017-11-27 09:20:33', '5', '203.209.234.177', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('506', '4', '2017-11-27 09:20:49', '5', '101.226.233.139', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('507', '4', '2017-11-27 09:21:10', '5', '101.226.233.158', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('508', '4', '2017-11-27 10:00:37', '5', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('509', '4', '2017-11-27 10:09:58', '5', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('510', '4', '2017-11-27 10:10:13', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('511', '4', '2017-11-27 10:10:30', '5', '101.226.233.149', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('512', '4', '2017-11-27 10:17:55', '5', '203.209.234.232', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('513', '4', '2017-11-27 10:18:28', '5', '203.209.234.150', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('514', '4', '2017-11-27 10:22:09', '5', '223.104.31.6', '江西省', '360000', '赣州市', '360700', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('515', '4', '2017-11-27 10:24:48', '5', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('516', '4', '2017-11-27 10:39:10', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('517', '4', '2017-11-27 10:40:47', '5', '101.226.233.145', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('518', '4', '2017-11-27 10:41:34', '5', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('519', '4', '2017-11-27 10:45:53', '5', '223.90.77.178', '河南省', '410000', '信阳市', '411500', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('520', '4', '2017-11-27 10:52:55', '5', '101.226.233.155', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('521', '4', '2017-11-27 11:01:12', '5', '110.75.242.151', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('522', '4', '2017-11-27 11:15:08', '5', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('523', '4', '2017-11-27 11:16:27', '5', '203.209.232.168', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('524', '4', '2017-11-27 11:56:00', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('525', '4', '2017-11-27 13:38:18', '5', '101.226.233.154', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('526', '4', '2017-11-27 13:49:29', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('527', '4', '2017-11-27 14:03:45', '5', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('528', '4', '2017-11-27 14:04:53', '5', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('529', '4', '2017-11-27 14:09:50', '5', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('530', '4', '2017-11-27 14:10:20', '5', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('531', '4', '2017-11-27 14:10:36', '5', '110.75.248.45', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('532', '4', '2017-11-27 14:18:56', '5', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('533', '4', '2017-11-27 14:33:36', '5', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('534', '4', '2017-11-27 14:50:11', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('535', '4', '2017-11-27 14:52:50', '5', '101.226.233.155', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('536', '4', '2017-11-27 14:53:14', '5', '101.226.233.155', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('537', '4', '2017-11-27 15:05:31', '5', '203.209.234.236', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('538', '4', '2017-11-27 15:26:19', '5', '101.226.225.85', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('539', '4', '2017-11-27 15:26:25', '5', '120.204.17.68', '上海市', '310000', '上海市', '310100', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('540', '4', '2017-11-27 15:37:59', '5', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('541', '4', '2017-11-27 15:47:40', '5', '110.75.242.223', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('542', '4', '2017-11-27 16:00:45', '5', '101.226.233.147', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('543', '4', '2017-11-27 16:03:48', '5', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('544', '4', '2017-11-27 16:04:06', '5', '101.226.233.148', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('545', '4', '2017-11-27 16:04:30', '5', '110.75.242.111', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('546', '4', '2017-11-27 16:04:58', '5', '203.209.234.62', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('547', '4', '2017-11-27 16:05:54', '5', '112.17.246.12', '浙江省', '330000', '杭州市', '330100', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('548', '4', '2017-11-27 16:05:55', '5', '110.75.242.140', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('549', '4', '2017-11-27 16:18:10', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('550', '4', '2017-11-27 16:18:20', '5', '110.75.242.182', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('551', '4', '2017-11-27 16:18:25', '5', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('552', '4', '2017-11-27 16:19:30', '5', '110.75.242.106', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('553', '4', '2017-11-27 16:20:59', '5', '101.226.233.155', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('554', '4', '2017-11-27 16:21:20', '5', '203.209.234.72', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('555', '4', '2017-11-27 16:21:50', '5', '101.226.233.157', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('556', '4', '2017-11-27 16:26:08', '5', '203.209.232.41', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('557', '4', '2017-11-27 16:29:16', '5', '203.209.232.181', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('558', '4', '2017-11-27 16:30:10', '5', '101.226.233.144', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('559', '4', '2017-11-27 16:30:53', '5', '110.75.242.58', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('560', '4', '2017-11-27 16:30:55', '5', '203.209.232.98', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('561', '4', '2017-11-27 16:32:59', '5', '110.75.242.184', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('562', '4', '2017-11-27 16:34:47', '5', '110.75.242.116', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('563', '4', '2017-11-27 16:34:59', '5', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('564', '4', '2017-11-27 16:35:01', '5', '101.226.233.139', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('565', '4', '2017-11-27 16:35:40', '5', '110.75.242.83', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('566', '4', '2017-11-27 16:37:23', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('567', '4', '2017-11-27 16:37:39', '5', '110.75.242.118', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('568', '4', '2017-11-27 16:38:11', '5', '110.75.242.88', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('569', '4', '2017-11-27 16:39:46', '5', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('570', '4', '2017-11-27 16:39:56', '5', '110.75.242.145', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('571', '4', '2017-11-27 16:40:34', '5', '61.158.148.126', '河南省', '410000', '郑州市', '410100', '联通', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('572', '4', '2017-11-27 17:01:27', '5', '101.226.233.149', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('573', '4', '2017-11-27 17:02:14', '5', '223.104.31.21', '江西省', '360000', '赣州市', '360700', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('574', '4', '2017-11-27 17:03:00', '5', '110.75.242.112', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('575', '4', '2017-11-27 17:03:10', '5', '110.75.248.214', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('576', '4', '2017-11-27 17:20:46', '5', '110.75.242.52', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('577', '4', '2017-11-27 17:21:00', '5', '110.75.242.115', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('578', '4', '2017-11-27 17:21:13', '5', '223.104.24.13', '贵州省', '520000', '贵阳市', '520100', '移动', 'Android系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('579', '4', '2017-11-27 17:21:14', '5', '101.226.65.102', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('580', '4', '2017-11-27 17:21:16', '5', '101.226.68.215', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('581', '4', '2017-11-27 17:21:37', '5', '110.75.242.124', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('582', '4', '2017-11-27 17:24:22', '5', '110.75.242.190', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('583', '11', '2017-11-27 17:48:39', '1', '101.226.233.139', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('584', '11', '2017-11-27 17:48:39', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('585', '11', '2017-11-27 17:48:42', '1', '101.226.233.154', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('586', '11', '2017-11-27 17:49:27', '1', '101.226.233.152', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('587', '11', '2017-11-27 17:49:33', '1', '117.136.40.242', '广东省', '440000', '深圳市', '440300', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('588', '11', '2017-11-27 17:51:34', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('589', '11', '2017-11-27 17:51:35', '1', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('590', '11', '2017-11-27 17:51:36', '1', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('591', '6', '2017-11-27 17:51:43', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('592', '6', '2017-11-27 17:51:44', '5', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('593', '6', '2017-11-27 17:51:44', '5', '101.226.233.154', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('594', '11', '2017-11-27 17:53:53', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('595', '4', '2017-11-27 17:55:21', '5', '101.226.233.144', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('596', '4', '2017-11-27 18:02:09', '5', '101.226.233.142', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('597', '11', '2017-11-27 18:04:43', '1', '101.226.65.107', '上海市', '310000', '上海市', '310100', '电信', 'Windows', '微信');
INSERT INTO `fw_echarts_data` VALUES ('598', '4', '2017-11-27 18:30:48', '5', '101.226.233.149', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('599', '4', '2017-11-27 18:31:18', '5', '203.209.234.122', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('600', '11', '2017-11-27 19:30:40', '1', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('601', '11', '2017-11-27 19:30:40', '1', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('602', '11', '2017-11-27 19:31:10', '1', '101.226.233.144', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('603', '11', '2017-11-27 19:31:10', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('604', '11', '2017-11-27 19:31:11', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('605', '11', '2017-11-27 19:31:11', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('606', '11', '2017-11-27 19:31:41', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('607', '11', '2017-11-27 19:31:42', '1', '36.60.53.188', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('608', '11', '2017-11-27 19:32:59', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('609', '6', '2017-11-27 19:56:26', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('610', '6', '2017-11-27 19:56:27', '5', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('611', '6', '2017-11-27 19:56:27', '5', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('612', '11', '2017-11-27 19:56:28', '1', '101.226.233.158', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('613', '11', '2017-11-27 19:56:57', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('614', '11', '2017-11-27 19:56:57', '1', '36.60.53.188', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('615', '6', '2017-11-27 19:57:07', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('616', '6', '2017-11-27 19:57:07', '5', '101.226.233.144', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('617', '11', '2017-11-27 19:57:08', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('618', '11', '2017-11-27 19:57:08', '1', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('619', '6', '2017-11-27 19:57:14', '5', '101.226.233.148', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('620', '6', '2017-11-27 19:57:27', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('621', '6', '2017-11-27 19:57:27', '5', '36.60.53.188', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('622', '11', '2017-11-27 19:57:37', '1', '101.226.233.144', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('623', '6', '2017-11-27 19:57:38', '5', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('624', '11', '2017-11-27 19:57:39', '1', '36.60.53.188', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('625', '6', '2017-11-27 19:58:05', '5', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('626', '6', '2017-11-27 19:58:06', '5', '101.226.233.149', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('627', '6', '2017-11-27 19:58:06', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('628', '6', '2017-11-27 19:58:07', '5', '101.226.233.139', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('629', '6', '2017-11-27 19:58:08', '5', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('630', '6', '2017-11-27 19:58:15', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('631', '6', '2017-11-27 19:58:16', '5', '101.226.233.149', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('632', '6', '2017-11-27 19:58:36', '5', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('633', '6', '2017-11-27 19:58:38', '5', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('634', '6', '2017-11-27 19:58:46', '5', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('635', '6', '2017-11-27 19:58:46', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('636', '6', '2017-11-27 19:59:06', '5', '36.60.53.188', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('637', '6', '2017-11-27 19:59:16', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('638', '11', '2017-11-27 19:59:46', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('639', '6', '2017-11-27 20:00:16', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('640', '6', '2017-11-27 20:00:47', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('641', '6', '2017-11-27 20:00:47', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('642', '6', '2017-11-27 20:00:53', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('643', '11', '2017-11-27 20:00:53', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('644', '6', '2017-11-27 20:00:58', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('645', '6', '2017-11-27 20:01:23', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('646', '11', '2017-11-27 20:01:24', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('647', '6', '2017-11-27 20:01:44', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('648', '6', '2017-11-27 20:01:54', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('649', '11', '2017-11-27 20:02:24', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('650', '4', '2017-11-27 20:53:03', '5', '110.75.242.185', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('651', '6', '2017-11-27 21:58:42', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('652', '6', '2017-11-27 21:58:49', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('653', '11', '2017-11-27 21:58:50', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('654', '6', '2017-11-27 21:59:07', '5', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('655', '6', '2017-11-27 21:59:07', '5', '101.226.233.145', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('656', '6', '2017-11-27 21:59:20', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('657', '6', '2017-11-27 21:59:21', '5', '36.60.53.188', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('658', '11', '2017-11-27 21:59:21', '1', '36.60.53.188', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('659', '11', '2017-11-27 21:59:22', '1', '101.226.233.139', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('660', '11', '2017-11-27 21:59:51', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('661', '11', '2017-11-27 21:59:51', '1', '36.60.53.188', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('662', '6', '2017-11-27 22:00:13', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('663', '4', '2017-11-27 22:00:37', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('664', '4', '2017-11-27 22:00:38', '1', '101.226.233.157', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('665', '4', '2017-11-27 22:00:38', '1', '101.226.233.158', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('666', '4', '2017-11-27 22:00:47', '1', '120.204.17.46', '上海市', '310000', '上海市', '310100', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('667', '2', '2017-11-27 22:00:54', '2', '101.226.233.152', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('668', '2', '2017-11-27 22:00:55', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('669', '2', '2017-11-27 22:01:08', '2', '101.226.233.145', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('670', '11', '2017-11-27 22:01:43', '1', '101.226.233.152', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('671', '11', '2017-11-27 22:01:43', '1', '101.226.233.148', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('672', '11', '2017-11-27 22:01:43', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('673', '11', '2017-11-27 22:01:49', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('674', '11', '2017-11-27 22:01:49', '1', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('675', '11', '2017-11-27 22:01:49', '1', '101.226.233.155', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('676', '6', '2017-11-27 22:02:05', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('677', '6', '2017-11-27 22:02:05', '5', '101.226.233.154', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('678', '6', '2017-11-27 22:02:06', '5', '101.226.233.155', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('679', '6', '2017-11-27 22:02:13', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('680', '6', '2017-11-27 22:02:20', '5', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('681', '6', '2017-11-27 22:02:20', '5', '101.226.233.139', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('682', '6', '2017-11-27 22:02:36', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('683', '6', '2017-11-27 22:02:36', '5', '36.60.53.188', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('684', '11', '2017-11-27 22:02:39', '1', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('685', '11', '2017-11-27 22:02:41', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('686', '11', '2017-11-27 22:02:44', '1', '36.60.53.188', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('687', '6', '2017-11-27 22:02:50', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('688', '11', '2017-11-27 22:02:51', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('689', '11', '2017-11-27 22:02:51', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('690', '11', '2017-11-27 22:03:11', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('691', '6', '2017-11-27 22:03:21', '5', '', '', '0', '', '0', '', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('692', '11', '2017-11-27 22:03:24', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('693', '11', '2017-11-27 22:03:49', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('694', '11', '2017-11-27 22:21:26', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('695', '1', '2017-11-27 22:21:52', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('696', '1', '2017-11-27 22:21:56', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('697', '1', '2017-11-27 22:22:18', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('698', '1', '2017-11-27 22:22:22', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('699', '1', '2017-11-27 22:22:27', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('700', '1', '2017-11-27 22:22:30', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('701', '1', '2017-11-27 22:22:34', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('702', '11', '2017-11-27 22:22:35', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('703', '1', '2017-11-27 22:23:04', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('704', '1', '2017-11-27 22:23:34', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('705', '1', '2017-11-27 22:23:34', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('706', '18', '2017-11-27 22:23:55', '4', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('707', '6', '2017-11-27 22:24:14', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('708', '6', '2017-11-27 22:24:25', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('709', '11', '2017-11-27 22:24:26', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('710', '6', '2017-11-27 22:24:40', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('711', '6', '2017-11-27 22:24:40', '5', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('712', '6', '2017-11-27 22:24:49', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('713', '6', '2017-11-27 22:24:50', '5', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('714', '6', '2017-11-27 22:24:50', '5', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('715', '6', '2017-11-27 22:24:57', '5', '101.226.233.155', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('716', '6', '2017-11-27 22:24:58', '5', '101.226.233.149', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('717', '6', '2017-11-27 22:25:11', '5', '101.226.233.139', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('718', '6', '2017-11-27 22:25:11', '5', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('719', '6', '2017-11-27 22:25:20', '5', '101.226.233.145', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('720', '6', '2017-11-27 22:25:20', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('721', '6', '2017-11-27 22:25:20', '5', '36.60.53.188', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('722', '6', '2017-11-27 22:25:33', '5', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('723', '6', '2017-11-27 22:25:34', '5', '101.226.233.149', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('724', '6', '2017-11-27 22:25:41', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('725', '6', '2017-11-27 22:26:03', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('726', '6', '2017-11-27 22:26:03', '5', '36.60.53.188', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('727', '6', '2017-11-27 22:26:15', '5', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('728', '6', '2017-11-27 22:26:16', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('729', '6', '2017-11-27 22:26:17', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('730', '6', '2017-11-27 22:26:19', '5', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('731', '6', '2017-11-27 22:26:24', '5', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('732', '6', '2017-11-27 22:26:46', '5', '101.226.233.153', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('733', '6', '2017-11-27 22:26:49', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('734', '6', '2017-11-27 22:26:49', '5', '36.60.53.188', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('735', '6', '2017-11-27 22:27:13', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('736', '11', '2017-11-27 22:27:19', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('737', '6', '2017-11-27 22:27:44', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('738', '6', '2017-11-27 22:27:51', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('739', '6', '2017-11-27 22:28:03', '5', '101.226.233.148', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('740', '6', '2017-11-27 22:28:03', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('741', '6', '2017-11-27 22:28:04', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('742', '11', '2017-11-27 22:28:05', '1', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('743', '11', '2017-11-27 22:28:14', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('744', '11', '2017-11-27 22:28:15', '1', '36.60.53.188', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('745', '11', '2017-11-27 22:28:22', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('746', '6', '2017-11-27 22:28:24', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('747', '6', '2017-11-27 22:28:25', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('748', '6', '2017-11-27 22:28:26', '5', '101.226.233.144', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('749', '6', '2017-11-27 22:28:31', '5', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('750', '6', '2017-11-27 22:28:31', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('751', '6', '2017-11-27 22:28:33', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('752', '6', '2017-11-27 22:28:38', '5', '101.226.233.144', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('753', '6', '2017-11-27 22:28:39', '5', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('754', '6', '2017-11-27 22:28:52', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('755', '6', '2017-11-27 22:28:52', '5', '36.60.53.188', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('756', '11', '2017-11-27 22:28:53', '1', '36.60.53.188', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('757', '11', '2017-11-27 22:28:55', '1', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('758', '6', '2017-11-27 22:29:02', '5', '101.226.233.154', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('759', '6', '2017-11-27 22:29:03', '5', '101.226.233.144', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('760', '6', '2017-11-27 22:29:23', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('761', '6', '2017-11-27 22:29:23', '5', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('762', '6', '2017-11-27 22:29:23', '5', '36.60.53.188', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('763', '11', '2017-11-27 22:29:24', '1', '36.60.53.188', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('764', '6', '2017-11-27 22:30:15', '5', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('765', '6', '2017-11-27 22:30:16', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('766', '6', '2017-11-27 22:30:16', '5', '101.226.233.158', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('767', '11', '2017-11-27 22:30:17', '1', '101.226.233.155', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('768', '11', '2017-11-27 22:30:45', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('769', '11', '2017-11-27 22:30:48', '1', '36.60.53.188', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('770', '6', '2017-11-27 22:31:37', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('771', '11', '2017-11-27 22:31:37', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('772', '6', '2017-11-27 22:31:44', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('773', '6', '2017-11-27 22:32:07', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('774', '6', '2017-11-27 22:32:08', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('775', '11', '2017-11-27 22:32:08', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('776', '6', '2017-11-27 22:32:25', '5', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('777', '6', '2017-11-27 22:32:26', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('778', '6', '2017-11-27 22:32:38', '5', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('779', '6', '2017-11-27 22:32:41', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('780', '11', '2017-11-27 22:32:41', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('781', '6', '2017-11-27 22:32:56', '5', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('782', '6', '2017-11-27 22:32:57', '5', '101.226.233.158', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('783', '6', '2017-11-27 22:32:58', '5', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('784', '6', '2017-11-27 22:33:08', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('785', '6', '2017-11-27 22:33:08', '5', '36.60.53.188', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('786', '11', '2017-11-27 22:33:11', '1', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('787', '6', '2017-11-27 22:33:26', '5', '101.226.233.142', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('788', '6', '2017-11-27 22:42:23', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('789', '11', '2017-11-27 22:42:23', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('790', '11', '2017-11-27 22:43:17', '1', '101.226.233.143', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('791', '11', '2017-11-27 22:43:17', '1', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('792', '11', '2017-11-27 22:43:17', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('793', '11', '2017-11-27 22:43:43', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('794', '11', '2017-11-27 22:43:44', '1', '101.226.233.145', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('795', '11', '2017-11-27 22:43:44', '1', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('796', '6', '2017-11-27 22:44:05', '5', '101.226.233.155', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('797', '6', '2017-11-27 22:44:05', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('798', '11', '2017-11-27 22:44:06', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('799', '11', '2017-11-27 22:44:06', '1', '101.226.233.144', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('800', '6', '2017-11-27 22:44:12', '5', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('801', '6', '2017-11-27 22:44:14', '5', '101.226.233.145', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('802', '6', '2017-11-27 22:44:35', '5', '101.226.233.155', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('803', '6', '2017-11-27 22:45:06', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('804', '6', '2017-11-27 22:45:06', '5', '36.60.53.188', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('805', '6', '2017-11-27 22:55:09', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('806', '11', '2017-11-27 22:55:09', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('807', '6', '2017-11-27 22:55:39', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('808', '6', '2017-11-27 22:55:54', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('809', '11', '2017-11-27 22:55:55', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('810', '6', '2017-11-27 22:55:59', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('811', '11', '2017-11-27 22:56:00', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('812', '6', '2017-11-27 22:56:25', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('813', '11', '2017-11-27 22:56:26', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('814', '6', '2017-11-27 22:56:31', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('815', '6', '2017-11-27 22:56:35', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('816', '11', '2017-11-27 22:56:36', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('817', '6', '2017-11-27 22:56:40', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('818', '11', '2017-11-27 22:56:40', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('819', '6', '2017-11-27 22:57:06', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('820', '11', '2017-11-27 22:57:07', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('821', '6', '2017-11-27 23:28:01', '5', '36.5.197.7', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('822', '11', '2017-11-27 23:28:02', '1', '36.5.197.7', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('823', '6', '2017-11-27 23:28:07', '5', '36.5.197.7', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('824', '11', '2017-11-27 23:28:08', '1', '36.5.197.7', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('825', '6', '2017-11-27 23:28:22', '5', '36.5.197.7', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('826', '11', '2017-11-27 23:28:22', '1', '36.5.197.7', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('827', '11', '2017-11-27 23:28:31', '1', '106.120.161.66', '北京市', '110000', '北京市', '110100', '电信', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('828', '6', '2017-11-27 23:28:40', '5', '106.120.160.119', '北京市', '110000', '北京市', '110100', '电信', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('829', '11', '2017-11-27 23:28:41', '1', '106.120.161.66', '北京市', '110000', '北京市', '110100', '电信', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('830', '11', '2017-11-27 23:28:45', '1', '220.181.132.198', '北京市', '110000', '北京市', '110100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('831', '6', '2017-11-27 23:28:53', '5', '101.199.112.53', '北京市', '110000', '北京市', '110100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('832', '11', '2017-11-27 23:28:54', '1', '101.199.112.53', '北京市', '110000', '北京市', '110100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('833', '6', '2017-11-27 23:33:43', '5', '101.226.233.139', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('834', '6', '2017-11-27 23:33:44', '5', '101.226.225.59', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('835', '6', '2017-11-27 23:33:44', '5', '101.226.233.139', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('836', '11', '2017-11-27 23:33:45', '1', '101.226.225.59', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('837', '6', '2017-11-27 23:33:46', '5', '101.226.233.154', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('838', '6', '2017-11-27 23:33:53', '5', '101.226.225.59', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('839', '11', '2017-11-27 23:33:54', '1', '101.226.225.59', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('840', '6', '2017-11-27 23:33:56', '5', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('841', '6', '2017-11-27 23:34:11', '5', '101.226.233.149', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('842', '11', '2017-11-27 23:34:14', '1', '101.226.233.154', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('843', '11', '2017-11-27 23:34:14', '1', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('844', '6', '2017-11-27 23:34:16', '5', '101.226.233.144', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('845', '6', '2017-11-27 23:34:24', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('846', '6', '2017-11-27 23:34:45', '5', '101.226.225.59', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('847', '6', '2017-11-27 23:34:54', '5', '36.5.197.7', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('848', '6', '2017-11-27 23:35:15', '5', '101.226.233.155', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('849', '6', '2017-11-27 23:35:15', '5', '', '', '0', '', '0', '', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('850', '6', '2017-11-27 23:35:24', '5', '101.226.225.59', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('851', '6', '2017-11-27 23:35:46', '5', '101.226.233.144', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('852', '6', '2017-11-27 23:35:54', '5', '36.5.197.7', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('853', '6', '2017-11-27 23:36:12', '5', '101.226.233.139', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('854', '6', '2017-11-27 23:36:13', '5', '101.226.233.155', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('855', '6', '2017-11-27 23:36:13', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('856', '11', '2017-11-27 23:36:14', '1', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('857', '6', '2017-11-27 23:36:16', '5', '36.5.197.7', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('858', '6', '2017-11-27 23:36:16', '5', '101.226.225.59', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('859', '11', '2017-11-27 23:36:25', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('860', '11', '2017-11-27 23:36:44', '1', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('861', '11', '2017-11-27 23:36:44', '1', '36.5.197.7', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('862', '6', '2017-11-27 23:36:46', '5', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('863', '11', '2017-11-27 23:36:46', '1', '36.60.53.188', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('864', '6', '2017-11-27 23:37:14', '5', '36.5.197.7', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('865', '6', '2017-11-28 08:06:16', '5', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('866', '6', '2017-11-28 08:06:17', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('867', '6', '2017-11-28 08:06:18', '5', '101.226.233.144', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('868', '6', '2017-11-28 08:06:29', '5', '101.226.233.139', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('869', '6', '2017-11-28 08:06:29', '5', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('870', '6', '2017-11-28 08:07:00', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('871', '6', '2017-11-28 08:07:00', '5', '183.162.58.117', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('872', '4', '2017-11-28 08:07:10', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('873', '5', '2017-11-28 08:07:45', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('874', '5', '2017-11-28 08:07:54', '5', '120.204.17.70', '上海市', '310000', '上海市', '310100', '移动', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('875', '5', '2017-11-28 08:08:12', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('876', '5', '2017-11-28 08:08:34', '5', '101.226.65.107', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('877', '1', '2017-11-28 08:09:00', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('878', '1', '2017-11-28 08:09:00', '5', '101.226.233.144', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('879', '1', '2017-11-28 08:09:01', '5', '101.226.233.148', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('880', '1', '2017-11-28 08:09:09', '5', '120.204.17.73', '上海市', '310000', '上海市', '310100', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('881', '1', '2017-11-28 08:09:12', '5', '101.226.233.152', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('882', '1', '2017-11-28 08:09:31', '5', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('883', '1', '2017-11-28 08:09:31', '5', '101.226.233.153', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('884', '1', '2017-11-28 08:10:00', '5', '101.226.66.174', '上海市', '310000', '上海市', '310100', '电信', 'Windows', '微信');
INSERT INTO `fw_echarts_data` VALUES ('885', '1', '2017-11-28 08:10:02', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('886', '1', '2017-11-28 08:10:02', '5', '183.162.58.117', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('887', '1', '2017-11-28 08:10:23', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('888', '1', '2017-11-28 08:10:23', '5', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('889', '1', '2017-11-28 08:10:32', '5', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('890', '1', '2017-11-28 08:10:53', '5', '101.226.65.105', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('891', '1', '2017-11-28 08:10:54', '5', '183.162.58.117', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('892', '1', '2017-11-28 08:11:03', '5', '101.226.33.238', '上海市', '310000', '上海市', '310100', '电信', 'Windows', 'Firefox');
INSERT INTO `fw_echarts_data` VALUES ('893', '1', '2017-11-28 08:11:05', '5', '183.162.58.117', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('894', '1', '2017-11-28 08:11:36', '5', '183.162.58.117', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('895', '1', '2017-11-28 08:12:04', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('896', '1', '2017-11-28 08:12:14', '5', '101.226.65.107', '上海市', '310000', '上海市', '310100', '电信', 'Windows', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('897', '1', '2017-11-28 08:12:17', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('898', '1', '2017-11-28 08:12:30', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('899', '1', '2017-11-28 08:12:42', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('900', '1', '2017-11-28 08:12:54', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('901', '1', '2017-11-28 08:13:24', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('902', '1', '2017-11-28 08:13:25', '5', '183.162.58.117', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('903', '4', '2017-11-28 09:11:39', '5', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('904', '6', '2017-11-28 09:19:13', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('905', '11', '2017-11-28 09:19:14', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('906', '11', '2017-11-28 09:20:33', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('907', '11', '2017-11-28 09:20:34', '1', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('908', '11', '2017-11-28 09:20:34', '1', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('909', '11', '2017-11-28 09:20:45', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('910', '11', '2017-11-28 09:21:04', '1', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('911', '11', '2017-11-28 09:21:04', '1', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('912', '11', '2017-11-28 09:21:34', '1', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('913', '6', '2017-11-28 09:22:53', '5', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('914', '6', '2017-11-28 09:22:53', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('915', '11', '2017-11-28 09:22:54', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('916', '11', '2017-11-28 09:22:54', '1', '101.226.233.144', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('917', '6', '2017-11-28 09:22:57', '5', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('918', '6', '2017-11-28 09:23:00', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('919', '6', '2017-11-28 09:23:00', '5', '101.226.233.149', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('920', '11', '2017-11-28 09:23:01', '1', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('921', '11', '2017-11-28 09:23:23', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('922', '6', '2017-11-28 09:23:24', '5', '101.226.233.154', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('923', '6', '2017-11-28 09:23:25', '5', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('924', '6', '2017-11-28 09:23:28', '5', '101.226.233.144', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('925', '6', '2017-11-28 09:23:30', '5', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('926', '11', '2017-11-28 09:23:30', '1', '183.162.58.117', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('927', '6', '2017-11-28 09:23:55', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('928', '6', '2017-11-28 09:23:55', '5', '183.162.58.117', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('929', '4', '2017-11-28 09:24:48', '5', '110.75.242.145', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('930', '11', '2017-11-28 09:25:29', '1', '101.226.233.139', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('931', '11', '2017-11-28 09:25:30', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('932', '11', '2017-11-28 09:25:30', '1', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('933', '11', '2017-11-28 09:25:36', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('934', '11', '2017-11-28 09:25:36', '1', '101.226.233.155', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('935', '11', '2017-11-28 09:26:00', '1', '101.226.233.154', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('936', '21', '2017-11-28 09:26:19', '4', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('937', '21', '2017-11-28 09:26:19', '4', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('938', '11', '2017-11-28 09:26:19', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('939', '11', '2017-11-28 09:26:20', '1', '101.226.233.139', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('940', '21', '2017-11-28 09:26:20', '4', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('941', '21', '2017-11-28 09:26:25', '4', '101.226.233.148', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('942', '21', '2017-11-28 09:26:26', '4', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('943', '21', '2017-11-28 09:26:49', '4', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('944', '21', '2017-11-28 09:26:50', '4', '183.162.58.117', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('945', '11', '2017-11-28 09:26:50', '1', '183.162.58.117', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('946', '11', '2017-11-28 09:26:51', '1', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('947', '4', '2017-11-28 09:40:06', '5', '110.75.242.130', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('948', '4', '2017-11-28 09:40:40', '5', '113.96.218.50', '广东省', '440000', '深圳市', '440300', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('949', '5', '2017-11-28 10:19:11', '1', '101.226.233.158', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('950', '5', '2017-11-28 10:19:12', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('951', '5', '2017-11-28 10:19:42', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('952', '5', '2017-11-28 10:19:42', '1', '101.226.233.147', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('953', '4', '2017-11-28 10:26:09', '5', '101.226.233.145', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('954', '4', '2017-11-28 10:26:23', '5', '110.75.242.163', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('955', '4', '2017-11-28 10:26:29', '5', '110.75.242.95', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('956', '4', '2017-11-28 10:27:21', '5', '110.75.242.134', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('957', '4', '2017-11-28 10:30:42', '5', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('958', '12', '2017-11-28 11:10:50', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('959', '12', '2017-11-28 11:11:02', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('960', '5', '2017-11-28 11:11:24', '1', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('961', '5', '2017-11-28 11:11:24', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('962', '5', '2017-11-28 11:11:36', '1', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('963', '5', '2017-11-28 11:11:37', '1', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('964', '5', '2017-11-28 11:11:55', '1', '101.226.233.143', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('965', '5', '2017-11-28 11:12:06', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('966', '5', '2017-11-28 11:12:25', '1', '183.162.58.117', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('967', '6', '2017-11-28 11:21:47', '5', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('968', '6', '2017-11-28 11:21:53', '5', '223.104.63.39', '广东省', '440000', '深圳市', '440300', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('969', '11', '2017-11-28 11:21:53', '1', '223.104.63.39', '广东省', '440000', '深圳市', '440300', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('970', '11', '2017-11-28 11:21:54', '1', '101.226.233.145', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('971', '6', '2017-11-28 11:23:14', '5', '183.12.102.235', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Firefox');
INSERT INTO `fw_echarts_data` VALUES ('972', '11', '2017-11-28 11:23:14', '1', '183.12.102.235', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Firefox');
INSERT INTO `fw_echarts_data` VALUES ('973', '12', '2017-11-28 11:25:10', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('974', '13', '2017-11-28 11:25:12', '1', '223.104.63.39', '广东省', '440000', '深圳市', '440300', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('975', '13', '2017-11-28 11:25:13', '1', '101.226.233.148', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('976', '13', '2017-11-28 11:25:23', '1', '120.204.17.73', '上海市', '310000', '上海市', '310100', '移动', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('977', '12', '2017-11-28 11:25:43', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('978', '12', '2017-11-28 11:25:43', '1', '183.162.58.117', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('979', '7', '2017-11-28 11:27:03', '5', '183.12.102.235', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Firefox');
INSERT INTO `fw_echarts_data` VALUES ('980', '13', '2017-11-28 11:27:03', '1', '183.12.102.235', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Firefox');
INSERT INTO `fw_echarts_data` VALUES ('981', '2', '2017-11-28 11:27:19', '2', '101.226.233.153', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('982', '2', '2017-11-28 11:27:19', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('983', '2', '2017-11-28 11:27:20', '2', '101.226.233.143', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('984', '7', '2017-11-28 11:27:44', '5', '183.12.102.235', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Firefox');
INSERT INTO `fw_echarts_data` VALUES ('985', '13', '2017-11-28 11:27:44', '1', '183.12.102.235', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Firefox');
INSERT INTO `fw_echarts_data` VALUES ('986', '2', '2017-11-28 11:27:49', '2', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('987', '6', '2017-11-28 11:28:12', '5', '183.12.102.235', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Firefox');
INSERT INTO `fw_echarts_data` VALUES ('988', '11', '2017-11-28 11:28:12', '1', '183.12.102.235', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Firefox');
INSERT INTO `fw_echarts_data` VALUES ('989', '14', '2017-11-28 11:30:37', '1', '223.104.63.39', '广东省', '440000', '深圳市', '440300', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('990', '14', '2017-11-28 11:30:38', '1', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('991', '14', '2017-11-28 11:30:51', '1', '58.247.212.98', '上海市', '310000', '上海市', '310100', '联通', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('992', '16', '2017-11-28 11:31:35', '1', '223.104.63.39', '广东省', '440000', '深圳市', '440300', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('993', '16', '2017-11-28 11:31:35', '1', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('994', '16', '2017-11-28 11:31:46', '1', '120.204.17.73', '上海市', '310000', '上海市', '310100', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('995', '16', '2017-11-28 11:32:39', '1', '183.12.102.235', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Firefox');
INSERT INTO `fw_echarts_data` VALUES ('996', '15', '2017-11-28 11:34:07', '1', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('997', '15', '2017-11-28 11:34:08', '1', '223.104.63.39', '广东省', '440000', '深圳市', '440300', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('998', '17', '2017-11-28 11:34:25', '1', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('999', '17', '2017-11-28 11:34:38', '1', '101.226.233.139', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1000', '17', '2017-11-28 11:34:39', '1', '223.104.63.39', '广东省', '440000', '深圳市', '440300', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1001', '17', '2017-11-28 11:34:39', '1', '223.104.63.39', '广东省', '440000', '深圳市', '440300', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1002', '18', '2017-11-28 11:35:03', '1', '223.104.63.39', '广东省', '440000', '深圳市', '440300', '移动', 'iPhone系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('1003', '18', '2017-11-28 11:35:09', '1', '223.104.63.39', '广东省', '440000', '深圳市', '440300', '移动', 'iPhone系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('1004', '18', '2017-11-28 11:35:10', '1', '223.104.63.39', '广东省', '440000', '深圳市', '440300', '移动', 'iPhone系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('1005', '18', '2017-11-28 11:35:33', '1', '183.192.201.97', '上海市', '310000', '上海市', '310100', '移动', 'Windows', 'Firefox');
INSERT INTO `fw_echarts_data` VALUES ('1006', '12', '2017-11-28 11:39:27', '5', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1007', '12', '2017-11-28 11:39:27', '5', '223.104.63.39', '广东省', '440000', '深圳市', '440300', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1008', '18', '2017-11-28 11:39:28', '1', '223.104.63.39', '广东省', '440000', '深圳市', '440300', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1009', '18', '2017-11-28 11:39:30', '1', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1010', '12', '2017-11-28 11:39:58', '5', '120.204.17.71', '上海市', '310000', '上海市', '310100', '移动', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1011', '18', '2017-11-28 11:40:01', '1', '120.204.17.71', '上海市', '310000', '上海市', '310100', '移动', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1012', '4', '2017-11-28 11:40:17', '5', '101.226.233.154', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1013', '12', '2017-11-28 11:40:21', '5', '183.12.102.235', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Firefox');
INSERT INTO `fw_echarts_data` VALUES ('1014', '18', '2017-11-28 11:40:21', '1', '183.12.102.235', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Firefox');
INSERT INTO `fw_echarts_data` VALUES ('1015', '12', '2017-11-28 11:40:47', '5', '183.3.239.158', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('1016', '11', '2017-11-28 11:40:51', '5', '183.12.102.235', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Firefox');
INSERT INTO `fw_echarts_data` VALUES ('1017', '11', '2017-11-28 11:40:51', '5', '183.12.102.235', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Firefox');
INSERT INTO `fw_echarts_data` VALUES ('1018', '10', '2017-11-28 11:40:52', '5', '183.12.102.235', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Firefox');
INSERT INTO `fw_echarts_data` VALUES ('1019', '12', '2017-11-28 11:40:52', '5', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1020', '17', '2017-11-28 11:40:52', '1', '183.12.102.235', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Firefox');
INSERT INTO `fw_echarts_data` VALUES ('1021', '4', '2017-11-28 11:41:00', '5', '110.75.248.229', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('1022', '12', '2017-11-28 11:41:05', '5', '183.3.239.158', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('1023', '18', '2017-11-28 11:41:07', '1', '183.3.239.158', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('1024', '12', '2017-11-28 11:41:22', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1025', '15', '2017-11-28 11:41:22', '1', '183.12.102.235', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Firefox');
INSERT INTO `fw_echarts_data` VALUES ('1026', '12', '2017-11-28 11:41:23', '5', '183.3.239.158', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('1027', '18', '2017-11-28 11:41:23', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1028', '4', '2017-11-28 11:41:46', '5', '110.75.248.249', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('1029', '4', '2017-11-28 11:41:47', '5', '110.75.248.75', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('1030', '4', '2017-11-28 11:41:52', '5', '110.75.248.198', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('1031', '18', '2017-11-28 11:41:52', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1032', '4', '2017-11-28 11:41:53', '5', '110.75.248.7', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('1033', '12', '2017-11-28 11:41:54', '5', '182.118.20.150', '河南省', '410000', '郑州市', '410100', '联通', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('1034', '6', '2017-11-28 11:42:08', '5', '183.12.102.235', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Firefox');
INSERT INTO `fw_echarts_data` VALUES ('1035', '4', '2017-11-28 11:42:17', '5', '110.75.248.119', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('1036', '18', '2017-11-28 11:42:23', '1', '182.118.20.150', '河南省', '410000', '郑州市', '410100', '联通', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('1037', '18', '2017-11-28 11:42:23', '1', '106.120.161.66', '北京市', '110000', '北京市', '110100', '电信', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('1038', '12', '2017-11-28 11:42:27', '5', '220.181.132.196', '北京市', '110000', '北京市', '110100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1039', '18', '2017-11-28 11:42:28', '1', '220.181.132.196', '北京市', '110000', '北京市', '110100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1040', '18', '2017-11-28 11:42:31', '1', '101.199.108.118', '北京市', '110000', '北京市', '110100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1041', '12', '2017-11-28 11:42:39', '5', '106.120.160.119', '北京市', '110000', '北京市', '110100', '电信', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('1042', '12', '2017-11-28 11:42:53', '5', '182.118.20.150', '河南省', '410000', '郑州市', '410100', '联通', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('1043', '18', '2017-11-28 11:44:32', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1044', '18', '2017-11-28 11:44:41', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1045', '18', '2017-11-28 11:45:10', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1046', '12', '2017-11-28 11:45:19', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1047', '18', '2017-11-28 11:45:19', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1048', '18', '2017-11-28 11:47:57', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1049', '12', '2017-11-28 11:49:36', '5', '183.12.102.235', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Firefox');
INSERT INTO `fw_echarts_data` VALUES ('1050', '18', '2017-11-28 11:49:36', '1', '183.12.102.235', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Firefox');
INSERT INTO `fw_echarts_data` VALUES ('1051', '4', '2017-11-28 11:51:41', '5', '113.96.218.50', '广东省', '440000', '深圳市', '440300', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1052', '4', '2017-11-28 11:52:00', '5', '110.75.242.73', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('1053', '4', '2017-11-28 11:54:56', '5', '203.209.232.190', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('1054', '4', '2017-11-28 11:56:37', '5', '110.75.242.66', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('1055', '4', '2017-11-28 11:59:33', '5', '101.226.233.143', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1056', '4', '2017-11-28 12:12:11', '5', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1057', '4', '2017-11-28 12:16:39', '5', '117.136.79.11', '广东省', '440000', '广州市', '440100', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1058', '12', '2017-11-28 12:18:24', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1059', '18', '2017-11-28 12:18:28', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1060', '4', '2017-11-28 12:45:51', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1061', '4', '2017-11-28 12:46:29', '5', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1062', '4', '2017-11-28 12:47:09', '5', '101.226.233.149', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1063', '4', '2017-11-28 12:47:49', '5', '101.226.233.148', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1064', '4', '2017-11-28 12:48:50', '5', '112.12.207.67', '浙江省', '330000', '温州市', '330300', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1065', '4', '2017-11-28 12:49:03', '5', '112.12.207.67', '浙江省', '330000', '温州市', '330300', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1066', '4', '2017-11-28 12:49:49', '5', '110.75.242.226', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('1067', '4', '2017-11-28 12:50:18', '5', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1068', '4', '2017-11-28 12:54:06', '5', '101.226.233.144', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1069', '4', '2017-11-28 12:54:40', '5', '110.75.242.160', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('1070', '4', '2017-11-28 12:54:45', '5', '110.75.242.71', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('1071', '4', '2017-11-28 12:55:16', '5', '110.75.242.213', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('1072', '4', '2017-11-28 12:56:01', '5', '110.75.242.37', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'iPhone系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('1073', '18', '2017-11-28 13:01:29', '1', '106.120.160.119', '北京市', '110000', '北京市', '110100', '电信', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('1074', '18', '2017-11-28 13:01:45', '1', '101.199.112.52', '北京市', '110000', '北京市', '110100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1075', '6', '2017-11-28 13:07:07', '5', '183.12.102.235', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Firefox');
INSERT INTO `fw_echarts_data` VALUES ('1076', '11', '2017-11-28 13:07:07', '1', '183.12.102.235', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Firefox');
INSERT INTO `fw_echarts_data` VALUES ('1077', '11', '2017-11-28 13:07:10', '1', '183.12.102.235', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Firefox');
INSERT INTO `fw_echarts_data` VALUES ('1078', '11', '2017-11-28 13:07:11', '1', '183.12.102.235', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Firefox');
INSERT INTO `fw_echarts_data` VALUES ('1079', '6', '2017-11-28 13:11:52', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1080', '13', '2017-11-28 13:11:52', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1081', '6', '2017-11-28 13:11:59', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1082', '14', '2017-11-28 13:11:59', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1083', '6', '2017-11-28 13:12:04', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1084', '15', '2017-11-28 13:12:34', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1085', '6', '2017-11-28 13:12:45', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1086', '16', '2017-11-28 13:12:45', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1087', '6', '2017-11-28 13:12:50', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1088', '17', '2017-11-28 13:12:51', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1089', '6', '2017-11-28 13:12:55', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1090', '18', '2017-11-28 13:12:56', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1091', '6', '2017-11-28 13:13:25', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1092', '11', '2017-11-28 13:13:26', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1093', '6', '2017-11-28 13:13:32', '5', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1094', '13', '2017-11-28 13:13:32', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1095', '6', '2017-11-28 13:15:07', '5', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1096', '6', '2017-11-28 13:15:11', '5', '223.104.63.39', '广东省', '440000', '深圳市', '440300', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1097', '15', '2017-11-28 13:15:12', '1', '223.104.63.39', '广东省', '440000', '深圳市', '440300', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1098', '6', '2017-11-28 13:15:19', '5', '223.104.63.39', '广东省', '440000', '深圳市', '440300', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1099', '6', '2017-11-28 13:15:20', '5', '101.226.233.153', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1100', '16', '2017-11-28 13:15:20', '1', '223.104.63.39', '广东省', '440000', '深圳市', '440300', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1101', '16', '2017-11-28 13:15:37', '1', '101.226.233.144', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1102', '15', '2017-11-28 13:15:42', '1', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1103', '15', '2017-11-28 13:15:50', '1', '58.247.212.98', '上海市', '310000', '上海市', '310100', '联通', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1104', '6', '2017-11-28 13:21:13', '5', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1105', '6', '2017-11-28 13:21:14', '5', '183.12.102.235', '广东省', '440000', '深圳市', '440300', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1106', '11', '2017-11-28 13:21:14', '1', '183.12.102.235', '广东省', '440000', '深圳市', '440300', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1107', '2', '2017-11-28 13:33:00', '2', '101.226.233.147', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1108', '2', '2017-11-28 13:33:01', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1109', '2', '2017-11-28 13:33:28', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('1110', '2', '2017-11-28 13:33:30', '2', '101.226.233.142', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1111', '2', '2017-11-28 13:34:00', '2', '101.226.233.148', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1112', '2', '2017-11-28 13:35:38', '2', '101.226.233.152', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1113', '2', '2017-11-28 13:35:38', '2', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1114', '2', '2017-11-28 13:35:38', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1115', '2', '2017-11-28 13:52:06', '2', '101.226.233.155', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1116', '2', '2017-11-28 13:52:07', '2', '101.226.233.143', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1117', '2', '2017-11-28 13:52:07', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1118', '2', '2017-11-28 13:53:03', '2', '101.226.233.154', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1119', '2', '2017-11-28 13:53:04', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1120', '2', '2017-11-28 13:53:33', '2', '101.226.233.153', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1121', '2', '2017-11-28 13:54:03', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('1122', '2', '2017-11-28 13:54:27', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('1123', '2', '2017-11-28 13:54:34', '2', '', '', '0', '', '0', '', 'Android系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('1124', '2', '2017-11-28 13:58:10', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1125', '2', '2017-11-28 13:58:37', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1126', '2', '2017-11-28 13:58:37', '2', '101.226.233.145', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1127', '2', '2017-11-28 13:58:38', '2', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1128', '5', '2017-11-28 14:00:11', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1129', '4', '2017-11-28 14:00:18', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1130', '4', '2017-11-28 14:00:18', '1', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1131', '5', '2017-11-28 14:00:24', '2', '121.51.32.144', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1132', '12', '2017-11-28 14:01:39', '3', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1133', '19', '2017-11-28 14:03:06', '1', '101.226.233.149', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1134', '19', '2017-11-28 14:03:06', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1135', '19', '2017-11-28 14:03:07', '1', '101.226.233.147', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1136', '19', '2017-11-28 14:03:16', '1', '121.51.32.144', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1137', '19', '2017-11-28 14:03:31', '1', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('1138', '19', '2017-11-28 14:03:47', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('1139', '19', '2017-11-28 14:04:01', '1', '101.226.33.223', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', 'UC浏览器');
INSERT INTO `fw_echarts_data` VALUES ('1140', '6', '2017-11-28 14:06:49', '2', '101.226.233.157', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1141', '6', '2017-11-28 14:06:50', '2', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1142', '6', '2017-11-28 14:06:50', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1143', '4', '2017-11-28 14:07:20', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1144', '6', '2017-11-28 14:07:20', '2', '101.226.233.157', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1145', '4', '2017-11-28 14:07:50', '1', '101.226.233.153', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1146', '6', '2017-11-28 14:07:50', '2', '120.204.17.71', '上海市', '310000', '上海市', '310100', '移动', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1147', '6', '2017-11-28 14:08:08', '2', '101.226.233.143', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1148', '4', '2017-11-28 14:08:21', '1', '', '', '0', '', '0', '', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1149', '6', '2017-11-28 14:08:51', '2', '101.226.225.86', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', 'Safari');
INSERT INTO `fw_echarts_data` VALUES ('1150', '4', '2017-11-28 14:09:19', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1151', '6', '2017-11-28 14:09:19', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1152', '6', '2017-11-28 14:09:19', '2', '183.160.72.99', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1153', '6', '2017-11-28 14:09:19', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1154', '6', '2017-11-28 14:09:22', '2', '', '', '0', '', '0', '', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1155', '6', '2017-11-28 14:09:25', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1156', '4', '2017-11-28 14:09:28', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1157', '6', '2017-11-28 14:09:49', '2', '101.226.233.152', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1158', '6', '2017-11-28 14:09:49', '2', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1159', '4', '2017-11-28 14:09:50', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1160', '4', '2017-11-28 14:09:56', '1', '101.226.233.158', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1161', '4', '2017-11-28 14:10:26', '1', '183.162.58.117', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1162', '6', '2017-11-28 14:10:36', '2', '101.226.233.146', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1163', '6', '2017-11-28 14:10:36', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1164', '6', '2017-11-28 14:10:36', '2', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1165', '6', '2017-11-28 14:10:49', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('1166', '4', '2017-11-28 14:11:06', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('1167', '4', '2017-11-28 14:11:07', '1', '183.162.58.117', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('1168', '2', '2017-11-28 14:40:51', '2', '101.226.233.145', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1169', '2', '2017-11-28 14:40:51', '2', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1170', '2', '2017-11-28 14:41:21', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1171', '2', '2017-11-28 14:41:25', '2', '101.226.233.155', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1172', '2', '2017-11-28 14:41:51', '2', '183.162.58.117', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1173', '2', '2017-11-28 14:41:55', '2', '101.226.233.157', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1174', '2', '2017-11-28 14:42:26', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1175', '2', '2017-11-28 14:42:27', '2', '101.226.233.142', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1176', '4', '2017-11-28 14:42:32', '5', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1177', '2', '2017-11-28 14:42:56', '2', '183.162.58.117', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1178', '2', '2017-11-28 14:42:58', '2', '101.226.233.155', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1179', '4', '2017-11-28 14:43:15', '5', '110.75.248.93', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('1180', '2', '2017-11-28 14:43:26', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1181', '2', '2017-11-28 14:43:27', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1182', '2', '2017-11-28 14:43:56', '2', '183.162.58.117', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1183', '4', '2017-11-28 14:43:59', '5', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1184', '2', '2017-11-28 14:44:26', '2', '183.162.58.117', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1185', '4', '2017-11-28 14:44:42', '5', '14.116.137.170', '广东省', '440000', '深圳市', '440300', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1186', '4', '2017-11-28 14:44:56', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1187', '4', '2017-11-28 14:44:56', '1', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1188', '4', '2017-11-28 14:45:06', '5', '14.116.137.170', '广东省', '440000', '深圳市', '440300', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1189', '2', '2017-11-28 14:45:49', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1190', '2', '2017-11-28 14:46:15', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('1191', '4', '2017-11-28 14:46:32', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1192', '4', '2017-11-28 14:46:42', '5', '182.97.24.154', '江西省', '360000', '南昌市', '360100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1193', '4', '2017-11-28 14:46:46', '5', '182.97.24.154', '江西省', '360000', '南昌市', '360100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1194', '20', '2017-11-28 14:47:30', '1', '101.226.233.143', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1195', '20', '2017-11-28 14:47:30', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1196', '20', '2017-11-28 14:47:31', '1', '101.226.233.157', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1197', '20', '2017-11-28 14:48:00', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('1198', '20', '2017-11-28 14:48:01', '1', '120.204.17.67', '上海市', '310000', '上海市', '310100', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1199', '20', '2017-11-28 14:48:26', '1', '101.226.233.148', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1200', '20', '2017-11-28 14:48:26', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1201', '20', '2017-11-28 14:48:31', '1', '101.226.33.201', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', 'Safari');
INSERT INTO `fw_echarts_data` VALUES ('1202', '20', '2017-11-28 14:48:56', '1', '101.226.233.153', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1203', '20', '2017-11-28 14:48:58', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1204', '20', '2017-11-28 14:48:59', '1', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1205', '20', '2017-11-28 14:49:01', '1', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1206', '20', '2017-11-28 14:49:32', '1', '101.226.233.142', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1207', '20', '2017-11-28 14:49:35', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1208', '20', '2017-11-28 14:49:36', '1', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1209', '20', '2017-11-28 14:50:06', '1', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1210', '2', '2017-11-28 14:52:38', '2', '101.226.233.152', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1211', '2', '2017-11-28 14:53:08', '2', '101.226.233.144', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1212', '2', '2017-11-28 14:53:38', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1213', '2', '2017-11-28 14:54:08', '2', '183.162.58.117', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1214', '2', '2017-11-28 14:54:09', '2', '183.162.58.117', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1215', '2', '2017-11-28 15:02:12', '2', '101.226.233.153', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1216', '2', '2017-11-28 15:02:13', '2', '101.226.233.152', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1217', '2', '2017-11-28 15:02:13', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1218', '2', '2017-11-28 15:24:58', '2', '101.226.233.157', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1219', '2', '2017-11-28 15:24:58', '2', '101.226.233.157', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1220', '2', '2017-11-28 15:24:58', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1221', '2', '2017-11-28 15:25:00', '2', '101.226.233.155', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1222', '4', '2017-11-28 15:25:28', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1223', '4', '2017-11-28 15:25:28', '1', '101.226.233.158', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1224', '2', '2017-11-28 15:25:38', '2', '101.226.233.158', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1225', '2', '2017-11-28 15:25:38', '2', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1226', '2', '2017-11-28 15:25:39', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1227', '2', '2017-11-28 15:25:59', '2', '101.226.233.153', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1228', '21', '2017-11-28 15:27:00', '1', '101.226.233.142', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1229', '21', '2017-11-28 15:27:00', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1230', '21', '2017-11-28 15:27:30', '1', '101.226.233.153', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1231', '2', '2017-11-28 15:27:53', '2', '101.226.233.143', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1232', '2', '2017-11-28 15:27:54', '2', '61.129.6.151', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1233', '21', '2017-11-28 15:28:01', '1', '120.204.17.71', '上海市', '310000', '上海市', '310100', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1234', '2', '2017-11-28 15:28:24', '2', '101.226.233.142', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1235', '2', '2017-11-28 15:28:26', '2', '36.57.167.72', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('1236', '2', '2017-11-28 15:28:31', '2', '61.129.6.151', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('1237', '21', '2017-11-28 15:28:54', '1', '101.226.33.227', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', 'Safari');
INSERT INTO `fw_echarts_data` VALUES ('1238', '2', '2017-11-28 15:29:01', '2', '183.61.51.52', '广东省', '440000', '深圳市', '440300', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1239', '2', '2017-11-28 15:29:06', '2', '183.57.53.177', '广东省', '440000', '深圳市', '440300', '电信', 'iPhone系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('1240', '2', '2017-11-28 15:29:12', '2', '113.108.10.16', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('1241', '2', '2017-11-28 15:29:12', '2', '183.3.239.159', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('1242', '2', '2017-11-28 15:29:31', '2', '113.108.10.16', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('1243', '2', '2017-11-28 15:29:44', '2', '36.57.167.72', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1244', '2', '2017-11-28 15:30:02', '2', '183.3.239.159', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('1245', '7', '2017-11-28 15:37:26', '2', '101.226.233.153', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1246', '7', '2017-11-28 15:37:26', '2', '61.129.6.151', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1247', '7', '2017-11-28 15:37:56', '2', '101.226.233.153', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1248', '2', '2017-11-28 15:38:26', '2', '36.57.167.72', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1249', '7', '2017-11-28 15:38:27', '2', '120.204.17.67', '上海市', '310000', '上海市', '310100', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1250', '7', '2017-11-28 15:38:28', '2', '101.226.66.181', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', 'Safari');
INSERT INTO `fw_echarts_data` VALUES ('1251', '7', '2017-11-28 15:40:01', '2', '101.226.233.153', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1252', '7', '2017-11-28 15:40:01', '2', '101.226.233.153', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1253', '7', '2017-11-28 15:40:11', '2', '120.204.17.70', '上海市', '310000', '上海市', '310100', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1254', '7', '2017-11-28 15:40:31', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1255', '7', '2017-11-28 15:40:41', '2', '183.162.58.117', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1256', '7', '2017-11-28 15:41:00', '2', '101.226.233.153', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1257', '8', '2017-11-28 15:42:08', '2', '101.226.233.145', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1258', '8', '2017-11-28 15:42:08', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1259', '8', '2017-11-28 15:42:08', '2', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1260', '8', '2017-11-28 15:42:30', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1261', '2', '2017-11-28 15:42:47', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1262', '2', '2017-11-28 15:43:00', '2', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1263', '2', '2017-11-28 15:43:31', '2', '101.226.233.158', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1264', '5', '2017-11-28 15:44:26', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1265', '5', '2017-11-28 15:44:27', '1', '101.226.233.142', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1266', '5', '2017-11-28 15:44:56', '1', '101.226.233.158', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1267', '22', '2017-11-28 15:47:09', '1', '101.226.233.145', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1268', '22', '2017-11-28 15:47:10', '1', '61.129.6.151', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1269', '22', '2017-11-28 15:47:10', '1', '101.226.233.153', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1270', '22', '2017-11-28 15:47:28', '1', '61.129.6.151', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('1271', '22', '2017-11-28 15:47:38', '1', '101.226.66.181', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('1272', '22', '2017-11-28 15:47:48', '1', '183.3.239.169', '广东省', '440000', '深圳市', '440300', '电信', 'Windows', 'Internet Explorer');
INSERT INTO `fw_echarts_data` VALUES ('1273', '22', '2017-11-28 15:47:50', '1', '101.226.33.204', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', 'Safari');
INSERT INTO `fw_echarts_data` VALUES ('1274', '22', '2017-11-28 15:48:08', '1', '183.61.51.61', '广东省', '440000', '深圳市', '440300', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1275', '22', '2017-11-28 15:48:21', '1', '36.57.167.72', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1276', '4', '2017-11-28 15:48:25', '5', '101.226.233.139', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1277', '22', '2017-11-28 15:48:38', '1', '112.90.82.196', '广东省', '440000', '深圳市', '440300', '联通', 'iPhone系统', 'QQ');
INSERT INTO `fw_echarts_data` VALUES ('1278', '4', '2017-11-28 15:50:43', '5', '14.116.137.168', '广东省', '440000', '深圳市', '440300', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1279', '22', '2017-11-28 15:51:02', '1', '36.57.167.72', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1280', '4', '2017-11-28 15:51:21', '5', '14.116.137.168', '广东省', '440000', '深圳市', '440300', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1281', '4', '2017-11-28 15:52:28', '5', '110.75.248.19', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('1282', '4', '2017-11-28 15:52:42', '5', '110.75.248.144', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('1283', '2', '2017-11-28 15:53:33', '2', '101.226.233.158', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1284', '2', '2017-11-28 15:53:34', '2', '101.226.233.145', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1285', '4', '2017-11-28 15:53:45', '5', '110.75.248.15', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('1286', '2', '2017-11-28 15:54:04', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1287', '4', '2017-11-28 15:54:07', '5', '110.75.248.88', '广东省', '440000', '深圳市', '440300', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('1288', '2', '2017-11-28 15:54:34', '2', '183.162.58.117', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1289', '4', '2017-11-28 15:54:48', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1290', '4', '2017-11-28 15:55:04', '1', '101.226.233.147', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1291', '22', '2017-11-28 15:58:15', '1', '36.57.167.72', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1292', '2', '2017-11-28 15:58:59', '2', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1293', '4', '2017-11-28 15:59:42', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1294', '22', '2017-11-28 16:04:26', '1', '101.226.233.153', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1295', '22', '2017-11-28 16:04:27', '1', '61.151.207.252', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1296', '22', '2017-11-28 16:04:27', '1', '101.226.233.155', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1297', '22', '2017-11-28 16:04:56', '1', '101.226.233.155', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1298', '2', '2017-11-28 16:17:58', '2', '36.57.167.72', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1299', '22', '2017-11-28 16:28:30', '1', '101.226.225.84', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1300', '22', '2017-11-28 16:28:31', '1', '101.226.233.155', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1301', '22', '2017-11-28 16:29:01', '1', '101.226.233.145', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1302', '22', '2017-11-28 16:29:04', '1', '101.226.233.145', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1303', '22', '2017-11-28 16:29:04', '1', '101.226.225.84', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1304', '22', '2017-11-28 16:29:31', '1', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1305', '22', '2017-11-28 16:30:01', '1', '101.226.233.158', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1306', '22', '2017-11-28 16:30:02', '1', '36.57.167.72', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1307', '22', '2017-11-28 16:30:05', '1', '36.57.167.72', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1308', '22', '2017-11-28 16:33:01', '1', '36.57.167.72', '安徽省', '340000', '合肥市', '340100', '电信', 'Android系统', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1309', '4', '2017-11-28 20:04:30', '5', '101.226.233.142', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1310', '4', '2017-11-28 20:06:14', '5', '203.209.234.3', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('1311', '4', '2017-11-28 20:11:58', '5', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1312', '4', '2017-11-28 20:12:33', '5', '203.209.232.168', '上海市', '310000', '上海市', '310100', '阿里巴巴', 'Android系统', '支付宝');
INSERT INTO `fw_echarts_data` VALUES ('1313', '4', '2017-11-29 01:14:55', '5', '101.226.226.221', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1314', '4', '2017-11-29 01:15:03', '5', '120.204.17.67', '上海市', '310000', '上海市', '310100', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1315', '4', '2017-11-29 01:17:29', '5', '101.226.65.107', '上海市', '310000', '上海市', '310100', '电信', 'Windows', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1316', '2', '2017-11-29 08:40:54', '2', '36.57.167.72', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1317', '4', '2017-11-29 09:06:08', '5', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1318', '1', '2017-11-29 14:34:46', '5', '36.57.161.193', '安徽省', '340000', '合肥市', '340100', '电信', 'Windows', 'Chrome');
INSERT INTO `fw_echarts_data` VALUES ('1319', '4', '2017-11-29 14:39:29', '2', '101.226.225.86', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1320', '4', '2017-11-29 14:39:36', '2', '120.204.17.71', '上海市', '310000', '上海市', '310100', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1321', '6', '2017-11-29 14:41:26', '5', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1322', '6', '2017-11-29 14:41:27', '5', '101.226.225.86', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1323', '13', '2017-11-29 14:41:28', '1', '101.226.225.86', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1324', '6', '2017-11-29 14:41:31', '5', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1325', '6', '2017-11-29 14:41:35', '5', '183.192.201.97', '上海市', '310000', '上海市', '310100', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1326', '13', '2017-11-29 14:41:39', '1', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1327', '15', '2017-11-29 14:41:58', '1', '183.192.201.97', '上海市', '310000', '上海市', '310100', '移动', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1379', '6', '2017-11-29 15:32:06', '5', '101.226.233.154', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1378', '18', '2017-11-29 15:31:38', '1', '101.226.233.150', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1377', '18', '2017-11-29 15:31:37', '1', '101.226.225.86', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1376', '6', '2017-11-29 15:31:36', '5', '101.226.225.86', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1375', '6', '2017-11-29 15:18:32', '5', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1374', '16', '2017-11-29 15:18:24', '1', '101.226.233.144', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1371', '6', '2017-11-29 15:18:02', '5', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1372', '6', '2017-11-29 15:18:02', '5', '101.226.225.86', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1373', '16', '2017-11-29 15:18:03', '1', '101.226.225.86', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1385', '15', '2017-11-29 15:32:26', '1', '101.226.233.140', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1384', '15', '2017-11-29 15:32:25', '1', '101.226.225.86', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1383', '6', '2017-11-29 15:32:25', '5', '101.226.233.151', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1382', '6', '2017-11-29 15:32:24', '5', '101.226.225.86', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1381', '6', '2017-11-29 15:32:24', '5', '101.226.233.156', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1380', '6', '2017-11-29 15:32:08', '5', '101.226.233.139', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1370', '11', '2017-11-29 15:13:09', '1', '101.226.233.149', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1369', '11', '2017-11-29 15:13:07', '1', '101.226.225.86', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1368', '6', '2017-11-29 15:13:07', '5', '101.226.233.141', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1367', '6', '2017-11-29 15:13:07', '5', '101.226.233.155', '上海市', '310000', '上海市', '310100', '电信', 'iPhone系统', '微信');
INSERT INTO `fw_echarts_data` VALUES ('1366', '6', '2017-11-29 15:13:07', '5', '101.226.225.86', '上海市', '310000', '上海市', '310100', '电信', 'Android系统', '微信');

-- ----------------------------
-- Table structure for `fw_orders`
-- ----------------------------
DROP TABLE IF EXISTS `fw_orders`;
CREATE TABLE `fw_orders` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(30) NOT NULL DEFAULT '',
  `userId` int(11) NOT NULL DEFAULT '0',
  `orderStatus` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '-1待付款,1已付款',
  `vipId` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1基础会员,2高级会员,3定制会员',
  `year` tinyint(10) NOT NULL DEFAULT '1' COMMENT '有效期',
  `isNew` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1新开,0续费',
  `payType` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0支付宝,1微信,2汇款',
  `payMoney` decimal(11,2) NOT NULL DEFAULT '0.00',
  `tradeNo` varchar(30) NOT NULL DEFAULT '',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `pay_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`orderId`),
  KEY `userId` (`userId`),
  KEY `orderStatus` (`orderStatus`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_orders
-- ----------------------------
INSERT INTO `fw_orders` VALUES ('1', '2017111615108399500457', '4', '1', '5', '1', '1', '1', '0.01', '4200000016201711165113048048', '1510839950', '1510839982', '1');
INSERT INTO `fw_orders` VALUES ('2', '2017111615108404092687', '4', '1', '5', '1', '0', '2', '8800.00', '', '1510840409', '1510840460', '1');
INSERT INTO `fw_orders` VALUES ('3', '2017111715108979072666', '5', '1', '2', '1', '1', '0', '500.00', '2017111721001104780558720972', '1510897907', '1510897948', '1');
INSERT INTO `fw_orders` VALUES ('4', '2017111815109833346183', '4', '1', '5', '1', '0', '2', '8800.00', '', '1510983334', '1510983334', '1');
INSERT INTO `fw_orders` VALUES ('5', '2017112315113694162392', '9', '-1', '1', '1', '1', '0', '100.00', '', '1511369416', '0', '1');
INSERT INTO `fw_orders` VALUES ('6', '2017112315114138069231', '10', '1', '1', '1', '1', '2', '100.00', '', '1511413806', '1511413806', '1');
INSERT INTO `fw_orders` VALUES ('7', '2017112515115738305093', '11', '1', '1', '1', '1', '2', '100.00', '', '1511573830', '1511573830', '1');
INSERT INTO `fw_orders` VALUES ('8', '2017112515115933984838', '10', '1', '2', '1', '0', '0', '401.00', '2017112521001004830591394337', '1511593398', '1511593418', '1');
INSERT INTO `fw_orders` VALUES ('9', '2017112715117732450919', '14', '-1', '3', '1', '1', '0', '1000.00', '', '1511773245', '0', '1');
INSERT INTO `fw_orders` VALUES ('10', '2017112715117740362799', '14', '1', '3', '1', '1', '2', '1000.00', '', '1511774036', '1511774036', '1');

-- ----------------------------
-- Table structure for `fw_payments`
-- ----------------------------
DROP TABLE IF EXISTS `fw_payments`;
CREATE TABLE `fw_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payCode` varchar(20) DEFAULT NULL,
  `payName` varchar(50) DEFAULT NULL,
  `payConfig` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_payments
-- ----------------------------
INSERT INTO `fw_payments` VALUES ('5', 'alipays', '支付宝(及时到帐)', '{\"payAccount\":\"xiazezhong@foxmail.com\",\"parterID\":\"2088002910880484\",\"parterKey\":\"kr121b3p9al7papo0d4qlza8jbwmi4u2\"}');
INSERT INTO `fw_payments` VALUES ('6', 'weixinpays', '微信支付', '{\"appId\":\"wx00144bcecfa47639\",\"appsecret\":\"5f7ac4b7e6bce2d69ea612bb07c3cbdd\",\"apiKey\":\"ahzeqi8899IHUOMA123cnXiazz888999\",\"mchId\":\"1486187282\"}');

-- ----------------------------
-- Table structure for `fw_vip`
-- ----------------------------
DROP TABLE IF EXISTS `fw_vip`;
CREATE TABLE `fw_vip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '套餐名称',
  `is_recommed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否前台推荐',
  `is_show` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否前台显示',
  `livecode_count` int(11) NOT NULL DEFAULT '0' COMMENT '活码数量',
  `limit_count` int(11) NOT NULL DEFAULT '0' COMMENT '活码访问限制次数',
  `menu_auth` varchar(30) NOT NULL DEFAULT '' COMMENT '活码显示类型',
  `zone_size` int(11) NOT NULL DEFAULT '0' COMMENT '空间容量(M)',
  `count_track` tinyint(4) NOT NULL DEFAULT '0' COMMENT '统计追踪',
  `detail` text NOT NULL COMMENT '套餐明细',
  `sort` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_vip
-- ----------------------------
INSERT INTO `fw_vip` VALUES ('2', '基础版', '0', '1', '100', '5000', '', '500', '1', '[{\"desc\":\"\\u8df3\\u8f6c\\u98ce\\u9669\\u9875\",\"val\":\"\\u76f4\\u63a5\\u8df3\\u8f6c\"},{\"desc\":\"\\u5185\\u5bb9\\u7f16\\u8f91\",\"val\":\"\\u652f\\u6301\"},{\"desc\":\"\\u97f3\\u89c6\\u9891\",\"val\":\"\\u652f\\u6301\"},{\"desc\":\"\\u5fae\\u4fe1\\u7fa4\\u6d3b\\u7801\",\"val\":\"\\u4e0d\\u652f\\u6301\"},{\"desc\":\"\\u7f51\\u5740\\u8df3\\u8f6c\",\"val\":\"\\u5355\\u7f51\\u5740\\u8df3\\u8f6c\\/\\u591a\\u7f51\\u5740\\u8df3\\u8f6c\"},{\"desc\":\"\\u6d3b\\u7801\\u5ba1\\u6838\",\"val\":\"\\u9700\\u8981\\u5ba1\\u6838\"},{\"desc\":\"\\u57df\\u540d\\u7ba1\\u7406\",\"val\":\"\\u652f\\u6301\"},{\"desc\":\"\\u6d3b\\u7801\\u65e0\\u9700\\u5ba1\\u6838\",\"val\":\"\\u72ec\\u7acb\\u57df\\u540d\\u65e0\\u9700\\u5ba1\\u6838\"},{\"desc\":\"\\u72ec\\u7acb\\u4e3b\\u673a\",\"val\":\"\\u4e0d\\u652f\\u6301\"},{\"desc\":\"\\u5b9a\\u5236\\u670d\\u52a1\",\"val\":\"\\u4e0d\\u652f\\u6301\"}]', '2');
INSERT INTO `fw_vip` VALUES ('5', '定制版', '0', '1', '0', '0', '', '0', '1', '[{\"desc\":\"\\u8df3\\u8f6c\\u98ce\\u9669\\u9875\",\"val\":\"\\u76f4\\u63a5\\u8df3\\u8f6c\"},{\"desc\":\"\\u5185\\u5bb9\\u7f16\\u8f91\",\"val\":\"\\u652f\\u6301\"},{\"desc\":\"\\u97f3\\u89c6\\u9891\",\"val\":\"\\u652f\\u6301\"},{\"desc\":\"\\u5fae\\u4fe1\\u7fa4\\u6d3b\\u7801\",\"val\":\"\\u652f\\u6301\"},{\"desc\":\"\\u7f51\\u5740\\u8df3\\u8f6c\",\"val\":\"\\u5355\\u7f51\\u5740\\u8df3\\u8f6c\\/\\u591a\\u7f51\\u5740\\u8df3\\u8f6c\"},{\"desc\":\"\\u6d3b\\u7801\\u5ba1\\u6838\",\"val\":\"\\u65e0\\u9700\\u5ba1\\u6838\"},{\"desc\":\"\\u57df\\u540d\\u7ba1\\u7406\",\"val\":\"\\u652f\\u6301\"},{\"desc\":\"\\u6d3b\\u7801\\u65e0\\u9700\\u5ba1\\u6838\",\"val\":\"\\u72ec\\u7acb\\u57df\\u540d\\u65e0\\u9700\\u5ba1\\u6838\"},{\"desc\":\"\\u72ec\\u7acb\\u4e3b\\u673a\",\"val\":\"\\u652f\\u6301\"},{\"desc\":\"\\u5b9a\\u5236\\u670d\\u52a1\",\"val\":\"\\u652f\\u6301\"}]', '5');
INSERT INTO `fw_vip` VALUES ('3', '高级版', '1', '1', '0', '20000', '', '1024', '1', '[{\"desc\":\"\\u8df3\\u8f6c\\u98ce\\u9669\\u9875\",\"val\":\"\\u76f4\\u63a5\\u8df3\\u8f6c\"},{\"desc\":\"\\u5185\\u5bb9\\u7f16\\u8f91\",\"val\":\"\\u652f\\u6301\"},{\"desc\":\"\\u97f3\\u89c6\\u9891\",\"val\":\"\\u652f\\u6301\"},{\"desc\":\"\\u5fae\\u4fe1\\u7fa4\\u6d3b\\u7801\",\"val\":\"\\u4e0d\\u652f\\u6301\"},{\"desc\":\"\\u7f51\\u5740\\u8df3\\u8f6c\",\"val\":\"\\u5355\\u7f51\\u5740\\u8df3\\u8f6c\\/\\u591a\\u7f51\\u5740\\u8df3\\u8f6c\"},{\"desc\":\"\\u6d3b\\u7801\\u5ba1\\u6838\",\"val\":\"\\u65e0\\u9700\\u5ba1\\u6838\"},{\"desc\":\"\\u57df\\u540d\\u7ba1\\u7406\",\"val\":\"\\u652f\\u6301\"},{\"desc\":\"\\u6d3b\\u7801\\u65e0\\u9700\\u5ba1\\u6838\",\"val\":\"\\u72ec\\u7acb\\u57df\\u540d\\u65e0\\u9700\\u5ba1\\u6838\"},{\"desc\":\"\\u72ec\\u7acb\\u4e3b\\u673a\",\"val\":\"\\u4e0d\\u652f\\u6301\"},{\"desc\":\"\\u5b9a\\u5236\\u670d\\u52a1\",\"val\":\"\\u4e0d\\u652f\\u6301\"}]', '3');
INSERT INTO `fw_vip` VALUES ('4', '企业版', '0', '1', '0', '0', '', '0', '1', '[{\"desc\":\"\\u8df3\\u8f6c\\u98ce\\u9669\\u9875\",\"val\":\"\\u76f4\\u63a5\\u8df3\\u8f6c\"},{\"desc\":\"\\u5185\\u5bb9\\u7f16\\u8f91\",\"val\":\"\\u652f\\u6301\"},{\"desc\":\"\\u97f3\\u89c6\\u9891\",\"val\":\"\\u652f\\u6301\"},{\"desc\":\"\\u5fae\\u4fe1\\u7fa4\\u6d3b\\u7801\",\"val\":\"\\u4e0d\\u652f\\u6301\"},{\"desc\":\"\\u7f51\\u5740\\u8df3\\u8f6c\",\"val\":\"\\u5355\\u7f51\\u5740\\u8df3\\u8f6c\\/\\u591a\\u7f51\\u5740\\u8df3\\u8f6c\"},{\"desc\":\"\\u6d3b\\u7801\\u5ba1\\u6838\",\"val\":\"\\u65e0\\u9700\\u5ba1\\u6838\"},{\"desc\":\"\\u57df\\u540d\\u7ba1\\u7406\",\"val\":\"\\u652f\\u6301\"},{\"desc\":\"\\u6d3b\\u7801\\u65e0\\u9700\\u5ba1\\u6838\",\"val\":\"\\u72ec\\u7acb\\u57df\\u540d\\u65e0\\u9700\\u5ba1\\u6838\"},{\"desc\":\"\\u72ec\\u7acb\\u4e3b\\u673a\",\"val\":\"\\u4e0d\\u652f\\u6301\"},{\"desc\":\"\\u5b9a\\u5236\\u670d\\u52a1\",\"val\":\"\\u4e0d\\u652f\\u6301\"}]', '4');
INSERT INTO `fw_vip` VALUES ('1', '体验版', '0', '1', '1', '500', '', '50', '0', '[{\"desc\":\"\\u8df3\\u8f6c\\u98ce\\u9669\\u9875\",\"val\":\"\\u76f4\\u63a5\\u8df3\\u8f6c\"},{\"desc\":\"\\u5185\\u5bb9\\u7f16\\u8f91\",\"val\":\"\\u652f\\u6301\"},{\"desc\":\"\\u97f3\\u89c6\\u9891\",\"val\":\"\\u652f\\u6301\"},{\"desc\":\"\\u5fae\\u4fe1\\u7fa4\\u6d3b\\u7801\",\"val\":\"\\u4e0d\\u652f\\u6301\"},{\"desc\":\"\\u7f51\\u5740\\u8df3\\u8f6c\",\"val\":\"\\u5355\\u7f51\\u5740\\u8df3\\u8f6c\\/\\u591a\\u7f51\\u5740\\u8df3\\u8f6c\"},{\"desc\":\"\\u6d3b\\u7801\\u5ba1\\u6838\",\"val\":\"\\u9700\\u8981\\u5ba1\\u6838\"},{\"desc\":\"\\u57df\\u540d\\u7ba1\\u7406\",\"val\":\"\\u652f\\u6301\"},{\"desc\":\"\\u6d3b\\u7801\\u65e0\\u9700\\u5ba1\\u6838\",\"val\":\"\\u9700\\u8981\\u5ba1\\u6838\"},{\"desc\":\"\\u72ec\\u7acb\\u4e3b\\u673a\",\"val\":\"\\u4e0d\\u652f\\u6301\"},{\"desc\":\"\\u5b9a\\u5236\\u670d\\u52a1\",\"val\":\"\\u4e0d\\u652f\\u6301\"}]', '1');

-- ----------------------------
-- Table structure for `fw_vip_price`
-- ----------------------------
DROP TABLE IF EXISTS `fw_vip_price`;
CREATE TABLE `fw_vip_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vipId` tinyint(1) NOT NULL DEFAULT '1',
  `year` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员年限',
  `price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '会员价格',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_vip_price
-- ----------------------------
INSERT INTO `fw_vip_price` VALUES ('12', '4', '3', '1600.00');
INSERT INTO `fw_vip_price` VALUES ('13', '4', '5', '1400.00');
INSERT INTO `fw_vip_price` VALUES ('9', '3', '5', '700.00');
INSERT INTO `fw_vip_price` VALUES ('8', '3', '3', '800.00');
INSERT INTO `fw_vip_price` VALUES ('7', '3', '2', '900.00');
INSERT INTO `fw_vip_price` VALUES ('54', '2', '1', '500.00');
INSERT INTO `fw_vip_price` VALUES ('53', '2', '2', '450.00');
INSERT INTO `fw_vip_price` VALUES ('52', '2', '3', '400.00');
INSERT INTO `fw_vip_price` VALUES ('39', '5', '1', '8800.00');
INSERT INTO `fw_vip_price` VALUES ('51', '2', '5', '350.00');
INSERT INTO `fw_vip_price` VALUES ('6', '3', '1', '1000.00');
INSERT INTO `fw_vip_price` VALUES ('11', '4', '2', '1800.00');
INSERT INTO `fw_vip_price` VALUES ('10', '4', '1', '2000.00');
INSERT INTO `fw_vip_price` VALUES ('46', '1', '1', '100.00');
