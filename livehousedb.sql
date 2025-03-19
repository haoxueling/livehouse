/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : livehouse

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2025-03-19 22:37:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`) USING BTREE,
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('14', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('16', 'Can view user', '4', 'view_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('18', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('20', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('21', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('22', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('24', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 前台用户', '7', 'add_user');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 前台用户', '7', 'change_user');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 前台用户', '7', 'delete_user');
INSERT INTO `auth_permission` VALUES ('28', 'Can view 前台用户', '7', 'view_user');
INSERT INTO `auth_permission` VALUES ('29', 'Can add 商品类型', '8', 'add_type');
INSERT INTO `auth_permission` VALUES ('30', 'Can change 商品类型', '8', 'change_type');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete 商品类型', '8', 'delete_type');
INSERT INTO `auth_permission` VALUES ('32', 'Can view 商品类型', '8', 'view_type');
INSERT INTO `auth_permission` VALUES ('33', 'Can add 商品', '9', 'add_product');
INSERT INTO `auth_permission` VALUES ('34', 'Can change 商品', '9', 'change_product');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete 商品', '9', 'delete_product');
INSERT INTO `auth_permission` VALUES ('36', 'Can view 商品', '9', 'view_product');
INSERT INTO `auth_permission` VALUES ('37', 'Can add cart', '10', 'add_cart');
INSERT INTO `auth_permission` VALUES ('38', 'Can change cart', '10', 'change_cart');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete cart', '10', 'delete_cart');
INSERT INTO `auth_permission` VALUES ('40', 'Can view cart', '10', 'view_cart');
INSERT INTO `auth_permission` VALUES ('41', 'Can add 订单', '11', 'add_order');
INSERT INTO `auth_permission` VALUES ('42', 'Can change 订单', '11', 'change_order');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete 订单', '11', 'delete_order');
INSERT INTO `auth_permission` VALUES ('44', 'Can view 订单', '11', 'view_order');
INSERT INTO `auth_permission` VALUES ('45', 'Can add 订单详情', '12', 'add_orderitem');
INSERT INTO `auth_permission` VALUES ('46', 'Can change 订单详情', '12', 'change_orderitem');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete 订单详情', '12', 'delete_orderitem');
INSERT INTO `auth_permission` VALUES ('48', 'Can view 订单详情', '12', 'view_orderitem');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 评分记录', '13', 'add_scorerecord');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 评分记录', '13', 'change_scorerecord');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 评分记录', '13', 'delete_scorerecord');
INSERT INTO `auth_permission` VALUES ('52', 'Can view 评分记录', '13', 'view_scorerecord');
INSERT INTO `auth_permission` VALUES ('53', 'Can add 收藏记录', '14', 'add_collection');
INSERT INTO `auth_permission` VALUES ('54', 'Can change 收藏记录', '14', 'change_collection');
INSERT INTO `auth_permission` VALUES ('55', 'Can delete 收藏记录', '14', 'delete_collection');
INSERT INTO `auth_permission` VALUES ('56', 'Can view 收藏记录', '14', 'view_collection');
INSERT INTO `auth_permission` VALUES ('57', 'Can add 评论记录', '15', 'add_comment');
INSERT INTO `auth_permission` VALUES ('58', 'Can change 评论记录', '15', 'change_comment');
INSERT INTO `auth_permission` VALUES ('59', 'Can delete 评论记录', '15', 'delete_comment');
INSERT INTO `auth_permission` VALUES ('60', 'Can view 评论记录', '15', 'view_comment');
INSERT INTO `auth_permission` VALUES ('61', 'Can add 通知', '16', 'add_notice');
INSERT INTO `auth_permission` VALUES ('62', 'Can change 通知', '16', 'change_notice');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete 通知', '16', 'delete_notice');
INSERT INTO `auth_permission` VALUES ('64', 'Can view 通知', '16', 'view_notice');
INSERT INTO `auth_permission` VALUES ('65', 'Can add 订票', '17', 'add_booking');
INSERT INTO `auth_permission` VALUES ('66', 'Can change 订票', '17', 'change_booking');
INSERT INTO `auth_permission` VALUES ('67', 'Can delete 订票', '17', 'delete_booking');
INSERT INTO `auth_permission` VALUES ('68', 'Can view 订票', '17', 'view_booking');
INSERT INTO `auth_permission` VALUES ('69', 'Can add 商品', '18', 'add_performevent');
INSERT INTO `auth_permission` VALUES ('70', 'Can change 商品', '18', 'change_performevent');
INSERT INTO `auth_permission` VALUES ('71', 'Can delete 商品', '18', 'delete_performevent');
INSERT INTO `auth_permission` VALUES ('72', 'Can view 商品', '18', 'view_performevent');
INSERT INTO `auth_permission` VALUES ('73', 'Can add 演出类型', '19', 'add_performtype');
INSERT INTO `auth_permission` VALUES ('74', 'Can change 演出类型', '19', 'change_performtype');
INSERT INTO `auth_permission` VALUES ('75', 'Can delete 演出类型', '19', 'delete_performtype');
INSERT INTO `auth_permission` VALUES ('76', 'Can view 演出类型', '19', 'view_performtype');
INSERT INTO `auth_permission` VALUES ('77', 'Can add 互动管理', '20', 'add_interaction');
INSERT INTO `auth_permission` VALUES ('78', 'Can change 互动管理', '20', 'change_interaction');
INSERT INTO `auth_permission` VALUES ('79', 'Can delete 互动管理', '20', 'delete_interaction');
INSERT INTO `auth_permission` VALUES ('80', 'Can view 互动管理', '20', 'view_interaction');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$600000$Kz2Nkq8agNXqgkapIZLbMO$jaAV24ILjhnNHUDbfpPWyeMeHhvsocltKsflFyl9fvA=', '2025-03-19 17:27:36.774031', '1', 'admin', '', '', 'admin@qq.com', '1', '1', '2023-07-08 18:23:21.696107');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`) USING BTREE,
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`) USING BTREE,
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for booking
-- ----------------------------
DROP TABLE IF EXISTS `booking`;
CREATE TABLE `booking` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ticket_id` bigint(20) NOT NULL COMMENT '票号',
  `booking_date` datetime(6) NOT NULL COMMENT '订购日期',
  `payment_status` varchar(50) NOT NULL COMMENT '支付状态',
  `total_price` decimal(10,2) NOT NULL COMMENT '总价',
  `is_used` tinyint(1) NOT NULL COMMENT '是否使用',
  `user_id` int(11) NOT NULL COMMENT '用户编号',
  `quantity` int(11) DEFAULT NULL COMMENT '数量',
  `bankname` varchar(255) DEFAULT NULL COMMENT '乐队名称',
  `banknum` varchar(255) DEFAULT NULL COMMENT '乐队数量',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `booking_user_id_1bd7cb6e_fk_user_id` (`user_id`) USING BTREE,
  CONSTRAINT `booking_user_id_1bd7cb6e_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of booking
-- ----------------------------

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` int(11) DEFAULT NULL COMMENT '用户主键',
  `productid` int(11) DEFAULT NULL COMMENT '商品主键',
  `count` int(11) DEFAULT NULL COMMENT '商品数量',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userid` (`userid`) USING BTREE,
  KEY `itemid` (`productid`) USING BTREE,
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='购物车表';

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('1', '1', '50', '2');

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `productid` int(11) DEFAULT NULL COMMENT '商品id',
  `createtime` varchar(255) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `60` (`userid`) USING BTREE,
  KEY `70` (`productid`) USING BTREE,
  CONSTRAINT `60` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `70` FOREIGN KEY (`productid`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='收藏记录表';

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES ('7', '1', '38', '2024-03-17 19:29:07');
INSERT INTO `collection` VALUES ('9', '1', '46', '2024-04-18 01:51:01');
INSERT INTO `collection` VALUES ('10', '1', '44', '2024-04-18 01:51:08');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `productid` int(11) DEFAULT NULL COMMENT '商品id',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `createtime` varchar(255) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `333` (`userid`) USING BTREE,
  KEY `444` (`productid`) USING BTREE,
  CONSTRAINT `333` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `444` FOREIGN KEY (`productid`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评论记录表';

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', '49', '非常好听，做工好，值得购买', '2024-03-17 19:30:29');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`) USING BTREE,
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('66', '2024-03-16 21:23:23.890834', '7', '音像制品', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('67', '2024-03-16 21:24:02.771460', '8', '模型手办', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('68', '2024-03-16 21:25:28.549584', '9', '定制产品', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('69', '2024-03-16 21:28:21.542358', '10', '服装服饰', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('70', '2024-03-16 21:37:40.298429', '31', '谢天笑2023本能巡演T恤', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('71', '2024-03-16 21:38:11.758695', '32', '要不要买菜限度帆布袋', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('72', '2024-03-16 21:38:57.375698', '33', '【Ti&Maily】麦田音乐节运动飞盘', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('73', '2024-03-16 21:43:21.194520', '34', '白皮书乐队“我不高兴”T恤', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('74', '2024-03-16 21:44:05.543968', '35', '【黑礁幻音】Queen of Thorns 限度长袖', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('75', '2024-03-16 21:44:46.954935', '36', '【黑礁幻音】Blacken Acid Mass 限度短袖', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('76', '2024-03-16 21:45:19.622046', '37', '木马乐队2021巡演限度刺绣T恤', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('77', '2024-03-16 21:48:03.350726', '38', '王喂马xSoulsense联名巡演杜邦纸包', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('78', '2024-03-16 21:48:42.240609', '39', 'Eluveitie 2019巡演限量版项链', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('79', '2024-03-16 21:49:19.166483', '40', 'H字母项链锁骨链', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('80', '2024-03-16 21:49:41.264302', '41', '完美倒立《Moon Love Poem月光情诗》2023春季巡演杜邦纸包', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('81', '2024-03-16 21:52:17.219612', '42', '數位武士:艾瑞欧 AIERIOE/Whiplash 实体人偶专辑盲盒', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('82', '2024-03-16 21:52:34.352990', '43', '「Ti&Maily」玩偶套装', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('83', '2024-03-16 21:52:54.635196', '44', '山谷冲浪手 墜入夢裡 Falling into nightmare系 列 手指滑板', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('84', '2024-03-16 21:53:10.229273', '45', 'Bridge(布瑞吉)玩具人偶', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('85', '2024-03-16 21:55:43.900591', '46', '出海部《日出之前》专辑CD', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('86', '2024-03-16 21:56:01.392164', '47', 'RUBUR《珀耳塞福涅的四季》专辑CD', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('87', '2024-03-16 21:56:19.382011', '48', '茶季杨《给你》纪念版LP黑胶唱片', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('88', '2024-03-16 21:56:35.291044', '49', '文雀乐队《庙雨连珠》专辑CD', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('89', '2024-03-16 21:56:50.668721', '50', '李荣浩《有理想》专辑CD', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('90', '2024-03-16 22:34:39.805626', '8', '音乐会', '2', '[{\"changed\": {\"fields\": [\"\\u7c7b\\u578b\\u540d\\u79f0\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('91', '2024-03-16 22:34:49.250275', '7', '话剧歌剧', '2', '[{\"changed\": {\"fields\": [\"\\u7c7b\\u578b\\u540d\\u79f0\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('92', '2024-03-16 22:34:56.488311', '6', '脱口秀', '2', '[{\"changed\": {\"fields\": [\"\\u7c7b\\u578b\\u540d\\u79f0\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('93', '2024-03-16 22:35:13.483932', '5', '儿童亲子', '2', '[{\"changed\": {\"fields\": [\"\\u7c7b\\u578b\\u540d\\u79f0\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('94', '2024-03-16 22:35:24.921782', '4', '诗朗诵', '3', '', '19', '1');
INSERT INTO `django_admin_log` VALUES ('95', '2024-03-16 22:35:24.924774', '3', '舞蹈', '3', '', '19', '1');
INSERT INTO `django_admin_log` VALUES ('96', '2024-03-16 22:35:24.948719', '2', '乐器表演', '3', '', '19', '1');
INSERT INTO `django_admin_log` VALUES ('97', '2024-03-16 22:35:24.952707', '1', '摇滚音乐', '3', '', '19', '1');
INSERT INTO `django_admin_log` VALUES ('98', '2024-03-16 22:54:23.783924', '2', 'MAAQUU&CH8 LIVEHOUSE', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('99', '2024-03-16 22:54:57.756306', '3', 'Billkin Tempo Tour', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('100', '2024-03-16 22:55:25.577818', '4', 'KPF-KpopFamily室内音 乐节', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('101', '2024-03-16 22:55:54.141593', '5', '王峥嵘 2024巡演 福州站【不象 艺术呈现】', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('102', '2024-03-16 22:56:30.828579', '6', 'ldol in Fuzhou Vol.31', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('103', '2024-03-16 22:56:59.383671', '7', '正经之夜·金曲捞正经乐队音乐会', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('104', '2024-03-16 22:57:27.227810', '8', '】浪漫古典·百年经典世 界名曲音乐会', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('105', '2024-03-16 22:57:51.150302', '9', '菊次郎的夏天-久石让轻音乐之旅钢琴音乐会', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('106', '2024-03-16 22:58:17.265477', '10', '开心麻花厦门原创都市大戏《海 阔天空》', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('107', '2024-03-16 22:58:41.720365', '11', '限时7折|俄罗斯芭蕾国家剧院《天鹅湖》2024巡演21周年.', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('108', '2024-03-16 22:59:11.100018', '12', '布衣乐队《回到未来》巡演福州站', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('109', '2024-03-16 22:59:33.474423', '13', '胡海泉 2024《春风归来了无 痕》巡演-福州站', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('110', '2024-03-16 22:59:57.973667', '14', '软柿子乐队2024年巡演《年少 的梦》', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('111', '2024-03-16 23:00:19.364230', '15', '蛙池 2024“长命功夫长命做”巡演', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('112', '2024-03-16 23:00:43.518279', '16', '永彬 Ryan.B「放个大招给你看3.0」2024全国巡演', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('113', '2024-03-16 23:02:08.972111', '17', '帆布小镇「色彩人生」2024巡演', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('114', '2024-03-17 11:33:41.980893', '50', '李荣浩《有理想》专辑CD', '2', '[{\"changed\": {\"fields\": [\"\\u5468\\u8fb9\\u4ef7\\u683c\", \"\\u56fe\\u6587\\u8be6\\u60c5\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('115', '2024-03-17 11:35:24.457285', '18', 'Order object (18)', '2', '[{\"changed\": {\"fields\": [\"\\u8ba2\\u5355\\u72b6\\u6001\"]}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('116', '2024-03-17 11:36:25.642503', '2', 'Notice object (2)', '1', '[{\"added\": {}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('117', '2025-03-17 15:44:01.583084', '12', 'Volbeat Tickets', '2', '[{\"changed\": {\"fields\": [\"Name\", \"Image\", \"Content\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('118', '2025-03-18 14:15:55.768039', '8', 'concert', '2', '[{\"changed\": {\"fields\": [\"TypeName\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('119', '2025-03-18 14:18:51.468171', '9', 'Rap and Hip-Hop', '1', '[{\"added\": {}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('120', '2025-03-18 14:19:38.236033', '10', 'Hard Rock/Metal', '1', '[{\"added\": {}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('121', '2025-03-18 14:20:38.478933', '7', 'R&B/Urban Soul', '2', '[{\"changed\": {\"fields\": [\"TypeName\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('122', '2025-03-18 14:23:38.814133', '6', 'Tribute Bands', '2', '[{\"changed\": {\"fields\": [\"TypeName\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('123', '2025-03-18 14:24:26.312867', '5', 'Clubs and Dance', '2', '[{\"changed\": {\"fields\": [\"TypeName\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('124', '2025-03-18 14:26:54.548809', '12', 'Volbeat Tickets', '2', '[{\"changed\": {\"fields\": [\"PerformType\", \"StartTime\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('125', '2025-03-18 14:29:50.914799', '16', 'Guildhall Jazz Showcase', '2', '[{\"changed\": {\"fields\": [\"Name\", \"PerformType\", \"Price\", \"Image\", \"StartTime\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('126', '2025-03-18 14:33:02.879145', '17', 'The Game - 20 Years of The Documentary', '2', '[{\"changed\": {\"fields\": [\"Name\", \"Price\", \"Image\", \"StartTime\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('127', '2025-03-18 14:36:26.954223', '13', 'Super Friendz Present', '2', '[{\"changed\": {\"fields\": [\"Name\", \"PerformType\", \"Image\", \"StartTime\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('128', '2025-03-18 14:40:23.692182', '15', 'Nikita Kuzmin', '2', '[{\"changed\": {\"fields\": [\"Name\", \"PerformType\", \"Price\", \"Image\", \"Content\", \"EndTime\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('129', '2025-03-18 14:46:38.251411', '14', 'Sugababes announce their biggest UK tour for spring 2025', '2', '[{\"changed\": {\"fields\": [\"Name\", \"PerformType\", \"Price\", \"Image\", \"Content\", \"StartTime\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('130', '2025-03-18 14:50:10.335765', '11', 'The UK\'s biggest rap export in recent years', '2', '[{\"changed\": {\"fields\": [\"Name\", \"PerformType\", \"Image\", \"Content\", \"StartTime\", \"EndTime\", \"Is_recommend\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('131', '2025-03-18 14:57:26.746898', '10', 'Lola Young', '2', '[{\"changed\": {\"fields\": [\"Name\", \"Price\", \"Image\", \"Content\", \"StartTime\", \"Is_recommend\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('132', '2025-03-18 14:59:40.319434', '9', 'Pure bottled rock \'n\' roll', '2', '[{\"changed\": {\"fields\": [\"Name\", \"PerformType\", \"Image\", \"Content\", \"StartTime\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('133', '2025-03-18 15:05:03.434047', '8', 'What\'s Love Got to do With it', '2', '[{\"changed\": {\"fields\": [\"Name\", \"PerformType\", \"Price\", \"Image\", \"Content\", \"StartTime\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('134', '2025-03-18 16:24:10.854418', '7', 'Thin Az Lizzy', '2', '[{\"changed\": {\"fields\": [\"Name\", \"PerformType\", \"Price\", \"Image\", \"Content\", \"StartTime\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('135', '2025-03-18 16:28:20.094324', '5', 'Madama Butterfly', '2', '[{\"changed\": {\"fields\": [\"Name\", \"Price\", \"Image\", \"Content\", \"StartTime\", \"EndTime\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('136', '2025-03-18 16:29:02.681541', '17', 'The Game - 20 Years of The Documentary', '2', '[{\"changed\": {\"fields\": [\"StartTime\", \"EndTime\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('137', '2025-03-18 16:29:20.172753', '16', 'Guildhall Jazz Showcase', '2', '[{\"changed\": {\"fields\": [\"StartTime\", \"EndTime\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('138', '2025-03-18 16:32:51.942424', '15', 'Nikita Kuzmin', '2', '[{\"changed\": {\"fields\": [\"StartTime\", \"EndTime\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('139', '2025-03-18 16:33:08.623691', '14', 'Sugababes announce their biggest UK tour for spring 2025', '2', '[{\"changed\": {\"fields\": [\"EndTime\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('140', '2025-03-18 16:33:26.889611', '13', 'Super Friendz Present', '2', '[{\"changed\": {\"fields\": [\"EndTime\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('141', '2025-03-18 16:33:39.414438', '12', 'Volbeat Tickets', '2', '[{\"changed\": {\"fields\": [\"EndTime\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('142', '2025-03-18 16:33:58.367160', '10', 'Lola Young', '2', '[{\"changed\": {\"fields\": [\"EndTime\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('143', '2025-03-18 16:34:27.867825', '9', 'Pure bottled rock \'n\' roll', '2', '[{\"changed\": {\"fields\": [\"EndTime\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('144', '2025-03-18 16:34:49.342079', '8', 'What\'s Love Got to do With it', '2', '[{\"changed\": {\"fields\": [\"Content\", \"EndTime\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('145', '2025-03-18 16:35:10.342998', '7', 'Thin Az Lizzy', '2', '[{\"changed\": {\"fields\": [\"EndTime\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('146', '2025-03-18 16:37:52.293888', '6', 'STORRY', '2', '[{\"changed\": {\"fields\": [\"Name\", \"PerformType\", \"Price\", \"Image\", \"StartTime\", \"EndTime\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('147', '2025-03-18 16:42:54.556406', '4', 'Art rock ban', '2', '[{\"changed\": {\"fields\": [\"Name\", \"Price\", \"Image\", \"Content\", \"StartTime\", \"EndTime\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('148', '2025-03-18 16:45:16.103255', '3', 'The Brighton-based metal giants', '2', '[{\"changed\": {\"fields\": [\"Name\", \"PerformType\", \"Price\", \"Image\", \"Content\", \"StartTime\", \"EndTime\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('149', '2025-03-18 16:45:28.866360', '3', 'The Brighton-based metal giants', '2', '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('150', '2025-03-18 16:48:16.421149', '2', 'Bruce Springsteen & The E Street Band return to the UK in 2025', '2', '[{\"changed\": {\"fields\": [\"Name\", \"PerformType\", \"Price\", \"Content\", \"StartTime\", \"EndTime\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('151', '2025-03-18 16:55:38.353351', '1', 'Audio & Video Products', '2', '[{\"changed\": {\"fields\": [\"TypeName\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('152', '2025-03-18 16:58:43.366365', '50', '1989 (Taylor\'s Version)', '2', '[{\"changed\": {\"fields\": [\"ProductName\", \"Price\", \"Image\", \"Content\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('153', '2025-03-18 17:01:29.978750', '49', 'IU\'s latest EP, \"The Winning,\"', '2', '[{\"changed\": {\"fields\": [\"ProductName\", \"Price\", \"Image\", \"Content\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('154', '2025-03-18 17:02:43.655147', '48', '\"Cha Jiyang \'For You\' Commemorative Edition LP Vinyl Record\"', '2', '[{\"changed\": {\"fields\": [\"ProductName\", \"Price\", \"Content\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('155', '2025-03-18 17:03:42.707954', '47', '\"RUBUR \'The Four Seasons of Persephone\' Album CD\"', '2', '[{\"changed\": {\"fields\": [\"ProductName\", \"Price\", \"Content\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('156', '2025-03-18 17:05:41.236330', '48', '\"Cha Jiyang \'For You\' Commemorative Edition LP Vinyl Record\"', '2', '[{\"changed\": {\"fields\": [\"Price\", \"Image\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('157', '2025-03-18 17:07:02.989075', '47', '\"RUBUR \'The Four Seasons of Persephone\' Album CD\"', '2', '[{\"changed\": {\"fields\": [\"Price\", \"Image\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('158', '2025-03-18 17:09:44.380799', '46', '\"Chuhaibu \'Before Sunrise\' Album CD\"', '2', '[{\"changed\": {\"fields\": [\"ProductName\", \"Price\", \"Image\", \"Content\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('159', '2025-03-18 17:10:07.606535', '2', 'Model Figures & Toys', '2', '[{\"changed\": {\"fields\": [\"TypeName\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('160', '2025-03-18 17:14:11.136992', '45', 'Bridge Toys', '2', '[{\"changed\": {\"fields\": [\"ProductName\", \"Price\", \"Image\", \"Content\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('161', '2025-03-18 17:15:42.965227', '44', '\"Falling into Nightmare\" Series Finger Skateboard', '2', '[{\"changed\": {\"fields\": [\"ProductName\", \"Price\", \"Image\", \"Content\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('162', '2025-03-19 09:56:07.487422', '43', '\"Ti&Maily\" Action Figure Set', '2', '[{\"changed\": {\"fields\": [\"ProductName\", \"Price\", \"Image\", \"Content\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('163', '2025-03-19 09:57:35.253290', '42', 'Digital Samurai: Aierioe/Whiplash Physical Action Figure Album Blind Box', '2', '[{\"changed\": {\"fields\": [\"ProductName\", \"Price\", \"Image\", \"Content\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('164', '2025-03-19 09:58:10.934882', '9', 'Custom Products', '2', '[{\"changed\": {\"fields\": [\"TypeName\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('165', '2025-03-19 09:59:31.641493', '41', 'Perfect Handstand – \"Moon Love Poem\"', '2', '[{\"changed\": {\"fields\": [\"ProductName\", \"Price\", \"Image\", \"Content\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('166', '2025-03-19 10:01:23.729956', '40', '\"H\" Letter Necklace – Clavicle Chain', '2', '[{\"changed\": {\"fields\": [\"ProductName\", \"Price\", \"Image\", \"Content\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('167', '2025-03-19 13:04:19.952433', '39', 'Eluveitie 2025 Tour Limited Edition Necklace', '2', '[{\"changed\": {\"fields\": [\"ProductName\", \"Price\", \"Image\", \"Content\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('168', '2025-03-19 13:06:30.619573', '38', 'Wang Weima x Soulsense Collaboration Tour Dupont Paper Packaging', '2', '[{\"changed\": {\"fields\": [\"ProductName\", \"Price\", \"Image\", \"Content\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('169', '2025-03-19 13:07:37.957646', '10', 'Clothing & Accessories', '2', '[{\"changed\": {\"fields\": [\"TypeName\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('170', '2025-03-19 13:08:29.060473', '37', 'Muma Band 2025 Tour Limited Edition Embroidered T-Shirt', '2', '[{\"changed\": {\"fields\": [\"ProductName\", \"Price\", \"Content\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('171', '2025-03-19 13:50:13.321042', '36', '【Blacken Acid Mass】 Limited Edition Short-Sleeve T-Shirt', '2', '[{\"changed\": {\"fields\": [\"ProductName\", \"Price\", \"Image\", \"Content\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('172', '2025-03-19 13:57:37.226049', '35', '【Blacken Acid Mass】 Limited Edition Short-Sleeve T-Shirt', '2', '[{\"changed\": {\"fields\": [\"ProductName\", \"Price\", \"Image\", \"Content\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('173', '2025-03-19 14:06:36.989748', '35', 'AFGK (A Few Good Kids)', '2', '[{\"changed\": {\"fields\": [\"ProductName\", \"Price\", \"Image\", \"Content\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('174', '2025-03-19 14:11:59.923372', '34', 'The White Paper Band\'s \"I\'m Not Happy\" T-Shirt', '2', '[{\"changed\": {\"fields\": [\"ProductName\", \"Price\", \"Image\", \"Content\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('175', '2025-03-19 14:14:16.256998', '33', '【Ti&Maily】Wheatfield Music Festival Sports Frisbe', '2', '[{\"changed\": {\"fields\": [\"ProductName\", \"Price\", \"Image\", \"Content\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('176', '2025-03-19 14:17:10.036421', '32', '\"Do You Want to Buy Groceries?\" Limited Edition Canvas Tote Bag', '2', '[{\"changed\": {\"fields\": [\"ProductName\", \"Price\", \"Image\", \"Content\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('177', '2025-03-19 14:19:00.302145', '31', 'Xie Tianxiao 2025 \"Instinct\" Tour Limited Edition T-Shirt', '2', '[{\"changed\": {\"fields\": [\"ProductName\", \"Price\", \"Content\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('178', '2025-03-19 16:26:14.404444', '2', 'Bruce Springsteen & The E Street Band return to the UK in 2025', '2', '[{\"changed\": {\"fields\": [\"Image\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('179', '2025-03-19 16:28:05.845747', '2', 'Bruce Springsteen & The E Street Band return to the UK in 2025', '2', '[{\"changed\": {\"fields\": [\"Image\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('180', '2025-03-19 16:49:25.175897', '2', 'Notice object (2)', '2', '[{\"changed\": {\"fields\": [\"Title of notice\", \"Content of the notice\", \"Release time\"]}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('181', '2025-03-19 16:51:01.057879', '1', 'Notice object (1)', '2', '[{\"changed\": {\"fields\": [\"Title of notice\", \"Content of the notice\", \"Release time\"]}}]', '16', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('10', 'cart', 'cart');
INSERT INTO `django_content_type` VALUES ('14', 'collection', 'collection');
INSERT INTO `django_content_type` VALUES ('15', 'comment', 'comment');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('16', 'notice', 'notice');
INSERT INTO `django_content_type` VALUES ('11', 'order', 'order');
INSERT INTO `django_content_type` VALUES ('12', 'orderitem', 'orderitem');
INSERT INTO `django_content_type` VALUES ('17', 'perform', 'booking');
INSERT INTO `django_content_type` VALUES ('20', 'perform', 'interaction');
INSERT INTO `django_content_type` VALUES ('18', 'perform', 'performevent');
INSERT INTO `django_content_type` VALUES ('19', 'perform', 'performtype');
INSERT INTO `django_content_type` VALUES ('9', 'product', 'product');
INSERT INTO `django_content_type` VALUES ('13', 'scorerecord', 'scorerecord');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('8', 'type', 'type');
INSERT INTO `django_content_type` VALUES ('7', 'user', 'user');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2023-07-08 18:23:21.755357');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2023-07-08 18:23:21.755357');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2023-07-08 18:23:21.755357');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2023-07-08 18:23:21.755357');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0003_logentry_add_action_flag_choices', '2023-07-08 18:23:21.755357');
INSERT INTO `django_migrations` VALUES ('6', 'contenttypes', '0002_remove_content_type_name', '2023-07-08 18:23:21.755357');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0002_alter_permission_name_max_length', '2023-07-08 18:23:21.755357');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0003_alter_user_email_max_length', '2023-07-08 18:23:21.755357');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0004_alter_user_username_opts', '2023-07-08 18:23:21.755357');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0005_alter_user_last_login_null', '2023-07-08 18:23:21.755357');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0006_require_contenttypes_0002', '2023-07-08 18:23:21.755357');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0007_alter_validators_add_error_messages', '2023-07-08 18:23:21.755357');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0008_alter_user_username_max_length', '2023-07-08 18:23:21.755357');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0009_alter_user_last_name_max_length', '2023-07-08 18:23:21.755357');
INSERT INTO `django_migrations` VALUES ('15', 'auth', '0010_alter_group_name_max_length', '2023-07-08 18:23:21.755357');
INSERT INTO `django_migrations` VALUES ('16', 'auth', '0011_update_proxy_permissions', '2023-07-08 18:23:21.755357');
INSERT INTO `django_migrations` VALUES ('17', 'auth', '0012_alter_user_first_name_max_length', '2023-07-08 18:23:21.755357');
INSERT INTO `django_migrations` VALUES ('18', 'sessions', '0001_initial', '2023-07-08 18:23:21.755357');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  KEY `django_session_expire_date_a5c62663` (`expire_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('1m7pioefh3gqko6a5qi5ylok4jfkducn', '.eJyrVipOLS7OzM-LLy1OLYrPLPbJT8_MU7IqKSpN1UGTS1GyMkQTAxF5ibmpSlZKVRmJeenFiXlKaEoyUhNTUouACvRzU1MyE_UhfL2sgnSlWgDZbS7t:1rrBHW:eWV9dLFZUDXTDtN-SfiC5FsgneuIedcQyF28ht_1Jps', '2024-04-15 06:36:34.917711');
INSERT INTO `django_session` VALUES ('3fy62ycsjv2fz3zyo2lff7ho7kz4yxnt', '.eJzNmEtzmzAQgP9KhnPiAEIgcuy9x57qTkaPJabh4RHQmUwm_70I7BoEmIeVaS4s1q53tfshsejdeqZVeXiuCpDPsbCeLMe6744xyl8hUwrxm2Yv-Y7nWSljtlMmu5O22H3PBSTfTrY9BwdaHOp_E5eTADgOcMg4Rtzh2CaU1zJEQJAbeCB84oY0QBED5iDBqUAQEiAe4MhXTlPIqqL29fN9b2U0hb31dLe3nP2-QratBHY9oQSK7FoE2CW18F0U7K372jKu597-J6LyLqIPPJY8gVaZqgwKpe673-BW5d2qKpm0mkcq0jh7VJr20uqpED8mTWrlyYxJoILLKmUjEzSQ_8f9nZmcP34pJcRC6RzbdvUBRw_lXmbvR46nQjoRVcLzVUgSsVBNgAdMDQaE3cbSXBCdbfl2hPYyyfZispCt8eqMkDbkWAPt6QNID406z20vKK5_NoNc6QJGG-HZ_o2reDLIetZHmYuKl__kJHHdcCF347UZW-Eb66GD9fUBfIV0_2Ezxrbv1heoeWpdSrawBRnlMj1L-APZNcBj1uspb63L7HpeXgsdI5n1fdt-qVXu-s45ZvyFqrx9nwxnfRNG1WsgCP1bnmaW569x9jJf4bPhF6ru8gpo1XVsvdyBHsy7zP8UBiOMTe5NXbfr-eVS1K1ge9XZZVWSzAIykOAIoOVJ6Uj0ltAZtIR4asaEgXpH-Tb_NED9IBtxxSWknbtN2IwXYQbimsR1gnqv5wx6Pb-zS2CkfhHMI6MdQMftemw8TxLgZZz3bjeBM5Dq2Ia4OD2dhd6eOYP2LOg-atxrBGv3XaY-_nBkekOcCrIFXJqqjussNyEzXoDRtbYtaZ0e0QcGbzQyyAa7tv_pOEeCrMdZ8FyChPoqevebsBovxDTW1clrFF29UXEGfWF4ySa0nabDCsAoyK7b9eiyvIw5nMVkm9k3W9hkGsh9hN3yfHVaeg_jDnqY9u3arnjefsYTrvZxRJqDtMBDw5iFilkcYkjEA03KWWC3nESqA9qZk8iLyUJMZpIeKeXG40fXG_MF9Yodn4VyUjzw_OVKyV5kXh1natba_PeiLUpULxnWBwa9XNMxgupoSMibMyPkNMKPQA2Sya-0opJHGReDDaQo3xJgMS2Wlevm6HqKdYtkffwFhl--rQ:1rlkk4:PnCoaPJ214n7Nur2f_IKUmRrVljZ-KxRrYNg4kMpQr4', '2024-03-31 07:15:36.625953');
INSERT INTO `django_session` VALUES ('5pxwcjjln46nsx3atv1lt1vnqg3l05ud', '.eJzFWE1zmzAQ_SsM58S2wGDsW9N2emnaTNuc6k5GIGEr4cOVoDNJJv-9EmA7XsCRZWZyQXh39bT73rCS9WwLKgTLs7tSUH7HxNd8xTJ7UfCSXgAfsRcI2NQjwym1F_bTGmcrgTMbhKwpJpTLgHFKCcPj-vfofrOSkXe4LNZ7eBsd2kIcPdBMOci9RM9HUZ4VnIUjFTJqvGJ0nROaXDWxBwBrLNZyNkaTiMauN5mHwQyheewgNyY-Jh7xqIeJQ-I4JDiI0Mydudj3XBoHaOo60unEfqBAU5qVQmL9fl7aquSlvbCWNlouS3cyQbdytaV9IS1M5lj7YsytGF9GjEcJrZ2pylQo9yHMkenlzlXypPaMMUlZNlae-lH7MSG3vSHS2YSFXCoQ8TINOxI5oZ6XC-u0Gl7-KCdlRPnQZOJAA4KQTpPNz5LzvMwIy1bWDc9JGRXWr8cNPYPxMyChDoWcVj96ddiHaOpwZuWQSFMYINAUGly4kNvkfUN5nPPUusYZXlH57RRnaLUFu8rzB1mBgUSbGmEc1gj9QsFATbmMy4b8nVYqlMPvg_v8T0-BPt6akSqYt8k7iH4vBnVKhvzN-sAMOwMg5HiP6Ap-L_IMekMADR4Enx7paYP0iQ5gE9HqmbuxXzAQqCnWIDRoNPjT9EMTqN8cruE1iX_n8gA3jGIVlIFGuZrXPKE-WZkkb4pgWAukRCd_SDQ89qDWscc_SI7QArNEDEi49amGNCWeFTR99WYkwJk1dgqhWRfkH55qUOtUM2uS_ZgnCY0K-d9mGDX2eAZSRLvJr1-NxDinPsiVdk2QdR8aWhtI8HeXZ6oyG0qEVBOhrUA1czcacW9eVJt5nUIgy3DfRq1D0Hy7YUU5V_vLDypfyEANSYHSGtFAAaFm82r2wbuREmfX2dqUtWsDGjhwM0atzfhDWaxlRizC1eeKM2Ipk8z8CXd_fEItKNaMJuQSJ8VxWb7I08Smo5GK7d95cRnlq25R1PXLeKUA-s9Or2I0j00DFAw51C0SquN0XX307Tr99zcVB8fvb_Yh78fS28VBflxoaJ1wvuUyRTpMB6mxDJpHVk3cDr0aHIZp6nBqgd0Endg1PGiYQljZ4dTdphyCeeRXv1A1-DFVxsAPetYUJd9wJlpUiuIxoSHDQoOUIVaHJcpTg_3yH_4tTQQ:1tuxAO:dkrpBU5i5cGjNadLjq7AcVPLGjXM8zlm1CwKulE8Ul0', '2025-04-02 17:25:20.271714');
INSERT INTO `django_session` VALUES ('6325rkqpchd2s0bh9v5upwn68i8a1uk0', '.eJzNmEtzmzAQgP9KhnNiI4RAzrHn9thT3ckIPWwSHh4JOpN28t8rgV0bAQFjZZoLa7TrXe1-SCz64ymuVFoWT7Xi8ilVX8tdWniPlaz5vaVj3iOwxsylIDn3Hr3fe1LsFCk8y2TPCeNSG6xzzlKybu9Xz4edtnwidbU_u_dAdywh9IUXRsGetfdyRcuikmmyMiaro1atvpWMZ1-Oth0He6L2-t8E-JQLiPxNgmMANiIAULCIMMQQR4QFTIiEEUxBDGNIIgS5wCCEgVYGIsLGac6LWmlfP_5sPZPy1nu823pgu62h7xuBgpAZAYWvRYwCrEUUwHjr3WvLVM-9_Y8g8k6QB5pKmvFWmZsMlFF33S9wa_JuVbXMWs2asDwt1kbTXlo9Yez7qIlWHs0SqYlRWefJwAQd5P92f-cm57efRslTZnTA9wN7ANihgvPsIwFCExIIYkQYmZBYJBszARonZjDGyW0s3QWx2VavB95eRtmeTWaydV6dAdKOHFugQ3sA2qHhxXPbCYr0bTNIjS5OSCNCP7pxFY8GuZ71QZasptU_OUrcNpzJ3Xlthlb4wnrYYCN7AL1DuvuwOWPbdRsx2Dy1AcFL2HIpSpmfJP_Fi_cAD1lfT3lpXSbX8_xa2BjxpO_b9kurcu_vnEPGn6jKy_fJzaRvnBDzGog30S1Pc1KWL2mxm67wyfATVXd-BazqAt8ud2wHC8_zP4ZBECGXe9Ol2-v5lVK36serza6os2wSkIMEBwDNT8pGYreEoNcSorEZ44Sbd1Tk0w8D1A2yEFda8fzi1yJszoswAfGaxG2Cdq8Her1edLFLIGjuMKLCaQdw4fZ6bLTMMk4r_cV8-XMROAepDm2Is9OzWdjtGei1Z_Hlo0bDRiTtvpuYjz8kXG-IY0GWgMtz03Gd5CJkzgswuNaWJW3Tw_ZA742Ge9mgwI8-HOdAkOtxKlpKLrm-ss7vRVidF2Ic69XJWxQDu1EBvb5wc85m44Omw4q5U5CXbq9HV5RVSvlJjLaZXbOZTaaD3AfYzc_XpmX3MEGvh2nfru2Kp-1nPKZmH4e4OUiLQ9iPqUxMtU95xh5IVk0Cu-Uk0hzQTpxEnk1mYnKT9EApFx4_BuGQL65X7PAsjBP1QMvdOyXbybI-TNSstfnvRZuVqF0yZA_0ermmY-Smo8Eb2pwZQdCISHAziEe_0lQtDzJVvQ1EVa8ZT1Ki5pXr5uh2irpF8t7-ApK87K8:1sBmZt:wrmmBOHss_3YmC17i9Y9-gN0u0SKkLb-pfZi8QaX5AU', '2024-06-11 02:28:41.289779');
INSERT INTO `django_session` VALUES ('6v8mm05ut0424negtlyv4r9nsffd6t3s', '.eJzNmEtzmzAQgP9KhnPiAEIgcuy9x57qTkaPJabh4RHQmUwm_70I7BoEmIeVaS4s1q53tfshsejdeqZVeXiuCpDPsbCeLMe6744xyl8hUwrxm2Yv-Y7nWSljtlMmu5O22H3PBSTfTrY9BwdaHOp_E5eTADgOcMg4Rtzh2CaU1zJEQJAbeCB84oY0QBED5iDBqUAQEiAe4MhXTlPIqqL29fN9b2U0hb31dLe3nP2-QratBHY9oQSK7FoE2CW18F0U7K372jKu597-J6LyLqIPPJY8gVaZqgwKpe673-BW5d2qKpm0mkcq0jh7VJr20uqpED8mTWrlyYxJoILLKmUjEzSQ_8f9nZmcP34pJcRC6RzbdvUBRw_lXmbvR46nQjoRVcLzVUgSsVBNgAdMDQaE3cbSXBCdbfl2hPYyyfZispCt8eqMkDbkWAPt6QNID406z20vKK5_NoNc6QJGG-HZ_o2reDLIetZHmYuKl__kJHHdcCF347UZW-Eb66GD9fUBfIV0_2Ezxrbv1heoeWpdSrawBRnlMj1L-APZNcBj1uspb63L7HpeXgsdI5n1fdt-qVXu-s45ZvyFqrx9nwxnfRNG1WsgCP1bnmaW569x9jJf4bPhF6ru8gpo1XVsvdyBHsy7zP8UBiOMTe5NXbfr-eVS1K1ge9XZZVWSzAIykOAIoOVJ6Uj0ltAZtIR4asaEgXpH-Tb_NED9IBtxxSWknbtN2IwXYQbimsR1gnqv5wx6Pb-zS2CkfhHMI6MdQMftemw8TxLgZZz3bjeBM5Dq2Ia4OD2dhd6eOYP2LOg-atxrBGv3XaY-_nBkekOcCrIFXJqqjussNyEzXoDRtbYtaZ0e0QcGbzQyyAa7tv_pOEeCrMdZ8FyChPoqevebsBovxDTW1clrFF29UXEGfWF4ySa0nabDCsAoyK7b9eiyvIw5nMVkm9k3W9hkGsh9hN3yfHVaeg_jDnqY9u3arnjefsYTrvZxRJqDtMBDw5iFilkcYkjEA03KWWC3nESqA9qZk8iLyUJMZpIeKeXG40fXG_MF9Yodn4VyUjzw_OVKyV5kXh1natba_PeiLUpULxnWBwa9XNMxgupoSMibMyPkNMKPQA2Sya-0opJHGReDDaQo3xJgMS2Wlevm6HqKdYtkffwFhl--rQ:1rlkln:z8XAk2VrQ_6mjmnDUiG2_oXJHHjer-0t4JHvNKNjU-U', '2024-03-31 07:17:23.461387');
INSERT INTO `django_session` VALUES ('6z40yk1rnrxszjizdxd63je6n4ydc9pt', '.eJzNmUtzozgQgP9KinPiIIRA9nHPO8c5radSQg-bGR4uCbYqM5X_vgictWkgYKzUzIUGdbtb3R8SDf7lvbC6Or7URuqXVHg7D3mP12MJ4z9kYRXiOysO5YaXRaXTZGNNNmet2Xwphcz-Otv2HByZOTa_ZsjnUmHibxMaI7RVAcJKREwQQSRhIhBKJYJRjmIcYxYRLBVFIQ4aZaAiap3msqhN4-ufX3uvYLnce7uHvYf2-xr7vhUkCIUVWPmNiElAGxEFON57j41l2sy9-41i-kGxJ55qnslOmdsMjFX33a9wa_PuVLXOOs0zE3laPFtNd-j0TIivkyaN8myWaMkE13WejEzQQf5vjw9ucn77ZpUyFVaHfD-AAwiGCi6zjxQKbUikmBVhZENSlWztBHic2MGYJvexdBcEsq1eT7I7TLK9mCxk67w6I6QdOQagQziAYWh8dd_2gpLmsh3kVhcnrBWhH925iieD3M76pEtR8-p_OUkcGi7k7rw2Yyt8ZT0g2AgOkA9I9282Z2z7biOB27s2YHQNW6lVqfN3Kf-VxUeAx6xvp7y2LrPreXktIEY66_u-_RJU7uOdc8z4D6ry-n1yO-ubJsw-BuJtdM_dnJTlj7Q4zFf43fAPqu7yCoDqIh-WO4bBwsv8z2EIJsTl3nTt9nZ-pRZNK9gdIbuizrJZQA4SHAG0PCmIBLaEaNASkqkZ00TaZ1Tk808D1A-yEldayfzqbBU250WYgXhL4pAg7PXQoNeLrnYJgu0VJVw57QCu3N6OjZdZJnmVlr3TVeAcpDq2IS5OD7KA7RkatGfx9a3Gw1Yk3b6b2Jc_olxviFNB1oDLc9txvctVyJwXYHStrUsa0qNwYPBEo4NsSOBHn45zJMjtOA0vtdSyOYre-SqszgsxjfXm5AHFADYqaNAXbi_ZbH3UdlixdAry2u3t6IqySrl8F5NtZt9sYZPpIPcRdsvzhbRgDxMMepju6dqteN69xlNu93FM2w9pcYiHMY2NaY6pzMQTy6pZYPd8ibQfaGe-RF5MFmJyk_RIKVd-fgzCMV-yWbHjs7BOzBMvDx-U7KDL-jRTs87mtxdtUaKwZAQODHq5tmOUtqOhW95-M8KoFZGSdpBOvqWZWp90agYbiKleM5mkzCwr193RYYpNi-Q9ekYa03R9579CzN_lIS28XaVrCXXC2yEwZg92kt7O-3lkxcGwAro8NllJ3Rg851Kk7Lm73nw_Hby3_wA9HOyv:1rxEwH:hdi2WR78LCFHOsSswTPzojc6oia8WBdxBe-SDEL8vbM', '2024-05-01 23:43:41.949382');
INSERT INTO `django_session` VALUES ('7r4pdhpgw44jyzzrlgia0lxvuyag4hwj', '.eJzNmUtzozgQgP9KinPiIIRA9nHPO8c5radSQg-bGR4uCbYqM5X_vgictWkgYKzUzIUGdbtb3R8SDf7lvbC6Or7URuqXVHg7D3mP12MJ4z9kYRXiOysO5YaXRaXTZGNNNmet2Xwphcz-Otv2HByZOTa_ZsjnUmHibxMaI7RVAcJKREwQQSRhIhBKJYJRjmIcYxYRLBVFIQ4aZaAiap3msqhN4-ufX3uvYLnce7uHvYf2-xr7vhUkCIUVWPmNiElAGxEFON57j41l2sy9-41i-kGxJ55qnslOmdsMjFX33a9wa_PuVLXOOs0zE3laPFtNd-j0TIivkyaN8myWaMkE13WejEzQQf5vjw9ucn77ZpUyFVaHfD-AAwiGCi6zjxQKbUikmBVhZENSlWztBHic2MGYJvexdBcEsq1eT7I7TLK9mCxk67w6I6QdOQagQziAYWh8dd_2gpLmsh3kVhcnrBWhH925iieD3M76pEtR8-p_OUkcGi7k7rw2Yyt8ZT0g2AgOkA9I9282Z2z7biOB27s2YHQNW6lVqfN3Kf-VxUeAx6xvp7y2LrPreXktIEY66_u-_RJU7uOdc8z4D6ry-n1yO-ubJsw-BuJtdM_dnJTlj7Q4zFf43fAPqu7yCoDqIh-WO4bBwsv8z2EIJsTl3nTt9nZ-pRZNK9gdIbuizrJZQA4SHAG0PCmIBLaEaNASkqkZ00TaZ1Tk808D1A-yEldayfzqbBU250WYgXhL4pAg7PXQoNeLrnYJgu0VJVw57QCu3N6OjZdZJnmVlr3TVeAcpDq2IS5OD7KA7RkatGfx9a3Gw1Yk3b6b2Jc_olxviFNB1oDLc9txvctVyJwXYHStrUsa0qNwYPBEo4NsSOBHn45zJMjtOA0vtdSyOYre-SqszgsxjfXm5AHFADYqaNAXbi_ZbH3UdlixdAry2u3t6IqySrl8F5NtZt9sYZPpIPcRdsvzhbRgDxMMepju6dqteN69xlNu93FM2w9pcYiHMY2NaY6pzMQTy6pZYPd8ibQfaGe-RF5MFmJyk_RIKVd-fgzCMV-yWbHjs7BOzBMvDx-U7KDL-jRTs87mtxdtUaKwZAQODHq5tmOUtqOhW95-M8KoFZGSdpBOvqWZWp90agYbiKleM5mkzCwr193RYYpNi-Q9ekYa03R9579CzN_lIS28XaVrCXXC2yEwZg92kt7O-3lkxcGwAro8NllJ3Rg851Kk7Lm73nw_Hby3_wA9HOyv:1thtB2:5qoYZGz90g0wA3RWpPRvZTl9pu_f4VW44_CX-Ev0zak', '2025-02-25 16:32:00.963135');
INSERT INTO `django_session` VALUES ('a9wuecjypota0n87v7zt451eye7q9wse', '.eJzFWF1vmzAU_SuI5zaJIRDSt3Wb9tSt2tanZaqMbRJWPiIbJnVV__tsIF8XSB2D1BdMfa-P7zlHuXZ5sR9xWWweS8H4Y0ztGxvZV8dzISZPLFMB-gdn63xC8qzgcThRKZMmKiZ3OWXJbZN7ArDBYiNXYzQjLHK92TIMFggtIwe5EfUx9ajHPEwdGkUhxQFBC3fhYt9zWRSguevIoBP5gQJNWVYKifXrZWVnOGUr-8Za2Wi1Kt3ZDD3I3Vb2lZyJZY11LMLcivA1iTlJWB1MVaVChU9hziwv96GSJ3VkimkaZ1MVqR91HFP60Jsig01ayBmmhJdp2FHIBXxer6zLOLz-VkEWUxVDs5kDJxCEdJpqfpSc52VG42xt3fOclqSwfj5v2QDFB0BCHwq5rH70-nBI0fRhIHMopCkMMGgOJ1y4kdvUfc94lPPUusMZXjP52ykGeLUDu83zJ8nAwKJtjTANa4R-o2Cipl3GtKF-l1GFdvh9cJ__6jnQp1szMgXztngn2e-loA5lqN-iD8ywMwBBzveIruT3Es-gNwRwwoPg8zM9bZQ-0QFsYlq9cj_2GwYSNc0aRQaNBn-Zf2gG_VvCPbym8G-cMj6OYxWUgUe5Wtc8oT9ZmSRvmmDIBUqiUz8UGl57UOva458UR1mB40SMKLj1qYY0FT4uWHr0ZmTAQI6dRmjygvrDWw1q3WoWTbEf8yRhpIjzbBw3DngGVpD94uNXIzOG8INaaXOCqvtwonWABPsyU1XYWB6kmghtA6qV-9FIemNObd11eECN4amNWleg5e64IjlXp8t3Jl_oSO1IgbIa0cAAoVbzavXJu5ERg3m2jmRtbsADBx7FqHUUfyiLjawoJrj6seKMWmpKVv4Pd__0hNpQbGKW0GucFOdt-SLvEtuONip2_8yLa5Kvu01RH1-mawXQf3M6ytG8NI1AGGqoSxK643R9-Og7c_q_3lQanP96c0h5P5XeJgf1ceFE637zNZclsnE6SI1l0DyyauFu6PXgNE3Th0sJdgt0Ydfw4MQcwsoOp75syiFYEr_6C1WDHzE1GfhBz56i5Fsei5aUonhOWBhjoSHKGLtDivLOYL_-BxFjHgI:1tuxCa:qCsAl_MRY5rPr1jQ-gPcPtM2MG3_-ZUvPzDk88z-nPw', '2025-04-02 17:27:36.953583');
INSERT INTO `django_session` VALUES ('o8xr2zondotcioti3v7bf9pox52c9l0e', '.eJzFmE1zmzAQhv9KhnPiSCAkkWPvPfZUZzJCEjEpHx4-Dp2M_3tZk8Z4DTUQeXpBWLvs6tUjwcrv3otqm91LW9vqJTXek0e9-2FfrPQvW4DBvKnitdzosmiqNN6Ay-bDWm--l8Zm3z58zwLsVL3rno5YIiPDOPUJZZZH0hoRcsVDFsXEN5YEVGtORSRE4nOhWKCYCmKlCNWSGg1Bc1u0dRfr5_vWK1Rut97T3daj220bEAJN6DMDTZCQrhGhL7uG-4HYevedZ9qNvX8mUdVdoh50WunM9sYcFNRgPg-_Iizo7k1tlfWWR2XytHgES3_p7cqYH5MunfHDLa6sMrpq83hkgA70H-7v3Gg-PIPRpgZslBAfd1Ccyj-NXiiRQBLmQ-ZIagu_ZKDBpkUMwxEy_hpLd0kw2-b33vaXSbYnl5lsnc_OCGlHgRFohjsCnDoYrNuQcWiYPiqN1bFhhH9x3w7CLue5r0rT6uaznaSKHWeydaB_bN_O1owBcdwR4vDsNGIZK__4eghDl8SGYZcTKyvTvTb7K6ZVtFl2FYkDgSNI5ovCBCTuEDh8ODViGVtYB5zomwE6T7ISV9rYfHC3CpvzSbgCcYlwRJASjDTCyfhAjeTwluDC6GPSGL7FYeJ4z00mWY5Ul1lmdZOWZ7eroDqfhjGoK6VjqLjMoRdljhguUc36bOqGUCeTrIGad5V389muwul8Akb36DrRmB6uXehF7SIv1IQ-4TfHOZJkOc5al5WtbHc1Z_ersDqfiGmsi8VjirjAoRcFTnRSExEKi0gI6xTkMOxydEXZpNr-bSYL0nO3meWoA-0j7ObrxXBw7UMvap_-q9zv-GPhHDIJ73EeyONhVbDgMmcNOetdajPzoLLm-nnxC6d9-BPkymn_5DITkxvRY8fAdUd8n4zFst2OHR8FBKkfdPn6jyl7rcp2f2XOep__PmmzhOIpo3hpR4dn7_AHUbQF3Q:1rizvz:-IE-Naf59V_KyWF_TQwZTfwajtY--jED0Wpuk8rIaKw', '2024-03-23 16:52:31.146324');
INSERT INTO `django_session` VALUES ('p6yrk4c16eb5qq6qxmy8367aicbhvbfl', '.eJzNmEtzmzAQgP9KhnPiIIRA5Nh7jz3VnYyeMQ0Pj4DOZDL570Vg1yDAPKxMc2Gxdr2r3Q-JRe_OM6nKw3NVCPUcc-fJAc59d4wS9ioyreC_SfaS71ielSqmO22yO2mL3feci-Tbybbn4ECKQ_1vAlwmJERuRHEIQCQ9ACUPCEccCUS4x6WknGAGQhhCEiAoJAY-9GqlJwOsnaYiq4ra18_3vZORVOydp7u9A_b7CrquFsjzuRZQurUIkYdrEXgw3Dv3tWVcz739jyTqTpIHFiuWiFaZ6gwKre673-BW592qKpW0mkfC0zh71Jr20uoJ5z8mTWrlyYwqQThTVUpHJmgh_4_7Ozs5f_zSShFzrQOu65kDwAzlXWYfSODrkEASLfxAh8SSRnoCLKR6MMT0Npb2gphsy7ejaC-TbC8mC9lar84IaUuODdC-OQDN0LDz3PaCovpnM8i0LqSkEb4b3LiKJ4OsZ31UOa9Y-U9OEjcNF3K3XpuxFb6xHibYwBxAV0j3HzZrbPtuAw6bp9YjeAtboWSu0rMUf0R2DfCY9XrKW-syu56X18LEiGd937ZfGpW7vnOOGX-hKm_fJ6NZ35gS_RoIo-CWp5nm-WucvcxX-Gz4haq7vAJGdYFrljs0g_mX-Z_CIIiQzb2p63Y9v1zxuhVsrya7rEqSWUAWEhwBtDwpE4nZEoJBS4imZoyp0O-owGWfBqgfZCOuuBRp524TNutFmIG4JnGToNnrgUGvF3R2CQT1L4yYtNoBdNyux8byJBGsjPPe7SZwFlId2xAXp2eyMNszMGjPwu6jxvxG0HbfpfrjD0nbG-JUkC3g0lR3XGe5CZn1AoyutW1Jm_SwOTB4o-FBNshzg0_HORJkPc6C5UooUV95734TVuuFmMa6OnmDomc2KmDQF0aXbCIXNB1WKKyC7Lpdjy7Ly5iJs5hsM_tmC5tMC7mPsFuer0nL7GG8QQ_Tvl3bFc_az3jM9D4OcXOQFvpwGLPQMYtDLBL-QJJyFtgtJ5H6gHbmJPJishCTnaRHSrnx-NHzx3yJesWOz0I7KR5Y_nKlZC8qr44zNWtt_nvRFiVqlgyZA4NerukYhe5ocMSaMyMIGhFIoQfx5FdaUamjiovBBlKUb4mgMSmWlevm6GaKdYvkfPwFt0C-jw:1sKq1Q:x_uz1xGXam330u7Bm3O9GMYb9QhU-Z86iUaNO7mOk4o', '2024-07-06 01:58:32.807574');
INSERT INTO `django_session` VALUES ('rfk3c5viuw3rn9mrbpmp8cu00qf47t2g', '.eJzNmEtzmzAQgP9KhnPiAEIgcuy9x57qTkaPJabh4RHQmUwm_70I7BoEmIeVaS4s1q53tfshsejdeqZVeXiuCpDPsbCeLMe6744xyl8hUwrxm2Yv-Y7nWSljtlMmu5O22H3PBSTfTrY9BwdaHOp_E5eTADgOcMg4Rtzh2CaU1zJEQJAbeCB84oY0QBED5iDBqUAQEiAe4MhXTlPIqqL29fN9b2U0hb31dLe3nP2-QratBHY9oQSK7FoE2CW18F0U7K372jKu597-J6LyLqIPPJY8gVaZqgwKpe673-BW5d2qKpm0mkcq0jh7VJr20uqpED8mTWrlyYxJoILLKmUjEzSQ_8f9nZmcP34pJcRC6RzbdvUBRw_lXmbvR46nQjoRVcLzVUgSsVBNgAdMDQaE3cbSXBCdbfl2hPYyyfZispCt8eqMkDbkWAPt6QNID406z20vKK5_NoNc6QJGG-HZ_o2reDLIetZHmYuKl__kJHHdcCF347UZW-Eb66GD9fUBfIV0_2Ezxrbv1heoeWpdSrawBRnlMj1L-APZNcBj1uspb63L7HpeXgsdI5n1fdt-qVXu-s45ZvyFqrx9nwxnfRNG1WsgCP1bnmaW569x9jJf4bPhF6ru8gpo1XVsvdyBHsy7zP8UBiOMTe5NXbfr-eVS1K1ge9XZZVWSzAIykOAIoOVJ6Uj0ltAZtIR4asaEgXpH-Tb_NED9IBtxxSWknbtN2IwXYQbimsR1gnqv5wx6Pb-zS2CkfhHMI6MdQMftemw8TxLgZZz3bjeBM5Dq2Ia4OD2dhd6eOYP2LOg-atxrBGv3XaY-_nBkekOcCrIFXJqqjussNyEzXoDRtbYtaZ0e0QcGbzQyyAa7tv_pOEeCrMdZ8FyChPoqevebsBovxDTW1clrFF29UXEGfWF4ySa0nabDCsAoyK7b9eiyvIw5nMVkm9k3W9hkGsh9hN3yfHVaeg_jDnqY9u3arnjefsYTrvZxRJqDtMBDw5iFilkcYkjEA03KWWC3nESqA9qZk8iLyUJMZpIeKeXG40fXG_MF9Yodn4VyUjzw_OVKyV5kXh1natba_PeiLUpULxnWBwa9XNMxgupoSMibMyPkNMKPQA2Sya-0opJHGReDDaQo3xJgMS2Wlevm6HqKdYtkffwFhl--rQ:1rlkZY:znOFQu5ovn4g6z33RcHsq7fc3bYECtz4_iY1GmlEa-g', '2024-03-31 07:04:44.054963');
INSERT INTO `django_session` VALUES ('rl5cqdcfwnwt03lpm40ysw0o2834tb7r', '.eJzNmEtzmzAQgP9KhnNiI4RAzrHn9thT3ckIPWwSHh4JOpN28t8rgV0bAQFjZZoLa7TrXe1-SCz64ymuVFoWT7Xi8ilVX8tdWniPlaz5vaVj3iOwxsylIDn3Hr3fe1LsFCk8y2TPCeNSG6xzzlKybu9Xz4edtnwidbU_u_dAdywh9IUXRsGetfdyRcuikmmyMiaro1atvpWMZ1-Oth0He6L2-t8E-JQLiPxNgmMANiIAULCIMMQQR4QFTIiEEUxBDGNIIgS5wCCEgVYGIsLGac6LWmlfP_5sPZPy1nu823pgu62h7xuBgpAZAYWvRYwCrEUUwHjr3WvLVM-9_Y8g8k6QB5pKmvFWmZsMlFF33S9wa_JuVbXMWs2asDwt1kbTXlo9Yez7qIlWHs0SqYlRWefJwAQd5P92f-cm57efRslTZnTA9wN7ANihgvPsIwFCExIIYkQYmZBYJBszARonZjDGyW0s3QWx2VavB95eRtmeTWaydV6dAdKOHFugQ3sA2qHhxXPbCYr0bTNIjS5OSCNCP7pxFY8GuZ71QZasptU_OUrcNpzJ3Xlthlb4wnrYYCN7AL1DuvuwOWPbdRsx2Dy1AcFL2HIpSpmfJP_Fi_cAD1lfT3lpXSbX8_xa2BjxpO_b9kurcu_vnEPGn6jKy_fJzaRvnBDzGog30S1Pc1KWL2mxm67wyfATVXd-BazqAt8ud2wHC8_zP4ZBECGXe9Ol2-v5lVK36serza6os2wSkIMEBwDNT8pGYreEoNcSorEZ44Sbd1Tk0w8D1A2yEFda8fzi1yJszoswAfGaxG2Cdq8Her1edLFLIGjuMKLCaQdw4fZ6bLTMMk4r_cV8-XMROAepDm2Is9OzWdjtGei1Z_Hlo0bDRiTtvpuYjz8kXG-IY0GWgMtz03Gd5CJkzgswuNaWJW3Tw_ZA742Ge9mgwI8-HOdAkOtxKlpKLrm-ss7vRVidF2Ic69XJWxQDu1EBvb5wc85m44Omw4q5U5CXbq9HV5RVSvlJjLaZXbOZTaaD3AfYzc_XpmX3MEGvh2nfru2Kp-1nPKZmH4e4OUiLQ9iPqUxMtU95xh5IVk0Cu-Uk0hzQTpxEnk1mYnKT9EApFx4_BuGQL65X7PAsjBP1QMvdOyXbybI-TNSstfnvRZuVqF0yZA_0ermmY-Smo8Eb2pwZQdCISHAziEe_0lQtDzJVvQ1EVa8ZT1Ki5pXr5uh2irpF8t7-ApK87K8:1s4vsA:Ahc2idJzPKlId_-OCTYx2_uTQg_o9kN87khC9ZYySZU', '2024-05-23 04:59:14.843396');
INSERT INTO `django_session` VALUES ('rt0xqbpbkmv73on3tbrx200ncnjwopyr', '.eJzFmM2SoyAQgF9linMmEUXAHPe8e9zTZmoKARNn_UmhHram8u4LMTUxHd0kDlN7AUO33XR_gE3e0avo2t1r12jzmiu0RhgthmOpkL915QTqTVTbeinrqjV5unQqy5O0Wf6olS6-nXQvDOxEs7NvJyTjiSIUhwEmmiZcKxZTQWOSpEGodBBhKSlmCWNZSJkgkSAiSoUIsORYSWe01FXXWFu_3jeoEqXeoPXTBuHNpouCwHVxSJTroiywHYtDbjsaRmyDFlYzt3Pv38mEecrEs8yNLHQvLF0EjRNfmp9h1sXdizpT9JKVUGVerZykb3q5UOrnpIoVntRSo4WSpivTkQl6iP-wePIT8-HFCXWunAwHQQgHMHQVnmfPBMucExI6zwmX2v3ikXQyyVI3HcbTz7H05wSybf_sdd9Msj2r3MnWe3ZGSHsyDEATOBBB19Fg3caEuo7IY6SpOHYkoJ_ctwOzj_Pcm1p1sv3oJ6lCxTvZeoh_bN_eHTMEROFADM2T84x5KsLj8RDHPokNzT5OrDbKHpt9C2lVXVHcROIhwBEk9wcFCXA4wKD5eGrGPNVuHdBAfhmgSyczceWtLgdPs7B5T8INiI8EDgjiACJNoDM6iIZTd0pQpuTRaeq-xXHmec9NOnkcqayLQss2ry8eZ0H1noYxqDNDh1BhmYOvyhw2XKKS9N7EF0KddDIHamkr7_ajn4XTewJG9-i8oCE9WLvgq9qFX0UThwH9cpwjTh7H2cjaaKNtqy6eZ2H1nohprA8HDynCAgdfFTj9Od-voWMpFhPuTgYa8eP1h5Ho2mfjfDa7XBfqWRTt7RvIJ-6P7lp94_54VrmzDvUT9NjFYt6lEfMxW9qugfFZOCPNs6y3_0jZ1tTd_kbOep3_nrS7AoUpS-AAO7ygBWp009gP8OnfneZ7vc0rtG5Np6FMoXUIxlzjpobWyD2G0N7OpkcbK12VWuVi1f9evu236PAX4WSu8A:1rf0Nr:BaELjzmeoroDZm5A5TF-A5hZLTVn8c-l95yWawMvmLM', '2024-03-12 16:32:47.153931');
INSERT INTO `django_session` VALUES ('taeex3oxdltn8emvmfd2xluzm70x12aw', '.eJzNmUtzmzAQgP9KhnPiAEIgfOy5PfZUdzJ6LDYpD48EnUk7-e9F4NRGQMBYmfbCgna9q90PiQX_dp5oXR2eagXyKRXO1vGc-8sxRvkPKLRCPNNiX254WVQyZRttsjlp1eZLKSD7dLLtOThQdWh-TXxOIuA4wjHjGHGPY5dQ3sgYAUF-FIAIiR_TCCUMmIcEpwJBTIAEgJNQO82hqFXj69vvnVPQHHbO9m7neLtdjVxXC-wHQguUuI2IsE8aEfoo2jn3jWXazL37TULlXUIfeCp5Bp0y1xkore67X-FW592papl1mkcq8rR41Jru0OmpEF8nTRrlyYxJoILLOmcjE7SQ_-v9nZ2cX79rJaRC6zzX9c0Bzwzln2cfJl6gQ3oJ1SIIdUiSsFhPgEdMD0aE3cbSXhCTbfVyhO4wyfZsspCt9eqMkLbk2AAdmAPIDI0u7tteUNxctoNc6yJGWxG44Y2reDLI9ayPshQ1r_7KSeKm4ULu1msztsJX1sMEG5oD-B3S_ZvNGtu-21Cg9q71KVnDFmRSyvxNwk8o3gM8Zn095bV1mV3Py2thYiSzvm_bL43Kvb9zjhn_R1Vev0_Gs74Jo_oxEMXhLXczK8sfabGfr_Cb4X9U3eUVMKrruWa5IzNYcJ7_KQxGGNvcmy7dXs-vlKJpBbujya6os2wWkIUERwAtT8pEYraE3qAlxFMzJgz0Myp0-YcB6gdZiSutIL84W4XNehFmIF6TuEnQ7PW8Qa8XXuwSGOkrgnlitQO4cHs9Nl5mGfAqLXunq8BZSHVsQ1ycnsnCbM-8QXsWXd5qPGgF6_Zdpl_-cGJ7Q5wKsgZcnuuO602uQma9AKNrbV3SJj1iDgyeaGSQDfbd8MNxjgS5HqfipQQJzVH0zldhtV6IaaxXJ29Q9M1GxRv0hfE5m9j12g4rAqsgL91ej64oq5TDm5hsM_tmC5tMC7mPsFuer0nL7GH8QQ_TPV27Fc-713jC9T6OSPshLQrQMKbSMdUhhUw80KyaBXbLl0j9gXbmS-TZZCEmO0mPlHLl50c_GPMFzYodn4V2oh54uX-nZHtZ1seZmnU2_7xoixI1S4bNgUEv13aMoDsaEvP2mxHyWhEmoAfJ5FuaquVRpmqwgajqJQOWUrWsXDdHN1NsWiTn3lGgVNP1nf4KUZ_LfVo420rWYOqEsw2MMX3Qk3S2Tvbrl-nt0CQEstE95iBS-thdb56Pe-f1D3cX6tY:1rlkmT:DoMCFCmRz-_M7_0Y4Ct-wAPHswsMEo6tHEJ4zaHrQ8I', '2024-03-31 07:18:05.624362');
INSERT INTO `django_session` VALUES ('wudq5j8q9l5a9snqpaocg3ufhm0cmtme', '.eJzFmM-TmyAUx_-VHc7ZBBRBc-y5PfbU7OwgYOLWHxnUQ2cn_3slpo150UZddnoBw3t5jy8fMI-8o1fR1IfXptLmNVVoiwha9cdiIX_qwhrUmyj25VqWRW3SeG1d1hdrtf5WKp19ufjeBDiI6tB-O6JJGCnKiIcJ1SwKteIBEyygUYw9pbFPpGSER5wnHuOC-oIKPxYCExkSJW3QXBdN1cb68b5Dhcj1Dm2fdojsdo2Pse0Cjyrb-QluOx54Ydsxz-c7tGo903bu3XcSYZ4S8SxTIzPdGXOroLLm2_ALwlrdnakxWWfZCJWnxcZauqazC6W-j7q0xotbbLRQ0jR5PDBBB_pPqyc3mk8v1qhTZW0EYw8OEJjKu86eC57YJNSzmaNQavsp9KW1SR7b6fAw_hhLd0kg2_rXUXfNKNury0S2zldngLSjwAA0hQM-TO339m1Ame2oPCuNxbmjmH3w3PbCzud5NKVqZP23H6UKHSeydaB_6NxO1gwBMTgQwPD0OuMwFt759RAELon1w84nVhrVvja7FtIqmix7iMSBwAEk00VBAiEc4DB8MDbjMNZ2HzAsPw3QbZKFuNJa572nRdicL8IDiHOEA4IEQ6QRTMZ6akJm3xKMK3lOGtvf4iBxfOZGk8xHKsss07JOy5vHRVCdL8MQ1IXSIVRY5pC7Mof3t6ikXTbxiVBHkyyBmreVd_23X4TT-QIMntFloiE9WLuQu9olvFMTeJh9Os6BJPNxVrI02ui2VTfPi7A6X4hxrLPFQ4qwwCF3BU50VRNhYjcR59opyH7Y-eiKsk6l_tONFqS3bhPLUQfaB9hN1wvhwNqH3NU-3a9yd-LPhXNAQ_seZ354vqxy6t_nrGzO6pDqTD2LrH58X_zAbd_-CfLgtn91mYjJjeiha-CyK76Hh2Lp9sQOz8IGqZ5luf_Hku1N2RwfrFnn898XbZJQuGQEbu3o9IJWqNJV1ZZLl__iqq_lPi3QtjaNhjaFtgSM2cZODW2RfSQw3qFdHm1a6ybXKhWb7vP67bhHp9_5SDKT:1rhTjH:YHfZs4QBamWbERz4X0EgSFVvaW4ioRd0inEJFkz37-s', '2024-03-19 12:17:07.128804');
INSERT INTO `django_session` VALUES ('x82o35zzxojyv4bppn5i2o5c6n70f0p6', '.eJzFl02ToyAQhv_KlOeZBBQBc9zz7nFPm6kpBEyc9SOFetiayn9fiKmJ6egmMUztBZRuu3l5UJuPoNFNk9fVW9do85Y33-tNXgWr1nT6GdhUsIrAmGsqUepgFbjLKAD2rRZKG2tdllrlYtnfL953G-v5Jrp2e4od4POxVMjfunIG9S6qTb2QddWaPF04l8XR2ix-1EoX346-ZwG2otnapxOS8UQRikOEiaYJ14rFVNCYJCkKlUYRlpJiljCWhZQJEgkiolQIhCXHSrqgpa66xsb69bEOnN51sHpaB3i97iKEXBeHRLkuypDtWBxy29EwYuvg2Xrmdu79M5kwT5l4kbmRhe6NpVPQOPN5-Blhne7e1JmityyFKvNq6Sx909uFUj8nXazx6JYaS0yarkxHJuhB__75yY_m_asz6lw5G0YohAMYpgpPs2eCZS4JCV3mhEvt7ngknU2y1E2H8fQxlv6SQLbtn53um0m2J5cb2XpfnRHSngID0AQORDB1NNi3MaGuI_KgNBWHjiD64Hs7CHs_z52pVSfbz36SKnS8ka0H_WPv7c2aISAKB2IYnpxmzFMRHj4PceyT2DDs_cRqY39rxxbSqrqiuIrEg8ARJLeLggQ4HGAwfDw1Y55qtw8okl8G6DzJTFx5q8vB1Sxs3hfhCsR7hAOCGEGkCUxGB2o4dV8JypQ8JE3dvzjOPL9zk0nuRyrrotCytZXn8HIWVO_LMAZ1pnQIFZY5-KLMYcMtKkmfTXwh1Mkkc6CWtvJuP_tZOL0vwOg7Ok80pAdrF3xRu_ALNXGI6JfjHElyP85G1kYbbVt1dj0Lq_eFmMZ6t3hIERY4-KLA6b_z_R46lGIx4e7LQCN-OP4wEl3mbFzOZpvrQr2Ior1-Anng_OiO1VfOjyeXG-tQP6LHDhbzDo2Yj8XSdg-Mz8IFaV5kvfnHkm1M3e2urFnv898X7SahcMkSOMD2r8H-Lyn1rvI:1rfD7c:HxIAmYeIBmwaMVnuliLYkshIFQV27-qiFqHF0vtcVno', '2024-03-13 06:08:52.916811');
INSERT INTO `django_session` VALUES ('xeymd5zi5jun7r8s1bqzxt5n5u94kiuj', '.eJzFmE1zmzAQhv9KhnNiSyAk4WPP7bGnOpMRkrBJ-fDwcWgz_u-VjBvjNdRAlOlFwtplV68eBCu_ebWu67QsXtpaVy9p_bXcpYW3aapWPwKb8jYYjNmmELn2Nt7vvSh2tSg84LLXQunKOKxzrVKx7n6vXg874_ki2mZ_Ce_h67FYyJ-6sAb1aqKXK1kWTZXGK-uyOlvr1bdS6ezL2fcqwF7Ue3N3RBIeKUKxjzDRNOJasZAKGpIoRr7SKMBSUswixhKfMkECQUQQC4Gw5FhJGzTXRVubWD_etp6VvPU2D1sPb7dtgJDtQp8o2wUJMh0LfW466gds6z0az9TMvbsnEdVDIp5kWslMd8bcKqit-Tr8grBWd2dqq6yzrIXK02JtLV3T2YVS30ddjPHsFleGmKzaPB6YoAP9x8cHN5qPz9aoU2VtGCEfDmCYyr_MngmW2CTEt5kjLrX9xQNpbZLFdjqMxx9j6S4JZNv8OuiuGWV7cZnI1vnqDJB2FBiAJnAggKmD3nMbEmo7Ik9KY3HqCKIf3Le9sPN5HqpStbJ570epQseJbB3oH9q3kzVDQBQOhDA8ucyYx8I_vR7C0CWxftj5xMrKfNbOLaRVtFl2F4kDgQNIpouCBDgcYDB8ODZjHmv7HFAkPw3QdZKFuNJG572rRdicL8IdiHOEA4IYQaQRTEZ7aji1bwnKlDwlje23OEwc77nRJPORyjLLtGxM5dm_XATV-TIMQV0oHUKFZQ6-KXNY_xGVpMsmPhHqaJIlUHNTeTfv_SKczhdgcI8uEw3pwdoF39Qu_EZN6CP66TgHkszHWcuy0pU2rbq6XoTV-UKMY50tHlKEBQ6-KXCii5oIYfsQMaadguyHnY-uKJtU6r_daEF67TaxHHWgfYDddL0QDqx98E3t032Vux1_KpxDwu17nAb8dFhlJLjNWduc9T7VmXoSWXP_vPiB0779E-TOaf_iMhGTG9FDx8BlR3wfDcXSZscOz8IGqZ9kufvHku2qsj3cWbPO578v2iShcMkwfLSj47N3_AOcbjP9:1rjzSp:_xZBuaMLhDe336AJJUWnZ2AHQbcidhQrEQ1ffaRV2Qc', '2024-03-26 10:34:31.529128');
INSERT INTO `django_session` VALUES ('zsbcs6q6b66vtrv2zvmhhxzfne7zj0dr', '.eJzNmUtzozgQgP9KinPiIIRA9nHPO8c5radSQg-bGR4uCbYqM5X_vgictWkgYKzUzIUGdbtb3R8SDf7lvbC6Or7URuqXVHg7D3mP12MJ4z9kYRXiOysO5YaXRaXTZGNNNmet2Xwphcz-Otv2HByZOTa_ZsjnUmHibxMaI7RVAcJKREwQQSRhIhBKJYJRjmIcYxYRLBVFIQ4aZaAiap3msqhN4-ufX3uvYLnce7uHvYf2-xr7vhUkCIUVWPmNiElAGxEFON57j41l2sy9-41i-kGxJ55qnslOmdsMjFX33a9wa_PuVLXOOs0zE3laPFtNd-j0TIivkyaN8myWaMkE13WejEzQQf5vjw9ucn77ZpUyFVaHfD-AAwiGCi6zjxQKbUikmBVhZENSlWztBHic2MGYJvexdBcEsq1eT7I7TLK9mCxk67w6I6QdOQagQziAYWh8dd_2gpLmsh3kVhcnrBWhH925iieD3M76pEtR8-p_OUkcGi7k7rw2Yyt8ZT0g2AgOkA9I9282Z2z7biOB27s2YHQNW6lVqfN3Kf-VxUeAx6xvp7y2LrPreXktIEY66_u-_RJU7uOdc8z4D6ry-n1yO-ubJsw-BuJtdM_dnJTlj7Q4zFf43fAPqu7yCoDqIh-WO4bBwsv8z2EIJsTl3nTt9nZ-pRZNK9gdIbuizrJZQA4SHAG0PCmIBLaEaNASkqkZ00TaZ1Tk808D1A-yEldayfzqbBU250WYgXhL4pAg7PXQoNeLrnYJgu0VJVw57QCu3N6OjZdZJnmVlr3TVeAcpDq2IS5OD7KA7RkatGfx9a3Gw1Yk3b6b2Jc_olxviFNB1oDLc9txvctVyJwXYHStrUsa0qNwYPBEo4NsSOBHn45zJMjtOA0vtdSyOYre-SqszgsxjfXm5AHFADYqaNAXbi_ZbH3UdlixdAry2u3t6IqySrl8F5NtZt9sYZPpIPcRdsvzhbRgDxMMepju6dqteN69xlNu93FM2w9pcYiHMY2NaY6pzMQTy6pZYPd8ibQfaGe-RF5MFmJyk_RIKVd-fgzCMV-yWbHjs7BOzBMvDx-U7KDL-jRTs87mtxdtUaKwZAQODHq5tmOUtqOhW95-M8KoFZGSdpBOvqWZWp90agYbiKleM5mkzCwr193RYYpNi-Q9ekYa03R9579CzN_lIS28XaVrCXXC2yEwZg92kt7O-3lkxcGwAro8NllJ3Rg851Kk7Lm73nw_Hby3_wA9HOyv:1rlolA:6hSnjFHoZsFg4t17OXf0rtRU-Iuus-3SggXD43SNDwk', '2024-03-31 11:33:00.725140');

-- ----------------------------
-- Table structure for interaction
-- ----------------------------
DROP TABLE IF EXISTS `interaction`;
CREATE TABLE `interaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` longtext NOT NULL COMMENT '内容',
  `createdTime` datetime(6) NOT NULL COMMENT '时间',
  `target_id` int(11) DEFAULT NULL COMMENT '对象编号',
  `userid` int(11) NOT NULL COMMENT '用户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of interaction
-- ----------------------------
INSERT INTO `interaction` VALUES ('19', null, '音乐非常好听，现场非常热闹', '2024-03-17 10:30:07.760253', '2', '1');
INSERT INTO `interaction` VALUES ('20', null, '音乐会非常的好听，这个票买值了', '2024-03-17 11:31:44.767969', '5', '1');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '通知标题',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '通知内容',
  `time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', 'System Overview and Explanation', '！', '2025-03-19 16:12:30');
INSERT INTO `notice` VALUES ('2', 'Official System Launch Announcement', 'We are excited to announce that the Livehouse Booking System is now officially live!', '2025-03-20 19:36:25');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` int(11) DEFAULT NULL COMMENT '用户主键',
  `totalprice` varchar(255) DEFAULT NULL COMMENT '总价格',
  `bankname` varchar(255) DEFAULT NULL COMMENT '支付银行名称',
  `banknum` varchar(255) DEFAULT NULL COMMENT '支付银行卡号',
  `phone` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `createtime` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `paytime` varchar(255) DEFAULT NULL COMMENT '支付时间',
  `sendtime` varchar(255) DEFAULT NULL COMMENT '发货时间',
  `receivetime` varchar(255) DEFAULT NULL COMMENT '收货时间',
  `state` int(11) DEFAULT NULL COMMENT '订单状态（1：未付款、2：已付款、3：已发货、4、已收货）',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userid` (`userid`) USING BTREE,
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单表';

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('12', '1', '80.0', '中国银行', '1111222233334444', '12345678910', '辽宁省大连市大连海洋大学', '2024-03-17 18:32:28', '2024-03-17 18:32:36', null, null, '2');
INSERT INTO `order` VALUES ('13', '1', '499.0', '中国银行', '1111333344445555', '12345678910', '辽宁省大连市大连海洋大学', '2024-03-17 18:33:34', '2024-03-17 18:33:41', null, null, '2');
INSERT INTO `order` VALUES ('14', '1', '400.0', '中国银行', '1111222233334444', '12345678944', '辽宁省大连市大连海洋大学', '2024-03-17 18:34:09', '2024-03-17 18:34:15', null, null, '2');
INSERT INTO `order` VALUES ('15', '1', '354.0', '中国银行', '1111222233334444', '12345678944', '辽宁省大连市大连海洋大学', '2024-03-17 18:35:17', '2024-03-17 18:35:23', null, null, '2');
INSERT INTO `order` VALUES ('16', '1', '80.0', '中国银行', '1111222233334444', '12345678944', '辽宁省大连市大连海洋大学', '2024-03-17 18:35:48', '2024-03-17 18:35:54', null, null, '2');
INSERT INTO `order` VALUES ('17', '1', '406.0', '中国银行', '111222233334444', '12345678944', '辽宁省大连市大连海洋大学', '2024-03-17 19:28:31', '2024-03-17 19:28:38', null, null, '2');
INSERT INTO `order` VALUES ('18', '1', '59.0', '中国银行', '111222233334444', '12345678944', '辽宁省大连市大连海洋大学', '2024-03-17 19:29:14', '2024-03-17 19:29:18', '2024-03-17 19:35:24', null, '3');
INSERT INTO `order` VALUES ('19', '1', '40.0', '中国银行', '1111222233334444', '13058794567', '大连海洋大学', '2024-04-17 23:49:40', '2024-04-17 23:49:56', null, null, '2');
INSERT INTO `order` VALUES ('20', '1', '100.0', null, null, '13058794567', '大连海洋大学', '2024-04-18 00:10:17', null, null, null, '1');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `orderid` int(11) DEFAULT NULL COMMENT '订单id',
  `productid` int(11) DEFAULT NULL COMMENT '商品id',
  `price` varchar(255) DEFAULT NULL COMMENT '商品单价',
  `count` int(11) DEFAULT NULL COMMENT '购买数量',
  `totalprice` varchar(255) DEFAULT NULL COMMENT '总价格',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `orderid` (`orderid`) USING BTREE,
  KEY `itemid` (`productid`) USING BTREE,
  KEY `orderitem_ibfk_11` (`userid`) USING BTREE,
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `order` (`id`) ON DELETE CASCADE,
  CONSTRAINT `orderitem_ibfk_11` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单详细表';

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('14', '1', '12', '49', '80', '1', '80.0');
INSERT INTO `orderitem` VALUES ('15', '1', '13', '45', '499', '1', '499.0');
INSERT INTO `orderitem` VALUES ('16', '1', '14', '36', '100', '4', '400.0');
INSERT INTO `orderitem` VALUES ('17', '1', '15', '38', '59', '6', '354.0');
INSERT INTO `orderitem` VALUES ('18', '1', '16', '44', '40', '2', '80.0');
INSERT INTO `orderitem` VALUES ('19', '1', '17', '48', '168', '2', '336.0');
INSERT INTO `orderitem` VALUES ('20', '1', '17', '50', '70', '1', '70.0');
INSERT INTO `orderitem` VALUES ('21', '1', '18', '38', '59', '1', '59.0');
INSERT INTO `orderitem` VALUES ('22', '1', '19', '44', '40', '1', '40.0');
INSERT INTO `orderitem` VALUES ('23', '1', '20', '47', '100', '1', '100.0');

-- ----------------------------
-- Table structure for perform_booking
-- ----------------------------
DROP TABLE IF EXISTS `perform_booking`;
CREATE TABLE `perform_booking` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `booking_date` datetime(6) NOT NULL COMMENT '订购日期',
  `payment_status` varchar(50) NOT NULL COMMENT '支付状态',
  `total_price` decimal(10,2) NOT NULL COMMENT '总价',
  `is_used` tinyint(1) NOT NULL COMMENT '是否使用',
  `quantity` int(11) NOT NULL COMMENT '数量',
  `bankname` varchar(255) DEFAULT NULL COMMENT '乐队名称',
  `banknum` varchar(255) DEFAULT NULL COMMENT '乐队数量',
  `qr_code` varchar(100) NOT NULL COMMENT '二维码',
  `ticket_id` int(11) NOT NULL COMMENT '票号',
  `user_id` int(11) NOT NULL COMMENT '用户编号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `perform_booking_user_id_de7a98d9_fk_user_id` (`user_id`) USING BTREE,
  KEY `perform_booking_ticket_id_059bf3e1_fk_perform_event_id` (`ticket_id`) USING BTREE,
  CONSTRAINT `perform_booking_ticket_id_059bf3e1_fk_perform_event_id` FOREIGN KEY (`ticket_id`) REFERENCES `perform_event` (`id`),
  CONSTRAINT `perform_booking_user_id_de7a98d9_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of perform_booking
-- ----------------------------
INSERT INTO `perform_booking` VALUES ('3', '2024-03-16 23:12:53.947598', 'paid', '150.00', '0', '1', '中国银行', '1111222233334444', '', '17', '1');
INSERT INTO `perform_booking` VALUES ('4', '2024-03-17 11:22:28.450499', 'paid', '159.00', '0', '1', '中国银行', '111222233334444', '', '16', '1');
INSERT INTO `perform_booking` VALUES ('5', '2024-04-17 15:25:55.235375', 'pending', '159.00', '0', '1', null, null, '', '16', '1');
INSERT INTO `perform_booking` VALUES ('6', '2024-04-17 15:27:35.588470', 'pending', '159.00', '0', '1', null, null, '', '16', '1');
INSERT INTO `perform_booking` VALUES ('7', '2024-05-09 04:55:08.056973', 'paid', '260.00', '0', '1', '中国银行', '111122223334444', '', '12', '1');

-- ----------------------------
-- Table structure for perform_event
-- ----------------------------
DROP TABLE IF EXISTS `perform_event`;
CREATE TABLE `perform_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) NOT NULL COMMENT '演出名称',
  `image` varchar(100) NOT NULL COMMENT '演出图像',
  `price` int(11) NOT NULL COMMENT '演出价格',
  `content` longtext NOT NULL COMMENT '演出内容',
  `createTime` datetime(6) NOT NULL COMMENT '上架时间',
  `quantity` int(11) NOT NULL COMMENT '数量',
  `startTime` datetime(6) NOT NULL COMMENT '开始时间',
  `endTime` datetime(6) NOT NULL COMMENT '结束时间',
  `is_recommend` tinyint(1) NOT NULL COMMENT '是否推荐',
  `typeId_id` int(11) NOT NULL COMMENT '类型编号',
  `volume` int(11) NOT NULL COMMENT '销量',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `perform_event_typeId_id_ea70414b_fk_perform_type_id` (`typeId_id`) USING BTREE,
  CONSTRAINT `perform_event_typeId_id_ea70414b_fk_perform_type_id` FOREIGN KEY (`typeId_id`) REFERENCES `perform_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of perform_event
-- ----------------------------
INSERT INTO `perform_event` VALUES ('2', 'Bruce Springsteen & The E Street Band return to the UK in 2025', '1742401685827_365764.png', '280', '<strong>Bruce Springsteen &amp; The E Street Band return to the UK in 2025</strong>', '2025-03-19 16:28:05.836746', '1000', '2025-03-10 22:54:00.000000', '2025-03-31 21:00:00.000000', '1', '10', '0');
INSERT INTO `perform_event` VALUES ('3', 'The Brighton-based metal giants', '1742316316091_096680.png', '288', '<span style=\"color:#121212;font-family:Averta, helvetica, arial, sans-serif;font-size:18px;font-weight:600;\">The Brighton-based metal giants</span>', '2025-03-18 16:45:28.857669', '1000', '2025-04-01 15:45:02.000000', '2025-04-15 15:45:04.000000', '1', '10', '0');
INSERT INTO `perform_event` VALUES ('4', 'Art rock ban', '1742316174539_264044.png', '300', '<span style=\"color:#121212;font-family:Averta, helvetica, arial, sans-serif;font-size:18px;font-weight:600;\">Art rock band that weaves history, visuals and spoken word into their music</span>', '2025-03-18 16:42:54.551468', '1000', '2025-03-20 22:55:00.000000', '2025-04-01 21:55:00.000000', '1', '8', '0');
INSERT INTO `perform_event` VALUES ('5', 'Madama Butterfly', '1742315300086_856364.png', '260', '<span style=\"color:#121212;font-family:Averta, helvetica, arial, sans-serif;font-size:16px;\">Back by overwhelming public demand, this award-winning opera returns in a new production with exquisite sets including a spectacular Japanese garden and fabulous costumes including antique wedding kimonos from Japan.</span><br />', '2025-03-18 16:28:20.091332', '1000', '2025-04-10 21:55:00.000000', '2025-05-01 21:55:00.000000', '1', '8', '0');
INSERT INTO `perform_event` VALUES ('6', 'STORRY', '1742315872278_176630.png', '200', '暂无', '2025-03-18 16:37:52.283915', '1000', '2025-03-01 22:56:00.000000', '2025-04-01 21:56:00.000000', '0', '7', '0');
INSERT INTO `perform_event` VALUES ('7', 'Thin Az Lizzy', '1742315050839_779356.png', '288', '<br />', '2025-03-18 16:35:10.339228', '1000', '2025-04-15 17:00:00.000000', '2025-04-30 21:56:00.000000', '1', '5', '0');
INSERT INTO `perform_event` VALUES ('8', 'What\'s Love Got to do With it', '1742310303423_864473.png', '322', '<div class=\"sc-40c1c211-9 bbZkiG\" style=\"font-weight:600;font-size:var(--fiji-font-size,18px);color:#121212;font-family:Averta, helvetica, arial, sans-serif;\">\r\n	<p>\r\n		<strong>International sensation What’s Love Got To Do With It? returns to London</strong> \r\n	</p>\r\n</div>\r\n<div class=\"sc-40c1c211-6 eHRLKz\" style=\"color:#121212;font-family:Averta, helvetica, arial, sans-serif;font-size:16px;\">\r\n	<p>\r\n		<strong>The international sensation,&nbsp;</strong><em><strong>What’s Love Got To Do With It?</strong></em><strong>, is making a comeback!</strong> \r\n	</p>\r\n</div>\r\n<br />', '2025-03-18 16:34:49.336168', '1000', '2025-03-18 12:00:00.000000', '2025-05-31 21:57:00.000000', '1', '6', '0');
INSERT INTO `perform_event` VALUES ('9', 'Pure bottled rock \'n\' roll', '1742309980311_113379.png', '330', '<span style=\"color:#121212;font-family:Averta, helvetica, arial, sans-serif;font-size:16px;\">The Darkness would be easy to write off as a pastiche. Indeed, the overblown, Rock-with-a-capital-R excesses they borrow from so many of their predecessors would come across as a parody if it weren’t so obvious that The Darkness mean every single scissor kick, windmill, strut and pout with every fibre of their being.</span>', '2025-03-18 16:34:27.861805', '1000', '2025-03-28 22:57:00.000000', '2025-05-20 21:57:00.000000', '1', '10', '0');
INSERT INTO `perform_event` VALUES ('10', 'Lola Young', '1742309846733_184210.png', '280', '<span style=\"color:#121212;font-family:Averta, helvetica, arial, sans-serif;font-size:18px;font-weight:600;\">South London singer who combines confessional songwriting with electronic ambience</span>', '2025-03-18 16:33:58.360181', '1000', '2025-04-20 21:58:00.000000', '2025-06-01 21:58:00.000000', '0', '7', '0');
INSERT INTO `perform_event` VALUES ('11', 'The UK\'s biggest rap export in recent years', '1742309410323_763593.png', '616', '<strong>Breaking streaming records for his singles ‘Doja’ and ‘Sprinter’, Central Cee has emerged as one of the most prominent voices in UK rap for his blend of gritty yet vulnerable lyricism and high profile collaborations with the likes of Lil Baby, 21 Savage and Ice Spice.</strong>', '2025-03-18 14:50:10.328819', '1000', '2025-04-18 17:00:00.000000', '2025-05-20 21:58:00.000000', '1', '9', '0');
INSERT INTO `perform_event` VALUES ('12', 'Volbeat Tickets', '1742226241570_165673.png', '260', '<span style=\"color:#121212;font-family:Averta, helvetica, arial, sans-serif;font-size:18px;font-weight:600;\">Danish trio fusing rockabilly and metal with a heavy dose of classic rock</span>', '2025-03-18 16:33:39.410406', '1000', '2025-03-23 18:00:00.000000', '2025-03-31 21:59:00.000000', '1', '10', '1');
INSERT INTO `perform_event` VALUES ('13', 'Super Friendz Present', '1742308586943_131806.png', '488', '暂无', '2025-03-18 16:33:26.884625', '1000', '2025-03-31 13:36:24.000000', '2025-05-01 21:59:00.000000', '1', '9', '0');
INSERT INTO `perform_event` VALUES ('14', 'Sugababes announce their biggest UK tour for spring 2025', '1742309198238_117674.png', '300', '<span style=\"color:#121212;font-family:Averta, helvetica, arial, sans-serif;font-size:18px;font-weight:600;\">Sugababes announce their biggest UK tour for spring 2025</span>', '2025-03-18 16:33:08.618703', '1000', '2025-04-08 17:00:00.000000', '2025-04-30 21:59:00.000000', '1', '9', '0');
INSERT INTO `perform_event` VALUES ('15', 'Nikita Kuzmin', '1742308823675_852495.png', '220', 'Nikita Kuzmin to tour his first ever solo show in the UK from 8 march 2025', '2025-03-18 16:32:51.936441', '1000', '2025-03-31 22:00:00.000000', '2025-04-30 22:00:00.000000', '0', '8', '0');
INSERT INTO `perform_event` VALUES ('16', 'Guildhall Jazz Showcase', '1742308190906_453547.png', '150', '暂无', '2025-03-18 16:29:20.167766', '100', '2025-03-20 12:00:00.000000', '2025-03-31 22:00:00.000000', '1', '9', '1');
INSERT INTO `perform_event` VALUES ('17', 'The Game - 20 Years of The Documentary', '1742308382867_265528.png', '190', '暂无', '2025-03-18 16:29:02.676512', '1000', '2025-04-01 13:33:00.000000', '2025-05-01 15:29:01.000000', '0', '5', '1');

-- ----------------------------
-- Table structure for perform_type
-- ----------------------------
DROP TABLE IF EXISTS `perform_type`;
CREATE TABLE `perform_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `typename` varchar(255) NOT NULL COMMENT '类型名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of perform_type
-- ----------------------------
INSERT INTO `perform_type` VALUES ('5', 'Clubs and Dance');
INSERT INTO `perform_type` VALUES ('6', 'Tribute Bands');
INSERT INTO `perform_type` VALUES ('7', 'R&B/Urban Soul');
INSERT INTO `perform_type` VALUES ('8', 'concert');
INSERT INTO `perform_type` VALUES ('9', 'Rap and Hip-Hop');
INSERT INTO `perform_type` VALUES ('10', 'Hard Rock/Metal');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `productname` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `typeid` int(11) DEFAULT NULL COMMENT '商品类型',
  `image` varchar(255) DEFAULT NULL COMMENT '封面',
  `price` varchar(255) DEFAULT NULL COMMENT '商品价格',
  `content` text COMMENT '内容',
  `createtime` varchar(255) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `typeid1` (`typeid`) USING BTREE,
  CONSTRAINT `typeid1` FOREIGN KEY (`typeid`) REFERENCES `type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品表';

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('31', 'Xie Tianxiao 2025 \"Instinct\" Tour Limited Edition T-Shirt', '10', '1710625060233_912525.jpg', '148', 'The <strong>Xie Tianxiao 2025 \"Instinct\" Tour T-Shirt</strong> is a <strong>limited-edition</strong> concert souvenir designed for fans of the legendary Chinese rock musician. This exclusive <strong>tour merchandise</strong> reflects Xie Tianxiao’s <strong>raw energy, psychedelic rock influences, and rebellious spirit</strong>.', '2024-03-17 05:37:40');
INSERT INTO `product` VALUES ('32', '\"Do You Want to Buy Groceries?\" Limited Edition Canvas Tote Bag', '9', '1742393830018_684158.png', '50', 'The <strong>\"Do You Want to Buy Groceries?\" Limited Edition Canvas Tote Bag</strong> is a stylish and eco-friendly <strong>streetwear accessory</strong>, blending <strong>minimalist design with playful and ironic messaging</strong>.', '2024-03-17 05:38:11');
INSERT INTO `product` VALUES ('33', '【Ti&Maily】Wheatfield Music Festival Sports Frisbe', '2', '1742393656240_966989.png', '79', 'The <strong>【Ti&amp;Maily】Wheatfield Music Festival Sports Frisbee</strong> is a <strong>limited-edition</strong> collectible released exclusively for the <strong>Wheatfield Music Festival</strong>. Designed for both <strong>sports enthusiasts and music lovers</strong>, this frisbee blends <strong>functionality with a vibrant festival aesthetic</strong>.', '2024-03-17 05:38:57');
INSERT INTO `product` VALUES ('34', 'The White Paper Band\'s \"I\'m Not Happy\" T-Shirt', '10', '1742393519912_112720.png', '120', '<span class=\"relative -mx-px my-[-0.2rem] rounded px-px py-[0.2rem]\">&nbsp;is a piece of merchandise associated with their album \"I\'m Not Happy\".</span> <span class=\"relative -mx-px my-[-0.2rem] rounded px-px py-[0.2rem]\">This T-shirt features the album\'s distinctive artwork, reflecting the band\'s unique style and musical themes.</span>', '2024-03-17 05:43:21');
INSERT INTO `product` VALUES ('35', 'AFGK (A Few Good Kids)', '10', '1742393196982_747625.png', '140', '<strong>AFGK (A Few Good Kids)</strong> is a <strong>trendy streetwear brand</strong> known for its <strong>bold graphics, high-quality materials, and urban fashion aesthetics</strong>. Inspired by hip-hop culture, youth expression, and contemporary street fashion, AFGK has gained a strong following among fashion enthusiasts and influencers.', '2024-03-17 05:44:05');
INSERT INTO `product` VALUES ('36', '【Blacken Acid Mass】 Limited Edition Short-Sleeve T-Shirt', '10', '1742392213312_722720.png', '100', 'The <strong>Blacken Acid Mass Limited Edition Short-Sleeve T-Shirt</strong> from <strong>&nbsp;(Black Lagoon Phantom Sound)</strong> is an exclusive streetwear piece that merges <strong>dark aesthetics, underground music culture, and avant-garde fashion</strong>.', '2024-03-17 05:44:46');
INSERT INTO `product` VALUES ('37', 'Muma Band 2025 Tour Limited Edition Embroidered T-Shirt', '10', '1710625519587_383887.jpg', '60', 'The <strong>Muma (Wooden Horse) Band 2025 Tour Limited Edition Embroidered T-Shirt</strong> is an exclusive <strong>collectible tour merchandise</strong> designed for fans of the iconic Chinese rock band <strong>Muma&nbsp;</strong>', '2024-03-17 05:45:19');
INSERT INTO `product` VALUES ('38', 'Wang Weima x Soulsense Collaboration Tour Dupont Paper Packaging', '9', '1742389590609_590371.png', '50', 'The <strong>Wang Weima x Soulsense Collaboration Tour Dupont Paper Package</strong> is a <strong>limited-edition</strong> collectible item designed for fans of the <strong>exclusive music and art collaboration</strong> between Wang Weima and Soulsense.', '2024-03-17 05:48:03');
INSERT INTO `product` VALUES ('39', 'Eluveitie 2025 Tour Limited Edition Necklace', '9', '1742389459930_050301.png', '125', 'The <strong>Eluveitie 2025 Tour Limited Edition Necklace</strong> is an exclusive <strong>collector\'s item</strong> released during the band\'s 2025<strong>&nbsp;world tour</strong>, celebrating their unique blend of <strong>Celtic folk metal</strong> and rich historical themes.<br />', '2024-03-17 05:48:42');
INSERT INTO `product` VALUES ('40', '\"H\" Letter Necklace – Clavicle Chain', '9', '1742378483723_022079.png', '110', 'The <strong>\"H\" Letter Necklace</strong> is a stylish and minimalistic <strong>clavicle chain</strong>, designed for those who appreciate <strong>elegance and personalization</strong> in their accessories.', '2024-03-17 05:49:19');
INSERT INTO `product` VALUES ('41', 'Perfect Handstand – \"Moon Love Poem\"', '9', '1742378371636_264777.png', '60', 'The <strong>\"Moon Love Poem\" 2025 Spring Tour Dupont Paper Package</strong> by <strong>Perfect Handstand</strong> is a <strong>special edition merchandise item</strong> designed for fans and collectors. This release celebrates the <strong>2025 Spring Tour</strong>, capturing the poetic and dreamy essence of <strong>\"Moon Love Poem.\"</strong>', '2024-03-17 05:49:41');
INSERT INTO `product` VALUES ('42', 'Digital Samurai: Aierioe/Whiplash Physical Action Figure Album Blind Box', '2', '1742378255247_903051.png', '168', 'The <strong>\"Digital Samurai: Aierioe/Whiplash\" Blind Box</strong> is a <strong>unique fusion of music, technology, and collectible art</strong>, featuring a <strong>physical action figure</strong> that embodies the futuristic and cyberpunk-inspired world of <strong>Aierioe</strong>.', '2024-03-17 05:52:17');
INSERT INTO `product` VALUES ('43', '\"Ti&Maily\" Action Figure Set', '2', '1742378167480_962589.png', '95', 'The <strong>\"Ti&amp;Maily\" Action Figure Set</strong> is a charming and collectible <strong>designer toy set</strong> featuring two unique characters, <strong>Ti</strong> and <strong>Maily</strong>. These figures embody a <strong>whimsical and dreamy aesthetic</strong>, blending elements of <strong>fantasy, nostalgia, and modern toy artistry</strong>.', '2024-03-17 05:52:34');
INSERT INTO `product` VALUES ('44', '\"Falling into Nightmare\" Series Finger Skateboard', '2', '1742318142953_418071.png', '100', 'The <strong>Valley Surfer \"Falling into Nightmare\" Series Finger Skateboard</strong> is a stylish and collectible <strong>mini skateboard</strong> designed for fingerboarding enthusiasts. Part of the <strong>\"Falling into Nightmare\"</strong> collection, this board captures an artistic and surreal theme, blending <strong>dreamlike visuals</strong> with <strong>urban skate culture</strong>.', '2024-03-17 05:52:54');
INSERT INTO `product` VALUES ('45', 'Bridge Toys', '2', '1742318051125_060509.png', '199', 'This collectible <strong>GOSH x Litor\'s Works</strong> action figure set features three unique characters, each embodying urban street culture with a blend of hip-hop, graffiti, and underground fashion influences. The figures are part of the <strong>\"Diligence Is Fog City\"</strong> series, showcasing distinct personalities and styles.<br />', '2024-03-17 05:53:10');
INSERT INTO `product` VALUES ('46', '\"Chuhaibu \'Before Sunrise\' Album CD\"', '1', '1742317784371_173640.png', '88', '<em>\"Before Sunrise\"</em> is an album by <strong>Chuhaibu</strong>, capturing the emotions and atmosphere of the moments leading up to dawn. Through a blend of <strong>ambient, indie, and experimental sounds</strong>, the album paints a sonic landscape that evokes feelings of longing, introspection, and new beginnings.', '2024-03-17 05:55:43');
INSERT INTO `product` VALUES ('47', '\"RUBUR \'The Four Seasons of Persephone\' Album CD\"', '1', '1742317622980_419792.png', '100', '<em>The Four Seasons of Persephone\"</em> is an album by RUBUR, inspired by the mythological tale of <strong>Persephone</strong>, the Greek goddess associated with the changing seasons. This concept album explores the cyclical transformation of nature and emotions through music, reflecting the duality of light and darkness, warmth and cold.', '2024-03-17 05:56:01');
INSERT INTO `product` VALUES ('48', '\"Cha Jiyang \'For You\' Commemorative Edition LP Vinyl Record\"', '1', '1742317541224_693816.png', '168', '\"Cha Jiyang \'For You\' Commemorative Edition LP Vinyl Record\"', '2024-03-17 05:56:19');
INSERT INTO `product` VALUES ('49', 'IU\'s latest EP, \"The Winning,\"', '1', '1742317289969_260760.png', '60', '<span class=\"relative -mx-px my-[-0.2rem] rounded px-px py-[0.2rem]\">IU\'s latest EP, \"The Winning,\" released in 2024, showcases her versatility and growth as an artist.</span> <span class=\"relative -mx-px my-[-0.2rem] rounded px-px py-[0.2rem]\">The EP features tracks like \"I stan U,\" \"Shh..\" (featuring HYEIN and WONSUN JOE with special narration by Patti Kim), \"Holssi,\" and \"Shopper.\"</span> <span class=\"relative -mx-px my-[-0.2rem] rounded px-px py-[0.2rem]\">These songs blend various genres, reflecting IU\'s innovative approach to music.</span> <span class=\"relative -mx-px my-[-0.2rem] rounded px-px py-[0.2rem]\">The EP is available on platforms such as Apple Music.</span>', '2024-03-17 05:56:35');
INSERT INTO `product` VALUES ('50', '1989 (Taylor\'s Version)', '1', '1742317123354_038275.png', '90', '<p>\r\n	<em>\"1989 (Taylor’s Version)\"</em> is the re-recorded version of Taylor Swift’s fifth studio album, originally released in 2014. The album, which marked a major shift in Swift’s career from country to pure pop, features some of her most iconic songs, such as <em>\"Shake It Off,\"</em> <em>\"Blank Space,\"</em> and <em>\"Style.\"</em>\r\n</p>\r\n<p>\r\n	The re-recorded edition, released in 2023, is part of Swift\'s effort to reclaim ownership of her music. It includes all the tracks from the original album, along with never-before-heard \"From The Vault\" songs, which offer fans new insights into the creative era of <em>1989</em>.\r\n</p>', '2024-03-17 05:56:50');

-- ----------------------------
-- Table structure for scorerecord
-- ----------------------------
DROP TABLE IF EXISTS `scorerecord`;
CREATE TABLE `scorerecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `productid` int(11) DEFAULT NULL COMMENT '商品id',
  `score` int(11) DEFAULT NULL COMMENT '评分',
  `createtime` varchar(255) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `6` (`userid`) USING BTREE,
  KEY `7` (`productid`) USING BTREE,
  CONSTRAINT `6` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `7` FOREIGN KEY (`productid`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评分记录表';

-- ----------------------------
-- Records of scorerecord
-- ----------------------------
INSERT INTO `scorerecord` VALUES ('7', '1', '45', '4', '2024-03-17 18:33:27');
INSERT INTO `scorerecord` VALUES ('8', '1', '36', '5', '2024-03-17 18:34:02');
INSERT INTO `scorerecord` VALUES ('9', '1', '38', '5', '2024-03-17 18:35:05');
INSERT INTO `scorerecord` VALUES ('10', '1', '44', '3', '2024-03-17 19:29:36');
INSERT INTO `scorerecord` VALUES ('11', '1', '50', '4', '2024-04-17 23:24:33');
INSERT INTO `scorerecord` VALUES ('12', '1', '47', '5', '2024-04-18 00:00:34');
INSERT INTO `scorerecord` VALUES ('13', '1', '48', '4', '2025-02-12 10:57:03');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `typename` varchar(255) DEFAULT NULL COMMENT '类型名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品类型表';

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', 'Audio & Video Products');
INSERT INTO `type` VALUES ('2', 'Model Figures & Toys');
INSERT INTO `type` VALUES ('9', 'Custom Products');
INSERT INTO `type` VALUES ('10', 'Clothing & Accessories');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `header` varchar(255) DEFAULT NULL COMMENT '头像',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `createtime` varchar(255) DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'zhangsan', '123456', 'header.jpg', 'user1@163.com', '2023-12-29 08:16:41');
INSERT INTO `user` VALUES ('2', 'wangwu', '123456', 'header.jpg', 'user2@163.com', '2024-02-28 00:29:23');
INSERT INTO `user` VALUES ('3', 'xiaoming', '123456', 'header.jpg', 'user3@163.com', '2024-02-28 14:08:17');
INSERT INTO `user` VALUES ('4', 'lzz', '1qaz2wsx', 'header.jpg', '', '2024-03-16 10:03:58');
