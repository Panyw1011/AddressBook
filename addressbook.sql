/*
Navicat MySQL Data Transfer

Source Server         : data
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : addressbook

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2021-10-11 21:00:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for addressbook
-- ----------------------------
DROP TABLE IF EXISTS `addressbook`;
CREATE TABLE `addressbook` (
  `friendId` varchar(50) NOT NULL,
  `friendName` varchar(50) NOT NULL,
  `friendSex` varchar(10) NOT NULL,
  `friendAdd` varchar(255) NOT NULL,
  `friendTel` varchar(50) NOT NULL,
  `friendMail` varchar(100) NOT NULL,
  PRIMARY KEY (`friendId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of addressbook
-- ----------------------------
INSERT INTO `addressbook` VALUES ('1001', '张三', '男', '北京', '123123', '123123@163.com');
INSERT INTO `addressbook` VALUES ('1002', '李四', '女', '上海', '4325', '4325@qq.com');
INSERT INTO `addressbook` VALUES ('1003', '王五', '男', '广州', '234', '234@163.com');
