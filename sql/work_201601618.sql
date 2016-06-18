/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50712
Source Host           : 127.0.0.1:3306
Source Database       : work

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-06-18 10:28:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for acct_authority
-- ----------------------------
DROP TABLE IF EXISTS `acct_authority`;
CREATE TABLE `acct_authority` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of acct_authority
-- ----------------------------

-- ----------------------------
-- Table structure for acct_role
-- ----------------------------
DROP TABLE IF EXISTS `acct_role`;
CREATE TABLE `acct_role` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of acct_role
-- ----------------------------

-- ----------------------------
-- Table structure for acct_role_authority
-- ----------------------------
DROP TABLE IF EXISTS `acct_role_authority`;
CREATE TABLE `acct_role_authority` (
  `role_id` varchar(36) NOT NULL,
  `authority_id` varchar(36) NOT NULL,
  PRIMARY KEY (`role_id`,`authority_id`),
  KEY `fk_role-authority_authority` (`authority_id`),
  CONSTRAINT `fk_role-authority_authority` FOREIGN KEY (`authority_id`) REFERENCES `acct_authority` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_role-authority_role` FOREIGN KEY (`role_id`) REFERENCES `acct_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of acct_role_authority
-- ----------------------------

-- ----------------------------
-- Table structure for acct_user
-- ----------------------------
DROP TABLE IF EXISTS `acct_user`;
CREATE TABLE `acct_user` (
  `id` varchar(36) NOT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `register_time` datetime DEFAULT NULL,
  `nick_password` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of acct_user
-- ----------------------------
INSERT INTO `acct_user` VALUES ('e726ff19-fb80-4107-8a37-095129395568', 'jianye', '13696527039', '2016-06-05 14:49:35', 'e10adc3949ba59abbe56e057f20f883e');

-- ----------------------------
-- Table structure for acct_user_role
-- ----------------------------
DROP TABLE IF EXISTS `acct_user_role`;
CREATE TABLE `acct_user_role` (
  `user_id` varchar(36) NOT NULL,
  `role_id` varchar(36) NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `fk_user-role_user` (`user_id`),
  CONSTRAINT `fk_user-role_role` FOREIGN KEY (`role_id`) REFERENCES `acct_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user-role_user` FOREIGN KEY (`user_id`) REFERENCES `acct_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of acct_user_role
-- ----------------------------
