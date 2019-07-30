/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : venueorder

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2019-07-30 13:35:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL,
  `trigger_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `trigger_group` varchar(200) COLLATE utf8_bin NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL,
  `calendar_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL,
  `trigger_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `trigger_group` varchar(200) COLLATE utf8_bin NOT NULL,
  `cron_expression` varchar(200) COLLATE utf8_bin NOT NULL,
  `time_zone_id` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL,
  `entry_id` varchar(95) COLLATE utf8_bin NOT NULL,
  `trigger_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `trigger_group` varchar(200) COLLATE utf8_bin NOT NULL,
  `instance_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) COLLATE utf8_bin NOT NULL,
  `job_name` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `job_group` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `is_nonconcurrent` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `requests_recovery` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL,
  `job_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `job_group` varchar(200) COLLATE utf8_bin NOT NULL,
  `description` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `job_class_name` varchar(250) COLLATE utf8_bin NOT NULL,
  `is_durable` varchar(1) COLLATE utf8_bin NOT NULL,
  `is_nonconcurrent` varchar(1) COLLATE utf8_bin NOT NULL,
  `is_update_data` varchar(1) COLLATE utf8_bin NOT NULL,
  `requests_recovery` varchar(1) COLLATE utf8_bin NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', null, 'com.ruoyi.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', null, 'com.ruoyi.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', null, 'com.ruoyi.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL,
  `lock_name` varchar(40) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL,
  `trigger_group` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL,
  `instance_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'DESKTOP-O7JRS8C1564464807483', '1564464919351', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL,
  `trigger_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `trigger_group` varchar(200) COLLATE utf8_bin NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL,
  `trigger_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `trigger_group` varchar(200) COLLATE utf8_bin NOT NULL,
  `str_prop_1` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `str_prop_2` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `str_prop_3` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `bool_prop_2` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL,
  `trigger_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `trigger_group` varchar(200) COLLATE utf8_bin NOT NULL,
  `job_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `job_group` varchar(200) COLLATE utf8_bin NOT NULL,
  `description` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) COLLATE utf8_bin NOT NULL,
  `trigger_type` varchar(8) COLLATE utf8_bin NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', null, '1564464810000', '-1', '5', 'PAUSED', 'CRON', '1564464808000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', null, '1564464810000', '-1', '5', 'PAUSED', 'CRON', '1564464808000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', null, '1564464820000', '-1', '5', 'PAUSED', 'CRON', '1564464809000', '0', null, '2', '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) COLLATE utf8_bin DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '若依科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('200', '100', '0,100', '嘉定气象科普馆', '1', null, null, null, '0', '0', 'admin', '2019-07-20 11:56:11', '', null);
INSERT INTO `sys_dept` VALUES ('201', '200', '0,100,200', 'IT运维部门', '1', null, null, null, '0', '0', 'admin', '2019-07-20 11:57:08', '', null);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('19', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES ('20', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES ('21', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES ('22', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES ('23', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES ('24', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES ('25', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES ('26', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES ('27', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('28', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('100', '0', '场馆概述', '1', 'sys_introduce_type', '', 'primary', 'N', '0', 'admin', '2019-07-12 21:21:22', 'ry', '2019-07-12 21:21:32', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('101', '0', '场馆导览', '2', 'sys_introduce_type', '', 'primary', 'N', '0', 'admin', '2019-07-12 21:21:22', 'ry', '2019-07-12 21:21:32', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('102', '0', '展品介绍', '3', 'sys_introduce_type', '', 'primary', 'N', '0', 'admin', '2019-07-12 21:21:22', 'ry', '2019-07-12 21:21:32', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('103', '0', '精彩瞬间', '4', 'sys_introduce_type', '', 'primary', 'N', '0', 'admin', '2019-07-12 21:21:22', 'ry', '2019-07-12 21:21:32', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('104', '1', '待审核', '1', 'sys_order_status', null, null, 'Y', '0', 'admin', '2019-07-18 18:15:52', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('105', '2', '用户撤销', '2', 'sys_order_status', null, null, 'Y', '0', 'admin', '2019-07-18 18:16:20', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('106', '3', '驳回', '3', 'sys_order_status', null, null, 'Y', '0', 'admin', '2019-07-18 18:16:48', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('107', '4', '强制更改', '4', 'sys_order_status', null, null, 'Y', '0', 'admin', '2019-07-18 18:17:07', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('108', '5', '审核通过', '5', 'sys_order_status', null, null, 'Y', '0', 'admin', '2019-07-18 18:17:22', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('109', '1', '个人', '1', 'sys_order_type', null, null, 'Y', '0', 'admin', '2019-07-18 18:18:16', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('110', '2', '团体', '2', 'sys_order_type', null, null, 'Y', '0', 'admin', '2019-07-18 18:18:31', '', null, null);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '字典类型',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('100', '场馆介绍类型', 'sys_introduce_type', '0', 'admin', '2019-07-12 21:19:04', 'ry', '2019-07-12 21:19:13', '场馆介绍列表');
INSERT INTO `sys_dict_type` VALUES ('101', '预约状态类型', 'sys_order_status', '0', 'admin', '2019-07-18 18:15:00', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('102', '预约类型', 'sys_order_type', '0', 'admin', '2019-07-18 18:17:55', '', null, null);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8_bin NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) COLLATE utf8_bin DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8_bin NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '日志信息',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) COLLATE utf8_bin DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '操作系统',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-17 22:08:11');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-17 22:35:03');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-17 22:40:25');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-17 22:40:27');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-17 22:43:50');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-18 08:32:19');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-18 08:34:33');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-18 12:26:41');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-18 12:27:27');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-18 12:27:29');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-18 12:43:12');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-18 13:17:05');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-18 13:25:14');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-18 13:32:06');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-18 13:32:54');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-18 18:00:09');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-18 18:03:53');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-18 18:03:55');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-18 20:14:05');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-18 20:23:58');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-18 20:28:38');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-18 20:34:18');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-18 21:11:36');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-18 21:51:07');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-18 21:53:28');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-18 21:54:28');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-19 07:22:06');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-19 07:26:18');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-19 07:26:23');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-19 12:56:33');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 10:44:40');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 11:21:11');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 11:23:03');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 11:26:12');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 11:27:59');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 11:29:18');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 11:33:31');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-20 11:59:06');
INSERT INTO `sys_logininfor` VALUES ('138', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-07-20 11:59:18');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 11:59:23');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-20 12:00:21');
INSERT INTO `sys_logininfor` VALUES ('141', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 12:00:30');
INSERT INTO `sys_logininfor` VALUES ('142', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-20 12:00:41');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 12:00:43');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-20 12:01:11');
INSERT INTO `sys_logininfor` VALUES ('145', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 12:01:14');
INSERT INTO `sys_logininfor` VALUES ('146', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-20 12:02:07');
INSERT INTO `sys_logininfor` VALUES ('147', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 12:02:11');
INSERT INTO `sys_logininfor` VALUES ('148', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-20 12:25:43');
INSERT INTO `sys_logininfor` VALUES ('149', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 12:25:45');
INSERT INTO `sys_logininfor` VALUES ('150', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-20 12:32:11');
INSERT INTO `sys_logininfor` VALUES ('151', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 12:32:14');
INSERT INTO `sys_logininfor` VALUES ('152', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-20 12:33:03');
INSERT INTO `sys_logininfor` VALUES ('153', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 12:33:07');
INSERT INTO `sys_logininfor` VALUES ('154', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-20 12:33:11');
INSERT INTO `sys_logininfor` VALUES ('155', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 12:33:13');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 12:36:16');
INSERT INTO `sys_logininfor` VALUES ('157', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 12:44:13');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-20 12:47:05');
INSERT INTO `sys_logininfor` VALUES ('159', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 12:47:08');
INSERT INTO `sys_logininfor` VALUES ('160', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-20 12:47:22');
INSERT INTO `sys_logininfor` VALUES ('161', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 12:47:24');
INSERT INTO `sys_logininfor` VALUES ('162', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-20 12:48:10');
INSERT INTO `sys_logininfor` VALUES ('163', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 12:48:12');
INSERT INTO `sys_logininfor` VALUES ('164', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-20 12:48:16');
INSERT INTO `sys_logininfor` VALUES ('165', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 12:48:22');
INSERT INTO `sys_logininfor` VALUES ('166', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 12:56:52');
INSERT INTO `sys_logininfor` VALUES ('167', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 13:17:31');
INSERT INTO `sys_logininfor` VALUES ('168', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 13:19:01');
INSERT INTO `sys_logininfor` VALUES ('169', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 13:28:50');
INSERT INTO `sys_logininfor` VALUES ('170', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 14:12:50');
INSERT INTO `sys_logininfor` VALUES ('171', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 14:45:26');
INSERT INTO `sys_logininfor` VALUES ('172', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 15:49:56');
INSERT INTO `sys_logininfor` VALUES ('173', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 15:59:28');
INSERT INTO `sys_logininfor` VALUES ('174', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 16:00:46');
INSERT INTO `sys_logininfor` VALUES ('175', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 16:36:54');
INSERT INTO `sys_logininfor` VALUES ('176', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 16:41:49');
INSERT INTO `sys_logininfor` VALUES ('177', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 16:53:32');
INSERT INTO `sys_logininfor` VALUES ('178', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 17:00:45');
INSERT INTO `sys_logininfor` VALUES ('179', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-20 17:14:10');
INSERT INTO `sys_logininfor` VALUES ('180', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 17:14:13');
INSERT INTO `sys_logininfor` VALUES ('181', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 20:48:18');
INSERT INTO `sys_logininfor` VALUES ('182', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 21:14:45');
INSERT INTO `sys_logininfor` VALUES ('183', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-20 21:16:15');
INSERT INTO `sys_logininfor` VALUES ('184', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 21:16:16');
INSERT INTO `sys_logininfor` VALUES ('185', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 21:26:05');
INSERT INTO `sys_logininfor` VALUES ('186', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-20 22:15:04');
INSERT INTO `sys_logininfor` VALUES ('187', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-22 08:31:33');
INSERT INTO `sys_logininfor` VALUES ('188', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-22 08:38:42');
INSERT INTO `sys_logininfor` VALUES ('189', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-22 13:17:04');
INSERT INTO `sys_logininfor` VALUES ('190', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-22 19:10:15');
INSERT INTO `sys_logininfor` VALUES ('191', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-22 19:20:25');
INSERT INTO `sys_logininfor` VALUES ('192', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-22 19:22:49');
INSERT INTO `sys_logininfor` VALUES ('193', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-22 19:22:52');
INSERT INTO `sys_logininfor` VALUES ('194', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-22 19:38:11');
INSERT INTO `sys_logininfor` VALUES ('195', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-22 19:42:10');
INSERT INTO `sys_logininfor` VALUES ('196', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-22 19:45:21');
INSERT INTO `sys_logininfor` VALUES ('197', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-22 20:13:29');
INSERT INTO `sys_logininfor` VALUES ('198', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-22 21:08:06');
INSERT INTO `sys_logininfor` VALUES ('199', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-22 21:09:58');
INSERT INTO `sys_logininfor` VALUES ('200', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-22 21:11:14');
INSERT INTO `sys_logininfor` VALUES ('201', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-22 21:12:07');
INSERT INTO `sys_logininfor` VALUES ('202', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-22 21:13:43');
INSERT INTO `sys_logininfor` VALUES ('203', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-22 21:14:22');
INSERT INTO `sys_logininfor` VALUES ('204', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-22 21:15:07');
INSERT INTO `sys_logininfor` VALUES ('205', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-22 21:19:51');
INSERT INTO `sys_logininfor` VALUES ('206', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-22 21:23:22');
INSERT INTO `sys_logininfor` VALUES ('207', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-22 21:27:13');
INSERT INTO `sys_logininfor` VALUES ('208', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-23 12:23:22');
INSERT INTO `sys_logininfor` VALUES ('209', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-23 12:35:40');
INSERT INTO `sys_logininfor` VALUES ('210', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-23 12:43:39');
INSERT INTO `sys_logininfor` VALUES ('211', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-23 12:46:46');
INSERT INTO `sys_logininfor` VALUES ('212', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-23 12:50:13');
INSERT INTO `sys_logininfor` VALUES ('213', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-23 12:53:51');
INSERT INTO `sys_logininfor` VALUES ('214', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-23 12:55:09');
INSERT INTO `sys_logininfor` VALUES ('215', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-23 13:08:27');
INSERT INTO `sys_logininfor` VALUES ('216', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-23 13:11:37');
INSERT INTO `sys_logininfor` VALUES ('217', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-23 13:27:58');
INSERT INTO `sys_logininfor` VALUES ('218', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-24 09:20:23');
INSERT INTO `sys_logininfor` VALUES ('219', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-24 09:27:09');
INSERT INTO `sys_logininfor` VALUES ('220', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-24 12:49:29');
INSERT INTO `sys_logininfor` VALUES ('221', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-24 13:18:51');
INSERT INTO `sys_logininfor` VALUES ('222', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-24 19:07:12');
INSERT INTO `sys_logininfor` VALUES ('223', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-24 19:10:39');
INSERT INTO `sys_logininfor` VALUES ('224', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-24 19:12:57');
INSERT INTO `sys_logininfor` VALUES ('225', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-25 07:05:09');
INSERT INTO `sys_logininfor` VALUES ('226', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-25 19:18:41');
INSERT INTO `sys_logininfor` VALUES ('227', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-25 19:25:41');
INSERT INTO `sys_logininfor` VALUES ('228', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-25 19:39:30');
INSERT INTO `sys_logininfor` VALUES ('229', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-25 20:38:05');
INSERT INTO `sys_logininfor` VALUES ('230', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-25 20:50:19');
INSERT INTO `sys_logininfor` VALUES ('231', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-25 20:50:42');
INSERT INTO `sys_logininfor` VALUES ('232', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-25 20:50:46');
INSERT INTO `sys_logininfor` VALUES ('233', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-25 20:52:44');
INSERT INTO `sys_logininfor` VALUES ('234', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-25 20:53:00');
INSERT INTO `sys_logininfor` VALUES ('235', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-25 20:53:16');
INSERT INTO `sys_logininfor` VALUES ('236', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-25 20:53:20');
INSERT INTO `sys_logininfor` VALUES ('237', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-25 20:55:25');
INSERT INTO `sys_logininfor` VALUES ('238', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-25 20:55:27');
INSERT INTO `sys_logininfor` VALUES ('239', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-25 21:29:27');
INSERT INTO `sys_logininfor` VALUES ('240', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-25 21:30:00');
INSERT INTO `sys_logininfor` VALUES ('241', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-25 21:30:03');
INSERT INTO `sys_logininfor` VALUES ('242', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-25 21:30:26');
INSERT INTO `sys_logininfor` VALUES ('243', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-25 21:30:29');
INSERT INTO `sys_logininfor` VALUES ('244', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-25 21:33:14');
INSERT INTO `sys_logininfor` VALUES ('245', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-25 21:33:18');
INSERT INTO `sys_logininfor` VALUES ('246', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-25 21:33:41');
INSERT INTO `sys_logininfor` VALUES ('247', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-25 21:33:45');
INSERT INTO `sys_logininfor` VALUES ('248', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-25 21:34:25');
INSERT INTO `sys_logininfor` VALUES ('249', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-25 21:34:30');
INSERT INTO `sys_logininfor` VALUES ('250', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-25 21:35:24');
INSERT INTO `sys_logininfor` VALUES ('251', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-25 21:35:26');
INSERT INTO `sys_logininfor` VALUES ('252', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-25 21:35:51');
INSERT INTO `sys_logininfor` VALUES ('253', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-25 21:35:52');
INSERT INTO `sys_logininfor` VALUES ('254', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-25 21:36:06');
INSERT INTO `sys_logininfor` VALUES ('255', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-25 21:36:12');
INSERT INTO `sys_logininfor` VALUES ('256', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-25 21:44:37');
INSERT INTO `sys_logininfor` VALUES ('257', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-25 22:12:19');
INSERT INTO `sys_logininfor` VALUES ('258', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-07-26 13:01:23');
INSERT INTO `sys_logininfor` VALUES ('259', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-26 13:01:30');
INSERT INTO `sys_logininfor` VALUES ('260', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-26 13:17:44');
INSERT INTO `sys_logininfor` VALUES ('261', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-07-30 13:16:38');
INSERT INTO `sys_logininfor` VALUES ('262', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-30 13:16:45');
INSERT INTO `sys_logininfor` VALUES ('263', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-30 13:21:06');
INSERT INTO `sys_logininfor` VALUES ('264', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-30 13:21:08');
INSERT INTO `sys_logininfor` VALUES ('265', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-30 13:27:46');
INSERT INTO `sys_logininfor` VALUES ('266', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-30 13:33:51');
INSERT INTO `sys_logininfor` VALUES ('267', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-30 13:34:20');
INSERT INTO `sys_logininfor` VALUES ('268', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-07-30 13:34:39');
INSERT INTO `sys_logininfor` VALUES ('269', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-30 13:34:48');
INSERT INTO `sys_logininfor` VALUES ('270', 'jdkpg1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-30 13:35:06');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) COLLATE utf8_bin DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) COLLATE utf8_bin DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) COLLATE utf8_bin DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) COLLATE utf8_bin DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2022 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '30', '#', 'menuItem', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'admin', '2019-07-18 18:01:14', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '20', '#', 'menuItem', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'admin', '2019-07-18 18:01:33', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '30', '#', 'menuItem', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'admin', '2019-07-18 18:01:26', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', '/system/user', '', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', '/system/role', '', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', '/system/menu', '', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', '/system/dept', '', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', '/system/post', '', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', '/system/dict', '', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', '/system/config', '', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', '/system/notice', '', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', '#', '', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', '/monitor/online', '', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', '/monitor/job', '', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', '/monitor/data', '', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '3', '/monitor/server', '', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '表单构建', '3', '1', '/tool/build', '', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('114', '代码生成', '3', '2', '/tool/gen', '', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('115', '系统接口', '3', '3', '/tool/swagger', '', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', '/monitor/operlog', '', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', '/monitor/logininfor', '', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '#', '', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '#', '', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '#', '', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '#', '', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '#', '', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '#', '', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '#', '', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '#', '', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '#', '', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '#', '', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '#', '', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '#', '', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '#', '', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '#', '', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '#', '', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '#', '', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1016', '部门查询', '103', '1', '#', '', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1017', '部门新增', '103', '2', '#', '', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1018', '部门修改', '103', '3', '#', '', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1019', '部门删除', '103', '4', '#', '', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位查询', '104', '1', '#', '', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位新增', '104', '2', '#', '', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位修改', '104', '3', '#', '', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位删除', '104', '4', '#', '', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位导出', '104', '5', '#', '', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', '', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', '', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', '', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', '', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', '', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', '', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', '', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', '', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1033', '参数删除', '106', '4', '#', '', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', '', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1035', '公告查询', '107', '1', '#', '', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1036', '公告新增', '107', '2', '#', '', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1037', '公告修改', '107', '3', '#', '', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1038', '公告删除', '107', '4', '#', '', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', '', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', '', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1041', '详细信息', '500', '3', '#', '', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', '', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', '', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', '', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', '', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', '', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', '', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', '', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1049', '任务查询', '110', '1', '#', '', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1050', '任务新增', '110', '2', '#', '', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1051', '任务修改', '110', '3', '#', '', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1052', '任务删除', '110', '4', '#', '', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1053', '状态修改', '110', '5', '#', '', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1054', '任务详细', '110', '6', '#', '', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1055', '任务导出', '110', '7', '#', '', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1056', '生成查询', '114', '1', '#', '', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1057', '生成修改', '114', '2', '#', '', 'F', '0', 'tool:gen:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1058', '生成删除', '114', '3', '#', '', 'F', '0', 'tool:gen:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1059', '生成代码', '114', '4', '#', '', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('2000', '信息管理', '0', '0', '#', 'menuItem', 'M', '0', '', 'fa fa-bank', 'admin', '2019-07-17 22:19:20', 'admin', '2019-07-30 13:17:07', '');
INSERT INTO `sys_menu` VALUES ('2001', '场馆介绍', '2000', '1', '/venue/introduce', 'menuItem', 'C', '0', 'venue:introduce:view', '#', 'admin', '2019-07-17 22:23:30', 'admin', '2019-07-20 12:30:33', '');
INSERT INTO `sys_menu` VALUES ('2002', '预约管理', '0', '10', '#', 'menuItem', 'M', '0', '', 'fa fa-address-book-o', 'admin', '2019-07-18 18:00:56', 'admin', '2019-07-18 18:01:20', '');
INSERT INTO `sys_menu` VALUES ('2003', '预约审核', '2002', '1', '/venue/orderaudit', 'menuItem', 'C', '0', 'venue:orderaudit:view', '#', 'admin', '2019-07-18 18:02:04', 'admin', '2019-07-20 12:31:57', '');
INSERT INTO `sys_menu` VALUES ('2004', '预约统计', '2002', '2', '/venue/orderstastics', 'menuItem', 'C', '0', 'venue:orderstastics:view', '#', 'admin', '2019-07-18 18:03:21', 'admin', '2019-07-20 21:15:29', '');
INSERT INTO `sys_menu` VALUES ('2005', '历史统计', '2002', '3', '/venue/orderhisstastics', 'menuItem', 'C', '0', 'venue:orderhisstastics:view', '#', 'admin', '2019-07-18 18:03:48', 'admin', '2019-07-22 19:21:25', '');
INSERT INTO `sys_menu` VALUES ('2006', '在线查询', '2001', '1', '#', 'menuItem', 'F', '0', 'venue:introduce:list', '#', 'admin', '2019-07-20 12:36:58', '', null, '');
INSERT INTO `sys_menu` VALUES ('2007', '新增', '2001', '2', '#', 'menuItem', 'F', '0', 'venue:introduce:add', '#', 'admin', '2019-07-20 12:37:33', '', null, '');
INSERT INTO `sys_menu` VALUES ('2009', '编辑', '2001', '3', '#', 'menuItem', 'F', '0', 'venue:introduce:edit', '#', 'admin', '2019-07-20 12:38:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('2010', '删除', '2001', '4', '#', 'menuItem', 'F', '0', 'venue:introduce:remove', '#', 'admin', '2019-07-20 12:38:58', '', null, '');
INSERT INTO `sys_menu` VALUES ('2011', '在线查询', '2003', '1', '#', 'menuItem', 'F', '0', 'venue:orderaudit:list', '#', 'admin', '2019-07-20 12:39:43', '', null, '');
INSERT INTO `sys_menu` VALUES ('2013', '审核通过', '2003', '2', '#', 'menuItem', 'F', '0', 'venue:orderaudit:pass', '#', 'admin', '2019-07-20 12:40:45', '', null, '');
INSERT INTO `sys_menu` VALUES ('2014', '驳回', '2003', '3', '#', 'menuItem', 'F', '0', 'venue:orderaudit:reject', '#', 'admin', '2019-07-20 12:41:10', '', null, '');
INSERT INTO `sys_menu` VALUES ('2015', '更改时间', '2003', '4', '#', 'menuItem', 'F', '0', 'venue:orderaudit:editTime', '#', 'admin', '2019-07-20 12:47:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('2016', '在线查询', '2004', '1', '#', 'menuItem', 'F', '0', 'venue:orderstastics:list', '#', 'admin', '2019-07-20 21:15:56', '', null, '');
INSERT INTO `sys_menu` VALUES ('2017', '在线查询', '2005', '1', '#', 'menuItem', 'F', '0', 'venue:orderhisstastics:list', '#', 'admin', '2019-07-22 19:21:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('2018', '禁止预约日期设置', '2000', '2', '/venue/stopdate', 'menuItem', 'C', '0', 'venue:stopdate:view', '#', 'admin', '2019-07-30 13:18:30', '', null, '');
INSERT INTO `sys_menu` VALUES ('2019', '查询', '2018', '1', '#', 'menuItem', 'F', '0', 'venue:stopdate:list', '#', 'admin', '2019-07-30 13:19:32', '', null, '');
INSERT INTO `sys_menu` VALUES ('2020', '新增', '2018', '2', '#', 'menuItem', 'F', '0', 'venue:stopdate:add', '#', 'admin', '2019-07-30 13:20:10', 'admin', '2019-07-30 13:20:30', '');
INSERT INTO `sys_menu` VALUES ('2021', '删除', '2018', '3', '#', 'menuItem', 'F', '0', 'venue:stopdate:remove', '#', 'admin', '2019-07-30 13:20:48', '', null, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '公告标题',
  `notice_type` char(1) COLLATE utf8_bin NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '公告内容',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '方法名称',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) COLLATE utf8_bin DEFAULT '' COMMENT '请求参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) COLLATE utf8_bin DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', '1', 'admin', '研发部门', '/tool/gen/genCode/sys_notice', '127.0.0.1', '内网IP', '{}', '0', null, '2019-07-17 22:08:59');
INSERT INTO `sys_oper_log` VALUES ('101', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"场馆管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-07-17 22:19:21');
INSERT INTO `sys_oper_log` VALUES ('102', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2000\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"场馆管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"]}', '0', null, '2019-07-17 22:19:35');
INSERT INTO `sys_oper_log` VALUES ('103', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"场馆介绍\"],\"url\":[\"/venue/introduce\"],\"target\":[\"menuItem\"],\"perms\":[\"system:introduce:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-07-17 22:23:30');
INSERT INTO `sys_oper_log` VALUES ('104', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"场馆介绍\"],\"url\":[\"/venue/introduce\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-07-18 12:27:23');
INSERT INTO `sys_oper_log` VALUES ('105', '通知公告', '1', 'com.ruoyi.project.system.notice.controller.NoticeController.addSave()', '1', 'admin', '研发部门', '/system/notice/add', '127.0.0.1', '内网IP', '{\"venueId\":[\"1\"],\"introduceType\":[\"1\"],\"title\":[\"555\"],\"content\":[\"<p>55555555555555<img src=\\\"http://localhost:8090/profile/upload/2019/07/18/536e176ab8f2e6a087f9d9a73df10b09.jpg\\\" data-filename=\\\"/profile/upload/2019/07/18/536e176ab8f2e6a087f9d9a73df10b09.jpg\\\" style=\\\"width: 812px;\\\"></p>\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'notice_title\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.system.notice.mapper.NoticeMapper.insertNotice-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_notice (                               create_by,      create_time    )values(                               ?,      sysdate()   )\r\n### Cause: java.sql.SQLException: Field \'notice_title\' doesn\'t have a default value\n; Field \'notice_title\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'notice_title\' doesn\'t have a default value', '2019-07-18 12:52:21');
INSERT INTO `sys_oper_log` VALUES ('106', '通知公告', '1', 'com.ruoyi.project.system.notice.controller.NoticeController.addSave()', '1', 'admin', '研发部门', '/system/notice/add', '127.0.0.1', '内网IP', '{\"venueId\":[\"1\"],\"introduceType\":[\"1\"],\"title\":[\"111\"],\"content\":[\"<p>11111111111</p><p>1<img src=\\\"http://localhost:8090/profile/upload/2019/07/18/10ef88d44bc943921598e06e3e4adebf.png\\\" data-filename=\\\"/profile/upload/2019/07/18/10ef88d44bc943921598e06e3e4adebf.png\\\" style=\\\"width: 200px;\\\"></p>\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'notice_title\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.system.notice.mapper.NoticeMapper.insertNotice-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_notice (                               create_by,      create_time    )values(                               ?,      sysdate()   )\r\n### Cause: java.sql.SQLException: Field \'notice_title\' doesn\'t have a default value\n; Field \'notice_title\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'notice_title\' doesn\'t have a default value', '2019-07-18 12:55:05');
INSERT INTO `sys_oper_log` VALUES ('107', '通知场馆介绍', '1', 'com.ruoyi.project.venue.introduce.controller.IntroduceController.addSave()', '1', 'admin', '研发部门', '/venue/introduce/add', '127.0.0.1', '内网IP', '{\"venueId\":[\"1\"],\"introduceType\":[\"1\"],\"title\":[\"111\"],\"content\":[\"<p>1111<img src=\\\"http://localhost:8090/profile/upload/2019/07/18/37289d90defeab7dc21e6842bedb3939.png\\\" data-filename=\\\"/profile/upload/2019/07/18/37289d90defeab7dc21e6842bedb3939.png\\\" style=\\\"width: 200px;\\\"></p>\"]}', '0', null, '2019-07-18 12:56:23');
INSERT INTO `sys_oper_log` VALUES ('108', '通知场馆介绍', '2', 'com.ruoyi.project.venue.introduce.controller.IntroduceController.editSave()', '1', 'admin', '研发部门', '/venue/introduce/edit', '127.0.0.1', '内网IP', '{\"id\":[\"27\"],\"venueId\":[\"1\"],\"introduceType\":[\"3\"],\"title\":[\"111\"],\"content\":[\"<p>1111<img src=\\\"http://localhost:8090/profile/upload/2019/07/18/37289d90defeab7dc21e6842bedb3939.png\\\" data-filename=\\\"/profile/upload/2019/07/18/37289d90defeab7dc21e6842bedb3939.png\\\" style=\\\"width: 200px;\\\"></p>\"]}', '0', null, '2019-07-18 13:07:37');
INSERT INTO `sys_oper_log` VALUES ('109', '通知场馆介绍', '3', 'com.ruoyi.project.venue.introduce.controller.IntroduceController.remove()', '1', 'admin', '研发部门', '/venue/introduce/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"27\"]}', '0', null, '2019-07-18 13:07:46');
INSERT INTO `sys_oper_log` VALUES ('110', '通知场馆介绍', '2', 'com.ruoyi.project.venue.introduce.controller.IntroduceController.editSave()', '1', 'admin', '研发部门', '/venue/introduce/edit', '127.0.0.1', '内网IP', '{\"id\":[\"23\"],\"venueId\":[\"1\"],\"introduceType\":[\"1\"],\"title\":[\"211\"],\"content\":[\"<p>2sadad<img src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAABjIAAALkCAYAAAClcqzpAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAPD9SURBVHhe7P33lxzVvf8Ln1/uWs/zF9x1n7uee+/3fM+xfezjcwwiKIGEEEI55zCjUR5plCMSKEc0ikSRozBYgD1gY4PBWCaKLKIMyCT7gMHYYPs4fz+3doXuXVW7unb1tDTV1a/XWi9Qd1dVV1ftT9Wu/Z7q/qc3e/yrIGK+fHdID0RERERERERERMSG9YsvvihJkIGYQ02Fi4iIiIiIiIiIiNgoEmQg5lxT4SIiIiIiIiIiIiI2igQZiDnXVLiIiIiIiIiIiIiIjSJBBmLONRUuIiIiIiIiIiIiYqNIkIGYc02Fi4iIiIiIiIiIiNgoEmQg5lxT4SIiIiIiIiIiIiI2igQZiDnXVLiIiIiIiIiIiIiIjSJBBmLONRUuIiIiIiIiIiIiYqNIkIGYc02Fi4iIiIiIiIiIiNgoEmQg5lxT4SIiIiIiIiIiIiI2igQZiDnXVLiIiIiIiIiIiIiIjSJBBmLONRUuIiIiIiIiIiJiEX1jxHny0+nD5I5l0+TWzQvl8H3XyJ1HrpGb7twnd1++Um5cPE1+3DRUXh/e2zg/FlOCDMScaypcRERERERERETEovmDBRNl155Vsn73StlzaLPsv26LXHHTLrn9O9fIrXdfKTcd3ifrdqyUZdtXypK1C+R7c8cZl4PFkyADMeeaChcREREREREREbEovjSmn7RvWykr926U1Xs2yIartsr+W/bLVuf/u67dLtffeVDu+M7Vcs3Nl8uKzUtk5eVrZPOVm+Sq2/fKoZ0r5NVxFxqXi8WRIAMx55oKFxERERERERERsQg+M2GArNq5Vlbu3yBt29bIissvk+3X7Zbt17fLrusul53X7ZIrb98vN9yxTw5ev12WbV4o8zctlT037ZJHvr9Pjv7kKnnmx/vlzemDjMvHYkiQcQr8+IUvJODPD5qmuVf+7L8uXz4jH8de3yp//NJ/Xee9eyPThd8rleC9HnzHffj3F7bGllfWX8fQ+mnrnULlZWMWTYWLiIiIiIiIiIhY774y7kJZt+cymbN1tVx61TZZtO0SWb13gxtibLt+t+y4oV1237RP9t24R66/fa/svXarLLqsTVo3LpYrbt0lTz1+UJ57+aC89NJB+cE9G+WVUX2M74P1bxBi/PSnPyXIqJWdCjL2PSN/918y8478Tpv+owdfkj+/947mh/78f5a/hZ53fPVe+UjN1+kgw7DsiP/94GJtWdgZTYWLiIiIiIiIiIhY717Rvk423rBbtt64R9pvv1K2XL9bLtm3RXbcuFc2H7pctlx3uRtqXHn7QdlzaIdsOrBB5lzSKjMumSeXX7tBnvzJXnnnrUPy9lvXyNq1TXL5kinG98HT7Rb58oPP5C+PLJFfPfKe/O2DB+UT43T2EmScAqsPMhLuxIhiuDOjbLCMcOARstNBRoVlY801FS4iIiIiIiIiImI9+8DCqbL3rqvlhu/eKjc9cIdcc9/N0n7XtbLh2t2y4ZpdsvWGvbLthnbZeNV22X/zftl69VZZvGO1NK2cI2Nap8ruqy6VR3+0UZ59Yqe8efygLF0xWdasmys/XTTR+H54Op0vf/jYHUj2+Pin8kvjdPYSZJwCqw4yQndjRMKC0GtfyB/3aa+FJMgomqbCtfNB+Yu7v2x5T740LgcREREREREREbF2vj68tyzbsUIW7F4js7etlJmO0zctk8nrFsqYZXMcZ8u4pbNkwvLZMmWFcpaMaZsmQ2ZPkCEzxsmEhS1y9c3b5ZabVjqukFtuXCb797TJvn0', '0', null, '2019-07-18 13:10:42');
INSERT INTO `sys_oper_log` VALUES ('111', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"预约管理 \"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-address-book-o\"],\"visible\":[\"0\"]}', '0', null, '2019-07-18 18:00:57');
INSERT INTO `sys_oper_log` VALUES ('112', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"30\"],\"icon\":[\"fa fa-gear\"],\"visible\":[\"0\"]}', '0', null, '2019-07-18 18:01:14');
INSERT INTO `sys_oper_log` VALUES ('113', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2002\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"预约管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"10\"],\"icon\":[\"fa fa-address-book-o\"],\"visible\":[\"0\"]}', '0', null, '2019-07-18 18:01:20');
INSERT INTO `sys_oper_log` VALUES ('114', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"3\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统工具\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"30\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"0\"]}', '0', null, '2019-07-18 18:01:26');
INSERT INTO `sys_oper_log` VALUES ('115', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统监控\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"20\"],\"icon\":[\"fa fa-video-camera\"],\"visible\":[\"0\"]}', '0', null, '2019-07-18 18:01:34');
INSERT INTO `sys_oper_log` VALUES ('116', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2002\"],\"menuType\":[\"C\"],\"menuName\":[\"预约审核\"],\"url\":[\"/venue/orderaudit\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-07-18 18:02:04');
INSERT INTO `sys_oper_log` VALUES ('117', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2002\"],\"menuType\":[\"C\"],\"menuName\":[\"预约通国际\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-07-18 18:03:21');
INSERT INTO `sys_oper_log` VALUES ('118', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2002\"],\"menuType\":[\"C\"],\"menuName\":[\"历史统计\"],\"url\":[\"\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-07-18 18:03:48');
INSERT INTO `sys_oper_log` VALUES ('119', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2003\"],\"parentId\":[\"2002\"],\"menuType\":[\"C\"],\"menuName\":[\"预约审核\"],\"url\":[\"/venue/orderaudit\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-07-18 18:04:20');
INSERT INTO `sys_oper_log` VALUES ('120', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2004\"],\"parentId\":[\"2002\"],\"menuType\":[\"C\"],\"menuName\":[\"预约统计\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-07-18 18:04:36');
INSERT INTO `sys_oper_log` VALUES ('121', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"2002\"],\"menuType\":[\"C\"],\"menuName\":[\"历史统计\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-07-18 18:04:44');
INSERT INTO `sys_oper_log` VALUES ('122', '字典类型', '1', 'com.ruoyi.project.system.dict.controller.DictTypeController.addSave()', '1', 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"预约状态类型\"],\"dictType\":[\"sys_order_status\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2019-07-18 18:15:00');
INSERT INTO `sys_oper_log` VALUES ('123', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"待审核\"],\"dictValue\":[\"1\"],\"dictType\":[\"sys_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2019-07-18 18:15:52');
INSERT INTO `sys_oper_log` VALUES ('124', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"用户撤销\"],\"dictValue\":[\"2\"],\"dictType\":[\"sys_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2019-07-18 18:16:20');
INSERT INTO `sys_oper_log` VALUES ('125', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"驳回\"],\"dictValue\":[\"3\"],\"dictType\":[\"sys_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2019-07-18 18:16:48');
INSERT INTO `sys_oper_log` VALUES ('126', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"强制更改\"],\"dictValue\":[\"4\"],\"dictType\":[\"sys_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"4\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2019-07-18 18:17:07');
INSERT INTO `sys_oper_log` VALUES ('127', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"审核通过\"],\"dictValue\":[\"5\"],\"dictType\":[\"sys_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"5\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2019-07-18 18:17:22');
INSERT INTO `sys_oper_log` VALUES ('128', '字典类型', '1', 'com.ruoyi.project.system.dict.controller.DictTypeController.addSave()', '1', 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"预约类型\"],\"dictType\":[\"sys_order_type\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2019-07-18 18:17:55');
INSERT INTO `sys_oper_log` VALUES ('129', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"个人\"],\"dictValue\":[\"1\"],\"dictType\":[\"sys_order_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2019-07-18 18:18:17');
INSERT INTO `sys_oper_log` VALUES ('130', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"团体\"],\"dictValue\":[\"2\"],\"dictType\":[\"sys_order_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2019-07-18 18:18:31');
INSERT INTO `sys_oper_log` VALUES ('131', '预约信息通过', '3', 'com.ruoyi.project.venue.orderaudit.controller.OrderAuditController.pass()', '1', 'admin', '研发部门', '/venue/orderaudit/pass', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2\"]}', '0', null, '2019-07-20 11:21:21');
INSERT INTO `sys_oper_log` VALUES ('132', '预约信息通过', '3', 'com.ruoyi.project.venue.orderaudit.controller.OrderAuditController.pass()', '1', 'admin', '研发部门', '/venue/orderaudit/pass', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2\"]}', '0', null, '2019-07-20 11:23:11');
INSERT INTO `sys_oper_log` VALUES ('133', '预约信息通过', '3', 'com.ruoyi.project.venue.orderaudit.controller.OrderAuditController.pass()', '1', 'admin', '研发部门', '/venue/orderaudit/pass', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2\"]}', '0', null, '2019-07-20 11:26:22');
INSERT INTO `sys_oper_log` VALUES ('134', '预约信息通过', '3', 'com.ruoyi.project.venue.orderaudit.controller.OrderAuditController.pass()', '1', 'admin', '研发部门', '/venue/orderaudit/pass', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2\"]}', '1', 'Invalid bound statement (not found): com.ruoyi.project.venue.orderaudit.mapper.OrderMapper.updateStatus', '2019-07-20 11:28:10');
INSERT INTO `sys_oper_log` VALUES ('135', '预约信息通过', '3', 'com.ruoyi.project.venue.orderaudit.controller.OrderAuditController.pass()', '1', 'admin', '研发部门', '/venue/orderaudit/pass', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2\"]}', '0', null, '2019-07-20 11:29:25');
INSERT INTO `sys_oper_log` VALUES ('136', '预约信息驳回', '3', 'com.ruoyi.project.venue.orderaudit.controller.OrderAuditController.reject()', '1', 'admin', '研发部门', '/venue/orderaudit/reject', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2\"]}', '0', null, '2019-07-20 11:34:04');
INSERT INTO `sys_oper_log` VALUES ('137', '预约信息通过', '3', 'com.ruoyi.project.venue.orderaudit.controller.OrderAuditController.pass()', '1', 'admin', '研发部门', '/venue/orderaudit/pass', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2\"]}', '0', null, '2019-07-20 11:34:16');
INSERT INTO `sys_oper_log` VALUES ('138', '预约信息驳回', '3', 'com.ruoyi.project.venue.orderaudit.controller.OrderAuditController.reject()', '1', 'admin', '研发部门', '/venue/orderaudit/reject', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2\"]}', '0', null, '2019-07-20 11:34:28');
INSERT INTO `sys_oper_log` VALUES ('139', '预约信息通过', '3', 'com.ruoyi.project.venue.orderaudit.controller.OrderAuditController.pass()', '1', 'admin', null, '/venue/orderaudit/pass', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2\"]}', '0', null, '2019-07-20 11:35:17');
INSERT INTO `sys_oper_log` VALUES ('140', '角色管理', '1', 'com.ruoyi.project.system.role.controller.RoleController.addSave()', '1', 'admin', null, '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"科普馆运维人员角色\"],\"roleKey\":[\"yunwei\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2000,2001,2002,2003,2004,2005\"]}', '0', null, '2019-07-20 11:55:01');
INSERT INTO `sys_oper_log` VALUES ('141', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', null, '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"科普馆运维人员角色\"],\"roleKey\":[\"yunwei\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2000,2001,2002,2003,2004,2005\"]}', '0', null, '2019-07-20 11:55:11');
INSERT INTO `sys_oper_log` VALUES ('142', '部门管理', '1', 'com.ruoyi.project.system.dept.controller.DeptController.addSave()', '1', 'admin', null, '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"100\"],\"deptName\":[\"嘉定气象科普馆\"],\"orderNum\":[\"1\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '0', null, '2019-07-20 11:56:11');
INSERT INTO `sys_oper_log` VALUES ('143', '部门管理', '1', 'com.ruoyi.project.system.dept.controller.DeptController.addSave()', '1', 'admin', null, '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"200\"],\"deptName\":[\"IT运维部门\"],\"orderNum\":[\"1\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '0', null, '2019-07-20 11:57:08');
INSERT INTO `sys_oper_log` VALUES ('144', '用户管理', '1', 'com.ruoyi.project.system.user.controller.UserController.addSave()', '1', 'admin', null, '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"201\"],\"userName\":[\"运维人员\"],\"deptName\":[\"IT运维部门\"],\"phonenumber\":[\"18761717979\"],\"email\":[\"532279502@qq.com\"],\"loginName\":[\"jdkpg1\"],\"password\":[\"admin123\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"4\"]}', '0', null, '2019-07-20 11:58:40');
INSERT INTO `sys_oper_log` VALUES ('145', '重置密码', '2', 'com.ruoyi.project.system.user.controller.UserController.resetPwd()', '1', 'admin', '研发部门', '/system/user/resetPwd/100', '127.0.0.1', '内网IP', '{}', '0', null, '2019-07-20 11:59:38');
INSERT INTO `sys_oper_log` VALUES ('146', '重置密码', '2', 'com.ruoyi.project.system.user.controller.UserController.resetPwd()', '1', 'admin', '研发部门', '/system/user/resetPwd/100', '127.0.0.1', '内网IP', '{}', '0', null, '2019-07-20 12:00:08');
INSERT INTO `sys_oper_log` VALUES ('147', '重置密码', '2', 'com.ruoyi.project.system.user.controller.UserController.resetPwdSave()', '1', 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"100\"],\"loginName\":[\"jdkpg1\"],\"password\":[\"123456\"]}', '0', null, '2019-07-20 12:00:16');
INSERT INTO `sys_oper_log` VALUES ('148', '用户管理', '2', 'com.ruoyi.project.system.user.controller.UserController.editSave()', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"100\"],\"deptId\":[\"201\"],\"userName\":[\"运维人员\"],\"dept.deptName\":[\"IT运维部门\"],\"phonenumber\":[\"18761717979\"],\"email\":[\"532279502@qq.com\"],\"loginName\":[\"jdkpg1\"],\"sex\":[\"0\"],\"role\":[\"100\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"100\"],\"postIds\":[\"4\"]}', '0', null, '2019-07-20 12:01:08');
INSERT INTO `sys_oper_log` VALUES ('149', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2003\"],\"parentId\":[\"2002\"],\"menuType\":[\"C\"],\"menuName\":[\"预约审核\"],\"url\":[\"/venue/orderaudit\"],\"target\":[\"menuItem\"],\"perms\":[\"system:orderaudit:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-07-20 12:29:51');
INSERT INTO `sys_oper_log` VALUES ('150', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"场馆介绍\"],\"url\":[\"/venue/introduce\"],\"target\":[\"menuItem\"],\"perms\":[\"venue:introduce:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-07-20 12:30:33');
INSERT INTO `sys_oper_log` VALUES ('151', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2003\"],\"parentId\":[\"2002\"],\"menuType\":[\"C\"],\"menuName\":[\"预约审核\"],\"url\":[\"/venue/orderaudit\"],\"target\":[\"menuItem\"],\"perms\":[\"venue:orderaudit:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-07-20 12:31:58');
INSERT INTO `sys_oper_log` VALUES ('152', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"在线查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"venue:introduce:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-07-20 12:36:59');
INSERT INTO `sys_oper_log` VALUES ('153', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"venue:introduce:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-07-20 12:37:34');
INSERT INTO `sys_oper_log` VALUES ('154', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"F\"],\"menuName\":[\"编辑\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"venue:introduce:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-07-20 12:38:01');
INSERT INTO `sys_oper_log` VALUES ('155', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/2008', '127.0.0.1', '内网IP', '{}', '0', null, '2019-07-20 12:38:08');
INSERT INTO `sys_oper_log` VALUES ('156', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"编辑\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"venue:introduce:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-07-20 12:38:29');
INSERT INTO `sys_oper_log` VALUES ('157', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"venue:introduce:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-07-20 12:38:59');
INSERT INTO `sys_oper_log` VALUES ('158', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2003\"],\"menuType\":[\"F\"],\"menuName\":[\"在线查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"venue:orderaudit:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-07-20 12:39:43');
INSERT INTO `sys_oper_log` VALUES ('159', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2011\"],\"menuType\":[\"F\"],\"menuName\":[\"通过\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"venue:orderaudit:pass\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-07-20 12:40:09');
INSERT INTO `sys_oper_log` VALUES ('160', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/2012', '127.0.0.1', '内网IP', '{}', '0', null, '2019-07-20 12:40:23');
INSERT INTO `sys_oper_log` VALUES ('161', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2003\"],\"menuType\":[\"F\"],\"menuName\":[\"审核通过\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"venue:orderaudit:pass\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-07-20 12:40:45');
INSERT INTO `sys_oper_log` VALUES ('162', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2003\"],\"menuType\":[\"F\"],\"menuName\":[\"驳回\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"venue:orderaudit:reject\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-07-20 12:41:10');
INSERT INTO `sys_oper_log` VALUES ('163', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2003\"],\"menuType\":[\"F\"],\"menuName\":[\"更改时间\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"venue:orderaudit:editTime\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-07-20 12:47:02');
INSERT INTO `sys_oper_log` VALUES ('164', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"科普馆运维人员角色\"],\"roleKey\":[\"yunwei\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2000,2001,2006,2007,2009,2010,2002,2003,2011,2013,2014,2015,2004,2005\"]}', '0', null, '2019-07-20 12:48:07');
INSERT INTO `sys_oper_log` VALUES ('165', '通知场馆介绍', '3', 'com.ruoyi.project.venue.introduce.controller.IntroduceController.remove()', '1', 'jdkpg1', 'IT运维部门', '/venue/introduce/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"23\"]}', '0', null, '2019-07-20 12:50:02');
INSERT INTO `sys_oper_log` VALUES ('166', '通知场馆介绍', '1', 'com.ruoyi.project.venue.introduce.controller.IntroduceController.addSave()', '1', 'jdkpg1', 'IT运维部门', '/venue/introduce/add', '127.0.0.1', '内网IP', '{\"venueId\":[\"1\"],\"introduceType\":[\"1\"],\"title\":[\"34444\"],\"content\":[\"<p>4444444444444第三方发</p>\"]}', '0', null, '2019-07-20 12:50:14');
INSERT INTO `sys_oper_log` VALUES ('167', '通知场馆介绍', '2', 'com.ruoyi.project.venue.introduce.controller.IntroduceController.editSave()', '1', 'jdkpg1', 'IT运维部门', '/venue/introduce/edit', '127.0.0.1', '内网IP', '{\"id\":[\"28\"],\"venueId\":[\"1\"],\"introduceType\":[\"1\"],\"title\":[\"3444433333333333\"],\"content\":[\"<p>4444444444444第三方发</p><p>但是房价快速减肥看见对方sldjf</p><p>贷款放款时间放得开了禄口街道弗兰克s</p><p>大嫁风尚</p><p>的刷卡缴费是</p>\"]}', '0', null, '2019-07-20 12:50:32');
INSERT INTO `sys_oper_log` VALUES ('168', '预约信息驳回', '3', 'com.ruoyi.project.venue.orderaudit.controller.OrderAuditController.reject()', '1', 'jdkpg1', 'IT运维部门', '/venue/orderaudit/reject', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2\"]}', '0', null, '2019-07-20 12:51:50');
INSERT INTO `sys_oper_log` VALUES ('169', '预约信息通过', '3', 'com.ruoyi.project.venue.orderaudit.controller.OrderAuditController.pass()', '1', 'jdkpg1', 'IT运维部门', '/venue/orderaudit/pass', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2\"]}', '0', null, '2019-07-20 12:53:02');
INSERT INTO `sys_oper_log` VALUES ('170', '预约信息驳回', '3', 'com.ruoyi.project.venue.orderaudit.controller.OrderAuditController.reject()', '1', 'jdkpg1', 'IT运维部门', '/venue/orderaudit/reject', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2\"]}', '0', null, '2019-07-20 12:53:31');
INSERT INTO `sys_oper_log` VALUES ('171', '预约信息驳回', '3', 'com.ruoyi.project.venue.orderaudit.controller.OrderAuditController.reject()', '1', 'jdkpg1', 'IT运维部门', '/venue/orderaudit/reject', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2\"]}', '0', null, '2019-07-20 12:53:41');
INSERT INTO `sys_oper_log` VALUES ('172', '预约信息驳回', '3', 'com.ruoyi.project.venue.orderaudit.controller.OrderAuditController.reject()', '1', 'jdkpg1', 'IT运维部门', '/venue/orderaudit/reject', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2\"]}', '0', null, '2019-07-20 12:57:16');
INSERT INTO `sys_oper_log` VALUES ('173', '通知场馆介绍', '2', 'com.ruoyi.project.venue.introduce.controller.IntroduceController.editSave()', '1', 'admin', '研发部门', '/venue/introduce/edit', '127.0.0.1', '内网IP', '{\"id\":[\"24\"],\"venueId\":[\"1\"],\"introduceType\":[\"1\"],\"title\":[\"3\"],\"content\":[\"<p>35555555555555555555</p><p>哒哒哒哒哒哒多多多多多多</p><p>哒哒哒哒哒哒多多多多多</p>\"]}', '0', null, '2019-07-20 16:06:38');
INSERT INTO `sys_oper_log` VALUES ('174', '更改预约时间', '2', 'com.ruoyi.project.venue.orderaudit.controller.OrderAuditController.editTime()', '1', 'admin', '研发部门', '/venue/orderaudit/editTime', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"name\":[\"高军\"],\"w_no\":[\"fisher\"],\"telephone\":[\"15950818624\"],\"introduceType\":[\"1\",\"1\"],\"adult\":[\"5\"],\"child\":[\"5\"],\"inputTimeFmt\":[\"2019-07-27 15:30\"],\"venueName\":[\"嘉定气象科普馆\"],\"remark\":[\"\"],\"subscribe_time_id\":[\"63\"],\"alter_reason\":[\"55555\"]}', '1', 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'id\', mode=IN, javaType=class java.util.Date, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.lang.ClassCastException: java.lang.Integer cannot be cast to java.util.Date', '2019-07-20 16:54:06');
INSERT INTO `sys_oper_log` VALUES ('175', '更改预约时间', '2', 'com.ruoyi.project.venue.orderaudit.controller.OrderAuditController.editTime()', '1', 'admin', '研发部门', '/venue/orderaudit/editTime', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"name\":[\"高军\"],\"w_no\":[\"fisher\"],\"telephone\":[\"15950818624\"],\"introduceType\":[\"1\",\"1\"],\"adult\":[\"5\"],\"child\":[\"5\"],\"inputTimeFmt\":[\"2019-07-27 15:30\"],\"venueName\":[\"嘉定气象科普馆\"],\"remark\":[\"\"],\"subscribe_time_id\":[\"63\"],\"alter_reason\":[\"55555\"]}', '1', 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'id\', mode=IN, javaType=class java.util.Date, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.lang.ClassCastException: java.lang.Integer cannot be cast to java.util.Date', '2019-07-20 16:55:18');
INSERT INTO `sys_oper_log` VALUES ('176', '更改预约时间', '2', 'com.ruoyi.project.venue.orderaudit.controller.OrderAuditController.editTime()', '1', 'admin', '研发部门', '/venue/orderaudit/editTime', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"name\":[\"高军\"],\"w_no\":[\"fisher\"],\"telephone\":[\"15950818624\"],\"introduceType\":[\"1\",\"1\"],\"adult\":[\"5\"],\"child\":[\"5\"],\"inputTimeFmt\":[\"2019-07-27 15:30\"],\"venueName\":[\"嘉定气象科普馆\"],\"remark\":[\"\"],\"subscribe_time_id\":[\"51\"],\"alter_reason\":[\"66666\"]}', '1', 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'id\', mode=IN, javaType=class java.util.Date, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.lang.ClassCastException: java.lang.Integer cannot be cast to java.util.Date', '2019-07-20 17:01:57');
INSERT INTO `sys_oper_log` VALUES ('177', '更改预约时间', '2', 'com.ruoyi.project.venue.orderaudit.controller.OrderAuditController.editTime()', '1', 'admin', null, '/venue/orderaudit/editTime', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"name\":[\"高军\"],\"w_no\":[\"fisher\"],\"telephone\":[\"15950818624\"],\"introduceType\":[\"1\",\"1\"],\"adult\":[\"5\"],\"child\":[\"5\"],\"inputTimeFmt\":[\"2019-07-27 15:30\"],\"venueName\":[\"嘉定气象科普馆\"],\"remark\":[\"\"],\"subscribe_time_id\":[\"51\"],\"alter_reason\":[\"66666\"]}', '0', null, '2019-07-20 17:03:19');
INSERT INTO `sys_oper_log` VALUES ('178', '预约信息通过', '2', 'com.ruoyi.project.venue.order.controller.OrderAuditController.pass()', '1', 'admin', '研发部门', '/venue/orderaudit/pass', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '0', null, '2019-07-20 20:48:28');
INSERT INTO `sys_oper_log` VALUES ('179', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2004\"],\"parentId\":[\"2002\"],\"menuType\":[\"C\"],\"menuName\":[\"预约统计\"],\"url\":[\"/venue/orderstastics\"],\"target\":[\"menuItem\"],\"perms\":[\"venue:orderstastics:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-07-20 21:15:29');
INSERT INTO `sys_oper_log` VALUES ('180', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2004\"],\"menuType\":[\"F\"],\"menuName\":[\"在线查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"venue:orderstastics:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-07-20 21:15:56');
INSERT INTO `sys_oper_log` VALUES ('181', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"2002\"],\"menuType\":[\"C\"],\"menuName\":[\"历史统计\"],\"url\":[\"/venue/orderhisstastics\"],\"target\":[\"menuItem\"],\"perms\":[\"venue:orderhisstastics:view\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-07-22 19:21:25');
INSERT INTO `sys_oper_log` VALUES ('182', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2005\"],\"menuType\":[\"F\"],\"menuName\":[\"在线查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"venue:orderhisstastics:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-07-22 19:21:51');
INSERT INTO `sys_oper_log` VALUES ('183', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"科普馆运维人员角色\"],\"roleKey\":[\"yunwei\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2000,2001,2006,2007,2009,2010,2002,2003,2011,2013,2014,2015,2004,2016,2005,2017\"]}', '0', null, '2019-07-22 19:22:29');
INSERT INTO `sys_oper_log` VALUES ('184', '更改预约时间', '2', 'com.ruoyi.project.venue.order.controller.OrderAuditController.editTime()', '1', 'admin', '研发部门', '/venue/orderaudit/editTime', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"name\":[\"金筱玲1\"],\"w_no\":[\"筱玲1\"],\"telephone\":[\"18761717979\"],\"introduceType\":[\"1\",\"1\"],\"adult\":[\"1\"],\"child\":[\"1\"],\"inputTimeFmt\":[\"2019-07-17 09:00\"],\"venueName\":[\"嘉定气象科普馆\"],\"remark\":[\"\"],\"subscribe_time_id\":[\"58\"],\"alter_reason\":[\"\"]}', '0', null, '2019-07-25 19:29:55');
INSERT INTO `sys_oper_log` VALUES ('185', '更改预约时间', '2', 'com.ruoyi.project.venue.order.controller.OrderAuditController.editTime()', '1', 'admin', '研发部门', '/venue/orderaudit/editTime', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"name\":[\"高军1\"],\"w_no\":[\"fisher2\"],\"telephone\":[\"15950818624\"],\"introduceType\":[\"1\",\"1\"],\"adult\":[\"1\"],\"child\":[\"1\"],\"inputTimeFmt\":[\"2019-07-17 10:30\"],\"venueName\":[\"嘉定气象科普馆\"],\"remark\":[\"\"],\"subscribe_time_id\":[\"59\"],\"alter_reason\":[\"\"]}', '0', null, '2019-07-25 19:30:07');
INSERT INTO `sys_oper_log` VALUES ('186', '更改预约时间', '2', 'com.ruoyi.project.venue.order.controller.OrderAuditController.editTime()', '1', 'admin', '研发部门', '/venue/orderaudit/editTime', '127.0.0.1', '内网IP', '{\"id\":[\"3\"],\"name\":[\"金筱玲2\"],\"w_no\":[\"筱玲2\"],\"telephone\":[\"18761717979\"],\"introduceType\":[\"1\",\"1\"],\"adult\":[\"3\"],\"child\":[\"1\"],\"inputTimeFmt\":[\"2019-07-17 13:00\"],\"venueName\":[\"嘉定气象科普馆\"],\"remark\":[\"\"],\"subscribe_time_id\":[\"69\"],\"alter_reason\":[\"\"]}', '0', null, '2019-07-25 19:30:14');
INSERT INTO `sys_oper_log` VALUES ('187', '更改预约时间', '2', 'com.ruoyi.project.venue.order.controller.OrderAuditController.editTime()', '1', 'admin', '研发部门', '/venue/orderaudit/editTime', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"name\":[\"高军2\"],\"w_no\":[\"fisher3\"],\"telephone\":[\"15950818624\"],\"introduceType\":[\"1\",\"1\"],\"adult\":[\"4\"],\"child\":[\"1\"],\"inputTimeFmt\":[\"2019-07-17 15:00\"],\"venueName\":[\"嘉定气象科普馆\"],\"remark\":[\"\"],\"subscribe_time_id\":[\"73\"],\"alter_reason\":[\"\"]}', '0', null, '2019-07-25 19:30:22');
INSERT INTO `sys_oper_log` VALUES ('188', '更改预约时间', '2', 'com.ruoyi.project.venue.order.controller.OrderAuditController.editTime()', '1', 'admin', '研发部门', '/venue/orderaudit/editTime', '127.0.0.1', '内网IP', '{\"id\":[\"136\"],\"name\":[\"金筱玲3\"],\"w_no\":[\"筱玲3\"],\"telephone\":[\"15950818624\"],\"introduceType\":[\"1\",\"1\"],\"adult\":[\"5\"],\"child\":[\"1\"],\"inputTimeFmt\":[\"2019-07-18 09:00\"],\"venueName\":[\"嘉定气象科普馆\"],\"remark\":[\"\"],\"subscribe_time_id\":[\"75\"],\"alter_reason\":[\"\"]}', '0', null, '2019-07-25 19:30:33');
INSERT INTO `sys_oper_log` VALUES ('189', '更改预约时间', '2', 'com.ruoyi.project.venue.order.controller.OrderAuditController.editTime()', '1', 'admin', '研发部门', '/venue/orderaudit/editTime', '127.0.0.1', '内网IP', '{\"id\":[\"144\"],\"name\":[\"金筱玲7\"],\"w_no\":[\"筱玲7\"],\"telephone\":[\"18761717979\"],\"introduceType\":[\"1\",\"1\"],\"adult\":[\"3\"],\"child\":[\"1\"],\"inputTimeFmt\":[\"2019-07-20 09:00\"],\"venueName\":[\"嘉定气象科普馆\"],\"remark\":[\"\"],\"subscribe_time_id\":[\"73\"],\"alter_reason\":[\"\"]}', '0', null, '2019-07-25 19:30:45');
INSERT INTO `sys_oper_log` VALUES ('190', '重置密码', '2', 'com.ruoyi.project.system.user.controller.ProfileController.resetPwd()', '1', 'admin', '研发部门', '/system/user/profile/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"loginName\":[\"admin\"],\"oldPassword\":[\"admin123\"],\"newPassword\":[\"675680jj\"],\"confirm\":[\"675680jj\"]}', '0', null, '2019-07-25 20:50:37');
INSERT INTO `sys_oper_log` VALUES ('191', '个人信息', '2', 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', '1', 'jdkpg1', 'IT运维部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{}', '0', null, '2019-07-25 20:53:42');
INSERT INTO `sys_oper_log` VALUES ('192', '个人信息', '2', 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', '1', 'jdkpg1', 'IT运维部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{}', '0', null, '2019-07-25 20:53:42');
INSERT INTO `sys_oper_log` VALUES ('193', '通知场馆介绍', '2', 'com.ruoyi.project.venue.introduce.controller.IntroduceController.editSave()', '1', 'jdkpg1', 'IT运维部门', '/venue/introduce/edit', '127.0.0.1', '内网IP', '{\"id\":[\"24\"],\"venueId\":[\"1\"],\"introduceType\":[\"2\"],\"title\":[\"3\"],\"content\":[\"<p>35555555555555555555</p><p>哒哒哒哒哒哒多多多多多多</p><p>哒哒哒哒哒哒多多多多多</p>\"]}', '0', null, '2019-07-25 20:54:30');
INSERT INTO `sys_oper_log` VALUES ('194', '通知场馆介绍', '2', 'com.ruoyi.project.venue.introduce.controller.IntroduceController.editSave()', '1', 'jdkpg1', 'IT运维部门', '/venue/introduce/edit', '127.0.0.1', '内网IP', '{\"id\":[\"24\"],\"venueId\":[\"1\"],\"introduceType\":[\"4\"],\"title\":[\"3\"],\"content\":[\"<p>35555555555555555555</p><p>哒哒哒哒哒哒多多多多多多</p><p>哒哒哒哒哒哒多多多多多</p>\"]}', '0', null, '2019-07-25 20:54:46');
INSERT INTO `sys_oper_log` VALUES ('195', '通知场馆介绍', '2', 'com.ruoyi.project.venue.introduce.controller.IntroduceController.editSave()', '1', 'jdkpg1', 'IT运维部门', '/venue/introduce/edit', '127.0.0.1', '内网IP', '{\"id\":[\"25\"],\"venueId\":[\"1\"],\"introduceType\":[\"4\"],\"title\":[\"477777777777777777777777777\"],\"content\":[\"<p>4777777777777777777777777</p>\"]}', '0', null, '2019-07-25 20:55:09');
INSERT INTO `sys_oper_log` VALUES ('196', '通知场馆介绍', '2', 'com.ruoyi.project.venue.introduce.controller.IntroduceController.editSave()', '1', 'admin', '研发部门', '/venue/introduce/edit', '127.0.0.1', '内网IP', '{\"id\":[\"24\"],\"venueId\":[\"1\"],\"introduceType\":[\"1\"],\"title\":[\"3\"],\"content\":[\"<p>35555555555555555555</p><p>哒哒哒哒哒哒多多多多多多</p><p>哒哒哒哒哒哒多多多多多</p>\"]}', '0', null, '2019-07-25 21:07:29');
INSERT INTO `sys_oper_log` VALUES ('197', '通知场馆介绍', '2', 'com.ruoyi.project.venue.introduce.controller.IntroduceController.editSave()', '1', 'admin', '研发部门', '/venue/introduce/edit', '127.0.0.1', '内网IP', '{\"id\":[\"24\"],\"venueId\":[\"1\"],\"introduceType\":[\"3\"],\"title\":[\"3\"],\"content\":[\"<p>35555555555555555555</p><p>哒哒哒哒哒哒多多多多多多</p><p>哒哒哒哒哒哒多多多多多</p>\"]}', '0', null, '2019-07-25 21:07:42');
INSERT INTO `sys_oper_log` VALUES ('198', '通知场馆介绍', '2', 'com.ruoyi.project.venue.introduce.controller.IntroduceController.editSave()', '1', 'admin', '研发部门', '/venue/introduce/edit', '127.0.0.1', '内网IP', '{\"id\":[\"24\"],\"venueId\":[\"1\"],\"introduceType\":[\"3\"],\"title\":[\"3\"],\"content\":[\"<p>35555555555555555555</p><p>哒哒哒哒哒哒多多多多多多</p><p>哒哒哒哒哒哒多多多多多wwwwwww</p>\"]}', '0', null, '2019-07-25 21:07:52');
INSERT INTO `sys_oper_log` VALUES ('199', '通知场馆介绍', '2', 'com.ruoyi.project.venue.introduce.controller.IntroduceController.editSave()', '1', 'admin', '研发部门', '/venue/introduce/edit', '127.0.0.1', '内网IP', '{\"id\":[\"25\"],\"venueId\":[\"1\"],\"introduceType\":[\"4\"],\"title\":[\"477777777777777777777777777\"],\"content\":[\"<p>4777777777777777777777777dddddddd</p><p>带来了绿绿绿绿绿绿绿绿</p><p>龙东大道多多多多多多多</p><p>打卡记录了</p><p>打卡机</p><p>李经理；lldkl</p><p><br></p>\"]}', '0', null, '2019-07-25 21:08:15');
INSERT INTO `sys_oper_log` VALUES ('200', '通知场馆介绍', '2', 'com.ruoyi.project.venue.introduce.controller.IntroduceController.editSave()', '1', 'admin', '研发部门', '/venue/introduce/edit', '127.0.0.1', '内网IP', '{\"id\":[\"26\"],\"venueId\":[\"1\"],\"introduceType\":[\"2\"],\"title\":[\"ww \"],\"content\":[\"<p>wwwww</p>\"]}', '0', null, '2019-07-25 21:08:42');
INSERT INTO `sys_oper_log` VALUES ('201', '个人信息', '2', 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{}', '0', null, '2019-07-25 21:29:46');
INSERT INTO `sys_oper_log` VALUES ('202', '个人信息', '2', 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', '1', 'jdkpg1', 'IT运维部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{}', '0', null, '2019-07-25 21:30:22');
INSERT INTO `sys_oper_log` VALUES ('203', '个人信息', '2', 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{}', '0', null, '2019-07-25 21:33:36');
INSERT INTO `sys_oper_log` VALUES ('204', '个人信息', '2', 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', '1', 'jdkpg1', 'IT运维部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{}', '0', null, '2019-07-25 21:34:09');
INSERT INTO `sys_oper_log` VALUES ('205', '个人信息', '2', 'com.ruoyi.project.system.user.controller.ProfileController.update()', '1', 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"userName\":[\"系统管理员\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"sex\":[\"1\"]}', '0', null, '2019-07-25 21:35:47');
INSERT INTO `sys_oper_log` VALUES ('206', '通知场馆介绍', '2', 'com.ruoyi.project.venue.introduce.controller.IntroduceController.editSave()', '1', 'jdkpg1', 'IT运维部门', '/venue/introduce/edit', '127.0.0.1', '内网IP', '{\"id\":[\"24\"],\"venueId\":[\"1\"],\"introduceType\":[\"3\"],\"title\":[\"展品介绍\"],\"content\":[\"<p>35555555555555555555</p><p>哒哒哒哒哒哒多多多多多多</p><p>哒哒哒哒哒哒多多多多多wwwwwww</p>\"]}', '0', null, '2019-07-25 21:37:56');
INSERT INTO `sys_oper_log` VALUES ('207', '通知场馆介绍', '2', 'com.ruoyi.project.venue.introduce.controller.IntroduceController.editSave()', '1', 'jdkpg1', 'IT运维部门', '/venue/introduce/edit', '127.0.0.1', '内网IP', '{\"id\":[\"25\"],\"venueId\":[\"1\"],\"introduceType\":[\"4\"],\"title\":[\"精彩瞬间\"],\"content\":[\"<p>4777777777777777777777777dddddddd</p><p>带来了绿绿绿绿绿绿绿绿</p><p>龙东大道多多多多多多多</p><p>打卡记录了</p><p>打卡机</p><p>李经理；lldkl</p><p><br></p>\"]}', '0', null, '2019-07-25 21:38:08');
INSERT INTO `sys_oper_log` VALUES ('208', '通知场馆介绍', '2', 'com.ruoyi.project.venue.introduce.controller.IntroduceController.editSave()', '1', 'jdkpg1', 'IT运维部门', '/venue/introduce/edit', '127.0.0.1', '内网IP', '{\"id\":[\"26\"],\"venueId\":[\"1\"],\"introduceType\":[\"2\"],\"title\":[\"场馆导览\"],\"content\":[\"<p>wwwww</p>\"]}', '0', null, '2019-07-25 21:38:19');
INSERT INTO `sys_oper_log` VALUES ('209', '通知场馆介绍', '2', 'com.ruoyi.project.venue.introduce.controller.IntroduceController.editSave()', '1', 'jdkpg1', 'IT运维部门', '/venue/introduce/edit', '127.0.0.1', '内网IP', '{\"id\":[\"28\"],\"venueId\":[\"1\"],\"introduceType\":[\"1\"],\"title\":[\"场馆概述\"],\"content\":[\"<p>4444444444444第三方发</p><p>但是房价快速减肥看见对方sldjf</p><p>贷款放款时间放得开了禄口街道弗兰克s</p><p>大嫁风尚</p><p>的刷卡缴费是</p>\"]}', '0', null, '2019-07-25 21:38:34');
INSERT INTO `sys_oper_log` VALUES ('210', '更改预约时间', '2', 'com.ruoyi.project.venue.order.controller.OrderAuditController.editTime()', '1', 'admin', '研发部门', '/venue/orderaudit/editTime', '127.0.0.1', '内网IP', '{\"id\":[\"137\"],\"name\":[\"高军3\"],\"w_no\":[\"fisher4\"],\"telephone\":[\"18761717979\"],\"introduceType\":[\"1\",\"1\"],\"adult\":[\"6\"],\"child\":[\"1\"],\"inputTimeFmt\":[\"2019-07-18 10:30\"],\"venueName\":[\"嘉定气象科普馆\"],\"remark\":[\"\"],\"subscribe_time_id\":[\"81\"],\"alter_reason\":[\"\"]}', '1', '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 5\r\n### The error may exist in file [D:\\ruoyi\\louyi_ry\\target\\classes\\mybatis\\venue\\order\\OrderMapper.xml]\r\n### The error may involve com.ruoyi.project.venue.order.mapper.OrderMapper.selectSubscribePerson-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT     sum(subscribe_num) totalPerson   FROM     t_order   WHERE subscribe_time_id = #(subscribe_time_id)\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 5\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 5', '2019-07-26 13:01:48');
INSERT INTO `sys_oper_log` VALUES ('211', '更改预约时间', '2', 'com.ruoyi.project.venue.order.controller.OrderAuditController.editTime()', '1', 'admin', null, '/venue/orderaudit/editTime', '127.0.0.1', '内网IP', '{\"id\":[\"137\"],\"name\":[\"高军3\"],\"w_no\":[\"fisher4\"],\"telephone\":[\"18761717979\"],\"introduceType\":[\"1\",\"1\"],\"adult\":[\"6\"],\"child\":[\"1\"],\"inputTimeFmt\":[\"2019-07-18 10:30\"],\"venueName\":[\"嘉定气象科普馆\"],\"remark\":[\"\"],\"subscribe_time_id\":[\"73\"],\"alter_reason\":[\"\"]}', '1', '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 5\r\n### The error may exist in file [D:\\ruoyi\\louyi_ry\\target\\classes\\mybatis\\venue\\order\\OrderMapper.xml]\r\n### The error may involve com.ruoyi.project.venue.order.mapper.OrderMapper.selectSubscribePerson-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT     sum(subscribe_num) totalPerson   FROM     t_order   WHERE subscribe_time_id = #(subscribe_time_id)\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 5\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 5', '2019-07-26 13:04:54');
INSERT INTO `sys_oper_log` VALUES ('212', '更改预约时间', '2', 'com.ruoyi.project.venue.order.controller.OrderAuditController.editTime()', '1', 'admin', '研发部门', '/venue/orderaudit/editTime', '127.0.0.1', '内网IP', '{\"id\":[\"137\"],\"name\":[\"高军3\"],\"w_no\":[\"fisher4\"],\"telephone\":[\"18761717979\"],\"introduceType\":[\"1\",\"1\"],\"adult\":[\"6\"],\"child\":[\"1\"],\"inputTimeFmt\":[\"2019-07-18 10:30\"],\"venueName\":[\"嘉定气象科普馆\"],\"remark\":[\"\"],\"subscribe_time_id\":[\"74\"],\"alter_reason\":[\"\"]}', '1', '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 5\r\n### The error may exist in file [D:\\ruoyi\\louyi_ry\\target\\classes\\mybatis\\venue\\order\\OrderMapper.xml]\r\n### The error may involve com.ruoyi.project.venue.order.mapper.OrderMapper.selectSubscribePerson-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT       ifnull(sum(subscribe_num),0) totalPerson   FROM     t_order   WHERE subscribe_time_id = #(subscribe_time_id)\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 5\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 5', '2019-07-26 13:18:36');
INSERT INTO `sys_oper_log` VALUES ('213', '更改预约时间', '2', 'com.ruoyi.project.venue.order.controller.OrderAuditController.editTime()', '1', 'admin', null, '/venue/orderaudit/editTime', '127.0.0.1', '内网IP', '{\"id\":[\"137\"],\"name\":[\"高军3\"],\"w_no\":[\"fisher4\"],\"telephone\":[\"18761717979\"],\"introduceType\":[\"1\",\"1\"],\"adult\":[\"6\"],\"child\":[\"1\"],\"inputTimeFmt\":[\"2019-07-18 10:30\"],\"venueName\":[\"嘉定气象科普馆\"],\"remark\":[\"\"],\"subscribe_time_id\":[\"76\"],\"alter_reason\":[\"\"]}', '1', '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 5\r\n### The error may exist in file [D:\\ruoyi\\louyi_ry\\target\\classes\\mybatis\\venue\\order\\OrderMapper.xml]\r\n### The error may involve com.ruoyi.project.venue.order.mapper.OrderMapper.selectSubscribePerson-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT       ifnull(sum(subscribe_num),0) totalPerson   FROM     t_order   WHERE subscribe_time_id = #(subscribe_time_id)\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 5\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 5', '2019-07-26 13:19:27');
INSERT INTO `sys_oper_log` VALUES ('214', '更改预约时间', '2', 'com.ruoyi.project.venue.order.controller.OrderAuditController.editTime()', '1', 'admin', null, '/venue/orderaudit/editTime', '127.0.0.1', '内网IP', '{\"id\":[\"137\"],\"name\":[\"高军3\"],\"w_no\":[\"fisher4\"],\"telephone\":[\"18761717979\"],\"introduceType\":[\"1\",\"1\"],\"adult\":[\"6\"],\"child\":[\"1\"],\"inputTimeFmt\":[\"2019-07-18 10:30\"],\"venueName\":[\"嘉定气象科普馆\"],\"remark\":[\"\"],\"subscribe_time_id\":[\"61\"],\"alter_reason\":[\"\"]}', '1', '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 5\r\n### The error may exist in file [D:\\ruoyi\\louyi_ry\\target\\classes\\mybatis\\venue\\order\\OrderMapper.xml]\r\n### The error may involve com.ruoyi.project.venue.order.mapper.OrderMapper.selectSubscribePerson-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT       ifnull(sum(subscribe_num),0) totalPerson   FROM     t_order   WHERE subscribe_time_id = #(id)\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 5\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 5', '2019-07-26 13:20:57');
INSERT INTO `sys_oper_log` VALUES ('215', '更改预约时间', '2', 'com.ruoyi.project.venue.order.controller.OrderAuditController.editTime()', '1', 'admin', null, '/venue/orderaudit/editTime', '127.0.0.1', '内网IP', '{\"id\":[\"137\"],\"name\":[\"高军3\"],\"w_no\":[\"fisher4\"],\"telephone\":[\"18761717979\"],\"introduceType\":[\"1\",\"1\"],\"adult\":[\"6\"],\"child\":[\"1\"],\"inputTimeFmt\":[\"2019-07-18 10:30\"],\"venueName\":[\"嘉定气象科普馆\"],\"remark\":[\"\"],\"subscribe_time_id\":[\"76\"],\"alter_reason\":[\"\"]}', '0', null, '2019-07-26 13:22:38');
INSERT INTO `sys_oper_log` VALUES ('216', '更改预约时间', '2', 'com.ruoyi.project.venue.order.controller.OrderAuditController.editTime()', '1', 'admin', null, '/venue/orderaudit/editTime', '127.0.0.1', '内网IP', '{\"id\":[\"138\"],\"name\":[\"金筱玲4\"],\"w_no\":[\"筱玲4\"],\"telephone\":[\"18761717979\"],\"introduceType\":[\"1\",\"1\"],\"adult\":[\"7\"],\"child\":[\"1\"],\"inputTimeFmt\":[\"2019-07-18 13:00\"],\"venueName\":[\"嘉定气象科普馆\"],\"remark\":[\"\"],\"subscribe_time_id\":[\"65\"],\"alter_reason\":[\"\"]}', '0', null, '2019-07-26 13:24:17');
INSERT INTO `sys_oper_log` VALUES ('217', '更改预约时间', '2', 'com.ruoyi.project.venue.order.controller.OrderAuditController.editTime()', '1', 'admin', null, '/venue/orderaudit/editTime', '127.0.0.1', '内网IP', '{\"id\":[\"139\"],\"subscribe_num\":[\"9\"],\"name\":[\"高军4\"],\"w_no\":[\"fisher5\"],\"telephone\":[\"15950818624\"],\"introduceType\":[\"1\",\"1\"],\"adult\":[\"8\"],\"child\":[\"1\"],\"inputTimeFmt\":[\"2019-07-18 15:00\"],\"venueName\":[\"嘉定气象科普馆\"],\"remark\":[\"\"],\"subscribe_time_id\":[\"76\"],\"alter_reason\":[\"\"]}', '0', null, '2019-07-26 13:26:00');
INSERT INTO `sys_oper_log` VALUES ('218', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2000\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"信息管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"]}', '0', null, '2019-07-30 13:17:08');
INSERT INTO `sys_oper_log` VALUES ('219', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"禁止预约日期设置\"],\"url\":[\"/venue/stopdate\"],\"target\":[\"menuItem\"],\"perms\":[\"venue:stopdate:view\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-07-30 13:18:30');
INSERT INTO `sys_oper_log` VALUES ('220', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2018\"],\"menuType\":[\"F\"],\"menuName\":[\"查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"venue:stopdate:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-07-30 13:19:32');
INSERT INTO `sys_oper_log` VALUES ('221', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2018\"],\"menuType\":[\"F\"],\"menuName\":[\"新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-07-30 13:20:10');
INSERT INTO `sys_oper_log` VALUES ('222', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2020\"],\"parentId\":[\"2018\"],\"menuType\":[\"F\"],\"menuName\":[\"新增\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"venue:stopdate:add\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-07-30 13:20:31');
INSERT INTO `sys_oper_log` VALUES ('223', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2018\"],\"menuType\":[\"F\"],\"menuName\":[\"删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"venue:stopdate:remove\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-07-30 13:20:48');
INSERT INTO `sys_oper_log` VALUES ('224', '新增禁用日期', '1', 'com.ruoyi.project.venue.introduce.controller.StopDateController.addSave()', '1', 'admin', '研发部门', '/venue/stopdate/add', '127.0.0.1', '内网IP', '{\"stopdate\":[\"2019-07-30\"]}', '0', null, '2019-07-30 13:28:03');
INSERT INTO `sys_oper_log` VALUES ('225', '删除禁用日期', '3', 'com.ruoyi.project.venue.introduce.controller.StopDateController.remove()', '1', 'admin', '研发部门', '/venue/stopdate/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"0\"]}', '0', null, '2019-07-30 13:28:34');
INSERT INTO `sys_oper_log` VALUES ('226', '新增禁用日期', '1', 'com.ruoyi.project.venue.introduce.controller.StopDateController.addSave()', '1', 'admin', null, '/venue/stopdate/add', '127.0.0.1', '内网IP', '{\"stopdate\":[\"2019-07-24\"]}', '0', null, '2019-07-30 13:29:53');
INSERT INTO `sys_oper_log` VALUES ('227', '删除禁用日期', '3', 'com.ruoyi.project.venue.introduce.controller.StopDateController.remove()', '1', 'admin', null, '/venue/stopdate/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '0', null, '2019-07-30 13:29:58');
INSERT INTO `sys_oper_log` VALUES ('228', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"科普馆运维人员角色\"],\"roleKey\":[\"yunwei\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2000,2001,2006,2007,2009,2010,2018,2019,2020,2021,2002,2003,2011,2013,2014,2015,2004,2016,2005,2017\"]}', '0', null, '2019-07-30 13:34:16');
INSERT INTO `sys_oper_log` VALUES ('229', '删除禁用日期', '3', 'com.ruoyi.project.venue.introduce.controller.StopDateController.remove()', '1', 'jdkpg1', 'IT运维部门', '/venue/stopdate/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '0', null, '2019-07-30 13:34:56');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) COLLATE utf8_bin NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) COLLATE utf8_bin NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '1', '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '普通角色');
INSERT INTO `sys_role` VALUES ('100', '科普馆运维人员角色', 'yunwei', '3', '1', '0', '0', 'admin', '2019-07-20 11:55:01', 'admin', '2019-07-30 13:34:15', '');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '110');
INSERT INTO `sys_role_menu` VALUES ('2', '111');
INSERT INTO `sys_role_menu` VALUES ('2', '112');
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '115');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('2', '1046');
INSERT INTO `sys_role_menu` VALUES ('2', '1047');
INSERT INTO `sys_role_menu` VALUES ('2', '1048');
INSERT INTO `sys_role_menu` VALUES ('2', '1049');
INSERT INTO `sys_role_menu` VALUES ('2', '1050');
INSERT INTO `sys_role_menu` VALUES ('2', '1051');
INSERT INTO `sys_role_menu` VALUES ('2', '1052');
INSERT INTO `sys_role_menu` VALUES ('2', '1053');
INSERT INTO `sys_role_menu` VALUES ('2', '1054');
INSERT INTO `sys_role_menu` VALUES ('2', '1055');
INSERT INTO `sys_role_menu` VALUES ('2', '1056');
INSERT INTO `sys_role_menu` VALUES ('2', '1057');
INSERT INTO `sys_role_menu` VALUES ('2', '1058');
INSERT INTO `sys_role_menu` VALUES ('2', '1059');
INSERT INTO `sys_role_menu` VALUES ('100', '2000');
INSERT INTO `sys_role_menu` VALUES ('100', '2001');
INSERT INTO `sys_role_menu` VALUES ('100', '2002');
INSERT INTO `sys_role_menu` VALUES ('100', '2003');
INSERT INTO `sys_role_menu` VALUES ('100', '2004');
INSERT INTO `sys_role_menu` VALUES ('100', '2005');
INSERT INTO `sys_role_menu` VALUES ('100', '2006');
INSERT INTO `sys_role_menu` VALUES ('100', '2007');
INSERT INTO `sys_role_menu` VALUES ('100', '2009');
INSERT INTO `sys_role_menu` VALUES ('100', '2010');
INSERT INTO `sys_role_menu` VALUES ('100', '2011');
INSERT INTO `sys_role_menu` VALUES ('100', '2013');
INSERT INTO `sys_role_menu` VALUES ('100', '2014');
INSERT INTO `sys_role_menu` VALUES ('100', '2015');
INSERT INTO `sys_role_menu` VALUES ('100', '2016');
INSERT INTO `sys_role_menu` VALUES ('100', '2017');
INSERT INTO `sys_role_menu` VALUES ('100', '2018');
INSERT INTO `sys_role_menu` VALUES ('100', '2019');
INSERT INTO `sys_role_menu` VALUES ('100', '2020');
INSERT INTO `sys_role_menu` VALUES ('100', '2021');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) COLLATE utf8_bin DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) COLLATE utf8_bin DEFAULT '' COMMENT '手机号码',
  `sex` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '密码',
  `salt` varchar(20) COLLATE utf8_bin DEFAULT '' COMMENT '盐加密',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '系统管理员', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2019/07/25/3394b981bc9cc16fc1f81f4f17755350.png', '4b6a32d237d37a0dbf7903b7b08b30e8', '520e9d', '0', '0', '127.0.0.1', '2019-07-30 13:33:52', 'admin', '2018-03-16 11:33:00', 'ry', '2019-07-30 13:33:51', '管理员');
INSERT INTO `sys_user` VALUES ('2', '105', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '测试员');
INSERT INTO `sys_user` VALUES ('100', '201', 'jdkpg1', '运维人员', '00', '532279502@qq.com', '18761717979', '0', '/profile/avatar/2019/07/25/6c1133883c16219b092293d4dd0ac07f.png', '1de44ea62e410462fccc6de5a01ef196', '6109a0', '0', '0', '127.0.0.1', '2019-07-30 13:34:48', 'admin', '2019-07-20 11:58:40', 'admin', '2019-07-30 13:34:48', '');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) COLLATE utf8_bin DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');
INSERT INTO `sys_user_post` VALUES ('100', '4');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('100', '100');

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `w_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `suggest` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `input_time` datetime DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `oper_id` int(11) DEFAULT NULL,
  `feedback` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `feedback_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_message
-- ----------------------------

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `telephone` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `w_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `adult` int(11) DEFAULT NULL,
  `child` int(11) DEFAULT NULL,
  `subscribe_num` int(11) DEFAULT NULL,
  `subscribe_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `subscribe_time_id` int(11) DEFAULT NULL,
  `venue` int(11) DEFAULT NULL,
  `remark` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `input_time` datetime DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `auditor` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `audit_time` datetime DEFAULT NULL,
  `alter_reason` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1', '金筱玲1', '18761717979', '筱玲1', '1', '1', '2', '1', '58', '1', null, '2019-07-26 10:30:00', '4', null, '2019-07-25 19:29:55', '', '2019-07-17 09:00:00', '2019-07-25 19:29:55');
INSERT INTO `t_order` VALUES ('2', '高军1', '15950818624', 'fisher2', '1', '1', '2', '1', '59', '1', '', '2019-07-26 13:00:00', '4', null, '2019-07-25 19:30:07', '', '2019-07-17 10:30:00', '2019-07-25 19:30:07');
INSERT INTO `t_order` VALUES ('3', '金筱玲2', '18761717979', '筱玲2', '3', '1', '4', '1', '69', '1', '', '2019-07-30 09:00:00', '4', null, '2019-07-25 19:30:14', '', '2019-07-17 13:00:00', '2019-07-25 19:30:14');
INSERT INTO `t_order` VALUES ('4', '高军2', '15950818624', 'fisher3', '4', '1', '5', '1', '73', '1', '', '2019-07-31 09:00:00', '4', null, '2019-07-25 19:30:22', '', '2019-07-17 15:00:00', '2019-07-25 19:30:22');
INSERT INTO `t_order` VALUES ('136', '金筱玲3', '15950818624', '筱玲3', '5', '1', '6', '1', '75', '1', '', '2019-07-31 13:00:00', '4', null, '2019-07-25 19:30:33', '', '2019-07-18 09:00:00', '2019-07-25 19:30:33');
INSERT INTO `t_order` VALUES ('137', '高军3', '18761717979', 'fisher4', '6', '1', '7', '1', '76', '1', '', '2019-07-31 15:00:00', '4', null, '2019-07-26 13:22:38', '', '2019-07-18 10:30:00', '2019-07-26 13:22:38');
INSERT INTO `t_order` VALUES ('138', '金筱玲4', '18761717979', '筱玲4', '7', '1', '8', '1', '65', '1', '', '2019-07-29 09:00:00', '4', null, '2019-07-26 13:24:17', '', '2019-07-18 13:00:00', '2019-07-26 13:24:17');
INSERT INTO `t_order` VALUES ('139', '高军4', '15950818624', 'fisher5', '8', '1', '9', '1', '76', '1', '', '2019-07-31 15:00:00', '4', null, '2019-07-26 13:26:00', '', '2019-07-18 15:00:00', '2019-07-26 13:26:00');
INSERT INTO `t_order` VALUES ('140', '金筱玲5', '18761717979', '筱玲5', '9', '1', '10', '2', '33', '1', '', '2019-07-19 09:00:00', '1', null, null, null, '2019-07-19 09:00:00', '2019-07-19 09:00:00');
INSERT INTO `t_order` VALUES ('141', '高军5', '15950818624', 'fisher6', '10', '1', '11', '2', '34', '1', '', '2019-07-19 10:30:00', '1', null, null, null, '2019-07-19 10:30:00', '2019-07-19 10:30:00');
INSERT INTO `t_order` VALUES ('142', '金筱玲6', '18761717979', '筱玲6', '1', '1', '2', '1', '35', '1', '', '2019-07-19 13:00:00', '1', null, null, null, '2019-07-19 13:00:00', '2019-07-19 13:00:00');
INSERT INTO `t_order` VALUES ('143', '高军6', '15950818624', 'fisher7', '1', '1', '2', '1', '36', '1', '', '2019-07-19 15:00:00', '1', null, null, null, '2019-07-19 15:00:00', '2019-07-19 15:00:00');
INSERT INTO `t_order` VALUES ('144', '金筱玲7', '18761717979', '筱玲7', '3', '1', '4', '1', '73', '1', '', '2019-07-31 09:00:00', '4', null, '2019-07-25 19:30:44', '', '2019-07-20 09:00:00', '2019-07-25 19:30:44');
INSERT INTO `t_order` VALUES ('145', '高军7', '15950818624', 'fisher8', '4', '1', '5', '1', '38', '1', '', '2019-07-20 10:30:00', '1', null, null, null, '2019-07-20 10:30:00', '2019-07-20 10:30:00');
INSERT INTO `t_order` VALUES ('146', '金筱玲8', '18761717979', '筱玲8', '5', '1', '6', '1', '39', '1', '', '2019-07-20 13:00:00', '1', null, null, null, '2019-07-20 13:00:00', '2019-07-20 13:00:00');
INSERT INTO `t_order` VALUES ('147', '高军8', '15950818624', 'fisher9', '6', '1', '7', '1', '40', '1', '', '2019-07-20 15:00:00', '1', null, null, null, '2019-07-20 15:00:00', '2019-07-20 15:00:00');
INSERT INTO `t_order` VALUES ('148', '金筱玲9', '15950818624', '筱玲9', '7', '1', '8', '1', '41', '1', '', '2019-07-22 09:00:00', '1', null, null, null, '2019-07-22 09:00:00', '2019-07-22 09:00:00');
INSERT INTO `t_order` VALUES ('149', '高军9', '18761717979', 'fisher10', '8', '1', '9', '1', '42', '1', '', '2019-07-22 10:30:00', '1', null, null, null, '2019-07-22 10:30:00', '2019-07-22 10:30:00');
INSERT INTO `t_order` VALUES ('150', '金筱玲10', '18761717979', '筱玲10', '9', '1', '10', '2', '43', '1', '', '2019-07-22 13:00:00', '1', null, null, null, '2019-07-22 13:00:00', '2019-07-22 13:00:00');
INSERT INTO `t_order` VALUES ('151', '高军10', '15950818624', 'fisher11', '10', '1', '11', '2', '44', '1', '', '2019-07-22 15:00:00', '1', null, null, null, '2019-07-22 15:00:00', '2019-07-22 15:00:00');
INSERT INTO `t_order` VALUES ('152', '金筱玲11', '18761717979', '筱玲11', '1', '1', '2', '1', '45', '1', '', '2019-07-23 09:00:00', '1', null, null, null, '2019-07-23 09:00:00', '2019-07-23 09:00:00');
INSERT INTO `t_order` VALUES ('153', '高军11', '15950818624', 'fisher12', '1', '1', '2', '1', '46', '1', '', '2019-07-23 10:30:00', '1', null, null, null, '2019-07-23 10:30:00', '2019-07-23 10:30:00');
INSERT INTO `t_order` VALUES ('154', '金筱玲12', '18761717979', '筱玲12', '3', '1', '4', '1', '47', '1', '', '2019-07-23 13:00:00', '1', null, null, null, '2019-07-23 13:00:00', '2019-07-23 13:00:00');
INSERT INTO `t_order` VALUES ('155', '高军12', '15950818624', 'fisher', '5', '5', '10', '1', '51', '1', '', '2019-07-24 13:00:00', '4', null, null, null, '2019-07-18 19:13:45', '2019-07-20 17:03:19');

-- ----------------------------
-- Table structure for t_stopdate
-- ----------------------------
DROP TABLE IF EXISTS `t_stopdate`;
CREATE TABLE `t_stopdate` (
  `create_time` datetime DEFAULT NULL,
  `stopdate` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_stopdate
-- ----------------------------

-- ----------------------------
-- Table structure for t_subscribe
-- ----------------------------
DROP TABLE IF EXISTS `t_subscribe`;
CREATE TABLE `t_subscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weekDay` int(11) DEFAULT NULL,
  `fromDt` time DEFAULT NULL,
  `toDt` time DEFAULT NULL,
  `typeTeam` char(1) DEFAULT NULL,
  `typePerson` char(1) DEFAULT NULL,
  `venueId` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_subscribe
-- ----------------------------
INSERT INTO `t_subscribe` VALUES ('1', '1', '09:00:00', '10:30:00', '0', '1', '1', '2019-07-15 21:59:34', '2019-07-15 21:59:41');
INSERT INTO `t_subscribe` VALUES ('2', '1', '10:30:00', '12:00:00', '0', '1', '1', '2019-07-15 21:59:34', '2019-07-15 21:59:41');
INSERT INTO `t_subscribe` VALUES ('3', '1', '13:00:00', '14:30:00', '0', '1', '1', '2019-07-15 21:59:34', '2019-07-15 21:59:41');
INSERT INTO `t_subscribe` VALUES ('4', '1', '15:00:00', '16:30:00', '0', '1', '1', '2019-07-15 21:59:34', '2019-07-15 21:59:41');
INSERT INTO `t_subscribe` VALUES ('5', '2', '09:00:00', '10:30:00', '0', '1', '1', '2019-07-15 21:59:34', '2019-07-15 21:59:41');
INSERT INTO `t_subscribe` VALUES ('6', '2', '10:30:00', '12:00:00', '0', '1', '1', '2019-07-15 21:59:34', '2019-07-15 21:59:41');
INSERT INTO `t_subscribe` VALUES ('7', '2', '13:00:00', '14:30:00', '0', '1', '1', '2019-07-15 21:59:34', '2019-07-15 21:59:41');
INSERT INTO `t_subscribe` VALUES ('8', '2', '15:00:00', '16:30:00', '0', '1', '1', '2019-07-15 21:59:34', '2019-07-15 21:59:41');
INSERT INTO `t_subscribe` VALUES ('9', '3', '09:00:00', '10:30:00', '0', '1', '1', '2019-07-15 21:59:34', '2019-07-15 21:59:41');
INSERT INTO `t_subscribe` VALUES ('10', '3', '10:30:00', '12:00:00', '0', '1', '1', '2019-07-15 21:59:34', '2019-07-15 21:59:41');
INSERT INTO `t_subscribe` VALUES ('11', '3', '13:00:00', '14:30:00', '0', '0', '1', '2019-07-15 21:59:34', '2019-07-15 21:59:41');
INSERT INTO `t_subscribe` VALUES ('12', '3', '15:00:00', '16:30:00', '0', '0', '1', '2019-07-15 21:59:34', '2019-07-15 21:59:41');
INSERT INTO `t_subscribe` VALUES ('13', '4', '09:00:00', '10:30:00', '0', '1', '1', '2019-07-15 21:59:34', '2019-07-15 21:59:41');
INSERT INTO `t_subscribe` VALUES ('14', '4', '10:30:00', '12:00:00', '0', '1', '1', '2019-07-15 21:59:34', '2019-07-15 21:59:41');
INSERT INTO `t_subscribe` VALUES ('15', '4', '13:00:00', '14:30:00', '0', '1', '1', '2019-07-15 21:59:34', '2019-07-15 21:59:41');
INSERT INTO `t_subscribe` VALUES ('16', '4', '15:00:00', '16:30:00', '0', '1', '1', '2019-07-15 21:59:34', '2019-07-15 21:59:41');
INSERT INTO `t_subscribe` VALUES ('17', '5', '09:00:00', '10:30:00', '0', '1', '1', '2019-07-15 21:59:34', '2019-07-15 21:59:41');
INSERT INTO `t_subscribe` VALUES ('18', '5', '10:30:00', '12:00:00', '0', '1', '1', '2019-07-15 21:59:34', '2019-07-15 21:59:41');
INSERT INTO `t_subscribe` VALUES ('19', '5', '13:00:00', '14:30:00', '0', '0', '1', '2019-07-15 21:59:34', '2019-07-15 21:59:41');
INSERT INTO `t_subscribe` VALUES ('20', '5', '15:00:00', '16:30:00', '0', '0', '1', '2019-07-15 21:59:34', '2019-07-15 21:59:41');
INSERT INTO `t_subscribe` VALUES ('21', '6', '09:00:00', '10:30:00', '0', '0', '1', '2019-07-15 21:59:34', '2019-07-15 21:59:41');
INSERT INTO `t_subscribe` VALUES ('22', '6', '10:30:00', '12:00:00', '0', '0', '1', '2019-07-15 21:59:34', '2019-07-15 21:59:41');
INSERT INTO `t_subscribe` VALUES ('23', '6', '13:00:00', '14:30:00', '0', '0', '1', '2019-07-15 21:59:34', '2019-07-15 21:59:41');
INSERT INTO `t_subscribe` VALUES ('24', '6', '15:00:00', '16:30:00', '0', '0', '1', '2019-07-15 21:59:34', '2019-07-15 21:59:41');

-- ----------------------------
-- Table structure for t_subscribe_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_subscribe_detail`;
CREATE TABLE `t_subscribe_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weekDay` int(11) DEFAULT NULL,
  `subscribeDate` datetime DEFAULT NULL,
  `subscribeFromDt` time DEFAULT NULL,
  `subscribeToDt` time DEFAULT NULL,
  `typeTeam` char(1) DEFAULT NULL,
  `typePerson` char(1) DEFAULT NULL,
  `venueId` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `enabled` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_subscribe_detail
-- ----------------------------
INSERT INTO `t_subscribe_detail` VALUES ('25', '3', '2019-07-17 00:00:00', '09:00:00', '10:30:00', '0', '1', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('26', '3', '2019-07-17 00:00:00', '10:30:00', '12:00:00', '0', '1', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('27', '3', '2019-07-17 00:00:00', '13:00:00', '14:30:00', '0', '0', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('28', '3', '2019-07-17 00:00:00', '15:00:00', '16:30:00', '0', '0', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('29', '4', '2019-07-18 00:00:00', '09:00:00', '10:30:00', '0', '1', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('30', '4', '2019-07-18 00:00:00', '10:30:00', '12:00:00', '0', '1', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('31', '4', '2019-07-18 00:00:00', '13:00:00', '14:30:00', '0', '1', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('32', '4', '2019-07-18 00:00:00', '15:00:00', '16:30:00', '0', '1', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('33', '5', '2019-07-19 00:00:00', '09:00:00', '10:30:00', '0', '1', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('34', '5', '2019-07-19 00:00:00', '10:30:00', '12:00:00', '0', '1', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('35', '5', '2019-07-19 00:00:00', '13:00:00', '14:30:00', '0', '0', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('36', '5', '2019-07-19 00:00:00', '15:00:00', '16:30:00', '0', '0', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('37', '6', '2019-07-20 00:00:00', '09:00:00', '10:30:00', '0', '0', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('38', '6', '2019-07-20 00:00:00', '10:30:00', '12:00:00', '0', '0', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('39', '6', '2019-07-20 00:00:00', '13:00:00', '14:30:00', '0', '0', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('40', '6', '2019-07-20 00:00:00', '15:00:00', '16:30:00', '0', '0', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('41', '1', '2019-07-22 00:00:00', '09:00:00', '10:30:00', '0', '1', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('42', '1', '2019-07-22 00:00:00', '10:30:00', '12:00:00', '0', '1', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('43', '1', '2019-07-22 00:00:00', '13:00:00', '14:30:00', '0', '1', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('44', '1', '2019-07-22 00:00:00', '15:00:00', '16:30:00', '0', '1', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('45', '2', '2019-07-23 00:00:00', '09:00:00', '10:30:00', '0', '1', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('46', '2', '2019-07-23 00:00:00', '10:30:00', '12:00:00', '0', '1', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('47', '2', '2019-07-23 00:00:00', '13:00:00', '14:30:00', '0', '1', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('48', '2', '2019-07-23 00:00:00', '15:00:00', '16:30:00', '0', '1', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('49', '3', '2019-07-24 00:00:00', '09:00:00', '10:30:00', '0', '1', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('50', '3', '2019-07-24 00:00:00', '10:30:00', '12:00:00', '0', '1', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('51', '3', '2019-07-24 00:00:00', '13:00:00', '14:30:00', '0', '0', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('52', '3', '2019-07-24 00:00:00', '15:00:00', '16:30:00', '0', '0', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('53', '4', '2019-07-25 00:00:00', '09:00:00', '10:30:00', '0', '1', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('54', '4', '2019-07-25 00:00:00', '10:30:00', '12:00:00', '0', '1', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('55', '4', '2019-07-25 00:00:00', '13:00:00', '14:30:00', '0', '1', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('56', '4', '2019-07-25 00:00:00', '15:00:00', '16:30:00', '0', '1', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('57', '5', '2019-07-26 00:00:00', '09:00:00', '10:30:00', '0', '1', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('58', '5', '2019-07-26 00:00:00', '10:30:00', '12:00:00', '0', '1', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('59', '5', '2019-07-26 00:00:00', '13:00:00', '14:30:00', '0', '0', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('60', '5', '2019-07-26 00:00:00', '15:00:00', '16:30:00', '0', '0', '1', '2019-07-17 22:34:44', '2019-07-17 22:34:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('61', '6', '2019-07-27 00:00:00', '09:00:00', '10:30:00', '0', '0', '1', '2019-07-18 12:24:58', '2019-07-18 12:24:58', '1');
INSERT INTO `t_subscribe_detail` VALUES ('62', '6', '2019-07-27 00:00:00', '10:30:00', '12:00:00', '0', '0', '1', '2019-07-18 12:24:58', '2019-07-18 12:24:58', '1');
INSERT INTO `t_subscribe_detail` VALUES ('63', '6', '2019-07-27 00:00:00', '13:00:00', '14:30:00', '0', '0', '1', '2019-07-18 12:24:58', '2019-07-18 12:24:58', '1');
INSERT INTO `t_subscribe_detail` VALUES ('64', '6', '2019-07-27 00:00:00', '15:00:00', '16:30:00', '0', '0', '1', '2019-07-18 12:24:58', '2019-07-18 12:24:58', '1');
INSERT INTO `t_subscribe_detail` VALUES ('65', '1', '2019-07-29 00:00:00', '09:00:00', '10:30:00', '0', '1', '1', '2019-07-20 10:41:48', '2019-07-20 10:41:48', '1');
INSERT INTO `t_subscribe_detail` VALUES ('66', '1', '2019-07-29 00:00:00', '10:30:00', '12:00:00', '0', '1', '1', '2019-07-20 10:41:48', '2019-07-20 10:41:48', '1');
INSERT INTO `t_subscribe_detail` VALUES ('67', '1', '2019-07-29 00:00:00', '13:00:00', '14:30:00', '0', '1', '1', '2019-07-20 10:41:48', '2019-07-20 10:41:48', '1');
INSERT INTO `t_subscribe_detail` VALUES ('68', '1', '2019-07-29 00:00:00', '15:00:00', '16:30:00', '0', '1', '1', '2019-07-20 10:41:48', '2019-07-20 10:41:48', '1');
INSERT INTO `t_subscribe_detail` VALUES ('69', '2', '2019-07-30 00:00:00', '09:00:00', '10:30:00', '0', '1', '1', '2019-07-22 08:30:11', '2019-07-22 08:30:11', '1');
INSERT INTO `t_subscribe_detail` VALUES ('70', '2', '2019-07-30 00:00:00', '10:30:00', '12:00:00', '0', '1', '1', '2019-07-22 08:30:11', '2019-07-22 08:30:11', '1');
INSERT INTO `t_subscribe_detail` VALUES ('71', '2', '2019-07-30 00:00:00', '13:00:00', '14:30:00', '0', '1', '1', '2019-07-22 08:30:11', '2019-07-22 08:30:11', '1');
INSERT INTO `t_subscribe_detail` VALUES ('72', '2', '2019-07-30 00:00:00', '15:00:00', '16:30:00', '0', '1', '1', '2019-07-22 08:30:11', '2019-07-22 08:30:11', '1');
INSERT INTO `t_subscribe_detail` VALUES ('73', '3', '2019-07-31 00:00:00', '09:00:00', '10:30:00', '0', '1', '1', '2019-07-22 08:30:11', '2019-07-22 08:30:11', '1');
INSERT INTO `t_subscribe_detail` VALUES ('74', '3', '2019-07-31 00:00:00', '10:30:00', '12:00:00', '0', '1', '1', '2019-07-22 08:30:11', '2019-07-22 08:30:11', '1');
INSERT INTO `t_subscribe_detail` VALUES ('75', '3', '2019-07-31 00:00:00', '13:00:00', '14:30:00', '0', '0', '1', '2019-07-22 08:30:11', '2019-07-22 08:30:11', '1');
INSERT INTO `t_subscribe_detail` VALUES ('76', '3', '2019-07-31 00:00:00', '15:00:00', '16:30:00', '0', '0', '1', '2019-07-22 08:30:11', '2019-07-22 08:30:11', '1');
INSERT INTO `t_subscribe_detail` VALUES ('77', '4', '2019-08-01 00:00:00', '09:00:00', '10:30:00', '0', '1', '1', '2019-07-23 12:21:44', '2019-07-23 12:21:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('78', '4', '2019-08-01 00:00:00', '10:30:00', '12:00:00', '0', '1', '1', '2019-07-23 12:21:44', '2019-07-23 12:21:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('79', '4', '2019-08-01 00:00:00', '13:00:00', '14:30:00', '0', '1', '1', '2019-07-23 12:21:44', '2019-07-23 12:21:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('80', '4', '2019-08-01 00:00:00', '15:00:00', '16:30:00', '0', '1', '1', '2019-07-23 12:21:44', '2019-07-23 12:21:44', '1');
INSERT INTO `t_subscribe_detail` VALUES ('81', '5', '2019-08-02 00:00:00', '09:00:00', '10:30:00', '0', '1', '1', '2019-07-24 09:19:46', '2019-07-24 09:19:46', '1');
INSERT INTO `t_subscribe_detail` VALUES ('82', '5', '2019-08-02 00:00:00', '10:30:00', '12:00:00', '0', '1', '1', '2019-07-24 09:19:46', '2019-07-24 09:19:46', '1');
INSERT INTO `t_subscribe_detail` VALUES ('83', '5', '2019-08-02 00:00:00', '13:00:00', '14:30:00', '0', '0', '1', '2019-07-24 09:19:46', '2019-07-24 09:19:46', '1');
INSERT INTO `t_subscribe_detail` VALUES ('84', '5', '2019-08-02 00:00:00', '15:00:00', '16:30:00', '0', '0', '1', '2019-07-24 09:19:46', '2019-07-24 09:19:46', '1');
INSERT INTO `t_subscribe_detail` VALUES ('85', '6', '2019-08-03 00:00:00', '09:00:00', '10:30:00', '0', '0', '1', '2019-07-25 07:01:17', '2019-07-25 07:01:17', '1');
INSERT INTO `t_subscribe_detail` VALUES ('86', '6', '2019-08-03 00:00:00', '10:30:00', '12:00:00', '0', '0', '1', '2019-07-25 07:01:17', '2019-07-25 07:01:17', '1');
INSERT INTO `t_subscribe_detail` VALUES ('87', '6', '2019-08-03 00:00:00', '13:00:00', '14:30:00', '0', '0', '1', '2019-07-25 07:01:17', '2019-07-25 07:01:17', '1');
INSERT INTO `t_subscribe_detail` VALUES ('88', '6', '2019-08-03 00:00:00', '15:00:00', '16:30:00', '0', '0', '1', '2019-07-25 07:01:17', '2019-07-25 07:01:17', '1');
INSERT INTO `t_subscribe_detail` VALUES ('89', '1', '2019-08-05 00:00:00', '09:00:00', '10:30:00', '0', '1', '1', '2019-07-30 13:15:06', '2019-07-30 13:15:06', '1');
INSERT INTO `t_subscribe_detail` VALUES ('90', '1', '2019-08-05 00:00:00', '10:30:00', '12:00:00', '0', '1', '1', '2019-07-30 13:15:06', '2019-07-30 13:15:06', '1');
INSERT INTO `t_subscribe_detail` VALUES ('91', '1', '2019-08-05 00:00:00', '13:00:00', '14:30:00', '0', '1', '1', '2019-07-30 13:15:06', '2019-07-30 13:15:06', '1');
INSERT INTO `t_subscribe_detail` VALUES ('92', '1', '2019-08-05 00:00:00', '15:00:00', '16:30:00', '0', '1', '1', '2019-07-30 13:15:06', '2019-07-30 13:15:06', '1');

-- ----------------------------
-- Table structure for t_traffic
-- ----------------------------
DROP TABLE IF EXISTS `t_traffic`;
CREATE TABLE `t_traffic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_traffic
-- ----------------------------

-- ----------------------------
-- Table structure for t_venue
-- ----------------------------
DROP TABLE IF EXISTS `t_venue`;
CREATE TABLE `t_venue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_venue
-- ----------------------------
INSERT INTO `t_venue` VALUES ('1', '嘉定气象科普馆', '2019-07-12 21:24:19', '2019-07-12 21:24:22');

-- ----------------------------
-- Table structure for t_venue_intro
-- ----------------------------
DROP TABLE IF EXISTS `t_venue_intro`;
CREATE TABLE `t_venue_intro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `img_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `content` longblob,
  `sort` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `venueId` int(11) DEFAULT NULL,
  `introduceType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_venue_intro
-- ----------------------------
INSERT INTO `t_venue_intro` VALUES ('24', '展品介绍', null, 0x3C703E33353535353535353535353535353535353535353C2F703E3C703EE59392E59392E59392E59392E59392E59392E5A49AE5A49AE5A49AE5A49AE5A49AE5A49A3C2F703E3C703EE59392E59392E59392E59392E59392E59392E5A49AE5A49AE5A49AE5A49AE5A49A777777777777773C2F703E, '0', '2019-07-13 16:30:52', '2019-07-25 21:37:56', '1', '3');
INSERT INTO `t_venue_intro` VALUES ('25', '精彩瞬间', null, 0x3C703E3437373737373737373737373737373737373737373737373764646464646464643C2F703E3C703EE5B8A6E69DA5E4BA86E7BBBFE7BBBFE7BBBFE7BBBFE7BBBFE7BBBFE7BBBFE7BBBF3C2F703E3C703EE9BE99E4B89CE5A4A7E98193E5A49AE5A49AE5A49AE5A49AE5A49AE5A49AE5A49A3C2F703E3C703EE68993E58DA1E8AEB0E5BD95E4BA863C2F703E3C703EE68993E58DA1E69CBA3C2F703E3C703EE69D8EE7BB8FE79086EFBC9B6C6C646B6C3C2F703E3C703E3C62723E3C2F703E, '0', '2019-07-13 16:30:58', '2019-07-25 21:38:08', '1', '4');
INSERT INTO `t_venue_intro` VALUES ('26', '场馆导览', null, 0x3C703E77777777773C2F703E, '0', '2019-07-15 13:16:30', '2019-07-25 21:38:19', '1', '2');
INSERT INTO `t_venue_intro` VALUES ('28', '场馆概述', null, 0x3C703E34343434343434343434343434E7ACACE4B889E696B9E58F913C2F703E3C703EE4BD86E698AFE688BFE4BBB7E5BFABE9809FE5878FE882A5E79C8BE8A781E5AFB9E696B9736C646A663C2F703E3C703EE8B4B7E6ACBEE694BEE6ACBEE697B6E997B4E694BEE5BE97E5BC80E4BA86E7A684E58FA3E8A197E98193E5BC97E585B0E5858B733C2F703E3C703EE5A4A7E5AB81E9A38EE5B09A3C2F703E3C703EE79A84E588B7E58DA1E7BCB4E8B4B9E698AF3C2F703E, '0', '2019-07-20 12:50:14', '2019-07-25 21:38:34', '1', '1');
