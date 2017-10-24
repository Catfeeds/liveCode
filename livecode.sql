/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : livecode

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-10-24 15:11:22
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
INSERT INTO `fw_admin_access` VALUES ('1', '1', '1', '1438651748', '1438651748', '0', '1');
INSERT INTO `fw_admin_access` VALUES ('3', '2', '1', '1505118943', '1505119057', '0', '1');
INSERT INTO `fw_admin_access` VALUES ('4', '13', '1', '1506048686', '1506048686', '0', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

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
INSERT INTO `fw_admin_config` VALUES ('14', '分页数量', 'ADMIN_PAGE_ROWS', '20', '2', 'num', '', '分页时每页的记录数', '1434019462', '1434019481', '4', '1');
INSERT INTO `fw_admin_config` VALUES ('15', '后台主题', 'ADMIN_THEME', 'blue', '2', 'select', 'default:默认主题\r\nblue:蓝色理想\r\ngreen:绿色生活', '后台界面主题', '1436678171', '1436690570', '5', '1');
INSERT INTO `fw_admin_config` VALUES ('16', '开发模式', 'DEVELOP_MODE', '1', '3', 'select', '1:开启\r\n0:关闭', '开发模式下会显示菜单管理、配置管理、数据字典等开发者工具', '1432393583', '1432393583', '1', '1');
INSERT INTO `fw_admin_config` VALUES ('17', '是否显示页面Trace', 'SHOW_PAGE_TRACE', '0', '3', 'select', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '2', '1');
INSERT INTO `fw_admin_config` VALUES ('19', 'URL模式', 'URL_MODEL', '3', '4', 'select', '0:普通模式\r\n1:PATHINFO模式\r\n2:REWRITE模式\r\n3:兼容模式', '', '1438423248', '1438423248', '1', '1');
INSERT INTO `fw_admin_config` VALUES ('21', '配置分组', 'CONFIG_GROUP_LIST', '1:基本\r\n2:系统\r\n3:开发\r\n4:部署\r\n', '2', 'array', '', '配置分组', '1379228036', '1426930700', '5', '1');
INSERT INTO `fw_admin_config` VALUES ('35', '邮箱服务器端口', 'EMAIL_PORT', '465', '1', 'text', '', '', '1508375440', '1508375440', '11', '1');
INSERT INTO `fw_admin_config` VALUES ('36', '邮箱服务器帐号', 'EMAIL_ADDR', '447936059@qq.com', '1', 'text', '', '用于发送注册/忘记密码邮件验证', '1508375570', '1508375570', '12', '1');
INSERT INTO `fw_admin_config` VALUES ('37', '邮箱服务器密码', 'EMAIL_PASS', 'nclesdomslbrbgce', '1', 'text', '', '', '1508375691', '1508375691', '13', '1');
INSERT INTO `fw_admin_config` VALUES ('34', '邮箱服务器', 'EMAIL_HOST', 'smtp.qq.com', '1', 'text', '', '', '1508375330', '1508375330', '10', '1');
INSERT INTO `fw_admin_config` VALUES ('38', '通用活码域名', 'DOMAIN_URL', 'huoma.edeyun.cn', '1', 'text', '', '用户未自定义域名的活码将解析到这个地址', '1508375938', '1508375938', '14', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='部门信息表';

-- ----------------------------
-- Records of fw_admin_group
-- ----------------------------
INSERT INTO `fw_admin_group` VALUES ('1', '0', '超级管理员', '', '', '1426881003', '1427552428', '0', '1');
INSERT INTO `fw_admin_group` VALUES ('3', '0', '网址跳转', '', '{\"Admin\":[\"59\",\"61\",\"63\",\"60\",\"62\",\"64\",\"65\",\"67\",\"66\"]}', '1496210172', '1505117600', '0', '1');
INSERT INTO `fw_admin_group` VALUES ('4', '0', '多网址跳转', '', '{\"Admin\":[\"68\",\"69\",\"70\",\"71\",\"72\",\"73\",\"74\",\"75\"]}', '1496210208', '1505117571', '0', '1');
INSERT INTO `fw_admin_group` VALUES ('5', '0', '活码管理', '', '{\"Admin\":[\"58\",\"59\",\"61\",\"63\",\"60\",\"62\",\"64\",\"65\",\"67\",\"66\",\"68\",\"69\",\"70\",\"71\",\"72\",\"73\",\"74\",\"75\"]}', '1496210230', '1496210240', '0', '1');
INSERT INTO `fw_admin_group` VALUES ('6', '0', '发送发生的发生的发生的', 'fa-search', '{\"Admin\":[\"1\",\"58\",\"59\",\"61\",\"63\",\"60\",\"62\",\"64\",\"65\",\"67\",\"66\",\"68\",\"69\",\"70\",\"71\",\"72\",\"73\",\"74\",\"75\",\"2\",\"3\",\"4\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"44\",\"45\",\"46\",\"47\",\"48\"]}', '1505117366', '1505117550', '1', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COMMENT='菜单表';

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
INSERT INTO `fw_admin_menu` VALUES ('15', '7', '0', '新增', '2', 'Admin/Phone/add', '', '0', '1505210029', '1');
INSERT INTO `fw_admin_menu` VALUES ('17', '11', '0', '新建目录', '2', 'Admin/Livecode/addmenu', '', '0', '1505210030', '-1');
INSERT INTO `fw_admin_menu` VALUES ('42', '38', '3', '编辑活码', '2', 'Admin/Livecode/edit/type/1505457893', '', '0', '1505457893', '-1');
INSERT INTO `fw_admin_menu` VALUES ('41', '38', '3', '查看数据统计', '2', 'Admin/Livecode/view/type/1505457893', '', '0', '1505457893', '-1');
INSERT INTO `fw_admin_menu` VALUES ('27', '8', '0', '新增', '2', 'Admin/Duourl/add', '', '0', '1505439785', '1');
INSERT INTO `fw_admin_menu` VALUES ('40', '38', '3', '下载二维码', '2', 'Admin/Livecode/xzewm/type/1505457893', '', '0', '1505457893', '-1');
INSERT INTO `fw_admin_menu` VALUES ('39', '38', '3', '新增活码', '2', 'Admin/Livecode/add/type/1505457893', '', '0', '1505457893', '-1');
INSERT INTO `fw_admin_menu` VALUES ('38', '11', '3', '新目录一号', '2', 'Admin/Livecode/child/type/1505457893', '', '0', '1505457893', '1');
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
INSERT INTO `fw_admin_menu` VALUES ('55', '54', '0', '新增套餐', '1', 'Admin/Vip/add', '', '0', '1505805835', '-1');
INSERT INTO `fw_admin_menu` VALUES ('56', '54', '0', '编辑套餐', '1', 'Admin/Vip/edit', '', '0', '1505805956', '-1');
INSERT INTO `fw_admin_menu` VALUES ('57', '1', '0', '账号管理', '2', '', 'fa fa-folder-open-o', '0', '1505814677', '1');
INSERT INTO `fw_admin_menu` VALUES ('58', '1', '0', '财务管理', '2', '', 'fa fa-folder-open-o', '0', '1505814780', '1');
INSERT INTO `fw_admin_menu` VALUES ('59', '57', '0', '密码修改', '2', 'Admin/Account/editPass', 'fa fa-list', '0', '1505815020', '1');
INSERT INTO `fw_admin_menu` VALUES ('60', '57', '0', '续费管理', '2', 'Admin/Account/fee', 'fa fa-list', '0', '1505815097', '1');
INSERT INTO `fw_admin_menu` VALUES ('61', '58', '0', '订单中心', '2', 'Admin/Account/order', 'fa fa-list', '0', '1505815175', '1');
INSERT INTO `fw_admin_menu` VALUES ('62', '14', '0', '新增用户', '1', 'Admin/User/add', '', '0', '1505899117', '-1');
INSERT INTO `fw_admin_menu` VALUES ('63', '14', '0', '编辑用户', '1', 'Admin/User/edit', '', '0', '1505899659', '-1');
INSERT INTO `fw_admin_menu` VALUES ('64', '53', '0', '新增汇款账号', '1', 'Admin/Payconf/add', '', '0', '1505959361', '-1');
INSERT INTO `fw_admin_menu` VALUES ('65', '53', '0', '编辑汇款账号', '1', 'Admin/Payconf/edit', '', '0', '1505959443', '-1');
INSERT INTO `fw_admin_menu` VALUES ('66', '14', '0', '续费', '1', 'Admin/User/fee', '', '0', '1505976986', '-1');
INSERT INTO `fw_admin_menu` VALUES ('67', '11', '3', '第二个', '2', 'Admin/Livecode/child/type/1506064330', '', '0', '1506064330', '1');
INSERT INTO `fw_admin_menu` VALUES ('68', '67', '3', '新增活码', '2', 'Admin/Livecode/add/type/1506064330', '', '0', '1506064330', '-1');
INSERT INTO `fw_admin_menu` VALUES ('69', '67', '3', '下载二维码', '2', 'Admin/Livecode/xzewm/type/1506064330', '', '0', '1506064330', '-1');
INSERT INTO `fw_admin_menu` VALUES ('70', '67', '3', '查看数据统计', '2', 'Admin/Livecode/view/type/1506064330', '', '0', '1506064330', '-1');
INSERT INTO `fw_admin_menu` VALUES ('71', '67', '3', '编辑活码', '2', 'Admin/Livecode/edit/type/1506064330', '', '0', '1506064330', '-1');
INSERT INTO `fw_admin_menu` VALUES ('72', '11', '3', '再来个', '2', 'Admin/Livecode/child/type/1506064362', '', '0', '1506064362', '1');
INSERT INTO `fw_admin_menu` VALUES ('73', '72', '3', '新增活码', '2', 'Admin/Livecode/add/type/1506064362', '', '0', '1506064362', '-1');
INSERT INTO `fw_admin_menu` VALUES ('74', '72', '3', '下载二维码', '2', 'Admin/Livecode/xzewm/type/1506064362', '', '0', '1506064362', '-1');
INSERT INTO `fw_admin_menu` VALUES ('75', '72', '3', '查看数据统计', '2', 'Admin/Livecode/view/type/1506064362', '', '0', '1506064362', '-1');
INSERT INTO `fw_admin_menu` VALUES ('76', '72', '3', '编辑活码', '2', 'Admin/Livecode/edit/type/1506064362', '', '0', '1506064362', '-1');
INSERT INTO `fw_admin_menu` VALUES ('77', '11', '14', '我是哈哈哈', '2', 'Admin/Livecode/child/type/1506064409', '', '0', '1506064409', '1');
INSERT INTO `fw_admin_menu` VALUES ('78', '77', '14', '新增活码', '2', 'Admin/Livecode/add/type/1506064409', '', '0', '1506064409', '-1');
INSERT INTO `fw_admin_menu` VALUES ('79', '77', '14', '下载二维码', '2', 'Admin/Livecode/xzewm/type/1506064409', '', '0', '1506064409', '-1');
INSERT INTO `fw_admin_menu` VALUES ('80', '77', '14', '查看数据统计', '2', 'Admin/Livecode/view/type/1506064409', '', '0', '1506064409', '-1');
INSERT INTO `fw_admin_menu` VALUES ('81', '77', '14', '编辑活码', '2', 'Admin/Livecode/edit/type/1506064409', '', '0', '1506064409', '-1');
INSERT INTO `fw_admin_menu` VALUES ('90', '87', '3', '查看数据统计', '2', 'Admin/Product/view/type/1506065776', '', '0', '1506065776', '-1');
INSERT INTO `fw_admin_menu` VALUES ('89', '87', '3', '下载二维码', '2', 'Admin/Product/xzewm/type/1506065776', '', '0', '1506065776', '-1');
INSERT INTO `fw_admin_menu` VALUES ('88', '87', '3', '新增活码', '2', 'Admin/Product/add/type/1506065776', '', '0', '1506065776', '-1');
INSERT INTO `fw_admin_menu` VALUES ('87', '9', '3', '产品的子目录', '2', 'Admin/Product/child/type/1506065776', '', '0', '1506065776', '1');
INSERT INTO `fw_admin_menu` VALUES ('91', '87', '3', '编辑活码', '2', 'Admin/Product/edit/type/1506065776', '', '0', '1506065776', '-1');
INSERT INTO `fw_admin_menu` VALUES ('92', '7', '0', '编辑', '2', 'Admin/Phone/edit', '', '0', '1506066075', '-1');
INSERT INTO `fw_admin_menu` VALUES ('93', '8', '0', '编辑', '2', 'Admin/Duourl/edit', '', '0', '1506066156', '-1');
INSERT INTO `fw_admin_menu` VALUES ('94', '8', '0', '导出网址', '2', 'Admin/Duourl/outurl', '', '0', '1506066214', '-1');
INSERT INTO `fw_admin_menu` VALUES ('95', '8', '0', '下载二维码', '2', 'Admin/Duourl/xzewm', '', '0', '1506066258', '-1');
INSERT INTO `fw_admin_menu` VALUES ('96', '8', '0', '批量修改跳转地址', '2', 'Admin/Duourl/edittzwz', '', '0', '1506066291', '-1');
INSERT INTO `fw_admin_menu` VALUES ('97', '7', '0', '批量修改跳转地址', '2', 'Admin/Phone/edittzwz', '', '0', '1506066342', '-1');
INSERT INTO `fw_admin_menu` VALUES ('98', '7', '0', '导出网址', '2', 'Admin/Phone/outurl', '', '0', '1506066372', '-1');
INSERT INTO `fw_admin_menu` VALUES ('99', '7', '0', '下载二维码', '2', 'Admin/Phone/xzewm', '', '0', '1506066390', '-1');
INSERT INTO `fw_admin_menu` VALUES ('100', '7', '0', '导入网址', '2', 'Admin/Phone/drurl', '', '0', '1506066411', '-1');
INSERT INTO `fw_admin_menu` VALUES ('103', '10', '0', '编辑', '2', 'Admin/Video/edit', '', '0', '1506309573', '-1');
INSERT INTO `fw_admin_menu` VALUES ('102', '10', '0', '新增', '2', 'Admin/Video/add', '', '0', '1506309507', '-1');
INSERT INTO `fw_admin_menu` VALUES ('104', '10', '0', '导出', '2', 'Admin/Video/outurl', '', '0', '1506309620', '-1');
INSERT INTO `fw_admin_menu` VALUES ('105', '10', '0', '下载', '2', 'Admin/Video/xzewm', '', '0', '1506309635', '-1');
INSERT INTO `fw_admin_menu` VALUES ('106', '7', '0', '数据统计', '2', 'Admin/Phone/view', '', '0', '1506416316', '-1');
INSERT INTO `fw_admin_menu` VALUES ('107', '8', '0', '数据统计', '2', 'Admin/Duourl/view', '', '0', '1506566192', '-1');
INSERT INTO `fw_admin_menu` VALUES ('108', '10', '0', '数据统计', '2', 'Admin/Video/view', '', '0', '1506568502', '-1');
INSERT INTO `fw_admin_menu` VALUES ('115', '14', '0', '域名管理', '2', 'Admin/User/domain', '', '0', '1508381295', '-1');
INSERT INTO `fw_admin_menu` VALUES ('110', '109', '3', '新增活码', '2', 'Admin/Livecode/add/type/1508229488', '', '0', '1508229488', '-1');
INSERT INTO `fw_admin_menu` VALUES ('111', '109', '3', '下载二维码', '2', 'Admin/Livecode/xzewm/type/1508229488', '', '0', '1508229488', '-1');
INSERT INTO `fw_admin_menu` VALUES ('112', '109', '3', '查看数据统计', '2', 'Admin/Livecode/view/type/1508229488', '', '0', '1508229488', '-1');
INSERT INTO `fw_admin_menu` VALUES ('113', '109', '3', '编辑活码', '2', 'Admin/Livecode/edit/type/1508229488', '', '0', '1508229488', '-1');
INSERT INTO `fw_admin_menu` VALUES ('114', '57', '0', '域名管理', '2', 'Admin/Account/domain', 'fa fa-list', '0', '1508311233', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='文件上传表';

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
  `url_status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='用户账号表';

-- ----------------------------
-- Records of fw_admin_user
-- ----------------------------
INSERT INTO `fw_admin_user` VALUES ('1', '1', 'admin', 'b7aebc807e9844d9148e5cb32c6ff885', '', '', '0', '', '1438651748', '1501578198', '1', '0', '0', '1', '', '0');
INSERT INTO `fw_admin_user` VALUES ('2', '1', 'admin2', 'b7aebc807e9844d9148e5cb32c6ff885', '', '', '0', 'admin', '1496210259', '1505898727', '1', '0', '0', '1', '', '0');
INSERT INTO `fw_admin_user` VALUES ('3', '2', '哈哈哈', 'b7aebc807e9844d9148e5cb32c6ff885', 'newbie91521@163.com', '18121029523', '2130706433', 'admin', '1505117796', '1501898740', '1', '1', '1537607827', '1', 'www.51kiwi.cn', '0');
INSERT INTO `fw_admin_user` VALUES ('13', '2', '我师父', 'b7aebc807e9844d9148e5cb32c6ff885', '发的发的发', 'fasdfsdf', '0', '', '0', '1505812506', '0', '0', '0', '1', '', '0');
INSERT INTO `fw_admin_user` VALUES ('14', '2', '哈哈哈小号', 'b7aebc807e9844d9148e5cb32c6ff885', '447936059@qq.com', '13333333333', '0', '', '1505548436', '0', '1', '2', '1537607827', '-1', 'www.livecode21.com', '1');
INSERT INTO `fw_admin_user` VALUES ('15', '2', '15555555555', 'b7aebc807e9844d9148e5cb32c6ff885', 'newbie91521@qq.com', '15555555555', '0', '', '1508201855', '1508384205', '1', '0', '0', '1', 'www.51kiwi.cn111', '-1');

-- ----------------------------
-- Table structure for `fw_cms_duourl`
-- ----------------------------
DROP TABLE IF EXISTS `fw_cms_duourl`;
CREATE TABLE `fw_cms_duourl` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL,
  `title` text NOT NULL COMMENT '题标',
  `tztime` text,
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `huoma` varchar(255) DEFAULT NULL,
  `d` varchar(255) DEFAULT NULL,
  `uid` int(11) DEFAULT '0',
  `type` tinyint(1) unsigned DEFAULT '2' COMMENT '1单网址2多网址',
  `tztype` tinyint(1) DEFAULT '1',
  `count` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `status` (`status`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fw_cms_duourl
-- ----------------------------
INSERT INTO `fw_cms_duourl` VALUES ('11', '看一看瞧一瞧', 'https://daily.zhihu.com/|||http://english.ctrip.com/?allianceid=16875&sid=441318&ouid=000401app-2WJZ1LNoM0ZmVlw&utm_medium=&utm_campaign=&utm_source=&isctrip=', null, '1506565137', '1506565137', '/index.php/huoma/duo?d=wbq0io6qa', 'wbq0io6qa', '3', '2', '1', '1', '1');
INSERT INTO `fw_cms_duourl` VALUES ('10', '妈的再来个1112', 'http://www.qq.com/|||http://www.taobao.com/', null, '1506405851', '1506406371', '/index.php/huoma/duo?d=b9tpf8dzv', 'b9tpf8dzv', '3', '2', '1', '2', '1');
INSERT INTO `fw_cms_duourl` VALUES ('15', '1', '', null, '1508482186', '1508482186', '/index.php/huoma/duo?d=r4194d1u2', 'r4194d1u2', '14', '2', '1', '0', '0');
INSERT INTO `fw_cms_duourl` VALUES ('16', '1', '', null, '1508721275', '1508721275', 'http://huoma.edeyun.cn/index.php/huoma/duo?d=r5x8rvt6j', 'r5x8rvt6j', '3', '2', '1', '0', '1');

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
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_cms_livecode
-- ----------------------------
INSERT INTO `fw_cms_livecode` VALUES ('65', '1', '1505457893', '3', '发生的范德萨', '{\"picUrl\":\"2017-10-17\\/59e57a61cea8f.jpg\",\"content\":\"<p>\\n\\t<span style=\\\"color:#E53333;\\\">\\u53d1\\u751f\\u7684\\u8303\\u5fb7\\u8428<\\/span>\\n<\\/p>\\n<p>\\n\\t<span style=\\\"color:#E53333;\\\"><img src=\\\"\\/Uploads\\/duourl\\/11.png\\\" alt=\\\"\\\" \\/><br \\/>\\n<\\/span>\\n<\\/p>\\n<p>\\n\\t<span style=\\\"color:#E53333;\\\"><img src=\\\"http:\\/\\/api.map.baidu.com\\/staticimage?center=121.473704%2C31.230393&zoom=11&width=558&height=360&markers=121.473704%2C31.230393&markerStyles=l%2CA\\\" alt=\\\"\\\" \\/><br \\/>\\n<\\/span>\\n<\\/p>\\n<p>\\n\\t<span style=\\\"color:#E53333;\\\"><embed src=\\\"\\/Uploads\\/2017-10\\/59e5b42b945b3.mp4\\\" type=\\\"application\\/x-shockwave-flash\\\" width=\\\"550\\\" height=\\\"400\\\" quality=\\\"high\\\" \\/><br \\/>\\n<\\/span>\\n<\\/p>\\n<p>\\n\\t<span style=\\\"color:#E53333;\\\"><a class=\\\"ke-insertfile\\\" href=\\\"\\/Uploads\\/2017-10\\/59e5c43e56b24.docx\\\" target=\\\"_blank\\\">\\/Uploads\\/2017-10\\/59e5c43e56b24.docx<\\/a><br \\/>\\n<\\/span>\\n<\\/p>\"}', '0', 'http://www.livecode.com/index.php/huoma/live?d=9j2v9h078', '9j2v9h078', '1508230212', '1508230212', '0');
INSERT INTO `fw_cms_livecode` VALUES ('66', '1', '0', '3', '来个图文的标题', '{\"picUrl\":\"2017-10-17\\/59e591caa56c4.jpg\",\"content\":\"<p>\\n\\t\\u53d1\\u751f\\u7684\\u8303\\u5fb7\\u8428\\u6cd5\\u6492\\u65e6\\u6cd5\\n<\\/p>\\n<p>\\n\\t<img src=\\\"\\/Uploads\\/2017-09\\/59cca7adcc047.jpg\\\" alt=\\\"\\\" \\/>\\n<\\/p>\\n<p>\\n\\t<strong><span style=\\\"font-size:24px;\\\">\\u6cd5\\u6492\\u65e6\\u6cd5\\u8bf4\\u7684<\\/span><\\/strong>\\n<\\/p>\"}', '0', 'http://www.livecode.com/index.php/huoma/live?d=cst8fnmr5', 'cst8fnmr5', '1508217329', '1508217329', '0');
INSERT INTO `fw_cms_livecode` VALUES ('63', '1', '0', '3', '我是图文', '', '0', 'http://www.livecode.com/index.php/huoma/live?d=cox4aiyw7', 'cox4aiyw7', '1508209959', '1508209959', '0');
INSERT INTO `fw_cms_livecode` VALUES ('68', '1', '0', '3', '标题111范德萨发的', '{\"picUrl\":\"2017-10-17\\/59e598a774a82.jpg\",\"content\":\"<p>\\n\\t<span style=\\\"font-size:32px;\\\">12\\u997f\\u6cd5\\u6492\\u65e6\\u6cd51<\\/span>\\n<\\/p>\\n<p>\\n\\t<span style=\\\"font-size:32px;color:#9933E5;\\\">\\u5149\\u7535\\u80a1\\u4efd\\u80a1\\u4efd<\\/span>\\n<\\/p>\"}', '0', 'http://www.livecode.com/index.php/huoma/live?d=5a8pkwk0a', '5a8pkwk0a', '1508221770', '1508221770', '0');
INSERT INTO `fw_cms_livecode` VALUES ('44', '4', '0', '3', '百度111111', 'https://www.baidu.com/?tn=59046333_1_dg', '7', 'http://www.livecode.com/index.php/huoma/live?d=svsdtm5mu', 'svsdtm5mu', '1508223238', '1508223238', '0');
INSERT INTO `fw_cms_livecode` VALUES ('43', '2', '1505457893', '3', '牛不舒服', '发大发顺丰是的范德萨', '44', 'http://www.livecode.com/index.php/huoma/live?d=wjplf0ssg', 'wjplf0ssg', '1506755264', '1506755264', '0');
INSERT INTO `fw_cms_livecode` VALUES ('51', '3', '0', '3', '2937.jpg', '{\"url\":\"2017-10-10\\/59dc8f73a31f0.jpg\",\"size\":\"497.006 KB\"}', '0', 'http://www.livecode.com/index.php/huoma/live?d=hudhj5cvq', 'hudhj5cvq', '1507626870', '1507626870', '0');
INSERT INTO `fw_cms_livecode` VALUES ('49', '3', '0', '3', 'ThinkPHP 5 简明开发手册.pdf', '{\"url\":\"2017-10-10\\/59dc70fc8eec1.pdf\",\"size\":\"1.422 MB\"}', '62', 'http://www.livecode.com/index.php/huoma/live?d=8yd9st9tp', '8yd9st9tp', '1507619069', '1507619069', '0');
INSERT INTO `fw_cms_livecode` VALUES ('50', '3', '0', '3', 'infinityWallpaper.jpg', '{\"url\":\"2017-10-10\\/59dc79bb32aa2.jpg\",\"size\":\"270.241 KB\"}', '2', 'http://www.livecode.com/index.php/huoma/live?d=44wqfkpmk', '44wqfkpmk', '1507621308', '1507621308', '0');
INSERT INTO `fw_cms_livecode` VALUES ('60', '3', '0', '3', 'test111.pdf', '{\"url\":\"2017-10-17\\/59e5a7dd620de.pdf\",\"size\":\"1.422 MB\"}', '0', 'http://www.livecode.com/index.php/huoma/live?d=ljv7ct42m', 'ljv7ct42m', '1508222942', '1508222942', '0');
INSERT INTO `fw_cms_livecode` VALUES ('59', '2', '0', '3', '1111111', '222222222222222222', '0', 'http://www.livecode.com/index.php/huoma/live?d=vufzv23js', 'vufzv23js', '1508291514', '1508291514', '0');
INSERT INTO `fw_cms_livecode` VALUES ('58', '2', '0', '3', '1212', '132222222222222', '1', 'http://www.livecode.com/index.php/huoma/live?d=6rc8wwtni', '6rc8wwtni', '1508291102', '1508291102', '0');
INSERT INTO `fw_cms_livecode` VALUES ('67', '1', '0', '3', '1', '{\"picUrl\":\"2017-10-17\\/59e598a774a82.jpg\",\"content\":\"2\"}', '0', 'http://www.livecode.com/index.php/huoma/live?d=efb3ewh48', 'efb3ewh48', '1508219048', '1508219048', '0');
INSERT INTO `fw_cms_livecode` VALUES ('64', '1', '0', '3', '我是图文', '', '0', 'http://www.livecode.com/index.php/huoma/live?d=nxvims21v', 'nxvims21v', '1508210019', '1508210019', '0');
INSERT INTO `fw_cms_livecode` VALUES ('69', '3', '0', '3', 'ThinkPHP 5 简明开发手册.pdf', '{\"url\":\"2017-10-17\\/59e5a77488fe7.pdf\",\"size\":\"1.422 MB\"}', '1', 'http://www.livecode.com/index.php/huoma/live?d=yargjq16f', 'yargjq16f', '1508222839', '1508222839', '0');
INSERT INTO `fw_cms_livecode` VALUES ('70', '1', '0', '3', '发送法撒旦法', '{\"picUrl\":\"2017-10-18\\/59e6f5216e098.jpg\",\"content\":\"<span style=\\\"background-color:#E53333;\\\">\\u7c89\\u8272\\u53d1\\u591a\\u5c11<\\/span>\"}', '0', 'http://www.livecode.com/index.php/huoma/live?d=3k0pgg7ql', '3k0pgg7ql', '1508308632', '1508308632', '0');
INSERT INTO `fw_cms_livecode` VALUES ('71', '1', '0', '3', '发送法撒旦法', '{\"picUrl\":\"2017-10-18\\/59e6f5216e098.jpg\",\"content\":\"<span style=\\\"background-color:#E53333;\\\">\\u7c89\\u8272\\u53d1\\u591a\\u5c11<\\/span>\"}', '0', 'http://www.livecode.com/index.php/huoma/live?d=b7snvvczt', 'b7snvvczt', '1508308617', '1508308617', '0');
INSERT INTO `fw_cms_livecode` VALUES ('72', '1', '0', '3', '1', '{\"picUrl\":\"2017-10-18\\/59e6f6a179a99.jpg\",\"content\":\"2\"}', '0', 'http://www.livecode.com/index.php/huoma/live?d=5ajqhxpkc', '5ajqhxpkc', '1508308652', '1508308652', '0');
INSERT INTO `fw_cms_livecode` VALUES ('73', '1', '0', '3', '1', '{\"picUrl\":\"2017-10-18\\/59e6f6ba926e9.jpg\",\"content\":\"2\"}', '8', 'http://www.livecode.com/index.php/huoma/live?d=ddcuw53uk', 'ddcuw53uk', '1508466502', '1508466502', '0');
INSERT INTO `fw_cms_livecode` VALUES ('74', '2', '0', '3', 'fds ', 'fdfddd', '0', 'http://www.livecode.com/index.php/huoma/live?d=tx1ta9xv3', 'tx1ta9xv3', '1508311983', '1508311983', '0');
INSERT INTO `fw_cms_livecode` VALUES ('75', '2', '0', '3', '1', '2', '0', 'http://www.livecode.com/index.php/huoma/live?d=l7o0v58ho', 'l7o0v58ho', '1508312892', '1508312892', '0');
INSERT INTO `fw_cms_livecode` VALUES ('78', '2', '0', '3', '3', '4', '0', 'http://www.livecode.com/index.php/huoma/live?d=d6c6wcfxy', 'd6c6wcfxy', '1508314038', '1508314038', '0');
INSERT INTO `fw_cms_livecode` VALUES ('77', '4', '1506064362', '3', '牛逼一号111', 'http://huoma.edeyun.cn', '0', 'http://www.livecode.com/index.php/huoma/live?d=h00l8dq7m', 'h00l8dq7m', '1508313158', '1508313158', '0');
INSERT INTO `fw_cms_livecode` VALUES ('79', '3', '0', '3', '1.txt', '{\"url\":\"2017-10-19\\/59e837f2219fa.txt\",\"size\":\"16 bytes\"}', '0', 'http://www.livecode.com/index.php/huoma/live?d=f0p1e4pnj', 'f0p1e4pnj', '1508466494', '1508466494', '0');
INSERT INTO `fw_cms_livecode` VALUES ('81', '3', '1505457893', '3', '2937.jpg', '{\"url\":\"2017-10-20\\/59e961862107e.jpg\",\"size\":\"497.006 KB\"}', '0', 'http://www.livecode.com/index.php/huoma/live?d=lpme2pjlz', 'lpme2pjlz', '1508467079', '1508467079', '0');
INSERT INTO `fw_cms_livecode` VALUES ('84', '2', '0', '14', '1', '1', '0', 'http://www.niubi.com/index.php/huoma/live?d=g74zcpjh7', 'g74zcpjh7', '1508479707', '1508479707', '0');
INSERT INTO `fw_cms_livecode` VALUES ('85', '2', '1505457893', '3', '2', '3', '0', 'http://huoma.edeyun.cn/index.php/huoma/live?d=4ypf2xx0i', '4ypf2xx0i', '1508720994', '1508720994', '1');
INSERT INTO `fw_cms_livecode` VALUES ('104', '5', '0', '3', '你咋又崩了呢的名片', '{\"head\":\"Uploads\\/livecode\\/file\\/2017-10-24\\/59eeb7756d1bc.jpg\",\"face\":\"Uploads\\/livecode\\/file\\/2017-10-24\\/59eeb5f980d4f.jpg\",\"name\":\"\\u4f60\\u548b\\u53c8\\u5d29\\u4e86\\u5462\",\"appointment\":\"555555555\",\"company\":\"9696666666\",\"layoutbg\":\"1\",\"left_phone\":[{\"ch\":\"\\u56fa\\u5b9a\\u7535\\u8bdd\",\"en\":\"Telephone\",\"val\":\"11\",\"class\":\"vcard_data_value vcard_data_phone\",\"id\":\"\"},{\"ch\":\"\\u79fb\\u52a8\\u7535\\u8bdd\",\"en\":\"Mobile Phone\",\"val\":\"22\",\"class\":\"vcard_data_value vcard_data_mobile\",\"id\":\"left_addable_phone\"},{\"ch\":\"\\u5bb6\\u5ead\\u7535\\u8bdd0\",\"val\":\"2222\",\"class\":\"vcard_data_value vcard_data_mobile mobile0\"},{\"ch\":\"\\u4f20\\u771f\",\"en\":\"Fax\",\"val\":\"33\",\"class\":\"vcard_data_value vcard_data_fax\",\"id\":\"left_addable_fax\"},{\"ch\":\"\\u7535\\u5b50\\u90ae\\u7bb1\",\"en\":\"Email\",\"val\":\"44\",\"class\":\"vcard_data_value vcard_data_email\",\"id\":\"left_addable_email\"}],\"left_internet\":[{\"ch\":\"\\u5fae\\u4fe1\",\"en\":\"Wechat\",\"val\":\"55\",\"class\":\"vcard_data_value vcard_data_wechat\",\"id\":\"left_addable_message\"},{\"ch\":\"\\u4e3b\\u9875\\u7f51\\u5740\",\"en\":\"Website\",\"val\":\"66\",\"class\":\"vcard_data_value vcard_data_site\",\"id\":\"left_addable_site\"},{\"ch\":\"\\u5fae\\u535a\",\"en\":\"Weibo\",\"val\":\"77\",\"class\":\"vcard_data_value vcard_data_weibo\",\"id\":\"\"},{\"ch\":\"QQ\",\"en\":\"QQ\",\"val\":\"88\",\"class\":\"vcard_data_value vcard_data_qq\",\"id\":\"\"}],\"left_address\":[{\"ch\":\"\\u5730\\u5740\",\"en\":\"Address\",\"val\":\"9\",\"class\":\"vcard_data_value vcard_data_address vcard-mapaddr\",\"id\":\"left_addable_address\"}],\"left_intro\":[{\"ch\":\"\\u4e2a\\u4eba\\u8bf4\\u660e\",\"en\":\"Self-intro\",\"val\":\"10\",\"class\":\"vcard_data_value vcard_data_introduce\"}],\"lang\":\"cn\"}', '0', 'http://huoma.edeyun.cn/index.php/huoma/live?d=n1n37yjj4', 'n1n37yjj4', '1508815968', '1508816893', '1');
INSERT INTO `fw_cms_livecode` VALUES ('103', '5', '0', '3', '刚才是失误的名片', '{\"head\":\"data:image\\/jpeg;base64,\\/9j\\/4RUWRXhpZgAATU0AKgAAAAgADAEAAAMAAAABB4AAAAEBAAMAAAABBLAAAAECAAMAAAADAAAAngEGAAMAAAABAAIAAAESAAMAAAABAAEAAAEVAAMAAAABAAMAAAEaAAUAAAABAAAApAEbAAUAAAABAAAArAEoAAMAAAABAAIAAAExAAIAAAAeAAAAtAEyAAIAAAAUAAAA0odpAAQAAAABAAAA6AAAASAACAAIAAgACvyAAAAnEAAK\\/IAAACcQQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykAMjAxNTowNTowNCAxMTo1ODoyMgAAAAAEkAAABwAAAAQwMjIxoAEAAwAAAAH\\/\\/wAAoAIABAAAAAEAAAWgoAMABAAAAAEAAAOEAAAAAAAAAAYBAwADAAAAAQAGAAABGgAFAAAAAQAAAW4BGwAFAAAAAQAAAXYBKAADAAAAAQACAAACAQAEAAAAAQAAAX4CAgAEAAAAAQAAE5AAAAAAAAAASAAAAAEAAABIAAAAAf\\/Y\\/+0ADEFkb2JlX0NNAAL\\/7gAOQWRvYmUAZIAAAAAB\\/9sAhAAMCAgICQgMCQkMEQsKCxEVDwwMDxUYExMVExMYEQwMDAwMDBEMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMAQ0LCw0ODRAODhAUDg4OFBQODg4OFBEMDAwMDBERDAwMDAwMEQwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAz\\/wAARCABkAKADASIAAhEBAxEB\\/90ABAAK\\/8QBPwAAAQUBAQEBAQEAAAAAAAAAAwABAgQFBgcICQoLAQABBQEBAQEBAQAAAAAAAAABAAIDBAUGBwgJCgsQAAEEAQMCBAIFBwYIBQMMMwEAAhEDBCESMQVBUWETInGBMgYUkaGxQiMkFVLBYjM0coLRQwclklPw4fFjczUWorKDJkSTVGRFwqN0NhfSVeJl8rOEw9N14\\/NGJ5SkhbSVxNTk9KW1xdXl9VZmdoaWprbG1ub2N0dXZ3eHl6e3x9fn9xEAAgIBAgQEAwQFBgcHBgU1AQACEQMhMRIEQVFhcSITBTKBkRShsUIjwVLR8DMkYuFygpJDUxVjczTxJQYWorKDByY1wtJEk1SjF2RFVTZ0ZeLys4TD03Xj80aUpIW0lcTU5PSltcXV5fVWZnaGlqa2xtbm9ic3R1dnd4eXp7fH\\/9oADAMBAAIRAxEAPwDhamY99VraxstDXOaAdS0CWtjTd7WqmGyiFgEObpxPk4fupy0ul5MknXxk91rEXWmzUGl67psXOz8YbMe0itsv9N0Ob5+1\\/wD3xdJ03Kq6ljmxgDLazFtUyR4Pb\\/wT1zWOQ25rns9UAzs43D9xSZkvotrvwnPptY0gv01JJL\\/b9H0nfR2KSBMetjs1uY5eOUHhAhk3E\\/8Av3qnYxUDRHZV2\\/WjBdjtdfjWsyph1dUGoj\\/SV2WO3s\\/4p2\\/+ugUfWbHss25OOaKzxY13qbf+MbtZ7f8Ai1J7gc\\/7tzQv0E12Mf8Am\\/vNw0uTCsj86PvWoOlZb2tsrYLKrBurtY5rmOafzmPYfc1L9i5hEgM+boP\\/AEgh7sP3h9qBHKf0Jf4rmhg\\/0p+4qQA72n7j\\/wCSWnX9Xc5\\/ets9t24\\/9FXsX6rsBBynOPkCGpkuYxR3lfkyR5fNPaB+op5+Gf6Z\\/wDm\\/wDmaNTj1PI33WgHu1oP\\/VWNXXU9D6RTr9mDz4uk\\/wDVuRm1dGpMGmpnlsDv71Aedj+jGR+xmHIT0Mpwj\\/L\\/AAXnMXomLkfRybT4+1o\\/785aVH1Twjq\\/LtI7hrWD8fctZvUOlMMBo049oAUj1vpbeHH5CVBPmOYPyiQ+g\\/71sw5flYj1yxyPnX\\/dNWn6qdHaPd61nm6wD8GMarTOg9KqHsreI8H6\\/kQXdf6efouf\\/mlBd1fEdo21zfEbSoyOZluZj\\/GZAeSj8oxH\\/FbrsDpjRD\\/UAHi7\\/wAxQjgdHPJt+AsIH\\/Q2qhZl41k7snQ9thQy3Hdoy5n9phH8ERjn1nMf4y05cZOmPHL6wdX7F0X91+nhY7\\/ySX7O6U7j1R5C5w\\/78skYoefZbUPnH4KTum5DvovrdHEOSMK\\/y0h52uGS9sED5cL\\/AP\\/Q4NgLfOeQeITtZB\\/iiBiIGd1shzjNDs1TmuRIGhRxWpNZAjsnLfcahrlMGBp8Vf8ATmo8RuHbXhygaUqV7jPpHW+pdHLm4xbZjv1fjWgurJ\\/fZBa6mz\\/hKl3\\/AELq2B1qiyzGqsZdRtGRj2EHaXiWuY5n87S5zXt3\\/wCevOxjkzHbVan1c6ueg9ROSavXptZ6N7AYdsLmv31fm+rW5ns3qHNh4okxHr6f1l0ckDLWvN9HZXbENaKx\\/JEFI4d\\/PqOI\\/dPCuUOpyKqsjHd6lN7G2VPAI3NcNzHQVkdW6w95rwuk3D13vG7Ia5sDb7vSZu\\/R2ep+fuds\\/wAGs7GZzlwxFfvE7R\\/vNjL7eOHFMn+qB80z2jFutxJ+k3VEGI3u1ZZ+sGfUxpsxhueS0C1pG1\\/5of6Tm\\/o\\/5exVcP6xdZBJyKRkQTWKhXsIfG7edn6R3p\\/ns\\/0al9nMQT6dP62\\/kw\\/eeWBA9Wv9Xb+869nSqHGSAZ7f7kw6VT+4I+CoXda65UWWupoFID2vMPDS8HbucHO+0Vtpd+7\\/AOq62J9Yuq1XV3ZxZkYrzse2oM02\\/TdV6f8AhG\\/S\\/wBHanDHnIsSBrpxf83+8sll5USoxIs6nh7\\/AKf9113dJoI4+UBAf0ijuwH5LbrdXaxr6iHscNzXDuD3SIngBQDmJjqWyeUxEfKHC\\/ZNY4bt\\/BQf0tvZzvvMLdNZPgoGg+X3pw5mXdYeTx9IuA7prv33\\/wCcQhP6XPMn4kroTiz3CFfTVRTZfe8MpqaX2PPAaE8cye6w8lHs\\/wD\\/0eRbVI+P0T4lIMIAEd+3KjXlBjff7y383QH491NmZU+0tcNo8tT\\/ACT\\/AClqDNHro0ZcvPpqzFeo5I7qVkMqda4EtaC4hokwPBFbZjw0hwJe7YCOJ\\/On+S1qDlZeJXU8byd7XNZtaXNLhyGuaNqPvwsgSFgX\\/L\\/FYzy2WhIwlwmXDt24b\\/6SGv7e+LGs3VHU1hzI0b6nd2\\/e2s\\/T\\/wDVashugMETrB5QLc010U41bQHWNYbMgDStjvpau9r7NqI9+XhVWMux3muphezc9m5kvdW1tnvc91X0f0m3+QqnL81KMyM0qjO+H+83ec5OMsYOCPqhQlX7vb+9FnsTenHZSxsyi9wkemx20Aky3c73Dd\\/m7VZdTGkQZ4\\/gr2PNDIDwnbQ9C5mbDlwkCYriFxI9UZf4TZ6T9YOpdLYceqxz8Nxk0E\\/RJ+k6hx\\/mt35zP5qxdXiUYufiVZ2LSLmPkEuYIDmn3V2Vy7Y9v73\\/AG2uKDAe2hVzpvUOodKu9TDshj\\/5yp3urfH+krn\\/AKbf0qZlx3ZhUZ9f6\\/8AeWxmCR7lyiNB14PJ7K7peHaBZRXZjOEgtBP9uJ921RrwGVvc6SZhzHcuDh\\/KKhgdfwuot2lpoyv9E4gg+dVvt3N\\/8ERW5VzdSA78D81U\\/Wi4m9Okj+1nIw2JADziP+5\\/RR3u3EeoXNfuh721gwPzd2rf89irjpj7LnA1scx\\/0rKyAAQPa9zfc9m7+orYvf8ASeyaTIPJg\\/H\\/AL4pzUwB7GgTw8DT\\/O\\/eREpR0Gi0wjM3LXr4\\/wDOaGFRmYf6MVH0Huh0PJiPoWVPrLfTf+ZuYrNvU+o1uAa4ljTEbw0we9jrmvduRXX7AS0Ahsy1x9plVsnO3AfZ6wwn6ZeN4B8GDTd\\/bTvnlcoA332WkjHCo5JRrYD5voz\\/AG9lVEvb+sNAG6uwtbHad7EQ\\/W7AY5wspt0ALdm1xP8AJfPptr\\/6aybLMt8y5rYO5pawcxEe72taqNmK5jQ6d26fwUg5bDL5gB\\/dNMP3\\/mIfLIyH9cCX\\/oTsX\\/XK92mLiMZr9K55dp\\/Uq9Lb7v5Sxuq9V6h1E7Mi6agd3pV+2oEfR2t\\/O2\\/v2b1F4a1gYGg\\/nOcRrPhu\\/cQngEkgQ2dApseDFAgxgAe59R\\/5zDk53Pk0nkJH7o9Mf+a\\/\\/9LgKrGgb5BeddRKja41WGGlpeBHz+lsVcWdhptjUd1ZeGvx5kaO+jJ0Ouv9pSkkEHvovGsSOsfV\\/wB86WIWsc19fpz6W8u1sJGgH856fp+791VH0ixxIMEkyWu26n3fQax\\/8lCwXnZaByai3wjWVE5xaS1jZcZAJ4B43t\\/lfmp0QAslInd16vq9lZ2SzBZZVXY+ne521wZFde+dlPqve\\/ZX9L0t9j1es+q9zK3Ouue+6r9Fe3Hxn3tLmsrvdv2vrs9K1llT\\/wBLTV+sep6f8yh9L+s19GdZnmqtzhWK8aj1SHbiw4s1tFb\\/AKXq+s9dDRbb1XpWJk5ec\\/Ec4WUMc1+rn1B1eS7J\\/m9+Ra1lNn09n+CVHmcmaBjrwwAA24vV\\/wA5tYowlZqyXT6Z9UOl4OC7Ez68bOaLS9t7qyx4a73OrdY1+72N\\/mvcsPquJRi9SuxscBlNYYGAOLgCWMcdr7C5\\/wBN3566\\/IpOVW5j3WY1hLSLKTsdA3Ob\\/WZ7voLjuuve3reVihwOU+XMc9oYxz2U1Fj3Xb\\/S\\/S\\/ubK\\/f\\/wAYm\\/CuYJzzlOR9WORlffih6qYfiOCU8MYwFkTFD\\/BlFrelLNSN3G34qTmANaW8nt2VWvNLrADU8sLdbWe5ocPzbZDPS\\/f9Td6aPW+28011MD33ODWy9rWiTBsc9x9lLv8ABWv\\/AEdq3Peh+8HGPKZtuAsm1OnWBHj4hbOD1d9bWszAbGn6Ng1dH8v\\/AEn\\/AJ8XL19Xa69lVlRqYZLnO0jQOrd\\/5NXzmYgoYd+jtWkkAEc+3+yjLhkKOq32skDsQ9pXeNofUQWngsJg\\/cVB9m4yQJ8Yj8i4qnrOJ9ofXj5BaWNDnPDobrzDm\\/T2fnrewutYtlLG35NZuMgEuA3CNw\\/tqCWPh1Bv82S5kUYkDy9LpOG46qJrCAzqOHYS2u+t5bqQ14Mfj5KDOrYVj3VttbuaXAyQPo8vn9z91CyFvtk36SaFnRO6ofBCsq3CCdB2TNzsaxpcyxpaC5s7h+aS09\\/5KG7Mx5j1WSeBuH96eCWOUBtTCzGZ+dr5KtdjtcZOkcQrD8mqJ3tjxkQq9uRVB9wjnkKWMpMEsUez\\/9PhLK+i7v0P2oCPzm1HXT\\/hEQ14bWy11prb\\/Nh1dc\\/nGLALC3bv\\/d\\/MQW1SB7hqdYk\\/wRHN9kE\\/MdvnopSFwOhO3lo2KsfpNr7fdlMq27m7GVhzhpu37rdv85v+h+YqllOI25wprs9IE+mXhm+P5cbm7lcxq9swS4Fh9wg\\/xQbmBpMOmJ3aDT8U8R8SslLyTYnTbb7xWzeHhu\\/RzB7QN3sc5v7i3undN6rXh0W\\/bzU3daW17WP2ktbussa9llT3XMb+6s3p2Qxmcx7nQ01xJ0\\/McG+P5y2a8oNwqBJ5fEP0+iOVR5sysRABHiOP9795t8vVEn8Dwujd0Trt9RDutWenuc4tpayoS\\/3Pf7Wfnu9yzOoYL6sq2i7LyrbeXXm2CYrY6rbU2v0va39H9BdDVkl9UNLXSRMEnWPHd\\/39c\\/1m8nqluomG6jUfzbW6auUfw25ZpCQHyE6RjD9KP7qudlwYhKN\\/MBuZOfRitZc129\\/ifd3+j2arXpVudUwusYNwaXB3uidXbtqrC1gcPfI8gf4ozHV7mkvdM6HaY\\/76tc4oXddHM+8ZduLraHKoqy7ml9OyAAfSe5skD6b2nfvsd+c9Eq6fFbQxzyzcXGp3pvaZ\\/wCNqci\\/q7SD6500ja8j\\/qWNViv0nAbXuMeDXcfHc1ERiBVGvHiKyWXJfzfhFe6nIyKBTlW2Wsa1wayWViHgNdLMWvHa\\/wDtqGP0LEbSW+iWtdMgOcBr\\/Ut+l+buRvU2\\/nCPNrp\\/6Sdt426H5CR+VqAhHoK8rC2WfJ+9f0ixHSentgNo2hu6ASXgbwGvj1n2\\/S2qFXS8avJ9YWXNsDg5rw4NcI44H\\/fET7QN2pidANf7mqLsjbJ9wE+H8ZS4BsR+1Az5dxLb6MD0zA9Z9uwtL3OdtaQGjcZlrG+1vCWTiYdxO9m6QA7jX\\/yP0fzUzrJALd7nHmBEf9Uhvc88Ncfv\\/wDIpwhHQ14I93ObHEa3a1vRunngOYN26GuH8k92n91Bs6Pgmx1k2S4yfeI\\/zdisPscB7iQeNJEfH2oFtzgTrPzTwIrePN+8X\\/\\/U4hrWj81o+Tv\\/ACac7eNNe+o\\/8+ucqrfT8P8ApJy4Tx\\/01c4fBjvRvVkaccdhH\\/UodrhtcN8DwE\\/wDkFlg7CPvKHbYYOkjy\\/3I6D7Fpv8XQpyNljSSXSyIBA5EfnFWhm\\/ogA1m4TroJBH5xYd\\/ZY4sBeAddODwdEb1HisBoE9gNYVc44ylZbEchjEgPWY\\/UQKddvuIg7t2nhy7\\/prNz7hZmPft3NIbLgdoGm3ghUce+yuoNLmv3H\\/AAjGAx\\/acgW5DvXILmkCNWtDgP8AN93\\/AEkuVwxhklIdQjmskp4oxI6guiw47\\/aDsd5lxMf1a2PVpgY1oDbJB0JFjgY\\/q+m1ZdWTlFsUMeQeTW2xoP8AaL3qZdY06ue4g6Bzngj\\/ADxWre\\/VpGNDZ1yH7Ya95b4Gzd\\/6K3JmjSHMB85j+DFnt3xMF39sn\\/vzkzS08uOnY6oDzQY67Ol6jWn6LQfNyb7XtOpYPA6H8FnktA0\\/JCbeyQDrPMAj\\/vqWiOEumM0hsl9UeBa0f9+ULM4RILPIAD\\/aqjHVAaNPxhyVlxI0a0nz3A\\/em6XsyCBpJZlSNS0fAAfwQTfu\\/MmfzvUCgb7wf5p3yM\\/xCRtytSA4j90gD+DkuKu32pGO+\\/2KIcBIEf2gR+A3IVlj2ncARA\\/e\\/wDJNCVl15+kwj47f4tCBde\\/uC3+qR\\/31OEj4KMANn\\/\\/1fPfd5pe5ZiSvtcup70xn\\/esxJFDp+\\/bpEJDd3\\/BZiSYPquP0+rraR+k9SPw\\/wCkn\\/S6bJj8PwWQknD6oP0eiq+1bdPTjvtnd\\/0UX3dt0z7t0fiuYSQG6js9WePft+XP\\/RUBvk7JjylcuknBad3qT9o77khG7XfK5ZJJT1rPUn2zPef9qKZ7x8on\\/oLjUlHLfoyx26vXt37vbvnyn\\/vyk71Y\\/On+VC45JNl9F8Nj8z1x9XtHylCt+0x752fguWSSjv0RLY7v\\/9n\\/7RyWUGhvdG9zaG9wIDMuMAA4QklNBAQAAAAAAA8cAVoAAxslRxwCAAACvLAAOEJJTQQlAAAAAAAQ1g82KJ5EfGiOzMwbgFEpgDhCSU0EOgAAAAAA1wAAABAAAAABAAAAAAALcHJpbnRPdXRwdXQAAAAFAAAAAFBzdFNib29sAQAAAABJbnRlZW51bQAAAABJbnRlAAAAAEltZyAAAAAPcHJpbnRTaXh0ZWVuQml0Ym9vbAAAAAALcHJpbnRlck5hbWVURVhUAAAAAQAAAAAAD3ByaW50UHJvb2ZTZXR1cE9iamMAAAAFaCFoN4u+f24AAAAAAApwcm9vZlNldHVwAAAAAQAAAABCbHRuZW51bQAAAAxidWlsdGluUHJvb2YAAAAJcHJvb2ZDTVlLADhCSU0EOwAAAAACLQAAABAAAAABAAAAAAAScHJpbnRPdXRwdXRPcHRpb25zAAAAFwAAAABDcHRuYm9vbAAAAAAAQ2xicmJvb2wAAAAAAFJnc01ib29sAAAAAABDcm5DYm9vbAAAAAAAQ250Q2Jvb2wAAAAAAExibHNib29sAAAAAABOZ3R2Ym9vbAAAAAAARW1sRGJvb2wAAAAAAEludHJib29sAAAAAABCY2tnT2JqYwAAAAEAAAAAAABSR0JDAAAAAwAAAABSZCAgZG91YkBv4AAAAAAAAAAAAEdybiBkb3ViQG\\/gAAAAAAAAAAAAQmwgIGRvdWJAb+AAAAAAAAAAAABCcmRUVW50RiNSbHQAAAAAAAAAAAAAAABCbGQgVW50RiNSbHQAAAAAAAAAAAAAAABSc2x0VW50RiNQeGxAUgAAAAAAAAAAAAp2ZWN0b3JEYXRhYm9vbAEAAAAAUGdQc2VudW0AAAAAUGdQcwAAAABQZ1BDAAAAAExlZnRVbnRGI1JsdAAAAAAAAAAAAAAAAFRvcCBVbnRGI1JsdAAAAAAAAAAAAAAAAFNjbCBVbnRGI1ByY0BZAAAAAAAAAAAAEGNyb3BXaGVuUHJpbnRpbmdib29sAAAAAA5jcm9wUmVjdEJvdHRvbWxvbmcAAAAAAAAADGNyb3BSZWN0TGVmdGxvbmcAAAAAAAAADWNyb3BSZWN0UmlnaHRsb25nAAAAAAAAAAtjcm9wUmVjdFRvcGxvbmcAAAAAADhCSU0D7QAAAAAAEABIAAAAAQACAEgAAAABAAI4QklNBCYAAAAAAA4AAAAAAAAAAAAAP4AAADhCSU0EDQAAAAAABAAAAB44QklNBBkAAAAAAAQAAAAeOEJJTQPzAAAAAAAJAAAAAAAAAAABADhCSU0nEAAAAAAACgABAAAAAAAAAAI4QklNA\\/UAAAAAAEgAL2ZmAAEAbGZmAAYAAAAAAAEAL2ZmAAEAoZmaAAYAAAAAAAEAMgAAAAEAWgAAAAYAAAAAAAEANQAAAAEALQAAAAYAAAAAAAE4QklNA\\/gAAAAAAHAAAP\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/8D6AAAAAD\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/A+gAAAAA\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/wPoAAAAAP\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/8D6AAAOEJJTQQIAAAAAAAQAAAAAQAAAkAAAAJAAAAAADhCSU0EHgAAAAAABAAAAAA4QklNBBoAAAAAA0EAAAAGAAAAAAAAAAAAAAOEAAAFoAAAAAYAYgBnACAAKAAxACkAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAABaAAAAOEAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAEAAAAAEAAAAAAABudWxsAAAAAgAAAAZib3VuZHNPYmpjAAAAAQAAAAAAAFJjdDEAAAAEAAAAAFRvcCBsb25nAAAAAAAAAABMZWZ0bG9uZwAAAAAAAAAAQnRvbWxvbmcAAAOEAAAAAFJnaHRsb25nAAAFoAAAAAZzbGljZXNWbExzAAAAAU9iamMAAAABAAAAAAAFc2xpY2UAAAASAAAAB3NsaWNlSURsb25nAAAAAAAAAAdncm91cElEbG9uZwAAAAAAAAAGb3JpZ2luZW51bQAAAAxFU2xpY2VPcmlnaW4AAAANYXV0b0dlbmVyYXRlZAAAAABUeXBlZW51bQAAAApFU2xpY2VUeXBlAAAAAEltZyAAAAAGYm91bmRzT2JqYwAAAAEAAAAAAABSY3QxAAAABAAAAABUb3AgbG9uZwAAAAAAAAAATGVmdGxvbmcAAAAAAAAAAEJ0b21sb25nAAADhAAAAABSZ2h0bG9uZwAABaAAAAADdXJsVEVYVAAAAAEAAAAAAABudWxsVEVYVAAAAAEAAAAAAABNc2dlVEVYVAAAAAEAAAAAAAZhbHRUYWdURVhUAAAAAQAAAAAADmNlbGxUZXh0SXNIVE1MYm9vbAEAAAAIY2VsbFRleHRURVhUAAAAAQAAAAAACWhvcnpBbGlnbmVudW0AAAAPRVNsaWNlSG9yekFsaWduAAAAB2RlZmF1bHQAAAAJdmVydEFsaWduZW51bQAAAA9FU2xpY2VWZXJ0QWxpZ24AAAAHZGVmYXVsdAAAAAtiZ0NvbG9yVHlwZWVudW0AAAARRVNsaWNlQkdDb2xvclR5cGUAAAAATm9uZQAAAAl0b3BPdXRzZXRsb25nAAAAAAAAAApsZWZ0T3V0c2V0bG9uZwAAAAAAAAAMYm90dG9tT3V0c2V0bG9uZwAAAAAAAAALcmlnaHRPdXRzZXRsb25nAAAAAAA4QklNBCgAAAAAAAwAAAACP\\/AAAAAAAAA4QklNBBEAAAAAAAEBADhCSU0EFAAAAAAABAAAAAE4QklNBAwAAAAAE6wAAAABAAAAoAAAAGQAAAHgAAC7gAAAE5AAGAAB\\/9j\\/7QAMQWRvYmVfQ00AAv\\/uAA5BZG9iZQBkgAAAAAH\\/2wCEAAwICAgJCAwJCQwRCwoLERUPDAwPFRgTExUTExgRDAwMDAwMEQwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwBDQsLDQ4NEA4OEBQODg4UFA4ODg4UEQwMDAwMEREMDAwMDAwRDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDP\\/AABEIAGQAoAMBIgACEQEDEQH\\/3QAEAAr\\/xAE\\/AAABBQEBAQEBAQAAAAAAAAADAAECBAUGBwgJCgsBAAEFAQEBAQEBAAAAAAAAAAEAAgMEBQYHCAkKCxAAAQQBAwIEAgUHBggFAwwzAQACEQMEIRIxBUFRYRMicYEyBhSRobFCIyQVUsFiMzRygtFDByWSU\\/Dh8WNzNRaisoMmRJNUZEXCo3Q2F9JV4mXys4TD03Xj80YnlKSFtJXE1OT0pbXF1eX1VmZ2hpamtsbW5vY3R1dnd4eXp7fH1+f3EQACAgECBAQDBAUGBwcGBTUBAAIRAyExEgRBUWFxIhMFMoGRFKGxQiPBUtHwMyRi4XKCkkNTFWNzNPElBhaisoMHJjXC0kSTVKMXZEVVNnRl4vKzhMPTdePzRpSkhbSVxNTk9KW1xdXl9VZmdoaWprbG1ub2JzdHV2d3h5ent8f\\/2gAMAwEAAhEDEQA\\/AOFqZj31WtrGy0Nc5oB1LQJa2NN3taqYbKIWAQ5unE+Th+6nLS6XkySdfGT3WsRdabNQaXrumxc7Pxhsx7SK2y\\/03Q5vn7X\\/APfF0nTcqrqWObGAMtrMW1TJHg9v\\/BPXNY5Dbmuez1QDOzjcP3FJmS+i2u\\/Cc+m1jSC\\/TUkkv9v0fSd9HYpIEx62OzW5jl45QeECGTcT\\/wC\\/eqdjFQNEdlXb9aMF2O11+NazKmHV1QaiP9JXZY7ez\\/inb\\/66BR9Zseyzbk45orPFjXept\\/4xu1nt\\/wCLUnuBz\\/u3NC\\/QTXYx\\/wCb+83DS5MKyPzo+9ag6Vlva2ytgsqsG6u1jmuY5p\\/OY9h9zUv2LmESAz5ug\\/8ASCHuw\\/eH2oEcp\\/Ql\\/iuaGD\\/Sn7ipADvafuP\\/AJJadf1dzn962z23bj\\/0VexfquwEHKc4+QIamS5jFHeV+TJHl809oH6inn4Z\\/pn\\/AOb\\/AOZo1OPU8jfdaAe7Wg\\/9VY1ddT0PpFOv2YPPi6T\\/ANW5GbV0akwaameWwO\\/vUB52P6MZH7GYchPQynCP8v8ABecxeiYuR9HJtPj7Wj\\/vzlpUfVPCOr8u0juGtYPx9y1m9Q6UwwGjTj2gBSPW+lt4cfkJUE+Y5g\\/KJD6D\\/vWzDl+ViPXLHI+df901afqp0do93rWebrAPwYxqtM6D0qoeyt4jwfr+RBd1\\/p5+i5\\/+aUF3V8R2jbXN8RtKjI5mW5mP8ZkB5KPyjEf8VuuwOmNEP9QAeLv\\/ADFCOB0c8m34Cwgf9DaqFmXjWTuydD22FDLcd2jLmf2mEfwRGOfWcx\\/jLTlxk6Y8cvrB1fsXRf3X6eFjv\\/JJfs7pTuPVHkLnD\\/vyyRih59ltQ+cfgpO6bkO+i+t0cQ5Iwr\\/LSHna4ZL2wQPlwv8A\\/9Dg2At855B4hO1kH+KIGIgZ3WyHOM0OzVOa5EgaFHFak1kCOyct9xqGuUwYGnxV\\/wBOajxG4dteHKBpSpXuM+kdb6l0cubjFtmO\\/V+NaC6sn99kFrqbP+EqXf8AQurYHWqLLMaqxl1G0ZGPYQdpeJa5jmfztLnNe3f\\/AJ687GOTMdtVqfVzq56D1E5Jq9em1no3sBh2wua\\/fV+b6tbmezeoc2HiiTEevp\\/WXRyQMta830dldsQ1orH8kQUjh38+o4j908K5Q6nIqqyMd3qU3sbZU8Ajc1w3MdBWR1brD3mvC6TcPXe8bshrmwNvu9Jm79HZ6n5+52z\\/AAazsZnOXDEV+8TtH+82Mvt44cUyf6oHzTPaMW63En6TdUQYje7Vln6wZ9TGmzGG55LQLWkbX\\/mh\\/pOb+j\\/l7FVw\\/rF1kEnIpGRBNYqFewh8bt52fpHen+ez\\/RqX2cxBPp0\\/rb+TD955YED1a\\/1dv7zr2dKocZIBnt\\/uTDpVP7gj4Khd1rrlRZa6mgUgPa8w8NLwdu5wc77RW2l37v8A6rrYn1i6rVdXdnFmRivOx7agzTb9N1Xp\\/wCEb9L\\/AEdqcMecixIGunF\\/zf7yyWXlRKjEizqeHv8Ap\\/3XXd0mgjj5QEB\\/SKO7Afktut1drGvqIexw3NcO4PdIieAFAOYmOpbJ5TER8ocL9k1jhu38FB\\/S29nO+8wt01k+CgaD5fenDmZd1h5PH0i4Dumu\\/ff\\/AJxCE\\/pc8yfiSuhOLPcIV9NVFNl97wymppfY88BoTxzJ7rDyUez\\/AP\\/R5FtUj4\\/RPiUgwgAR37cqNeUGN9\\/vLfzdAfj3U2ZlT7S1w2jy1P8AJP8AKWoM0eujRly8+mrMV6jkjupWQyp1rgS1oLiGiTA8EVtmPDSHAl7tgI4n86f5LWoOVl4ldTxvJ3tc1m1pc0uHIa5o2o+\\/CyBIWBf8v8VjPLZaEjCXCZcO3bhv\\/pIa\\/t74sazdUdTWHMjRvqd3b97az9P\\/ANVqyG6AwROsHlAtzTXRTjVtAdY1hsyANK2O+lq72vs2oj35eFVYy7Hea6mF7Nz2bmS91bW2e9z3VfR\\/Sbf5CqcvzUozIzSqM74f7zd5zk4yxg4I+qFCVfu9v70WexN6cdlLGzKL3CR6bHbQCTLdzvcN3+btVl1MaRBnj+CvY80MgPCdtD0LmZsOXCQJiuIXEj1Rl\\/hNnpP1g6l0thx6rHPw3GTQT9En6TqHH+a3fnM\\/mrF1eJRi5+JVnYtIuY+QS5ggOafdXZXLtj2\\/vf8Aba4oMB7aFXOm9Q6h0q71MOyGP\\/nKne6t8f6Suf8Apt\\/SpmXHdmFRn1\\/r\\/wB5bGYJHuXKI0HXg8nsrul4doFlFdmM4SC0E\\/24n3bVGvAZW9zpJmHMdy4OH8oqGB1\\/C6i3aWmjK\\/0TiCD51W+3c3\\/wRFblXN1IDvwPzVT9aLib06SP7WcjDYkAPOI\\/7n9FHe7cR6hc1+6HvbWDA\\/N3at\\/z2KuOmPsucDWxzH\\/SsrIABA9r3N9z2bv6iti9\\/wBJ7JpMg8mD8f8AvinNTAHsaBPDwNP8795ESlHQaLTCMzctevj\\/AM5oYVGZh\\/oxUfQe6HQ8mI+hZU+st9N\\/5m5is29T6jW4BriWNMRvDTB72Oua925FdfsBLQCGzLXH2mVWyc7cB9nrDCfpl43gHwYNN39tO+eVygDffZaSMcKjklGtgPm+jP8Ab2VUS9v6w0Abq7C1sdp3sRD9bsBjnCym3QAt2bXE\\/wAl8+m2v\\/prJssy3zLmtg7mlrBzER7va1qo2YrmNDp3bp\\/BSDlsMvmAH900w\\/f+Yh8sjIf1wJf+hOxf9cr3aYuIxmv0rnl2n9Sr0tvu\\/lLG6r1XqHUTsyLpqB3elX7agR9Ha387b+\\/ZvUXhrWBgaD+c5xGs+G79xCeASSBDZ0Cmx4MUCDGAB7n1H\\/nMOTnc+TSeQkfuj0x\\/5r\\/\\/0uAqsaBvkF511EqNrjVYYaWl4EfP6WxVxZ2Gm2NR3Vl4a\\/HmRo76MnQ66\\/2lKSQQe+i8axI6x9X\\/AHzpYhaxzX1+nPpby7WwkaAfznp+n7v3VUfSLHEgwSTJa7bqfd9BrH\\/yULBedloHJqLfCNZUTnFpLWNlxkAngHje3+V+anRACyUid3Xq+r2VnZLMFllVdj6d7nbXBkV1752U+q979lf0vS32PV6z6r3Mrc66577qv0V7cfGfe0uayu92\\/a+uz0rWWVP\\/AEtNX6x6np\\/zKH0v6zX0Z1meaq3OFYrxqPVIduLDizW0Vv8Aper6z10NFtvVelYmTl5z8RzhZQxzX6ufUHV5Lsn+b35FrWU2fT2f4JUeZyZoGOvDAADbi9X\\/ADm1ijCVmrJdPpn1Q6Xg4LsTPrxs5otL23urLHhrvc6t1jX7vY3+a9yw+q4lGL1K7GxwGU1hgYA4uAJYxx2vsLn\\/AE3fnrr8ik5VbmPdZjWEtIspOx0Dc5v9Znu+guO6697et5WKHA5T5cxz2hjHPZTUWPddv9L9L+5sr9\\/\\/ABib8K5gnPOU5H1Y5GV9+KHqph+I4JTwxjAWRMUP8GUWt6Us1I3cbfipOYA1pbye3ZVa80usANTywt1tZ7mhw\\/NtkM9L9\\/1N3po9b7bzTXUwPfc4NbL2taJMGxz3H2Uu\\/wAFa\\/8AR2rc96H7wcY8pm24CybU6dYEePiFs4PV31tazMBsafo2DV0fy\\/8ASf8AnxcvX1drr2VWVGphkuc7SNA6t3\\/k1fOZiChh36O1aSQARz7f7KMuGQo6rfayQOxD2ld42h9RBaeCwmD9xUH2bjJAnxiPyLiqes4n2h9ePkFpY0Oc8OhuvMOb9PZ+et7C61i2Usbfk1m4yAS4DcI3D+2oJY+HUG\\/zZLmRRiQPL0uk4bjqomsIDOo4dhLa763lupDXgx+PkoM6thWPdW21u5pcDJA+jy+f3P3ULIW+2TfpJoWdE7qh8EKyrcIJ0HZM3OxrGlzLGloLmzuH5pLT3\\/kobszHmPVZJ4G4f3p4JY5QG1MLMZn52vkq12O1xk6RxCsPyaone2PGRCr25FUH3COeQpYykwSxR7P\\/0+Esr6Lu\\/Q\\/agI\\/ObUddP+ERDXhtbLXWmtv82HV1z+cYsAsLdu\\/938xBbVIHuGp1iT\\/BEc32QT8x2+eilIXA6E7eWjYqx+k2vt92UyrbubsZWHOGm7fut2\\/zm\\/6H5iqWU4jbnCmuz0gT6ZeGb4\\/lxubuVzGr2zBLgWH3CD\\/FBuYGkw6YndoNPxTxHxKyUvJNidNtvvFbN4eG79HMHtA3exzm\\/uLe6d03qteHRb9vNTd1pbXtY\\/aS1u6yxr2WVPdcxv7qzenZDGZzHudDTXEnT8xwb4\\/nLZryg3CoEnl8Q\\/T6I5VHmzKxEAEeI4\\/3v3m3y9USfwPC6N3ROu31EO61Z6e5zi2lrKhL\\/c9\\/tZ+e73LM6hgvqyraLsvKtt5debYJitjqttTa\\/S9rf0f0F0NWSX1Q0tdJEwSdY8d3\\/f1z\\/WbyeqW6iYbqNR\\/Ntbpq5R\\/DblmkJAfITpGMP0o\\/uq52XBiEo38wG5k59GK1lzXb3+J93f6PZqtelW51TC6xg3BpcHe6J1du2qsLWBw98jyB\\/ijMdXuaS90zodpj\\/vq1zihd10cz7xl24utocqirLuaX07IAB9J7myQPpvad++x35z0Srp8VtDHPLNxcanem9pn\\/AI2pyL+rtIPrnTSNryP+pY1WK\\/ScBte4x4Ndx8dzURGIFUa8eIrJZcl\\/N+EV7qcjIoFOVbZaxrXBrJZWIeA10sxa8dr\\/AO2oY\\/QsRtJb6Ja10yA5wGv9S36X5u5G9Tb+cI82un\\/pJ23jbofkJH5WoCEegrysLZZ8n71\\/SLEdJ6e2A2jaG7oBJeBvAa+PWfb9LaoVdLxq8n1hZc2wODmvDg1wjjgf98RPtA3amJ0A1\\/uaouyNsn3AT4fxlLgGxH7UDPl3EtvowPTMD1n27C0vc521pAaNxmWsb7W8JZOJh3E72bpADuNf\\/I\\/R\\/NTOskAt3uceYER\\/1SG9zzw1x+\\/\\/AMinCEdDXgj3c5scRrdrW9G6eeA5g3boa4fyT3af3UGzo+CbHWTZLjJ94j\\/N2Kw+xwHuJB40kR8fagW3OBOs\\/NPAit4837xf\\/9TiGtaPzWj5O\\/8AJpzt40176j\\/z65yqt9Pw\\/wCknLhPH\\/TVzh8GO9G9WRpxx2Ef9Sh2uG1w3wPAT\\/AOQWWDsI+8odthg6SPL\\/cjoPsWm\\/xdCnI2WNJJdLIgEDkR+cVaGb+iADWbhOugkEfnFh39ljiwF4B104PB0RvUeKwGgT2A1hVzjjKVlsRyGMSA9Zj9RAp12+4iDu3aeHLv+ms3PuFmY9+3c0hsuB2gabeCFRx77K6g0ua\\/cf8ACMYDH9pyBbkO9cguaQI1a0OA\\/wA33f8ASS5XDGGSUh1COaySnijEjqC6LDjv9oOx3mXEx\\/VrY9WmBjWgNskHQkWOBj+r6bVl1ZOUWxQx5B5NbbGg\\/wBovepl1jTq57iDoHOeCP8APFat79WkY0NnXIfthr3lvgbN3\\/orcmaNIcwHzmP4MWe3fEwXf2yf+\\/OTNLTy46djqgPNBjrs6XqNafotB83Jvte06lg8DofwWeS0DT8kJt7JAOs8wCP++paI4S6YzSGyX1R4FrR\\/35QszhEgs8gAP9qqMdUBo0\\/GHJWXEjRrSfPcD96bpezIIGklmVI1LR8AB\\/BBN+78yZ\\/O9QKBvvB\\/mnfIz\\/EJG3K1IDiP3SAP4OS4q7fakY77\\/YohwEgR\\/aBH4DchWWPadwBED97\\/AMk0JWXXn6TCPjt\\/i0IF17+4Lf6pH\\/fU4SPgowA2f\\/\\/V8993ml7lmJK+1y6nvTGf96zEkUOn79ukQkN3f8FmJJg+q4\\/T6utpH6T1I\\/D\\/AKSf9LpsmPw\\/BZCScPqg\\/R6Kr7Vt09OO+2d3\\/RRfd23TPu3R+K5hJAbqOz1Z49+35c\\/9FQG+TsmPKVy6ScFp3epP2jvuSEbtd8rlkklPWs9SfbM95\\/2opnvHyif+guNSUct+jLHbq9e3fu9u+fKf+\\/KTvVj86f5ULjkk2X0Xw2PzPXH1e0fKUK37THvnZ+C5ZJKO\\/REtju\\/\\/2ThCSU0EIQAAAAAAVQAAAAEBAAAADwBBAGQAbwBiAGUAIABQAGgAbwB0AG8AcwBoAG8AcAAAABMAQQBkAG8AYgBlACAAUABoAG8AdABvAHMAaABvAHAAIABDAFMANgAAAAEAOEJJTQQGAAAAAAAHAAQBAQABAQD\\/4Qy1aHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI\\/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjMtYzAxMSA2Ni4xNDU2NjEsIDIwMTIvMDIvMDYtMTQ6NTY6MjcgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdEV2dD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlRXZlbnQjIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bXBNTTpEb2N1bWVudElEPSJFRERCQkVCRUJGODU3RkZDM0Q0NjNCNDlFNTI4QjNFOCIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpCMjc0RjRDRTExRjJFNDExQjUzNzgwREI3OUNGNkIyNyIgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJFRERCQkVCRUJGODU3RkZDM0Q0NjNCNDlFNTI4QjNFOCIgZGM6Zm9ybWF0PSJpbWFnZS9qcGVnIiBwaG90b3Nob3A6Q29sb3JNb2RlPSIzIiB4bXA6Q3JlYXRlRGF0ZT0iMjAxNS0wNS0wNFQxMTo1NzoyMSswODowMCIgeG1wOk1vZGlmeURhdGU9IjIwMTUtMDUtMDRUMTE6NTg6MjIrMDg6MDAiIHhtcDpNZXRhZGF0YURhdGU9IjIwMTUtMDUtMDRUMTE6NTg6MjIrMDg6MDAiPiA8eG1wTU06SGlzdG9yeT4gPHJkZjpTZXE+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJzYXZlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDpCMjc0RjRDRTExRjJFNDExQjUzNzgwREI3OUNGNkIyNyIgc3RFdnQ6d2hlbj0iMjAxNS0wNS0wNFQxMTo1ODoyMiswODowMCIgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHN0RXZ0OmNoYW5nZWQ9Ii8iLz4gPC9yZGY6U2VxPiA8L3htcE1NOkhpc3Rvcnk+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDw\\/eHBhY2tldCBlbmQ9InciPz7\\/7gAhQWRvYmUAZAAAAAABAwAQAwIDBgAAAAAAAAAAAAAAAP\\/bAIQABgQEBwUHCwYGCw4KCAoOEQ4ODg4RFhMTExMTFhEMDAwMDAwRDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAEHCQkTDBMiExMiFA4ODhQUDg4ODhQRDAwMDAwREQwMDAwMDBEMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwM\\/8IAEQgDhAWgAwERAAIRAQMRAf\\/EARIAAAIDAQEBAQAAAAAAAAAAAAECAAMEBQYHCAEAAwEBAQEBAAAAAAAAAAAAAAECAwQFBgcQAAICAgIBAwMEAgICAgIBBQABEQIDBBIFECETBiAxFDAiFQdAQTIWUCMzJEIIYCUXQyY2EQABAgQCBQULCAMOBQIEAgsBEQIAIRIDMQRBUSIyE2FxgUJSEPCRobFicoKSIwXB0aKywtIzFCDhQzDx4lNjc4OTo7PD0yQ0QPKEFQZQdGSUxNTjRFSktGA1FuQlVYUmEgABAgMDBgkKBQMDBAICAwAAAREhMQIQEiIgMEEyQlJAUPBRYnKCkqJgYXGRoeGy0uIDcIGxwvLBEyPxM0PRU3ODkGOg05Ojw\\/\\/aAAwDAQECEQMRAAAA\\/N\\/vccpXaQqYC\\/aO508PH5+vHz9CSRBYBwRZEGiCjLrj23d4Xt+r5xSw0o1GAgwChBgYABBgA2o4AGEQYCABwAMBEAcABAIFIgQAAIACIgFJhMKDImJsSckAqGBySNQgECJ0AbEspjAAHYkAVkBwZKumowDiZKAoEIMAQABsAAAQcAA4ihWQIAHAgElgKIECBGoBHEiKBEMDiKHTvmr5vbl09LDpujXTG1k06qybsmnm1c5dcqajNeauSqumrZtlVksoWhKipoCsmrpt1YFTUsnbNKxQebcbKnimHBgCP8d+n19zXDizqzNOmOPHfVpjgx6acbiRoIowJkQbZqIjC0FXuvQ+e7+vmin2NOCCUYbAQAAADUYCDUcADAAAODAAIOIgAIEAiIAImAAwOCg4ARAiIwgAgEIgARQAONREAhAYUCAVLhAAoDiIQUAiYFGAAEYERo2AI4IDgAGFERhQRETARMKAwoBSIERAiKRCAQgiJ0ELEmQAgXTp0cenoY9TTVNTaq2Z7NN2q7Jq6dLYq2bAqbh5asrqUc0XFF55Lxy6Zlzg0wJWnPXZns86VVFbmBGlB5u6bsm6KhWmHU5RpprLpkR\\/n2\\/o+hpjzJ29G+bLrHPz6EVcnh64ECNlyQA4IsLIIA7SptRY4RVu2w9Tt5PpOjyOjfGG4EADA1ADAAIMABgAMNgIACIgEIECDAAagEwNRwAMBAIBACMIQAEkIQIAAgQgQCIgBEcEUERFAIoECNwIESgQIMMgQIEADgQCIhAIigigETBBERAiKRAsYCkQAiECBA256bMttmWl83rz1056gNE66M9dMamWjQYRQYBk2TsVwSNQTqiiukUq6RTYcRW1om7I02Rroz1ZMjoqFEAYaNBqpzRU03mELSsiqrSC\\/PXu4eP5\\/Ses\\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\\/vPN4PWXMLyzXjl0zy01Z4c9jmG\\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\\/p+N7\\/MDbNVTZacVKsiIqlTBGEICDDCAQQAQcSgyEagWk\\/c\\/E7vrnj94TKZAMiCEAjYbIYZBkMiBBxnP35vGeh5nv\\/L9i2aAQZTgRgEBEcBHDqinAgECECBGQAAJUA1AABkEGMIJlURQcQWFBHAgQIghBwAyARKEGBQAwJBkaAg0gLSUQaUA0AAg0ADQBGlYogKMAgAaABkRAABoAADFEGfkb6HkgIUwoAB2i0UnaYQCApTuS0QYmxqqaQcTsJZpBht3KjjIh3NhMYRKUioIucM1VNel4fR893eZW6IKNCrHFaqACgIgpSpkSDcECAwQCJRhNhWOUY4vovmdv6O+c9WKoiCjAECAQKZAjIECghAjPhv1fxPlO7h9x5fset4O\\/dlv0+fo7HL2F1AgoAZ5D0vF5fV53c4\\/WVVyOnj9Byd\\/pOD0IqIAQajAzy3f5XG6uD3fkfQOqgvNd3ncnfGPP5z7fzXTw6PqXgfVeg4\\/QiZQRhhFEQI3EEIBCJkQbUUACVitIJGhSDFJUIwCABgFADQABBQACtBpQjAJQVqBBAYACDAAAMAgP8ffR8LtM0qZYEWOVGRWNETCUajdzGBOxwwmCpVAckjjQZEVu3ERWOQ0U2JIqlZY5JSQrref3cj0eJW2JcSoUqArcHASadyiAURRgTgAYBhEVZREWRGt47sdv0p8363rODtUAEGAjRCAUyBBkQCEZBRr82\\/a\\/nuTbLVnX1Xwfpc181lDRp1Ofq7XH6PY5+vHrh5b0fG+Q\\/Q\\/NR5VG6vHXMe18r6T6B5Ht9nj7fPdvD5vt8\\/j9HL9I8f3eX08XyL6P5Gql6zzPc+j+L9B4H2Pnfm3s+Ire+FVWTy9c6+r832vr\\/zX1sGGQIghAgQCECBAABiiAK5UAxXIBWgyBAAgEFGAIAYEoEBWlAMABgEGlANQAMNKAFAgynAgAPx59N5lZTuXJDcTjUEwiDk2khoOgOCUZadJhM0BqOJXVFSuAQUGaYSjdy7UkZyhQHYoUro+Z6vJ9PzWqQnaQB0q3aqLYkNyQA7VY4mWgnGMIhWURFBEjcGROp2PH6d5fofdvmfeLYTgoBAhBkGQQgQUa4vZwfL\\/AHvmPNd\\/kV1XoePt6\\/J3dbPWsnLrzYNsMlah8+fTn4HSqGdPPPla6+h4+pdObTj2+y871ah\\/Nvb+ecTxbk5qzx6jpd7m6sGuPN1khFPVzvBpl0M72ZrFo\\/r3zX2PrPO9eBAKI3AiIECAGoABWKKMAgIMAASsjUHAAQUAABQAAYBQAECAGKAJDFCNAcQRsOAZbDKCUUQPxh9d4dKYCxzG4J2oiBBBO2pscKMgRBhBE7nEAigVq2E9SqajIEStlDObCYywkMCYTYXf831PO+n5gbiGSakApLg4IFEUSjGCpVAA7iFHc4pVEFKARFZUEwWVDJfXfG9H7p839DEQUoAiEagiEFAIcfr8\\/wCV\\/R\\/G+Z7OLNVdnn2W8sNxsy39Zxd90HM6Oflax2sOi0y4nTzcHoyVgK6\\/P06pMFxzNF0c9O3z9GrLfo5bcvbDDtglY+f6ubRnXo+T0PM9vBl0isrXBVSBLNXTG7Ds+2fL\\/adzj74EYAgQIACAWAIAEAVkEAAoyIDIyIUA1AA45A4BAIIyACBBAA1E4ECDKCEHAAAIABaFEBfjL67xUUFigwnaCdbpyANhELXEEQYSg7QG7iDA4Dk1lQLCaxkYGWik7UaKSjdyU4Ch6rg9HzXoeXWtC0AV05EGiAVGETCABMDRUSXCCuqK1QbcmmbA6yowsYRJuU\\/dPn\\/b+seF7AEKUFAgoBCCjPM+j4vkfV8HnbcvO35lZ1OX0rk+B0+fy98\\/R8vXoh5dMefrnx9o7\\/Prpl8Hq560622F2+Xq6ePV5Xu4a3HWw6PTcPpUUFPk9HJz9+Ts8+\\/G6OfSl6ng9XzPZwdTHqocur4vX52DXC5TBdLm9P7V8v8AadDDoIyOIIFBCBBgQCMDAAFAgQAKDgAIBCBBkIgDIQIiMViigAUCMg4gAQDAACAAgAFaDnzHdwflH6HhgXEqCA4rHNJbJFohAsJsJrdOINEHEwgwgg3cspUqAzlxUmjCAWEhijVOBaSxEnX0XF6Hnu7zI1GQAyDIiERWVGiJCmQibCA2Juc3E2JYHrYTSrUbNUllgQwmFap\\/U3x\\/0\\/oeXpgQINhQZRh6Obyvp+B471PFZTzd+TPUNPT9S8D6wh5\\/s8\\/zvd5ih67z\\/Uz6c3j\\/AEfL52vOrfs\\/O9PzPZw8nfKB2ubp9Hx+hyOjlzXNQbY073L1+T7fN+p+J9T0Ofp5nTxcbq82m4832+dmK9Rx9vg\\/U8jtc\\/Z6zzvX4fX5vE6\\/PzXnrh4Lr1Pn+t9e+c+x146wIOCg4ACCAQIEAgAgRgABAgQIEAoI4iAQg4ETDkDAgEYAgAABCBBgRCBBgIAZwOrk+B\\/XfKfPcvVcTiYVAMJmkG4oiMYVhFgIwIuaqbZK1yg1YwM5ZKwKSiKxyQpVO5IQFKDTpQGEuXR6Tm7PL9HHZtgzTqUqlGRMIoKS0wMiWWBsShZacm8i5GA1AoMBGK6QYREOJmvs3hev9n8D2oOBBEIBZ8a+o+D5PZ51Tm+Tn7ZaI0sT6XP2e38n6Gi5Sss1xHDKfP8AVzLeHN2x6WHR2Ofp4XZ5\\/P1xuz19fwet5jt8y\\/Pf1fD6ujPo6WHR5zt8ru8npbctuV08fmu7yNUb+d7PO5u\\/LyNsnFqm\\/RcPpbc9uR1efx+jj6uG3J3z6nP3e\\/8AI+g149HW5+so6fP1EcQQjcQAIAIBABAIAIAZEQIECDiIECBAgAAyBEQAECBBwIBCAUQIMABVXPwP635XzXoeP4zj+jgkc6E0c1oVlgmc1luSRWCsFWyxBEtMickiQdjQADgrXIQwoDk1FAZEwBuNRDibn6\\/RY7+a35htzs5DpnMQqbCdpWQaplgkjAhhKOAWIMJxtE7HEQWq3aSWNWE1lWTf3\\/5z2vpXk+oE4KNEXG7PP8R7HzfF6uGwXM25+hjti2y5evMTTs83bqy1jYDp8\\/T5T0fIqce48z3FIw7Y6Y0hPI6eOlnd5PQzXktG7Ds9l5ft5rjVF+c7fOovBh59MdWW1OmWDTnS1x+nix3jg1z9ZwepxOrhzXnvzvLeWDQ6eO2jPo975Hvdzk7r524PTw+p4PT25bhOBBwCiAGQIiMKAEZEQIEABG4iBAgACEHAgQAOCgAAECBAgQIADmdHN8j+j+X8N6vmajLwvH9OgmFYBFW5AIVa4UYFYKwGSqYwr2qgDGSZpB2OWAAEOF7msCIBaTQXY5gBJSix1NPn+z0OTuyaZW+t89XQGKNiSgtMIsAwEQqYAjdwpQRAIlGGwOBEFoDVMtXkQSFJN\\/R\\/P6\\/ufzf0Fjz5\\/RyZN+XBty8zfmorG1Pl9HLy9ubbnt0sOnt8npNOvn+zzqryqZTeee8MOvPdNWFdPDrgseuNBGyNunz9fV5+7JrzMtety93d5e6tGfTLBtz+e7PN7XP249ObBthcNovJrl5\\/s83pZb8vXl9f53sc7o4uZvzcvflx3OuNVEXP0PxPqfS8HqYNufx\\/pePU13+Tu7XJ6Pf4+7TlvGsG3MoOmjWmNGVWJpU2RYGU4ECDiCAGQAQZCJwIEABAgBkCBBwUDj9PH5f0fG+YfQfL8Lfawip34vi+hvC0EBkg5DmscasSrGWtCNRWBwWiBJLHSgRqDUIFxLjsQ4ZqghYKAzVQ4moEeTl7uX839dj0xYfb7vK6\\/ufN0tMAFALCDOQmRI6EilM0WiEAJQZSAw2ACYBxQFGxMCABwOzjf2LzTRKrqbZoi157FUyfG6+Hoc\\/VYqzXn6Tg9rfj0ZnPN6eTz\\/Z5nN6OQOedvyoTYr0Rpux6M22HS5+q+b6HP25NebLpjbn0dHDsYXQx6tGdc7p5cl8\\/N6eTh9PD6bi9MDsz2o0y4fVwaJ05XRxdTDo5+3LmuMemGTXPp4dFbnRG\\/wBR8D65pefTHFrlWLqYdHI6OWvTHNWWfXHTltpz6BRdFZ6zovPnb8nf5PR9H5\\/rdnk74qgQcCBBxECBAgwECABQAEYAgQVGmfyr3\\/nfDe18xeZc2ujM9tqwwV0eT4foGAgRWAgo5VzWCtkGEUtQs9EScVw0C5EpKKtjEwexNQAoTXSgWAROFQQVK0xc\\/Vxvn\\/rOtw+hzenirsuT7XoeN1\\/c+bzVKpwC1ERjEuIApVaqA7kgoMxRwIERAUZQWlTYmDgAIEAM2zn9M4jt5Tztefp4dUZ2uTu15649M7k+F18Fs6d\\/h9L0fn+yw4GDfm5HVw8no40rPPeV8aa89tUX53t8+tz0MOnsc3oVVndLDWO8+X0cl+fRrz3pvHJrz5tM8WnP1ebt53RyMqRlNZun1efr6OW2es8mvPnvPPU9DLdXGTXHRl09Xn6+tzdlq0w64I52xpx+nhrrKis6nPa5vTujTi9XB0MdwLm9HGB3TXV5fS9X5ntast4nBQIOAAgQcCCAQcFGcro5fIel5GpLhdfHg0y8j6PlreG+ebmaded61jgWi8TxfSRI0Vi1KrEWjzVmCa2K04RJhIxwgaEWjz1Lp3joeYagaFTBCUaZIgjLBhyqKi8GPV5bwfo\\/S+f62HbGyNK9clFYjs+j4vX9v5rLpIQ4gNQibVJFJYYhTNACgtFipgCABRxBAijAqgiEEGFEYUvRZZ\\/U\\/N2vVdbl69Mb2qs9Zc\\/bCus9Eacno5\\/ceR9D0OfqDA1k0ywb8eXTDHrjdN3xSs52\\/Lk0xzXn6fg9bo4dnP35M15VXOW8bJv0vB6zJ5NMeR1cevPfk78ebbmy3nl0wjVVRfGnU5+y6dMmvNztebi9XDTUdzm7uXvxlHT5+3fl1ej4fWUngdvl8vfk0q786cM1xvw6tuXT0cunLeUJya4V1NFY03Pn+ri9Nwet9H8H6vHpjk2wzVn6Hj9LVn0BACAwcfp5PFep49WnPl18\\/wAF6vn06SAImAyma1zjzL60bgAbE+Q4PqKKUJZlqGTvVOLmaZWEwI0QiQYwkHpC6QNhojRyjhB6ZLh0VJSsHeBTRoizBzcurx3j+\\/6XzPXFzmqNGWzUsmuOibtzvqel4nT935iioLmDJKlM0suUOKIDagyRErogBBMsCAMAALIggAIK3EmCBGtan6j5nR7Th6bp0tm45yXm6eLXGCwa4+q8\\/wBd5vVntfGuDbnz6c+e8750AEVTiu1TUac9ejz9lN54dubNeZCxMCx64Z7i6a63N39nk7+L1cXmPQ8nHrzK4qqFpdPm7PV+d7Hl\\/Q8jl9HHVWWTTDZG5Ri1wdV6jz\\/Zujbp4dXF6eHk9PEHBJya48To4nb247+g4\\/Reb3575NMVccrfk5vRz5dM7ov0XB6\\/X5+zzPf5O7HoyaZ\\/TfA+rxXly+jn8528PjvS8hbwptQUCp2wrZil3eptUbp5+Lr3MSpVbpiayvI8H1Nww5Rp0gEZrmsd5hw4UCYVgVEhuCjLk7UWBU0BO1WAFtV56i+QjuTSpZLHRyeTv8h5nsdbk79mWufSJNEddZ6p0z3Ea0S93Twdn3vl315iEGqcaR0UiDCLAEQwlGQjQGUQAyApREEACEQGwBAtQIIy\\/o3Df0\\/yvRsVYNsCnnvPZGsQQKLp0zuenh2K5dFdwBlEQGkag9EaKNKVF5U1ll0xAa415W\\/Hl1y52vL0M9+3yej2uP0KqOZ0cvH6eJaz5u\\/Jozv13neztx6\\/N9\\/lcjp4c+mO7HexPk9HHGrIv0\\/n+1y+nj3Y9V8acvo4a7jBtyc3bl7fL6IFy+jk34dFqrJpiGsO3OrVsXj1xRz0sOzNU5tMMek5LKmQCwABxKN65hQx3pbM9nLCybWs+deuS9KHbJRtiQPxfD9VYWwmEjkNIGtUyMd51kaERjhjqWEwiVYJ07wqAg5MbiHFVU2yyxk3EjkD87y93kfK9vqY7\\/Qvn\\/ouV6Hi+48b3+lJ4j0\\/I9Fx92mNfCer5PY4+3P7niN9P8ZTeVbZEwKAGEFjiQbkqVAYUCJRuBBBsIA2EoyCgE2aIlbVUROkGOp+t+R6f1XxvXraxbYVVnmrPbnvl0x4fX5\\/Qx6vRcPqFFOmVbmtzVcQkllKMUGTyaY2x0Wk01PN25MW3PW51TpWKu452vJpnbv8XpWTWvPfbl05dMaayg9EaQdk3m0wya86uQKm4oqGErd2elVzzt+UI35dFTnPpglrTlrlvHmdPJvx6M2mMDr83bVWfD6eFanNeWiNc9rjdHPTRAgQA3ZJUyxSB9GJ51vdnWLVaoiFUtZL2JMGEBsCUrwfH9NeXqV3oAsV5xq1VqTKeO8nECbB5nIc3q7hgSsBF6edzYnYMjYmqpQnZNqO6XnvOxPn5dPkvL97Rlt2\\/I9upV1sdt+V5tsLoepacPfG6c29Ty+l9L8UlxkrNALFYURMuYAG6TiQqtjCKIwjJKDAyyJBMNsIBAYQGoAGEE2F3cN\\/0V8x9Hty1Yqus66koI894hqydMumV8UlSolaRytICIAIAT0Rtk0xslpc5rwz3nTca89c15AVWkWRoyMmuLFd3j9Lbju0sus948vo43Dqc3cVVNZ1XjRplS4cFbRzVWeHXF5oBRplz9+VXFbl1SNEM95dDHpovPPeNFRA5O+WXSFagwBCIVkGAgQCkBkK22AAQUYBxI6UAMI8Rw\\/Y6seizXnNQ4qKil56VYC6aDWS8bkRhFkqdCdyYaYYc0EWoJWgYBHIFU42zooryqiA1Tj1+W8v3znt1\\/H9vVlt1MqrG6LYujTPm7Rm0z1dXD3vqPhUqHcc7TOtphKFgIgiYGGQUmFI0G4ggwBIMZNWI3YkQAFECAGKCJsItOq9HzdH3H5\\/3e1z9DTVV5wCFVRXeaCVzz9ufRGurPSsS0lcgQaYYTdN5tWsG3Nrz3glqa6QJgsWmOLbnum8mmSVERFfV5+u1Xvx6dOe2LXm5fRx2zfd4\\/Tz6YVVndG2bXnz3lBqGHbmdOistUbVtZdefLcBpHDKw43Zb8zfl5u\\/IA6GXRyN+Xi9XKAgwECMgBOMAQIOIDIEAAQgQLZglZatWwgh4TyP0F8ejXOl2vPn7PJrc6WgLTNhqBnvFGtCaMBNDjUqRpwzub0nTA3CxW7mKM1zenQ4tTYdqObHXxfM92rn6fVeD9Boz13yZXN0a2k0aR5H0uHh7c2LTH6TvzdH2\\/lcevK4Y6m0KI2uvBWrE4hcOu7XCi8rU62lGWMgoYK2BhQAiRHGAABCAoBgUgotFGhafUfH9T6h5PqOmoEA5qvNWgkGq6nn7YV1n0ufqjEaDkJsN4tgsVVVHlPR8bvcnpac9VEtJHJFlvKqptmmTuVAADjCTKgzNeV6tpFAUt2HVojbFtzZ7yKYclCWmllpUXF1uKKnBtzc\\/Xn6eW\\/m+vzennv1MOnj78nkfR8nFpmQgEEbgQAEHAgdvm6d2W6teX7eBR6ZVFEErpkq3SDjbJAPm\\/ifpVOOu7XIqt8bN1+OejjvAqrAraYM1ZshZ11VjgvJxXKnZYqAiQSlZbnql5aUYrzDzA6ajXGlqMWXZ5\\/zvcGPR6PxPeXPX1HJoGoacnfLx\\/qeNw9sulz9uDTJWvofoePb7Hy1d5OnXSz4dG\\/TBKA5ZHnOD2vVTnV6HkkTFAKmlANXS6aVYWjKUHAZPNSsBkMEHW0giJggWlFP0HJ1\\/Z\\/D9ruc3RTeWeoFTYnARyUV1NNZ8vo5krPr8vbYrBNdDptNWTVdRl1w5u3Ner1Z7X56MUCUpRAaDmJgQoeagqbi1MJsqDmtzn0y05b9jk9EMVxl1wz3jGq6lkEKmc\\/bkxa4OHN35Onj19Pn6fGen4vn+vz0ckYCABwUYBxgCBBxF0vsYdO3Hbn78\\/H3wpZ3MNdGevI6OfHcV1SjIEIAD5f4n6Pmi+9rFVSFWzm6tfp+DCLSrU6gwxrhjp0vMuetfKumOa87UBmqdGRYJWFGSbs0wskFFDzZqhxdNuzLj2eb8\\/3Fw37fl+x1ePr60VlJo0XE7fO+d+j5PoOPt+jed6nguzn9RxdPh\\/T876H6fiz1vmnavmuVj6HofH9cd3n4+\\/yqLw4HD7nrucq9Xw8tRcXEKJWQQGQzuVY6bpwLGVCgWJgQbKFaIVMAnAjvmtEafRvL9P6X5XpWzauEEtSrmBnvKtzn1z5u\\/Jh0x1xpry3156vOrodOtgchzzt+XPed8X1ubtIKwDBKtQQYBMGW4pvPdltEV0rZoOa3IHZOmnLfp49YTqvLDty03jyeni8x3+TzOjjRx1ubswbc+HXCAGgIqpSQUGGBMiYbTdNwAKC1ojTZlvuz04fRy5tIIK3ZBdLqsopIVBwIABW\\/m3jfoeCH0Fps34ql0ao11ZbrnpR1cWi8ednvTDNTdHSINvT5\\/Y6POz65K4ASbsc6lVktGZ\\/L9xu3yk359NZo3RWTIImDm59fnPN9zPlv1fN9btcnUwWiw9PH869PxzF\\/RfJ9m2p+f93nfTPJ9f5163mCl9E9TwNfd5HPw7fCeZ73oPC+j6PLtfrlp9HzOTvh67ThzfQ\\/Jq5gq21clVBF1Elc5Gr04MMIlAoYGHBsgMUkMocqFoyF006ru8\\/R9M8j1fY8PYR11C1IRXUczo5ebtyUaZV1EBWijZl0aI1w6898XXcozNeKuCPoYdXX5uxioJGgFs0GwQADkNgTIRuxFbnPeSOOb0cpK2Y9HZ5fQ34ddF5eZ9HxvLeh4itI4DVFZhlbgAW0F3OTvrpcTq8+Aw6anTnpm0gEgcCAG9uemnPXlbYV1JADA4jsY78zXLPQGMTEI6IIP5j4f6S+mOXn6u\\/2cGYWfLox8\\/W8bHXn1hic15adDWceZto01PX6OOdHDYga8+fO9GuRU6o0x4ehzfjfvvTZZ8z7v86s25r8ujPtzBSQJXMnp4Pnezky19x43vdfDbNth8y9XxORpmqW\\/Po+jeF7SdnP8\\/6uD655HtfG\\/a8NLnUV6zt87yPP2ql1uPs6\\/n+qIvPvldfLfw+n6b6n4a\\/1\\/nwKioAAHGBq4KpWUOHTcairasBlTgUyNikJgs1QgODBYnanYqoc+14e36N53X1ebtZMOSHA7POy6YVVDJ2za0q2oJ5tXJCuptmg1BIFk6dTDrujQg6cSWkAAqqiqoWiyXRUWzVdSRZrysHmvLLpiji2dOtzejz9uXhdnlpWdivXlvi159WetVRk0xzaYsV1ebrzXMc8no4mT1575ry6\\/P28vbj5++CiKcYEdHLpvnTl78lNQowEGydbQbCBTgQAOCA\\/j3zf6lt6uOnPTZG3T6eLAaDPXNnQjaObLzy53FVcrp7xvVZajbtj1nlnJt4O+72Pna9ee+NfJ+J9d2PnfpfU+P2cr6b5vR9Z8Rj4fQw59FLnn785HhjXm473zr7jzPWedfDd\\/j8PowWVdGuidff+V6viPR8mgvrxfE0i0We5uVzTKCMnoOP1Ksdk1z9HyXw76Ohgev8ArPgru3y6KlWq3AABXUxFyvJWYasVuFDgotVFhRYaKSwFChVUqxkAHEUOy2a6Od+84OnsYaq56WHWouV08UC+dAKDrqEckAIBAgEq6aprNWoMqtuW3X5e\\/m9HGw6XN01XUWzolRZF57xruc15b8uhGnl8\\/o5KnCtV1Oa8kcq5gRiNQSkhiOUaIK06bzdN52TTKnVROnTPk78SVIQGKPflqxXN150aARgApgQbAyJHTyFlbEdfJvB\\/Td2\\/Lmx1MbXTo+2ODHStyOfq7DvB0cOPOkBpvsbZ4lW5Omp7W2HF8v2NPnd\\/oPY+et9z5vi8Xr83wfqOr5\\/pdvzt+Z3cW73PC8h18HEWnrOTo8j086ABBGgv6XwehztsvnnVxW1DhpjT0Pl+pox2+rfP+t4b1OD23ld\\/jPX87t8XXxOrH0\\/Pt8D+u+XdqsXoOLvxVVdZe\\/8AO6vNV3qy\\/Tm+gfSfCZuvzanJCpzY6QnLUXqqxUXNktkqqIi8YBk7SgO6XBhKuozXF82wwQBuDIdFq09Ry6+z4unRF11FVQAI45tz1SpDlGgKBB2zpux3x7c9FZRkAAU+lj19Dn68uuHO25Q5DTqqay25dDqsG3PbNWTeiNKKy5\\/RzVVnlvIOEZBQYYpMagKAarcMNWBzbGkDJpgGrVai6fP2crfky64I5UKLxA7JuiswxKQQG7ZdNICg4lCtM1npVtBtW\\/lvj\\/pCKMXNuk6NSadehHRVvxZsN7FVN86DqG0U030N8AzW3jin831NOeolep6eLxnTOzz\\/AE+pw91mb4voeXyu7ze508drHx28XcBjIg7yu95vv9bt8fyvTzdHbCxHORm5+npcu30\\/xPdzpttPkfR4PMdHn+\\/8T6DVS+Te\\/wDOmpRzqnT0fm+5yeng9vxPzb9J4sDv6\\/N9r9J8Dl6OSDgnTI8l5WIsnSm81Zoh56kt2TVVZlDFOnGNLsV11FFRfNKwpATjDIhgvV9HGva8XV2MWrIOBAgFEYjUFAIyntx6O5x+jn0yw7c3O35qqyI4GrPXu8fpJU8\\/bly6Y1XCkwZCCrckLoum45+\\/MHKgjmAypgrcq5RyQgKC1MAhBo0jh1RTovK2dL89sm2GXTCtoEo5RoppU1Oaahh3xpk0zRyBsiDtms9yAA1YB\\/J\\/E\\/SVRy+beyammbD2x06mYnmbwzxVIV507qyNO9o8+3Nky1nL17ubrDVF50dHHrnTXj0dTl69GVcbs4uB3+ZVvz3Z7dOKw0mEQirEr7Pk\\/Zcf1\\/jG2w6G2cDPK4ubdv6B4nucnW+hjrk1y816Hkei5NfWcnpfLvY8asGEWdrh9Hpcvqd3Pn4l9FSq2Ltmd\\/Z5fofrPz4VnTUOnaqpqKidK0qFRee6NFDJecAhBEGTAXK7E6KixAG5SOYkCY2U7QYYS0TfoOfX2vD1EUAog4NgQkNEbqrpvTltvx6bFby3VZdcsGvNl156am1VU4qvIqoKDjllYJRoiqqM2mMCAoRqIDZACVyGgCijSig3KqeaNELp0z3loz10TrmvO+dOT0cVNZ11JAjqcVVCuanNk3TU1OQ1ZNlPTO2S8M1wAVuAB\\/J\\/A\\/TIa8fFb6qy4eNtnD6XQ5e7D1+fj6\\/O59ZLU5crcNEb9HSUKqx2tx3iBcENm\\/L3k+tz7acrzaZcbpx4e3PzLjVnpyqnM5ZioIdLn7Pofzv0\\/nPS8PzHs+Tv1gszyYIdSO\\/y9fp+H0fO9WdidGmHK15Nuevp+To4fZz65uq89\\/D0\\/pz4v0\\/P9Bynv5frjhavldax6nZ9Hxet9P8AC13hBEq+ayVnaqYM1Rrm7JrJpm6cClzYmRwLlcAOVJg7E3VZ6zVphRNhuDy2C+b1xXuOHp6eOpCDgQASyd0286V1FNQ42VWxpom+pz9kQGVVlzejlw68y1LzUFpjVla1OW8c2mNbVdZwAIjVkFBkUGrhRBkSVga0TrmrOAtSooACC3Y9WTXmovPo4dfM6OPPeStK0o0qYhHFNZurraRyjWuNnm8emOiL5W\\/KSqnAGB\\/Gfmv1TI8rlWrdX83bZh00689nL168Om8fC9TxMt4Z5msXcvU3HJxNmfRdOu\\/Pf0CVknJ7vP8AQQdLn3vKzXlwN8eHtlll6C+E88cnSnXm6YOG\\/Hf2fk+xvg8R6\\/Cu2DVGOswlz5VtL6v4ft+G7o0561vO25851eZ0uff2HH3+V7uLLvh3OHs\\/Ynw\\/qUM1kLLtqaU+fhpxuh\\/J\\/wBO+B5np+NYDKrprPedbTBAdO5VEUXFiqpyobIoKqrl5otZ6ytVumBK0lQRVCuVVNap0IWzRFYj1nH1eo5OkjIRPVnppjapxojSi4gtEaU3AHW40RrXUU1F83h05jRsx6MumNN5K06ee8qqgBAARoMgQQCARgQaURBWoOE1kxgbVyCQODI7FWTTmedKqzSoQFaVoMKFaRqtwlTE2TYozS0semNieHTnRitIBD4X85+pLL0U79c9PN3JDa1lidfN2C538\\/Vzezi5G\\/maXWyzGRY0I16HP19\\/Lqeopz05Pd5fMrn0xeiNa6mq88tT1XSXGXG9s21SqdNxy876OO\\/O0z73P34ujJazp0xzPPOopJ9NxdnsePv8R34WKtUa0a8\\/E24N+en0jyfW8d2K+I\\/X3yW3hr1+jTjxa00ZGmp4Jfp3l8C\\/TPhvP+h5VyInGaIvDri4MmjViLZ0pqIEEoaJrTGwBh0VlVcKCtEQSYSUIS5UScpkMO5NgeTrY7+44OzVFQCDKigMvjQDKEqNMbROq8sumMCCVqDui7ZvFtz1OEqYIAGmQrIAcgIiNwUHBQAyCgwBFVUgTFqQjhWoMlKKuswCNRpURyrAJBJUq0oBqDtm0cAMuuNbUHW5g6nCtK18F+e\\/TRL2PS2dimwVQVIKbxTPSSsfVxHTGpzJpUtRWubeNrCb53v25Fpej5t7Q52uXPDNcU6Zi4Tn0uZ57TPbFY6nQX1ubp68Xl1y4jddOxVKVDnJOW\\/DT6j4PuUXkrlqM8PHvPPrP6B5nZkdZUfRMcOppX0Lhz4XRR49O3WXia19s8fgv6X8Nwe\\/y2Ap3TVs6ZNMc2mOiNCAF08ejPc4dOe0upzdNOn0MenRLw6YrSxa40uIi0GVMmrUaZXCYkaVs1YmU7E7ov1\\/H09\\/n2dUGoEGUoOAGiACAAgowCVqsmUgAFBAAwCIBjpo0AAnTSpCUGRhhQCRRAURQGw0BKyCAQdbzjEchAaDFaAlcoFdZkbKoOKq6yqc1VIaDFErFCuogfn35z9Gru9EVu3q+k03RhqMOjD0cIi+nh24debB0cWdxaq0tYpWlVus686Zg1S8O2G3PX0mW9AsWufMrNnPO0y1OsEVkcbYvusZXnz09Px9U3w5dznqUl+h8bv9b5fVNT5\\/35ep5N\\/f+b0YNcu\\/xbcfry6+CeX5vtj675sJo8dLpEZcddm2VNIodVxLO9K+Dfpvwnn\\/AEfLKV03fN2FAWDXnumtM6BHVx3w6RTeWa8q6l1VsV2+Xu5vRzI5Rqi8qazsmoAZbNq0wWzRTYKaysLhNs1YmydiOhnp6vj6epjqysiVqBAgRoAQUA1W0CSNSQyBAhIHGgICgMVEEddQ6sNRJWQIIAGAQagoAZAAQFEGQFcwYaUkBXUglQDQaMsukJDSMprMDgkco0oBpWAEc\\/nX539ASzRVdDTQDFZ0c3QI1iVO2OzLo5e3HfRmURUHKJXzfdjb09PQLBGi9PLkz27GVCp42k46zuc8rXLuzdCdDTjdVszvv8vT08dvP9PNncVOt2d\\/RPB7\\/pHj9umY460befhn0\\/m+28ff2Pj9\\/wAD+l5fZ+bVO+XJ2v8ATPzoNRriQXXKxVt5huvOnZKn4Z+kfE8H0\\/KVzfGjjVK4qmoBOudaxXzXRz05G2ODbmIWKt+W1kXW1VedVyjnO87y4kU0Y4FGqNL40IZ9Mq3MDVGqOWCEq5ul9XDo9nw9dycHBQCAEGKCuQyCUllS1MQQAQIACUgiJuBGAVzBgC0BAIxRAkMAEAEAMgKSAjcAAHIBKmAgoCtAkpkpXNNZqxBLUAaNASUoqAK5Rlbj82eB97aneMm8uKlSOb89r8t+3xerbL8v63gTTPKpAOCOShprvLT1JXlOnkri+1n0elw142+OKpzOLKnLcdQrmSa2uc52K9efR6Lm6PR8+hJ8t2edXl3ap19z4fV9O8jp+S+hl3+HX1w\\/h\\/03ne98bb3HD0\\/lX6XH2PmdHP6+blaafr35eBq0TrRfcXE81aWouavc55v4p+l\\/B8D0fMLCK+dAk4MOmoZOwcRRUxzdNVsWorc78t9Od5NYxaYWqwK6HarprOmpumrlWS89meqOa6lHOqNO7y93O2wzXkHFbi1Vpz16+O\\/rePaxWQDQEjUAjUUCNARTDmDIAQFAAM2pMGyoOVFAIRAoAoBTVuEwQANQAMjDlHIQRhiiFJRK1AVqAAIgNGkc1PNWASuQNWKTXSg42pNDgM\\/Mfh\\/ea4vVFZdlA0Z6MUyCXpy6teHT0Ofs5fb5nD7fKpIQVqLFVjetV12698cFrtc3T6PO+bpnymlJWo4NR1Jvp0slTlmu+tBFeh5er0fPsBfPO7h1rS+dfqXz3ofTPI3xRbSczd\\/Lff8AP18q+u+D3crm6d+merXLx3oz9D87ObFUtnM0m+Dz+9Y6d9RtwFvT4l9z8nn9fw7LxIkcsx5qxVTUhworlcHU40TZHW889z0MdmVZdM6LzsVwixVsy2y6Y01FirfjrzN8r5oE0Xmw74voY9BTx641Vmrlg2ZbaJ0hHoObftY7XJxKMgEcBRQICuA1EQZAABQCURQFEQg4EFBilBAIEACgwIAQUIwCVyRqJWlaVkBWgkGgAagAEc1VnBwtXKtKJXKCRytODQhBBn5n8T7zXFo6WpZVZF2TdV5XTUm7Hp0OTu1Z9C3lwPS8XnVzlDjI906dG3l351R3cOn0edcbfLjubU45ya59KNL00vLjTXoo1sk9Px9nrObatnn+jnpdSK914vZ9P8zaqa0XFMVxM9FxfS3x8jvWpHSrHy+z+k+Tpm2nWnydp5u0et46xdZjLtI6048a+r88fVeV2ve+THRxLUqKObptkwFblKhgtjQUmlq0wVUr4pyqazqqGKRyUWy1aVpHPTw6cOuKUnkVita860xvdNZbyS5rcBzbNWTRHYFsvo5308durlevOkYRACMOYECAQUQFBQbDhQEBEAECBAI1cxgFAgQAJWMmogwCAK5DSNQSsABiiAgwEgcYgq6iASkFGIKuoVqDQSiWkglD8zeL9zoimeujPpS8SnmvEOeny98c5tMtEb257XQcnr87Jtzoi1OxhDoXa641p9\\/Hp781ydcPNuOlGl1TzLnYNxXiqm9Yt2W3p+Tq9TzaeY7ObxG2HsObp6cdHtvF6fo\\/n68LQ+e7X9G855s9fRac\\/wA\\/618m9Gc3Zl6bzdeJ1x+mfltrtoWngl5bGivk\\/X0VVPRcfQeTPsZP8x\\/a+X6v6P42nTHPSDlSLlrFMYokcLS0RtCUJuWgFXc3xYAOa6lRFAYRQIFiq2az3jTRaiydUrKD2ZbXTaOUc13FbgosKIAlh2IMkb2Q9ca9jDXsY6MnGigMglACIACBANxEACgCpicAhBgA5gQFCCDRTUIxRBoCDSiVgcgcBWgCsURGrkCUFag1aVpWqnCsZVU4VqtyrIP80eH9zuzrZl3oyyK43Z51bnVGurPfTj0VXlrx6qbjZnvk14cW3Jj1yiCx1Wi02sEfbx6PRxfG2x4jjXNG4mkLF5Kj0efRfJydcHx19Zz9XsePp8z18fynp5vp3D32zr9O8Lt+ich807cvj\\/o5\\/pX53sx8+\\/z76DzeNn2+eefWvPfhXF6p\\/QvyXXbpGvqypx017YeZfR4O3GtVRZhf09Y\\/mX7bxu79D8rTWcCqpBNa0JnoHTUujPUOFiuIuTUauXVBooDUAhRcMiybVwxaEpUXzootE6AVbjbnqROWpOXTNSWHAIBxVUMmQsTDVk3ZL6uOnreXothxsNBKBBkUCArAJk4Aag4yBBwQSgo6gQQEADQEBAYZGAQQrgMRqCgI0tKJhgQrUaUAxUQSUkaA1aUlKmlyGkAB+a\\/E+41ZW1XjudmeuW8rFbNVudvP2dXk78e\\/PZN3xpn05sfRyq5xXz2FRGvRnRKR2s+j0MPh7Y85jwyyzbKmKz1HZz2drDeV+W3s+Ps9bx9Pke\\/z\\/lnVzfUvP7\\/aY36vxu\\/2nDp8878\\/jXqY\\/pT5fu8luvAfQ+Z+hPnu\\/wDNHpRb0LbyvL05foH470UT6XZz5MtN+uD2uRdeD6KpisuevquWvnf6h8JT2+d5kfor5w5rH4Ce\\/wBXOHW05SDhW4rqLJu6aRqupum62g0ydqcTrLLitzJ3ZS9Z1ByI6e9fNA0zds1ztufvcnVVTJNFzl0wqDZN2zSNU1FNZFjqg0jh01FfGnoOfb03LuQAoyIDIEHBQYEWRECDgEFJDYIgyEVRwGQoEq0BQcQGgxRK4RogAAK0jUBWBoAAAgNWBpRKwCrcoIUKEHW5Rr81eJ9vozcsyWaYu+LzaZBPStCqaX0Obuq0jTltl056Neeu4redVSpN6vRqRz2I09DGnkdcCFyqlptMjLa55cPKJEMn6qdOOLn1Gttors5bfTvF9XIzzO8WZdHQyrs8it9Tg\\/Q\\/zvd4jj7cOhqJ5nbj7TxdcHLr0OvJIfV7OYUqVVM3c5xTdrPzB+m\\/N9VZcTbn6umK1FudeK2j1eV3XnbeWWXaZ9LbjvBgQXNemyK1PKi5cLJrAurlY+r2r8\\/PUZM+vlrX0OnlcV3xsuz1Ncfd15GT0Tee46\\/P0sjRFY9c+brzpU2KrZeibqqMl5peQAgQSpeS2Nd2evt+LewABAACQyIYcGRgRABBKJh1sdMEkoiVyAYuCQkEhkGHIEGwJXKiAiNGoNGhUqgMgKJWAaiDACtKJKlBAACsrcK3+dfA+3qsz2ATTWtXS5I7pq6dInvy26+Hbmjau8uZ1edRplReNbTodXodtrnuVd+Xyqjn1BmqxYKhWa3PJinC5pQ7NHJh3ps3Yn6fDp7mO3jLz38fYzq+NPrXzvd6R82Pl19riUqpS5Xo83pPE6+RhvruM816f0vPNTRd0528lG0rybfGvuvJ95OXjezHjz193jOO8\\/kP0vheoy69c7HFeP7PNCfWmfofF02q+V7Pgcjl9zfnv2b4uDvxbteS2X5Z92HLp72OvD2xzlSb2Pm4lKzPTsSvY9PkvUlMM7\\/J18\\/TMsYXK35gGiaZO5PVlt43SncdPbz7VWqNbFSs050Q9Xy67ZQJYYJgQZKIQImGgTBwA5smvNvs9GudCQxyQSAg+PPo9C+W45laIBgEGAStKJWoAACViOYEGolpAFBWKKDRoDDQSrc11KtgK2vgHzn3eDeKKHFYq1Z603lW5tnTbn0VPPbnv0uft04duXXm5XX5ebXFHGV5sOwrQtrNI3uezNoq5VZY3NVLETQiwKmOF1K4NKbzTp3zfo+fp9ty77Iv5R24WYXr5unnbz92+U9T6wuTk538969NnNfsuaOJ63L6LwOzNlbarnTp6TfjOqqKRBZbrOiV+Ov0j5mx6HWMkx6fj6PqXl+r879jzedqc\\/Q+g\\/Pe583+g+d5u3FnZ2FsumOjLf23Ft4buz7nL0dfmuta+H9byd0HY5+j6N5vX8N+g8dFWcGU4nOub0S\\/YXx9Pp4KnLg6qyWwgVk0yImTumi3y50+f5+h2iPab+S7L4u+NcGHo9+c124+1jfRmA8rpcaiZCBABTEgYaKAwj4xr4k9n6RjyY51zUdTXzb3ipMDy56vZWPQrgUUYjzRqAADYACABiigK1BAasRzBqAFXWcNAKDUEco5RlblQVn528H7m2Xk1ViIJlTNIDp6Y2rc6o06GPRp5+6wvj9flZdOaMx3kGndXrSxvqKuxSql8XTCgWQnIFgq21TsauFusywdIvTNa8trEKlqnbg3n1uDuudYdI9\\/4fp\\/o7yseHOvz7r16HO+thVfdxeu8bcNhmWb6VYvrIBQt0m+pcPzn9acb1PL8d3+bSo9d5vrfTfn\\/Swd\\/N4H1ubFtjJrVGuHTj4u3HaX3MD0\\/Lul7eK7+b3Hn9XZ5tMBfmOrn2b8nuOPs+u+P2fjz6\\/xvS8XseL7vDsFRS1zZVdub178GRx2dOfVfJol159eKO5jFteTPHXbK4+mfIK4+e97XsiOqLLj3Va8lvL6XXzNHoeE0Vmjr1rLWn6teZleulKtOxz4bTf0Zj1Izsc5rzfPZCvntejm5fY9JELNouju6+d0+nwWMoP55fq+hhegrx4xUV3mABSAQAMJGwnQaaKxVCNRyia3mAhYRTUOmB1VNN4tLraroiSNtOn578P7WpkbuQAUVhUAovjRymS0Knx7tWevN6\\/NrM4D3GCpLdzq6b68b9bTDIHBrCOeWMCakstEWUOlaFje0ozQSpZWLoZbidPonie3zurl4O+fpPK7P1L4k+avb5n17cHoPUedZ0y+u+ZkW7KjHnpeRTGmNVr1yQd4dHox\\/MP2at6Ofz\\/Z5nP0z6\\/B6fqvJ9FNp856Xn0Oa6jo5dfW5urVhl0uHTP0x5D1\\/M8728H0fz\\/Qtjp5G3IsPpRpcrY37\\/JPzX2eD0fJ6Xg\\/Q8iszqqM1yXXVg494Xzp2Geg6PKaufn4+jyo6BNoprZnTx1FFRUwB6DPp7eXTjpcjTK6HVpj3tOXMnv5OvBc8fWvW87z6wBc1b2OXePq\\/O9HB18va14vQZ4+c00qw9PjxVL0prPM12eb0ent5+3bi5gyX5Tae7mu5pwWVkY02cnoU3hj6eaxN3PPnspeeZ60KrpvrVycl3e53vl5l6ehvymU4o7KzThZ79Xl7b9Ir6fNHR56rTnutunFbL5uXocheh868f1sdSRQqC15Xn0ixWyaubprtc\\/YdMs8dOjLpxa8FOmD5abNY4e+OuaS1ZOnZz6NW2PLeWGsqRZQYRYiK5qykyOm6rS6a0RARhqNk3Znr0MertcPdZFZKNmNfov52hT+F+p0+n8zb0eEef7o+2cXD8Q93n+reN1b8dKclzuXowPWq3zOie2ZdbbH5X9r44C+JxPXFolx6sGi53RhyOnDHXPtz6Ovj3Z+dX8e\\/S4ejb1c1Hq8OfTHZl0U6ZZ3JVXrXqcnUos+mdbXh\\/T8u5OxPjdHNsTpqaXn0lXNenWxPoWC8m9Miu9Hie3i7Ge\\/r8p6GWnqcjp5bYOfq8h1VXtOR8vzrv44zIRZc+hmfded2eJ68uzjq0PkdvNYzGXflt6nl6OLtjwOjHr56pfHWbej871JydHG9Diw641ue1z9\\/Qy6fUeT6v0Lm5fg\\/wBb835rbncfq8bz3Kyk8\\/1tXL3bc30urj60vyPq+VZnfO3w5l1bM47nOyIheO8+mZ0zcpOo5M33cui7n6adM\\/Odfn9N1TeW8yBWDPqoV+e83ehoDvRU1ry1p0mya0Z6pcVuetlt0yuTnvdnrm05dmGuTfnu2y5esa5vFcXmm3PavXmzvLK1mDQyNBDy7lSBYOxNGtKFYHNhWmdKA6WXRXGmjDboYdPX5te95227o5\\/I7P3Xi9nvvNefpOpzZ8j18vJ6R9R8TX5\\/6t5YPKdZZBwO\\/D1\\/n9PdnH4\\/9t87m6sKWtOG\\/Vx3xE3Z62LVLWGua965NMTFbODu63ndvQm+V7flXa49BUZjJ08+bPfib46s9dhFtx2OPqtjT5v63jbZXC3xdyyvTph2M9Ms9DSdzK\\/f+Z3ea1ndtw92K4m+f0jzfR1eZ3YLezXDw\\/Vz+E63pRzdOXxndyOioSM6UV1sb5e0+s5r8l1RzNsr1WyNNU6dzLbr5a+Z6Ob0mEfQ+Y8P01g5PTw3HK6MrR8vp5Onltmc+l8\\/1\\/S8t+owx+aepyeN9by4KwNSnt8fTh5\\/R9D5no6unm9ROXy\\/2fPz1Oisuhz9Xayjw3bzU1Fc0qvldHP2Mujfh0ec7fP1o40nrOXqGHfmM+H3ebTWdbdzK1XUz30Z7cPh21zpk2wbO6tM4n0VpjvNUaY1orO1GkM+k6lWGTRNd\\/HWop7jNpglvBlUWiWkMY0M9NWOtk1GqBRojquIzfN8jfn2Y753Ne2QpBrZl0ZnNidUHovP9b03H08Pq5OJ1Ydvg7ejkUj9JxmDecFvZB4n2OGEY9o0D870+f67zfZzb50ac\\/sOnCm881RnccTbmw3PXw6upzdma+axQxWiL283R2\\/M9EFef93yPZ+b2L2+dzVv1Xj5VepbfBztltM\\/eYL2PLt2OTp+J+nwcDox5Wpy7VjRJjAnXTjcH1Mzj3PUx09Tlfz7t5fTcnRtuetxd\\/D1hKezE62GvE6+f1vD0cjp5\\/XcXdguOZpj1cr2TnueXGvfr4aVHX5zr578zObJrhLyVXzOri5VRHXK1y1NdTHaknl9Ed7l6yj3vj+n5n0\\/OuvAUuD0zsvk6eM9Xl7uJWvdy0Tbi9dzb+c6c+SFoea6+fuc+nl98+ljoqvgdnN2uXt890c3O25ynhR2ctetz9XndJ5u\\/KrmxBCN7EbMunT53o3uMdvROPkNs70+YRtboFWi5mMXUWjpM4zWZhdHLbXOuFKnTG2h5qlOxUqexVvy14uvPzjNmKIJ9BaZazsKoc2yxQ2d1XDCcd6sw6tJoF0sujXDyuNKu2LxUtUapWbJqWmuLQtM6hXclk25vVef6GDqxKf1154ejmr0VF54qnzWuBY60KFaqJRq2K7nN0dHl6bKW\\/K8u2FFNm6EZdYdV2vP7eVYHOXfGqcy6Z52XDtVU2zdW0Yd+fp0udpHNqTL6uOmtXm0xzUma63N2dnj7sW2HU5dojx\\/p8NNY5t8dAunhr6jh7eH2cmcLEyHoebezRZtcCkEjU6QscZ2gr5muPIdak+xlpoijU3VOvHd1XkerBDPXWdNGyBBaVSJhz040x3Ge4pqWl5dMt2epVJU5GsGmegmukjQDOGmbabQlKgKVarqXVI6k6ep8L6rpZHF1HR4vo5Pd8\\/TVS5WmOFz7\\/lvyuy4+uPn3WubvrPdlp6hZ\\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\\/2PDphnby9PvpY8N\\/WLHXB497X7ZbsqOOnqed38+pvO643ZVKWab0lOLNL6PVl8u+o8jz\\/ueENebLUWTp0c75mkU6SoWyZaVbVqmwVgWKmaqC5DJoJWWK9M6XmeOmrHRZndY0rK95bUEnHYwtCL42UcQrVd4WIYbCsl6c7SkKViUJUGB0IEqY5ggOOqBaJq9aUBRWdNRYleqdUwyioKLSoRjpPWYBQrqUYAKQYHVYgJVYCBBKOABsOlqpzABSilIJAAysqJ2JwKnKuVGhUchUCvn\\/AJH0NjrOOFQLkRUku9XZNIqsmiEpU3nHlVWbDgaGXBUNKnoC7E1nZharaSorga4obzDtGwPJpjToY620+W4sa0Z7ei87t9lxaYSuUtekGjn19biUo8nd6tMt2WmaH6TCu3mjeNGW7Xn0oeIqssS5S6XVl8l+r8bk+v4WbXnoqdUVoRjtU1NgoEQrCJ0Wp7eboS5xdGBRYqsmi1nZaq3zVKdbWG4yJSpuHWtHJ0uN0LXFmoAq2kb0RWgz1TVtKsKk61ZaWLekKzAMSSSjQKOI2JYaLGTqYggyxVnJIzNwqxFNKpzcUpVVZEiUmmq3NTcjVxlwtZkClYtCMCzUrc9jNZNcUqGTyaTWSQAoVB2TVbVFS6pU6mI5VhTUYcRUB\\/OfG+itpuGl0B1qq0FOyb0TUTZUaTOBUUVmHKhqhronKspbCdKNaAGcMTVemelJKMFGGWiCF6rr56d\\/HbMPkXm7V2e3f87u9zynBnTnGu2Vblp6WcBN8V1RVbJnnxt3c89PF12N9NGfp4pNpdzLTZWarWns5\\/NfQ+P5z2vCXXmqaI7UIysSuSEBUoy1VojWx557gp64tWoIJ0q3nTp5mWp1oi0tqVrNoZcuy4jMtKSrmtSWiUiMWkKBTpHKzsCxUGIBIsTAIxWtBF6EaRRY7ZBm66lazVkQ6ssIWpyWVaBRSQKgVoA4KxKQRoVWpkhRZ7jOyt0jV8UoVBarrdK8kaKrJplW5I7s97FrURU81B1QAVCsoogROtpHMVfOvG+igtVPYipVS60I3pvNYnYQw9qVjVbipzHNbWhK5ValVQmi10tsiptDDjJcpLrpYdJdPWlnZQ605bdXLVQ5lS7m\\/PXpcHZ7Pg6+ZS4DOm504693OGK4xtrk3SsF5es4+nThV7nS1bltWSmjugzw6tV0ezl+bfS+Twvb8CnTmrasC6a1462TUbrqaadoUkKyq8Oxnrriq2gq0TW2WWlVWw8ukVgZqyJamg62lrN6yQbuNM3tinnWtUKzrpQd40cZqxyUZi7SbUMgMQlGlC9Fgo1W81KpbgnBGqylHAYm1OxN1aK63QKtWa1LIipWmApas9LIutrLtlzdsM9yhLq7otWlKidNTnYoM1UIqgqqNLhFNCrSXnTNebIVOm4rvMIaao0lFLF+V8n3tyIm9OwrKnmTuktlmrUAypzlRKVJDOehkaGXsZlVmRrUjqNVjEBRelm0ijSVzvmaLGFtFkPVGvQy1COfUvSujT0PB2+w4duUFBe3PTXz6ehmKivn\\/QWXOkjRC9Pw9XWyW1ZbOfoKKtp52e1uemxS2qXt5fmP13icj1fBTXBRMndNZijNWxZoFRRWaNNSiJnoU1YWQErMVNirRF9GXty26Uu0VDnHSxuWeehzoJk1S1AKpRVOrE9caaCTUQziAUHNbQHUxSSVch0mcoCuQIMCosQI1fNOnRUIOJqVTSQEBmVvOunUiNERG0242GhFNRRUlGyNpNlUlFTRIM6WpK1UOw0snS1VW88t4KVnvNR7Zpp0qJyhnuM95q3WyBUHmvL95mXQ3VQMxTNySJuVogjccsNXNdRUpai5GpDsjVFKy56CaRVCeK5oc1VOkDDpYwLRjVXZ6dfLW+b5dZC1dN9Tk6vRcmtU64ZrpE9Tl6PQZmmTw\\/StGs3kZstvX8r08m\\/J6Y6XJejKxcKHX59RSsos7uX5Z9X4nD9fwa9cEati9ed0jx7ZwZEgQTiAQLJZbiLCtKA5QVavRN7s3kbzNY9JtmdWeqssQt5isjcui1PRLsFBxUJajqrNnJVACTKgAyojjIDidTchm3SAK3UJAKbjRzW0R3zVisDQKxLRWTHMco0AASXDQoroUETDGVOmrqkiiiFWJqmoIAacTCVzQNWFyENFsOxURLcRCuUHSxg8J5PtpTsb1KrEFssul1llCojCpIrKSk0XKUCVqT6DLBMS9rUmJpE6XKPPk6lIOFgRMQZqqzO+rjvePm1nKnTOj8vT0OXWFor3JbU+iY0u8b0vQGs0P1PJSK9M12uPbbE6qmmTRh000+ZvB68PMfQ+L5b2fCr150B1WqXlopebAwAaABEZatTvTVVbNsiOGaaatRqilHQ2jVwolmbraFxTWd7nTFWoAtMmlPQh0yK8St1NQKia2ViDItFYUoKwIitpRXKrVUBQIQdTiqpI7Jdyp5upVFVwVtU1FNRTUwGKk0BuOxIotV2JkETUqJuk4q6cTKYZnFj1xxWoPZnatc\\/TKopx3K2Tpc4NM84Ed02rVTXi\\/M9ZhuqvVVjDWuTQOxVdNZGVsakrnNUVVFUloXIvVaHNrHqLWWKnVIlVUU6wKixo53ZlVNLDoVTWjPXr5a2S81Q7EjTr8XV2ebfiVa1OhqDulIyp3qhWM0Ke5jWznpp1GWtuOvdxzpjflOq98C7f0OXyXveNxvW8SrTlQZC1OqkoQCgBaK5OAWVNSTbnruzpnEqbE7pupsoItCe+S9KBkuMdCMQjNaraKpk3FaitzTQgrEONgQbpERasRYqYIBQ0tgrpQZVAFCDullUQgVMpaUTzbDhRBHKuUckpWRAVo1UIDgkbgnmrE7E41nc1sRkGERrLcZql0OmGstDzWuS6dCnRRmqaqhah074u+Lsl\\/POX0A3UVokvG9OpKlOgblWosZSKxrY50kuKlCjVl7kipoZramI0ytSoVyXJYjTS6wxKxL6UadHPYCwuVcvnt0uLs6HN05rzpH6GR1pqU6ZrzdVpU11HJs7eT6WG\\/Uzroc9b+bbfnGZlmtJvz16Fm2fz76DyeD6vh1684AqinXUwVoOFAKytNRsp0NWjIXw7U0HanYh2UDrasRok1y2TDhLlGqam1LVGjqqApYXLOC5gOmAgPNQqlq9TcFkuNxCsgykwXxbq2QUMNVTBZNWDUQKZNGFhEHNTVLSNIDJugFKIUq2qKlGqWVhWzMylpQLFAE5qKnLCgKBc2qtE1FVLeJpS74HaDnNSiazcLUVHn9y0OqKpKDLvklFVNhwlgWXW1S1maqpXo2Z1dU2sDmqkgWDM6Vpo86tc8SFaRmRUsljGmtmevQy3iMjzvqTF+j4+3Rz9GMd6euSS+vmYXfJ1Th0USV0Zxrktx39DydN+FnbHK6yaVRols6HVz+T9vxfP+n46aY0otKuRloURTI3T1SaJLWU0qRUUUMvT1SrZsJ01FYahVlUtKVpktEqGcWuY5dKwqyauRaChU1GnTdDIsVQLQsRHMADqAAwWCZNQRVYqYUGwOnbNFNwuTsmkLpToCilVUq1HNbVdAEE4ACCrpJU0uaqlVZGqSgzemWitBU0qahGkaqpVCA4mRsDp2J2TVbWS5oclmuSxXEeR5PQuB5dVUicYUwFgEKmVCtCwHERUtZ0RO8NVJ6TOXZpimz0iBcU6ZpURhkIQeVOiNLs9OhnsU8bzFTcr38vV3ePpxFc9thbJvfD0hydptaeChV6PFdfHR8OjfzW+Wl4c7QXeH2jHvNHbxea9fx16\\/LucELE7IqwLEWDCCMzWdvlbZYrhRvF6JrUlrk0oYAxGnl6QgKitlTSky4jihrLSUL09Mu5O1OxFyopoBEBwIAZW5VpBqklFYgABmRFbEaqpIKFFMDgBNpvTF6FV0ultKmhyjSuYDoVusIFbFBXNLRFfN2ocLZbK4qA3DPU46mtpKVTlAcHTrbASbtgcupznuKahRBXBq58tweiWAbps2RKx2XosogrWXJxNCQlYi1pQAG0lTHLssm1i6gqarcZ6Rc3JqEZXLqjRM9elnpqVYiVqLlfe5t+pz9XOKytUhaHUl2NcvfKu45yWiNe3zb1Y6nJ93Dbpc2tA13T6zZeZ1nT0c\\/mfV8fz\\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\\/\\/2gAIAQIAAQUAUpJQ3RI9uStZGVfJXbQmN\\/ooTh12F\\/5SCCCCCCCDicUcTiQQQQQR+rBBBBBBBBBBBH6Uk\\/XJPmUckO6HkQ8jJY2ST4ga8ISR6CSOKOBwHVEeJEjicD2z2h4zgz2z27DxM9qT2T2j2z2z2z2j2h4T2j2itT25Vaw7DqJcituKvefEfpwYssrDbmndJ\\/8Aho\\/zo+uCP8eCCCPog9foaGizEyfEEEDRA0QyBeF4lisL1EkcULGj20cUOB3R7qFlqc6nNHuo949xMeRHNEo9D0PQghHFHBGNCt4hIj0pXi4mo1+ql6Vu6lrcj3mks8Vx3Vl\\/\\/Jnkqh7NUPaoPbqPbR+WflSPYHmQ8yPyD8hHvVPdqe7U9yp7lTnU5oV0e4jkh2OZyORzPcPdZ77PeZ77HmY8pzPcPcgWU909090909494Wc98\\/IPyD8g\\/KPyxwjIhP8AdeslfRKCJLU9X6E\\/WvCU+V5ScfYrZ1ePJz\\/\\/AIRP6kknI5I5I5I5EknJHNHu1Hs0Q96iL9ih9ix9hZltuzHlZ7jPcZzZzOZzZyORyJJJJORyZyORyORyOTObObPcZ7jPcZ7jPcZ7jObObObObOZyORyORyZyZyZyZyZyZyZ', '0', 'http://huoma.edeyun.cn/index.php/huoma/live?d=s9tb3mm51', 's9tb3mm51', '1508814485', '1508815912', '1');

-- ----------------------------
-- Table structure for `fw_cms_phone`
-- ----------------------------
DROP TABLE IF EXISTS `fw_cms_phone`;
CREATE TABLE `fw_cms_phone` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(500) NOT NULL COMMENT '题标',
  `videourl` varchar(255) DEFAULT NULL COMMENT '视频地址',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `huoma` varchar(255) DEFAULT NULL,
  `d` varchar(255) DEFAULT NULL,
  `uid` int(11) DEFAULT '0',
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '1网址2视频',
  `tztype` tinyint(1) DEFAULT '1',
  `count` int(11) DEFAULT '0' COMMENT '播放次数',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `status` (`status`) USING BTREE,
  KEY `title` (`title`(333))
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fw_cms_phone
-- ----------------------------
INSERT INTO `fw_cms_phone` VALUES ('46', '腾讯', 'http://www.qq.com/', '1508722555', '1508722555', 'http://huoma.edeyun.cn/index.php/huoma/?d=auyihowhn', 'auyihowhn', '3', '1', '1', '0', '1');
INSERT INTO `fw_cms_phone` VALUES ('45', '222', 'Uploads/video/infinityWallpaper.jpg', '1508722462', '1508722462', 'http://huoma.edeyun.cn/index.php/huoma/?d=u9gce82la', 'u9gce82la', '3', '2', '1', '0', '1');
INSERT INTO `fw_cms_phone` VALUES ('42', '11', '2', '1508485696', '1508485696', 'http://www.livecode21.com/index.php/huoma/?d=hnqlp33nk', 'hnqlp33nk', '14', '1', '1', '0', '0');
INSERT INTO `fw_cms_phone` VALUES ('40', '牛逼', 'http://www.niubi.com', '1508484566', '1508484566', 'http://www.livecode.com/index.php/huoma/?d=v7rnj961i', 'v7rnj961i', '14', '1', '1', '1', '1');
INSERT INTO `fw_cms_phone` VALUES ('41', '1', '2', '1508484631', '1508484631', 'http://huoma.edeyun.cn/index.php/huoma/?d=mj4ibtqfr', 'mj4ibtqfr', '14', '1', '1', '0', '0');
INSERT INTO `fw_cms_phone` VALUES ('43', '1', '2', '1508721257', '1508721257', 'http://huoma.edeyun.cn/index.php/huoma/?d=mocuzdppl', 'mocuzdppl', '3', '1', '1', '0', '1');
INSERT INTO `fw_cms_phone` VALUES ('44', '11', 'Uploads/video/music1.mp4', '1508722420', '1508722420', 'http://huoma.edeyun.cn/index.php/huoma/?d=byj3d0xys', 'byj3d0xys', '3', '2', '1', '0', '1');

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
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_cms_product
-- ----------------------------
INSERT INTO `fw_cms_product` VALUES ('86', '0', '3', '标题2', '{\"picUrl\":\"2017-10-20\\/59e9608ca401f.jpg\",\"content\":\"<h1>\\n\\t\\u5185\\u5bb913\\n<\\/h1>\"}', '0', '/index.php/huoma/product?d=drjpcboqv', 'drjpcboqv', '1508466830', '1508466830', '0');
INSERT INTO `fw_cms_product` VALUES ('88', '1506065776', '3', '子目录来个', '{\"picUrl\":\"2017-10-20\\/59e961509b4a6.jpg\",\"content\":\"<p>\\n\\t<span style=\\\"background-color:#E53333;\\\">\\u53d1\\u751f\\u53d1\\u751f\\u7684<\\/span>\\n<\\/p>\\n<p>\\n\\t<span style=\\\"background-color:#E53333;\\\"><img src=\\\"http:\\/\\/api.map.baidu.com\\/staticimage?center=121.473704%2C31.230393&zoom=11&width=558&height=360&markers=121.473704%2C31.230393&markerStyles=l%2CA\\\" alt=\\\"\\\" \\/><br \\/>\\n<\\/span>\\n<\\/p>\"}', '0', '/index.php/huoma/product?d=69qqs0rj2', '69qqs0rj2', '1508467038', '1508467038', '0');
INSERT INTO `fw_cms_product` VALUES ('84', '0', '3', '1', '{\"picUrl\":\"2017-10-20\\/59e958a987db0.jpg\"}', '0', '/index.php/huoma/product?d=rwcnbnqqc', 'rwcnbnqqc', '1508465172', '1508465172', '0');
INSERT INTO `fw_cms_product` VALUES ('85', '0', '3', '1', '{\"picUrl\":\"2017-10-20\\/59e958a987db0.jpg\"}', '0', '/index.php/huoma/product?d=w5k4m2nmf', 'w5k4m2nmf', '1508465175', '1508465175', '0');
INSERT INTO `fw_cms_product` VALUES ('87', '0', '3', '牛逼标题1', '{\"picUrl\":\"2017-10-20\\/59e960d46d53a.jpg\",\"content\":\"<h1>\\n\\t\\u725b\\u903c\\u5185\\u5bb92\\n<\\/h1>\\n<p>\\n\\t<img src=\\\"\\/Uploads\\/2017-10\\/59e5752398f6f.jpg\\\" alt=\\\"\\\" \\/> \\n<\\/p>\"}', '19', '/index.php/huoma/product?d=an5d4jh0k', 'an5d4jh0k', '1508466933', '1508466933', '0');
INSERT INTO `fw_cms_product` VALUES ('89', '0', '3', '产品活码', '{\"picUrl\":\"2017-10-20\\/59e963fc4fb76.jpg\",\"content\":\"<h3>\\n\\t\\u4ea7\\u54c1\\u6d3b\\u7801\\u4ea7\\u54c1\\u6d3b\\u7801\\u4ea7\\u54c1\\u6d3b\\u7801\\u4ea7\\u54c1\\u6d3b\\u7801\\u4ea7\\u54c1\\u6d3b\\u7801\\n<\\/h3>\"}', '1', '/index.php/huoma/product?d=zb8v6ngnc', 'zb8v6ngnc', '1508467720', '1508467720', '0');
INSERT INTO `fw_cms_product` VALUES ('90', '0', '14', '1', '{\"picUrl\":\"2017-10-20\\/59e99374be5ce.jpg\",\"content\":\"1\"}', '0', '/index.php/huoma/product?d=af3102e0n', 'af3102e0n', '1508479863', '1508479863', '0');
INSERT INTO `fw_cms_product` VALUES ('91', '0', '14', '厉害的产品', '{\"picUrl\":\"2017-10-20\\/59e99d556531d.jpg\",\"content\":\"<h1>\\n\\t<span style=\\\"color:#E53333;\\\">\\u5389\\u5bb3\\u7684\\u4ea7\\u54c1<\\/span>\\n<\\/h1>\"}', '0', '/index.php/huoma/product?d=ozqje4w2f', 'ozqje4w2f', '1508482391', '1508482391', '0');
INSERT INTO `fw_cms_product` VALUES ('92', '1506065776', '3', '22222', '{\"picUrl\":\"2017-10-23\\/59ed4191a3b4e.jpg\",\"content\":\"<h1>\\n\\t333333333\\n<\\/h1>\"}', '0', 'http://huoma.edeyun.cn/index.php/huoma/product?d=b9fxbdw9k', 'b9fxbdw9k', '1508721048', '1508721048', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=257 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_orders
-- ----------------------------
INSERT INTO `fw_orders` VALUES ('3', '20170919150578733245', '3', '-1', '2', '1', '1', '0', '3200.00', null, '1505787332', '0', '1');
INSERT INTO `fw_orders` VALUES ('4', '2017091915057876713579', '3', '-1', '2', '3', '1', '0', '8400.00', null, '1505787671', '1505798826', '1');
INSERT INTO `fw_orders` VALUES ('5', '2017091915057877316572', '3', '-1', '2', '2', '0', '0', '6000.00', null, '1505787731', '0', '1');
INSERT INTO `fw_orders` VALUES ('6', '2017091915057898523251', '3', '-1', '3', '2', '1', '0', '9600.00', null, '1505789852', '0', '1');
INSERT INTO `fw_orders` VALUES ('8', '2017091915057900911085', '3', '1', '3', '2', '1', '2', '9600.00', '暂无', '1505790091', '1505798726', '1');
INSERT INTO `fw_orders` VALUES ('16', '2017092015059012115478', '14', '-1', '1', '4', '1', '0', '5600.00', null, '1505901211', '0', '1');
INSERT INTO `fw_orders` VALUES ('17', '2017092115059577404758', '14', '-1', '1', '4', '1', '0', '5600.00', null, '1505957740', '0', '1');
INSERT INTO `fw_orders` VALUES ('18', '2017092115059587624845', '14', '-1', '1', '4', '1', '0', '5600.00', null, '1505958762', '0', '1');
INSERT INTO `fw_orders` VALUES ('19', '2017092115059631348383', '14', '-1', '3', '2', '1', '0', '9600.00', null, '1505963134', '0', '1');
INSERT INTO `fw_orders` VALUES ('20', '2017092115059654793415', '14', '-1', '1', '3', '1', '0', '4800.00', null, '1505965479', '0', '1');
INSERT INTO `fw_orders` VALUES ('21', '2017092115059846350373', '3', '1', '2', '3', '1', '1', '8400.00', '暂无', '1505984635', '1505984639', '1');
INSERT INTO `fw_orders` VALUES ('22', '2017092115059881792709', '3', '1', '3', '2', '0', '2', '4800.00', null, '1505988179', '1505988179', '1');
INSERT INTO `fw_orders` VALUES ('23', '2017092115059886587836', '14', '-1', '1', '4', '1', '0', '5600.00', null, '1505988658', '0', '1');
INSERT INTO `fw_orders` VALUES ('24', '2017092215060426153415', '3', '-1', '3', '1', '1', '0', '5000.00', null, '1506042615', '0', '1');
INSERT INTO `fw_orders` VALUES ('25', '2017092215060426544387', '14', '1', '3', '1', '1', '1', '5000.00', '暂无', '1506042654', '1506042660', '1');
INSERT INTO `fw_orders` VALUES ('26', '2017092215060471086317', '14', '1', '3', '2', '0', '0', '9600.00', '暂无', '1506047108', '1506047114', '1');
INSERT INTO `fw_orders` VALUES ('28', '2017092215060512436693', '14', '1', '2', '1', '0', '2', '3200.00', null, '1506051243', '1506051243', '1');
INSERT INTO `fw_orders` VALUES ('29', '2017092215060718162331', '14', '1', '2', '1', '0', '1', '3200.00', '暂无', '1506071816', '1506071827', '1');
INSERT INTO `fw_orders` VALUES ('30', '2017101315078573453076', '3', '-1', '2', '2', '1', '0', '6000.00', null, '1507857345', '0', '1');
INSERT INTO `fw_orders` VALUES ('31', '2017101315078631058953', '3', '-1', '2', '4', '1', '0', '10400.00', null, '1507863105', '0', '1');
INSERT INTO `fw_orders` VALUES ('32', '2017101315078633681624', '3', '-1', '2', '4', '1', '0', '10400.00', null, '1507863368', '0', '1');
INSERT INTO `fw_orders` VALUES ('33', '2017101315078845075902', '3', '-1', '2', '4', '1', '0', '10400.00', null, '1507884507', '0', '1');
INSERT INTO `fw_orders` VALUES ('34', '2017101315078846422397', '3', '-1', '2', '2', '1', '0', '6000.00', null, '1507884642', '0', '1');
INSERT INTO `fw_orders` VALUES ('35', '2017101415079428322027', '3', '-1', '2', '3', '1', '0', '8400.00', null, '1507942832', '0', '1');
INSERT INTO `fw_orders` VALUES ('36', '2017101415079480191871', '3', '-1', '2', '2', '1', '0', '6000.00', null, '1507948019', '0', '1');
INSERT INTO `fw_orders` VALUES ('37', '2017101415079637633034', '3', '1', '1', '3', '0', '2', '1600.00', null, '1507963763', '1507963763', '1');
INSERT INTO `fw_orders` VALUES ('38', '2017101415079714698283', '3', '-1', '1', '5', '1', '0', '6000.00', null, '1507971469', '0', '1');
INSERT INTO `fw_orders` VALUES ('39', '2017101615081152386591', '3', '-1', '1', '4', '1', '0', '0.01', null, '1508115238', '0', '1');
INSERT INTO `fw_orders` VALUES ('40', '2017101615081225960582', '3', '-1', '1', '4', '1', '0', '0.01', null, '1508122596', '0', '1');
INSERT INTO `fw_orders` VALUES ('41', '2017101615081234460836', '3', '-1', '1', '4', '1', '0', '0.01', null, '1508123446', '0', '1');
INSERT INTO `fw_orders` VALUES ('42', '2017101615081316633579', '3', '-1', '1', '4', '1', '0', '0.01', null, '1508131663', '0', '1');
INSERT INTO `fw_orders` VALUES ('43', '2017101615081340675359', '3', '-1', '1', '4', '1', '0', '0.01', null, '1508134067', '0', '1');
INSERT INTO `fw_orders` VALUES ('44', '2017101615081356111603', '3', '-1', '1', '3', '1', '0', '0.01', null, '1508135611', '0', '1');
INSERT INTO `fw_orders` VALUES ('45', '2017101615081381236805', '3', '-1', '1', '4', '1', '0', '0.01', null, '1508138123', '0', '1');
INSERT INTO `fw_orders` VALUES ('46', '2017101615081417432443', '3', '-1', '1', '4', '1', '0', '0.01', null, '1508141743', '0', '1');
INSERT INTO `fw_orders` VALUES ('47', '2017101615081471634691', '3', '-1', '1', '4', '1', '0', '5600.00', null, '1508147163', '0', '1');
INSERT INTO `fw_orders` VALUES ('48', '2017101715082016654033', '3', '-1', '1', '4', '1', '0', '5600.00', null, '1508201665', '0', '1');
INSERT INTO `fw_orders` VALUES ('49', '2017101715082018994693', '15', '-1', '1', '1', '1', '0', '0.01', null, '1508201899', '0', '1');
INSERT INTO `fw_orders` VALUES ('50', '2017101815083063825226', '3', '-1', '1', '4', '1', '0', '5600.00', null, '1508306382', '0', '1');
INSERT INTO `fw_orders` VALUES ('51', '2017102015084782301153', '14', '-1', '2', '1', '1', '0', '0.01', null, '1508478230', '0', '1');

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
INSERT INTO `fw_vip` VALUES ('1', '基础版', '1', '1', '1', '120', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `fw_vip` VALUES ('2', '高级版', '0', '1', '4', '15', '5', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `fw_vip` VALUES ('3', '定制版', '0', '1', '3', '20', '3', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `fw_vip` VALUES ('12', '来个新套餐', '0', '1', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0');
INSERT INTO `fw_vip` VALUES ('6', 'fdsf', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `fw_vip` VALUES ('22', 'fdsf浮动', '0', '0', '11', '0', '0', '0', '0', '0', '0', '0', '0', '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_vip_price
-- ----------------------------
INSERT INTO `fw_vip_price` VALUES ('1', '1', '11', '2000.00');
INSERT INTO `fw_vip_price` VALUES ('2', '14', '2', '3.00');
INSERT INTO `fw_vip_price` VALUES ('3', '1', '3', '0.01');
INSERT INTO `fw_vip_price` VALUES ('4', '1', '4', '1400.00');
INSERT INTO `fw_vip_price` VALUES ('5', '1', '5', '1200.00');
INSERT INTO `fw_vip_price` VALUES ('6', '2', '1', '0.01');
INSERT INTO `fw_vip_price` VALUES ('7', '2', '2', '3000.00');
INSERT INTO `fw_vip_price` VALUES ('8', '2', '3', '2800.00');
INSERT INTO `fw_vip_price` VALUES ('9', '2', '4', '2600.00');
INSERT INTO `fw_vip_price` VALUES ('10', '2', '5', '2400.00');
INSERT INTO `fw_vip_price` VALUES ('11', '3', '1', '5000.00');
INSERT INTO `fw_vip_price` VALUES ('12', '3', '2', '4800.00');
INSERT INTO `fw_vip_price` VALUES ('13', '6', '12', '2222.00');
INSERT INTO `fw_vip_price` VALUES ('14', '7', '11', '5555.00');
INSERT INTO `fw_vip_price` VALUES ('15', '8', '44', '33.00');
INSERT INTO `fw_vip_price` VALUES ('16', '6', '127', '55555.00');
INSERT INTO `fw_vip_price` VALUES ('17', '6', '9', '333.00');
INSERT INTO `fw_vip_price` VALUES ('18', '6', '12', '34.00');
INSERT INTO `fw_vip_price` VALUES ('20', '12', '5', '50000.00');
