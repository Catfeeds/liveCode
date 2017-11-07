/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : livecode

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-11-07 16:25:40
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
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='后台管理员与用户组对应关系表';

-- ----------------------------
-- Records of fw_admin_access
-- ----------------------------
INSERT INTO `fw_admin_access` VALUES ('1', '1', '1', '1438651748', '1509588361', '0', '1');
INSERT INTO `fw_admin_access` VALUES ('3', '2', '3', '1505118943', '1509588112', '0', '1');
INSERT INTO `fw_admin_access` VALUES ('14', '22', '8', '1509591147', '1509612956', '0', '1');
INSERT INTO `fw_admin_access` VALUES ('16', '23', '8', '1509592257', '1509852058', '0', '1');

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
INSERT INTO `fw_admin_banks` VALUES ('30', '建设银行', '我是开卡人', '发送即可雷锋精神的开发的支行', '4214 6457 4564 3241 242', '1', '1505962166');
INSERT INTO `fw_admin_banks` VALUES ('32', '招商银行', '随便来个', '发酵饲料开发金士顿六块腹肌案例的支行', '6624 3245 3253 4532 433', '1', '1505965401');
INSERT INTO `fw_admin_banks` VALUES ('29', '工商银行', 'newbie', '工商银行合肥分行肥西路支行肥西路支行', '2222 3333 4444 5555', '1', '1505960940');

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
INSERT INTO `fw_admin_config` VALUES ('2', '网站标题', 'WEB_SITE_TITLE', '网址跳转活码系统_网页跳转_链接跳转活码_爱活码活码管理系统_', '1', 'text', '', '网站标题前台显示标题', '1378898976', '1379235274', '2', '1');
INSERT INTO `fw_admin_config` VALUES ('3', '网站口号', 'WEB_SITE_SLOGAN', '爱活码 爱上活码', '1', 'text', '', '网站口号、宣传标语、一句话介绍', '1434081649', '1434081649', '3', '1');
INSERT INTO `fw_admin_config` VALUES ('5', '网站描述', 'WEB_SITE_DESCRIPTION', '爱活码二维码是一家提供免费的在线二维码生成服务，可以生成静态码、活码、微信二维码、淘宝二维码,网址跳转活码,微信群活码，比其他二维码服务商提供更优质的活码二维码服务', '1', 'textarea', '', '网站搜索引擎描述', '1378898976', '1379235841', '5', '1');
INSERT INTO `fw_admin_config` VALUES ('6', '网站关键字', 'WEB_SITE_KEYWORD', '网址跳转活码,网页跳转活码,链接跳转活码系统,活码管理系统,活码二维码,活码生成器,草料,码云,活码生成', '1', 'textarea', '', '网站搜索引擎关键字', '1378898976', '1381390100', '6', '1');
INSERT INTO `fw_admin_config` VALUES ('7', '版权信息', 'WEB_SITE_COPYRIGHT', 'Copyright © 爱活码 All rights reserved.', '1', 'text', '', '设置在网站底部显示的版权信息，如“版权所有 © 2014-2015 科斯克网络科技”', '1406991855', '1406992583', '7', '1');
INSERT INTO `fw_admin_config` VALUES ('8', '网站备案号', 'WEB_SITE_ICP', '皖ICP备17007700号-1', '1', 'text', '', '设置在网站底部显示的备案号，如“苏ICP备1502009-2号\"', '1378900335', '1415983236', '8', '1');
INSERT INTO `fw_admin_config` VALUES ('9', '站点统计', 'WEB_SITE_STATISTICS', '', '1', 'textarea', '', '支持百度、Google、cnzz等所有Javascript的统计代码', '1378900335', '1415983236', '9', '1');
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
INSERT INTO `fw_admin_config` VALUES ('36', '邮箱服务器帐号', 'EMAIL_ADDR', '447936059@qq.com', '5', 'text', '', '用于发送注册/忘记密码邮件验证', '1508375570', '1508375570', '12', '1');
INSERT INTO `fw_admin_config` VALUES ('37', '邮箱服务器密码', 'EMAIL_PASS', 'nclesdomslbrbgce', '5', 'text', '', '', '1508375691', '1508375691', '13', '1');
INSERT INTO `fw_admin_config` VALUES ('34', '邮箱服务器', 'EMAIL_HOST', 'smtp.qq.com', '5', 'text', '', '', '1508375330', '1508375330', '10', '1');
INSERT INTO `fw_admin_config` VALUES ('38', '通用活码域名', 'DOMAIN_URL', 'www.livecode.com', '5', 'text', '', '用户未自定义域名的活码将解析到这个地址', '1508375938', '1508375938', '1', '1');
INSERT INTO `fw_admin_config` VALUES ('43', '首页联系电话', 'KEFU_TEL', '111', '5', 'text', '', '', '1509530579', '1509530579', '16', '1');
INSERT INTO `fw_admin_config` VALUES ('39', '找回密码邮件', 'UPDATEPASS_CONTENT', '亲,您正在进行爱活码密码找回操作，验证码为【{#验证码#}】。如非本人操作,可不用理会!', '5', 'textarea', '', '', '1509088008', '1509088128', '15', '1');
INSERT INTO `fw_admin_config` VALUES ('40', '注册邮件', 'REGIST_CONTENT', '亲,您正在进行爱活码注册操作，验证码为【{#验证码#}】。如非本人操作,可不用理会!', '5', 'textarea', '', '', '1509088188', '1509088188', '14', '1');
INSERT INTO `fw_admin_config` VALUES ('41', '用户端域名', 'USER_DOMAIN', 'www.livecode.com', '5', 'text', '', '', '1509342287', '1509342287', '2', '1');
INSERT INTO `fw_admin_config` VALUES ('42', '管理员后台域名', 'ADMIN_DOMAIN', '2.livecode.com', '5', 'text', '', '', '1509342361', '1509342361', '3', '1');
INSERT INTO `fw_admin_config` VALUES ('44', '首页联系邮箱', 'KEFU_EMAIL', '222', '5', 'text', '', '', '1509530656', '1509530656', '17', '1');
INSERT INTO `fw_admin_config` VALUES ('45', '首页联系QQ', 'KEFU_QQ', '1072357480', '5', 'text', '', '', '1509530704', '1509530704', '18', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='部门信息表';

-- ----------------------------
-- Records of fw_admin_group
-- ----------------------------
INSERT INTO `fw_admin_group` VALUES ('1', '0', '超级管理员', '', '', '1426881003', '1427552428', '0', '1');
INSERT INTO `fw_admin_group` VALUES ('3', '0', '会员管理', '', '[[\"14\",\"62\",\"63\",\"66\",\"115\",\"161\",\"162\"]]', '1496210172', '1509613537', '1', '1');
INSERT INTO `fw_admin_group` VALUES ('7', '0', '支付管理', '', '[[\"50\",\"51\",\"52\",\"53\",\"64\",\"65\",\"167\",\"54\",\"55\",\"56\",\"168\"]]', '1509588024', '1509613578', '4', '1');
INSERT INTO `fw_admin_group` VALUES ('8', '0', '随便来个', '', '[[\"1\",\"6\",\"14\",\"62\",\"63\",\"66\",\"115\",\"161\",\"162\",\"152\",\"160\",\"163\",\"153\",\"158\",\"159\",\"165\",\"154\",\"156\",\"157\",\"166\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"64\",\"65\",\"167\",\"54\",\"55\",\"56\",\"168\",\"5\",\"13\"]]', '1509612562', '1509614205', '0', '1');
INSERT INTO `fw_admin_group` VALUES ('5', '0', '活码管理', '', '[[\"152\",\"160\",\"163\"]]', '1496210230', '1509613551', '2', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=195 DEFAULT CHARSET=utf8 COMMENT='菜单表';

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
INSERT INTO `fw_admin_menu` VALUES ('128', '7', '0', '新建目录', '2', 'Admin/Phone/addmenu', '', '0', '1509075802', '-1');
INSERT INTO `fw_admin_menu` VALUES ('137', '8', '0', '新建目录', '2', 'Admin/Duourl/addmenu', '', '0', '1509082543', '-1');
INSERT INTO `fw_admin_menu` VALUES ('193', '190', '25', '查看数据统计', '2', 'Admin/Livecode/view/type/1510042346', '', '0', '1510042346', '-1');
INSERT INTO `fw_admin_menu` VALUES ('192', '190', '25', '下载二维码', '2', 'Admin/Livecode/xzewm/type/1510042346', '', '0', '1510042346', '-1');
INSERT INTO `fw_admin_menu` VALUES ('191', '190', '25', '新增活码', '2', 'Admin/Livecode/add/type/1510042346', '', '0', '1510042346', '-1');
INSERT INTO `fw_admin_menu` VALUES ('190', '11', '25', '子目录一号', '2', 'Admin/Livecode/child/type/1510042346', '', '0', '1510042346', '1');
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
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='文件上传表';

-- ----------------------------
-- Records of fw_admin_upload
-- ----------------------------
INSERT INTO `fw_admin_upload` VALUES ('25', '1', '新建文本文档.txt', '/Uploads/2017-09/59b628a9337bd.txt', '', 'txt', '62', 'c051ec633060723e7936a0d1f7c706d2', '4a5ee8d84e0f3ad4824bef2521a1b76caa76b4ed', 'Local', '0', '1505110185', '1505110185', '0', '1');
INSERT INTO `fw_admin_upload` VALUES ('26', '3', '1.txt', '/Uploads/2017-09/59b8fedbc3c97.txt', '', 'txt', '16', '49cded5debcf38a6eafc45cec49666cd', 'ec73df76fa785ab5171a473b774a1f4ec91b4760', 'Local', '0', '1505296091', '1505296091', '0', '0');
INSERT INTO `fw_admin_upload` VALUES ('27', '1', '1658.jpg', '/Uploads/2017-09/59c3655c70e7b.jpg', '', 'jpg', '246603', '603a6c4ab966bd05cd445a9b88fb295c', '660dceb308932097043ce61c79b8e3cb057df957', 'Local', '0', '1505977692', '1505977692', '0', '1');
INSERT INTO `fw_admin_upload` VALUES ('28', '1', '7bf22f4a3e712fe1b8be86dfd3cc5073.jpg', '/Uploads/2017-09/59c4865c6a21a.jpg', '', 'jpg', '26508', 'a2cd60a1fdaee22aa52c651263067215', 'e34ba84da1eb56cb65af845119eb2ceaa0f0d464', 'Local', '0', '1506051676', '1506051676', '0', '1');
INSERT INTO `fw_admin_upload` VALUES ('29', '1', 'timg.jpeg', '/Uploads/2017-09/59c4867a40d2d.jpeg', '', 'jpeg', '9238', 'e403418b494a9e1c0adfb675b7a57eca', 'fc65269d5bad9233b2e25999e396f9d2f861a571', 'Local', '0', '1506051706', '1506051706', '0', '1');
INSERT INTO `fw_admin_upload` VALUES ('30', '1', 'alipay.jpg', '/Uploads/2017-09/59c85e8a0ec06.jpg', '', 'jpg', '4789', '3d8f3e4f9904b3b0b93c7cede3fddf00', '632c5c744aa227b2a6b24338619600f17d10b76e', 'Local', '0', '1506303626', '1506303626', '0', '1');
INSERT INTO `fw_admin_upload` VALUES ('31', '3', '1.txt', '/Uploads/2017-09/59c87ae41e7c5.txt', '', 'txt', '24', '3622f7d80fefe78b38dd8cab31244fa4', '48b30a53a646cc3130d31045b619887cd47a81b8', 'Local', '0', '1506310884', '1506310884', '0', '1');
INSERT INTO `fw_admin_upload` VALUES ('32', '3', '2634.jpg', '/Uploads/2017-09/59cca7adcc047.jpg', '', 'jpg', '449983', '90b1f3f1e46c2631765e4406dff595f5', '9f44072323ec315bbf00a5b9a1f4203487f4bc28', 'Local', '0', '1506584493', '1506584493', '0', '1');
INSERT INTO `fw_admin_upload` VALUES ('33', '3', '3324.jpg', '/Uploads/2017-09/59ccc520dcf6c.jpg', '', 'jpg', '374895', 'ac3154509babb8e42d80a4395b898102', '06325fa6615768ed7befaea4fd4c7faba4798fe0', 'Local', '0', '1506592032', '1506592032', '0', '1');
INSERT INTO `fw_admin_upload` VALUES ('34', '3', '3418.jpg', '/Uploads/2017-09/59ccc56375132.jpg', '', 'jpg', '503252', '218e90787d3f6a1668df11d1a7b13c96', '0540cecc8ae979477738606ede73e262f28ebf7e', 'Local', '0', '1506592099', '1506592099', '0', '1');
INSERT INTO `fw_admin_upload` VALUES ('35', '3', '2937.jpg', '/Uploads/2017-09/59ccc9fd116ab.jpg', '', 'jpg', '508934', '2660fb562f0d4bf2b9aa7a6a26d35e5a', '1263a4272556d8e5edb0fdc8fc9f0f3441b93ee0', 'Local', '0', '1506593277', '1506593277', '0', '1');
INSERT INTO `fw_admin_upload` VALUES ('36', '3', 'ThinkPHP 5 简明开发手册.pdf', '/Uploads/2017-10/59dc34405a0dc.pdf', '', 'pdf', '1491237', 'e861d994002db60f3f8f47325a5cd1bc', '6184175b7eea8e7e8d62baa8b6e2be7c6f82ea4b', 'Local', '0', '1507603520', '1507603520', '0', '1');
INSERT INTO `fw_admin_upload` VALUES ('37', '3', '3325.jpg', '/Uploads/2017-10/59e5752398f6f.jpg', '', 'jpg', '276727', 'c3c6f4492818454d82c3adcae35d6d44', 'e471481e86da516f205a03431c504b51cfe502d4', 'Local', '0', '1508209955', '1508209955', '0', '1');
INSERT INTO `fw_admin_upload` VALUES ('38', '3', 'music.mp4', '/Uploads/2017-10/59e5b42b945b3.mp4', '', 'mp4', '3501177', 'cb10840a60d8e5d961d1319480e88da3', '185e757c7633fd666ee059c206a3058a7717b439', 'Local', '0', '1508226091', '1508226091', '0', '1');
INSERT INTO `fw_admin_upload` VALUES ('39', '3', '活码系统功能描述文档.xlsx', '/Uploads/2017-10/59e5c35ae80f0.xlsx', '', 'xlsx', '13198', 'c2e2908016e1665c7d177ec22e36d54b', '9c75574a93a0fc0f86c4340f8413aac05b2083ae', 'Local', '0', '1508229978', '1508229978', '0', '1');
INSERT INTO `fw_admin_upload` VALUES ('40', '3', '活码系统.docx', '/Uploads/2017-10/59e5c43e56b24.docx', '', 'docx', '1108639', 'f2323d677bd3b52eb0a15265f5b18aa3', '39453d843634dda6c531b6d71cdad56512c34256', 'Local', '0', '1508230206', '1508230206', '0', '1');
INSERT INTO `fw_admin_upload` VALUES ('41', '3', '问题汇总 - 副本.docx', '/Uploads/2017-11/59fe6ed0386d2.docx', '', 'docx', '298018', '89e65fdd4278039bbd268aba81a01849', '52158e1783daa40bcc144105a3992bab3ae9ca34', 'Local', '0', '1509846736', '1509846736', '0', '1');
INSERT INTO `fw_admin_upload` VALUES ('42', '3', 'wangzhi.txt', '/Uploads/2017-11/59fe77cbb45de.txt', '', 'txt', '43', '0700e3da805c24c3b9498f25ff559bb8', 'a3a67685a5f871bc25687dde11eddec3fb7ccca4', 'Local', '0', '1509849035', '1509849035', '0', '1');
INSERT INTO `fw_admin_upload` VALUES ('43', '3', 'wangzhi.txt', '/Uploads/2017-11/59fe7b50e9088.txt', '', 'txt', '41', 'fb970449f2b05aa1a0d7da2823278ad9', '30c68ea29259e544efb0f205c4c163f2bb4693f2', 'Local', '0', '1509849936', '1509849936', '0', '1');

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
  `url` varchar(255) NOT NULL,
  `url_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0域名待审核，1审核通过',
  `visitCount` int(11) NOT NULL DEFAULT '0' COMMENT '活码已访问次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='用户账号表';

-- ----------------------------
-- Records of fw_admin_user
-- ----------------------------
INSERT INTO `fw_admin_user` VALUES ('1', '1', 'admin', 'b7aebc807e9844d9148e5cb32c6ff885', '', '', '0', '', '1438651748', '1501578198', '1', '0', '0', '1', '', '0', '0');
INSERT INTO `fw_admin_user` VALUES ('2', '1', 'admin2', 'b7aebc807e9844d9148e5cb32c6ff885', '', '', '0', 'admin', '1496210259', '1505898727', '1', '0', '0', '1', '', '0', '0');
INSERT INTO `fw_admin_user` VALUES ('25', '2', '哈哈哈', 'b7aebc807e9844d9148e5cb32c6ff885', 'newbie91521@163.com', '18121029523', '2130706433', 'admin', '1510042231', '1510042231', '1', '26', '1541578253', '1', '', '0', '0');
INSERT INTO `fw_admin_user` VALUES ('13', '2', '随便来个', 'b7aebc807e9844d9148e5cb32c6ff885', '发的发的发', 'fasdfsdf', '0', '', '0', '1505812506', '1', '0', '0', '1', '', '0', '0');
INSERT INTO `fw_admin_user` VALUES ('14', '2', '哈哈哈小号', 'b7aebc807e9844d9148e5cb32c6ff885', '111@qq.com', '13333333333', '0', '', '1505548436', '0', '1', '0', '0', '-1', 'www.livecode21.com', '-1', '0');
INSERT INTO `fw_admin_user` VALUES ('24', '2', '15555555555', 'b7aebc807e9844d9148e5cb32c6ff885', '15555555555@qq.com', '15555555555', '2130706433', 'admin', '1510023288', '1510023288', '1', '0', '0', '1', '', '0', '0');
INSERT INTO `fw_admin_user` VALUES ('17', '2', 'admin111', '309f9d036cf5de9f735225753d64c06d', '', '', '2130706433', 'admin', '1508899697', '1508899697', '1', '0', '0', '1', '', '1', '0');
INSERT INTO `fw_admin_user` VALUES ('18', '2', '嘿嘿嘿', 'b7aebc807e9844d9148e5cb32c6ff885', '', '11111111111', '2130706433', 'admin', '1508899926', '1509344998', '0', '0', '0', '1', '', '0', '0');
INSERT INTO `fw_admin_user` VALUES ('19', '2', '新增用户', 'b7aebc807e9844d9148e5cb32c6ff885', '222@1631.com', '18121029511', '2130706433', 'admin', '1509348543', '1509348823', '1', '0', '0', '1', '', '0', '0');
INSERT INTO `fw_admin_user` VALUES ('21', '2', '看一看', 'b7aebc807e9844d9148e5cb32c6ff885', '111@163.com', '18888888888', '2130706433', 'admin', '1509587181', '1509593285', '1', '0', '0', '1', '', '0', '0');
INSERT INTO `fw_admin_user` VALUES ('22', '1', 'newAdmin', 'b7aebc807e9844d9148e5cb32c6ff885', '13311112222@qq.com', '13311112222', '2130706433', 'admin', '1509588748', '1509588748', '1', '0', '0', '1', '', '0', '0');
INSERT INTO `fw_admin_user` VALUES ('23', '1', 'newAdmin2', 'bf24dcaa99b03559a8a148b8018a3f0b', '13311113333@qq.com', '13311113333', '2130706433', 'admin', '1509592241', '1509592241', '1', '0', '0', '1', '', '0', '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fw_cms_duourl
-- ----------------------------

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
  `count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '扫描次数',
  `huoma` varchar(255) DEFAULT NULL,
  `d` varchar(255) DEFAULT NULL,
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_cms_livecode
-- ----------------------------

-- ----------------------------
-- Table structure for `fw_cms_phone`
-- ----------------------------
DROP TABLE IF EXISTS `fw_cms_phone`;
CREATE TABLE `fw_cms_phone` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '1网址2视频',
  `menuId` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `title` varchar(500) NOT NULL COMMENT '题标',
  `videourl` varchar(255) DEFAULT NULL COMMENT '视频地址',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `huoma` varchar(255) DEFAULT NULL,
  `d` varchar(255) DEFAULT NULL,
  `tztype` tinyint(1) DEFAULT '1',
  `count` int(11) DEFAULT '0' COMMENT '播放次数',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`) USING BTREE,
  KEY `title` (`title`(333))
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fw_cms_phone
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_cms_product
-- ----------------------------

-- ----------------------------
-- Table structure for `fw_echarts_data`
-- ----------------------------
DROP TABLE IF EXISTS `fw_echarts_data`;
CREATE TABLE `fw_echarts_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codeId` int(11) NOT NULL COMMENT '活码id',
  `createTime` datetime NOT NULL COMMENT '扫码日期',
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '1活码生成2产品3视频4网址5多网址',
  PRIMARY KEY (`id`),
  KEY `codeId` (`codeId`)
) ENGINE=MyISAM AUTO_INCREMENT=627 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_echarts_data
-- ----------------------------
INSERT INTO `fw_echarts_data` VALUES ('36', '11', '2017-09-28 09:29:45', '4');
INSERT INTO `fw_echarts_data` VALUES ('30', '11', '2017-09-26 00:00:00', '4');
INSERT INTO `fw_echarts_data` VALUES ('31', '8', '2017-09-26 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('32', '11', '2017-09-26 00:00:00', '4');
INSERT INTO `fw_echarts_data` VALUES ('33', '10', '2017-09-26 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('34', '10', '2017-09-26 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('35', '10', '2017-09-26 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('37', '11', '2017-08-02 00:00:00', '4');
INSERT INTO `fw_echarts_data` VALUES ('38', '11', '2017-09-02 00:00:00', '4');
INSERT INTO `fw_echarts_data` VALUES ('39', '11', '2017-09-14 00:00:00', '4');
INSERT INTO `fw_echarts_data` VALUES ('40', '11', '2017-09-28 00:00:00', '4');
INSERT INTO `fw_echarts_data` VALUES ('41', '11', '2017-09-28 00:00:00', '4');
INSERT INTO `fw_echarts_data` VALUES ('42', '11', '2017-09-28 00:00:00', '4');
INSERT INTO `fw_echarts_data` VALUES ('43', '12', '2017-09-28 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('44', '8', '2017-09-28 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('45', '10', '2017-09-28 00:00:00', '5');
INSERT INTO `fw_echarts_data` VALUES ('46', '10', '2017-09-28 00:00:00', '5');
INSERT INTO `fw_echarts_data` VALUES ('47', '11', '2017-09-28 00:00:00', '5');
INSERT INTO `fw_echarts_data` VALUES ('48', '4', '2017-09-28 00:00:00', '4');
INSERT INTO `fw_echarts_data` VALUES ('49', '5', '2017-09-28 00:00:00', '4');
INSERT INTO `fw_echarts_data` VALUES ('50', '5', '2017-09-28 00:00:00', '4');
INSERT INTO `fw_echarts_data` VALUES ('51', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('52', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('53', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('54', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('55', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('56', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('57', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('58', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('59', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('60', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('61', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('62', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('63', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('64', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('65', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('66', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('67', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('68', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('69', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('70', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('71', '44', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('72', '44', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('73', '44', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('74', '44', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('75', '44', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('76', '44', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('77', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('78', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('79', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('80', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('81', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('82', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('83', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('84', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('85', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('86', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('87', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('88', '43', '2017-09-30 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('89', '46', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('90', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('91', '43', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('92', '43', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('93', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('94', '43', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('95', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('96', '43', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('97', '43', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('98', '43', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('99', '43', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('100', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('101', '43', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('102', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('103', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('104', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('105', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('106', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('107', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('108', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('109', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('110', '43', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('111', '43', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('112', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('113', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('114', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('115', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('116', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('117', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('118', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('119', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('120', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('121', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('122', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('123', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('124', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('125', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('126', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('127', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('128', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('129', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('130', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('131', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('132', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('133', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('134', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('135', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('136', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('137', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('138', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('139', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('140', '45', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('141', '48', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('142', '48', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('143', '48', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('144', '48', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('145', '48', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('146', '48', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('147', '48', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('148', '48', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('149', '48', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('150', '48', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('151', '48', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('152', '48', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('153', '48', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('154', '48', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('155', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('156', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('157', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('158', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('159', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('160', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('161', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('162', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('163', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('164', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('165', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('166', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('167', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('168', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('169', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('170', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('171', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('172', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('173', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('174', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('175', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('176', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('177', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('178', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('179', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('180', '43', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('181', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('182', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('183', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('184', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('185', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('186', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('187', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('188', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('189', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('190', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('191', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('192', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('193', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('194', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('195', '50', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('196', '50', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('197', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('198', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('199', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('200', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('201', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('202', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('203', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('204', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('205', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('206', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('207', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('208', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('209', '49', '2017-10-10 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('210', '44', '2017-10-17 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('211', '43', '2017-10-17 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('212', '49', '2017-10-17 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('213', '49', '2017-10-17 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('214', '73', '2017-10-18 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('215', '73', '2017-10-18 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('216', '73', '2017-10-18 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('217', '73', '2017-10-18 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('218', '73', '2017-10-18 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('219', '73', '2017-10-18 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('220', '73', '2017-10-18 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('221', '73', '2017-10-18 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('222', '69', '2017-10-18 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('223', '49', '2017-10-18 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('224', '49', '2017-10-18 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('225', '49', '2017-10-18 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('226', '49', '2017-10-18 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('227', '49', '2017-10-18 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('228', '49', '2017-10-18 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('229', '49', '2017-10-18 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('230', '49', '2017-10-18 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('231', '29', '2017-10-19 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('232', '31', '2017-10-19 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('233', '31', '2017-10-19 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('234', '89', '2017-10-20 00:00:00', '2');
INSERT INTO `fw_echarts_data` VALUES ('235', '87', '2017-10-20 00:00:00', '2');
INSERT INTO `fw_echarts_data` VALUES ('236', '87', '2017-10-20 00:00:00', '2');
INSERT INTO `fw_echarts_data` VALUES ('237', '8', '2017-10-20 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('238', '8', '2017-10-20 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('239', '8', '2017-10-20 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('240', '8', '2017-10-20 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('241', '8', '2017-10-20 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('242', '87', '2017-10-20 00:00:00', '2');
INSERT INTO `fw_echarts_data` VALUES ('243', '8', '2017-10-20 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('244', '8', '2017-10-20 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('245', '8', '2017-10-20 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('246', '8', '2017-10-20 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('247', '8', '2017-10-20 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('248', '38', '2017-10-20 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('249', '38', '2017-10-20 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('250', '38', '2017-10-20 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('251', '38', '2017-10-20 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('252', '38', '2017-10-20 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('253', '38', '2017-10-20 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('254', '38', '2017-10-20 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('255', '38', '2017-10-20 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('256', '40', '2017-10-20 00:00:00', '4');
INSERT INTO `fw_echarts_data` VALUES ('257', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('258', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('259', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('260', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('261', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('262', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('263', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('264', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('265', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('266', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('267', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('268', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('269', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('270', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('271', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('272', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('273', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('274', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('275', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('276', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('277', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('278', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('279', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('280', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('281', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('282', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('283', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('284', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('285', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('286', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('287', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('288', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('289', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('290', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('291', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('292', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('293', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('294', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('295', '109', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('296', '110', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('297', '111', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('298', '111', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('299', '111', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('300', '111', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('301', '111', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('302', '111', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('303', '112', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('304', '113', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('305', '113', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('306', '113', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('307', '110', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('308', '113', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('309', '114', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('310', '114', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('311', '114', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('312', '114', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('313', '114', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('314', '114', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('315', '114', '2017-10-25 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('316', '114', '2017-10-26 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('317', '114', '2017-10-26 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('318', '114', '2017-10-26 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('319', '114', '2017-10-26 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('320', '114', '2017-10-26 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('321', '114', '2017-10-26 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('322', '114', '2017-10-26 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('323', '93', '2017-10-26 00:00:00', '2');
INSERT INTO `fw_echarts_data` VALUES ('324', '93', '2017-10-26 00:00:00', '2');
INSERT INTO `fw_echarts_data` VALUES ('325', '93', '2017-10-26 00:00:00', '2');
INSERT INTO `fw_echarts_data` VALUES ('326', '93', '2017-10-26 00:00:00', '2');
INSERT INTO `fw_echarts_data` VALUES ('327', '126', '2017-10-26 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('328', '126', '2017-10-26 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('329', '133', '2017-10-26 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('330', '133', '2017-10-26 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('331', '133', '2017-10-26 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('332', '133', '2017-11-01 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('333', '133', '2017-11-01 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('334', '133', '2017-11-01 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('335', '133', '2017-11-01 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('336', '133', '2017-11-01 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('337', '133', '2017-11-01 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('338', '133', '2017-11-01 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('339', '133', '2017-11-01 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('340', '133', '2017-11-01 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('341', '133', '2017-11-01 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('342', '99', '2017-11-01 00:00:00', '2');
INSERT INTO `fw_echarts_data` VALUES ('343', '99', '2017-11-01 00:00:00', '2');
INSERT INTO `fw_echarts_data` VALUES ('344', '99', '2017-11-01 00:00:00', '2');
INSERT INTO `fw_echarts_data` VALUES ('345', '99', '2017-11-01 00:00:00', '2');
INSERT INTO `fw_echarts_data` VALUES ('346', '99', '2017-11-01 00:00:00', '2');
INSERT INTO `fw_echarts_data` VALUES ('347', '99', '2017-11-01 00:00:00', '2');
INSERT INTO `fw_echarts_data` VALUES ('348', '99', '2017-11-01 00:00:00', '2');
INSERT INTO `fw_echarts_data` VALUES ('349', '99', '2017-11-01 00:00:00', '2');
INSERT INTO `fw_echarts_data` VALUES ('350', '99', '2017-11-01 00:00:00', '2');
INSERT INTO `fw_echarts_data` VALUES ('351', '59', '2017-11-01 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('352', '59', '2017-11-01 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('353', '59', '2017-11-01 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('354', '59', '2017-11-01 00:00:00', '3');
INSERT INTO `fw_echarts_data` VALUES ('355', '10', '2017-11-01 00:00:00', '5');
INSERT INTO `fw_echarts_data` VALUES ('356', '10', '2017-11-01 00:00:00', '5');
INSERT INTO `fw_echarts_data` VALUES ('357', '10', '2017-11-01 00:00:00', '5');
INSERT INTO `fw_echarts_data` VALUES ('358', '10', '2017-11-01 00:00:00', '5');
INSERT INTO `fw_echarts_data` VALUES ('359', '10', '2017-11-01 00:00:00', '5');
INSERT INTO `fw_echarts_data` VALUES ('360', '10', '2017-11-01 00:00:00', '5');
INSERT INTO `fw_echarts_data` VALUES ('361', '10', '2017-11-01 00:00:00', '5');
INSERT INTO `fw_echarts_data` VALUES ('362', '10', '2017-11-01 00:00:00', '5');
INSERT INTO `fw_echarts_data` VALUES ('363', '10', '2017-11-01 00:00:00', '5');
INSERT INTO `fw_echarts_data` VALUES ('364', '10', '2017-11-01 00:00:00', '5');
INSERT INTO `fw_echarts_data` VALUES ('365', '10', '2017-11-01 00:00:00', '5');
INSERT INTO `fw_echarts_data` VALUES ('366', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('367', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('368', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('369', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('370', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('371', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('372', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('373', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('374', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('375', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('376', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('377', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('378', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('379', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('380', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('381', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('382', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('383', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('384', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('385', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('386', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('387', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('388', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('389', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('390', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('391', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('392', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('393', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('394', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('395', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('396', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('397', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('398', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('399', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('400', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('401', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('402', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('403', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('404', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('405', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('406', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('407', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('408', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('409', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('410', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('411', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('412', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('413', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('414', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('415', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('416', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('417', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('418', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('419', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('420', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('421', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('422', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('423', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('424', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('425', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('426', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('427', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('428', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('429', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('430', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('431', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('432', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('433', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('434', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('435', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('436', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('437', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('438', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('439', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('440', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('441', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('442', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('443', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('444', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('445', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('446', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('447', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('448', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('449', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('450', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('451', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('452', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('453', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('454', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('455', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('456', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('457', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('458', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('459', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('460', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('461', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('462', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('463', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('464', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('465', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('466', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('467', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('468', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('469', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('470', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('471', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('472', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('473', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('474', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('475', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('476', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('477', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('478', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('479', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('480', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('481', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('482', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('483', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('484', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('485', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('486', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('487', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('488', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('489', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('490', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('491', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('492', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('493', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('494', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('495', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('496', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('497', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('498', '133', '2017-11-02 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('499', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('500', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('501', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('502', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('503', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('504', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('505', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('506', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('507', '128', '2017-10-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('508', '128', '2017-10-20 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('509', '128', '2017-10-14 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('510', '128', '2017-10-14 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('511', '128', '2017-10-14 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('512', '128', '2017-10-14 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('513', '128', '2017-10-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('514', '128', '2017-10-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('515', '128', '2017-11-09 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('516', '128', '2017-11-09 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('517', '128', '2017-11-09 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('518', '128', '2017-11-09 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('519', '128', '2017-11-09 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('520', '128', '2017-11-09 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('521', '128', '2017-10-08 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('522', '128', '2017-10-08 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('523', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('524', '128', '2017-10-08 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('525', '128', '2017-10-08 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('526', '128', '2017-10-08 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('527', '128', '2017-10-08 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('528', '128', '2017-10-08 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('529', '128', '2017-10-08 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('530', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('531', '128', '2017-10-05 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('532', '128', '2017-10-05 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('533', '128', '2017-10-05 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('534', '128', '2017-11-01 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('535', '128', '2017-11-01 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('536', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('537', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('538', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('539', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('540', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('541', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('542', '128', '2017-11-14 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('543', '128', '2017-11-14 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('544', '128', '2017-11-14 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('545', '128', '2017-11-14 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('546', '128', '2017-11-14 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('547', '128', '2017-11-14 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('548', '128', '2017-11-14 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('549', '128', '2017-11-14 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('550', '128', '2017-11-14 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('551', '128', '2017-11-14 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('552', '128', '2017-11-14 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('553', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('554', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('555', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('556', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('557', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('558', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('559', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('560', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('561', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('562', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('563', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('564', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('565', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('566', '128', '2017-10-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('567', '128', '2017-10-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('568', '128', '2017-10-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('569', '128', '2017-10-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('570', '128', '2017-10-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('571', '128', '2017-10-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('572', '128', '2017-10-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('573', '128', '2017-10-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('574', '128', '2017-10-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('575', '128', '2017-10-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('576', '128', '2017-10-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('577', '128', '2017-10-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('578', '128', '2017-10-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('579', '128', '2017-10-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('580', '128', '2017-10-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('581', '128', '2017-10-20 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('582', '128', '2017-10-20 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('583', '128', '2017-10-20 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('584', '128', '2017-10-20 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('585', '128', '2017-10-20 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('586', '128', '2017-10-20 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('587', '128', '2017-10-20 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('588', '128', '2017-10-20 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('589', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('590', '128', '2017-10-20 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('591', '128', '2017-10-20 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('592', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('593', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('594', '128', '2017-11-24 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('595', '128', '2017-11-24 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('596', '128', '2017-11-24 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('597', '128', '2017-10-20 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('598', '128', '2017-10-20 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('599', '128', '2017-10-20 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('600', '128', '2017-10-20 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('601', '128', '2017-10-20 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('602', '128', '2017-10-20 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('603', '128', '2017-10-20 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('604', '128', '2017-10-20 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('605', '128', '2017-10-20 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('606', '128', '2017-10-20 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('607', '128', '2017-10-20 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('608', '128', '2017-10-20 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('609', '128', '2017-10-20 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('610', '128', '2017-10-20 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('611', '128', '2017-10-20 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('612', '128', '2017-10-20 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('613', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('614', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('615', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('616', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('617', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('618', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('619', '128', '2017-11-04 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('620', '157', '2017-11-05 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('621', '157', '2017-11-05 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('622', '161', '2017-11-06 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('623', '161', '2017-11-06 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('624', '161', '2017-11-06 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('625', '161', '2017-11-06 00:00:00', '1');
INSERT INTO `fw_echarts_data` VALUES ('626', '161', '2017-11-06 00:00:00', '1');

-- ----------------------------
-- Table structure for `fw_orders`
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
  `tradeNo` varchar(30) DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `pay_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`orderId`),
  KEY `userId` (`userId`),
  KEY `orderStatus` (`orderStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_orders
-- ----------------------------
INSERT INTO `fw_orders` VALUES ('106', '2017110715100422539639', '25', '1', '26', '1', '1', '2', '0.10', null, '1510042253', '1510042253', '1');

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
INSERT INTO `fw_payments` VALUES ('6', 'weixinpays', '微信支付', '{\"appId\":\"wx59e13a933586d7cd\",\"appsecret\":\"f5cb09d5d4815fee751c43bbbe2897b3\",\"apiKey\":\"xiapeidong700316uwuyuchuan710315\",\"mchId\":\"1483012562\"}');

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
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_vip
-- ----------------------------
INSERT INTO `fw_vip` VALUES ('26', '基础版', '0', '1', '3', '30000', '', '1024', '0', '[{\"desc\":\"\\u5185\\u5bb9\\u7f16\\u8f91\",\"val\":\"\\u65e0\\u9650\\u5236\\u4fee\\u6539\"},{\"desc\":\"\\u98ce\\u9669\\u9884\\u8b66\",\"val\":\"\\u65e0\\u98ce\\u9669\\u9875\\u76f4\\u63a5\\u8df3\\u8f6c\"},{\"desc\":\"\\u72ec\\u7acb\\u4e3b\\u673a\",\"val\":\"\\u4e0d\\u652f\\u6301\"},{\"desc\":\"\\u6279\\u91cf\\u4fee\\u6539\\u7f51\\u5740\",\"val\":\"\\u4e0d\\u652f\\u6301\"},{\"desc\":\"\\u7279\\u6b8a\\u7c7b\\u578b\\u5b9a\\u5236\",\"val\":\"\\u4e0d\\u652f\\u6301\"}]', '2');
INSERT INTO `fw_vip` VALUES ('25', '牛逼版', '0', '1', '10000', '5000000', '', '1024', '1', '[{\"desc\":\"\\u5185\\u5bb9\\u7f16\\u8f91\",\"val\":\"\\u65e0\\u9650\\u5236\\u4fee\\u6539\"},{\"desc\":\"\\u98ce\\u9669\\u9884\\u8b66\",\"val\":\"\\u65e0\\u98ce\\u9669\\u9875\\u76f4\\u63a5\\u8df3\\u8f6c\"},{\"desc\":\"\\u72ec\\u7acb\\u4e3b\\u673a\",\"val\":\"\\u652f\\u6301\"},{\"desc\":\"\\u6279\\u91cf\\u4fee\\u6539\\u7f51\\u5740\",\"val\":\"\\u652f\\u6301\"},{\"desc\":\"\\u7279\\u6b8a\\u7c7b\\u578b\\u5b9a\\u5236\",\"val\":\"\\u652f\\u6301\"}]', '5');
INSERT INTO `fw_vip` VALUES ('28', '高级版', '0', '1', '8000', '200000', '', '9999', '1', '[{\"desc\":\"\\u5185\\u5bb9\\u7f16\\u8f91\",\"val\":\"\\u65e0\\u9650\\u5236\\u4fee\\u6539\"},{\"desc\":\"\\u98ce\\u9669\\u9884\\u8b66\",\"val\":\"\\u65e0\\u98ce\\u9669\\u9875\\u76f4\\u63a5\\u8df3\\u8f6c\"},{\"desc\":\"\\u72ec\\u7acb\\u4e3b\\u673a\",\"val\":\"\\u652f\\u6301\"},{\"desc\":\"\\u6279\\u91cf\\u4fee\\u6539\\u7f51\\u5740\",\"val\":\"\\u4e0d\\u652f\\u6301\"},{\"desc\":\"\\u7279\\u6b8a\\u7c7b\\u578b\\u5b9a\\u5236\",\"val\":\"\\u4e0d\\u652f\\u6301\"}]', '3');
INSERT INTO `fw_vip` VALUES ('35', '超级版', '1', '1', '666', '111111111', '[\"10\",\"11\"]', '100', '1', '[{\"desc\":\"\\u5185\\u5bb9\\u7f16\\u8f91\",\"val\":\"\\u65e0\\u9650\\u5236\\u4fee\\u6539\"},{\"desc\":\"\\u98ce\\u9669\\u9884\\u8b66\",\"val\":\"\\u65e0\\u98ce\\u9669\\u9875\\u76f4\\u63a5\\u8df3\\u8f6c\"},{\"desc\":\"\\u72ec\\u7acb\\u4e3b\\u673a\",\"val\":\"\\u652f\\u6301\"},{\"desc\":\"\\u6279\\u91cf\\u4fee\\u6539\\u7f51\\u5740\",\"val\":\"\\u652f\\u6301\"},{\"desc\":\"\\u7279\\u6b8a\\u7c7b\\u578b\\u5b9a\\u5236\",\"val\":\"\\u4e0d\\u652f\\u6301\"}]', '4');

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
) ENGINE=MyISAM AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_vip_price
-- ----------------------------
INSERT INTO `fw_vip_price` VALUES ('117', '25', '5', '5000.00');
INSERT INTO `fw_vip_price` VALUES ('116', '25', '3', '3000.00');
INSERT INTO `fw_vip_price` VALUES ('119', '35', '5', '555.00');
INSERT INTO `fw_vip_price` VALUES ('118', '35', '6', '666.00');
INSERT INTO `fw_vip_price` VALUES ('75', '28', '5', '8000.00');
INSERT INTO `fw_vip_price` VALUES ('74', '28', '1', '3000.00');
INSERT INTO `fw_vip_price` VALUES ('115', '25', '4', '4000.00');
INSERT INTO `fw_vip_price` VALUES ('73', '28', '3', '5000.00');
INSERT INTO `fw_vip_price` VALUES ('114', '25', '2', '2000.00');
INSERT INTO `fw_vip_price` VALUES ('122', '26', '3', '3000.00');
INSERT INTO `fw_vip_price` VALUES ('121', '26', '2', '1000.00');
INSERT INTO `fw_vip_price` VALUES ('120', '26', '1', '0.10');
INSERT INTO `fw_vip_price` VALUES ('113', '25', '1', '1000.00');
