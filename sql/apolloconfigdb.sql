/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : apolloconfigdb

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 27/02/2019 14:53:21
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
INSERT INTO `app` VALUES (1, 'SampleApp', 'Sample App', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'1', 'default', '2019-02-27 10:07:03', 'apollo', '2019-02-27 10:37:51');
INSERT INTO `app` VALUES (2, 'wg-framework', 'wg-framework', 'TEST1', '样例部门1', 'arno', 'arno9967@gmail.com', b'1', 'arno', '2019-02-27 10:21:19', 'apollo', '2019-02-27 10:40:34');
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
INSERT INTO `appnamespace` VALUES (1, 'application', 'SampleApp', 'properties', b'0', 'default app namespace', b'1', '', '2019-02-27 10:07:03', 'apollo', '2019-02-27 10:37:50');
INSERT INTO `appnamespace` VALUES (2, 'application', 'wg-framework', 'properties', b'0', 'default app namespace', b'1', 'arno', '2019-02-27 10:21:19', 'apollo', '2019-02-27 10:40:33');
INSERT INTO `appnamespace` VALUES (3, 'application', 'wg-framework', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `appnamespace` VALUES (13, 'Jdbc', 'wg-framework', 'properties', b'0', '', b'0', 'apollo', '2019-02-27 13:55:29', 'apollo', '2019-02-27 13:55:29');
INSERT INTO `appnamespace` VALUES (14, 'Redis', 'wg-framework', 'properties', b'0', '', b'0', 'apollo', '2019-02-27 14:02:54', 'apollo', '2019-02-27 14:02:54');
INSERT INTO `appnamespace` VALUES (15, 'Swagger', 'wg-framework', 'properties', b'0', '', b'0', 'apollo', '2019-02-27 14:05:36', 'apollo', '2019-02-27 14:05:36');

-- ----------------------------
-- Table structure for audit
-- ----------------------------
DROP TABLE IF EXISTS `audit`;
CREATE TABLE `audit`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `EntityName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '表名',
  `EntityId` int(10) UNSIGNED DEFAULT NULL COMMENT '记录ID',
  `OpName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '操作类型',
  `Comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 171 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日志审计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of audit
-- ----------------------------
INSERT INTO `audit` VALUES (1, 'Item', 1, 'DELETE', NULL, b'0', 'apollo', '2019-02-27 10:14:15', NULL, '2019-02-27 10:14:15');
INSERT INTO `audit` VALUES (2, 'App', 2, 'INSERT', NULL, b'0', 'arno', '2019-02-27 10:21:19', NULL, '2019-02-27 10:21:19');
INSERT INTO `audit` VALUES (3, 'AppNamespace', 2, 'INSERT', NULL, b'0', 'arno', '2019-02-27 10:21:19', NULL, '2019-02-27 10:21:19');
INSERT INTO `audit` VALUES (4, 'Cluster', 2, 'INSERT', NULL, b'0', 'arno', '2019-02-27 10:21:20', NULL, '2019-02-27 10:21:20');
INSERT INTO `audit` VALUES (5, 'Namespace', 2, 'INSERT', NULL, b'0', 'arno', '2019-02-27 10:21:20', NULL, '2019-02-27 10:21:20');
INSERT INTO `audit` VALUES (6, 'Item', 2, 'INSERT', NULL, b'0', 'arno', '2019-02-27 10:24:42', NULL, '2019-02-27 10:24:42');
INSERT INTO `audit` VALUES (7, 'Namespace', 1, 'DELETE', NULL, b'0', 'apollo', '2019-02-27 10:37:16', NULL, '2019-02-27 10:37:16');
INSERT INTO `audit` VALUES (8, 'Cluster', 1, 'DELETE', NULL, b'0', 'apollo', '2019-02-27 10:37:51', NULL, '2019-02-27 10:37:51');
INSERT INTO `audit` VALUES (9, 'App', 1, 'DELETE', NULL, b'0', 'apollo', '2019-02-27 10:37:51', NULL, '2019-02-27 10:37:51');
INSERT INTO `audit` VALUES (10, 'Namespace', 2, 'DELETE', NULL, b'0', 'apollo', '2019-02-27 10:40:34', NULL, '2019-02-27 10:40:34');
INSERT INTO `audit` VALUES (11, 'Cluster', 2, 'DELETE', NULL, b'0', 'apollo', '2019-02-27 10:40:34', NULL, '2019-02-27 10:40:34');
INSERT INTO `audit` VALUES (12, 'App', 2, 'DELETE', NULL, b'0', 'apollo', '2019-02-27 10:40:34', NULL, '2019-02-27 10:40:34');
INSERT INTO `audit` VALUES (13, 'App', 3, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 10:40:39', NULL, '2019-02-27 10:40:39');
INSERT INTO `audit` VALUES (14, 'AppNamespace', 3, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 10:40:39', NULL, '2019-02-27 10:40:39');
INSERT INTO `audit` VALUES (15, 'Cluster', 3, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 10:40:39', NULL, '2019-02-27 10:40:39');
INSERT INTO `audit` VALUES (16, 'Namespace', 3, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 10:40:39', NULL, '2019-02-27 10:40:39');
INSERT INTO `audit` VALUES (17, 'Namespace', 4, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 10:44:31', NULL, '2019-02-27 10:44:31');
INSERT INTO `audit` VALUES (18, 'AppNamespace', 4, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 10:44:31', NULL, '2019-02-27 10:44:31');
INSERT INTO `audit` VALUES (19, 'Cluster', 4, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 10:54:39', NULL, '2019-02-27 10:54:39');
INSERT INTO `audit` VALUES (20, 'Namespace', 5, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 10:54:39', NULL, '2019-02-27 10:54:39');
INSERT INTO `audit` VALUES (21, 'Namespace', 6, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 10:54:39', NULL, '2019-02-27 10:54:39');
INSERT INTO `audit` VALUES (22, 'Namespace', 4, 'DELETE', NULL, b'0', 'apollo', '2019-02-27 10:55:03', NULL, '2019-02-27 10:55:03');
INSERT INTO `audit` VALUES (23, 'Namespace', 6, 'DELETE', NULL, b'0', 'apollo', '2019-02-27 10:55:10', NULL, '2019-02-27 10:55:10');
INSERT INTO `audit` VALUES (24, 'Namespace', 7, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 10:56:23', NULL, '2019-02-27 10:56:23');
INSERT INTO `audit` VALUES (25, 'Namespace', 8, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 10:56:23', NULL, '2019-02-27 10:56:23');
INSERT INTO `audit` VALUES (26, 'AppNamespace', 5, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 10:56:23', NULL, '2019-02-27 10:56:23');
INSERT INTO `audit` VALUES (27, 'Namespace', 3, 'DELETE', NULL, b'0', 'apollo', '2019-02-27 10:57:01', NULL, '2019-02-27 10:57:01');
INSERT INTO `audit` VALUES (28, 'Namespace', 5, 'DELETE', NULL, b'0', 'apollo', '2019-02-27 10:57:12', NULL, '2019-02-27 10:57:12');
INSERT INTO `audit` VALUES (29, 'Item', 3, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 10:57:48', NULL, '2019-02-27 10:57:48');
INSERT INTO `audit` VALUES (30, 'Item', 4, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 10:57:48', NULL, '2019-02-27 10:57:48');
INSERT INTO `audit` VALUES (31, 'Item', 5, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 10:58:16', NULL, '2019-02-27 10:58:16');
INSERT INTO `audit` VALUES (32, 'Item', 6, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 10:58:16', NULL, '2019-02-27 10:58:16');
INSERT INTO `audit` VALUES (33, 'Item', 7, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 10:58:54', NULL, '2019-02-27 10:58:54');
INSERT INTO `audit` VALUES (34, 'Item', 8, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 10:58:54', NULL, '2019-02-27 10:58:54');
INSERT INTO `audit` VALUES (35, 'Item', 9, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 10:59:26', NULL, '2019-02-27 10:59:26');
INSERT INTO `audit` VALUES (36, 'Item', 10, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 10:59:26', NULL, '2019-02-27 10:59:26');
INSERT INTO `audit` VALUES (37, 'Item', 11, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:00:58', NULL, '2019-02-27 11:00:58');
INSERT INTO `audit` VALUES (38, 'Item', 12, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:00:58', NULL, '2019-02-27 11:00:58');
INSERT INTO `audit` VALUES (39, 'Item', 13, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:01:27', NULL, '2019-02-27 11:01:27');
INSERT INTO `audit` VALUES (40, 'Item', 14, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:01:27', NULL, '2019-02-27 11:01:27');
INSERT INTO `audit` VALUES (41, 'Item', 15, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:02:06', NULL, '2019-02-27 11:02:06');
INSERT INTO `audit` VALUES (42, 'Item', 16, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:02:06', NULL, '2019-02-27 11:02:06');
INSERT INTO `audit` VALUES (43, 'Item', 17, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:02:44', NULL, '2019-02-27 11:02:44');
INSERT INTO `audit` VALUES (44, 'Item', 18, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:02:44', NULL, '2019-02-27 11:02:44');
INSERT INTO `audit` VALUES (45, 'Item', 19, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:03:37', NULL, '2019-02-27 11:03:37');
INSERT INTO `audit` VALUES (46, 'Item', 20, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:03:37', NULL, '2019-02-27 11:03:37');
INSERT INTO `audit` VALUES (47, 'Item', 21, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:07:22', NULL, '2019-02-27 11:07:22');
INSERT INTO `audit` VALUES (48, 'Item', 22, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:07:22', NULL, '2019-02-27 11:07:22');
INSERT INTO `audit` VALUES (49, 'Item', 23, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:08:48', NULL, '2019-02-27 11:08:48');
INSERT INTO `audit` VALUES (50, 'Item', 24, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:08:48', NULL, '2019-02-27 11:08:48');
INSERT INTO `audit` VALUES (51, 'Item', 26, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:09:12', NULL, '2019-02-27 11:09:12');
INSERT INTO `audit` VALUES (52, 'Item', 25, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:09:12', NULL, '2019-02-27 11:09:12');
INSERT INTO `audit` VALUES (53, 'Item', 27, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:09:51', NULL, '2019-02-27 11:09:51');
INSERT INTO `audit` VALUES (54, 'Item', 28, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:09:51', NULL, '2019-02-27 11:09:51');
INSERT INTO `audit` VALUES (55, 'Item', 25, 'UPDATE', NULL, b'0', 'apollo', '2019-02-27 11:10:06', NULL, '2019-02-27 11:10:06');
INSERT INTO `audit` VALUES (56, 'Item', 27, 'UPDATE', NULL, b'0', 'apollo', '2019-02-27 11:10:09', NULL, '2019-02-27 11:10:09');
INSERT INTO `audit` VALUES (57, 'Item', 29, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:10:37', NULL, '2019-02-27 11:10:37');
INSERT INTO `audit` VALUES (58, 'Item', 30, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:10:37', NULL, '2019-02-27 11:10:37');
INSERT INTO `audit` VALUES (59, 'Item', 31, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:11:03', NULL, '2019-02-27 11:11:03');
INSERT INTO `audit` VALUES (60, 'Item', 32, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:11:03', NULL, '2019-02-27 11:11:03');
INSERT INTO `audit` VALUES (61, 'Item', 33, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:11:24', NULL, '2019-02-27 11:11:24');
INSERT INTO `audit` VALUES (62, 'Item', 34, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:11:24', NULL, '2019-02-27 11:11:24');
INSERT INTO `audit` VALUES (63, 'Item', 35, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:11:45', NULL, '2019-02-27 11:11:45');
INSERT INTO `audit` VALUES (64, 'Item', 36, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:11:45', NULL, '2019-02-27 11:11:45');
INSERT INTO `audit` VALUES (65, 'Item', 25, 'DELETE', NULL, b'0', 'apollo', '2019-02-27 11:12:55', NULL, '2019-02-27 11:12:55');
INSERT INTO `audit` VALUES (66, 'Item', 37, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:13:15', NULL, '2019-02-27 11:13:15');
INSERT INTO `audit` VALUES (67, 'Item', 38, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:13:15', NULL, '2019-02-27 11:13:15');
INSERT INTO `audit` VALUES (68, 'Item', 39, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:14:05', NULL, '2019-02-27 11:14:05');
INSERT INTO `audit` VALUES (69, 'Item', 40, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:14:05', NULL, '2019-02-27 11:14:05');
INSERT INTO `audit` VALUES (70, 'Item', 39, 'UPDATE', NULL, b'0', 'apollo', '2019-02-27 11:14:15', NULL, '2019-02-27 11:14:15');
INSERT INTO `audit` VALUES (71, 'Namespace', 9, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:14:56', NULL, '2019-02-27 11:14:56');
INSERT INTO `audit` VALUES (72, 'Namespace', 10, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:14:56', NULL, '2019-02-27 11:14:56');
INSERT INTO `audit` VALUES (73, 'Item', 8, 'UPDATE', NULL, b'0', 'apollo', '2019-02-27 11:15:53', NULL, '2019-02-27 11:15:53');
INSERT INTO `audit` VALUES (74, 'Item', 41, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:16:41', NULL, '2019-02-27 11:16:41');
INSERT INTO `audit` VALUES (75, 'Item', 42, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:16:41', NULL, '2019-02-27 11:16:41');
INSERT INTO `audit` VALUES (76, 'Item', 43, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:17:07', NULL, '2019-02-27 11:17:07');
INSERT INTO `audit` VALUES (77, 'Item', 44, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:17:07', NULL, '2019-02-27 11:17:07');
INSERT INTO `audit` VALUES (78, 'Item', 46, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:17:27', NULL, '2019-02-27 11:17:27');
INSERT INTO `audit` VALUES (79, 'Item', 45, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:17:27', NULL, '2019-02-27 11:17:27');
INSERT INTO `audit` VALUES (80, 'Item', 48, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:17:43', NULL, '2019-02-27 11:17:43');
INSERT INTO `audit` VALUES (81, 'Item', 47, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:17:43', NULL, '2019-02-27 11:17:43');
INSERT INTO `audit` VALUES (82, 'Item', 49, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:18:08', NULL, '2019-02-27 11:18:08');
INSERT INTO `audit` VALUES (83, 'Item', 50, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:18:08', NULL, '2019-02-27 11:18:08');
INSERT INTO `audit` VALUES (84, 'Item', 51, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:18:27', NULL, '2019-02-27 11:18:27');
INSERT INTO `audit` VALUES (85, 'Item', 52, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:18:27', NULL, '2019-02-27 11:18:27');
INSERT INTO `audit` VALUES (86, 'Item', 53, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:18:45', NULL, '2019-02-27 11:18:45');
INSERT INTO `audit` VALUES (87, 'Item', 54, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:18:45', NULL, '2019-02-27 11:18:45');
INSERT INTO `audit` VALUES (88, 'Item', 55, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:19:02', NULL, '2019-02-27 11:19:02');
INSERT INTO `audit` VALUES (89, 'Item', 56, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:19:02', NULL, '2019-02-27 11:19:02');
INSERT INTO `audit` VALUES (90, 'Item', 56, 'UPDATE', NULL, b'0', 'apollo', '2019-02-27 11:19:09', NULL, '2019-02-27 11:19:09');
INSERT INTO `audit` VALUES (91, 'Namespace', 11, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:19:40', NULL, '2019-02-27 11:19:40');
INSERT INTO `audit` VALUES (92, 'Namespace', 12, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:19:40', NULL, '2019-02-27 11:19:40');
INSERT INTO `audit` VALUES (93, 'AppNamespace', 6, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:19:40', NULL, '2019-02-27 11:19:40');
INSERT INTO `audit` VALUES (94, 'Namespace', 13, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:19:58', NULL, '2019-02-27 11:19:58');
INSERT INTO `audit` VALUES (95, 'Namespace', 14, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:19:58', NULL, '2019-02-27 11:19:58');
INSERT INTO `audit` VALUES (96, 'AppNamespace', 7, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:19:58', NULL, '2019-02-27 11:19:58');
INSERT INTO `audit` VALUES (97, 'Namespace', 11, 'DELETE', NULL, b'0', 'apollo', '2019-02-27 11:20:08', NULL, '2019-02-27 11:20:08');
INSERT INTO `audit` VALUES (98, 'Namespace', 9, 'DELETE', NULL, b'0', 'apollo', '2019-02-27 11:20:17', NULL, '2019-02-27 11:20:17');
INSERT INTO `audit` VALUES (99, 'Item', 57, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:21:02', NULL, '2019-02-27 11:21:02');
INSERT INTO `audit` VALUES (100, 'Item', 58, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:21:02', NULL, '2019-02-27 11:21:02');
INSERT INTO `audit` VALUES (101, 'Item', 59, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:21:34', NULL, '2019-02-27 11:21:34');
INSERT INTO `audit` VALUES (102, 'Item', 60, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:21:34', NULL, '2019-02-27 11:21:34');
INSERT INTO `audit` VALUES (103, 'Item', 61, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:21:54', NULL, '2019-02-27 11:21:54');
INSERT INTO `audit` VALUES (104, 'Item', 62, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:21:54', NULL, '2019-02-27 11:21:54');
INSERT INTO `audit` VALUES (105, 'Item', 63, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:22:09', NULL, '2019-02-27 11:22:09');
INSERT INTO `audit` VALUES (106, 'Item', 64, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:22:09', NULL, '2019-02-27 11:22:09');
INSERT INTO `audit` VALUES (107, 'Item', 65, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:22:35', NULL, '2019-02-27 11:22:35');
INSERT INTO `audit` VALUES (108, 'Item', 66, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:22:35', NULL, '2019-02-27 11:22:35');
INSERT INTO `audit` VALUES (109, 'Item', 67, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:23:07', NULL, '2019-02-27 11:23:07');
INSERT INTO `audit` VALUES (110, 'Item', 68, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:23:07', NULL, '2019-02-27 11:23:07');
INSERT INTO `audit` VALUES (111, 'Namespace', 15, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:24:33', NULL, '2019-02-27 11:24:33');
INSERT INTO `audit` VALUES (112, 'Namespace', 16, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:24:33', NULL, '2019-02-27 11:24:33');
INSERT INTO `audit` VALUES (113, 'AppNamespace', 8, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:24:33', NULL, '2019-02-27 11:24:33');
INSERT INTO `audit` VALUES (114, 'Item', 69, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:25:19', NULL, '2019-02-27 11:25:19');
INSERT INTO `audit` VALUES (115, 'Item', 70, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 11:25:19', NULL, '2019-02-27 11:25:19');
INSERT INTO `audit` VALUES (116, 'Namespace', 17, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 13:31:21', NULL, '2019-02-27 13:31:21');
INSERT INTO `audit` VALUES (117, 'Namespace', 18, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 13:34:28', NULL, '2019-02-27 13:34:28');
INSERT INTO `audit` VALUES (118, 'Namespace', 19, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 13:34:28', NULL, '2019-02-27 13:34:28');
INSERT INTO `audit` VALUES (119, 'AppNamespace', 9, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 13:34:28', NULL, '2019-02-27 13:34:28');
INSERT INTO `audit` VALUES (120, 'Namespace', 16, 'DELETE', NULL, b'0', 'apollo', '2019-02-27 13:34:37', NULL, '2019-02-27 13:34:37');
INSERT INTO `audit` VALUES (121, 'Namespace', 20, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 13:36:10', NULL, '2019-02-27 13:36:10');
INSERT INTO `audit` VALUES (122, 'Namespace', 21, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 13:36:10', NULL, '2019-02-27 13:36:10');
INSERT INTO `audit` VALUES (123, 'AppNamespace', 10, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 13:36:10', NULL, '2019-02-27 13:36:10');
INSERT INTO `audit` VALUES (124, 'Namespace', 22, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 13:36:43', NULL, '2019-02-27 13:36:43');
INSERT INTO `audit` VALUES (125, 'Namespace', 23, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 13:36:43', NULL, '2019-02-27 13:36:43');
INSERT INTO `audit` VALUES (126, 'AppNamespace', 11, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 13:36:43', NULL, '2019-02-27 13:36:43');
INSERT INTO `audit` VALUES (127, 'Namespace', 12, 'DELETE', NULL, b'0', 'apollo', '2019-02-27 13:36:59', NULL, '2019-02-27 13:36:59');
INSERT INTO `audit` VALUES (128, 'Namespace', 14, 'DELETE', NULL, b'0', 'apollo', '2019-02-27 13:40:57', NULL, '2019-02-27 13:40:57');
INSERT INTO `audit` VALUES (129, 'Namespace', 8, 'DELETE', NULL, b'0', 'apollo', '2019-02-27 13:41:01', NULL, '2019-02-27 13:41:01');
INSERT INTO `audit` VALUES (130, 'Namespace', 10, 'DELETE', NULL, b'0', 'apollo', '2019-02-27 13:41:05', NULL, '2019-02-27 13:41:05');
INSERT INTO `audit` VALUES (131, 'Namespace', 7, 'DELETE', NULL, b'0', 'apollo', '2019-02-27 13:41:20', NULL, '2019-02-27 13:41:20');
INSERT INTO `audit` VALUES (132, 'Namespace', 13, 'DELETE', NULL, b'0', 'apollo', '2019-02-27 13:41:28', NULL, '2019-02-27 13:41:28');
INSERT INTO `audit` VALUES (133, 'Namespace', 15, 'DELETE', NULL, b'0', 'apollo', '2019-02-27 13:41:33', NULL, '2019-02-27 13:41:33');
INSERT INTO `audit` VALUES (134, 'Namespace', 17, 'DELETE', NULL, b'0', 'apollo', '2019-02-27 13:41:38', NULL, '2019-02-27 13:41:38');
INSERT INTO `audit` VALUES (135, 'Namespace', 24, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 13:42:55', NULL, '2019-02-27 13:42:55');
INSERT INTO `audit` VALUES (136, 'Namespace', 25, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 13:42:55', NULL, '2019-02-27 13:42:55');
INSERT INTO `audit` VALUES (137, 'Namespace', 24, 'DELETE', NULL, b'0', 'apollo', '2019-02-27 13:43:16', NULL, '2019-02-27 13:43:16');
INSERT INTO `audit` VALUES (138, 'Namespace', 25, 'DELETE', NULL, b'0', 'apollo', '2019-02-27 13:44:35', NULL, '2019-02-27 13:44:35');
INSERT INTO `audit` VALUES (139, 'Namespace', 26, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 13:49:20', NULL, '2019-02-27 13:49:20');
INSERT INTO `audit` VALUES (140, 'Namespace', 27, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 13:49:20', NULL, '2019-02-27 13:49:20');
INSERT INTO `audit` VALUES (141, 'AppNamespace', 12, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 13:49:20', NULL, '2019-02-27 13:49:20');
INSERT INTO `audit` VALUES (142, 'Namespace', 26, 'DELETE', NULL, b'0', 'apollo', '2019-02-27 13:52:04', NULL, '2019-02-27 13:52:04');
INSERT INTO `audit` VALUES (143, 'Namespace', 18, 'DELETE', NULL, b'0', 'apollo', '2019-02-27 13:52:13', NULL, '2019-02-27 13:52:13');
INSERT INTO `audit` VALUES (144, 'Namespace', 28, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 13:55:30', NULL, '2019-02-27 13:55:30');
INSERT INTO `audit` VALUES (145, 'Namespace', 29, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 13:55:30', NULL, '2019-02-27 13:55:30');
INSERT INTO `audit` VALUES (146, 'AppNamespace', 13, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 13:55:30', NULL, '2019-02-27 13:55:30');
INSERT INTO `audit` VALUES (147, 'Release', 2, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 14:02:15', NULL, '2019-02-27 14:02:15');
INSERT INTO `audit` VALUES (148, 'ReleaseHistory', 2, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 14:02:15', NULL, '2019-02-27 14:02:15');
INSERT INTO `audit` VALUES (149, 'Namespace', 30, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 14:02:23', NULL, '2019-02-27 14:02:23');
INSERT INTO `audit` VALUES (150, 'Namespace', 31, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 14:02:23', NULL, '2019-02-27 14:02:23');
INSERT INTO `audit` VALUES (151, 'Namespace', 32, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 14:02:54', NULL, '2019-02-27 14:02:54');
INSERT INTO `audit` VALUES (152, 'Namespace', 33, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 14:02:54', NULL, '2019-02-27 14:02:54');
INSERT INTO `audit` VALUES (153, 'AppNamespace', 14, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 14:02:54', NULL, '2019-02-27 14:02:54');
INSERT INTO `audit` VALUES (154, 'Namespace', 34, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 14:05:36', NULL, '2019-02-27 14:05:36');
INSERT INTO `audit` VALUES (155, 'Namespace', 35, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 14:05:36', NULL, '2019-02-27 14:05:36');
INSERT INTO `audit` VALUES (156, 'AppNamespace', 15, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 14:05:36', NULL, '2019-02-27 14:05:36');
INSERT INTO `audit` VALUES (157, 'Release', 3, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 14:06:01', NULL, '2019-02-27 14:06:01');
INSERT INTO `audit` VALUES (158, 'ReleaseHistory', 3, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 14:06:01', NULL, '2019-02-27 14:06:01');
INSERT INTO `audit` VALUES (159, 'Release', 4, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 14:06:08', NULL, '2019-02-27 14:06:08');
INSERT INTO `audit` VALUES (160, 'ReleaseHistory', 4, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 14:06:08', NULL, '2019-02-27 14:06:08');
INSERT INTO `audit` VALUES (161, 'Item', 7, 'UPDATE', NULL, b'0', 'apollo', '2019-02-27 14:24:07', NULL, '2019-02-27 14:24:07');
INSERT INTO `audit` VALUES (162, 'Item', 7, 'UPDATE', NULL, b'0', 'apollo', '2019-02-27 14:24:16', NULL, '2019-02-27 14:24:16');
INSERT INTO `audit` VALUES (163, 'Item', 24, 'UPDATE', NULL, b'0', 'apollo', '2019-02-27 14:24:29', NULL, '2019-02-27 14:24:29');
INSERT INTO `audit` VALUES (164, 'Item', 24, 'UPDATE', NULL, b'0', 'apollo', '2019-02-27 14:24:43', NULL, '2019-02-27 14:24:43');
INSERT INTO `audit` VALUES (165, 'Item', 42, 'UPDATE', NULL, b'0', 'apollo', '2019-02-27 14:24:51', NULL, '2019-02-27 14:24:51');
INSERT INTO `audit` VALUES (166, 'Item', 59, 'UPDATE', NULL, b'0', 'apollo', '2019-02-27 14:25:01', NULL, '2019-02-27 14:25:01');
INSERT INTO `audit` VALUES (167, 'Release', 5, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 14:25:15', NULL, '2019-02-27 14:25:15');
INSERT INTO `audit` VALUES (168, 'ReleaseHistory', 5, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 14:25:15', NULL, '2019-02-27 14:25:15');
INSERT INTO `audit` VALUES (169, 'Release', 6, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 14:32:10', NULL, '2019-02-27 14:32:10');
INSERT INTO `audit` VALUES (170, 'ReleaseHistory', 6, 'INSERT', NULL, b'0', 'apollo', '2019-02-27 14:32:10', NULL, '2019-02-27 14:32:10');

-- ----------------------------
-- Table structure for cluster
-- ----------------------------
DROP TABLE IF EXISTS `cluster`;
CREATE TABLE `cluster`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '集群名字',
  `AppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'App id',
  `ParentClusterId` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父cluster',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AppId_Name`(`AppId`, `Name`) USING BTREE,
  INDEX `IX_ParentClusterId`(`ParentClusterId`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '集群' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cluster
-- ----------------------------
INSERT INTO `cluster` VALUES (1, 'default', 'SampleApp', 0, b'1', '', '2019-02-27 10:07:03', 'apollo', '2019-02-27 10:37:51');
INSERT INTO `cluster` VALUES (2, 'default', 'wg-framework', 0, b'1', 'arno', '2019-02-27 10:21:20', 'apollo', '2019-02-27 10:40:34');
INSERT INTO `cluster` VALUES (3, 'default', 'wg-framework', 0, b'0', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:40:39');
INSERT INTO `cluster` VALUES (4, 'TEST', 'wg-framework', 0, b'0', 'apollo', '2019-02-27 10:54:39', 'apollo', '2019-02-27 10:54:39');

-- ----------------------------
-- Table structure for commit
-- ----------------------------
DROP TABLE IF EXISTS `commit`;
CREATE TABLE `commit`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ChangeSets` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '修改变更集',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `Comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `AppId`(`AppId`(191)) USING BTREE,
  INDEX `ClusterName`(`ClusterName`(191)) USING BTREE,
  INDEX `NamespaceName`(`NamespaceName`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'commit 历史表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commit
-- ----------------------------
INSERT INTO `commit` VALUES (1, '{\"createItems\":[],\"updateItems\":[],\"deleteItems\":[{\"namespaceId\":1,\"key\":\"timeout\",\"value\":\"100\",\"comment\":\"sample timeout配置\",\"lineNum\":1,\"id\":1,\"isDeleted\":true,\"dataChangeCreatedBy\":\"default\",\"dataChangeCreatedTime\":\"2019-02-27 10:07:03\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 10:14:15\"}]}', 'SampleApp', 'default', 'application', NULL, b'1', 'apollo', '2019-02-27 10:14:15', 'apollo', '2019-02-27 10:37:15');
INSERT INTO `commit` VALUES (2, '{\"createItems\":[{\"namespaceId\":2,\"key\":\"druid.type\",\"value\":\"com.alibaba.druid.pool.DruidDataSource\",\"comment\":\"druid连接池\",\"lineNum\":1,\"id\":2,\"isDeleted\":false,\"dataChangeCreatedBy\":\"arno\",\"dataChangeCreatedTime\":\"2019-02-27 10:24:41\",\"dataChangeLastModifiedBy\":\"arno\",\"dataChangeLastModifiedTime\":\"2019-02-27 10:24:41\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'application', NULL, b'1', 'arno', '2019-02-27 10:24:42', 'apollo', '2019-02-27 10:40:33');
INSERT INTO `commit` VALUES (3, '{\"createItems\":[{\"namespaceId\":7,\"key\":\"druid.type\",\"value\":\"com.alibaba.druid.pool.DruidDataSource\",\"comment\":\"连接池对象\",\"lineNum\":1,\"id\":4,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 10:57:48\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 10:57:48\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 10:57:49', 'apollo', '2019-02-27 13:41:19');
INSERT INTO `commit` VALUES (4, '{\"createItems\":[{\"namespaceId\":8,\"key\":\"druid.type\",\"value\":\"com.alibaba.druid.pool.DruidDataSource\",\"comment\":\"连接池对象\",\"lineNum\":1,\"id\":3,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 10:57:48\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 10:57:48\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 10:57:49', 'apollo', '2019-02-27 13:41:00');
INSERT INTO `commit` VALUES (5, '{\"createItems\":[{\"namespaceId\":8,\"key\":\"druid.readSize\",\"value\":\"2\",\"comment\":\"从库数量\",\"lineNum\":2,\"id\":5,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 10:58:15\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 10:58:15\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 10:58:16', 'apollo', '2019-02-27 13:41:00');
INSERT INTO `commit` VALUES (6, '{\"createItems\":[{\"namespaceId\":7,\"key\":\"druid.readSize\",\"value\":\"2\",\"comment\":\"从库数量\",\"lineNum\":2,\"id\":6,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 10:58:15\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 10:58:15\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 10:58:16', 'apollo', '2019-02-27 13:41:19');
INSERT INTO `commit` VALUES (7, '{\"createItems\":[{\"namespaceId\":7,\"key\":\"druid.master.url\",\"value\":\"jdbc:mysql://192.168.50.109:3306/wg_base?characterEncoding\\u003dUTF-8\\u0026autoReconnect\\u003dtrue\\u0026zeroDateTimeBehavior\\u003dconvertToNull\\u0026useUnicode\\u003dtrue\",\"comment\":\"主库连接地址\",\"lineNum\":3,\"id\":8,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 10:58:53\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 10:58:54\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 10:58:54', 'apollo', '2019-02-27 13:41:19');
INSERT INTO `commit` VALUES (8, '{\"createItems\":[{\"namespaceId\":8,\"key\":\"druid.master.url\",\"value\":\"jdbc:mysql://192.168.50.109:3306/wg_base?characterEncoding\\u003dUTF-8\\u0026autoReconnect\\u003dtrue\\u0026zeroDateTimeBehavior\\u003dconvertToNull\\u0026useUnicode\\u003dtrue\",\"comment\":\"主库连接地址\",\"lineNum\":3,\"id\":7,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 10:58:53\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 10:58:54\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 10:58:54', 'apollo', '2019-02-27 13:41:00');
INSERT INTO `commit` VALUES (9, '{\"createItems\":[{\"namespaceId\":8,\"key\":\"druid.master.driver-class-name\",\"value\":\"com.mysql.jdbc.Driver\",\"comment\":\"主库连接对象\",\"lineNum\":4,\"id\":9,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 10:59:26\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 10:59:26\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 10:59:26', 'apollo', '2019-02-27 13:41:00');
INSERT INTO `commit` VALUES (10, '{\"createItems\":[{\"namespaceId\":7,\"key\":\"druid.master.driver-class-name\",\"value\":\"com.mysql.jdbc.Driver\",\"comment\":\"主库连接对象\",\"lineNum\":4,\"id\":10,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 10:59:26\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 10:59:26\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 10:59:26', 'apollo', '2019-02-27 13:41:19');
INSERT INTO `commit` VALUES (11, '{\"createItems\":[{\"namespaceId\":8,\"key\":\"druid.master.username\",\"value\":\"root\",\"comment\":\"主库用户名\",\"lineNum\":5,\"id\":12,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:00:58\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:00:58\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:00:59', 'apollo', '2019-02-27 13:41:00');
INSERT INTO `commit` VALUES (12, '{\"createItems\":[{\"namespaceId\":7,\"key\":\"druid.master.username\",\"value\":\"root\",\"comment\":\"主库用户名\",\"lineNum\":5,\"id\":11,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:00:58\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:00:58\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:00:59', 'apollo', '2019-02-27 13:41:19');
INSERT INTO `commit` VALUES (13, '{\"createItems\":[{\"namespaceId\":7,\"key\":\"druid.master.password\",\"value\":\"123456\",\"comment\":\"主库密码\",\"lineNum\":6,\"id\":13,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:01:26\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:01:26\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:01:27', 'apollo', '2019-02-27 13:41:19');
INSERT INTO `commit` VALUES (14, '{\"createItems\":[{\"namespaceId\":8,\"key\":\"druid.master.password\",\"value\":\"123456\",\"comment\":\"主库密码\",\"lineNum\":6,\"id\":14,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:01:26\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:01:26\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:01:27', 'apollo', '2019-02-27 13:41:00');
INSERT INTO `commit` VALUES (15, '{\"createItems\":[{\"namespaceId\":7,\"key\":\"druid.master.initial-size\",\"value\":\"5\",\"comment\":\"主库初始化连接数\",\"lineNum\":7,\"id\":15,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:02:06\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:02:06\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:02:06', 'apollo', '2019-02-27 13:41:19');
INSERT INTO `commit` VALUES (16, '{\"createItems\":[{\"namespaceId\":8,\"key\":\"druid.master.initial-size\",\"value\":\"5\",\"comment\":\"主库初始化连接数\",\"lineNum\":7,\"id\":16,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:02:06\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:02:06\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:02:06', 'apollo', '2019-02-27 13:41:00');
INSERT INTO `commit` VALUES (17, '{\"createItems\":[{\"namespaceId\":8,\"key\":\"druid.master.min-idle\",\"value\":\"1\",\"comment\":\"主库最少连接池数\",\"lineNum\":8,\"id\":17,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:02:43\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:02:43\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:02:44', 'apollo', '2019-02-27 13:41:00');
INSERT INTO `commit` VALUES (18, '{\"createItems\":[{\"namespaceId\":7,\"key\":\"druid.master.min-idle\",\"value\":\"1\",\"comment\":\"主库最少连接池数\",\"lineNum\":8,\"id\":18,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:02:43\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:02:43\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:02:44', 'apollo', '2019-02-27 13:41:19');
INSERT INTO `commit` VALUES (19, '{\"createItems\":[{\"namespaceId\":7,\"key\":\"druid.master.max-active\",\"value\":\"100\",\"comment\":\"主库最大激活连接数\",\"lineNum\":9,\"id\":19,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:03:36\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:03:37\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:03:37', 'apollo', '2019-02-27 13:41:19');
INSERT INTO `commit` VALUES (20, '{\"createItems\":[{\"namespaceId\":8,\"key\":\"druid.master.max-active\",\"value\":\"100\",\"comment\":\"主库最大激活连接数\",\"lineNum\":9,\"id\":20,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:03:36\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:03:37\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:03:37', 'apollo', '2019-02-27 13:41:00');
INSERT INTO `commit` VALUES (21, '{\"createItems\":[{\"namespaceId\":7,\"key\":\"druid.master.test-on-borrow\",\"value\":\"true\",\"comment\":\"检测池里连接的可用性，非生产环境开启\",\"lineNum\":10,\"id\":21,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:07:21\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:07:22\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:07:22', 'apollo', '2019-02-27 13:41:19');
INSERT INTO `commit` VALUES (22, '{\"createItems\":[{\"namespaceId\":8,\"key\":\"druid.master.test-on-borrow\",\"value\":\"true\",\"comment\":\"检测池里连接的可用性，非生产环境开启\",\"lineNum\":10,\"id\":22,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:07:21\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:07:22\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:07:22', 'apollo', '2019-02-27 13:41:00');
INSERT INTO `commit` VALUES (23, '{\"createItems\":[{\"namespaceId\":8,\"key\":\"druid.slave.url\",\"value\":\"jdbc:mysql://192.168.50.109:3306/wg_base\",\"comment\":\"从库1连接地址\",\"lineNum\":11,\"id\":24,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:08:48\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:08:48\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:08:49', 'apollo', '2019-02-27 13:41:00');
INSERT INTO `commit` VALUES (24, '{\"createItems\":[{\"namespaceId\":7,\"key\":\"druid.slave.url\",\"value\":\"jdbc:mysql://192.168.50.109:3306/wg_base\",\"comment\":\"从库1连接地址\",\"lineNum\":11,\"id\":23,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:08:48\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:08:48\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:08:49', 'apollo', '2019-02-27 13:41:19');
INSERT INTO `commit` VALUES (25, '{\"createItems\":[{\"namespaceId\":8,\"key\":\"druid.slave.urldriver-class-name\",\"value\":\"com.mysql.jdbc.Driver\",\"comment\":\"从库连接对象\",\"lineNum\":12,\"id\":26,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:09:12\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:09:12\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:09:12', 'apollo', '2019-02-27 13:41:00');
INSERT INTO `commit` VALUES (26, '{\"createItems\":[{\"namespaceId\":7,\"key\":\"druid.slave.urldriver-class-name\",\"value\":\"com.mysql.jdbc.Driver\",\"comment\":\"从库连接对象\",\"lineNum\":12,\"id\":25,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:09:12\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:09:12\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:09:12', 'apollo', '2019-02-27 13:41:19');
INSERT INTO `commit` VALUES (27, '{\"createItems\":[{\"namespaceId\":7,\"key\":\"druid.slave.username\",\"value\":\"root\",\"comment\":\"从库用户名\",\"lineNum\":13,\"id\":27,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:09:50\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:09:50\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:09:51', 'apollo', '2019-02-27 13:41:19');
INSERT INTO `commit` VALUES (28, '{\"createItems\":[{\"namespaceId\":8,\"key\":\"druid.slave.username\",\"value\":\"root\",\"comment\":\"从库用户名\",\"lineNum\":13,\"id\":28,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:09:50\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:09:50\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:09:51', 'apollo', '2019-02-27 13:41:00');
INSERT INTO `commit` VALUES (29, '{\"createItems\":[{\"namespaceId\":7,\"key\":\"druid.slave.password\",\"value\":\"123456\",\"comment\":\"从库1密码\",\"lineNum\":14,\"id\":29,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:10:37\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:10:37\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:10:37', 'apollo', '2019-02-27 13:41:19');
INSERT INTO `commit` VALUES (30, '{\"createItems\":[{\"namespaceId\":8,\"key\":\"druid.slave.password\",\"value\":\"123456\",\"comment\":\"从库1密码\",\"lineNum\":14,\"id\":30,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:10:37\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:10:37\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:10:38', 'apollo', '2019-02-27 13:41:00');
INSERT INTO `commit` VALUES (31, '{\"createItems\":[{\"namespaceId\":8,\"key\":\"druid.slave.initial-size\",\"value\":\"5\",\"comment\":\"从库1初始化连接数\",\"lineNum\":15,\"id\":31,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:11:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:11:02\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:11:03', 'apollo', '2019-02-27 13:41:00');
INSERT INTO `commit` VALUES (32, '{\"createItems\":[{\"namespaceId\":7,\"key\":\"druid.slave.initial-size\",\"value\":\"5\",\"comment\":\"从库1初始化连接数\",\"lineNum\":15,\"id\":32,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:11:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:11:02\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:11:03', 'apollo', '2019-02-27 13:41:19');
INSERT INTO `commit` VALUES (33, '{\"createItems\":[{\"namespaceId\":8,\"key\":\"druid.slave.min-idle\",\"value\":\"1\",\"comment\":\"从库1最少连接数\",\"lineNum\":16,\"id\":34,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:11:24\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:11:24\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:11:25', 'apollo', '2019-02-27 13:41:00');
INSERT INTO `commit` VALUES (34, '{\"createItems\":[{\"namespaceId\":7,\"key\":\"druid.slave.min-idle\",\"value\":\"1\",\"comment\":\"从库1最少连接数\",\"lineNum\":16,\"id\":33,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:11:24\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:11:24\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:11:25', 'apollo', '2019-02-27 13:41:19');
INSERT INTO `commit` VALUES (35, '{\"createItems\":[{\"namespaceId\":7,\"key\":\"druid.slave.max-active\",\"value\":\"100\",\"comment\":\"从库1最大连接数\",\"lineNum\":17,\"id\":35,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:11:45\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:11:45\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:11:45', 'apollo', '2019-02-27 13:41:19');
INSERT INTO `commit` VALUES (36, '{\"createItems\":[{\"namespaceId\":8,\"key\":\"druid.slave.max-active\",\"value\":\"100\",\"comment\":\"从库1最大连接数\",\"lineNum\":17,\"id\":36,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:11:45\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:11:45\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:11:45', 'apollo', '2019-02-27 13:41:00');
INSERT INTO `commit` VALUES (37, '{\"createItems\":[],\"updateItems\":[],\"deleteItems\":[{\"namespaceId\":7,\"key\":\"druid.slave.urldriver-class-name\",\"value\":\"com.mysql.jdbc.Driver\",\"comment\":\"从库1连接对象\",\"lineNum\":12,\"id\":25,\"isDeleted\":true,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:09:12\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:12:54\"}]}', 'wg-framework', 'default', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:12:55', 'apollo', '2019-02-27 13:41:19');
INSERT INTO `commit` VALUES (38, '{\"createItems\":[{\"namespaceId\":7,\"key\":\"druid.slave.driver-class-name\",\"value\":\"com.mysql.jdbc.Driver\",\"comment\":\"从库1连接对象\",\"lineNum\":18,\"id\":37,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:13:15\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:13:15\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:13:16', 'apollo', '2019-02-27 13:41:19');
INSERT INTO `commit` VALUES (39, '{\"createItems\":[{\"namespaceId\":8,\"key\":\"druid.slave.driver-class-name\",\"value\":\"com.mysql.jdbc.Driver\",\"comment\":\"从库1连接对象\",\"lineNum\":18,\"id\":38,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:13:15\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:13:15\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:13:16', 'apollo', '2019-02-27 13:41:00');
INSERT INTO `commit` VALUES (40, '{\"createItems\":[{\"namespaceId\":7,\"key\":\"druid.slave.test-on-borrow\",\"value\":\"true\",\"lineNum\":19,\"id\":39,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:14:04\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:14:05\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:14:05', 'apollo', '2019-02-27 13:41:19');
INSERT INTO `commit` VALUES (41, '{\"createItems\":[{\"namespaceId\":8,\"key\":\"druid.slave.test-on-borrow\",\"value\":\"true\",\"lineNum\":19,\"id\":40,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:14:04\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:14:05\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:14:05', 'apollo', '2019-02-27 13:41:00');
INSERT INTO `commit` VALUES (42, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":7,\"key\":\"druid.master.url\",\"value\":\"jdbc:mysql://192.168.50.109:3306/wg_base?characterEncoding\\u003dUTF-8\\u0026autoReconnect\\u003dtrue\\u0026zeroDateTimeBehavior\\u003dconvertToNull\\u0026useUnicode\\u003dtrue\",\"comment\":\"主库连接地址\",\"lineNum\":3,\"id\":8,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 10:58:54\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 10:58:54\"},\"newItem\":{\"namespaceId\":7,\"key\":\"druid.master.url\",\"value\":\"jdbc:mysql://192.168.50.109:3306/wg_base\",\"comment\":\"主库连接地址\",\"lineNum\":3,\"id\":8,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 10:58:54\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:15:53\"}}],\"deleteItems\":[]}', 'wg-framework', 'default', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:15:53', 'apollo', '2019-02-27 13:41:19');
INSERT INTO `commit` VALUES (43, '{\"createItems\":[{\"namespaceId\":7,\"key\":\"druid.slave2.url\",\"value\":\"jdbc:mysql://192.168.50.109:3306/wg_base\",\"comment\":\"从库2连接地址\",\"lineNum\":20,\"id\":41,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:16:41\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:16:41\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:16:41', 'apollo', '2019-02-27 13:41:19');
INSERT INTO `commit` VALUES (44, '{\"createItems\":[{\"namespaceId\":8,\"key\":\"druid.slave2.url\",\"value\":\"jdbc:mysql://192.168.50.109:3306/wg_base\",\"comment\":\"从库2连接地址\",\"lineNum\":20,\"id\":42,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:16:41\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:16:41\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:16:41', 'apollo', '2019-02-27 13:41:00');
INSERT INTO `commit` VALUES (45, '{\"createItems\":[{\"namespaceId\":8,\"key\":\"druid.slave2.driver-class-name\",\"value\":\"com.mysql.jdbc.Driver\",\"comment\":\"从库2连接对象\",\"lineNum\":21,\"id\":44,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:17:06\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:17:07\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:17:07', 'apollo', '2019-02-27 13:41:00');
INSERT INTO `commit` VALUES (46, '{\"createItems\":[{\"namespaceId\":7,\"key\":\"druid.slave2.driver-class-name\",\"value\":\"com.mysql.jdbc.Driver\",\"comment\":\"从库2连接对象\",\"lineNum\":21,\"id\":43,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:17:06\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:17:07\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:17:07', 'apollo', '2019-02-27 13:41:19');
INSERT INTO `commit` VALUES (47, '{\"createItems\":[{\"namespaceId\":8,\"key\":\"druid.slave2.username\",\"value\":\"root\",\"comment\":\"从库2用户名\",\"lineNum\":22,\"id\":46,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:17:26\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:17:26\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:17:27', 'apollo', '2019-02-27 13:41:00');
INSERT INTO `commit` VALUES (48, '{\"createItems\":[{\"namespaceId\":7,\"key\":\"druid.slave2.username\",\"value\":\"root\",\"comment\":\"从库2用户名\",\"lineNum\":22,\"id\":45,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:17:26\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:17:26\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:17:27', 'apollo', '2019-02-27 13:41:19');
INSERT INTO `commit` VALUES (49, '{\"createItems\":[{\"namespaceId\":8,\"key\":\"druid.slave2.password\",\"value\":\"123456\",\"comment\":\"从库2密码\",\"lineNum\":23,\"id\":47,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:17:42\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:17:43\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:17:43', 'apollo', '2019-02-27 13:41:00');
INSERT INTO `commit` VALUES (50, '{\"createItems\":[{\"namespaceId\":7,\"key\":\"druid.slave2.password\",\"value\":\"123456\",\"comment\":\"从库2密码\",\"lineNum\":23,\"id\":48,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:17:42\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:17:43\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:17:43', 'apollo', '2019-02-27 13:41:19');
INSERT INTO `commit` VALUES (51, '{\"createItems\":[{\"namespaceId\":7,\"key\":\"druid.slave2.initial-size\",\"value\":\"5\",\"comment\":\"从库2初始化连接数\",\"lineNum\":24,\"id\":49,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:18:08\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:18:08\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:18:08', 'apollo', '2019-02-27 13:41:19');
INSERT INTO `commit` VALUES (52, '{\"createItems\":[{\"namespaceId\":8,\"key\":\"druid.slave2.initial-size\",\"value\":\"5\",\"comment\":\"从库2初始化连接数\",\"lineNum\":24,\"id\":50,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:18:08\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:18:08\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:18:09', 'apollo', '2019-02-27 13:41:00');
INSERT INTO `commit` VALUES (53, '{\"createItems\":[{\"namespaceId\":7,\"key\":\"druid.slave2.min-idle\",\"value\":\"1\",\"comment\":\"从库2最少连接数\",\"lineNum\":25,\"id\":51,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:18:26\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:18:26\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:18:27', 'apollo', '2019-02-27 13:41:19');
INSERT INTO `commit` VALUES (54, '{\"createItems\":[{\"namespaceId\":8,\"key\":\"druid.slave2.min-idle\",\"value\":\"1\",\"comment\":\"从库2最少连接数\",\"lineNum\":25,\"id\":52,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:18:26\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:18:26\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:18:27', 'apollo', '2019-02-27 13:41:00');
INSERT INTO `commit` VALUES (55, '{\"createItems\":[{\"namespaceId\":8,\"key\":\"druid.slave2.max-active\",\"value\":\"100\",\"comment\":\"从库2最大连接数\",\"lineNum\":26,\"id\":54,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:18:44\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:18:44\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:18:45', 'apollo', '2019-02-27 13:41:00');
INSERT INTO `commit` VALUES (56, '{\"createItems\":[{\"namespaceId\":7,\"key\":\"druid.slave2.max-active\",\"value\":\"100\",\"comment\":\"从库2最大连接数\",\"lineNum\":26,\"id\":53,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:18:44\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:18:44\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:18:45', 'apollo', '2019-02-27 13:41:19');
INSERT INTO `commit` VALUES (57, '{\"createItems\":[{\"namespaceId\":8,\"key\":\"druid.slave2.test-on-borrow\",\"value\":\"true\",\"lineNum\":27,\"id\":55,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:19:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:19:02\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:19:02', 'apollo', '2019-02-27 13:41:00');
INSERT INTO `commit` VALUES (58, '{\"createItems\":[{\"namespaceId\":7,\"key\":\"druid.slave2.test-on-borrow\",\"value\":\"true\",\"lineNum\":27,\"id\":56,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:19:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:19:02\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'JDBC', NULL, b'1', 'apollo', '2019-02-27 11:19:02', 'apollo', '2019-02-27 13:41:19');
INSERT INTO `commit` VALUES (59, '{\"createItems\":[{\"namespaceId\":14,\"key\":\"spring.redis.database\",\"value\":\"0\",\"lineNum\":1,\"id\":57,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:21:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:21:02\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'Redis', NULL, b'1', 'apollo', '2019-02-27 11:21:02', 'apollo', '2019-02-27 13:40:56');
INSERT INTO `commit` VALUES (60, '{\"createItems\":[{\"namespaceId\":13,\"key\":\"spring.redis.database\",\"value\":\"0\",\"lineNum\":1,\"id\":58,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:21:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:21:02\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'Redis', NULL, b'1', 'apollo', '2019-02-27 11:21:02', 'apollo', '2019-02-27 13:41:28');
INSERT INTO `commit` VALUES (61, '{\"createItems\":[{\"namespaceId\":13,\"key\":\"spring.redis.host\",\"value\":\"192.168.50.109\",\"comment\":\"redis地址\",\"lineNum\":2,\"id\":60,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:21:33\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:21:33\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'Redis', NULL, b'1', 'apollo', '2019-02-27 11:21:34', 'apollo', '2019-02-27 13:41:28');
INSERT INTO `commit` VALUES (62, '{\"createItems\":[{\"namespaceId\":14,\"key\":\"spring.redis.host\",\"value\":\"192.168.50.109\",\"comment\":\"redis地址\",\"lineNum\":2,\"id\":59,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:21:33\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:21:33\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'Redis', NULL, b'1', 'apollo', '2019-02-27 11:21:34', 'apollo', '2019-02-27 13:40:56');
INSERT INTO `commit` VALUES (63, '{\"createItems\":[{\"namespaceId\":13,\"key\":\"spring.redis.port\",\"value\":\"6379\",\"comment\":\"redis端口\",\"lineNum\":3,\"id\":61,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:21:54\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:21:54\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'Redis', NULL, b'1', 'apollo', '2019-02-27 11:21:54', 'apollo', '2019-02-27 13:41:28');
INSERT INTO `commit` VALUES (64, '{\"createItems\":[{\"namespaceId\":14,\"key\":\"spring.redis.port\",\"value\":\"6379\",\"comment\":\"redis端口\",\"lineNum\":3,\"id\":62,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:21:54\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:21:54\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'Redis', NULL, b'1', 'apollo', '2019-02-27 11:21:55', 'apollo', '2019-02-27 13:40:56');
INSERT INTO `commit` VALUES (65, '{\"createItems\":[{\"namespaceId\":13,\"key\":\"spring.redis.password\",\"value\":\"123456\",\"comment\":\"redis密码\",\"lineNum\":4,\"id\":63,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:22:08\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:22:08\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'Redis', NULL, b'1', 'apollo', '2019-02-27 11:22:09', 'apollo', '2019-02-27 13:41:28');
INSERT INTO `commit` VALUES (66, '{\"createItems\":[{\"namespaceId\":14,\"key\":\"spring.redis.password\",\"value\":\"123456\",\"comment\":\"redis密码\",\"lineNum\":4,\"id\":64,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:22:08\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:22:08\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'Redis', NULL, b'1', 'apollo', '2019-02-27 11:22:09', 'apollo', '2019-02-27 13:40:56');
INSERT INTO `commit` VALUES (67, '{\"createItems\":[{\"namespaceId\":14,\"key\":\"spring.cache.type\",\"value\":\"redis\",\"comment\":\"缓存类型\",\"lineNum\":5,\"id\":65,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:22:35\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:22:35\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'Redis', NULL, b'1', 'apollo', '2019-02-27 11:22:35', 'apollo', '2019-02-27 13:40:56');
INSERT INTO `commit` VALUES (68, '{\"createItems\":[{\"namespaceId\":13,\"key\":\"spring.cache.type\",\"value\":\"redis\",\"comment\":\"缓存类型\",\"lineNum\":5,\"id\":66,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:22:35\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:22:35\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'Redis', NULL, b'1', 'apollo', '2019-02-27 11:22:35', 'apollo', '2019-02-27 13:41:28');
INSERT INTO `commit` VALUES (69, '{\"createItems\":[{\"namespaceId\":13,\"key\":\"spring.cache.cache-names\",\"value\":\"wg-base\",\"comment\":\"缓存键\",\"lineNum\":6,\"id\":67,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:23:06\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:23:06\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'Redis', NULL, b'1', 'apollo', '2019-02-27 11:23:07', 'apollo', '2019-02-27 13:41:28');
INSERT INTO `commit` VALUES (70, '{\"createItems\":[{\"namespaceId\":14,\"key\":\"spring.cache.cache-names\",\"value\":\"wg-base\",\"comment\":\"缓存键\",\"lineNum\":6,\"id\":68,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:23:06\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:23:06\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'Redis', NULL, b'1', 'apollo', '2019-02-27 11:23:07', 'apollo', '2019-02-27 13:40:56');
INSERT INTO `commit` VALUES (71, '{\"createItems\":[{\"namespaceId\":15,\"key\":\"swagger.enable\",\"value\":\"true\",\"comment\":\"开启swagger\",\"lineNum\":1,\"id\":69,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:25:19\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:25:19\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'default', 'Swagger', NULL, b'1', 'apollo', '2019-02-27 11:25:19', 'apollo', '2019-02-27 13:41:32');
INSERT INTO `commit` VALUES (72, '{\"createItems\":[{\"namespaceId\":16,\"key\":\"swagger.enable\",\"value\":\"true\",\"comment\":\"开启swagger\",\"lineNum\":1,\"id\":70,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:25:19\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 11:25:19\"}],\"updateItems\":[],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'Swagger', NULL, b'1', 'apollo', '2019-02-27 11:25:19', 'apollo', '2019-02-27 13:34:37');
INSERT INTO `commit` VALUES (73, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":29,\"key\":\"druid.master.url\",\"value\":\"jdbc:mysql://192.168.50.109:3306/wg_base?characterEncoding\\u003dUTF-8\\u0026autoReconnect\\u003dtrue\\u0026zeroDateTimeBehavior\\u003dconvertToNull\\u0026useUnicode\\u003dtrue\",\"comment\":\"主库连接地址\",\"lineNum\":3,\"id\":7,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 10:58:54\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 13:58:31\"},\"newItem\":{\"namespaceId\":29,\"key\":\"druid.master.url\",\"value\":\"jdbc:mysql://192.168.50.120:3306/wg_base?characterEncoding\\u003dUTF-8\\u0026autoReconnect\\u003dtrue\\u0026zeroDateTimeBehavior\\u003dconvertToNull\\u0026useUnicode\\u003dtrue\",\"comment\":\"主库连接地址\",\"lineNum\":3,\"id\":7,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 10:58:54\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 14:24:06\"}}],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'Jdbc', NULL, b'0', 'apollo', '2019-02-27 14:24:07', 'apollo', '2019-02-27 14:24:07');
INSERT INTO `commit` VALUES (74, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":29,\"key\":\"druid.master.url\",\"value\":\"jdbc:mysql://192.168.50.120:3306/wg_base?characterEncoding\\u003dUTF-8\\u0026autoReconnect\\u003dtrue\\u0026zeroDateTimeBehavior\\u003dconvertToNull\\u0026useUnicode\\u003dtrue\",\"comment\":\"主库连接地址\",\"lineNum\":3,\"id\":7,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 10:58:54\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 14:24:07\"},\"newItem\":{\"namespaceId\":29,\"key\":\"druid.master.url\",\"value\":\"jdbc:mysql://192.168.50.120:3306/wg_base\",\"comment\":\"主库连接地址\",\"lineNum\":3,\"id\":7,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 10:58:54\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 14:24:16\"}}],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'Jdbc', NULL, b'0', 'apollo', '2019-02-27 14:24:16', 'apollo', '2019-02-27 14:24:16');
INSERT INTO `commit` VALUES (75, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":29,\"key\":\"druid.slave.url\",\"value\":\"jdbc:mysql://192.168.50.109:3306/wg_base\",\"comment\":\"从库1连接地址\",\"lineNum\":11,\"id\":24,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:08:48\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 13:58:40\"},\"newItem\":{\"namespaceId\":29,\"key\":\"druid.slave.url\",\"value\":\"jdbc:mysql://localhost:3306/wg_base\",\"comment\":\"从库1连接地址\",\"lineNum\":11,\"id\":24,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:08:48\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 14:24:29\"}}],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'Jdbc', NULL, b'0', 'apollo', '2019-02-27 14:24:29', 'apollo', '2019-02-27 14:24:29');
INSERT INTO `commit` VALUES (76, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":29,\"key\":\"druid.slave.url\",\"value\":\"jdbc:mysql://localhost:3306/wg_base\",\"comment\":\"从库1连接地址\",\"lineNum\":11,\"id\":24,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:08:48\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 14:24:29\"},\"newItem\":{\"namespaceId\":29,\"key\":\"druid.slave.url\",\"value\":\"jdbc:mysql://192.168.50.120:3306/wg_base\",\"comment\":\"从库1连接地址\",\"lineNum\":11,\"id\":24,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:08:48\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 14:24:42\"}}],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'Jdbc', NULL, b'0', 'apollo', '2019-02-27 14:24:43', 'apollo', '2019-02-27 14:24:43');
INSERT INTO `commit` VALUES (77, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":29,\"key\":\"druid.slave2.url\",\"value\":\"jdbc:mysql://192.168.50.109:3306/wg_base\",\"comment\":\"从库2连接地址\",\"lineNum\":20,\"id\":42,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:16:41\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 13:58:55\"},\"newItem\":{\"namespaceId\":29,\"key\":\"druid.slave2.url\",\"value\":\"jdbc:mysql://192.168.50.120:3306/wg_base\",\"comment\":\"从库2连接地址\",\"lineNum\":20,\"id\":42,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:16:41\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 14:24:51\"}}],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'Jdbc', NULL, b'0', 'apollo', '2019-02-27 14:24:51', 'apollo', '2019-02-27 14:24:51');
INSERT INTO `commit` VALUES (78, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":33,\"key\":\"spring.redis.host\",\"value\":\"192.168.50.109\",\"comment\":\"redis地址\",\"lineNum\":2,\"id\":59,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:21:34\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 14:05:16\"},\"newItem\":{\"namespaceId\":33,\"key\":\"spring.redis.host\",\"value\":\"192.168.50.120\",\"comment\":\"redis地址\",\"lineNum\":2,\"id\":59,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-02-27 11:21:34\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-02-27 14:25:01\"}}],\"deleteItems\":[]}', 'wg-framework', 'TEST', 'Redis', NULL, b'0', 'apollo', '2019-02-27 14:25:01', 'apollo', '2019-02-27 14:25:01');

-- ----------------------------
-- Table structure for grayreleaserule
-- ----------------------------
DROP TABLE IF EXISTS `grayreleaserule`;
CREATE TABLE `grayreleaserule`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Cluster Name',
  `NamespaceName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Namespace Name',
  `BranchName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'branch name',
  `Rules` varchar(16000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '[]' COMMENT '灰度规则',
  `ReleaseId` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '灰度对应的release',
  `BranchStatus` tinyint(2) DEFAULT 1 COMMENT '灰度分支状态: 0:删除分支,1:正在使用的规则 2：全量发布',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_Namespace`(`AppId`, `ClusterName`, `NamespaceName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '灰度规则表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for instance
-- ----------------------------
DROP TABLE IF EXISTS `instance`;
CREATE TABLE `instance`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `DataCenter` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Data Center Name',
  `Ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'instance ip',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_UNIQUE_KEY`(`AppId`, `ClusterName`, `Ip`, `DataCenter`) USING BTREE,
  INDEX `IX_IP`(`Ip`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '使用配置的应用实例' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of instance
-- ----------------------------
INSERT INTO `instance` VALUES (1, 'wg-framework', 'TEST', '', '192.168.50.120', '2019-02-27 14:25:35', '2019-02-27 14:25:35');

-- ----------------------------
-- Table structure for instanceconfig
-- ----------------------------
DROP TABLE IF EXISTS `instanceconfig`;
CREATE TABLE `instanceconfig`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `InstanceId` int(11) UNSIGNED DEFAULT NULL COMMENT 'Instance Id',
  `ConfigAppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Config App Id',
  `ConfigClusterName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Config Cluster Name',
  `ConfigNamespaceName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Config Namespace Name',
  `ReleaseKey` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '发布的Key',
  `ReleaseDeliveryTime` timestamp(0) DEFAULT NULL COMMENT '配置获取时间',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_UNIQUE_KEY`(`InstanceId`, `ConfigAppId`, `ConfigNamespaceName`) USING BTREE,
  INDEX `IX_ReleaseKey`(`ReleaseKey`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_Valid_Namespace`(`ConfigAppId`, `ConfigClusterName`, `ConfigNamespaceName`, `DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用实例的配置信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of instanceconfig
-- ----------------------------
INSERT INTO `instanceconfig` VALUES (1, 1, 'wg-framework', 'TEST', 'Jdbc', '20190227142514-c42977f5e6c6f743', '2019-02-27 14:25:34', '2019-02-27 14:25:34', '2019-02-27 14:25:34');
INSERT INTO `instanceconfig` VALUES (2, 1, 'wg-framework', 'TEST', 'Redis', '20190227143209-926977f5e6c6f744', '2019-02-27 14:32:10', '2019-02-27 14:25:34', '2019-02-27 14:32:11');
INSERT INTO `instanceconfig` VALUES (3, 1, 'wg-framework', 'default', 'Swagger', '20190227140607-6aa977f5e6c6f742', '2019-02-27 14:25:34', '2019-02-27 14:25:34', '2019-02-27 14:25:34');

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `NamespaceId` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '集群NamespaceId',
  `Key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置项值',
  `Comment` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '注释',
  `LineNum` int(10) UNSIGNED DEFAULT 0 COMMENT '行号',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_GroupId`(`NamespaceId`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置项目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES (1, 1, 'timeout', '100', 'sample timeout配置', 1, b'1', 'default', '2019-02-27 10:07:03', 'apollo', '2019-02-27 10:14:15');
INSERT INTO `item` VALUES (3, 29, 'druid.type', 'com.alibaba.druid.pool.DruidDataSource', '连接池对象', 1, b'0', 'apollo', '2019-02-27 10:57:48', 'apollo', '2019-02-27 13:58:20');
INSERT INTO `item` VALUES (4, 28, 'druid.type', 'com.alibaba.druid.pool.DruidDataSource', '连接池对象', 1, b'0', 'apollo', '2019-02-27 10:57:48', 'apollo', '2019-02-27 13:59:24');
INSERT INTO `item` VALUES (5, 29, 'druid.readSize', '2', '从库数量', 2, b'0', 'apollo', '2019-02-27 10:58:16', 'apollo', '2019-02-27 13:58:23');
INSERT INTO `item` VALUES (6, 28, 'druid.readSize', '2', '从库数量', 2, b'0', 'apollo', '2019-02-27 10:58:16', 'apollo', '2019-02-27 13:59:24');
INSERT INTO `item` VALUES (7, 29, 'druid.master.url', 'jdbc:mysql://192.168.50.120:3306/wg_base', '主库连接地址', 3, b'0', 'apollo', '2019-02-27 10:58:54', 'apollo', '2019-02-27 14:24:16');
INSERT INTO `item` VALUES (8, 28, 'druid.master.url', 'jdbc:mysql://192.168.50.109:3306/wg_base', '主库连接地址', 3, b'0', 'apollo', '2019-02-27 10:58:54', 'apollo', '2019-02-27 13:59:27');
INSERT INTO `item` VALUES (9, 29, 'druid.master.driver-class-name', 'com.mysql.jdbc.Driver', '主库连接对象', 4, b'0', 'apollo', '2019-02-27 10:59:26', 'apollo', '2019-02-27 13:58:33');
INSERT INTO `item` VALUES (10, 28, 'druid.master.driver-class-name', 'com.mysql.jdbc.Driver', '主库连接对象', 4, b'0', 'apollo', '2019-02-27 10:59:26', 'apollo', '2019-02-27 13:59:26');
INSERT INTO `item` VALUES (11, 28, 'druid.master.username', 'root', '主库用户名', 5, b'0', 'apollo', '2019-02-27 11:00:58', 'apollo', '2019-02-27 13:59:27');
INSERT INTO `item` VALUES (12, 29, 'druid.master.username', 'root', '主库用户名', 5, b'0', 'apollo', '2019-02-27 11:00:58', 'apollo', '2019-02-27 13:58:34');
INSERT INTO `item` VALUES (13, 28, 'druid.master.password', '123456', '主库密码', 6, b'0', 'apollo', '2019-02-27 11:01:27', 'apollo', '2019-02-27 13:59:31');
INSERT INTO `item` VALUES (14, 29, 'druid.master.password', '123456', '主库密码', 6, b'0', 'apollo', '2019-02-27 11:01:27', 'apollo', '2019-02-27 13:58:35');
INSERT INTO `item` VALUES (15, 28, 'druid.master.initial-size', '5', '主库初始化连接数', 7, b'0', 'apollo', '2019-02-27 11:02:06', 'apollo', '2019-02-27 13:59:28');
INSERT INTO `item` VALUES (16, 29, 'druid.master.initial-size', '5', '主库初始化连接数', 7, b'0', 'apollo', '2019-02-27 11:02:06', 'apollo', '2019-02-27 13:58:36');
INSERT INTO `item` VALUES (17, 29, 'druid.master.min-idle', '1', '主库最少连接池数', 8, b'0', 'apollo', '2019-02-27 11:02:44', 'apollo', '2019-02-27 13:58:37');
INSERT INTO `item` VALUES (18, 28, 'druid.master.min-idle', '1', '主库最少连接池数', 8, b'0', 'apollo', '2019-02-27 11:02:44', 'apollo', '2019-02-27 13:59:33');
INSERT INTO `item` VALUES (19, 28, 'druid.master.max-active', '100', '主库最大激活连接数', 9, b'0', 'apollo', '2019-02-27 11:03:37', 'apollo', '2019-02-27 13:59:32');
INSERT INTO `item` VALUES (20, 29, 'druid.master.max-active', '100', '主库最大激活连接数', 9, b'0', 'apollo', '2019-02-27 11:03:37', 'apollo', '2019-02-27 13:58:38');
INSERT INTO `item` VALUES (21, 28, 'druid.master.test-on-borrow', 'true', '检测池里连接的可用性，非生产环境开启', 10, b'0', 'apollo', '2019-02-27 11:07:22', 'apollo', '2019-02-27 13:59:34');
INSERT INTO `item` VALUES (22, 29, 'druid.master.test-on-borrow', 'true', '检测池里连接的可用性，非生产环境开启', 10, b'0', 'apollo', '2019-02-27 11:07:22', 'apollo', '2019-02-27 13:58:39');
INSERT INTO `item` VALUES (23, 28, 'druid.slave.url', 'jdbc:mysql://192.168.50.109:3306/wg_base', '从库1连接地址', 11, b'0', 'apollo', '2019-02-27 11:08:48', 'apollo', '2019-02-27 13:59:35');
INSERT INTO `item` VALUES (24, 29, 'druid.slave.url', 'jdbc:mysql://192.168.50.120:3306/wg_base', '从库1连接地址', 11, b'0', 'apollo', '2019-02-27 11:08:48', 'apollo', '2019-02-27 14:24:43');
INSERT INTO `item` VALUES (26, 29, 'druid.slave.urldriver-class-name', 'com.mysql.jdbc.Driver', '从库连接对象', 12, b'0', 'apollo', '2019-02-27 11:09:12', 'apollo', '2019-02-27 13:58:41');
INSERT INTO `item` VALUES (27, 28, 'druid.slave.username', 'root', '从库1用户名', 13, b'0', 'apollo', '2019-02-27 11:09:51', 'apollo', '2019-02-27 13:59:36');
INSERT INTO `item` VALUES (28, 29, 'druid.slave.username', 'root', '从库用户名', 13, b'0', 'apollo', '2019-02-27 11:09:51', 'apollo', '2019-02-27 13:58:42');
INSERT INTO `item` VALUES (29, 28, 'druid.slave.password', '123456', '从库1密码', 14, b'0', 'apollo', '2019-02-27 11:10:37', 'apollo', '2019-02-27 13:59:36');
INSERT INTO `item` VALUES (30, 29, 'druid.slave.password', '123456', '从库1密码', 14, b'0', 'apollo', '2019-02-27 11:10:37', 'apollo', '2019-02-27 13:58:43');
INSERT INTO `item` VALUES (31, 29, 'druid.slave.initial-size', '5', '从库1初始化连接数', 15, b'0', 'apollo', '2019-02-27 11:11:03', 'apollo', '2019-02-27 13:58:47');
INSERT INTO `item` VALUES (32, 28, 'druid.slave.initial-size', '5', '从库1初始化连接数', 15, b'0', 'apollo', '2019-02-27 11:11:03', 'apollo', '2019-02-27 13:59:38');
INSERT INTO `item` VALUES (33, 28, 'druid.slave.min-idle', '1', '从库1最少连接数', 16, b'0', 'apollo', '2019-02-27 11:11:24', 'apollo', '2019-02-27 13:59:38');
INSERT INTO `item` VALUES (34, 29, 'druid.slave.min-idle', '1', '从库1最少连接数', 16, b'0', 'apollo', '2019-02-27 11:11:24', 'apollo', '2019-02-27 13:58:46');
INSERT INTO `item` VALUES (35, 28, 'druid.slave.max-active', '100', '从库1最大连接数', 17, b'0', 'apollo', '2019-02-27 11:11:45', 'apollo', '2019-02-27 13:59:40');
INSERT INTO `item` VALUES (36, 29, 'druid.slave.max-active', '100', '从库1最大连接数', 17, b'0', 'apollo', '2019-02-27 11:11:45', 'apollo', '2019-02-27 13:58:48');
INSERT INTO `item` VALUES (37, 28, 'druid.slave.driver-class-name', 'com.mysql.jdbc.Driver', '从库1连接对象', 18, b'0', 'apollo', '2019-02-27 11:13:15', 'apollo', '2019-02-27 13:59:40');
INSERT INTO `item` VALUES (38, 29, 'druid.slave.driver-class-name', 'com.mysql.jdbc.Driver', '从库1连接对象', 18, b'0', 'apollo', '2019-02-27 11:13:15', 'apollo', '2019-02-27 13:58:52');
INSERT INTO `item` VALUES (39, 28, 'druid.slave.test-on-borrow', 'true', '检测池里连接的可用性，非生产环境开启', 19, b'0', 'apollo', '2019-02-27 11:14:05', 'apollo', '2019-02-27 13:59:44');
INSERT INTO `item` VALUES (40, 29, 'druid.slave.test-on-borrow', 'true', NULL, 19, b'0', 'apollo', '2019-02-27 11:14:05', 'apollo', '2019-02-27 13:58:54');
INSERT INTO `item` VALUES (41, 28, 'druid.slave2.url', 'jdbc:mysql://192.168.50.109:3306/wg_base', '从库2连接地址', 20, b'0', 'apollo', '2019-02-27 11:16:41', 'apollo', '2019-02-27 13:59:45');
INSERT INTO `item` VALUES (42, 29, 'druid.slave2.url', 'jdbc:mysql://192.168.50.120:3306/wg_base', '从库2连接地址', 20, b'0', 'apollo', '2019-02-27 11:16:41', 'apollo', '2019-02-27 14:24:51');
INSERT INTO `item` VALUES (43, 28, 'druid.slave2.driver-class-name', 'com.mysql.jdbc.Driver', '从库2连接对象', 21, b'0', 'apollo', '2019-02-27 11:17:07', 'apollo', '2019-02-27 13:59:45');
INSERT INTO `item` VALUES (44, 29, 'druid.slave2.driver-class-name', 'com.mysql.jdbc.Driver', '从库2连接对象', 21, b'0', 'apollo', '2019-02-27 11:17:07', 'apollo', '2019-02-27 13:58:56');
INSERT INTO `item` VALUES (45, 28, 'druid.slave2.username', 'root', '从库2用户名', 22, b'0', 'apollo', '2019-02-27 11:17:27', 'apollo', '2019-02-27 13:59:46');
INSERT INTO `item` VALUES (46, 29, 'druid.slave2.username', 'root', '从库2用户名', 22, b'0', 'apollo', '2019-02-27 11:17:27', 'apollo', '2019-02-27 13:58:58');
INSERT INTO `item` VALUES (47, 29, 'druid.slave2.password', '123456', '从库2密码', 23, b'0', 'apollo', '2019-02-27 11:17:43', 'apollo', '2019-02-27 13:58:59');
INSERT INTO `item` VALUES (48, 28, 'druid.slave2.password', '123456', '从库2密码', 23, b'0', 'apollo', '2019-02-27 11:17:43', 'apollo', '2019-02-27 13:59:47');
INSERT INTO `item` VALUES (49, 28, 'druid.slave2.initial-size', '5', '从库2初始化连接数', 24, b'0', 'apollo', '2019-02-27 11:18:08', 'apollo', '2019-02-27 13:59:47');
INSERT INTO `item` VALUES (50, 29, 'druid.slave2.initial-size', '5', '从库2初始化连接数', 24, b'0', 'apollo', '2019-02-27 11:18:08', 'apollo', '2019-02-27 13:59:00');
INSERT INTO `item` VALUES (51, 28, 'druid.slave2.min-idle', '1', '从库2最少连接数', 25, b'0', 'apollo', '2019-02-27 11:18:27', 'apollo', '2019-02-27 13:59:48');
INSERT INTO `item` VALUES (52, 29, 'druid.slave2.min-idle', '1', '从库2最少连接数', 25, b'0', 'apollo', '2019-02-27 11:18:27', 'apollo', '2019-02-27 13:59:01');
INSERT INTO `item` VALUES (53, 28, 'druid.slave2.max-active', '100', '从库2最大连接数', 26, b'0', 'apollo', '2019-02-27 11:18:45', 'apollo', '2019-02-27 13:59:49');
INSERT INTO `item` VALUES (54, 29, 'druid.slave2.max-active', '100', '从库2最大连接数', 26, b'0', 'apollo', '2019-02-27 11:18:45', 'apollo', '2019-02-27 13:59:02');
INSERT INTO `item` VALUES (55, 29, 'druid.slave2.test-on-borrow', 'true', NULL, 27, b'0', 'apollo', '2019-02-27 11:19:02', 'apollo', '2019-02-27 13:59:03');
INSERT INTO `item` VALUES (56, 28, 'druid.slave2.test-on-borrow', 'true', '检测池里连接的可用性，非生产环境开启', 27, b'0', 'apollo', '2019-02-27 11:19:02', 'apollo', '2019-02-27 13:59:50');
INSERT INTO `item` VALUES (57, 33, 'spring.redis.database', '0', NULL, 1, b'0', 'apollo', '2019-02-27 11:21:02', 'apollo', '2019-02-27 14:05:14');
INSERT INTO `item` VALUES (58, 32, 'spring.redis.database', '0', NULL, 1, b'0', 'apollo', '2019-02-27 11:21:02', 'apollo', '2019-02-27 14:05:09');
INSERT INTO `item` VALUES (59, 33, 'spring.redis.host', '192.168.50.120', 'redis地址', 2, b'0', 'apollo', '2019-02-27 11:21:34', 'apollo', '2019-02-27 14:25:01');
INSERT INTO `item` VALUES (60, 32, 'spring.redis.host', '192.168.50.109', 'redis地址', 2, b'0', 'apollo', '2019-02-27 11:21:34', 'apollo', '2019-02-27 14:05:10');
INSERT INTO `item` VALUES (61, 32, 'spring.redis.port', '6379', 'redis端口', 3, b'0', 'apollo', '2019-02-27 11:21:54', 'apollo', '2019-02-27 14:05:11');
INSERT INTO `item` VALUES (62, 33, 'spring.redis.port', '6379', 'redis端口', 3, b'0', 'apollo', '2019-02-27 11:21:54', 'apollo', '2019-02-27 14:05:16');
INSERT INTO `item` VALUES (63, 32, 'spring.redis.password', '123456', 'redis密码', 4, b'0', 'apollo', '2019-02-27 11:22:09', 'apollo', '2019-02-27 14:05:12');
INSERT INTO `item` VALUES (64, 33, 'spring.redis.password', '123456', 'redis密码', 4, b'0', 'apollo', '2019-02-27 11:22:09', 'apollo', '2019-02-27 14:05:17');
INSERT INTO `item` VALUES (65, 33, 'spring.cache.type', 'redis', '缓存类型', 5, b'0', 'apollo', '2019-02-27 11:22:35', 'apollo', '2019-02-27 14:05:18');
INSERT INTO `item` VALUES (66, 32, 'spring.cache.type', 'redis', '缓存类型', 5, b'0', 'apollo', '2019-02-27 11:22:35', 'apollo', '2019-02-27 14:05:12');
INSERT INTO `item` VALUES (67, 32, 'spring.cache.cache-names', 'wg-base', '缓存键', 6, b'0', 'apollo', '2019-02-27 11:23:07', 'apollo', '2019-02-27 14:05:13');
INSERT INTO `item` VALUES (68, 33, 'spring.cache.cache-names', 'wg-base', '缓存键', 6, b'0', 'apollo', '2019-02-27 11:23:07', 'apollo', '2019-02-27 14:05:19');
INSERT INTO `item` VALUES (69, 34, 'swagger.enable', 'true', '开启swagger', 1, b'0', 'apollo', '2019-02-27 11:25:19', 'apollo', '2019-02-27 14:05:41');
INSERT INTO `item` VALUES (70, 35, 'swagger.enable', 'true', '开启swagger', 1, b'1', 'apollo', '2019-02-27 11:25:19', 'apollo', '2019-02-27 14:05:43');

-- ----------------------------
-- Table structure for namespace
-- ----------------------------
DROP TABLE IF EXISTS `namespace`;
CREATE TABLE `namespace`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Cluster Name',
  `NamespaceName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Namespace Name',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId_ClusterName_NamespaceName`(`AppId`(191), `ClusterName`(191), `NamespaceName`(191)) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_NamespaceName`(`NamespaceName`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '命名空间' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of namespace
-- ----------------------------
INSERT INTO `namespace` VALUES (1, 'SampleApp', 'default', 'application', b'1', 'default', '2019-02-27 10:07:03', 'apollo', '2019-02-27 10:37:16');
INSERT INTO `namespace` VALUES (2, 'wg-framework', 'default', 'application', b'1', 'arno', '2019-02-27 10:21:20', 'apollo', '2019-02-27 10:40:34');
INSERT INTO `namespace` VALUES (3, 'wg-framework', 'default', 'application', b'1', 'apollo', '2019-02-27 10:40:39', 'apollo', '2019-02-27 10:57:01');
INSERT INTO `namespace` VALUES (28, 'wg-framework', 'default', 'Jdbc', b'0', 'apollo', '2019-02-27 13:55:30', 'apollo', '2019-02-27 13:55:30');
INSERT INTO `namespace` VALUES (29, 'wg-framework', 'TEST', 'Jdbc', b'0', 'apollo', '2019-02-27 13:55:30', 'apollo', '2019-02-27 13:55:30');
INSERT INTO `namespace` VALUES (30, 'wg-framework', 'default', 'application', b'0', 'apollo', '2019-02-27 14:02:23', 'apollo', '2019-02-27 14:02:23');
INSERT INTO `namespace` VALUES (31, 'wg-framework', 'TEST', 'application', b'0', 'apollo', '2019-02-27 14:02:23', 'apollo', '2019-02-27 14:02:23');
INSERT INTO `namespace` VALUES (32, 'wg-framework', 'default', 'Redis', b'0', 'apollo', '2019-02-27 14:02:54', 'apollo', '2019-02-27 14:02:54');
INSERT INTO `namespace` VALUES (33, 'wg-framework', 'TEST', 'Redis', b'0', 'apollo', '2019-02-27 14:02:54', 'apollo', '2019-02-27 14:02:54');
INSERT INTO `namespace` VALUES (34, 'wg-framework', 'default', 'Swagger', b'0', 'apollo', '2019-02-27 14:05:36', 'apollo', '2019-02-27 14:05:36');
INSERT INTO `namespace` VALUES (35, 'wg-framework', 'TEST', 'Swagger', b'0', 'apollo', '2019-02-27 14:05:36', 'apollo', '2019-02-27 14:05:36');

-- ----------------------------
-- Table structure for namespacelock
-- ----------------------------
DROP TABLE IF EXISTS `namespacelock`;
CREATE TABLE `namespacelock`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `NamespaceId` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '集群NamespaceId',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'default' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  `IsDeleted` bit(1) DEFAULT b'0' COMMENT '软删除',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_NamespaceId`(`NamespaceId`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'namespace的编辑锁' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for release
-- ----------------------------
DROP TABLE IF EXISTS `release`;
CREATE TABLE `release`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `ReleaseKey` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '发布的Key',
  `Name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '发布名字',
  `Comment` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发布说明',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `Configurations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发布配置',
  `IsAbandoned` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否废弃',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId_ClusterName_GroupName`(`AppId`(191), `ClusterName`(191), `NamespaceName`(191)) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_ReleaseKey`(`ReleaseKey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发布' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of release
-- ----------------------------
INSERT INTO `release` VALUES (1, '20161009155425-d3a0749c6e20bc15', '20161009155424-release', 'Sample发布', 'SampleApp', 'default', 'application', '{\"timeout\":\"100\"}', b'0', b'1', 'default', '2019-02-27 10:07:03', 'apollo', '2019-02-27 10:37:15');
INSERT INTO `release` VALUES (2, '20190227140215-605a77f5e6c6f740', '20190227140211-release', '', 'wg-framework', 'default', 'Jdbc', '{\"druid.slave2.driver-class-name\":\"com.mysql.jdbc.Driver\",\"druid.type\":\"com.alibaba.druid.pool.DruidDataSource\",\"druid.slave.test-on-borrow\":\"true\",\"druid.master.driver-class-name\":\"com.mysql.jdbc.Driver\",\"druid.slave.driver-class-name\":\"com.mysql.jdbc.Driver\",\"druid.slave2.initial-size\":\"5\",\"druid.slave2.test-on-borrow\":\"true\",\"druid.master.test-on-borrow\":\"true\",\"druid.master.password\":\"123456\",\"druid.slave.username\":\"root\",\"druid.master.initial-size\":\"5\",\"druid.slave.initial-size\":\"5\",\"druid.slave.url\":\"jdbc:mysql://192.168.50.109:3306/wg_base\",\"druid.slave2.min-idle\":\"1\",\"druid.readSize\":\"2\",\"druid.master.max-active\":\"100\",\"druid.master.min-idle\":\"1\",\"druid.slave.max-active\":\"100\",\"druid.slave2.max-active\":\"100\",\"druid.master.url\":\"jdbc:mysql://192.168.50.109:3306/wg_base\",\"druid.slave2.password\":\"123456\",\"druid.slave2.url\":\"jdbc:mysql://192.168.50.109:3306/wg_base\",\"druid.slave.password\":\"123456\",\"druid.slave2.username\":\"root\",\"druid.slave.min-idle\":\"1\",\"druid.master.username\":\"root\"}', b'0', b'0', 'apollo', '2019-02-27 14:02:15', 'apollo', '2019-02-27 14:02:15');
INSERT INTO `release` VALUES (3, '20190227140600-2e9a77f5e6c6f741', '20190227140558-release', '', 'wg-framework', 'default', 'Redis', '{\"spring.redis.database\":\"0\",\"spring.redis.password\":\"123456\",\"spring.cache.type\":\"redis\",\"spring.redis.host\":\"192.168.50.109\",\"spring.cache.cache-names\":\"wg-base\",\"spring.redis.port\":\"6379\"}', b'0', b'0', 'apollo', '2019-02-27 14:06:01', 'apollo', '2019-02-27 14:06:01');
INSERT INTO `release` VALUES (4, '20190227140607-6aa977f5e6c6f742', '20190227140606-release', '', 'wg-framework', 'default', 'Swagger', '{\"swagger.enable\":\"true\"}', b'0', b'0', 'apollo', '2019-02-27 14:06:08', 'apollo', '2019-02-27 14:06:08');
INSERT INTO `release` VALUES (5, '20190227142514-c42977f5e6c6f743', '20190227142512-release', '', 'wg-framework', 'TEST', 'Jdbc', '{\"druid.slave2.driver-class-name\":\"com.mysql.jdbc.Driver\",\"druid.type\":\"com.alibaba.druid.pool.DruidDataSource\",\"druid.slave.test-on-borrow\":\"true\",\"druid.master.driver-class-name\":\"com.mysql.jdbc.Driver\",\"druid.slave.driver-class-name\":\"com.mysql.jdbc.Driver\",\"druid.slave2.initial-size\":\"5\",\"druid.slave2.test-on-borrow\":\"true\",\"druid.master.test-on-borrow\":\"true\",\"druid.master.password\":\"123456\",\"druid.slave.username\":\"root\",\"druid.master.initial-size\":\"5\",\"druid.slave.initial-size\":\"5\",\"druid.slave.url\":\"jdbc:mysql://192.168.50.120:3306/wg_base\",\"druid.slave2.min-idle\":\"1\",\"druid.readSize\":\"2\",\"druid.master.max-active\":\"100\",\"druid.master.min-idle\":\"1\",\"druid.slave.max-active\":\"100\",\"druid.slave2.max-active\":\"100\",\"druid.master.url\":\"jdbc:mysql://192.168.50.120:3306/wg_base\",\"druid.slave2.password\":\"123456\",\"druid.slave.urldriver-class-name\":\"com.mysql.jdbc.Driver\",\"druid.slave2.url\":\"jdbc:mysql://192.168.50.120:3306/wg_base\",\"druid.slave.password\":\"123456\",\"druid.slave2.username\":\"root\",\"druid.slave.min-idle\":\"1\",\"druid.master.username\":\"root\"}', b'0', b'0', 'apollo', '2019-02-27 14:25:15', 'apollo', '2019-02-27 14:25:15');
INSERT INTO `release` VALUES (6, '20190227143209-926977f5e6c6f744', '20190227143206-release', '', 'wg-framework', 'TEST', 'Redis', '{\"spring.redis.database\":\"0\",\"spring.redis.password\":\"123456\",\"spring.cache.type\":\"redis\",\"spring.redis.host\":\"192.168.50.120\",\"spring.cache.cache-names\":\"wg-base\",\"spring.redis.port\":\"6379\"}', b'0', b'0', 'apollo', '2019-02-27 14:32:10', 'apollo', '2019-02-27 14:32:10');

-- ----------------------------
-- Table structure for releasehistory
-- ----------------------------
DROP TABLE IF EXISTS `releasehistory`;
CREATE TABLE `releasehistory`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `BranchName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '发布分支名',
  `ReleaseId` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联的Release Id',
  `PreviousReleaseId` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '前一次发布的ReleaseId',
  `Operation` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发布类型，0: 普通发布，1: 回滚，2: 灰度发布，3: 灰度规则更新，4: 灰度合并回主分支发布，5: 主分支发布灰度自动发布，6: 主分支回滚灰度自动发布，7: 放弃灰度',
  `OperationContext` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发布上下文信息',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_Namespace`(`AppId`, `ClusterName`, `NamespaceName`, `BranchName`) USING BTREE,
  INDEX `IX_ReleaseId`(`ReleaseId`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发布历史' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of releasehistory
-- ----------------------------
INSERT INTO `releasehistory` VALUES (1, 'SampleApp', 'default', 'application', 'default', 1, 0, 0, '{}', b'1', 'apollo', '2019-02-27 10:07:03', 'apollo', '2019-02-27 10:37:15');
INSERT INTO `releasehistory` VALUES (2, 'wg-framework', 'default', 'Jdbc', 'default', 2, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-02-27 14:02:15', 'apollo', '2019-02-27 14:02:15');
INSERT INTO `releasehistory` VALUES (3, 'wg-framework', 'default', 'Redis', 'default', 3, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-02-27 14:06:01', 'apollo', '2019-02-27 14:06:01');
INSERT INTO `releasehistory` VALUES (4, 'wg-framework', 'default', 'Swagger', 'default', 4, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-02-27 14:06:08', 'apollo', '2019-02-27 14:06:08');
INSERT INTO `releasehistory` VALUES (5, 'wg-framework', 'TEST', 'Jdbc', 'TEST', 5, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-02-27 14:25:15', 'apollo', '2019-02-27 14:25:15');
INSERT INTO `releasehistory` VALUES (6, 'wg-framework', 'TEST', 'Redis', 'TEST', 6, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-02-27 14:32:10', 'apollo', '2019-02-27 14:32:10');

-- ----------------------------
-- Table structure for releasemessage
-- ----------------------------
DROP TABLE IF EXISTS `releasemessage`;
CREATE TABLE `releasemessage`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Message` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '发布的消息内容',
  `DataChange_LastTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_Message`(`Message`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发布消息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of releasemessage
-- ----------------------------
INSERT INTO `releasemessage` VALUES (1, 'SampleApp+default+application', '2019-02-27 10:37:16');
INSERT INTO `releasemessage` VALUES (3, 'wg-framework+default+druid', '2019-02-27 10:55:03');
INSERT INTO `releasemessage` VALUES (4, 'wg-framework+TEST+druid', '2019-02-27 10:55:10');
INSERT INTO `releasemessage` VALUES (7, 'wg-framework+default+RE', '2019-02-27 11:20:08');
INSERT INTO `releasemessage` VALUES (9, 'wg-framework+TEST+Swagger', '2019-02-27 13:34:37');
INSERT INTO `releasemessage` VALUES (10, 'wg-framework+TEST+RE', '2019-02-27 13:36:59');
INSERT INTO `releasemessage` VALUES (13, 'wg-framework+TEST+application', '2019-02-27 13:41:05');
INSERT INTO `releasemessage` VALUES (17, 'wg-framework+default+application', '2019-02-27 13:41:38');
INSERT INTO `releasemessage` VALUES (20, 'wg-framework+default+Abc', '2019-02-27 13:52:04');
INSERT INTO `releasemessage` VALUES (21, 'wg-framework+default+Jdbc.yml', '2019-02-27 13:52:13');
INSERT INTO `releasemessage` VALUES (22, 'wg-framework+default+Jdbc', '2019-02-27 14:02:15');
INSERT INTO `releasemessage` VALUES (23, 'wg-framework+default+Redis', '2019-02-27 14:06:01');
INSERT INTO `releasemessage` VALUES (24, 'wg-framework+default+Swagger', '2019-02-27 14:06:08');
INSERT INTO `releasemessage` VALUES (25, 'wg-framework+TEST+Jdbc', '2019-02-27 14:25:15');
INSERT INTO `releasemessage` VALUES (26, 'wg-framework+TEST+Redis', '2019-02-27 14:32:10');

-- ----------------------------
-- Table structure for serverconfig
-- ----------------------------
DROP TABLE IF EXISTS `serverconfig`;
CREATE TABLE `serverconfig`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Cluster` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '配置对应的集群，default为不针对特定的集群',
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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置服务自身配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of serverconfig
-- ----------------------------
INSERT INTO `serverconfig` VALUES (1, 'eureka.service.url', 'default', 'http://localhost:8080/eureka/', 'Eureka服务Url，多个service以英文逗号分隔', b'0', 'default', '2019-02-27 10:07:03', '', '2019-02-27 10:07:03');
INSERT INTO `serverconfig` VALUES (2, 'namespace.lock.switch', 'default', 'false', '一次发布只能有一个人修改开关', b'0', 'default', '2019-02-27 10:07:03', '', '2019-02-27 10:07:03');
INSERT INTO `serverconfig` VALUES (3, 'item.value.length.limit', 'default', '20000', 'item value最大长度限制', b'0', 'default', '2019-02-27 10:07:03', '', '2019-02-27 10:07:03');
INSERT INTO `serverconfig` VALUES (4, 'config-service.cache.enabled', 'default', 'false', 'ConfigService是否开启缓存，开启后能提高性能，但是会增大内存消耗！', b'0', 'default', '2019-02-27 10:07:03', '', '2019-02-27 10:07:03');
INSERT INTO `serverconfig` VALUES (5, 'item.key.length.limit', 'default', '128', 'item key 最大长度限制', b'0', 'default', '2019-02-27 10:07:03', '', '2019-02-27 10:07:03');

SET FOREIGN_KEY_CHECKS = 1;
