/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : school_card_manager

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 23/06/2020 15:46:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for access_record
-- ----------------------------
DROP TABLE IF EXISTS `access_record`;
CREATE TABLE `access_record`  (
  `studentNum` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `accessTime` datetime(0) NOT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`studentNum`, `accessTime`) USING BTREE,
  CONSTRAINT `access_record_ibfk_1` FOREIGN KEY (`studentNum`) REFERENCES `student` (`num`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of access_record
-- ----------------------------
INSERT INTO `access_record` VALUES ('3182701201', '2020-03-20 14:18:21', '出');
INSERT INTO `access_record` VALUES ('3182701202', '2020-06-20 14:18:21', '入');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `author` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `publish` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `lendCount` int(11) NULL DEFAULT 0,
  `isDelete` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '数据结构与算法', '殷人昆', '清华大学出版社', 10, 0);
INSERT INTO `book` VALUES (2, '数据库设计', '柯玉洁', '人民邮电出版社', 3, 0);
INSERT INTO `book` VALUES (3, '计算机组成原理', '唐朔飞', '高等教育出版社', 0, 1);
INSERT INTO `book` VALUES (4, '软件工程', '李浪', '华中科技大学出版社', 0, 0);
INSERT INTO `book` VALUES (5, '数据结构（C语言）', '陈倩诒', '华中科技大学出版社', 1, 0);
INSERT INTO `book` VALUES (6, '计算机网络', '李浪', '华中科技大学出版社', 0, 0);
INSERT INTO `book` VALUES (7, '网页制作与网站设计', '阳西述', '华中科技大学出版社', 0, 0);
INSERT INTO `book` VALUES (8, '微机系统与接口技术', '熊江', '华中科技大学出版社', 0, 0);
INSERT INTO `book` VALUES (9, '电子商务安全', '唐德权', '华中科技大学出版社', 1, 1);
INSERT INTO `book` VALUES (10, '嵌入式软件开发教程', '李浪', '华中科技大学出版社', 2, 0);
INSERT INTO `book` VALUES (11, '嵌入式系统基础实验教程', '杨凤年', '华中科技大学出版社', 1, 1);
INSERT INTO `book` VALUES (12, '汇编语言及应用教程', '李浪', '华中科技大学出版社', 0, 0);
INSERT INTO `book` VALUES (13, 'C++程序设计教程', '瞿绍军', '华中科技大学出版社', 0, 0);
INSERT INTO `book` VALUES (14, '计算机组成与系统结构', '陈书开', '华中科技大学出版社', 1, 0);
INSERT INTO `book` VALUES (15, '计算机组装与维护', '谭阳', '华中科技大学出版社', 1, 1);
INSERT INTO `book` VALUES (16, '几何原本', '欧几里得', '陕西科技出版社', 0, 0);
INSERT INTO `book` VALUES (17, '物理学的进化', '爱因斯坦', '湖南教育出版社', 0, 1);
INSERT INTO `book` VALUES (18, '科学进化史', '布伦诺斯基', '海南出版社', 0, 0);
INSERT INTO `book` VALUES (20, '247', '247', '247', 0, 1);
INSERT INTO `book` VALUES (21, '软件工程理论与实践', '吕云翔', '人民邮电', 0, 0);
INSERT INTO `book` VALUES (22, '孤独小说家', '唐家三少', '陕西科技出版社', 0, 1);

-- ----------------------------
-- Table structure for cashier
-- ----------------------------
DROP TABLE IF EXISTS `cashier`;
CREATE TABLE `cashier`  (
  `username` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cashier
-- ----------------------------
INSERT INTO `cashier` VALUES ('cashier1', 'cashier1');

-- ----------------------------
-- Table structure for dormitory
-- ----------------------------
DROP TABLE IF EXISTS `dormitory`;
CREATE TABLE `dormitory`  (
  `num` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '宿舍号',
  `water` double NOT NULL COMMENT '水费',
  `electricity` double NOT NULL COMMENT '电费',
  PRIMARY KEY (`num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dormitory
-- ----------------------------
INSERT INTO `dormitory` VALUES ('二区二A209', 650, 850);
INSERT INTO `dormitory` VALUES ('二区二A210', 500, 500);
INSERT INTO `dormitory` VALUES ('二区二A211', 500, 500);
INSERT INTO `dormitory` VALUES ('二区二B201', 500, 550);
INSERT INTO `dormitory` VALUES ('二区二B202', 500, 500);
INSERT INTO `dormitory` VALUES ('二区二B203', 500, 500);
INSERT INTO `dormitory` VALUES ('二区二B204', 650, 600);
INSERT INTO `dormitory` VALUES ('二区二B205', 500, 500);
INSERT INTO `dormitory` VALUES ('二区二B206', 500, 500);
INSERT INTO `dormitory` VALUES ('二区二B207', 511, 870);
INSERT INTO `dormitory` VALUES ('二区二B208', 500, 500);
INSERT INTO `dormitory` VALUES ('二区二B209', 501, 590);
INSERT INTO `dormitory` VALUES ('二区二B210', 500, 500);
INSERT INTO `dormitory` VALUES ('二区二B211', 1100, 1150);

-- ----------------------------
-- Table structure for good
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `price` double NULL DEFAULT NULL COMMENT '价格',
  `businessName` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商家名称',
  `isDelete` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES (1, '甜甜圈', 5, '青园超市', 0);
INSERT INTO `good` VALUES (2, '棒棒糖', 1, '青园超市', 0);
INSERT INTO `good` VALUES (3, '作业本', 2, '青园超市', 0);
INSERT INTO `good` VALUES (4, '洗发露', 20, '青园超市', 0);
INSERT INTO `good` VALUES (5, '沐浴露', 25, '青园超市', 0);
INSERT INTO `good` VALUES (6, '辣条', 1.5, '青园超市', 1);
INSERT INTO `good` VALUES (7, '绿豆饼', 8.5, '青园超市', 1);
INSERT INTO `good` VALUES (8, '红烧牛肉面', 6, '青园超市', 0);
INSERT INTO `good` VALUES (9, '老坛酸菜牛肉面', 5, '青园超市', 0);
INSERT INTO `good` VALUES (10, '金丝猴', 1, '青园超市', 0);
INSERT INTO `good` VALUES (11, '泡面搭档', 1, '青园超市', 0);
INSERT INTO `good` VALUES (12, '玉米香肠', 1.5, '青园超市', 0);
INSERT INTO `good` VALUES (13, '冰红茶', 3.5, '青园超市', 0);
INSERT INTO `good` VALUES (14, '王老吉', 4, '青园超市', 0);
INSERT INTO `good` VALUES (15, '冰糖雪梨', 4, '青园超市', 0);
INSERT INTO `good` VALUES (16, '丽丽薯片', 5.5, '青园超市', 0);
INSERT INTO `good` VALUES (17, '巧克力', 5, '青园超市', 0);
INSERT INTO `good` VALUES (18, '3+2', 5, '青园超市', 1);
INSERT INTO `good` VALUES (19, '加多宝', 3, '青园超市', 0);
INSERT INTO `good` VALUES (20, '软件工程理论与实践', 59.8, '闽江学院', 1);
INSERT INTO `good` VALUES (21, 'Java SE', 10, '青园超市', 0);
INSERT INTO `good` VALUES (31, 'Java SE', 10, '青园超市', 1);

-- ----------------------------
-- Table structure for lend_book_record
-- ----------------------------
DROP TABLE IF EXISTS `lend_book_record`;
CREATE TABLE `lend_book_record`  (
  `studentNum` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `bookId` int(11) NOT NULL,
  `lendTime` datetime(0) NOT NULL,
  `backTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`studentNum`, `bookId`, `lendTime`) USING BTREE,
  INDEX `bookId`(`bookId`) USING BTREE,
  CONSTRAINT `lend_book_record_ibfk_1` FOREIGN KEY (`studentNum`) REFERENCES `student` (`num`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `lend_book_record_ibfk_2` FOREIGN KEY (`bookId`) REFERENCES `book` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lend_book_record
-- ----------------------------
INSERT INTO `lend_book_record` VALUES ('3182701201', 1, '2020-03-20 00:00:00', '2020-03-22 00:00:00');
INSERT INTO `lend_book_record` VALUES ('3182701201', 1, '2020-03-22 00:00:00', '2020-03-23 00:00:00');
INSERT INTO `lend_book_record` VALUES ('3182701201', 1, '2020-05-19 19:53:12', '2020-05-19 19:53:32');
INSERT INTO `lend_book_record` VALUES ('3182701201', 1, '2020-06-23 10:26:46', '2020-06-23 10:27:07');
INSERT INTO `lend_book_record` VALUES ('3182701201', 14, '2020-03-24 00:00:00', '2020-03-24 00:00:00');
INSERT INTO `lend_book_record` VALUES ('3182701202', 1, '2020-04-10 00:00:00', '2020-04-10 00:00:00');
INSERT INTO `lend_book_record` VALUES ('3182701202', 10, '2020-06-23 11:27:08', NULL);
INSERT INTO `lend_book_record` VALUES ('3182701203', 9, '2020-04-10 20:30:14', '2020-04-30 21:57:49');
INSERT INTO `lend_book_record` VALUES ('3182701204', 2, '2020-03-23 00:00:00', '2020-03-24 00:00:00');
INSERT INTO `lend_book_record` VALUES ('3182701204', 2, '2020-03-24 00:00:00', '2020-05-19 19:30:51');
INSERT INTO `lend_book_record` VALUES ('3182701204', 15, '2020-04-30 21:58:54', '2020-05-19 19:35:35');
INSERT INTO `lend_book_record` VALUES ('3182701205', 1, '2020-03-23 00:00:00', '2020-03-24 00:00:00');
INSERT INTO `lend_book_record` VALUES ('3182701205', 1, '2020-04-10 00:00:00', '2020-05-19 19:30:39');
INSERT INTO `lend_book_record` VALUES ('3182701207', 11, '2020-04-14 19:02:22', '2020-04-14 19:03:25');
INSERT INTO `lend_book_record` VALUES ('3182701211', 5, '2020-06-23 11:05:41', '2020-06-23 12:16:43');
INSERT INTO `lend_book_record` VALUES ('3182701222', 1, '2020-06-17 09:48:59', '2020-06-17 09:51:16');
INSERT INTO `lend_book_record` VALUES ('3182701222', 1, '2020-06-23 11:16:56', '2020-06-23 11:41:14');
INSERT INTO `lend_book_record` VALUES ('3182701222', 2, '2020-06-17 09:50:10', '2020-06-17 09:50:23');
INSERT INTO `lend_book_record` VALUES ('3182701230', 10, '2020-06-22 21:29:46', '2020-06-22 21:29:56');

-- ----------------------------
-- Table structure for library_manager
-- ----------------------------
DROP TABLE IF EXISTS `library_manager`;
CREATE TABLE `library_manager`  (
  `username` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of library_manager
-- ----------------------------
INSERT INTO `library_manager` VALUES ('library1', 'library1');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `username` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('admin', 'admin');

-- ----------------------------
-- Table structure for recharge_school_card
-- ----------------------------
DROP TABLE IF EXISTS `recharge_school_card`;
CREATE TABLE `recharge_school_card`  (
  `studentNum` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `rechargeTime` datetime(0) NOT NULL,
  `rechargeMoney` double NULL DEFAULT NULL,
  PRIMARY KEY (`studentNum`, `rechargeTime`) USING BTREE,
  CONSTRAINT `recharge_school_card_ibfk_1` FOREIGN KEY (`studentNum`) REFERENCES `student` (`num`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recharge_school_card
-- ----------------------------
INSERT INTO `recharge_school_card` VALUES ('3182701201', '2020-03-21 15:01:55', 100);
INSERT INTO `recharge_school_card` VALUES ('3182701201', '2020-03-21 15:01:56', 100);
INSERT INTO `recharge_school_card` VALUES ('3182701201', '2020-03-23 14:14:25', 100);
INSERT INTO `recharge_school_card` VALUES ('3182701201', '2020-03-24 17:36:02', 100);
INSERT INTO `recharge_school_card` VALUES ('3182701201', '2020-03-25 13:51:58', 11);
INSERT INTO `recharge_school_card` VALUES ('3182701201', '2020-04-10 13:20:38', 100);
INSERT INTO `recharge_school_card` VALUES ('3182701201', '2020-04-10 19:37:28', 10);
INSERT INTO `recharge_school_card` VALUES ('3182701201', '2020-04-10 20:04:43', 10);
INSERT INTO `recharge_school_card` VALUES ('3182701201', '2020-04-10 20:12:03', 10);
INSERT INTO `recharge_school_card` VALUES ('3182701201', '2020-04-10 20:18:20', 100);
INSERT INTO `recharge_school_card` VALUES ('3182701201', '2020-04-10 20:20:47', 100);
INSERT INTO `recharge_school_card` VALUES ('3182701201', '2020-04-11 14:34:37', 1000);
INSERT INTO `recharge_school_card` VALUES ('3182701201', '2020-04-11 14:39:13', 10);
INSERT INTO `recharge_school_card` VALUES ('3182701201', '2020-04-11 15:08:21', 10);
INSERT INTO `recharge_school_card` VALUES ('3182701201', '2020-04-11 15:09:27', 10);
INSERT INTO `recharge_school_card` VALUES ('3182701201', '2020-04-11 15:24:59', 100);
INSERT INTO `recharge_school_card` VALUES ('3182701201', '2020-04-11 15:31:44', 10);
INSERT INTO `recharge_school_card` VALUES ('3182701201', '2020-04-11 15:34:15', 100);
INSERT INTO `recharge_school_card` VALUES ('3182701201', '2020-04-11 15:38:32', 100);
INSERT INTO `recharge_school_card` VALUES ('3182701201', '2020-04-15 10:36:59', 12);
INSERT INTO `recharge_school_card` VALUES ('3182701201', '2020-04-15 13:05:39', 90);
INSERT INTO `recharge_school_card` VALUES ('3182701201', '2020-04-30 21:53:31', 100);
INSERT INTO `recharge_school_card` VALUES ('3182701201', '2020-06-17 09:32:03', 1000);
INSERT INTO `recharge_school_card` VALUES ('3182701201', '2020-06-23 08:47:13', 100);
INSERT INTO `recharge_school_card` VALUES ('3182701202', '2020-03-21 15:01:56', 200);
INSERT INTO `recharge_school_card` VALUES ('3182701202', '2020-03-23 13:48:09', 200);
INSERT INTO `recharge_school_card` VALUES ('3182701202', '2020-04-11 14:42:42', 100);
INSERT INTO `recharge_school_card` VALUES ('3182701202', '2020-06-22 15:34:07', 10);
INSERT INTO `recharge_school_card` VALUES ('3182701202', '2020-06-23 10:19:14', 100);
INSERT INTO `recharge_school_card` VALUES ('3182701202', '2020-06-23 10:24:30', 30);
INSERT INTO `recharge_school_card` VALUES ('3182701203', '2020-04-11 14:44:38', 100);
INSERT INTO `recharge_school_card` VALUES ('3182701204', '2020-03-23 13:14:28', 120);
INSERT INTO `recharge_school_card` VALUES ('3182701207', '2020-04-14 18:55:18', 50);
INSERT INTO `recharge_school_card` VALUES ('3182701207', '2020-04-14 18:57:54', 50);
INSERT INTO `recharge_school_card` VALUES ('3182701208', '2020-04-15 11:35:25', 100);
INSERT INTO `recharge_school_card` VALUES ('3182701210', '2020-05-01 14:11:15', 1000);
INSERT INTO `recharge_school_card` VALUES ('3182701222', '2020-06-17 10:12:22', 1000);
INSERT INTO `recharge_school_card` VALUES ('3182701230', '2020-06-22 21:25:42', 100);

-- ----------------------------
-- Table structure for recharge_water_electricity
-- ----------------------------
DROP TABLE IF EXISTS `recharge_water_electricity`;
CREATE TABLE `recharge_water_electricity`  (
  `studentNum` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dormitoryNum` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `rechargeTime` datetime(0) NOT NULL,
  `rechargeMoney` double NULL DEFAULT NULL,
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`studentNum`, `dormitoryNum`, `rechargeTime`) USING BTREE,
  INDEX `dormitoryNum`(`dormitoryNum`) USING BTREE,
  CONSTRAINT `recharge_water_electricity_ibfk_1` FOREIGN KEY (`studentNum`) REFERENCES `student` (`num`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `recharge_water_electricity_ibfk_2` FOREIGN KEY (`dormitoryNum`) REFERENCES `dormitory` (`num`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recharge_water_electricity
-- ----------------------------
INSERT INTO `recharge_water_electricity` VALUES ('3182701201', '二区二A209', '2020-03-23 13:42:14', 100, '电费');
INSERT INTO `recharge_water_electricity` VALUES ('3182701201', '二区二A209', '2020-03-24 17:34:58', 150, '水费');
INSERT INTO `recharge_water_electricity` VALUES ('3182701201', '二区二A209', '2020-04-10 20:21:57', 100, '电费');
INSERT INTO `recharge_water_electricity` VALUES ('3182701201', '二区二B201', '2020-03-20 15:11:07', 50, '电费');
INSERT INTO `recharge_water_electricity` VALUES ('3182701201', '二区二B202', '2020-03-20 15:11:07', 50, '电费');
INSERT INTO `recharge_water_electricity` VALUES ('3182701201', '二区二B204', '2020-04-10 13:20:08', 100, '水费');
INSERT INTO `recharge_water_electricity` VALUES ('3182701201', '二区二B204', '2020-06-23 13:27:53', 100, '电费');
INSERT INTO `recharge_water_electricity` VALUES ('3182701201', '二区二B207', '2020-06-17 10:05:25', 20, '电费');
INSERT INTO `recharge_water_electricity` VALUES ('3182701201', '二区二B209', '2020-03-23 10:27:52', 50, '电费');
INSERT INTO `recharge_water_electricity` VALUES ('3182701202', '二区二B209', '2020-06-22 15:52:25', 1, '水费');
INSERT INTO `recharge_water_electricity` VALUES ('3182701202', '二区二B209', '2020-06-23 10:18:26', 10, '电费');
INSERT INTO `recharge_water_electricity` VALUES ('3182701202', '二区二B209', '2020-06-23 10:24:57', 30, '电费');
INSERT INTO `recharge_water_electricity` VALUES ('3182701202', '二区二B211', '2020-03-23 13:46:24', 100, '水费');
INSERT INTO `recharge_water_electricity` VALUES ('3182701204', '二区二B211', '2020-03-23 10:16:23', 100, '电费');
INSERT INTO `recharge_water_electricity` VALUES ('3182701207', '二区二A209', '2020-04-14 18:58:51', 100, '电费');
INSERT INTO `recharge_water_electricity` VALUES ('3182701207', '二区二B207', '2020-03-23 10:10:16', 11, '水费');
INSERT INTO `recharge_water_electricity` VALUES ('3182701207', '二区二B207', '2020-04-14 18:59:25', 100, '电费');
INSERT INTO `recharge_water_electricity` VALUES ('3182701210', '二区二B207', '2020-05-01 14:11:45', 200, '电费');
INSERT INTO `recharge_water_electricity` VALUES ('3182701222', '二区二B204', '2020-06-17 10:13:22', 50, '水费');
INSERT INTO `recharge_water_electricity` VALUES ('3182701230', '二区二B211', '2020-06-22 21:26:53', 50, '电费');

-- ----------------------------
-- Table structure for school_card
-- ----------------------------
DROP TABLE IF EXISTS `school_card`;
CREATE TABLE `school_card`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `balance` double UNSIGNED NULL DEFAULT 0,
  `password` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `startTime` datetime(0) NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of school_card
-- ----------------------------
INSERT INTO `school_card` VALUES (5, 395.5, '123456', '2020-03-20 13:44:37', '可用');
INSERT INTO `school_card` VALUES (6, 485, '123456', '2020-03-20 13:44:37', '可用');
INSERT INTO `school_card` VALUES (8, 600, '123456', '2020-03-20 13:44:37', '可用');
INSERT INTO `school_card` VALUES (9, 0, '123456', '2020-03-20 13:44:37', '挂失');
INSERT INTO `school_card` VALUES (10, 500, '123456', '2020-03-20 13:44:37', '可用');
INSERT INTO `school_card` VALUES (11, 0, '123456', '2020-03-20 13:44:37', '挂失');
INSERT INTO `school_card` VALUES (12, 0, '123456', '2020-03-24 10:03:09', '挂失');
INSERT INTO `school_card` VALUES (13, 1051, '123456', '2020-03-24 12:23:48', '可用');
INSERT INTO `school_card` VALUES (15, 0, '123456', '2020-03-24 14:17:37', '可用');
INSERT INTO `school_card` VALUES (16, 0, '123456', '2020-03-24 14:23:24', '可用');
INSERT INTO `school_card` VALUES (24, 0, '123456', '2020-03-24 17:43:03', '可用');
INSERT INTO `school_card` VALUES (25, 495, '123456', '2020-04-10 10:12:00', '可用');
INSERT INTO `school_card` VALUES (32, 800, '456789', '2020-05-01 14:05:15', '可用');
INSERT INTO `school_card` VALUES (33, 363.5, '123456', '2020-05-01 14:07:31', '可用');
INSERT INTO `school_card` VALUES (34, 3012, '123456', '2020-05-19 19:27:24', '可用');
INSERT INTO `school_card` VALUES (38, 0, '123456', '2020-06-08 17:47:46', '可用');
INSERT INTO `school_card` VALUES (42, 950, '123456', '2020-06-17 10:02:32', '可用');
INSERT INTO `school_card` VALUES (43, 565, '123456', '2020-06-22 15:47:56', '可用');
INSERT INTO `school_card` VALUES (44, 33.5, '456789', '2020-06-22 21:21:41', '可用');
INSERT INTO `school_card` VALUES (45, 0, '123456', '2020-06-22 21:22:41', '可用');
INSERT INTO `school_card` VALUES (46, 0, '123456', '2020-06-22 21:22:41', '可用');
INSERT INTO `school_card` VALUES (47, 0, '123456', '2020-06-22 21:22:41', '可用');
INSERT INTO `school_card` VALUES (48, 0, '123456', '2020-06-22 21:22:41', '可用');
INSERT INTO `school_card` VALUES (49, 0, '123456', '2020-06-22 21:22:41', '可用');
INSERT INTO `school_card` VALUES (50, 0, '123456', '2020-06-22 21:22:41', '可用');
INSERT INTO `school_card` VALUES (51, 0, '123456', '2020-06-22 21:22:41', '可用');
INSERT INTO `school_card` VALUES (52, 0, '123456', '2020-06-22 21:22:41', '可用');
INSERT INTO `school_card` VALUES (54, 0, '123456', '2020-06-23 08:12:51', '可用');
INSERT INTO `school_card` VALUES (55, 0, '123456', '2020-06-23 10:14:29', '可用');
INSERT INTO `school_card` VALUES (56, 0, '123456', '2020-06-23 10:14:29', '可用');
INSERT INTO `school_card` VALUES (57, 0, '123456', '2020-06-23 10:14:29', '可用');
INSERT INTO `school_card` VALUES (58, 0, '123456', '2020-06-23 10:14:29', '可用');
INSERT INTO `school_card` VALUES (59, 0, '123456', '2020-06-23 10:14:29', '可用');
INSERT INTO `school_card` VALUES (60, 0, '123456', '2020-06-23 10:14:29', '可用');
INSERT INTO `school_card` VALUES (61, 0, '123456', '2020-06-23 10:14:29', '可用');
INSERT INTO `school_card` VALUES (62, 0, '123456', '2020-06-23 10:14:29', '可用');
INSERT INTO `school_card` VALUES (63, 0, '123456', '2020-06-23 10:14:29', '可用');
INSERT INTO `school_card` VALUES (64, 0, '123456', '2020-06-23 10:22:21', '可用');
INSERT INTO `school_card` VALUES (66, 0, '123456', '2020-06-23 10:23:32', '可用');
INSERT INTO `school_card` VALUES (67, 0, '123456', '2020-06-23 10:23:32', '可用');
INSERT INTO `school_card` VALUES (68, 0, '123456', '2020-06-23 10:23:32', '可用');
INSERT INTO `school_card` VALUES (69, 0, '123456', '2020-06-23 10:23:32', '可用');
INSERT INTO `school_card` VALUES (71, 0, '123456', '2020-06-23 10:23:32', '可用');
INSERT INTO `school_card` VALUES (72, 0, '123456', '2020-06-23 10:23:32', '可用');
INSERT INTO `school_card` VALUES (73, 0, '123456', '2020-06-23 10:23:32', '可用');
INSERT INTO `school_card` VALUES (74, 0, NULL, '2020-06-23 10:23:32', '可用');

-- ----------------------------
-- Table structure for shopping
-- ----------------------------
DROP TABLE IF EXISTS `shopping`;
CREATE TABLE `shopping`  (
  `studentNum` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `goodId` int(11) NOT NULL,
  `shoppingTime` datetime(0) NOT NULL,
  `shoppingMoney` double NULL DEFAULT NULL,
  `shoppingCount` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`studentNum`, `goodId`, `shoppingTime`) USING BTREE,
  INDEX `goodId`(`goodId`) USING BTREE,
  CONSTRAINT `shopping_ibfk_1` FOREIGN KEY (`studentNum`) REFERENCES `student` (`num`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `shopping_ibfk_2` FOREIGN KEY (`goodId`) REFERENCES `good` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopping
-- ----------------------------
INSERT INTO `shopping` VALUES ('3182701201', 1, '2020-03-20 14:42:39', 25, 5);
INSERT INTO `shopping` VALUES ('3182701201', 1, '2020-06-22 15:50:14', 5, 1);
INSERT INTO `shopping` VALUES ('3182701201', 1, '2020-06-23 10:30:10', 5, 1);
INSERT INTO `shopping` VALUES ('3182701201', 4, '2020-03-22 14:01:19', 40, 2);
INSERT INTO `shopping` VALUES ('3182701201', 6, '2020-03-23 10:31:20', 13.5, 9);
INSERT INTO `shopping` VALUES ('3182701201', 6, '2020-03-23 10:51:18', 1.5, 1);
INSERT INTO `shopping` VALUES ('3182701202', 2, '2020-04-10 11:51:09', 2, 2);
INSERT INTO `shopping` VALUES ('3182701202', 2, '2020-06-22 15:34:47', 1, 1);
INSERT INTO `shopping` VALUES ('3182701202', 4, '2020-03-20 14:42:39', 20, 1);
INSERT INTO `shopping` VALUES ('3182701202', 11, '2020-06-23 12:23:02', 11, 11);
INSERT INTO `shopping` VALUES ('3182701203', 4, '2020-06-17 09:55:51', 20, 1);
INSERT INTO `shopping` VALUES ('3182701203', 8, '2020-04-10 08:51:24', 18, 3);
INSERT INTO `shopping` VALUES ('3182701203', 16, '2020-03-27 16:56:44', 11, 2);
INSERT INTO `shopping` VALUES ('3182701204', 4, '2020-03-22 18:02:32', 20, 1);
INSERT INTO `shopping` VALUES ('3182701204', 17, '2020-04-30 21:56:28', 5, 1);
INSERT INTO `shopping` VALUES ('3182701205', 1, '2020-03-24 16:21:45', 15, 3);
INSERT INTO `shopping` VALUES ('3182701205', 4, '2020-04-10 20:27:26', 80, 4);
INSERT INTO `shopping` VALUES ('3182701205', 6, '2020-03-24 17:46:19', 1.5, 1);
INSERT INTO `shopping` VALUES ('3182701205', 10, '2020-03-24 15:13:41', 5, 5);
INSERT INTO `shopping` VALUES ('3182701205', 12, '2020-03-24 15:15:01', 3, 2);
INSERT INTO `shopping` VALUES ('3182701206', 1, '2020-03-24 16:22:11', 15, 3);
INSERT INTO `shopping` VALUES ('3182701207', 7, '2020-04-14 19:00:51', 25.5, 3);
INSERT INTO `shopping` VALUES ('3182701230', 16, '2020-06-22 21:27:53', 16.5, 3);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `num` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `schoolCardId` int(11) NULL DEFAULT NULL,
  `phoneNumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dormitoryNum` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `department` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`num`) USING BTREE,
  INDEX `dormitoryNum`(`dormitoryNum`) USING BTREE,
  INDEX `schoolCardId`(`schoolCardId`) USING BTREE,
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`dormitoryNum`) REFERENCES `dormitory` (`num`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_ibfk_3` FOREIGN KEY (`schoolCardId`) REFERENCES `school_card` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('3102701202', '陈1', 64, '18850145414', '二区二B209', '计算机系');
INSERT INTO `student` VALUES ('3102701232', '张三', 57, '12345678930', '二区二B203', '计算机系');
INSERT INTO `student` VALUES ('3102701233', '张三', 58, '12345678931', '二区二B204', '计算机系');
INSERT INTO `student` VALUES ('3102701234', '张三', 59, '12345678930', '二区二B205', '计算机系');
INSERT INTO `student` VALUES ('3102701235', '张三', 60, '12345678931', '二区二B206', '计算机系');
INSERT INTO `student` VALUES ('3102701236', '张三', 61, '12345678930', '二区二B207', '计算机系');
INSERT INTO `student` VALUES ('3102701237', '张三', 62, '12345678931', '二区二B208', '计算机系');
INSERT INTO `student` VALUES ('3102701238', '张三', 63, '12345678930', '二区二B209', '计算机系');
INSERT INTO `student` VALUES ('3102703127', '张三', 56, '12345678931', '二区二B202', '计算机系');
INSERT INTO `student` VALUES ('3122701232', '张三', 67, '12345678930', '二区二B203', '计算机系');
INSERT INTO `student` VALUES ('3122701233', '张三', 68, '12345678931', '二区二B204', '计算机系');
INSERT INTO `student` VALUES ('3122701234', '张三', 69, '12345678930', '二区二B205', '计算机系');
INSERT INTO `student` VALUES ('3122701236', '张三', 71, '12345678930', '二区二B207', '计算机系');
INSERT INTO `student` VALUES ('3122701237', '张三', 72, '12345678931', '二区二B208', '计算机系');
INSERT INTO `student` VALUES ('3122701238', '张三', 73, '12345678930', '二区二B209', '计算机系');
INSERT INTO `student` VALUES ('3122703127', '张三', 66, '12345678931', '二区二B202', '计算机系');
INSERT INTO `student` VALUES ('3182701201', '张三', 34, '12345678910', '二区二A209', '计算机系');
INSERT INTO `student` VALUES ('3182701202', '李四', 43, '12345678911', '二区二B209', '数学系');
INSERT INTO `student` VALUES ('3182701203', '王五', 13, '12345678912', '二区二B209', '数学系');
INSERT INTO `student` VALUES ('3182701204', '赵六', 25, '12345678913', '二区二B209', '数学系');
INSERT INTO `student` VALUES ('3182701205', '小明', 5, '12345678914', '二区二B206', '化学系');
INSERT INTO `student` VALUES ('3182701206', '小鸿', 6, '12345678915', '二区二B206', '化学系');
INSERT INTO `student` VALUES ('3182701207', '小刚', 33, '12345678916', '二区二B207', '计算机系');
INSERT INTO `student` VALUES ('3182701208', '小华', 8, '12345678917', '二区二B208', '医学系');
INSERT INTO `student` VALUES ('3182701209', '小李', 9, '12345678918', '二区二B208', '医学系');
INSERT INTO `student` VALUES ('3182701210', '李华', 32, '12345678919', '二区二B207', '数学系');
INSERT INTO `student` VALUES ('3182701211', '小王', 15, '12345678920', '二区二B202', '中文系');
INSERT INTO `student` VALUES ('3182701212', '小李', 16, '12345678921', '二区二B203', '计算机系');
INSERT INTO `student` VALUES ('3182701213', '晓明', 54, '12345678922', '二区二B207', '计算机系');
INSERT INTO `student` VALUES ('3182701215', '张二', 24, '12345678925', '二区二A209', '计算机系');
INSERT INTO `student` VALUES ('3182701222', '老张', 42, '12345678923', '二区二B207', '计算机系');
INSERT INTO `student` VALUES ('3182701230', '张三', 44, '12345678930', '二区二B211', '计算机系');
INSERT INTO `student` VALUES ('3182701231', '张三', 45, '12345678931', '二区二B202', '计算机系');
INSERT INTO `student` VALUES ('3182701232', '张三', 46, '12345678930', '二区二B203', '计算机系');
INSERT INTO `student` VALUES ('3182701233', '张三', 47, '12345678931', '二区二B204', '计算机系');
INSERT INTO `student` VALUES ('3182701234', '张三', 48, '12345678930', '二区二B205', '计算机系');
INSERT INTO `student` VALUES ('3182701235', '张三', 49, '12345678931', '二区二B206', '计算机系');
INSERT INTO `student` VALUES ('3182701236', '张三', 50, '12345678930', '二区二B207', '计算机系');
INSERT INTO `student` VALUES ('3182701237', '张三', 51, '12345678931', '二区二B208', '计算机系');
INSERT INTO `student` VALUES ('3182701238', '张三', 52, '12345678930', '二区二B209', '计算机系');
INSERT INTO `student` VALUES ('3182701250', '张三', 55, '12345678930', '二区二B201', '计算机系');
INSERT INTO `student` VALUES ('3182703127', '张', 38, '12345678955', '二区二B207', '计算机系');

-- ----------------------------
-- View structure for login
-- ----------------------------
DROP VIEW IF EXISTS `login`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `login` AS select `student`.`num` AS `username`,`school_card`.`password` AS `password`,'学生' AS `type` from (`student` join `school_card` on((`student`.`schoolCardId` = `school_card`.`id`))) union select `manager`.`username` AS `username`,`manager`.`password` AS `password`,'管理员' AS `管理员` from `manager` union select `library_manager`.`username` AS `username`,`library_manager`.`password` AS `password`,'图书馆管理员' AS `图书馆管理员` from `library_manager` union select `cashier`.`username` AS `username`,`cashier`.`password` AS `password`,'收银员' AS `收银员` from `cashier`;

-- ----------------------------
-- Triggers structure for table lend_book_record
-- ----------------------------
DROP TRIGGER IF EXISTS `tri5`;
delimiter ;;
CREATE TRIGGER `tri5` AFTER INSERT ON `lend_book_record` FOR EACH ROW begin
update book set lendCount = lendCount + 1 where id = new.bookId;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table recharge_school_card
-- ----------------------------
DROP TRIGGER IF EXISTS `tri2`;
delimiter ;;
CREATE TRIGGER `tri2` AFTER INSERT ON `recharge_school_card` FOR EACH ROW begin
update school_card
set balance = balance + new.rechargeMoney 
where id in (select schoolCardId from student where num = new.studentNum);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table recharge_water_electricity
-- ----------------------------
DROP TRIGGER IF EXISTS `tri3`;
delimiter ;;
CREATE TRIGGER `tri3` AFTER INSERT ON `recharge_water_electricity` FOR EACH ROW begin
update school_card 
set balance = balance - new.rechargeMoney 
where id in (select schoolCardId from student where num = new.studentNum);
if new.type = '水费' then
update dormitory
set water = water + new.rechargeMoney
where num = new.dormitoryNum;
else
update dormitory
set electricity = electricity + new.rechargeMoney
where num = new.dormitoryNum;
end if;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table shopping
-- ----------------------------
DROP TRIGGER IF EXISTS `tri1`;
delimiter ;;
CREATE TRIGGER `tri1` BEFORE INSERT ON `shopping` FOR EACH ROW begin
set new.shoppingMoney = new.shoppingCount * (select price from good where id = new.goodId);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table shopping
-- ----------------------------
DROP TRIGGER IF EXISTS `tri4`;
delimiter ;;
CREATE TRIGGER `tri4` AFTER INSERT ON `shopping` FOR EACH ROW begin
update school_card
set balance = balance - new.shoppingMoney
where id in (select schoolCardId from student where num = new.studentNum);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table student
-- ----------------------------
DROP TRIGGER IF EXISTS `tri9`;
delimiter ;;
CREATE TRIGGER `tri9` BEFORE DELETE ON `student` FOR EACH ROW begin
delete from lend_book_record where studentNum = old.num;
delete from shopping where studentNum = old.num;
delete from recharge_school_card where studentNum = old.num;
delete from recharge_water_electricity where studentNum = old.num;
delete from access_record where studentNum = old.num;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table student
-- ----------------------------
DROP TRIGGER IF EXISTS `tri7`;
delimiter ;;
CREATE TRIGGER `tri7` BEFORE UPDATE ON `student` FOR EACH ROW begin
insert into school_card(balance, startTime, `status`) values(0, now(), "可用");
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table student
-- ----------------------------
DROP TRIGGER IF EXISTS `tri8`;
delimiter ;;
CREATE TRIGGER `tri8` AFTER DELETE ON `student` FOR EACH ROW begin
delete from school_card where id = old.schoolCardId;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table student
-- ----------------------------
DROP TRIGGER IF EXISTS `tri6`;
delimiter ;;
CREATE TRIGGER `tri6` AFTER UPDATE ON `student` FOR EACH ROW begin
declare b double;set b = (select balance from school_card where id = old.schoolCardId);
if b is not null then
update school_card set balance = balance + b where id = new.schoolCardId;
end if;
update school_card set balance = 0 where id = old.schoolCardId;
delete from school_card where id = old.schoolCardId;
update school_card set startTime = now() where id = new.schoolCardId;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
