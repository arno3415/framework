/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : apolloportaldb

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 27/02/2019 14:53:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app
-- ----------------------------
DROP TABLE IF EXISTS `app`;
CREATE TABLE `app`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '应用名',
  `OrgId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '部门Id',
  `OrgName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '部门名字',
  `OwnerName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ownerName',
  `OwnerEmail` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId`(`AppId`(191)) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_Name`(`Name`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app
-- ----------------------------
INSERT INTO `app` VALUES (1, 'SampleApp', 'Sample App', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'1', 'default', '2019-02-27 10:07:17', 'apollo', '2019-02-27 10:37:49');
INSERT INTO `app` VALUES (2, 'wg-framework', 'wg-framework', 'TEST1', '样例部门1', 'arno', 'arno9967@gmail.com', b'1', 'arno', '2019-02-27 10:21:19', 'apollo', '2019-02-27 10:40:33');
INSERT INTO `app` VALUES (3, 'wg-framework', 'wg-framework', 'WG', 'WG', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');

-- ----------------------------
-- Table structure for appnamespace
-- ----------------------------
DROP TABLE IF EXISTS `appnamespace`;
CREATE TABLE `appnamespace`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'namespace名字，注意，需要全局唯一',
  `AppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'app id',
  `Format` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'properties' COMMENT 'namespace的format类型',
  `IsPublic` bit(1) NOT NULL DEFAULT b'0' COMMENT 'namespace是否为公共',
  `Comment` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AppId`(`AppId`) USING BTREE,
  INDEX `Name_AppId`(`Name`, `AppId`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用namespace定义' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appnamespace
-- ----------------------------
INSERT INTO `appnamespace` VALUES (1, 'application', 'SampleApp', 'properties', b'0', 'default app namespace', b'1', '', '2019-02-27 10:07:17', 'apollo', '2019-02-27 10:37:49');
INSERT INTO `appnamespace` VALUES (2, 'application', 'wg-framework', 'properties', b'0', 'default app namespace', b'1', 'arno', '2019-02-27 10:21:19', 'apollo', '2019-02-27 10:40:33');
INSERT INTO `appnamespace` VALUES (3, 'application', 'wg-framework', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `appnamespace` VALUES (13, 'Jdbc', 'wg-framework', 'properties', b'0', '', b'0', 'apollo', '2019-02-27 13:55:29', 'apollo', '2019-02-27 13:55:29');
INSERT INTO `appnamespace` VALUES (14, 'Redis', 'wg-framework', 'properties', b'0', '', b'0', 'apollo', '2019-02-27 14:02:54', 'apollo', '2019-02-27 14:02:54');
INSERT INTO `appnamespace` VALUES (15, 'Swagger', 'wg-framework', 'properties', b'0', '', b'0', 'apollo', '2019-02-27 14:05:36', 'apollo', '2019-02-27 14:05:36');

-- ----------------------------
-- Table structure for authorities
-- ----------------------------
DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Authority` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of authorities
-- ----------------------------
INSERT INTO `authorities` VALUES (1, 'apollo', 'ROLE_user');
INSERT INTO `authorities` VALUES (2, 'arno', 'ROLE_user');

-- ----------------------------
-- Table structure for consumer
-- ----------------------------
DROP TABLE IF EXISTS `consumer`;
CREATE TABLE `consumer`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '应用名',
  `OrgId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '部门Id',
  `OrgName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '部门名字',
  `OwnerName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ownerName',
  `OwnerEmail` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId`(`AppId`(191)) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '开放API消费者' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for consumeraudit
-- ----------------------------
DROP TABLE IF EXISTS `consumeraudit`;
CREATE TABLE `consumeraudit`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) UNSIGNED DEFAULT NULL COMMENT 'Consumer Id',
  `Uri` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '访问的Uri',
  `Method` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '访问的Method',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_ConsumerId`(`ConsumerId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'consumer审计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for consumerrole
-- ----------------------------
DROP TABLE IF EXISTS `consumerrole`;
CREATE TABLE `consumerrole`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) UNSIGNED DEFAULT NULL COMMENT 'Consumer Id',
  `RoleId` int(10) UNSIGNED DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_RoleId`(`RoleId`) USING BTREE,
  INDEX `IX_ConsumerId_RoleId`(`ConsumerId`, `RoleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'consumer和role的绑定表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for consumertoken
-- ----------------------------
DROP TABLE IF EXISTS `consumertoken`;
CREATE TABLE `consumertoken`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) UNSIGNED DEFAULT NULL COMMENT 'ConsumerId',
  `Token` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'token',
  `Expires` datetime(0) NOT NULL DEFAULT '2099-01-01 00:00:00' COMMENT 'token失效时间',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_Token`(`Token`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'consumer token表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `UserId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '收藏的用户',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Position` int(32) NOT NULL DEFAULT 10000 COMMENT '收藏顺序',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId`(`AppId`(191)) USING BTREE,
  INDEX `IX_UserId`(`UserId`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `PermissionType` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '权限类型',
  `TargetId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '权限对象类型',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_TargetId_PermissionType`(`TargetId`(191), `PermissionType`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'permission表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, 'CreateCluster', 'SampleApp', b'1', '', '2019-02-27 10:07:17', 'apollo', '2019-02-27 10:37:50');
INSERT INTO `permission` VALUES (2, 'CreateNamespace', 'SampleApp', b'1', '', '2019-02-27 10:07:17', 'apollo', '2019-02-27 10:37:50');
INSERT INTO `permission` VALUES (3, 'AssignRole', 'SampleApp', b'1', '', '2019-02-27 10:07:17', 'apollo', '2019-02-27 10:37:50');
INSERT INTO `permission` VALUES (4, 'ModifyNamespace', 'SampleApp+application', b'1', '', '2019-02-27 10:07:17', 'apollo', '2019-02-27 10:37:50');
INSERT INTO `permission` VALUES (5, 'ReleaseNamespace', 'SampleApp+application', b'1', '', '2019-02-27 10:07:17', 'apollo', '2019-02-27 10:37:50');
INSERT INTO `permission` VALUES (6, 'CreateNamespace', 'wg-framework', b'1', 'arno', '2019-02-27 10:21:19', 'apollo', '2019-02-27 10:40:33');
INSERT INTO `permission` VALUES (7, 'CreateCluster', 'wg-framework', b'1', 'arno', '2019-02-27 10:21:19', 'apollo', '2019-02-27 10:40:33');
INSERT INTO `permission` VALUES (8, 'AssignRole', 'wg-framework', b'1', 'arno', '2019-02-27 10:21:19', 'apollo', '2019-02-27 10:40:33');
INSERT INTO `permission` VALUES (9, 'ModifyNamespace', 'wg-framework+application', b'1', 'arno', '2019-02-27 10:21:19', 'apollo', '2019-02-27 10:40:33');
INSERT INTO `permission` VALUES (10, 'ReleaseNamespace', 'wg-framework+application', b'1', 'arno', '2019-02-27 10:21:19', 'apollo', '2019-02-27 10:40:33');
INSERT INTO `permission` VALUES (11, 'ModifyNamespace', 'wg-framework+application+DEV', b'1', 'arno', '2019-02-27 10:21:19', 'apollo', '2019-02-27 10:40:33');
INSERT INTO `permission` VALUES (12, 'ReleaseNamespace', 'wg-framework+application+DEV', b'1', 'arno', '2019-02-27 10:21:19', 'apollo', '2019-02-27 10:40:33');
INSERT INTO `permission` VALUES (13, 'CreateCluster', 'wg-framework', b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `permission` VALUES (14, 'CreateNamespace', 'wg-framework', b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `permission` VALUES (15, 'AssignRole', 'wg-framework', b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `permission` VALUES (16, 'ModifyNamespace', 'wg-framework+application', b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `permission` VALUES (17, 'ReleaseNamespace', 'wg-framework+application', b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `permission` VALUES (18, 'ModifyNamespace', 'wg-framework+application+DEV', b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `permission` VALUES (19, 'ReleaseNamespace', 'wg-framework+application+DEV', b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `permission` VALUES (20, 'ModifyNamespace', 'wg-framework+application+PRO', b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `permission` VALUES (21, 'ReleaseNamespace', 'wg-framework+application+PRO', b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `permission` VALUES (22, 'ModifyNamespace', 'wg-framework+druid', b'0', 'apollo', '2019-02-27 10:44:30', 'apollo', '2019-02-27 10:44:30');
INSERT INTO `permission` VALUES (23, 'ReleaseNamespace', 'wg-framework+druid', b'0', 'apollo', '2019-02-27 10:44:30', 'apollo', '2019-02-27 10:44:30');
INSERT INTO `permission` VALUES (24, 'ModifyNamespace', 'wg-framework+druid+DEV', b'0', 'apollo', '2019-02-27 10:44:30', 'apollo', '2019-02-27 10:44:30');
INSERT INTO `permission` VALUES (25, 'ReleaseNamespace', 'wg-framework+druid+DEV', b'0', 'apollo', '2019-02-27 10:44:30', 'apollo', '2019-02-27 10:44:30');
INSERT INTO `permission` VALUES (26, 'ModifyNamespace', 'wg-framework+druid+PRO', b'0', 'apollo', '2019-02-27 10:44:30', 'apollo', '2019-02-27 10:44:30');
INSERT INTO `permission` VALUES (27, 'ReleaseNamespace', 'wg-framework+druid+PRO', b'0', 'apollo', '2019-02-27 10:44:30', 'apollo', '2019-02-27 10:44:30');
INSERT INTO `permission` VALUES (28, 'ModifyNamespace', 'wg-framework+JDBC', b'0', 'apollo', '2019-02-27 10:56:22', 'apollo', '2019-02-27 10:56:22');
INSERT INTO `permission` VALUES (29, 'ReleaseNamespace', 'wg-framework+JDBC', b'0', 'apollo', '2019-02-27 10:56:22', 'apollo', '2019-02-27 10:56:22');
INSERT INTO `permission` VALUES (30, 'ModifyNamespace', 'wg-framework+JDBC+DEV', b'0', 'apollo', '2019-02-27 10:56:22', 'apollo', '2019-02-27 10:56:22');
INSERT INTO `permission` VALUES (31, 'ReleaseNamespace', 'wg-framework+JDBC+DEV', b'0', 'apollo', '2019-02-27 10:56:22', 'apollo', '2019-02-27 10:56:22');
INSERT INTO `permission` VALUES (32, 'ModifyNamespace', 'wg-framework+JDBC+PRO', b'0', 'apollo', '2019-02-27 10:56:22', 'apollo', '2019-02-27 10:56:22');
INSERT INTO `permission` VALUES (33, 'ReleaseNamespace', 'wg-framework+JDBC+PRO', b'0', 'apollo', '2019-02-27 10:56:22', 'apollo', '2019-02-27 10:56:22');
INSERT INTO `permission` VALUES (34, 'ModifyNamespace', 'wg-framework+RE', b'0', 'apollo', '2019-02-27 11:19:39', 'apollo', '2019-02-27 11:19:39');
INSERT INTO `permission` VALUES (35, 'ReleaseNamespace', 'wg-framework+RE', b'0', 'apollo', '2019-02-27 11:19:39', 'apollo', '2019-02-27 11:19:39');
INSERT INTO `permission` VALUES (36, 'ModifyNamespace', 'wg-framework+RE+DEV', b'0', 'apollo', '2019-02-27 11:19:39', 'apollo', '2019-02-27 11:19:39');
INSERT INTO `permission` VALUES (37, 'ReleaseNamespace', 'wg-framework+RE+DEV', b'0', 'apollo', '2019-02-27 11:19:39', 'apollo', '2019-02-27 11:19:39');
INSERT INTO `permission` VALUES (38, 'ModifyNamespace', 'wg-framework+RE+PRO', b'0', 'apollo', '2019-02-27 11:19:39', 'apollo', '2019-02-27 11:19:39');
INSERT INTO `permission` VALUES (39, 'ReleaseNamespace', 'wg-framework+RE+PRO', b'0', 'apollo', '2019-02-27 11:19:39', 'apollo', '2019-02-27 11:19:39');
INSERT INTO `permission` VALUES (40, 'ModifyNamespace', 'wg-framework+Redis', b'0', 'apollo', '2019-02-27 11:19:58', 'apollo', '2019-02-27 11:19:58');
INSERT INTO `permission` VALUES (41, 'ReleaseNamespace', 'wg-framework+Redis', b'0', 'apollo', '2019-02-27 11:19:58', 'apollo', '2019-02-27 11:19:58');
INSERT INTO `permission` VALUES (42, 'ModifyNamespace', 'wg-framework+Redis+DEV', b'0', 'apollo', '2019-02-27 11:19:58', 'apollo', '2019-02-27 11:19:58');
INSERT INTO `permission` VALUES (43, 'ReleaseNamespace', 'wg-framework+Redis+DEV', b'0', 'apollo', '2019-02-27 11:19:58', 'apollo', '2019-02-27 11:19:58');
INSERT INTO `permission` VALUES (44, 'ModifyNamespace', 'wg-framework+Redis+PRO', b'0', 'apollo', '2019-02-27 11:19:58', 'apollo', '2019-02-27 11:19:58');
INSERT INTO `permission` VALUES (45, 'ReleaseNamespace', 'wg-framework+Redis+PRO', b'0', 'apollo', '2019-02-27 11:19:58', 'apollo', '2019-02-27 11:19:58');
INSERT INTO `permission` VALUES (46, 'ModifyNamespace', 'wg-framework+Swagger', b'0', 'apollo', '2019-02-27 11:24:33', 'apollo', '2019-02-27 11:24:33');
INSERT INTO `permission` VALUES (47, 'ReleaseNamespace', 'wg-framework+Swagger', b'0', 'apollo', '2019-02-27 11:24:33', 'apollo', '2019-02-27 11:24:33');
INSERT INTO `permission` VALUES (48, 'ModifyNamespace', 'wg-framework+Swagger+DEV', b'0', 'apollo', '2019-02-27 11:24:33', 'apollo', '2019-02-27 11:24:33');
INSERT INTO `permission` VALUES (49, 'ReleaseNamespace', 'wg-framework+Swagger+DEV', b'0', 'apollo', '2019-02-27 11:24:33', 'apollo', '2019-02-27 11:24:33');
INSERT INTO `permission` VALUES (50, 'ModifyNamespace', 'wg-framework+Swagger+PRO', b'0', 'apollo', '2019-02-27 11:24:33', 'apollo', '2019-02-27 11:24:33');
INSERT INTO `permission` VALUES (51, 'ReleaseNamespace', 'wg-framework+Swagger+PRO', b'0', 'apollo', '2019-02-27 11:24:33', 'apollo', '2019-02-27 11:24:33');
INSERT INTO `permission` VALUES (52, 'ModifyNamespace', 'wg-framework+Jdbc.yml', b'0', 'apollo', '2019-02-27 13:34:28', 'apollo', '2019-02-27 13:34:28');
INSERT INTO `permission` VALUES (53, 'ReleaseNamespace', 'wg-framework+Jdbc.yml', b'0', 'apollo', '2019-02-27 13:34:28', 'apollo', '2019-02-27 13:34:28');
INSERT INTO `permission` VALUES (54, 'ModifyNamespace', 'wg-framework+Jdbc.yml+DEV', b'0', 'apollo', '2019-02-27 13:34:28', 'apollo', '2019-02-27 13:34:28');
INSERT INTO `permission` VALUES (55, 'ReleaseNamespace', 'wg-framework+Jdbc.yml+DEV', b'0', 'apollo', '2019-02-27 13:34:28', 'apollo', '2019-02-27 13:34:28');
INSERT INTO `permission` VALUES (56, 'ModifyNamespace', 'wg-framework+Jdbc.yml+PRO', b'0', 'apollo', '2019-02-27 13:34:28', 'apollo', '2019-02-27 13:34:28');
INSERT INTO `permission` VALUES (57, 'ReleaseNamespace', 'wg-framework+Jdbc.yml+PRO', b'0', 'apollo', '2019-02-27 13:34:28', 'apollo', '2019-02-27 13:34:28');
INSERT INTO `permission` VALUES (58, 'ModifyNamespace', 'wg-framework+Redis.yml', b'0', 'apollo', '2019-02-27 13:36:10', 'apollo', '2019-02-27 13:36:10');
INSERT INTO `permission` VALUES (59, 'ReleaseNamespace', 'wg-framework+Redis.yml', b'0', 'apollo', '2019-02-27 13:36:10', 'apollo', '2019-02-27 13:36:10');
INSERT INTO `permission` VALUES (60, 'ModifyNamespace', 'wg-framework+Redis.yml+DEV', b'0', 'apollo', '2019-02-27 13:36:10', 'apollo', '2019-02-27 13:36:10');
INSERT INTO `permission` VALUES (61, 'ReleaseNamespace', 'wg-framework+Redis.yml+DEV', b'0', 'apollo', '2019-02-27 13:36:10', 'apollo', '2019-02-27 13:36:10');
INSERT INTO `permission` VALUES (62, 'ModifyNamespace', 'wg-framework+Redis.yml+PRO', b'0', 'apollo', '2019-02-27 13:36:10', 'apollo', '2019-02-27 13:36:10');
INSERT INTO `permission` VALUES (63, 'ReleaseNamespace', 'wg-framework+Redis.yml+PRO', b'0', 'apollo', '2019-02-27 13:36:10', 'apollo', '2019-02-27 13:36:10');
INSERT INTO `permission` VALUES (64, 'ModifyNamespace', 'wg-framework+Swagger.yml', b'0', 'apollo', '2019-02-27 13:36:43', 'apollo', '2019-02-27 13:36:43');
INSERT INTO `permission` VALUES (65, 'ReleaseNamespace', 'wg-framework+Swagger.yml', b'0', 'apollo', '2019-02-27 13:36:43', 'apollo', '2019-02-27 13:36:43');
INSERT INTO `permission` VALUES (66, 'ModifyNamespace', 'wg-framework+Swagger.yml+DEV', b'0', 'apollo', '2019-02-27 13:36:43', 'apollo', '2019-02-27 13:36:43');
INSERT INTO `permission` VALUES (67, 'ReleaseNamespace', 'wg-framework+Swagger.yml+DEV', b'0', 'apollo', '2019-02-27 13:36:43', 'apollo', '2019-02-27 13:36:43');
INSERT INTO `permission` VALUES (68, 'ModifyNamespace', 'wg-framework+Swagger.yml+PRO', b'0', 'apollo', '2019-02-27 13:36:43', 'apollo', '2019-02-27 13:36:43');
INSERT INTO `permission` VALUES (69, 'ReleaseNamespace', 'wg-framework+Swagger.yml+PRO', b'0', 'apollo', '2019-02-27 13:36:43', 'apollo', '2019-02-27 13:36:43');
INSERT INTO `permission` VALUES (70, 'ModifyNamespace', 'wg-framework+Abc', b'0', 'apollo', '2019-02-27 13:49:20', 'apollo', '2019-02-27 13:49:20');
INSERT INTO `permission` VALUES (71, 'ReleaseNamespace', 'wg-framework+Abc', b'0', 'apollo', '2019-02-27 13:49:20', 'apollo', '2019-02-27 13:49:20');
INSERT INTO `permission` VALUES (72, 'ModifyNamespace', 'wg-framework+Abc+DEV', b'0', 'apollo', '2019-02-27 13:49:20', 'apollo', '2019-02-27 13:49:20');
INSERT INTO `permission` VALUES (73, 'ReleaseNamespace', 'wg-framework+Abc+DEV', b'0', 'apollo', '2019-02-27 13:49:20', 'apollo', '2019-02-27 13:49:20');
INSERT INTO `permission` VALUES (74, 'ModifyNamespace', 'wg-framework+Abc+PRO', b'0', 'apollo', '2019-02-27 13:49:20', 'apollo', '2019-02-27 13:49:20');
INSERT INTO `permission` VALUES (75, 'ReleaseNamespace', 'wg-framework+Abc+PRO', b'0', 'apollo', '2019-02-27 13:49:20', 'apollo', '2019-02-27 13:49:20');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Role name',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_RoleName`(`RoleName`(191)) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'Master+SampleApp', b'1', 'default', '2019-02-27 10:07:17', 'apollo', '2019-02-27 10:37:50');
INSERT INTO `role` VALUES (2, 'ModifyNamespace+SampleApp+application', b'1', 'default', '2019-02-27 10:07:17', 'apollo', '2019-02-27 10:37:50');
INSERT INTO `role` VALUES (3, 'ReleaseNamespace+SampleApp+application', b'1', 'default', '2019-02-27 10:07:17', 'apollo', '2019-02-27 10:37:50');
INSERT INTO `role` VALUES (4, 'Master+wg-framework', b'1', 'arno', '2019-02-27 10:21:19', 'apollo', '2019-02-27 10:40:33');
INSERT INTO `role` VALUES (5, 'ModifyNamespace+wg-framework+application', b'1', 'arno', '2019-02-27 10:21:19', 'apollo', '2019-02-27 10:40:33');
INSERT INTO `role` VALUES (6, 'ReleaseNamespace+wg-framework+application', b'1', 'arno', '2019-02-27 10:21:19', 'apollo', '2019-02-27 10:40:33');
INSERT INTO `role` VALUES (7, 'ModifyNamespace+wg-framework+application+DEV', b'1', 'arno', '2019-02-27 10:21:19', 'apollo', '2019-02-27 10:40:33');
INSERT INTO `role` VALUES (8, 'ReleaseNamespace+wg-framework+application+DEV', b'1', 'arno', '2019-02-27 10:21:19', 'apollo', '2019-02-27 10:40:33');
INSERT INTO `role` VALUES (9, 'Master+wg-framework', b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `role` VALUES (10, 'ModifyNamespace+wg-framework+application', b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `role` VALUES (11, 'ReleaseNamespace+wg-framework+application', b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `role` VALUES (12, 'ModifyNamespace+wg-framework+application+DEV', b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `role` VALUES (13, 'ReleaseNamespace+wg-framework+application+DEV', b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `role` VALUES (14, 'ModifyNamespace+wg-framework+application+PRO', b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `role` VALUES (15, 'ReleaseNamespace+wg-framework+application+PRO', b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `role` VALUES (16, 'ModifyNamespace+wg-framework+druid', b'0', 'apollo', '2019-02-27 10:44:30', 'apollo', '2019-02-27 10:44:30');
INSERT INTO `role` VALUES (17, 'ReleaseNamespace+wg-framework+druid', b'0', 'apollo', '2019-02-27 10:44:30', 'apollo', '2019-02-27 10:44:30');
INSERT INTO `role` VALUES (18, 'ModifyNamespace+wg-framework+druid+DEV', b'0', 'apollo', '2019-02-27 10:44:30', 'apollo', '2019-02-27 10:44:30');
INSERT INTO `role` VALUES (19, 'ReleaseNamespace+wg-framework+druid+DEV', b'0', 'apollo', '2019-02-27 10:44:30', 'apollo', '2019-02-27 10:44:30');
INSERT INTO `role` VALUES (20, 'ModifyNamespace+wg-framework+druid+PRO', b'0', 'apollo', '2019-02-27 10:44:30', 'apollo', '2019-02-27 10:44:30');
INSERT INTO `role` VALUES (21, 'ReleaseNamespace+wg-framework+druid+PRO', b'0', 'apollo', '2019-02-27 10:44:30', 'apollo', '2019-02-27 10:44:30');
INSERT INTO `role` VALUES (22, 'ModifyNamespace+wg-framework+JDBC', b'0', 'apollo', '2019-02-27 10:56:22', 'apollo', '2019-02-27 10:56:22');
INSERT INTO `role` VALUES (23, 'ReleaseNamespace+wg-framework+JDBC', b'0', 'apollo', '2019-02-27 10:56:22', 'apollo', '2019-02-27 10:56:22');
INSERT INTO `role` VALUES (24, 'ModifyNamespace+wg-framework+JDBC+DEV', b'0', 'apollo', '2019-02-27 10:56:22', 'apollo', '2019-02-27 10:56:22');
INSERT INTO `role` VALUES (25, 'ReleaseNamespace+wg-framework+JDBC+DEV', b'0', 'apollo', '2019-02-27 10:56:22', 'apollo', '2019-02-27 10:56:22');
INSERT INTO `role` VALUES (26, 'ModifyNamespace+wg-framework+JDBC+PRO', b'0', 'apollo', '2019-02-27 10:56:22', 'apollo', '2019-02-27 10:56:22');
INSERT INTO `role` VALUES (27, 'ReleaseNamespace+wg-framework+JDBC+PRO', b'0', 'apollo', '2019-02-27 10:56:22', 'apollo', '2019-02-27 10:56:22');
INSERT INTO `role` VALUES (28, 'ModifyNamespace+wg-framework+RE', b'0', 'apollo', '2019-02-27 11:19:39', 'apollo', '2019-02-27 11:19:39');
INSERT INTO `role` VALUES (29, 'ReleaseNamespace+wg-framework+RE', b'0', 'apollo', '2019-02-27 11:19:39', 'apollo', '2019-02-27 11:19:39');
INSERT INTO `role` VALUES (30, 'ModifyNamespace+wg-framework+RE+DEV', b'0', 'apollo', '2019-02-27 11:19:39', 'apollo', '2019-02-27 11:19:39');
INSERT INTO `role` VALUES (31, 'ReleaseNamespace+wg-framework+RE+DEV', b'0', 'apollo', '2019-02-27 11:19:39', 'apollo', '2019-02-27 11:19:39');
INSERT INTO `role` VALUES (32, 'ModifyNamespace+wg-framework+RE+PRO', b'0', 'apollo', '2019-02-27 11:19:39', 'apollo', '2019-02-27 11:19:39');
INSERT INTO `role` VALUES (33, 'ReleaseNamespace+wg-framework+RE+PRO', b'0', 'apollo', '2019-02-27 11:19:39', 'apollo', '2019-02-27 11:19:39');
INSERT INTO `role` VALUES (34, 'ModifyNamespace+wg-framework+Redis', b'0', 'apollo', '2019-02-27 11:19:58', 'apollo', '2019-02-27 11:19:58');
INSERT INTO `role` VALUES (35, 'ReleaseNamespace+wg-framework+Redis', b'0', 'apollo', '2019-02-27 11:19:58', 'apollo', '2019-02-27 11:19:58');
INSERT INTO `role` VALUES (36, 'ModifyNamespace+wg-framework+Redis+DEV', b'0', 'apollo', '2019-02-27 11:19:58', 'apollo', '2019-02-27 11:19:58');
INSERT INTO `role` VALUES (37, 'ReleaseNamespace+wg-framework+Redis+DEV', b'0', 'apollo', '2019-02-27 11:19:58', 'apollo', '2019-02-27 11:19:58');
INSERT INTO `role` VALUES (38, 'ModifyNamespace+wg-framework+Redis+PRO', b'0', 'apollo', '2019-02-27 11:19:58', 'apollo', '2019-02-27 11:19:58');
INSERT INTO `role` VALUES (39, 'ReleaseNamespace+wg-framework+Redis+PRO', b'0', 'apollo', '2019-02-27 11:19:58', 'apollo', '2019-02-27 11:19:58');
INSERT INTO `role` VALUES (40, 'ModifyNamespace+wg-framework+Swagger', b'0', 'apollo', '2019-02-27 11:24:33', 'apollo', '2019-02-27 11:24:33');
INSERT INTO `role` VALUES (41, 'ReleaseNamespace+wg-framework+Swagger', b'0', 'apollo', '2019-02-27 11:24:33', 'apollo', '2019-02-27 11:24:33');
INSERT INTO `role` VALUES (42, 'ModifyNamespace+wg-framework+Swagger+DEV', b'0', 'apollo', '2019-02-27 11:24:33', 'apollo', '2019-02-27 11:24:33');
INSERT INTO `role` VALUES (43, 'ReleaseNamespace+wg-framework+Swagger+DEV', b'0', 'apollo', '2019-02-27 11:24:33', 'apollo', '2019-02-27 11:24:33');
INSERT INTO `role` VALUES (44, 'ModifyNamespace+wg-framework+Swagger+PRO', b'0', 'apollo', '2019-02-27 11:24:33', 'apollo', '2019-02-27 11:24:33');
INSERT INTO `role` VALUES (45, 'ReleaseNamespace+wg-framework+Swagger+PRO', b'0', 'apollo', '2019-02-27 11:24:33', 'apollo', '2019-02-27 11:24:33');
INSERT INTO `role` VALUES (46, 'ModifyNamespace+wg-framework+Jdbc.yml', b'0', 'apollo', '2019-02-27 13:34:28', 'apollo', '2019-02-27 13:34:28');
INSERT INTO `role` VALUES (47, 'ReleaseNamespace+wg-framework+Jdbc.yml', b'0', 'apollo', '2019-02-27 13:34:28', 'apollo', '2019-02-27 13:34:28');
INSERT INTO `role` VALUES (48, 'ModifyNamespace+wg-framework+Jdbc.yml+DEV', b'0', 'apollo', '2019-02-27 13:34:28', 'apollo', '2019-02-27 13:34:28');
INSERT INTO `role` VALUES (49, 'ReleaseNamespace+wg-framework+Jdbc.yml+DEV', b'0', 'apollo', '2019-02-27 13:34:28', 'apollo', '2019-02-27 13:34:28');
INSERT INTO `role` VALUES (50, 'ModifyNamespace+wg-framework+Jdbc.yml+PRO', b'0', 'apollo', '2019-02-27 13:34:28', 'apollo', '2019-02-27 13:34:28');
INSERT INTO `role` VALUES (51, 'ReleaseNamespace+wg-framework+Jdbc.yml+PRO', b'0', 'apollo', '2019-02-27 13:34:28', 'apollo', '2019-02-27 13:34:28');
INSERT INTO `role` VALUES (52, 'ModifyNamespace+wg-framework+Redis.yml', b'0', 'apollo', '2019-02-27 13:36:10', 'apollo', '2019-02-27 13:36:10');
INSERT INTO `role` VALUES (53, 'ReleaseNamespace+wg-framework+Redis.yml', b'0', 'apollo', '2019-02-27 13:36:10', 'apollo', '2019-02-27 13:36:10');
INSERT INTO `role` VALUES (54, 'ModifyNamespace+wg-framework+Redis.yml+DEV', b'0', 'apollo', '2019-02-27 13:36:10', 'apollo', '2019-02-27 13:36:10');
INSERT INTO `role` VALUES (55, 'ReleaseNamespace+wg-framework+Redis.yml+DEV', b'0', 'apollo', '2019-02-27 13:36:10', 'apollo', '2019-02-27 13:36:10');
INSERT INTO `role` VALUES (56, 'ModifyNamespace+wg-framework+Redis.yml+PRO', b'0', 'apollo', '2019-02-27 13:36:10', 'apollo', '2019-02-27 13:36:10');
INSERT INTO `role` VALUES (57, 'ReleaseNamespace+wg-framework+Redis.yml+PRO', b'0', 'apollo', '2019-02-27 13:36:10', 'apollo', '2019-02-27 13:36:10');
INSERT INTO `role` VALUES (58, 'ModifyNamespace+wg-framework+Swagger.yml', b'0', 'apollo', '2019-02-27 13:36:43', 'apollo', '2019-02-27 13:36:43');
INSERT INTO `role` VALUES (59, 'ReleaseNamespace+wg-framework+Swagger.yml', b'0', 'apollo', '2019-02-27 13:36:43', 'apollo', '2019-02-27 13:36:43');
INSERT INTO `role` VALUES (60, 'ModifyNamespace+wg-framework+Swagger.yml+DEV', b'0', 'apollo', '2019-02-27 13:36:43', 'apollo', '2019-02-27 13:36:43');
INSERT INTO `role` VALUES (61, 'ReleaseNamespace+wg-framework+Swagger.yml+DEV', b'0', 'apollo', '2019-02-27 13:36:43', 'apollo', '2019-02-27 13:36:43');
INSERT INTO `role` VALUES (62, 'ModifyNamespace+wg-framework+Swagger.yml+PRO', b'0', 'apollo', '2019-02-27 13:36:43', 'apollo', '2019-02-27 13:36:43');
INSERT INTO `role` VALUES (63, 'ReleaseNamespace+wg-framework+Swagger.yml+PRO', b'0', 'apollo', '2019-02-27 13:36:43', 'apollo', '2019-02-27 13:36:43');
INSERT INTO `role` VALUES (64, 'ModifyNamespace+wg-framework+Abc', b'0', 'apollo', '2019-02-27 13:49:20', 'apollo', '2019-02-27 13:49:20');
INSERT INTO `role` VALUES (65, 'ReleaseNamespace+wg-framework+Abc', b'0', 'apollo', '2019-02-27 13:49:20', 'apollo', '2019-02-27 13:49:20');
INSERT INTO `role` VALUES (66, 'ModifyNamespace+wg-framework+Abc+DEV', b'0', 'apollo', '2019-02-27 13:49:20', 'apollo', '2019-02-27 13:49:20');
INSERT INTO `role` VALUES (67, 'ReleaseNamespace+wg-framework+Abc+DEV', b'0', 'apollo', '2019-02-27 13:49:20', 'apollo', '2019-02-27 13:49:20');
INSERT INTO `role` VALUES (68, 'ModifyNamespace+wg-framework+Abc+PRO', b'0', 'apollo', '2019-02-27 13:49:20', 'apollo', '2019-02-27 13:49:20');
INSERT INTO `role` VALUES (69, 'ReleaseNamespace+wg-framework+Abc+PRO', b'0', 'apollo', '2019-02-27 13:49:20', 'apollo', '2019-02-27 13:49:20');

-- ----------------------------
-- Table structure for rolepermission
-- ----------------------------
DROP TABLE IF EXISTS `rolepermission`;
CREATE TABLE `rolepermission`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleId` int(10) UNSIGNED DEFAULT NULL COMMENT 'Role Id',
  `PermissionId` int(10) UNSIGNED DEFAULT NULL COMMENT 'Permission Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_RoleId`(`RoleId`) USING BTREE,
  INDEX `IX_PermissionId`(`PermissionId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和权限的绑定表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rolepermission
-- ----------------------------
INSERT INTO `rolepermission` VALUES (1, 1, 1, b'1', '', '2019-02-27 10:07:17', 'apollo', '2019-02-27 10:37:50');
INSERT INTO `rolepermission` VALUES (2, 1, 2, b'1', '', '2019-02-27 10:07:17', 'apollo', '2019-02-27 10:37:50');
INSERT INTO `rolepermission` VALUES (3, 1, 3, b'1', '', '2019-02-27 10:07:17', 'apollo', '2019-02-27 10:37:50');
INSERT INTO `rolepermission` VALUES (4, 2, 4, b'1', '', '2019-02-27 10:07:17', 'apollo', '2019-02-27 10:37:50');
INSERT INTO `rolepermission` VALUES (5, 3, 5, b'1', '', '2019-02-27 10:07:17', 'apollo', '2019-02-27 10:37:50');
INSERT INTO `rolepermission` VALUES (6, 4, 6, b'1', 'arno', '2019-02-27 10:21:19', 'apollo', '2019-02-27 10:40:33');
INSERT INTO `rolepermission` VALUES (7, 4, 7, b'1', 'arno', '2019-02-27 10:21:19', 'apollo', '2019-02-27 10:40:33');
INSERT INTO `rolepermission` VALUES (8, 4, 8, b'1', 'arno', '2019-02-27 10:21:19', 'apollo', '2019-02-27 10:40:33');
INSERT INTO `rolepermission` VALUES (9, 5, 9, b'1', 'arno', '2019-02-27 10:21:19', 'apollo', '2019-02-27 10:40:33');
INSERT INTO `rolepermission` VALUES (10, 6, 10, b'1', 'arno', '2019-02-27 10:21:19', 'apollo', '2019-02-27 10:40:33');
INSERT INTO `rolepermission` VALUES (11, 7, 11, b'1', 'arno', '2019-02-27 10:21:19', 'apollo', '2019-02-27 10:40:33');
INSERT INTO `rolepermission` VALUES (12, 8, 12, b'1', 'arno', '2019-02-27 10:21:19', 'apollo', '2019-02-27 10:40:33');
INSERT INTO `rolepermission` VALUES (13, 9, 13, b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `rolepermission` VALUES (14, 9, 14, b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `rolepermission` VALUES (15, 9, 15, b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `rolepermission` VALUES (16, 10, 16, b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `rolepermission` VALUES (17, 11, 17, b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `rolepermission` VALUES (18, 12, 18, b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `rolepermission` VALUES (19, 13, 19, b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `rolepermission` VALUES (20, 14, 20, b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `rolepermission` VALUES (21, 15, 21, b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `rolepermission` VALUES (22, 16, 22, b'0', 'apollo', '2019-02-27 10:44:30', 'apollo', '2019-02-27 10:44:30');
INSERT INTO `rolepermission` VALUES (23, 17, 23, b'0', 'apollo', '2019-02-27 10:44:30', 'apollo', '2019-02-27 10:44:30');
INSERT INTO `rolepermission` VALUES (24, 18, 24, b'0', 'apollo', '2019-02-27 10:44:30', 'apollo', '2019-02-27 10:44:30');
INSERT INTO `rolepermission` VALUES (25, 19, 25, b'0', 'apollo', '2019-02-27 10:44:30', 'apollo', '2019-02-27 10:44:30');
INSERT INTO `rolepermission` VALUES (26, 20, 26, b'0', 'apollo', '2019-02-27 10:44:30', 'apollo', '2019-02-27 10:44:30');
INSERT INTO `rolepermission` VALUES (27, 21, 27, b'0', 'apollo', '2019-02-27 10:44:30', 'apollo', '2019-02-27 10:44:30');
INSERT INTO `rolepermission` VALUES (28, 22, 28, b'0', 'apollo', '2019-02-27 10:56:22', 'apollo', '2019-02-27 10:56:22');
INSERT INTO `rolepermission` VALUES (29, 23, 29, b'0', 'apollo', '2019-02-27 10:56:22', 'apollo', '2019-02-27 10:56:22');
INSERT INTO `rolepermission` VALUES (30, 24, 30, b'0', 'apollo', '2019-02-27 10:56:22', 'apollo', '2019-02-27 10:56:22');
INSERT INTO `rolepermission` VALUES (31, 25, 31, b'0', 'apollo', '2019-02-27 10:56:22', 'apollo', '2019-02-27 10:56:22');
INSERT INTO `rolepermission` VALUES (32, 26, 32, b'0', 'apollo', '2019-02-27 10:56:22', 'apollo', '2019-02-27 10:56:22');
INSERT INTO `rolepermission` VALUES (33, 27, 33, b'0', 'apollo', '2019-02-27 10:56:22', 'apollo', '2019-02-27 10:56:22');
INSERT INTO `rolepermission` VALUES (34, 28, 34, b'0', 'apollo', '2019-02-27 11:19:39', 'apollo', '2019-02-27 11:19:39');
INSERT INTO `rolepermission` VALUES (35, 29, 35, b'0', 'apollo', '2019-02-27 11:19:39', 'apollo', '2019-02-27 11:19:39');
INSERT INTO `rolepermission` VALUES (36, 30, 36, b'0', 'apollo', '2019-02-27 11:19:39', 'apollo', '2019-02-27 11:19:39');
INSERT INTO `rolepermission` VALUES (37, 31, 37, b'0', 'apollo', '2019-02-27 11:19:39', 'apollo', '2019-02-27 11:19:39');
INSERT INTO `rolepermission` VALUES (38, 32, 38, b'0', 'apollo', '2019-02-27 11:19:39', 'apollo', '2019-02-27 11:19:39');
INSERT INTO `rolepermission` VALUES (39, 33, 39, b'0', 'apollo', '2019-02-27 11:19:39', 'apollo', '2019-02-27 11:19:39');
INSERT INTO `rolepermission` VALUES (40, 34, 40, b'0', 'apollo', '2019-02-27 11:19:58', 'apollo', '2019-02-27 11:19:58');
INSERT INTO `rolepermission` VALUES (41, 35, 41, b'0', 'apollo', '2019-02-27 11:19:58', 'apollo', '2019-02-27 11:19:58');
INSERT INTO `rolepermission` VALUES (42, 36, 42, b'0', 'apollo', '2019-02-27 11:19:58', 'apollo', '2019-02-27 11:19:58');
INSERT INTO `rolepermission` VALUES (43, 37, 43, b'0', 'apollo', '2019-02-27 11:19:58', 'apollo', '2019-02-27 11:19:58');
INSERT INTO `rolepermission` VALUES (44, 38, 44, b'0', 'apollo', '2019-02-27 11:19:58', 'apollo', '2019-02-27 11:19:58');
INSERT INTO `rolepermission` VALUES (45, 39, 45, b'0', 'apollo', '2019-02-27 11:19:58', 'apollo', '2019-02-27 11:19:58');
INSERT INTO `rolepermission` VALUES (46, 40, 46, b'0', 'apollo', '2019-02-27 11:24:33', 'apollo', '2019-02-27 11:24:33');
INSERT INTO `rolepermission` VALUES (47, 41, 47, b'0', 'apollo', '2019-02-27 11:24:33', 'apollo', '2019-02-27 11:24:33');
INSERT INTO `rolepermission` VALUES (48, 42, 48, b'0', 'apollo', '2019-02-27 11:24:33', 'apollo', '2019-02-27 11:24:33');
INSERT INTO `rolepermission` VALUES (49, 43, 49, b'0', 'apollo', '2019-02-27 11:24:33', 'apollo', '2019-02-27 11:24:33');
INSERT INTO `rolepermission` VALUES (50, 44, 50, b'0', 'apollo', '2019-02-27 11:24:33', 'apollo', '2019-02-27 11:24:33');
INSERT INTO `rolepermission` VALUES (51, 45, 51, b'0', 'apollo', '2019-02-27 11:24:33', 'apollo', '2019-02-27 11:24:33');
INSERT INTO `rolepermission` VALUES (52, 46, 52, b'0', 'apollo', '2019-02-27 13:34:28', 'apollo', '2019-02-27 13:34:28');
INSERT INTO `rolepermission` VALUES (53, 47, 53, b'0', 'apollo', '2019-02-27 13:34:28', 'apollo', '2019-02-27 13:34:28');
INSERT INTO `rolepermission` VALUES (54, 48, 54, b'0', 'apollo', '2019-02-27 13:34:28', 'apollo', '2019-02-27 13:34:28');
INSERT INTO `rolepermission` VALUES (55, 49, 55, b'0', 'apollo', '2019-02-27 13:34:28', 'apollo', '2019-02-27 13:34:28');
INSERT INTO `rolepermission` VALUES (56, 50, 56, b'0', 'apollo', '2019-02-27 13:34:28', 'apollo', '2019-02-27 13:34:28');
INSERT INTO `rolepermission` VALUES (57, 51, 57, b'0', 'apollo', '2019-02-27 13:34:28', 'apollo', '2019-02-27 13:34:28');
INSERT INTO `rolepermission` VALUES (58, 52, 58, b'0', 'apollo', '2019-02-27 13:36:10', 'apollo', '2019-02-27 13:36:10');
INSERT INTO `rolepermission` VALUES (59, 53, 59, b'0', 'apollo', '2019-02-27 13:36:10', 'apollo', '2019-02-27 13:36:10');
INSERT INTO `rolepermission` VALUES (60, 54, 60, b'0', 'apollo', '2019-02-27 13:36:10', 'apollo', '2019-02-27 13:36:10');
INSERT INTO `rolepermission` VALUES (61, 55, 61, b'0', 'apollo', '2019-02-27 13:36:10', 'apollo', '2019-02-27 13:36:10');
INSERT INTO `rolepermission` VALUES (62, 56, 62, b'0', 'apollo', '2019-02-27 13:36:10', 'apollo', '2019-02-27 13:36:10');
INSERT INTO `rolepermission` VALUES (63, 57, 63, b'0', 'apollo', '2019-02-27 13:36:10', 'apollo', '2019-02-27 13:36:10');
INSERT INTO `rolepermission` VALUES (64, 58, 64, b'0', 'apollo', '2019-02-27 13:36:43', 'apollo', '2019-02-27 13:36:43');
INSERT INTO `rolepermission` VALUES (65, 59, 65, b'0', 'apollo', '2019-02-27 13:36:43', 'apollo', '2019-02-27 13:36:43');
INSERT INTO `rolepermission` VALUES (66, 60, 66, b'0', 'apollo', '2019-02-27 13:36:43', 'apollo', '2019-02-27 13:36:43');
INSERT INTO `rolepermission` VALUES (67, 61, 67, b'0', 'apollo', '2019-02-27 13:36:43', 'apollo', '2019-02-27 13:36:43');
INSERT INTO `rolepermission` VALUES (68, 62, 68, b'0', 'apollo', '2019-02-27 13:36:43', 'apollo', '2019-02-27 13:36:43');
INSERT INTO `rolepermission` VALUES (69, 63, 69, b'0', 'apollo', '2019-02-27 13:36:43', 'apollo', '2019-02-27 13:36:43');
INSERT INTO `rolepermission` VALUES (70, 64, 70, b'0', 'apollo', '2019-02-27 13:49:20', 'apollo', '2019-02-27 13:49:20');
INSERT INTO `rolepermission` VALUES (71, 65, 71, b'0', 'apollo', '2019-02-27 13:49:20', 'apollo', '2019-02-27 13:49:20');
INSERT INTO `rolepermission` VALUES (72, 66, 72, b'0', 'apollo', '2019-02-27 13:49:20', 'apollo', '2019-02-27 13:49:20');
INSERT INTO `rolepermission` VALUES (73, 67, 73, b'0', 'apollo', '2019-02-27 13:49:20', 'apollo', '2019-02-27 13:49:20');
INSERT INTO `rolepermission` VALUES (74, 68, 74, b'0', 'apollo', '2019-02-27 13:49:20', 'apollo', '2019-02-27 13:49:20');
INSERT INTO `rolepermission` VALUES (75, 69, 75, b'0', 'apollo', '2019-02-27 13:49:20', 'apollo', '2019-02-27 13:49:20');

-- ----------------------------
-- Table structure for serverconfig
-- ----------------------------
DROP TABLE IF EXISTS `serverconfig`;
CREATE TABLE `serverconfig`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Value` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '配置项值',
  `Comment` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_Key`(`Key`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置服务自身配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of serverconfig
-- ----------------------------
INSERT INTO `serverconfig` VALUES (1, 'apollo.portal.envs', 'dev', '可支持的环境列表', b'0', 'default', '2019-02-27 10:07:17', 'apollo', '2019-02-27 13:51:29');
INSERT INTO `serverconfig` VALUES (2, 'organizations', '[{\"orgId\":\"WG\",\"orgName\":\"WG\"}]', '部门列表', b'0', 'default', '2019-02-27 10:07:17', 'apollo', '2019-02-27 10:38:18');
INSERT INTO `serverconfig` VALUES (3, 'superAdmin', 'apollo', 'Portal超级管理员', b'0', 'default', '2019-02-27 10:07:17', '', '2019-02-27 10:07:17');
INSERT INTO `serverconfig` VALUES (4, 'api.readTimeout', '10000', 'http接口read timeout', b'0', 'default', '2019-02-27 10:07:17', '', '2019-02-27 10:07:17');
INSERT INTO `serverconfig` VALUES (5, 'consumer.token.salt', 'someSalt', 'consumer token salt', b'0', 'default', '2019-02-27 10:07:17', '', '2019-02-27 10:07:17');
INSERT INTO `serverconfig` VALUES (6, 'admin.createPrivateNamespace.switch', 'true', '是否允许项目管理员创建私有namespace', b'0', 'default', '2019-02-27 10:07:17', '', '2019-02-27 10:07:17');
INSERT INTO `serverconfig` VALUES (7, 'configView.memberOnly.envs', 'dev', '只对项目成员显示配置信息的环境列表，多个env以英文逗号分隔', b'0', 'default', '2019-02-27 10:07:17', '', '2019-02-27 13:51:32');

-- ----------------------------
-- Table structure for userrole
-- ----------------------------
DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `UserId` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户身份标识',
  `RoleId` int(10) UNSIGNED DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_RoleId`(`RoleId`) USING BTREE,
  INDEX `IX_UserId_RoleId`(`UserId`, `RoleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和role的绑定表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userrole
-- ----------------------------
INSERT INTO `userrole` VALUES (1, 'apollo', 1, b'1', '', '2019-02-27 10:07:17', 'apollo', '2019-02-27 10:37:50');
INSERT INTO `userrole` VALUES (2, 'apollo', 2, b'1', '', '2019-02-27 10:07:17', 'apollo', '2019-02-27 10:37:50');
INSERT INTO `userrole` VALUES (3, 'apollo', 3, b'1', '', '2019-02-27 10:07:17', 'apollo', '2019-02-27 10:37:50');
INSERT INTO `userrole` VALUES (4, 'arno', 4, b'1', 'arno', '2019-02-27 10:21:19', 'apollo', '2019-02-27 10:40:33');
INSERT INTO `userrole` VALUES (5, 'arno', 5, b'1', 'arno', '2019-02-27 10:21:19', 'apollo', '2019-02-27 10:40:33');
INSERT INTO `userrole` VALUES (6, 'arno', 6, b'1', 'arno', '2019-02-27 10:21:19', 'apollo', '2019-02-27 10:40:33');
INSERT INTO `userrole` VALUES (7, 'apollo', 9, b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `userrole` VALUES (8, 'apollo', 10, b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `userrole` VALUES (9, 'apollo', 11, b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `userrole` VALUES (10, 'apollo', 16, b'0', 'apollo', '2019-02-27 10:44:30', 'apollo', '2019-02-27 10:44:30');
INSERT INTO `userrole` VALUES (11, 'apollo', 17, b'0', 'apollo', '2019-02-27 10:44:30', 'apollo', '2019-02-27 10:44:30');
INSERT INTO `userrole` VALUES (12, 'arno', 17, b'1', 'apollo', '2019-02-27 10:44:49', 'apollo', '2019-02-27 10:44:51');
INSERT INTO `userrole` VALUES (13, 'apollo', 22, b'0', 'apollo', '2019-02-27 10:56:22', 'apollo', '2019-02-27 10:56:22');
INSERT INTO `userrole` VALUES (14, 'apollo', 23, b'0', 'apollo', '2019-02-27 10:56:23', 'apollo', '2019-02-27 10:56:23');
INSERT INTO `userrole` VALUES (15, 'apollo', 28, b'0', 'apollo', '2019-02-27 11:19:39', 'apollo', '2019-02-27 11:19:39');
INSERT INTO `userrole` VALUES (16, 'apollo', 29, b'0', 'apollo', '2019-02-27 11:19:40', 'apollo', '2019-02-27 11:19:40');
INSERT INTO `userrole` VALUES (17, 'apollo', 34, b'0', 'apollo', '2019-02-27 11:19:58', 'apollo', '2019-02-27 11:19:58');
INSERT INTO `userrole` VALUES (18, 'apollo', 35, b'0', 'apollo', '2019-02-27 11:19:58', 'apollo', '2019-02-27 11:19:58');
INSERT INTO `userrole` VALUES (19, 'apollo', 40, b'0', 'apollo', '2019-02-27 11:24:33', 'apollo', '2019-02-27 11:24:33');
INSERT INTO `userrole` VALUES (20, 'apollo', 41, b'0', 'apollo', '2019-02-27 11:24:33', 'apollo', '2019-02-27 11:24:33');
INSERT INTO `userrole` VALUES (21, 'apollo', 46, b'0', 'apollo', '2019-02-27 13:34:28', 'apollo', '2019-02-27 13:34:28');
INSERT INTO `userrole` VALUES (22, 'apollo', 47, b'0', 'apollo', '2019-02-27 13:34:28', 'apollo', '2019-02-27 13:34:28');
INSERT INTO `userrole` VALUES (23, 'apollo', 52, b'0', 'apollo', '2019-02-27 13:36:10', 'apollo', '2019-02-27 13:36:10');
INSERT INTO `userrole` VALUES (24, 'apollo', 53, b'0', 'apollo', '2019-02-27 13:36:10', 'apollo', '2019-02-27 13:36:10');
INSERT INTO `userrole` VALUES (25, 'apollo', 58, b'0', 'apollo', '2019-02-27 13:36:43', 'apollo', '2019-02-27 13:36:43');
INSERT INTO `userrole` VALUES (26, 'apollo', 59, b'0', 'apollo', '2019-02-27 13:36:43', 'apollo', '2019-02-27 13:36:43');
INSERT INTO `userrole` VALUES (27, 'apollo', 64, b'0', 'apollo', '2019-02-27 13:49:20', 'apollo', '2019-02-27 13:49:20');
INSERT INTO `userrole` VALUES (28, 'apollo', 65, b'0', 'apollo', '2019-02-27 13:49:20', 'apollo', '2019-02-27 13:49:20');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '用户名',
  `Password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '密码',
  `Email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '邮箱地址',
  `Enabled` tinyint(4) DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'apollo', '$2a$10$7r20uS.BQ9uBpf3Baj3uQOZvMVvB1RN3PYoKE94gtz2.WAOuiiwXS', 'apollo@acme.com', 1);
INSERT INTO `users` VALUES (2, 'arno', '$2a$10$IseCx90lsuUmlyPVyICMd.4JCjGlYhSflO16J8SJm9qVzO0QfbqyK', 'arno9967@gmail.com', 1);

SET FOREIGN_KEY_CHECKS = 1;
