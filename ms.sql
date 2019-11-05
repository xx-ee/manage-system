/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : 0520erp

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 28/09/2019 15:44:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bus_customer
-- ----------------------------
DROP TABLE IF EXISTS `bus_customer`;
CREATE TABLE `bus_customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `connectionperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bus_customer
-- ----------------------------
INSERT INTO `bus_customer` VALUES (1, '小张超市', '111', '武汉', '027-9123131', '张大明', '138123123123', '中国银行', '654431331343413', '213123@sina.com', '430000', 1);
INSERT INTO `bus_customer` VALUES (2, '小明超市', '222', '深圳', '0755-9123131', '张小明', '138123123123', '中国银行', '654431331343413', '213123@sina.com', '430000', 1);
INSERT INTO `bus_customer` VALUES (3, '快七超市', '430000', '武汉', '027-11011011', '雷生', '13434134131', '招商银行', '6543123341334133', '6666@66.com', '545341', 1);

-- ----------------------------
-- Table structure for bus_goods
-- ----------------------------
DROP TABLE IF EXISTS `bus_goods`;
CREATE TABLE `bus_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `produceplace` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goodspackage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promitcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `number` int(11) NULL DEFAULT NULL,
  `dangernum` int(11) NULL DEFAULT NULL,
  `goodsimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` int(11) NULL DEFAULT NULL,
  `providerid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_sq0btr2v2lq8gt8b4gb8tlk0i`(`providerid`) USING BTREE,
  CONSTRAINT `bus_goods_ibfk_1` FOREIGN KEY (`providerid`) REFERENCES `bus_provider` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bus_goods
-- ----------------------------
INSERT INTO `bus_goods` VALUES (1, '娃哈哈', '武汉', '120ML', '瓶', 'PH12345', 'PZ1234', '小孩子都爱的', 2, 1000, 10, '2018-12-25/userface1.jpg', 1, 3);
INSERT INTO `bus_goods` VALUES (2, '旺旺雪饼[小包]', '仙桃', '包', '袋', 'PH12312312', 'PZ12312', '好吃不上火', 4, 1000, 10, '2018-12-25/userface2.jpg', 1, 1);
INSERT INTO `bus_goods` VALUES (3, '旺旺大礼包', '仙桃', '盒', '盒', '11', '11', '111', 28, 1009, 100, '2018-12-25/userface3.jpg', 1, 1);
INSERT INTO `bus_goods` VALUES (4, '娃哈哈', '武汉', '200ML', '瓶', '11', '111', '12321', 3, 1000, 10, '2018-12-25/userface4.jpg', 1, 3);
INSERT INTO `bus_goods` VALUES (5, '娃哈哈', '武汉', '300ML', '瓶', '1234', '12321', '22221111', 3, 1000, 100, '2018-12-25/userface5.jpg', 1, 3);
INSERT INTO `bus_goods` VALUES (7, '123123', '123123', '123123123', '312321', '12312', '2132', '213', 123, 1000, 3123, '2019-09-27/48E8C8FE8F2D4536820435CCCD968AEC.jpg', 1, 2);

-- ----------------------------
-- Table structure for bus_inport
-- ----------------------------
DROP TABLE IF EXISTS `bus_inport`;
CREATE TABLE `bus_inport`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paytype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `inporttime` datetime(0) NULL DEFAULT NULL,
  `operateperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `inportprice` double NULL DEFAULT NULL,
  `providerid` int(11) NULL DEFAULT NULL,
  `goodsid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_1o4bujsyd2kl4iqw48fie224v`(`providerid`) USING BTREE,
  INDEX `FK_ho29poeu4o2dxu4rg1ammeaql`(`goodsid`) USING BTREE,
  CONSTRAINT `bus_inport_ibfk_1` FOREIGN KEY (`providerid`) REFERENCES `bus_provider` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bus_inport_ibfk_2` FOREIGN KEY (`goodsid`) REFERENCES `bus_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bus_inport
-- ----------------------------
INSERT INTO `bus_inport` VALUES (1, '微信', '2018-05-07 00:00:00', '张三', 100, '备注', 3.5, 1, 1);
INSERT INTO `bus_inport` VALUES (2, '支付宝', '2018-05-07 00:00:00', '张三', 1000, '无', 2.5, 3, 3);
INSERT INTO `bus_inport` VALUES (3, '银联', '2018-05-07 00:00:00', '张三', 100, '1231', 111, 3, 3);
INSERT INTO `bus_inport` VALUES (4, '银联', '2018-05-07 00:00:00', '张三', 1000, '无', 2, 3, 1);
INSERT INTO `bus_inport` VALUES (5, '银联', '2018-05-07 00:00:00', '张三', 100, '无', 1, 3, 1);
INSERT INTO `bus_inport` VALUES (6, '银联', '2018-05-07 00:00:00', '张三', 100, '1231', 2.5, 1, 2);
INSERT INTO `bus_inport` VALUES (8, '支付宝', '2018-05-07 00:00:00', '张三', 100, '', 1, 3, 1);
INSERT INTO `bus_inport` VALUES (10, '支付宝', '2018-08-07 17:17:57', '超级管理员', 100, 'sadfasfdsa', 1.5, 3, 1);
INSERT INTO `bus_inport` VALUES (11, '支付宝', '2018-09-17 16:12:25', '超级管理员', 21, '21', 21, 1, 3);
INSERT INTO `bus_inport` VALUES (12, '微信', '2018-12-25 16:48:24', '超级管理员', 100, '123213213', 12321321, 3, 1);
INSERT INTO `bus_inport` VALUES (14, '支付宝', '2019-09-28 03:47:16', '超级管理员', 100, '1111', 4.5, 1, 3);

-- ----------------------------
-- Table structure for bus_outport
-- ----------------------------
DROP TABLE IF EXISTS `bus_outport`;
CREATE TABLE `bus_outport`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providerid` int(11) NULL DEFAULT NULL,
  `paytype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `outputtime` datetime(0) NULL DEFAULT NULL,
  `operateperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `outportprice` double(10, 2) NULL DEFAULT NULL,
  `number` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goodsid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bus_outport
-- ----------------------------
INSERT INTO `bus_outport` VALUES (1, 3, '微信', '2019-08-16 08:19:50', '超级管理员', 12321321.00, 1, '', 1);
INSERT INTO `bus_outport` VALUES (2, 3, '微信', '2019-08-16 08:26:54', '超级管理员', 12321321.00, 11, '11', 1);
INSERT INTO `bus_outport` VALUES (7, 1, '支付宝', '2019-09-28 06:56:13', '超级管理员', 4.50, 1, '111', 3);

-- ----------------------------
-- Table structure for bus_provider
-- ----------------------------
DROP TABLE IF EXISTS `bus_provider`;
CREATE TABLE `bus_provider`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `connectionperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bus_provider
-- ----------------------------
INSERT INTO `bus_provider` VALUES (1, '旺旺食品', '434000', '仙桃', '0728-4124312', '小明', '13413441141', '中国农业银行', '654124345131', '12312321@sina.com', '5123123', 1);
INSERT INTO `bus_provider` VALUES (2, '达利园食品', '430000', '汉川', '0728-4124312', '大明', '13413441141', '中国农业银行', '654124345131', '12312321@sina.com', '5123123', 1);
INSERT INTO `bus_provider` VALUES (3, '娃哈哈集团', '513131', '杭州', '21312', '小晨', '12312', '建设银行', '512314141541', '123131', '312312', 1);

-- ----------------------------
-- Table structure for bus_sales
-- ----------------------------
DROP TABLE IF EXISTS `bus_sales`;
CREATE TABLE `bus_sales`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) NULL DEFAULT NULL,
  `paytype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `salestime` datetime(0) NULL DEFAULT NULL,
  `operateperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `saleprice` decimal(10, 2) NULL DEFAULT NULL,
  `goodsid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bus_salesback
-- ----------------------------
DROP TABLE IF EXISTS `bus_salesback`;
CREATE TABLE `bus_salesback`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) NULL DEFAULT NULL,
  `paytype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `salesbacktime` datetime(0) NULL DEFAULT NULL,
  `salebackprice` double(10, 2) NULL DEFAULT NULL,
  `operateperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goodsid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `open` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` int(11) NULL DEFAULT NULL COMMENT '状态【0不可用1可用】',
  `ordernum` int(11) NULL DEFAULT NULL COMMENT '排序码【为了调事显示顺序】',
  `createtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, 0, '总经办', 1, '大BOSS', '深圳', 1, 1, '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES (2, 1, '销售部', 0, '程序员屌丝', '武汉', 1, 2, '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES (3, 1, '运营部', 0, '无', '武汉', 1, 3, '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES (4, 1, '生产部', 0, '无', '武汉', 1, 4, '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES (5, 2, '销售一部', 0, '销售一部', '武汉', 1, 5, '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES (6, 2, '销售二部', 0, '销售二部', '武汉', 1, 6, '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES (7, 3, '运营一部', 0, '运营一部', '武汉', 1, 7, '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES (8, 2, '销售三部', 0, '销售三部', '11', 1, 8, '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES (9, 2, '销售四部', 0, '销售四部', '222', 1, 9, '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES (10, 2, '销售五部', 0, '销售五部', '33', 1, 10, '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES (24, 4, '33', 1, '333', '33', 1, 12, '2019-09-24 02:11:09');
INSERT INTO `sys_dept` VALUES (25, 4, '444', 1, '444', '44', 1, 13, '2019-09-24 02:11:25');

-- ----------------------------
-- Table structure for sys_loginfo
-- ----------------------------
DROP TABLE IF EXISTS `sys_loginfo`;
CREATE TABLE `sys_loginfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `loginip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logintime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 256 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_loginfo
-- ----------------------------
INSERT INTO `sys_loginfo` VALUES (2, '超级管理员-system', '127.0.0.1', '2018-12-21 16:54:52');
INSERT INTO `sys_loginfo` VALUES (3, '超级管理员-system', '127.0.0.1', '2018-12-21 16:55:15');
INSERT INTO `sys_loginfo` VALUES (4, '超级管理员-system', '127.0.0.1', '2018-12-21 17:29:22');
INSERT INTO `sys_loginfo` VALUES (5, '超级管理员-system', '127.0.0.1', '2018-12-22 09:05:22');
INSERT INTO `sys_loginfo` VALUES (6, '超级管理员-system', '127.0.0.1', '2018-12-22 09:20:43');
INSERT INTO `sys_loginfo` VALUES (7, '超级管理员-system', '127.0.0.1', '2018-12-22 09:25:40');
INSERT INTO `sys_loginfo` VALUES (8, '超级管理员-system', '127.0.0.1', '2018-12-22 09:27:11');
INSERT INTO `sys_loginfo` VALUES (9, '超级管理员-system', '127.0.0.1', '2018-12-22 09:29:58');
INSERT INTO `sys_loginfo` VALUES (10, '超级管理员-system', '127.0.0.1', '2018-12-22 09:36:49');
INSERT INTO `sys_loginfo` VALUES (11, '超级管理员-system', '127.0.0.1', '2018-12-22 09:46:56');
INSERT INTO `sys_loginfo` VALUES (12, '超级管理员-system', '127.0.0.1', '2018-12-22 09:48:29');
INSERT INTO `sys_loginfo` VALUES (13, '超级管理员-system', '127.0.0.1', '2018-12-22 09:49:13');
INSERT INTO `sys_loginfo` VALUES (14, '超级管理员-system', '127.0.0.1', '2018-12-22 09:49:57');
INSERT INTO `sys_loginfo` VALUES (15, '超级管理员-system', '127.0.0.1', '2018-12-22 09:57:46');
INSERT INTO `sys_loginfo` VALUES (16, '超级管理员-system', '127.0.0.1', '2018-12-22 10:21:53');
INSERT INTO `sys_loginfo` VALUES (17, '超级管理员-system', '127.0.0.1', '2018-12-22 10:38:25');
INSERT INTO `sys_loginfo` VALUES (18, '超级管理员-system', '127.0.0.1', '2018-12-22 10:49:21');
INSERT INTO `sys_loginfo` VALUES (19, '超级管理员-system', '127.0.0.1', '2018-12-22 14:01:42');
INSERT INTO `sys_loginfo` VALUES (20, '超级管理员-system', '127.0.0.1', '2018-12-22 14:19:48');
INSERT INTO `sys_loginfo` VALUES (21, '超级管理员-system', '127.0.0.1', '2018-12-22 14:45:29');
INSERT INTO `sys_loginfo` VALUES (22, '超级管理员-system', '127.0.0.1', '2018-12-22 15:58:05');
INSERT INTO `sys_loginfo` VALUES (23, '超级管理员-system', '127.0.0.1', '2018-12-22 16:40:53');
INSERT INTO `sys_loginfo` VALUES (24, '超级管理员-system', '127.0.0.1', '2018-12-22 17:12:01');
INSERT INTO `sys_loginfo` VALUES (25, '超级管理员-system', '127.0.0.1', '2018-12-24 09:19:15');
INSERT INTO `sys_loginfo` VALUES (26, '超级管理员-system', '127.0.0.1', '2018-12-24 09:37:28');
INSERT INTO `sys_loginfo` VALUES (27, '超级管理员-system', '127.0.0.1', '2018-12-24 09:46:51');
INSERT INTO `sys_loginfo` VALUES (28, '超级管理员-system', '127.0.0.1', '2018-12-24 09:50:40');
INSERT INTO `sys_loginfo` VALUES (29, '超级管理员-system', '127.0.0.1', '2018-12-24 09:52:52');
INSERT INTO `sys_loginfo` VALUES (30, '超级管理员-system', '127.0.0.1', '2018-12-24 10:00:26');
INSERT INTO `sys_loginfo` VALUES (31, '超级管理员-system', '127.0.0.1', '2018-12-24 10:10:58');
INSERT INTO `sys_loginfo` VALUES (32, '超级管理员-system', '127.0.0.1', '2018-12-24 10:21:28');
INSERT INTO `sys_loginfo` VALUES (33, '超级管理员-system', '127.0.0.1', '2018-12-24 11:22:27');
INSERT INTO `sys_loginfo` VALUES (34, '超级管理员-system', '127.0.0.1', '2018-12-24 11:35:28');
INSERT INTO `sys_loginfo` VALUES (35, '超级管理员-system', '127.0.0.1', '2018-12-24 14:05:28');
INSERT INTO `sys_loginfo` VALUES (36, '超级管理员-system', '127.0.0.1', '2018-12-24 15:16:29');
INSERT INTO `sys_loginfo` VALUES (37, '李四-ls', '127.0.0.1', '2018-12-24 15:16:50');
INSERT INTO `sys_loginfo` VALUES (38, '王五-ww', '127.0.0.1', '2018-12-24 15:17:36');
INSERT INTO `sys_loginfo` VALUES (39, '赵六-zl', '127.0.0.1', '2018-12-24 15:17:47');
INSERT INTO `sys_loginfo` VALUES (40, '孙七-sq', '127.0.0.1', '2018-12-24 15:17:58');
INSERT INTO `sys_loginfo` VALUES (41, '刘八-lb', '127.0.0.1', '2018-12-24 15:18:09');
INSERT INTO `sys_loginfo` VALUES (42, '超级管理员-system', '127.0.0.1', '2018-12-24 15:34:59');
INSERT INTO `sys_loginfo` VALUES (43, '超级管理员-system', '127.0.0.1', '2018-12-24 15:35:09');
INSERT INTO `sys_loginfo` VALUES (44, '刘八-lb', '127.0.0.1', '2018-12-24 15:36:09');
INSERT INTO `sys_loginfo` VALUES (45, '刘八-lb', '127.0.0.1', '2018-12-24 15:42:58');
INSERT INTO `sys_loginfo` VALUES (46, '刘八-lb', '127.0.0.1', '2018-12-24 15:43:04');
INSERT INTO `sys_loginfo` VALUES (47, '超级管理员-system', '127.0.0.1', '2018-12-24 15:46:01');
INSERT INTO `sys_loginfo` VALUES (48, '超级管理员-system', '127.0.0.1', '2018-12-24 17:03:54');
INSERT INTO `sys_loginfo` VALUES (49, '超级管理员-system', '127.0.0.1', '2018-12-24 17:26:32');
INSERT INTO `sys_loginfo` VALUES (50, '超级管理员-system', '127.0.0.1', '2018-12-25 09:07:42');
INSERT INTO `sys_loginfo` VALUES (51, '超级管理员-system', '127.0.0.1', '2018-12-25 09:16:27');
INSERT INTO `sys_loginfo` VALUES (52, '超级管理员-system', '127.0.0.1', '2018-12-25 09:59:03');
INSERT INTO `sys_loginfo` VALUES (53, '超级管理员-system', '127.0.0.1', '2018-12-25 10:05:13');
INSERT INTO `sys_loginfo` VALUES (54, '超级管理员-system', '127.0.0.1', '2018-12-25 10:05:47');
INSERT INTO `sys_loginfo` VALUES (55, '超级管理员-system', '127.0.0.1', '2018-12-25 10:11:17');
INSERT INTO `sys_loginfo` VALUES (56, '超级管理员-system', '127.0.0.1', '2018-12-25 10:14:06');
INSERT INTO `sys_loginfo` VALUES (57, '超级管理员-system', '127.0.0.1', '2018-12-25 10:36:16');
INSERT INTO `sys_loginfo` VALUES (58, '超级管理员-system', '127.0.0.1', '2018-12-25 14:17:21');
INSERT INTO `sys_loginfo` VALUES (59, '超级管理员-system', '127.0.0.1', '2018-12-25 14:20:00');
INSERT INTO `sys_loginfo` VALUES (60, '超级管理员-system', '127.0.0.1', '2018-12-25 14:34:22');
INSERT INTO `sys_loginfo` VALUES (61, '超级管理员-system', '127.0.0.1', '2018-12-25 14:34:27');
INSERT INTO `sys_loginfo` VALUES (62, '超级管理员-system', '127.0.0.1', '2018-12-25 14:38:37');
INSERT INTO `sys_loginfo` VALUES (63, '超级管理员-system', '127.0.0.1', '2018-12-25 14:50:37');
INSERT INTO `sys_loginfo` VALUES (64, '超级管理员-system', '127.0.0.1', '2018-12-25 16:01:35');
INSERT INTO `sys_loginfo` VALUES (65, '超级管理员-system', '127.0.0.1', '2018-12-25 16:25:28');
INSERT INTO `sys_loginfo` VALUES (66, '超级管理员-system', '127.0.0.1', '2018-12-25 16:27:37');
INSERT INTO `sys_loginfo` VALUES (67, '超级管理员-system', '127.0.0.1', '2018-12-25 16:28:28');
INSERT INTO `sys_loginfo` VALUES (68, '超级管理员-system', '127.0.0.1', '2018-12-25 16:44:02');
INSERT INTO `sys_loginfo` VALUES (69, '超级管理员-system', '127.0.0.1', '2018-12-25 16:47:55');
INSERT INTO `sys_loginfo` VALUES (70, '超级管理员-system', '127.0.0.1', '2018-12-28 15:59:34');
INSERT INTO `sys_loginfo` VALUES (71, '超级管理员-system', '127.0.0.1', '2018-12-28 17:27:16');
INSERT INTO `sys_loginfo` VALUES (72, '超级管理员-system', '127.0.0.1', '2018-12-28 17:29:40');
INSERT INTO `sys_loginfo` VALUES (73, '超级管理员-system', '127.0.0.1', '2018-12-28 17:51:10');
INSERT INTO `sys_loginfo` VALUES (74, '超级管理员-system', '127.0.0.1', '2019-04-15 17:05:02');
INSERT INTO `sys_loginfo` VALUES (75, '超级管理员-system', '127.0.0.1', '2019-04-15 17:05:12');
INSERT INTO `sys_loginfo` VALUES (76, '超级管理员-system', '127.0.0.1', '2019-04-15 17:10:22');
INSERT INTO `sys_loginfo` VALUES (77, '刘八-lb', '127.0.0.1', '2019-04-15 17:11:45');
INSERT INTO `sys_loginfo` VALUES (78, '刘八-lb', '127.0.0.1', '2019-04-15 17:28:50');
INSERT INTO `sys_loginfo` VALUES (79, '超级管理员-system', '127.0.0.1', '2019-04-15 17:29:13');
INSERT INTO `sys_loginfo` VALUES (80, '刘八-lb', '127.0.0.1', '2019-04-15 17:30:59');
INSERT INTO `sys_loginfo` VALUES (81, '刘八-lb', '127.0.0.1', '2019-04-15 17:32:42');
INSERT INTO `sys_loginfo` VALUES (82, '刘八-lb', '127.0.0.1', '2019-04-15 17:33:48');
INSERT INTO `sys_loginfo` VALUES (83, '刘八-lb', '127.0.0.1', '2019-04-15 17:34:17');
INSERT INTO `sys_loginfo` VALUES (84, '超级管理员-system', '127.0.0.1', '2019-04-15 17:36:40');
INSERT INTO `sys_loginfo` VALUES (85, '超级管理员-system', '127.0.0.1', '2019-04-15 17:47:21');
INSERT INTO `sys_loginfo` VALUES (86, '超级管理员-system', '127.0.0.1', '2019-04-15 17:54:10');
INSERT INTO `sys_loginfo` VALUES (87, '超级管理员-system', '127.0.0.1', '2019-04-15 17:55:52');
INSERT INTO `sys_loginfo` VALUES (88, '超级管理员-system', '127.0.0.1', '2019-04-16 09:26:01');
INSERT INTO `sys_loginfo` VALUES (89, '超级管理员-system', '127.0.0.1', '2019-04-16 09:26:25');
INSERT INTO `sys_loginfo` VALUES (90, '超级管理员-system', '127.0.0.1', '2019-04-16 09:46:54');
INSERT INTO `sys_loginfo` VALUES (91, '超级管理员-system', '127.0.0.1', '2019-04-16 10:07:48');
INSERT INTO `sys_loginfo` VALUES (92, '超级管理员-system', '127.0.0.1', '2019-04-16 10:10:30');
INSERT INTO `sys_loginfo` VALUES (93, '超级管理员-system', '127.0.0.1', '2019-04-16 10:14:29');
INSERT INTO `sys_loginfo` VALUES (94, '超级管理员-system', '127.0.0.1', '2019-04-16 10:15:04');
INSERT INTO `sys_loginfo` VALUES (95, '超级管理员-system', '127.0.0.1', '2019-04-16 10:15:58');
INSERT INTO `sys_loginfo` VALUES (96, '超级管理员-system', '127.0.0.1', '2019-04-16 10:28:14');
INSERT INTO `sys_loginfo` VALUES (97, '超级管理员-system', '127.0.0.1', '2019-04-16 10:32:42');
INSERT INTO `sys_loginfo` VALUES (98, '超级管理员-system', '127.0.0.1', '2019-04-16 10:33:03');
INSERT INTO `sys_loginfo` VALUES (99, '超级管理员-system', '127.0.0.1', '2019-04-16 11:02:01');
INSERT INTO `sys_loginfo` VALUES (100, '超级管理员-system', '127.0.0.1', '2019-04-16 11:03:09');
INSERT INTO `sys_loginfo` VALUES (101, '超级管理员-system', '127.0.0.1', '2019-04-16 11:13:42');
INSERT INTO `sys_loginfo` VALUES (102, '超级管理员-system', '127.0.0.1', '2019-04-16 11:24:55');
INSERT INTO `sys_loginfo` VALUES (104, '超级管理员-system', '127.0.0.1', '2019-08-14 01:11:34');
INSERT INTO `sys_loginfo` VALUES (105, '超级管理员-system', '127.0.0.1', '2019-08-14 01:24:03');
INSERT INTO `sys_loginfo` VALUES (106, '李四-ls', '127.0.0.1', '2019-08-14 01:25:47');
INSERT INTO `sys_loginfo` VALUES (107, '李四-ls', '127.0.0.1', '2019-08-14 01:26:41');
INSERT INTO `sys_loginfo` VALUES (108, '孙七-sq', '127.0.0.1', '2019-08-14 01:28:22');
INSERT INTO `sys_loginfo` VALUES (109, '刘八-lb', '127.0.0.1', '2019-08-14 01:28:32');
INSERT INTO `sys_loginfo` VALUES (110, '超级管理员-system', '127.0.0.1', '2019-08-14 01:46:18');
INSERT INTO `sys_loginfo` VALUES (111, '超级管理员-system', '127.0.0.1', '2019-08-14 02:18:44');
INSERT INTO `sys_loginfo` VALUES (112, '超级管理员-system', '127.0.0.1', '2019-08-14 02:32:06');
INSERT INTO `sys_loginfo` VALUES (113, '李四-ls', '127.0.0.1', '2019-08-14 03:00:19');
INSERT INTO `sys_loginfo` VALUES (114, '李四-ls', '127.0.0.1', '2019-08-14 03:00:56');
INSERT INTO `sys_loginfo` VALUES (115, '李四-ls', '127.0.0.1', '2019-08-14 03:01:31');
INSERT INTO `sys_loginfo` VALUES (116, '李四-ls', '127.0.0.1', '2019-08-14 03:01:39');
INSERT INTO `sys_loginfo` VALUES (117, '李四-ls', '127.0.0.1', '2019-08-14 03:02:25');
INSERT INTO `sys_loginfo` VALUES (118, '李四-ls', '127.0.0.1', '2019-08-14 03:04:57');
INSERT INTO `sys_loginfo` VALUES (119, '李四-ls', '127.0.0.1', '2019-08-14 03:07:19');
INSERT INTO `sys_loginfo` VALUES (120, '李四-ls', '127.0.0.1', '2019-08-14 03:07:54');
INSERT INTO `sys_loginfo` VALUES (121, '超级管理员-system', '127.0.0.1', '2019-08-14 03:13:06');
INSERT INTO `sys_loginfo` VALUES (122, '李四-ls', '127.0.0.1', '2019-08-14 03:14:46');
INSERT INTO `sys_loginfo` VALUES (123, '超级管理员-system', '127.0.0.1', '2019-08-14 06:03:47');
INSERT INTO `sys_loginfo` VALUES (124, '超级管理员-system', '127.0.0.1', '2019-08-14 07:20:12');
INSERT INTO `sys_loginfo` VALUES (125, '超级管理员-system', '127.0.0.1', '2019-08-14 07:23:05');
INSERT INTO `sys_loginfo` VALUES (126, '超级管理员-system', '127.0.0.1', '2019-08-14 07:25:30');
INSERT INTO `sys_loginfo` VALUES (127, '超级管理员-system', '127.0.0.1', '2019-08-14 07:26:34');
INSERT INTO `sys_loginfo` VALUES (128, '超级管理员-system', '127.0.0.1', '2019-08-14 07:27:22');
INSERT INTO `sys_loginfo` VALUES (129, '超级管理员-system', '127.0.0.1', '2019-08-14 07:27:51');
INSERT INTO `sys_loginfo` VALUES (130, '超级管理员-system', '127.0.0.1', '2019-08-14 08:22:05');
INSERT INTO `sys_loginfo` VALUES (131, '超级管理员-system', '127.0.0.1', '2019-08-14 08:43:53');
INSERT INTO `sys_loginfo` VALUES (132, '超级管理员-system', '127.0.0.1', '2019-08-14 08:45:55');
INSERT INTO `sys_loginfo` VALUES (133, '超级管理员-system', '127.0.0.1', '2019-08-14 08:47:13');
INSERT INTO `sys_loginfo` VALUES (134, '超级管理员-system', '127.0.0.1', '2019-08-14 09:35:20');
INSERT INTO `sys_loginfo` VALUES (135, '超级管理员-system', '127.0.0.1', '2019-08-14 09:41:02');
INSERT INTO `sys_loginfo` VALUES (136, '超级管理员-system', '127.0.0.1', '2019-08-14 09:44:04');
INSERT INTO `sys_loginfo` VALUES (137, '超级管理员-system', '127.0.0.1', '2019-08-14 09:50:27');
INSERT INTO `sys_loginfo` VALUES (138, '超级管理员-system', '127.0.0.1', '2019-08-14 09:56:57');
INSERT INTO `sys_loginfo` VALUES (139, '超级管理员-system', '127.0.0.1', '2019-08-14 09:59:02');
INSERT INTO `sys_loginfo` VALUES (140, '超级管理员-system', '127.0.0.1', '2019-08-16 01:05:37');
INSERT INTO `sys_loginfo` VALUES (141, '超级管理员-system', '127.0.0.1', '2019-08-16 02:01:44');
INSERT INTO `sys_loginfo` VALUES (142, '超级管理员-system', '127.0.0.1', '2019-08-16 02:05:57');
INSERT INTO `sys_loginfo` VALUES (143, '超级管理员-system', '127.0.0.1', '2019-08-16 02:07:04');
INSERT INTO `sys_loginfo` VALUES (144, '超级管理员-system', '127.0.0.1', '2019-08-16 02:20:02');
INSERT INTO `sys_loginfo` VALUES (145, '超级管理员-system', '127.0.0.1', '2019-08-16 02:20:20');
INSERT INTO `sys_loginfo` VALUES (146, '超级管理员-system', '127.0.0.1', '2019-08-16 02:21:42');
INSERT INTO `sys_loginfo` VALUES (147, '超级管理员-system', '127.0.0.1', '2019-08-16 03:37:37');
INSERT INTO `sys_loginfo` VALUES (148, '超级管理员-system', '127.0.0.1', '2019-08-16 03:52:40');
INSERT INTO `sys_loginfo` VALUES (149, '超级管理员-system', '127.0.0.1', '2019-08-16 03:59:37');
INSERT INTO `sys_loginfo` VALUES (150, '超级管理员-system', '127.0.0.1', '2019-08-16 06:11:45');
INSERT INTO `sys_loginfo` VALUES (151, '超级管理员-system', '127.0.0.1', '2019-08-16 06:23:27');
INSERT INTO `sys_loginfo` VALUES (153, '超级管理员-system', '127.0.0.1', '2019-08-16 06:54:49');
INSERT INTO `sys_loginfo` VALUES (154, '超级管理员-system', '127.0.0.1', '2019-08-16 07:00:48');
INSERT INTO `sys_loginfo` VALUES (155, '超级管理员-system', '127.0.0.1', '2019-08-16 07:01:18');
INSERT INTO `sys_loginfo` VALUES (156, '超级管理员-system', '127.0.0.1', '2019-08-16 07:03:35');
INSERT INTO `sys_loginfo` VALUES (157, '超级管理员-system', '127.0.0.1', '2019-08-16 07:09:55');
INSERT INTO `sys_loginfo` VALUES (158, '超级管理员-system', '127.0.0.1', '2019-08-16 07:46:09');
INSERT INTO `sys_loginfo` VALUES (159, '超级管理员-system', '127.0.0.1', '2019-08-16 08:17:59');
INSERT INTO `sys_loginfo` VALUES (160, '超级管理员-system', '127.0.0.1', '2019-08-16 08:22:29');
INSERT INTO `sys_loginfo` VALUES (161, '超级管理员-system', '127.0.0.1', '2019-08-16 08:23:32');
INSERT INTO `sys_loginfo` VALUES (162, '超级管理员-system', '127.0.0.1', '2019-08-16 08:26:48');
INSERT INTO `sys_loginfo` VALUES (169, '超级管理员-system', '127.0.0.1', '2019-09-21 06:27:30');
INSERT INTO `sys_loginfo` VALUES (170, '超级管理员-system', '127.0.0.1', '2019-09-21 08:21:06');
INSERT INTO `sys_loginfo` VALUES (171, '超级管理员-system', '127.0.0.1', '2019-09-21 08:37:15');
INSERT INTO `sys_loginfo` VALUES (172, '超级管理员-system', '127.0.0.1', '2019-09-21 09:06:00');
INSERT INTO `sys_loginfo` VALUES (173, '超级管理员-system', '127.0.0.1', '2019-09-23 01:15:49');
INSERT INTO `sys_loginfo` VALUES (174, '超级管理员-system', '127.0.0.1', '2019-09-23 01:33:24');
INSERT INTO `sys_loginfo` VALUES (175, '超级管理员-system', '127.0.0.1', '2019-09-23 03:29:51');
INSERT INTO `sys_loginfo` VALUES (176, '超级管理员-system', '127.0.0.1', '2019-09-23 06:13:27');
INSERT INTO `sys_loginfo` VALUES (177, '超级管理员-system', '127.0.0.1', '2019-09-23 06:47:14');
INSERT INTO `sys_loginfo` VALUES (178, '超级管理员-system', '127.0.0.1', '2019-09-23 07:06:44');
INSERT INTO `sys_loginfo` VALUES (180, '超级管理员-system', '127.0.0.1', '2019-09-23 09:54:08');
INSERT INTO `sys_loginfo` VALUES (181, '超级管理员-system', '127.0.0.1', '2019-09-23 09:56:48');
INSERT INTO `sys_loginfo` VALUES (182, '超级管理员-system', '127.0.0.1', '2019-09-23 13:41:31');
INSERT INTO `sys_loginfo` VALUES (183, '超级管理员-system', '127.0.0.1', '2019-09-23 14:36:22');
INSERT INTO `sys_loginfo` VALUES (184, '超级管理员-system', '127.0.0.1', '2019-09-24 01:05:42');
INSERT INTO `sys_loginfo` VALUES (185, '超级管理员-system', '127.0.0.1', '2019-09-24 01:31:22');
INSERT INTO `sys_loginfo` VALUES (186, '超级管理员-system', '127.0.0.1', '2019-09-24 02:10:56');
INSERT INTO `sys_loginfo` VALUES (187, '超级管理员-system', '127.0.0.1', '2019-09-24 06:18:21');
INSERT INTO `sys_loginfo` VALUES (188, '超级管理员-system', '127.0.0.1', '2019-09-24 06:59:55');
INSERT INTO `sys_loginfo` VALUES (189, '超级管理员-system', '127.0.0.1', '2019-09-24 07:22:44');
INSERT INTO `sys_loginfo` VALUES (190, '超级管理员-system', '127.0.0.1', '2019-09-24 07:34:33');
INSERT INTO `sys_loginfo` VALUES (191, '超级管理员-system', '127.0.0.1', '2019-09-24 08:58:13');
INSERT INTO `sys_loginfo` VALUES (192, '超级管理员-system', '127.0.0.1', '2019-09-24 12:43:54');
INSERT INTO `sys_loginfo` VALUES (193, '超级管理员-system', '127.0.0.1', '2019-09-25 01:05:12');
INSERT INTO `sys_loginfo` VALUES (194, '超级管理员-system', '127.0.0.1', '2019-09-25 01:37:40');
INSERT INTO `sys_loginfo` VALUES (195, '超级管理员-system', '127.0.0.1', '2019-09-25 01:43:26');
INSERT INTO `sys_loginfo` VALUES (196, '超级管理员-system', '127.0.0.1', '2019-09-25 01:46:40');
INSERT INTO `sys_loginfo` VALUES (197, '超级管理员-system', '127.0.0.1', '2019-09-25 01:55:27');
INSERT INTO `sys_loginfo` VALUES (198, '超级管理员-system', '127.0.0.1', '2019-09-25 02:27:40');
INSERT INTO `sys_loginfo` VALUES (199, '超级管理员-system', '127.0.0.1', '2019-09-25 02:32:48');
INSERT INTO `sys_loginfo` VALUES (200, '超级管理员-system', '127.0.0.1', '2019-09-25 02:35:53');
INSERT INTO `sys_loginfo` VALUES (201, '超级管理员-system', '127.0.0.1', '2019-09-25 03:33:17');
INSERT INTO `sys_loginfo` VALUES (202, '超级管理员-system', '127.0.0.1', '2019-09-25 06:05:49');
INSERT INTO `sys_loginfo` VALUES (203, '超级管理员-system', '127.0.0.1', '2019-09-25 06:44:21');
INSERT INTO `sys_loginfo` VALUES (204, '超级管理员-system', '127.0.0.1', '2019-09-25 06:47:39');
INSERT INTO `sys_loginfo` VALUES (205, '超级管理员-system', '127.0.0.1', '2019-09-25 06:54:08');
INSERT INTO `sys_loginfo` VALUES (206, '小小明-xiaoxiaoming', '127.0.0.1', '2019-09-25 06:55:09');
INSERT INTO `sys_loginfo` VALUES (207, '超级管理员-system', '127.0.0.1', '2019-09-25 06:55:18');
INSERT INTO `sys_loginfo` VALUES (208, '超级管理员-system', '127.0.0.1', '2019-09-25 08:23:32');
INSERT INTO `sys_loginfo` VALUES (209, '超级管理员-system', '127.0.0.1', '2019-09-25 09:32:37');
INSERT INTO `sys_loginfo` VALUES (210, '超级管理员-system', '127.0.0.1', '2019-09-25 09:41:34');
INSERT INTO `sys_loginfo` VALUES (211, '超级管理员-system', '127.0.0.1', '2019-09-25 09:57:10');
INSERT INTO `sys_loginfo` VALUES (212, '李四-ls', '127.0.0.1', '2019-09-25 09:58:02');
INSERT INTO `sys_loginfo` VALUES (213, '王五-ww', '127.0.0.1', '2019-09-25 09:58:13');
INSERT INTO `sys_loginfo` VALUES (214, '习大大-xidada', '127.0.0.1', '2019-09-25 09:58:24');
INSERT INTO `sys_loginfo` VALUES (215, '刘八-lb', '127.0.0.1', '2019-09-25 10:06:07');
INSERT INTO `sys_loginfo` VALUES (216, '刘八-lb', '127.0.0.1', '2019-09-25 10:09:17');
INSERT INTO `sys_loginfo` VALUES (217, '刘八-lb', '127.0.0.1', '2019-09-25 10:11:39');
INSERT INTO `sys_loginfo` VALUES (218, '刘八-lb', '127.0.0.1', '2019-09-25 10:13:49');
INSERT INTO `sys_loginfo` VALUES (219, '刘八-lb', '127.0.0.1', '2019-09-25 10:14:16');
INSERT INTO `sys_loginfo` VALUES (220, '超级管理员-system', '127.0.0.1', '2019-09-27 01:12:10');
INSERT INTO `sys_loginfo` VALUES (221, '超级管理员-system', '127.0.0.1', '2019-09-27 01:34:40');
INSERT INTO `sys_loginfo` VALUES (222, '超级管理员-system', '127.0.0.1', '2019-09-27 01:36:20');
INSERT INTO `sys_loginfo` VALUES (223, '超级管理员-system', '127.0.0.1', '2019-09-27 03:03:01');
INSERT INTO `sys_loginfo` VALUES (224, '超级管理员-system', '127.0.0.1', '2019-09-27 06:12:41');
INSERT INTO `sys_loginfo` VALUES (225, '超级管理员-system', '127.0.0.1', '2019-09-27 06:30:55');
INSERT INTO `sys_loginfo` VALUES (226, '超级管理员-system', '127.0.0.1', '2019-09-27 06:32:23');
INSERT INTO `sys_loginfo` VALUES (227, '超级管理员-system', '127.0.0.1', '2019-09-27 06:35:18');
INSERT INTO `sys_loginfo` VALUES (228, '超级管理员-system', '127.0.0.1', '2019-09-27 06:41:36');
INSERT INTO `sys_loginfo` VALUES (229, '超级管理员-system', '127.0.0.1', '2019-09-27 06:54:10');
INSERT INTO `sys_loginfo` VALUES (230, '超级管理员-system', '127.0.0.1', '2019-09-27 07:21:43');
INSERT INTO `sys_loginfo` VALUES (231, '超级管理员-system', '127.0.0.1', '2019-09-27 07:22:43');
INSERT INTO `sys_loginfo` VALUES (232, '超级管理员-system', '127.0.0.1', '2019-09-27 07:23:35');
INSERT INTO `sys_loginfo` VALUES (233, '超级管理员-system', '127.0.0.1', '2019-09-27 07:35:38');
INSERT INTO `sys_loginfo` VALUES (234, '超级管理员-system', '127.0.0.1', '2019-09-27 08:38:42');
INSERT INTO `sys_loginfo` VALUES (235, '超级管理员-system', '127.0.0.1', '2019-09-27 08:49:03');
INSERT INTO `sys_loginfo` VALUES (236, '超级管理员-system', '127.0.0.1', '2019-09-27 08:50:09');
INSERT INTO `sys_loginfo` VALUES (237, '超级管理员-system', '127.0.0.1', '2019-09-27 08:55:53');
INSERT INTO `sys_loginfo` VALUES (238, '超级管理员-system', '127.0.0.1', '2019-09-27 09:03:14');
INSERT INTO `sys_loginfo` VALUES (239, '超级管理员-system', '127.0.0.1', '2019-09-27 09:05:30');
INSERT INTO `sys_loginfo` VALUES (240, '超级管理员-system', '127.0.0.1', '2019-09-27 09:13:24');
INSERT INTO `sys_loginfo` VALUES (241, '超级管理员-system', '127.0.0.1', '2019-09-27 11:40:15');
INSERT INTO `sys_loginfo` VALUES (242, '超级管理员-system', '127.0.0.1', '2019-09-28 01:06:10');
INSERT INTO `sys_loginfo` VALUES (243, '超级管理员-system', '127.0.0.1', '2019-09-28 01:34:38');
INSERT INTO `sys_loginfo` VALUES (244, '超级管理员-system', '127.0.0.1', '2019-09-28 01:37:49');
INSERT INTO `sys_loginfo` VALUES (245, '超级管理员-system', '127.0.0.1', '2019-09-28 01:41:24');
INSERT INTO `sys_loginfo` VALUES (246, '超级管理员-system', '127.0.0.1', '2019-09-28 02:04:47');
INSERT INTO `sys_loginfo` VALUES (247, '超级管理员-system', '127.0.0.1', '2019-09-28 02:10:42');
INSERT INTO `sys_loginfo` VALUES (248, '超级管理员-system', '127.0.0.1', '2019-09-28 03:09:10');
INSERT INTO `sys_loginfo` VALUES (249, '超级管理员-system', '127.0.0.1', '2019-09-28 03:16:51');
INSERT INTO `sys_loginfo` VALUES (250, '超级管理员-system', '127.0.0.1', '2019-09-28 03:46:59');
INSERT INTO `sys_loginfo` VALUES (251, '超级管理员-system', '127.0.0.1', '2019-09-28 06:44:10');
INSERT INTO `sys_loginfo` VALUES (252, '超级管理员-system', '127.0.0.1', '2019-09-28 06:51:39');
INSERT INTO `sys_loginfo` VALUES (253, '超级管理员-system', '127.0.0.1', '2019-09-28 06:56:05');
INSERT INTO `sys_loginfo` VALUES (254, '超级管理员-system', '127.0.0.1', '2019-09-28 07:32:20');
INSERT INTO `sys_loginfo` VALUES (255, '超级管理员-system', '127.0.0.1', '2019-09-28 07:37:57');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createtime` datetime(0) NULL DEFAULT NULL,
  `opername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '关于系统V1.3更新公告', '2', '2018-08-07 00:00:00', '管理员');
INSERT INTO `sys_notice` VALUES (10, '关于系统V1.2更新公告', '12312312<img src=\"/resources/layui/images/face/42.gif\" alt=\"[抓狂]\">', '2018-08-07 00:00:00', '超级管理员');
INSERT INTO `sys_notice` VALUES (11, '关于系统V1.1更新公告', '21321321321<img src=\"/resources/layui/images/face/18.gif\" alt=\"[右哼哼]\">', '2018-08-07 00:00:00', '超级管理员');
INSERT INTO `sys_notice` VALUES (17, 'x', 'a', '2019-09-24 08:57:03', 'b');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限类型[menu/permission]',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `percode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限编码[只有type= permission才有  user:view]',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `target` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `open` int(11) NULL DEFAULT NULL,
  `ordernum` int(11) NULL DEFAULT NULL,
  `available` int(11) NULL DEFAULT NULL COMMENT '状态【0不可用1可用】',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (1, 0, 'menu', '尚学堂进销存管理系统', NULL, '&#xe68e;', '', '', 1, 1, 1);
INSERT INTO `sys_permission` VALUES (2, 1, 'menu', '基础管理', NULL, '&#xe857;', '', '', 1, 2, 1);
INSERT INTO `sys_permission` VALUES (3, 1, 'menu', '进货管理', NULL, '&#xe645;', '', NULL, 0, 3, 1);
INSERT INTO `sys_permission` VALUES (4, 1, 'menu', '销售管理', NULL, '&#xe611;', '', '', 0, 4, 1);
INSERT INTO `sys_permission` VALUES (5, 1, 'menu', '系统管理', NULL, '&#xe614;', '', '', 0, 5, 1);
INSERT INTO `sys_permission` VALUES (6, 1, 'menu', '其它管理', NULL, '&#xe628;', '', '', 0, 6, 1);
INSERT INTO `sys_permission` VALUES (7, 2, 'menu', '客户管理', NULL, '&#xe651;', '/bus/toCustomerManager', '', 0, 7, 1);
INSERT INTO `sys_permission` VALUES (8, 2, 'menu', '供应商管理', NULL, '&#xe658;', '/bus/toProviderManager', '', 0, 8, 1);
INSERT INTO `sys_permission` VALUES (9, 2, 'menu', '商品管理', NULL, '&#xe657;', '/bus/toGoodsManager', '', 0, 9, 1);
INSERT INTO `sys_permission` VALUES (10, 3, 'menu', '商品进货', NULL, '&#xe756;', '/bus/toInportManager', '', 0, 10, 1);
INSERT INTO `sys_permission` VALUES (11, 3, 'menu', '商品退货查询', NULL, '&#xe65a;', '/bus/toOutportManager', '', 0, 11, 1);
INSERT INTO `sys_permission` VALUES (12, 4, 'menu', '商品销售', NULL, '&#xe65b;', '', '', 0, 12, 1);
INSERT INTO `sys_permission` VALUES (13, 4, 'menu', '销售退货查询', NULL, '&#xe770;', '', '', 0, 13, 1);
INSERT INTO `sys_permission` VALUES (14, 5, 'menu', '部门管理', NULL, '&#xe770;', '/sys/toDeptManager', '', 0, 14, 1);
INSERT INTO `sys_permission` VALUES (15, 5, 'menu', '菜单管理', NULL, '&#xe857;', '/sys/toMenuManager', '', 0, 15, 1);
INSERT INTO `sys_permission` VALUES (16, 5, 'menu', '权限管理', '', '&#xe857;', '/sys/toPermissionManager', '', 0, 16, 1);
INSERT INTO `sys_permission` VALUES (17, 5, 'menu', '角色管理', '', '&#xe650;', '/sys/toRoleManager', '', 0, 17, 1);
INSERT INTO `sys_permission` VALUES (18, 5, 'menu', '用户管理', '', '&#xe612;', '/sys/toUserManager', '', 0, 18, 1);
INSERT INTO `sys_permission` VALUES (21, 6, 'menu', '登陆日志', NULL, '&#xe675;', '/sys/toLoginfoManager', '', 0, 21, 1);
INSERT INTO `sys_permission` VALUES (22, 6, 'menu', '系统公告', NULL, '&#xe756;', '/sys/toNoticeManager', NULL, 0, 22, 1);
INSERT INTO `sys_permission` VALUES (23, 6, 'menu', '图标管理', NULL, '&#xe670;', '../resources/page/icon.html', NULL, 0, 23, 1);
INSERT INTO `sys_permission` VALUES (30, 14, 'permission', '添加部门', 'dept:create', '', NULL, NULL, 0, 24, 1);
INSERT INTO `sys_permission` VALUES (31, 14, 'permission', '修改部门', 'dept:update', '', NULL, NULL, 0, 26, 1);
INSERT INTO `sys_permission` VALUES (32, 14, 'permission', '删除部门', 'dept:delete', '', NULL, NULL, 0, 27, 1);
INSERT INTO `sys_permission` VALUES (34, 15, 'permission', '添加菜单', 'menu:create', '', '', '', 0, 29, 1);
INSERT INTO `sys_permission` VALUES (35, 15, 'permission', '修改菜单', 'menu:update', '', NULL, NULL, 0, 30, 1);
INSERT INTO `sys_permission` VALUES (36, 15, 'permission', '删除菜单', 'menu:delete', '', NULL, NULL, 0, 31, 1);
INSERT INTO `sys_permission` VALUES (38, 16, 'permission', '添加权限', 'permission:create', '', NULL, NULL, 0, 33, 1);
INSERT INTO `sys_permission` VALUES (39, 16, 'permission', '修改权限', 'permission:update', '', NULL, NULL, 0, 34, 1);
INSERT INTO `sys_permission` VALUES (40, 16, 'permission', '删除权限', 'permission:delete', '', NULL, NULL, 0, 35, 1);
INSERT INTO `sys_permission` VALUES (42, 17, 'permission', '添加角色', 'role:create', '', NULL, NULL, 0, 37, 1);
INSERT INTO `sys_permission` VALUES (43, 17, 'permission', '修改角色', 'role:update', '', NULL, NULL, 0, 38, 1);
INSERT INTO `sys_permission` VALUES (44, 17, 'permission', '角色删除', 'role:delete', '', NULL, NULL, 0, 39, 1);
INSERT INTO `sys_permission` VALUES (46, 17, 'permission', '分配权限', 'role:selectPermission', '', NULL, NULL, 0, 41, 1);
INSERT INTO `sys_permission` VALUES (47, 18, 'permission', '添加用户', 'user:create', '', NULL, NULL, 0, 42, 1);
INSERT INTO `sys_permission` VALUES (48, 18, 'permission', '修改用户', 'user:update', '', NULL, NULL, 0, 43, 1);
INSERT INTO `sys_permission` VALUES (49, 18, 'permission', '删除用户', 'user:delete', '', NULL, NULL, 0, 44, 1);
INSERT INTO `sys_permission` VALUES (51, 18, 'permission', '用户分配角色', 'user:selectRole', '', NULL, NULL, 0, 46, 1);
INSERT INTO `sys_permission` VALUES (52, 18, 'permission', '重置密码', 'user:resetPwd', NULL, NULL, NULL, 0, 47, 1);
INSERT INTO `sys_permission` VALUES (53, 14, 'permission', '部门查询', 'dept:view', NULL, NULL, NULL, 0, 48, 1);
INSERT INTO `sys_permission` VALUES (54, 15, 'permission', '菜单查询', 'menu:view', NULL, NULL, NULL, 0, 49, 1);
INSERT INTO `sys_permission` VALUES (55, 16, 'permission', '权限查询', 'permission:view', NULL, NULL, NULL, 0, 50, 1);
INSERT INTO `sys_permission` VALUES (56, 17, 'permission', '角色查询', 'role:view', NULL, NULL, NULL, 0, 51, 1);
INSERT INTO `sys_permission` VALUES (57, 18, 'permission', '用户查询', 'user:view', NULL, NULL, NULL, 0, 52, 1);
INSERT INTO `sys_permission` VALUES (68, 7, 'permission', '客户查询', 'customer:view', NULL, NULL, NULL, NULL, 60, 1);
INSERT INTO `sys_permission` VALUES (69, 7, 'permission', '客户添加', 'customer:create', NULL, NULL, NULL, NULL, 61, 1);
INSERT INTO `sys_permission` VALUES (70, 7, 'permission', '客户修改', 'customer:update', NULL, NULL, NULL, NULL, 62, 1);
INSERT INTO `sys_permission` VALUES (71, 7, 'permission', '客户删除', 'customer:delete', NULL, NULL, NULL, NULL, 63, 1);
INSERT INTO `sys_permission` VALUES (73, 21, 'permission', '日志查询', 'info:view', NULL, NULL, NULL, NULL, 65, 1);
INSERT INTO `sys_permission` VALUES (74, 21, 'permission', '日志删除', 'info:delete', NULL, NULL, NULL, NULL, 66, 1);
INSERT INTO `sys_permission` VALUES (75, 21, 'permission', '日志批量删除', 'info:batchdelete', NULL, NULL, NULL, NULL, 67, 1);
INSERT INTO `sys_permission` VALUES (76, 22, 'permission', '公告查询', 'notice:view', NULL, NULL, NULL, NULL, 68, 1);
INSERT INTO `sys_permission` VALUES (77, 22, 'permission', '公告添加', 'notice:create', NULL, NULL, NULL, NULL, 69, 1);
INSERT INTO `sys_permission` VALUES (78, 22, 'permission', '公告修改', 'notice:update', NULL, NULL, NULL, NULL, 70, 1);
INSERT INTO `sys_permission` VALUES (79, 22, 'permission', '公告删除', 'notice:delete', NULL, NULL, NULL, NULL, 71, 1);
INSERT INTO `sys_permission` VALUES (81, 8, 'permission', '供应商查询', 'provider:view', NULL, NULL, NULL, NULL, 73, 1);
INSERT INTO `sys_permission` VALUES (82, 8, 'permission', '供应商添加', 'provider:create', NULL, NULL, NULL, NULL, 74, 1);
INSERT INTO `sys_permission` VALUES (83, 8, 'permission', '供应商修改', 'provider:update', NULL, NULL, NULL, NULL, 75, 1);
INSERT INTO `sys_permission` VALUES (84, 8, 'permission', '供应商删除', 'provider:delete', NULL, NULL, NULL, NULL, 76, 1);
INSERT INTO `sys_permission` VALUES (86, 22, 'permission', '公告查看', 'notice:viewnotice', NULL, NULL, NULL, NULL, 78, 1);
INSERT INTO `sys_permission` VALUES (91, 9, 'permission', '商品查询', 'goods:view', NULL, NULL, NULL, 0, 79, 1);
INSERT INTO `sys_permission` VALUES (92, 9, 'permission', '商品添加', 'goods:create', NULL, NULL, NULL, 0, 80, 1);
INSERT INTO `sys_permission` VALUES (94, 9, 'permission', '商品修改', 'goods:update', NULL, 'goods:update', NULL, 0, 81, 1);
INSERT INTO `sys_permission` VALUES (95, 6, 'menu', '缓存管理', NULL, '&#xe681;', '/sys/toCacheManager', '', 1, 82, 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` int(11) NULL DEFAULT NULL,
  `createtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', '拥有所有菜单权限', 1, '2019-04-10 14:06:32');
INSERT INTO `sys_role` VALUES (4, '基础数据管理员', '基础数据管理员', 1, '2019-04-10 14:06:32');
INSERT INTO `sys_role` VALUES (5, '仓库管理员', '仓库管理员', 1, '2019-04-10 14:06:32');
INSERT INTO `sys_role` VALUES (6, '销售管理员', '销售管理员', 1, '2019-04-10 14:06:32');
INSERT INTO `sys_role` VALUES (7, '系统管理员', '系统管理员', 1, '2019-04-10 14:06:32');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `rid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`pid`, `rid`) USING BTREE,
  INDEX `FK_tcsr9ucxypb3ce1q5qngsfk33`(`rid`) USING BTREE,
  CONSTRAINT `sys_role_permission_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `sys_permission` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `sys_role_permission_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES (1, 1);
INSERT INTO `sys_role_permission` VALUES (1, 2);
INSERT INTO `sys_role_permission` VALUES (1, 3);
INSERT INTO `sys_role_permission` VALUES (1, 4);
INSERT INTO `sys_role_permission` VALUES (1, 5);
INSERT INTO `sys_role_permission` VALUES (1, 6);
INSERT INTO `sys_role_permission` VALUES (1, 7);
INSERT INTO `sys_role_permission` VALUES (1, 8);
INSERT INTO `sys_role_permission` VALUES (1, 9);
INSERT INTO `sys_role_permission` VALUES (1, 10);
INSERT INTO `sys_role_permission` VALUES (1, 11);
INSERT INTO `sys_role_permission` VALUES (1, 12);
INSERT INTO `sys_role_permission` VALUES (1, 13);
INSERT INTO `sys_role_permission` VALUES (1, 14);
INSERT INTO `sys_role_permission` VALUES (1, 15);
INSERT INTO `sys_role_permission` VALUES (1, 16);
INSERT INTO `sys_role_permission` VALUES (1, 17);
INSERT INTO `sys_role_permission` VALUES (1, 18);
INSERT INTO `sys_role_permission` VALUES (1, 21);
INSERT INTO `sys_role_permission` VALUES (1, 22);
INSERT INTO `sys_role_permission` VALUES (1, 23);
INSERT INTO `sys_role_permission` VALUES (1, 30);
INSERT INTO `sys_role_permission` VALUES (1, 31);
INSERT INTO `sys_role_permission` VALUES (1, 32);
INSERT INTO `sys_role_permission` VALUES (1, 34);
INSERT INTO `sys_role_permission` VALUES (1, 35);
INSERT INTO `sys_role_permission` VALUES (1, 36);
INSERT INTO `sys_role_permission` VALUES (1, 38);
INSERT INTO `sys_role_permission` VALUES (1, 39);
INSERT INTO `sys_role_permission` VALUES (1, 40);
INSERT INTO `sys_role_permission` VALUES (1, 42);
INSERT INTO `sys_role_permission` VALUES (1, 43);
INSERT INTO `sys_role_permission` VALUES (1, 44);
INSERT INTO `sys_role_permission` VALUES (1, 46);
INSERT INTO `sys_role_permission` VALUES (1, 47);
INSERT INTO `sys_role_permission` VALUES (1, 48);
INSERT INTO `sys_role_permission` VALUES (1, 49);
INSERT INTO `sys_role_permission` VALUES (1, 51);
INSERT INTO `sys_role_permission` VALUES (1, 52);
INSERT INTO `sys_role_permission` VALUES (1, 53);
INSERT INTO `sys_role_permission` VALUES (1, 54);
INSERT INTO `sys_role_permission` VALUES (1, 55);
INSERT INTO `sys_role_permission` VALUES (1, 56);
INSERT INTO `sys_role_permission` VALUES (1, 57);
INSERT INTO `sys_role_permission` VALUES (1, 68);
INSERT INTO `sys_role_permission` VALUES (1, 69);
INSERT INTO `sys_role_permission` VALUES (1, 70);
INSERT INTO `sys_role_permission` VALUES (1, 71);
INSERT INTO `sys_role_permission` VALUES (1, 73);
INSERT INTO `sys_role_permission` VALUES (1, 74);
INSERT INTO `sys_role_permission` VALUES (1, 75);
INSERT INTO `sys_role_permission` VALUES (1, 76);
INSERT INTO `sys_role_permission` VALUES (1, 77);
INSERT INTO `sys_role_permission` VALUES (1, 78);
INSERT INTO `sys_role_permission` VALUES (1, 79);
INSERT INTO `sys_role_permission` VALUES (1, 81);
INSERT INTO `sys_role_permission` VALUES (1, 82);
INSERT INTO `sys_role_permission` VALUES (1, 83);
INSERT INTO `sys_role_permission` VALUES (1, 84);
INSERT INTO `sys_role_permission` VALUES (1, 86);
INSERT INTO `sys_role_permission` VALUES (1, 91);
INSERT INTO `sys_role_permission` VALUES (1, 92);
INSERT INTO `sys_role_permission` VALUES (1, 94);
INSERT INTO `sys_role_permission` VALUES (4, 1);
INSERT INTO `sys_role_permission` VALUES (4, 2);
INSERT INTO `sys_role_permission` VALUES (4, 7);
INSERT INTO `sys_role_permission` VALUES (4, 8);
INSERT INTO `sys_role_permission` VALUES (4, 9);
INSERT INTO `sys_role_permission` VALUES (4, 68);
INSERT INTO `sys_role_permission` VALUES (4, 69);
INSERT INTO `sys_role_permission` VALUES (4, 70);
INSERT INTO `sys_role_permission` VALUES (4, 71);
INSERT INTO `sys_role_permission` VALUES (4, 81);
INSERT INTO `sys_role_permission` VALUES (4, 82);
INSERT INTO `sys_role_permission` VALUES (4, 83);
INSERT INTO `sys_role_permission` VALUES (4, 84);
INSERT INTO `sys_role_permission` VALUES (4, 91);
INSERT INTO `sys_role_permission` VALUES (4, 92);
INSERT INTO `sys_role_permission` VALUES (4, 94);
INSERT INTO `sys_role_permission` VALUES (5, 1);
INSERT INTO `sys_role_permission` VALUES (5, 3);
INSERT INTO `sys_role_permission` VALUES (5, 4);
INSERT INTO `sys_role_permission` VALUES (5, 10);
INSERT INTO `sys_role_permission` VALUES (5, 11);
INSERT INTO `sys_role_permission` VALUES (5, 12);
INSERT INTO `sys_role_permission` VALUES (5, 13);
INSERT INTO `sys_role_permission` VALUES (6, 1);
INSERT INTO `sys_role_permission` VALUES (6, 4);
INSERT INTO `sys_role_permission` VALUES (6, 12);
INSERT INTO `sys_role_permission` VALUES (6, 13);
INSERT INTO `sys_role_permission` VALUES (7, 1);
INSERT INTO `sys_role_permission` VALUES (7, 5);
INSERT INTO `sys_role_permission` VALUES (7, 6);
INSERT INTO `sys_role_permission` VALUES (7, 14);
INSERT INTO `sys_role_permission` VALUES (7, 15);
INSERT INTO `sys_role_permission` VALUES (7, 16);
INSERT INTO `sys_role_permission` VALUES (7, 17);
INSERT INTO `sys_role_permission` VALUES (7, 18);
INSERT INTO `sys_role_permission` VALUES (7, 21);
INSERT INTO `sys_role_permission` VALUES (7, 22);
INSERT INTO `sys_role_permission` VALUES (7, 23);
INSERT INTO `sys_role_permission` VALUES (7, 30);
INSERT INTO `sys_role_permission` VALUES (7, 31);
INSERT INTO `sys_role_permission` VALUES (7, 34);
INSERT INTO `sys_role_permission` VALUES (7, 35);
INSERT INTO `sys_role_permission` VALUES (7, 36);
INSERT INTO `sys_role_permission` VALUES (7, 38);
INSERT INTO `sys_role_permission` VALUES (7, 39);
INSERT INTO `sys_role_permission` VALUES (7, 40);
INSERT INTO `sys_role_permission` VALUES (7, 42);
INSERT INTO `sys_role_permission` VALUES (7, 43);
INSERT INTO `sys_role_permission` VALUES (7, 44);
INSERT INTO `sys_role_permission` VALUES (7, 46);
INSERT INTO `sys_role_permission` VALUES (7, 47);
INSERT INTO `sys_role_permission` VALUES (7, 48);
INSERT INTO `sys_role_permission` VALUES (7, 49);
INSERT INTO `sys_role_permission` VALUES (7, 51);
INSERT INTO `sys_role_permission` VALUES (7, 52);
INSERT INTO `sys_role_permission` VALUES (7, 53);
INSERT INTO `sys_role_permission` VALUES (7, 54);
INSERT INTO `sys_role_permission` VALUES (7, 55);
INSERT INTO `sys_role_permission` VALUES (7, 56);
INSERT INTO `sys_role_permission` VALUES (7, 57);
INSERT INTO `sys_role_permission` VALUES (7, 73);
INSERT INTO `sys_role_permission` VALUES (7, 74);
INSERT INTO `sys_role_permission` VALUES (7, 75);
INSERT INTO `sys_role_permission` VALUES (7, 76);
INSERT INTO `sys_role_permission` VALUES (7, 77);
INSERT INTO `sys_role_permission` VALUES (7, 78);
INSERT INTO `sys_role_permission` VALUES (7, 79);
INSERT INTO `sys_role_permission` VALUES (7, 86);

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user`  (
  `rid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`uid`, `rid`) USING BTREE,
  INDEX `FK_203gdpkwgtow7nxlo2oap5jru`(`rid`) USING BTREE,
  CONSTRAINT `sys_role_user_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `sys_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sys_role_user_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES (1, 2);
INSERT INTO `sys_role_user` VALUES (4, 3);
INSERT INTO `sys_role_user` VALUES (4, 8);
INSERT INTO `sys_role_user` VALUES (5, 4);
INSERT INTO `sys_role_user` VALUES (5, 8);
INSERT INTO `sys_role_user` VALUES (6, 5);
INSERT INTO `sys_role_user` VALUES (6, 8);
INSERT INTO `sys_role_user` VALUES (7, 6);
INSERT INTO `sys_role_user` VALUES (7, 8);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deptid` int(11) NULL DEFAULT NULL,
  `hiredate` datetime(0) NULL DEFAULT NULL,
  `mgr` int(11) NULL DEFAULT NULL,
  `available` int(11) NULL DEFAULT 1,
  `ordernum` int(11) NULL DEFAULT NULL,
  `type` int(255) NULL DEFAULT NULL COMMENT '用户类型[0超级管理员1，管理员，2普通用户]',
  `imgpath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_3rrcpvho2w1mx1sfiuuyir1h`(`deptid`) USING BTREE,
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`deptid`) REFERENCES `sys_dept` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '超级管理员', 'system', '系统深处的男人', 1, '超级管理员', '532ac00e86893901af5f0be6b704dbc7', 1, '2018-06-25 11:06:34', NULL, 1, 1, 0, '../resources/images/defaultusertitle.jpg', '04A93C74C8294AA09A8B974FD1F4ECBB');
INSERT INTO `sys_user` VALUES (2, '李四', 'ls', '武汉', 0, 'KING', 'b07b848d69e0553b80e601d31571797e', 1, '2018-06-25 11:06:36', NULL, 1, 2, 1, '../resources/images/defaultusertitle.jpg', 'FC1EE06AE4354D3FBF7FDD15C8FCDA71');
INSERT INTO `sys_user` VALUES (3, '王五', 'ww', '武汉', 1, '管理员', '3c3f971eae61e097f59d52360323f1c8', 3, '2018-06-25 11:06:38', 2, 1, 3, 1, '../resources/images/defaultusertitle.jpg', '3D5F956E053C4E85B7D2681386E235D2');
INSERT INTO `sys_user` VALUES (4, '赵六', 'zl', '武汉', 1, '程序员', '2e969742a7ea0c7376e9551d578e05dd', 4, '2018-06-25 11:06:40', 3, 1, 4, 1, '../resources/images/defaultusertitle.jpg', '6480EE1391E34B0886ACADA501E31145');
INSERT INTO `sys_user` VALUES (5, '孙七', 'sq', '武汉', 1, '程序员', '47b4c1ad6e4b54dd9387a09cb5a03de1', 2, '2018-06-25 11:06:43', 4, 1, 5, 1, '../resources/images/defaultusertitle.jpg', 'FE3476C3E3674E5690C737C269FCBF8E');
INSERT INTO `sys_user` VALUES (6, '刘八', 'lb', '深圳', 1, '程序员', 'bcee2b05b4b591106829aec69a094806', 4, '2018-08-06 11:21:12', 3, 1, 6, 1, '../resources/images/defaultusertitle.jpg', 'E6CCF54A09894D998225878BBD139B20');
INSERT INTO `sys_user` VALUES (8, '习大大', 'xidada', '北京', 1, '北京', '83c6312d3124527c06f9f32c9f0f4122', 7, '2019-09-25 08:47:38', 3, 1, 7, 1, NULL, '9A77217BD788418683C5D69CDC85B4AA');

SET FOREIGN_KEY_CHECKS = 1;
