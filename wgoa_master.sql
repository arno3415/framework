SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for demo_user
-- ----------------------------
DROP TABLE IF EXISTS `demo_user`;
CREATE TABLE `demo_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `status` int(1) DEFAULT 0,
  `remarks` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime(0) DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '示例' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `data` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '数据',
  `type_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型编码',
  `sort` int(11) DEFAULT NULL COMMENT '排序-升序',
  `status` int(11) DEFAULT NULL COMMENT ' 状态值：0 正常；1 删除；2禁用；默认值：0',
  `create_date` timestamp(0) COMMENT '创建时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者id',
  `update_date` timestamp(0) COMMENT '更新时间',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者id',
  `remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单名称',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级id',
  `level` int(11) DEFAULT NULL COMMENT '菜单层级',
  `parent_ids` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单全路径id',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `is_show` int(11) DEFAULT NULL COMMENT '是否展示',
  `href` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地址',
  `target` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '打开方式',
  `icon` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图标',
  `bg_color` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '背景颜色',
  `permission` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限标识-shior',
  `status` int(11) DEFAULT NULL COMMENT ' 状态值：0 正常；1 删除；2禁用；默认值：0',
  `create_date` timestamp(0) COMMENT '创建时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者id',
  `update_date` timestamp(0) COMMENT '更新时间',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者id',
  `remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `role_level` int(11) DEFAULT NULL COMMENT '角色等级--0职员 1副组长 2组长 3副主管 4主管 5副经理 6经理 7区域经理 8总经理 9管理员 10超级管理员',
  `status` int(11) DEFAULT NULL COMMENT ' 状态值：0 正常；1 删除；2禁用；默认值：0',
  `create_date` timestamp(0) COMMENT '创建时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者id',
  `update_date` timestamp(0) COMMENT '更新时间',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者id',
  `remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户基础表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL COMMENT '菜单id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `status` int(11) DEFAULT NULL COMMENT ' 状态值：0 正常；1 删除；2禁用；默认值：0',
  `create_date` timestamp(0) COMMENT '创建时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者id',
  `update_date` timestamp(0) COMMENT '更新时间',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者id',
  `remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `salt` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'shiro加密盐',
  `type` int(11) DEFAULT NULL COMMENT '身份标识: 0 职工 1管理员',
  `token` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '移动端令牌',
  `device_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '移动端设备号',
  `status` int(11) DEFAULT NULL COMMENT ' 状态值：0 正常；1 删除；2禁用；默认值：0',
  `create_date` timestamp(0) COMMENT '创建时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者id',
  `update_date` timestamp(0) COMMENT '更新时间',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者id',
  `remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户基础表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_details`;
CREATE TABLE `sys_user_details`  (
  `id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL COMMENT '密码',
  `attendance_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '考勤号',
  `sex` int(11) DEFAULT NULL COMMENT '性别',
  `job_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '工号',
  `nationality_id` int(11) DEFAULT NULL COMMENT '国籍id--对应字典表',
  `birthday` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '生日',
  `department_title_id` int(11) DEFAULT NULL COMMENT '职称id',
  `entry_date` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '入职日期',
  `positive_date` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '转正日期',
  `recruitment_channel` int(11) DEFAULT NULL COMMENT '招聘渠道id--对应字典表',
  `create_date` timestamp(0) COMMENT '创建时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者id',
  `update_date` timestamp(0) COMMENT '更新时间',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者id',
  `remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '描述',
  `status` int(11) DEFAULT NULL COMMENT ' 状态值：0 正常；1 删除；2禁用；默认值：0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `status` int(11) DEFAULT NULL COMMENT ' 状态值：0 正常；1 删除；2禁用；默认值：0',
  `create_date` timestamp(0) COMMENT '创建时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者id',
  `update_date` timestamp(0) COMMENT '更新时间',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者id',
  `remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
