/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80028
Source Host           : localhost:3306
Source Database       : zxtk_db

Target Server Type    : MYSQL
Target Server Version : 80028
File Encoding         : 65001

Date: 2024-04-17 21:36:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for algorithm_parameters
-- ----------------------------
DROP TABLE IF EXISTS `algorithm_parameters`;
CREATE TABLE `algorithm_parameters` (
  `id` int NOT NULL COMMENT 'ID',
  `ant_count` int NOT NULL COMMENT '50',
  `iteration_count` int NOT NULL COMMENT '1000',
  `rho` decimal(5,4) DEFAULT NULL COMMENT '信息素挥发系数',
  `alpha` decimal(5,4) DEFAULT NULL COMMENT '信息素重要程度',
  `beta` decimal(5,4) DEFAULT NULL COMMENT '启发因子',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='算法参数';

-- ----------------------------
-- Records of algorithm_parameters
-- ----------------------------
INSERT INTO `algorithm_parameters` VALUES ('1', '50', '200', '0.9000', '0.8000', '0.5000', '2023-09-07 15:33:38');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `course_id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `course_number` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程编号',
  `course_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程名称',
  `course_teacher` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '任课教师',
  `course_type` varchar(20) COLLATE utf8mb4_general_ci DEFAULT 'java编程' COMMENT '课程类型',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `course_number` (`course_number`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='课程表';

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', 'CS3201', 'java基础', 'teacher', 'java', '2023-02-23 12:34:54');
INSERT INTO `course` VALUES ('2', 'ED3102', '马克思主义基本原理概论', '李四', '马克思主义', '2023-02-23 12:35:00');
INSERT INTO `course` VALUES ('6', 'CS2303', 'python编程', 'teacher', 'python', '2023-05-04 21:24:33');
INSERT INTO `course` VALUES ('7', 'MS6723', '数学', '公共', '数学', '2023-05-07 21:25:10');
INSERT INTO `course` VALUES ('8', 'GS3043', 'JavaScript高级', 'teacher', 'js', '2023-06-01 21:24:42');
INSERT INTO `course` VALUES ('9', 'D30467', '宏观经济学', 'teacher', '经济学', '2023-02-08 13:28:36');
INSERT INTO `course` VALUES ('10', 'C42370', '微观经济学', 'teacher', '经济学', '2023-07-07 21:28:43');
INSERT INTO `course` VALUES ('11', 'G20837', '管理学基础', 'teacher', '管理学', '2023-06-12 21:28:48');
INSERT INTO `course` VALUES ('13', 'rs1425', 'java基础', 'yd', 'java', '2023-05-17 12:59:05');
INSERT INTO `course` VALUES ('14', 'R2488', '英语A1', 'teacher', '英语', '2023-05-18 10:52:00');

-- ----------------------------
-- Table structure for knowledge_point
-- ----------------------------
DROP TABLE IF EXISTS `knowledge_point`;
CREATE TABLE `knowledge_point` (
  `point_id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `point_name` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '知识点名称',
  `course_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'java基础' COMMENT '课程名称',
  `user_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '公共' COMMENT '知识点创建者',
  `point_desc` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`point_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='知识点';

-- ----------------------------
-- Records of knowledge_point
-- ----------------------------
INSERT INTO `knowledge_point` VALUES ('1', 'java关键字', 'java基础', 'teacher', '', '2023-03-05 21:37:23');
INSERT INTO `knowledge_point` VALUES ('4', '三大特性', 'java基础', 'teacher', '继承，封装，多态', '2023-05-14 09:25:09');
INSERT INTO `knowledge_point` VALUES ('5', '基本数据类型', 'java基础', 'teacher', null, '2023-05-01 09:25:11');
INSERT INTO `knowledge_point` VALUES ('6', '类，接口', 'java基础', 'teacher', '对象', '2023-02-14 09:25:17');
INSERT INTO `knowledge_point` VALUES ('7', '异常', 'java基础', 'teacher', null, '2023-03-14 09:25:23');
INSERT INTO `knowledge_point` VALUES ('8', '反射', 'java基础', 'teacher', null, '2023-03-14 09:25:28');
INSERT INTO `knowledge_point` VALUES ('9', 'IO流', 'java基础', 'teacher', null, '2023-03-14 09:25:34');
INSERT INTO `knowledge_point` VALUES ('10', '多线程', 'java基础', 'teacher', '线程池', '2023-04-14 09:25:40');
INSERT INTO `knowledge_point` VALUES ('11', '泛型', 'java基础', 'teacher', null, '2023-04-14 09:25:46');
INSERT INTO `knowledge_point` VALUES ('12', '集合', 'java基础', 'teacher', null, '2023-02-14 09:25:50');
INSERT INTO `knowledge_point` VALUES ('13', '网络编程', 'java基础', 'teacher', 'tcp,udp', '2023-03-14 09:26:00');
INSERT INTO `knowledge_point` VALUES ('14', '正则表达式', 'java基础', 'teacher', null, '2023-04-14 09:25:55');
INSERT INTO `knowledge_point` VALUES ('15', '流程控制', 'java基础', 'teacher', '循环，判断', '2023-05-14 09:26:06');
INSERT INTO `knowledge_point` VALUES ('16', '数组', 'java基础', 'teacher', '一维，二维', '2023-03-14 09:26:11');
INSERT INTO `knowledge_point` VALUES ('17', '关键字', 'python编程', 'teacher', '', '2023-05-14 22:53:22');
INSERT INTO `knowledge_point` VALUES ('18', '类', 'python编程', 'teacher', null, '2023-05-17 12:53:32');
INSERT INTO `knowledge_point` VALUES ('19', '表达式', 'python编程', 'teacher', null, '2023-05-18 10:52:24');

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名称',
  `paper_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '试卷名称',
  `auto_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组卷方式',
  `paper_duration` decimal(5,2) DEFAULT NULL COMMENT '组卷时长',
  `fitness` decimal(8,4) DEFAULT NULL COMMENT '适应度',
  `difficulty` decimal(3,2) DEFAULT NULL COMMENT '实际难度',
  `point_coverage` decimal(3,2) DEFAULT NULL COMMENT '实际知识点覆盖度',
  `repeatability` decimal(3,2) DEFAULT NULL COMMENT '实际相似度',
  `target_difficulty` decimal(3,2) DEFAULT NULL COMMENT '目标难度',
  `target_point_coverage` decimal(3,2) DEFAULT NULL COMMENT '目标知识点覆盖度',
  `target_repeatability` decimal(3,2) DEFAULT NULL COMMENT '目标相似度',
  `operate_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='日志信息';

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES ('2', 'teacher', '测试算法', '蚁群算法', '0.93', '0.0205', '3.99', '0.71', '0.16', '4.00', '0.70', '0.20', '2023-05-20 11:46:09');
INSERT INTO `logs` VALUES ('3', 'teacher', '测试算法', '蚁群算法', '0.93', '0.0436', '3.95', '0.71', '0.15', '4.00', '0.70', '0.20', '2023-05-20 11:48:03');
INSERT INTO `logs` VALUES ('4', 'teacher', '测试算法', '蚁群算法', '0.91', '0.0331', '4.01', '0.71', '0.12', '4.00', '0.70', '0.20', '2023-05-20 11:52:49');
INSERT INTO `logs` VALUES ('9', 'teacher', '测试算法', '蚁群算法', '0.86', '0.0485', '3.03', '0.86', '0.13', '3.00', '0.80', '0.20', '2023-05-20 12:03:29');
INSERT INTO `logs` VALUES ('10', 'teacher', '测试算法', '蚁群算法', '0.87', '0.0598', '3.04', '0.86', '0.11', '3.00', '0.80', '0.20', '2023-05-20 12:03:33');
INSERT INTO `logs` VALUES ('11', 'teacher', '测试算法', '蚁群算法', '0.87', '0.2204', '3.38', '0.86', '0.14', '3.00', '0.80', '0.20', '2023-05-20 12:03:36');
INSERT INTO `logs` VALUES ('14', 'teacher', '测试算法', '蚁群算法', '5.57', '0.2017', '3.33', '0.86', '0.12', '3.00', '0.80', '0.20', '2023-05-20 12:48:07');
INSERT INTO `logs` VALUES ('15', 'teacher', '测试算法', '蚁群算法', '4.98', '0.0675', '3.03', '0.86', '0.06', '3.00', '0.80', '0.20', '2023-05-20 12:49:04');
INSERT INTO `logs` VALUES ('16', 'teacher', '测试算法', '蚁群算法', '5.08', '0.2517', '3.43', '0.86', '0.12', '3.00', '0.80', '0.20', '2023-05-20 12:52:59');
INSERT INTO `logs` VALUES ('17', 'teacher', '测试算法', '蚁群算法', '4.99', '0.0480', '3.01', '0.86', '0.09', '3.00', '0.80', '0.20', '2023-05-20 12:53:21');
INSERT INTO `logs` VALUES ('18', 'teacher', '测试算法', '蚁群算法', '5.49', '0.0638', '3.01', '0.86', '0.04', '3.00', '0.80', '0.20', '2023-05-20 12:54:35');
INSERT INTO `logs` VALUES ('19', 'teacher', '测试算法', '蚁群算法', '6.41', '0.2180', '3.65', '0.86', '0.09', '4.00', '0.80', '0.20', '2023-05-20 12:56:16');
INSERT INTO `logs` VALUES ('20', 'teacher', '测试算法', '蚁群算法', '4.98', '0.2756', '3.56', '0.86', '0.05', '4.00', '0.80', '0.20', '2023-05-20 12:56:45');
INSERT INTO `logs` VALUES ('21', 'teacher', '测试算法', '蚁群算法', '5.02', '0.1793', '3.74', '0.86', '0.07', '4.00', '0.80', '0.20', '2023-05-20 12:56:53');
INSERT INTO `logs` VALUES ('22', 'teacher', '测试算法', '蚁群算法', '5.69', '0.1851', '3.77', '0.86', '0.07', '4.00', '0.80', '0.20', '2023-05-20 12:58:54');
INSERT INTO `logs` VALUES ('23', 'teacher', '测试算法', '蚁群算法', '6.70', '0.3030', '3.60', '0.86', '0.08', '4.00', '0.80', '0.20', '2023-05-20 12:59:02');
INSERT INTO `logs` VALUES ('24', 'teacher', '测试算法', '蚁群算法', '5.12', '0.1501', '3.82', '0.86', '0.07', '4.00', '0.80', '0.20', '2023-05-20 12:59:50');
INSERT INTO `logs` VALUES ('25', 'teacher', '测试算法', '蚁群算法', '5.10', '0.1091', '3.88', '0.86', '0.06', '4.00', '0.80', '0.20', '2023-05-20 12:59:57');
INSERT INTO `logs` VALUES ('26', 'teacher', '测试算法', '蚁群算法', '5.08', '0.0186', '4.00', '0.71', '0.04', '4.00', '0.70', '0.20', '2023-05-20 13:00:46');
INSERT INTO `logs` VALUES ('63', 'admin', '测试算法', '蚁群算法', '6.57', '0.4230', '3.42', '0.86', '0.04', '4.00', '0.80', '0.10', '2023-05-24 19:51:09');
INSERT INTO `logs` VALUES ('64', 'admin', '测试算法', '蚁群算法', '6.29', '0.0251', '3.01', '0.86', '0.03', '3.00', '0.80', '0.10', '2023-05-24 19:52:13');
INSERT INTO `logs` VALUES ('65', 'admin', '测试算法', '蚁群算法', '6.29', '0.0192', '3.00', '0.86', '0.02', '3.00', '0.80', '0.10', '2023-05-24 19:53:08');
INSERT INTO `logs` VALUES ('66', 'admin', '测试算法', '蚁群算法', '6.28', '0.0181', '3.02', '0.86', '0.03', '3.00', '0.80', '0.10', '2023-05-24 19:53:39');
INSERT INTO `logs` VALUES ('67', 'admin', '测试算法', '蚁群算法', '6.27', '0.0380', '3.07', '0.86', '0.04', '3.00', '0.80', '0.10', '2023-05-24 19:54:15');
INSERT INTO `logs` VALUES ('68', 'admin', '测试算法', '蚁群算法', '6.31', '0.0192', '3.00', '0.86', '0.02', '3.00', '0.80', '0.10', '2023-05-24 19:54:48');
INSERT INTO `logs` VALUES ('69', 'admin', '测试算法', '蚁群算法', '6.30', '0.3673', '3.92', '0.93', '0.04', '4.00', '0.80', '0.10', '2023-05-24 19:55:57');
INSERT INTO `logs` VALUES ('70', 'admin', '测试算法', '蚁群算法', '6.29', '0.1684', '3.99', '0.86', '0.00', '4.00', '0.80', '0.10', '2023-05-24 19:56:14');
INSERT INTO `logs` VALUES ('71', 'admin', '测试算法', '蚁群算法', '6.31', '0.3014', '4.01', '0.86', '0.00', '4.00', '0.80', '0.10', '2023-05-24 19:56:27');
INSERT INTO `logs` VALUES ('72', 'admin', '测试算法', '蚁群算法', '6.35', '0.3213', '4.07', '0.86', '0.01', '4.00', '0.80', '0.10', '2023-05-24 19:56:40');
INSERT INTO `logs` VALUES ('73', 'admin', '测试算法', '蚁群算法', '6.30', '0.2292', '4.07', '0.86', '0.02', '4.00', '0.80', '0.10', '2023-05-24 19:57:06');
INSERT INTO `logs` VALUES ('74', 'admin', '测试算法', '蚁群算法', '6.31', '0.3508', '4.02', '0.86', '0.07', '4.00', '0.80', '0.10', '2023-05-24 19:57:53');
INSERT INTO `logs` VALUES ('75', 'admin', '测试算法', '蚁群算法', '6.30', '0.3191', '3.97', '0.86', '0.03', '4.00', '0.80', '0.10', '2023-05-24 19:58:54');
INSERT INTO `logs` VALUES ('76', 'teacher', '测试', '蚁群算法', '11.19', '0.0284', '3.00', '0.86', '0.03', '3.00', '0.80', '0.20', '2023-09-07 15:26:30');
INSERT INTO `logs` VALUES ('77', 'teacher', 'work1', '蚁群算法', '12.80', '0.2523', '3.32', '0.86', '0.03', '3.00', '0.80', '0.20', '2024-02-06 08:43:04');

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper` (
  `paper_id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `paper_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '试卷名称',
  `paper_author` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '出题人',
  `course_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程名称',
  `choice_question` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '单选题',
  `choice_score` int DEFAULT '0' COMMENT '单选题分数',
  `multi_question` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '多选题',
  `multi_score` int DEFAULT '0' COMMENT '多选题分数',
  `blank_filling_question` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '填空题',
  `blank_filling_score` int DEFAULT '0' COMMENT '填空题分数',
  `judge_question` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '判断题',
  `judge_score` int DEFAULT '0' COMMENT '判断题分数',
  `short_question` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '简答题',
  `short_score` int DEFAULT '0' COMMENT '简答题分数',
  `repeatability` decimal(3,2) DEFAULT NULL COMMENT '试卷重复度',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `paper_level` decimal(3,2) DEFAULT '4.30',
  `point_coverage` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`paper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='试卷表';

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES ('16', 'java基础期末考试', 'teacher', 'java基础', '56,58,40,15,33', '4', '53,62,71,70,48', '3', '74,72,65,66,25', '3', '78,16,79,82,76,84,87,85,80,83', '1', '94,88,91,90', '10', '0.00', '2023-04-23 12:54:44', '2.10', '0.54');
INSERT INTO `paper` VALUES ('54', 'java', 'test', 'java基础', '38,34,41,44,40,69,37,54,57,17', '5', '', '0', '113,119,128,125,115,122,162,118,114,74', '3', '', '0', '', '0', '0.00', '2023-04-27 15:50:19', '3.30', '0.72');
INSERT INTO `paper` VALUES ('64', 'ydtest', 'yd', 'java基础', '', '0', '', '0', '165,64,129,26,114,128,113,124,120,161', '4', '', '0', '147,139,21,88,92,137', '10', '0.23', '2023-05-17 13:00:27', '4.30', '0.78');
INSERT INTO `paper` VALUES ('71', 'java', 'yd', 'java基础', '34,68,61,40,17,55,69,35,15,43', '4', ' ', '0', '124,125,116,131,75,119,163,164,118,162', '1', ' ', '0', '138,132,88,141,46,92,23,139,91,147', '0', '0.11', '2023-05-18 09:25:08', '3.31', '0.84');
INSERT INTO `paper` VALUES ('82', 'java基础', 'teacher', 'java基础', '', '0', '151,52,158,62,31,53', '3', '', '0', '107,81,83,102,103', '3', '', '0', '0.03', '2023-05-18 09:49:29', '3.91', '0.57');
INSERT INTO `paper` VALUES ('92', 'java测试2', 'teacher', 'java基础', '15,29,18,57,69,55,38,30,56,17', '5', '', '0', '', '0', '78,100,22,86,111,104,98,99,105,101', '3', '139,140,141,96,143,144,145,146,147,137', '5', '0.15', '2023-05-18 10:45:06', '3.70', '0.71');
INSERT INTO `paper` VALUES ('99', 'java测试', 'teacher', 'java基础', '15,39,18,38,29,43,55,44,69,50', '2', '', '0', '', '0', '79,77,100,86,103,97,47,99,110,101', '3', '139,140,141,93,45,144,145,94,134,46', '5', '0.10', '2023-05-18 15:43:11', '3.00', '0.71');
INSERT INTO `paper` VALUES ('103', 'java演示', 'teacher', 'java基础', '15,32,18,59,33,38,36,40,35,168', '2', '20,158,154,152,153,71,53,70,62,157', '3', '113,114,123,75,125', '2', '80,108,109,110,104', '1', '138,94,45,23,146', '10', '0.19', '2023-05-18 17:01:44', '3.01', '0.79');
INSERT INTO `paper` VALUES ('104', 'java测试1', 'teacher', 'java基础', '459,40,18,51,211,61,44,56,183,68', '2', '700,70,67,152,153,154,62,565,680,158', '2', '64,320,127,124,125,474,529,318,435,119', '2', '490,487,100,202,489', '2', '23,148,140,431,248', '6', '0.09', '2023-05-20 18:24:18', '3.00', '0.86');
INSERT INTO `paper` VALUES ('105', 'java测试2', 'teacher', 'java基础', '15,170,18,215,461,578,469,35,478,173', '2', '696,562,304,152,153,154,225,156,157,158', '2', '437,122,123,537,125,126,127,128,129,165', '2', '177,111,82,202,231', '2', '244,545,23,247,290', '6', '0.10', '2023-05-20 18:25:06', '3.00', '0.86');
INSERT INTO `paper` VALUES ('106', 'java测试3', 'teacher', 'java基础', '15,196,18,59,51,184,39,459,41,468', '2', '305,208,462,152,52,690,692,67,313,158', '2', '286,122,75,124,230,126,27,128,129,436', '2', '264,238,518,202,231', '2', '608,94,140,247,647', '6', '0.05', '2023-05-20 18:25:58', '3.02', '0.86');
INSERT INTO `paper` VALUES ('107', 'java测试4', 'teacher', 'java基础', '15,40,68,41,214,44,443,57,438,439', '2', '458,430,681,152,153,154,157,310,314,158', '2', '121,122,284,124,125,165,163,27,130,485', '2', '497,520,519,202,231', '2', '244,137,586,247,248', '6', '0.03', '2023-05-20 18:28:09', '3.00', '0.86');
INSERT INTO `paper` VALUES ('108', 'java演示1', 'teacher', 'java基础', '460,210,464,33,168,215,51,190,61,59', '2', '310,559,690,564,582,594,19,680,67,225', '2', '124,181,529,117,125,130,182,228,26,278', '2', '492,109,234,202,231', '2', '549,91,586,290,553', '6', '0.07', '2023-05-22 20:41:54', '3.00', '0.86');
INSERT INTO `paper` VALUES ('109', 'java', 'teacher', 'java基础', '15,32,18,446,479,453,427,68,445,17', '3', '', '0', '', '0', '265,259,512,487,641,252,231,240,81,492', '2', '139,140,201,133,178', '10', '0.04', '2023-05-23 16:54:28', '3.29', '0.86');
INSERT INTO `paper` VALUES ('110', '122', 'teacher', 'java基础', '15,60,191,580,444,172,428,69,449,190', '2', '', '0', '', '0', '508,515,99,84,105,97,491,236,171,266', '3', '545,140,433,456,143', '10', '0.03', '2023-05-23 16:59:42', '3.63', '0.86');
INSERT INTO `paper` VALUES ('111', 'java补考1', 'teacher', 'java基础', '15,199,55,471,168,61,56,205,440,54', '2', '683,569,158,152,48,154,226,156,157,150', '2', '121,27,123,528,125', '3', '100,108,109,641,111', '1', '295,302,176,201,143', '8', '0.06', '2023-05-23 17:09:05', '3.56', '0.86');
INSERT INTO `paper` VALUES ('112', '测试', 'teacher', 'java基础', '15,473,576,49,57,448,206,28,445,215', '2', '154,681,567,628,311,695,615,208,564,562', '2', '320,436,122,522,523,161,437,537,162,482', '2', '82,491,579,252,426', '2', '138,302,433,648,456', '6', '0.03', '2023-09-07 15:26:30', '3.00', '0.86');
INSERT INTO `paper` VALUES ('113', 'work1', 'teacher', 'java基础', '15,61,443,428,479,427,29,451,580,438', '3', '630,429,462,441,458', '4', '', '0', '', '0', '90,433,251,553,550', '10', '0.03', '2024-02-06 08:43:04', '3.32', '0.86');

-- ----------------------------
-- Table structure for paper_template
-- ----------------------------
DROP TABLE IF EXISTS `paper_template`;
CREATE TABLE `paper_template` (
  `template_id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `choice_count` int DEFAULT '0' COMMENT '单选题数量',
  `choice_score` int DEFAULT '0' COMMENT '单选题分数',
  `multi_count` int DEFAULT '0' COMMENT '多选题数量',
  `multi_score` int DEFAULT '0' COMMENT '多选题分数',
  `blank_filling_count` int DEFAULT '0' COMMENT '填空题数量',
  `blank_filling_score` int DEFAULT '0' COMMENT '填空题分数',
  `judge_count` int DEFAULT '0' COMMENT '判断题数量',
  `judge_score` int DEFAULT '0' COMMENT '判断题分数',
  `short_count` int DEFAULT '0' COMMENT '简答题数量',
  `short_score` int DEFAULT '0' COMMENT '简答题分数',
  `paper_level` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '一般' COMMENT '试卷难度',
  `point_coverage` decimal(3,2) DEFAULT '0.00' COMMENT '知识点覆盖度',
  `user_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '公共' COMMENT '模板所有者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `repeatability` decimal(3,2),
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='试卷模板';

-- ----------------------------
-- Records of paper_template
-- ----------------------------
INSERT INTO `paper_template` VALUES ('3', '10', '2', '10', '2', '10', '2', '5', '2', '5', '6', '中等', '0.80', 'teacher', '2023-05-14 09:28:46', '0.20');
INSERT INTO `paper_template` VALUES ('5', '10', '2', '5', '3', '5', '2', '5', '1', '5', '10', '较难', '0.80', '公共', '2023-05-16 18:30:27', '0.10');
INSERT INTO `paper_template` VALUES ('6', '10', '5', '10', '5', '0', '0', '0', '0', '0', '0', '较难', '0.60', '公共', '2023-05-16 18:30:30', '0.30');
INSERT INTO `paper_template` VALUES ('7', '10', '1', '10', '2', '10', '2', '10', '2', '10', '4', '中等', '0.80', 'teacher', '2023-05-18 10:53:18', '0.20');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `question_id` int NOT NULL AUTO_INCREMENT COMMENT '试题编号',
  `question_type` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '试题类型',
  `question_level` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '难度级别',
  `course_type` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '课程类型',
  `question_point` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '知识点',
  `question_subject` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '题目',
  `question_answer` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '答案',
  `option_a` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '选项A',
  `option_b` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '选项B',
  `option_c` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '选项C',
  `option_d` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '选项D',
  `question_image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图片',
  `question_desc` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `bank_name` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '公共题库' COMMENT '题库名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=712 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='试题表';

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('15', '单选题', '较难', 'java基础', '数组', '在表长为n的顺序表上做插入运算，平均要移动的结点数为()', 'C', 'n/4', 'n/3', 'n/2', 'n', '', null, '公共题库', '2023-05-14 09:29:05');
INSERT INTO `question` VALUES ('16', '判断题', '容易', 'java基础', '数组', '数组元素的下标值越大，存取时间越长，这样的说法正确吗？（）', '错', null, null, null, null, '', null, '公共题库', '2023-05-14 09:29:07');
INSERT INTO `question` VALUES ('17', '单选题', '中等', 'java基础', '类，接口', '欲构造ArrayList下列哪个叙述是正确的类的一个实例，此类继承了List接口，下列哪个方法是正确的 ？（）', 'B', ' ArrayList myList=new Object（）；', ' List myList=new ArrayList（）;', 'ArrayList myList=new List（）;', 'List myList=new List（）;', '', null, '公共题库', '2023-05-14 09:29:09');
INSERT INTO `question` VALUES ('18', '单选题', '较易', 'java基础', '异常', '以下关于异常捕获的原则中，错误的是（）', 'D', 'RuntimeException 可以不被捕获，Java会自动处理运行期异常。', '先列出子类，后列出父类', '先列出具体的异常类，后列出通用的异常类。', 'Exception类必须出现，而且必须作为catch块中第一个匹配的类。', '', null, '公共题库', '2023-05-14 09:29:11');
INSERT INTO `question` VALUES ('19', '多选题', '容易', 'java基础', '基本数据类型', '下面哪些不是java的简单数据类型?（）', 'B,C', 'short', 'Boolean', 'Double', 'float', '', null, '公共题库', '2023-05-14 09:29:13');
INSERT INTO `question` VALUES ('20', '多选题', '容易', 'java基础', '类，接口', '不能用来修饰interface的有（）', 'A,C', 'private', 'public', 'protected', 'static', null, null, '公共题库', '2023-05-14 09:29:16');
INSERT INTO `question` VALUES ('21', '简答题', '较易', 'java基础', '基本数据类型', '== 和 equals 的区别是什么？（）', '    对于基本类型，==比较的是值；  对于引用类型，==比较的是地址；equals不能用于基本类型的比较；如果没有重写equals，equals就相当于==；  如果重写了equals方法，equals比较的是对象的内容；', null, null, null, null, null, null, '公共题库', '2023-05-14 09:29:18');
INSERT INTO `question` VALUES ('22', '判断题', '容易', 'java基础', '基本数据类型', 'String属于基础数据类型（）', '错', null, null, null, null, '', null, '公共题库', '2023-05-14 09:29:20');
INSERT INTO `question` VALUES ('23', '简答题', '中等', 'java基础', '反射', '什么是反射？', '所谓反射，是java在运行时进行自我观察的能力，通过class、constructor、field、method四个方法获取一个类的各个组成部分。\n\n在Java运行时环境中，对任意一个类，可以知道类有哪些属性和方法。这种动态获取类的信息以及动态调用对象的方法的功能来自于反射机制。', null, null, null, null, null, null, '公共题库', '2023-05-14 09:29:22');
INSERT INTO `question` VALUES ('24', '填空题', '较难', 'java基础', '三大特性', '面向对象程序设计的三个特征是（）', '封装，继承，多态', null, null, null, null, '', null, '公共题库', '2023-05-14 09:29:28');
INSERT INTO `question` VALUES ('25', '填空题', '中等', 'java基础', '类，接口', '（）是Java的关键字，用来定义类。', 'class', null, null, null, null, '', null, '公共题库', '2023-05-14 09:29:24');
INSERT INTO `question` VALUES ('26', '填空题', '较易', 'java基础', '基本数据类型', 'Java中用于定义整型变量的关键字有四个：（）', 'byte,short,int,long', null, null, null, null, null, null, '公共题库', '2023-05-14 09:29:30');
INSERT INTO `question` VALUES ('27', '填空题', '较难', 'java基础', '泛型', '泛型的作用是支持类型( )。', '参数化', null, null, null, null, '', null, '公共题库', '2023-05-14 09:29:26');
INSERT INTO `question` VALUES ('28', '单选题', '较难', 'java基础', 'java关键字', '在使用super 和this关键字时，以下描述正确的是()', 'A', '在子类构造方法中使用super()显示调用父类的构造方法，super()必须写在子类构造方法的第一行，否则编译不通过。', ' super()和this()不一定要放在构造方法内第一行。', 'this()和super()可以同时出现在一个构造函数中', 'this()和super()可以在static环境中使用，包括static方法和static语句块', null, null, '公共题库', '2023-05-14 09:29:32');
INSERT INTO `question` VALUES ('29', '单选题', '中等', 'java基础', '三大特性', '以下对封装的描述正确的是()', 'D', '只能对一个类中的方法进行封装，不能对属性进行封装。', '如果子类继承了父类，对于父类中进行封装的方法，子类仍然可以直接调用。', '封装的意义不大，因此在编码时尽量不要使用。', '封装的主要作用在于对外隐藏内部实现细节，增强程序的安全性。', '', null, '公共题库', '2023-05-14 09:29:34');
INSERT INTO `question` VALUES ('30', '单选题', '较难', 'java基础', 'java关键字', '以下说法错误的是()', 'D', 'super.方法()可以调用父类的所有非私有方法。', 'super()可以调用父类的所有非私有构造函数。', 'super.属性可以调用父类的所有非私有属性。', 'this和super关键字可以出现在同一个构造函数中。', null, null, '公共题库', '2023-05-14 09:29:36');
INSERT INTO `question` VALUES ('31', '多选题', '很难', 'java基础', 'java关键字', ' 以下关于final关键字说法错误的是()', 'A,C', 'final是java中的修饰符，可以修饰类、接口、抽象类、方法和属性。', ' final修饰的类肯定不能被继承。', 'final修饰的方法不能被重载。', 'final修饰的变量不允许被再次赋值。', null, null, '公共题库', '2023-05-14 09:29:37');
INSERT INTO `question` VALUES ('32', '单选题', '中等', 'java基础', 'java关键字', '访问修饰符作用范围由大到小是()', 'D', ' private-default-protected-public', 'public-default-protected-private', 'private-protected-default-public', ' public-protected-default-private', '', null, '公共题库', '2023-05-14 09:29:40');
INSERT INTO `question` VALUES ('33', '单选题', '中等', 'java基础', '类，接口', '以下()不是Object类的方法', 'D', 'clone()', ' finalize()', 'toString()', 'hasNext()', '', null, '公共题库', '2023-05-14 09:29:42');
INSERT INTO `question` VALUES ('34', '单选题', '较难', 'java基础', '三大特性', '多态的表现形式有()', 'A', '重写', '抽象', '继承', '封装', null, null, '公共题库', '2023-05-14 09:29:47');
INSERT INTO `question` VALUES ('35', '单选题', '容易', 'java基础', '类，接口', ' 以下对抽象类的描述正确的是', 'C', '抽象类没有构造方法', '抽象类必须提供抽象方法', '有抽象方法的类一定是抽象类', '抽象类可以通过new关键字直接实例化', null, null, '公共题库', '2023-05-14 09:29:44');
INSERT INTO `question` VALUES ('36', '单选题', '较易', 'java基础', '类，接口', ' 以下对接口描述错误的有()', 'D', '接口没有提供构造方法', '接口中的方法默认使用public、abstract修饰', '接口中的属性默认使用public、static、final修饰', '接口不允许多继承', null, null, '公共题库', '2023-05-14 09:29:49');
INSERT INTO `question` VALUES ('37', '单选题', '很难', 'java基础', '流程控制', '下代码，描述正确的有()interface IDemo{\n\npublic static final String name; 1\n\nvoid print(); 2\n\npublic void getInfo(); 3\n\n}\n\nabstract class Person implements IDemo{ 4\n\npublic void print(){\n\n}\n\n}\n', 'A', '第1行错误，没有给变量赋值', '第2行错误，方法没有修饰符', '第4行错误，没有实现接口的全部方法', '第3行错误，没有方法的实现', '', null, '公共题库', '2023-05-14 09:29:53');
INSERT INTO `question` VALUES ('38', '单选题', '较易', 'java基础', '类，接口', '以下描述正确的有()', 'B', '方法的重写应用在一个类的内部', '方法的重载与返回值类型无关', '构造方法不能重载', '构造方法可以重写', null, null, '公共题库', '2023-05-14 09:29:51');
INSERT INTO `question` VALUES ('39', '单选题', '容易', 'java基础', '异常', '以下对异常的描述不正确的有（）。', 'C', '异常分为Error和Exception', 'Throwable是所有异常类的父类', 'Exception是所有异常类父类', 'Exception包括RuntimeException和RuntimeException之外的异常', null, null, '公共题库', '2023-05-16 18:30:47');
INSERT INTO `question` VALUES ('40', '单选题', '中等', 'java基础', '异常', ' 在try-catch-finally语句块中，以下可以单独与finally一起使用的是()', 'B', 'catch', 'try', 'throws', 'throw', null, null, '公共题库', '2023-05-16 18:30:49');
INSERT INTO `question` VALUES ('41', '单选题', '较易', 'java基础', '异常', ' 以下对自定义异常描述正确的是（）', 'C', '自定义异常必须继承Exception。', '自定义异常可以继承自Error。', '自定义异常可以更加明确定位异常出错的位置和给出详细出错信息。', '程序中已经提供了丰富的异常类，使用自定义异常没有意义。', null, null, '公共题库', '2023-05-16 18:30:51');
INSERT INTO `question` VALUES ('42', '单选题', '容易', 'python编程', '网络编程', '以下对TCP和UDP描述正确的是()', 'D', 'TCP不能提供数据的可靠性。', 'UDP能够保证数据库的可靠性。', 'TCP数据传输效率高于UDP。', 'UDP数据传输效率高于TCP。', null, null, '公共题库', '2023-05-16 18:30:53');
INSERT INTO `question` VALUES ('43', '单选题', '中等', 'java基础', '集合', 'Java中，关于HashMap类的描述，以下错误的是( )。', 'B', 'HashMap使用键/值得形式保存数据', 'HashMap 能够保证其中元素的顺序', 'HashMap允许将null用作键', ' HashMap允许将null用作值', null, null, '公共题库', '2023-05-16 18:30:57');
INSERT INTO `question` VALUES ('44', '单选题', '很难', 'java基础', '集合', 'Java中的集合类包括ArrayList、LinkedList、HashMap等类，下列关于集合类描述错误的是（）', 'C', 'ArrayList和LinkedList均实现了List接口', ' ArrayList的访问速度比LinkedList快', '添加和删除元素时，ArrayList的表现更佳', 'HashMap实现Map接口，它允许任何类型的键和值对象，并允许将null用作键或值', null, null, '公共题库', '2023-05-16 18:30:55');
INSERT INTO `question` VALUES ('45', '简答题', '中等', 'java基础', '类，接口', '请讲述String 和StringBuffer的区别？', 'String 类所定义的对象是用于存放”长度固定”的字符串。\nStringBuffer类所定义的对象是用于存放”长度可变动”的字符串。', null, null, null, null, '', null, '公共题库', '2023-05-16 18:30:59');
INSERT INTO `question` VALUES ('46', '简答题', '较难', 'java基础', '多线程', '分析sleep()和wait()方法的区别。', 'sleep睡眠的意思 : sleep() 方法用来暂时中止执行的线程。在睡眠后，线程将进入就绪状态。wait等待的意思: 如果调用了 wait() 方法，线程将处于等待状态。用于在两个或多个线程并发运行时。', null, null, null, null, null, null, '公共题库', '2023-05-16 18:31:01');
INSERT INTO `question` VALUES ('47', '判断题', '很难', 'java基础', '类，接口', '抽象方法可以为静态', '错', null, null, null, null, null, null, '公共题库', '2023-05-16 18:31:03');
INSERT INTO `question` VALUES ('48', '多选题', '较难', 'java基础', '基本数据类型', '下面关于变量及其范围的陈述哪些是不正确的（ ）', 'B,C', '实例变量是类的成员变量', '实例变量用关键字static声明', '在方法中定义的局部变量在该方法被执行时创建', '局部变量在使用前必须被初始化', null, null, '公共题库', '2023-05-16 18:31:05');
INSERT INTO `question` VALUES ('49', '单选题', '容易', 'java基础', '基本数据类型', 'Java语言中，String类的IndexOf()方法返回的类型是？', 'C', 'Int16', 'Int32', 'int', 'long', null, null, '公共题库', '2023-05-16 18:31:06');
INSERT INTO `question` VALUES ('50', '单选题', '较易', 'java基础', '多线程', '那个方法是一个类实现java.lang.Runnable interface时要定义的？', 'B', 'void run()', ' public void run()', ' public void start()', 'public void run(int priority)', '', null, '公共题库', '2023-05-16 18:31:08');
INSERT INTO `question` VALUES ('51', '单选题', '容易', 'java基础', '基本数据类型', 'char的值范围?', 'B', '0 … 32767', '0 … 65535', '–256 … 255', '–32768 … 32767', '', null, '公共题库', '2023-05-16 18:31:11');
INSERT INTO `question` VALUES ('52', '多选题', '较难', 'java基础', '数组', '两个可以创建数组实例? ', 'A,D', 'int[] ia = new int [15];', 'float fa = new float [20];', 'char[] ca = “Some String”;', 'Object oa = new float[20];', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('53', '多选题', '较难', 'java基础', '多线程', '下面能让线程停止执行的有( )', 'A,B,D', 'sleep();', 'stop();', 'notify();', 'synchronized();', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('54', '单选题', '较易', 'java基础', '流程控制', 'Java程序的执行过程中用到一套JDK工具，其中java.exe是指( ) ', 'B', 'Java文档生成器 。', 'Java解释器。', 'Java编译器.', 'Java类分解器.', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('55', '单选题', '中等', 'java基础', '基本数据类型', '下面的程序输出结果为？\npublic static void main(String[] args) {\n        int x=-3;\n        int y=-10;\n        System.out.println(y%x);\n    }', 'A', '-1', '2', '1', '3', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('56', '单选题', '很难', 'java基础', '异常', '（  ）类是所有异常类的父类', 'A', 'Throwable', 'Error', 'Exception', 'AWTError', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('57', '单选题', '很难', 'java基础', '数组', '将整数数组（7-6-3-5-4-1-2）按照堆排序的方式进行排序，请问在第一轮排序结束以后，数组的顺序是（）？', 'D', '5-4-3-2-1-6-7   ', '1-2-3-4-5-6-7', '2-6-3-5-4-1-7 ', '6-5-3-2-4-1-7', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('58', '单选题', '很难', 'java基础', '基本数据类型', '下列关于整型类型的说法中，正确的是（）？', 'B', 'short类型的数据存储顺序先低后高', 'Integer.MAX_VALUE表示整型最大值', 'Long.MIN_VALUE表示整型最大值', 'long类型表示数据范围和int类型一样', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('59', '单选题', '容易', 'java基础', '基本数据类型', '下面的语句中正确的表达式为 ', 'C', 'byte b = 128;', 'boolean n = null;', 'double d = 0.9239d;', 'float f = 0.9239;', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('60', '单选题', '中等', 'java基础', 'IO流', '下面哪个流类属于面向字符的输入流(  )', 'D', 'BufferedWriter', 'FileInputStream', 'ObjectInputStream', 'InputStreamReader', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('61', '单选题', '较易', 'java基础', 'IO流', '当检索一个压缩文件时，首先要建立压缩文件输入流对象，该对象（）', 'B', '以选中的压缩文件为参数', '以FileInputStream对象为参数', '以InputStreamReader对象为参数', '以BufferedReader对象为参数', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('62', '多选题', '很难', 'java基础', '集合', '下列说法正确的是（）', 'A,C', ' LinkedList继承自List', 'AbstractSet继承自Set', 'HashSet继承自AbstractSet', 'WeakMap继承自HashMap', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('63', '单选题', '很难', 'java基础', '集合', 'ArrayList list = new ArrayList(20);中的list扩充几次（）', 'A', '0', '1', '2', '3', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('64', '填空题', '容易', 'java基础', '基本数据类型', '浮点型数据根据数据存储长度和数值精度的不同，进一步分为float和(  )两种类型。', 'double', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('65', '填空题', '中等', 'java基础', '基本数据类型', '一个long型数据在内存占(  )个字节', '8', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('66', '填空题', '较难', 'java基础', '基本数据类型', '使用JDK工具生成的Java文档的文件格式是？', ' HTML格式', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('67', '多选题', '较易', 'java基础', '基本数据类型', '下列哪项属于Java语言的基本数据类型？', 'A,C,D', 'int', 'String', 'double', 'boolean', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('68', '单选题', '较易', 'java基础', '基本数据类型', '下列哪项不是int类型的字面量？A', 'A', '\\u03A6', '077', '0xABBC', ' 20', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('69', '单选题', '较难', 'java基础', '流程控制', '下面程序结果为： for (int i = 0; i < 10; i++) {\n            if (i == 3)\n                break;\n            System.out.print(i);\n        }', 'D', '0123', '012456789', '0123456789', '012', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('70', '多选题', '中等', 'java基础', '三大特性', '下列关于多态的叙述正确的是哪项？()', 'A,C', ' 父类的引用指向子类的实例是一种多态', '子类的引用指向子类的实例是一种多态', '接口的引用指向实现该接口类的实例是一种多态 ', '抽象类的引用指向抽象类的实例是一种多态', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('71', '多选题', '较难', 'java基础', 'java关键字', '下列哪些方法是在编译时刻绑定的？', 'A,B,C', ' 静态方法', ' private方法', 'final方法', '非private方法', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('72', '填空题', '较难', 'java基础', '类，接口', '成员变量的定义格式如下：', '（[< 修饰符 >] ）<变量类型 ><变量名 >（=<初值 >）', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('73', '填空题', '较易', 'java基础', 'java关键字', '在非静态成员方法中，可以使用() 关键字访问类的其他非静态成员。', 'this', null, null, null, null, null, null, '公共题库', null);
INSERT INTO `question` VALUES ('74', '填空题', '较难', 'java基础', 'IO流', 'Java 的输入输出流包括 __________、字符流、文件流、对象流以及 多线程之间通信的管道。', '字节流', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('75', '填空题', '容易', 'java基础', 'IO流', '在 Java 中，()类用于操 作磁盘中的文件和目录。', 'file', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('76', '判断题', '中等', 'java基础', '三大特性', 'java语言中不用区分字母的大写小写', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('77', '判断题', '容易', 'java基础', '基本数据类型', 'Java的字符类型采用的是Unicode编码，每个Unicode码占16个比特。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('78', '判断题', '较难', 'java基础', '基本数据类型', '浮点型数据在内存中都不能准确存储，会有精度丢失。', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('79', '判断题', '容易', 'java基础', '数组', '使用方法length( )可以获得字符串或数组的长度。', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('80', '判断题', '容易', 'java基础', '类，接口', '在Java程序中，可以使用private来修饰一个类。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('81', '判断题', '很难', 'java基础', '类，接口', '一个类的非静态方法可以访问静态成员变量。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('82', '判断题', '容易', 'java基础', 'IO流', 'InputStream类和OutputStream类是所有二进制I/O的根类。', '对', null, null, null, null, null, null, '公共题库', null);
INSERT INTO `question` VALUES ('83', '判断题', '很难', 'java基础', '多线程', '当调用一个正在进行线程的stop()方法时，该线程便会进入休眠状态。', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('84', '判断题', '中等', 'java基础', '异常', '可以使用throws语句来指明方法有异常抛出。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('85', '判断题', '较难', 'java基础', '集合', '在JAVA的集合框架中，Map接口是自Collection接口继承而来。', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('86', '判断题', '容易', 'java基础', '数组', '制造（new）数组时，要指定数组长度，以便为数组分配内存。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('87', '判断题', '较易', 'java基础', '三大特性', '如果一个类的声明中没有使用extends关键字，这个类被系统默认为是继承Object类。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('88', '简答题', '较难', 'java基础', '异常', '运行时异常和一般异常有何异同？', '异常表示程序运行过程中可能出现的非正常状态\n- 运行时异常表示虚拟机通常操作中可能遇到的异常，是一种常见的运行错误\n- java编译器要求方法必须声明或抛出可能发生的非运行时异常\n- 但是并不要求必须抛出声明未捕获的运行时异常', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('89', '简答题', '容易', 'java基础', '集合', 'Connection和Connections的区别？', ' connection是集合类的上级接口，继承于它的接口主要有Set和List\n- Connections是针对集合类的一个帮助类，它提供了一系列的静态方法实现了对各种集合的排序 搜索 和线程安全等操作', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('90', '简答题', '容易', 'java基础', '类，接口', '静态内部类和一般内部类的区别？', '态内部类可以不依赖于外部类实例被实例化, 一般内部类需要在外部类实例化后才能实例化', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('91', '简答题', '中等', 'java基础', '类，接口', 'String s = new String(“xyz”);创建了几个String Object？', '两个对象,一个是\"xyz\", 一个是指向\"xyz\"的引用对象', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('92', '简答题', '中等', 'java基础', '集合', 'List、Set、Map是否继承自Collection接口？', ' List、Set是继承于Collection接口,Map不是', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('93', '简答题', '较难', 'java基础', '基本数据类型', '常见的runtimeException有哪些？', 'ArithmeticException, ArrayStoreException,NullPointerException', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('94', '简答题', '较易', 'java基础', '类，接口', '构造器是否可以被重写？', '构造器不能被继承，因此不能被重写,但是可以被重载', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('95', '简答题', '很难', 'java基础', '基本数据类型', '用最有效率的方法算出2乘以8等于几？', '2<<3 这就是相当于2乘8', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('96', '简答题', '较难', 'java基础', '多线程', '当一个线程进入一个对象的一个synchronized方法后，其他线程是否可以进入此对象的其他方法？', '不能 一个对象的一个synchronized方法只能由一个线程访问。\n- 但是可以访问其它非synchronized的方法', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('97', '判断题', '容易', 'java基础', 'java关键字', '在Java的方法中定义一个常量要用const关键字', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('98', '判断题', '较难', 'java基础', '类，接口', '抽象方法必须在抽象类中，所以抽象类中的方法都必须是抽象方法。', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('99', '判断题', '较易', 'java基础', '类，接口', '覆盖的同名方法中，子类方法不能比父类方法的访问权限低。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('100', '判断题', '容易', 'java基础', '基本数据类型', '在Java中声明变量时必须指定一个类型。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('101', '判断题', '中等', 'java基础', '类，接口', 'package语句必须放在程序的第一句。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('102', '判断题', '较易', 'java基础', '异常', '在方法定义中，可能发生的异常都必须用try{} catch ){}捕捉。', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('103', '判断题', '容易', 'java基础', '三大特性', 'Java的类不允许多重继承，但接口支持多重继承。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('104', '判断题', '中等', 'java基础', '三大特性', '成员变量的值会因为对象的不同而不同。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('105', '判断题', '较难', 'java基础', 'java关键字', 'final 类可以有子类。', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('106', '判断题', '中等', 'java基础', 'java关键字', 'protected修饰的类，类中的所有方法只能给子类使用.', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('107', '判断题', '较难', 'java基础', '多线程', '线程结束等待或者阻塞状态后，会进入运行状态。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('108', '判断题', '很难', 'java基础', '数组', '二维数组中的元素还是一个数组.', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('109', '判断题', '较易', 'java基础', '流程控制', 'if()条件语句和switch()条件语句中的判断条件语句的值都是布尔类型', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('110', '判断题', '中等', 'java基础', '基本数据类型', '包装类可以将基本数据类型的值包装为引用数据类型的对象。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('111', '判断题', '较难', 'java基础', '多线程', 'Runtime类用于表示虚拟机运行时的状态，它用于封装JVM虚拟机进程。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('112', '填空题', '中等', 'java基础', '基本数据类型', '如果将类 MyClass声明为 public ，它的文件名称必须是（ ）才能正常编译。', ' MyClass.java ', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('113', '填空题', '中等', 'java基础', 'java关键字', 'Java 程序中的单行注释符是（  ），多行注释符是（）。', '//, /* / ', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('114', '填空题', '容易', 'java基础', '类，接口', '（）是Java程序中基本的结构单位。', '类', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('115', '填空题', '中等', 'java基础', '基本数据类型', ' 表达式1/2*9的计算结果是（）。', '0', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('116', '填空题', '很难', 'java基础', '基本数据类型', '表达式\"b\"+10的值为（ ），‘b’+10的值为（ ）。', 'b10,108', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('117', '填空题', '较难', 'java基础', '基本数据类型', 'Java中用于定义整型变量的关键字有四个：（ ）（ ）（ ）（long）', 'byte,short,int,long', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('118', '填空题', '容易', 'java基础', 'java关键字', '在一个Java应用程序中main方法必须被说明为(   )。', 'public static void', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('119', '填空题', '容易', 'java基础', '类，接口', 'Java源文件中有多个类，但只能有一个类是_类。', 'public', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('120', '填空题', '较难', 'java基础', '基本数据类型', ' Java语言规定标识符由字母、下划线、美元符号和数字组成，并且第一个字符不能是_。', '数字', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('121', '填空题', '较难', 'java基础', '流程控制', '34 Java语言的控制语句有3种类型，即条件语句、_____、和转移语句。', '循环语句', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('122', '填空题', '容易', 'java基础', '流程控制', '35 Java中有两种类型的控制语句即if和_____。', 'switch', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('123', '填空题', '较难', 'java基础', '流程控制', 'do-while循环和while循环的区别是____________。', 'do-while循环体至少被执行一次', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('124', '填空题', '较难', 'java基础', '流程控制', '在同一个 switch语句中，case后的______必须互不相同。', '常量值', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('125', '填空题', '较易', 'java基础', '流程控制', '在循环体中，如果想结束本次循环可以用______ 语句。', 'continue', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('126', '填空题', '较难', 'java基础', '流程控制', '在循环体中，如果想跳出循环，结束整个循环可以用_____语句', 'break', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('127', '填空题', '较易', 'java基础', '类，接口', ' Java中成员变量又分为_____和类成员变量。', '实例成员变量', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('128', '填空题', '较难', 'java基础', '类，接口', '方法定义包括两部分:____和_____。', '方法声明,方法体', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('129', '填空题', '容易', 'java基础', 'java关键字', '在Java中，当一个方法不需要返回数据时返回类型必须是____。', 'void', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('130', '填空题', '中等', 'java基础', '类，接口', '65在Java程序语言中，它允许在一个class 中有几个方法，都有相同的名字，这种用法称为______。', '方法重载', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('131', '填空题', '较难', 'java基础', '类，接口', '______是一种特殊方法，它的名字必须与它所在的类的名字完全相同，并不返回任何数据类型。', '构造方法', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('132', '简答题', '中等', 'java基础', 'java关键字', '是否可以从一个static方法内部发出对非static方法的调用？ ', '不可以。因为非static方法是要与对象关联在一起的，必须创建一个对象后，才可以在该对象上进行方法调用，而static方法是静态方法，是属于类的方法，调用时不需要创建对象，可以直接调用。也就是说，当一个static方法被调用时，可能还没有创建任何实例对象.', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('133', '简答题', '较难', 'java基础', '基本数据类型', 'Integer与int的区别 ', '1、Integer是int的包装类；int是基本数据类型；2、Integer变量必须实例化后才能使用；int变量不需要；3、Integer实际是对象的引用，指向此new的Integer对象；int是直接存储数据值 ；4、Integer的默认值是null；int的默认值是0。', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('134', '简答题', '容易', 'java基础', '类，接口', '构造器Constructor是否可被override? ', '构造器Constructor不能被继承，因此不能被重写(Override)，但是可以被重载（Overload）', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('135', '简答题', '很难', 'java基础', '基本数据类型', 'String s = new String(“xyz”);创建了几个String Object?二者之间有什么区别？ ', '两个。第一个对象是字符串常量”xyz” 第二个对象是new String(“xyz”)的时候产生的，在堆中分配内存给这个对象，只不过这个对象的内容是指向字符串常量”xyz” 另外还有一个引用s，指向第二个对象。这是一个变量，在栈中分配内存。', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('136', '简答题', '较难', 'java基础', '三大特性', '面向对象的特征有哪些方面 ', '面向对象的三大特征：1.继承 2.封装 3.多态性\n（1）继承：就是保留父类的属性，开扩新的东西。通过子类可以实现继承，子类继承父类的所有状态和行为，同时添加自身的状态和行为。\n（2）封装：就是类的私有化。将代码及处理数据绑定在一起的一种编程机制，该机制保证程序和数据不受外部干扰。\n（3）多态：是允许将父对象设置成为和一个和多个它的子对象相等的技术。包括重载和重写。重载为编译时多态，重写是运行时多态。', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('137', '简答题', '较难', 'java基础', '类，接口', '类和对象的关系？ ', '1、类是抽象概念，对象是类具体的实例。2、一个类可以有多个对象，而一个对象只能属于一个类3、创建对象是类的主要使用方式', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('138', '简答题', '较难', 'java基础', 'java关键字', 'Java中，请说明final关键字的使用 ', '1.用来修饰数据，包括成员变量和局部变量，该变量只能被赋值一次且它的值无法被改变。对于成员变量来讲，我们必须在声明时或者构造方法中对它赋值；2.用来修饰方法参数，表示在变量的生存期中它的值不能被改变；3.修饰方法，表示该方法无法被重写；4.修饰类，表示该类无法被继承。', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('139', '简答题', '很难', 'java基础', '异常', 'java异常处理的五个关键字及其作用。', '1.try：执行可能产生异常的代码2.catch：捕获异常3.finally：无论是否发生异常，此处代码总能执行4.throws：声明异常，声明方法可能抛出的各种异常5.throw：抛出异常，手动抛出异常', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('140', '简答题', '较难', 'java基础', '正则表达式', '正则表达式是什么，有什么作用。', '正则表达式是一个String对象的字符序列，该字符序列中含有具有特殊意义字符，这些特殊字符称做正则表达式中的元字符。是一种匹配字符串的方法，通过一些特殊符号，实现快速查找、删除、替换某个特定字符串。可以使用正则表达式进行字符序列的替换和分解等操作。', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('141', '简答题', '较难', 'java基础', '三大特性', '作用域：public,private,protected,以及不写时的区别', 'ava的四个访问修饰符：\n访问权限    类    包    子类   其他包\npublic       ∨     ∨     ∨      ∨\nprotected     ∨     ∨      ∨      ×\ndefault      ∨     ∨      ×       ×\nprivate      ∨      ×      ×       ×', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('142', '简答题', '中等', 'java基础', '类，接口', '抽象类和接口的区别？', '抽象类的成员变量具有访问级别，而接口的成员变量都是public访问级别,抽象类可以包含字段，而接口不可以,抽象类可以继承接口，而接口不能继承抽象类,抽象类的成员可以具体实现，而接口不行, 抽象类的子类可以选择性的的实现父类的抽象方法，而接口的子类必须全部实现', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('143', '简答题', '很难', 'java基础', '集合', 'hashMap和hashTable的区别？', 'hashMap允许空键值，而hashTable不允许空键值, hashMap是非同步的，hashTable是同步的，hashMap的效率高与hashTable，但是hashTable线程更加安全.hashMap去掉了hashTable中的contians方法，但是加上了contiansKey()和contiansValue()方法.', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('144', '简答题', '很难', 'java基础', '集合', 'Connection和Connections的区别？', 'connection是集合类的上级接口，继承于它的接口主要有Set和List,Connections是针对集合类的一个帮助类，它提供了一系列的静态方法实现了对各种集合的排序 搜索 和线程安全等操作', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('145', '简答题', '很难', 'java基础', '多线程', 'sleep和wait的区别？', 'sleep是线程(Thread)的方法，导致此线程暂停执行指点的时间，给其他线程执行的机会， 但是监控状态依然保持，到时候会自动的恢复。也就是说调用sleep不会释放对象锁，也就是数睡着的时候也抱着这把锁没有放开, wait是Object类的方法，调用wait方法导致本线程放弃对象锁，进入等待此对象等待锁定池，只有针对此对象发出notify方法.', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('146', '简答题', '较难', 'java基础', '异常', 'error和Exception有什么区别？', 'error表示恢复不是不可能，但是很困难的情况下的一种严重的问题，比如内存溢出，不可能指望程序员能处理这样的情况，也就是说程序员无法处理的情况,exception表示一种设计或实现问题，也就是说，它表示如果程序运行正常，从不会发生的情况.', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('147', '简答题', '很难', 'java基础', '基本数据类型', 'Math.round(11.5)等于多少？Math.round(-11.5)等于多少', 'Math.round(11.5)=12, Math.round(-11.5)=-11,round方法返回与参数接近的长整数，参数加1/2后求floor', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('148', '简答题', '很难', 'java基础', '多线程', '启动一个线程是用run()还是start()？', '启动一个线程是调用start()方法, 使线程所代表的虚拟处理机处于可运行状态，这意味着它可以由JVM调度并执行,这并不意味着线程就会立即运行，run()方法可以产生必须退出的标志来停止一个线程。', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('149', '多选题', '中等', 'java基础', '基本数据类型', '下列哪些选项能正确地创建一个字符串对象？', 'A,B', 'String str = \"Hello World!\";', 'String str = new String(\"Hello World!\"); ', 'String str = \'Hello World!\'; ', 'String str = new String[] {\"Hello World!\"};', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('150', '多选题', '中等', 'java基础', '基本数据类型', '下列哪些操作符是Java的逻辑操作符？', 'A,B,C', '|| ', '！', '&', '^', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('151', '多选题', '较难', 'java基础', 'java关键字', '下列哪些关键字是Java的访问修饰符？', 'A,B,C', 'protected ', 'private ', 'public ', 'static', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('152', '多选题', '中等', 'java基础', '数组', '下列哪些选项能正确地定义一个数组？', 'A,B', 'int[] arr = {1, 2, 3}; ', 'int arr[] = new int[]{1, 2, 3}; ', 'int[3] arr = {1, 2, 3}; ', 'int[] arr = new int[3]{1, 2, 3};', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('153', '多选题', '较难', 'java基础', '集合', '下列哪些选项能正确地创建一个ArrayList？', 'A,B,C', 'ArrayList list = new ArrayList();', 'List list = new ArrayList();', 'List<String> list = new ArrayList<>(); ', ' ArrayList<String> list = new List<>();', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('154', '多选题', '很难', 'java基础', '类，接口', '下列哪些选项能正确地定义一个接口？', 'A,C,D', ' interface MyInterface {} ', 'abstract interface MyInterface {} ', 'interface MyInterface { void doSomething(); } ', 'public interface MyInterface { void doSomething(); }', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('155', '多选题', '较易', 'java基础', '多线程', '下列哪些选项能正确地创建一个线程？', 'A,C,D', 'new Thread().start(); ', 'Thread t = new Thread(); t.run(); ', ' Runnable r = () -> { System.out.println(\"Hello World!\"); }; Thread t = new Thread(r); t.start(); ', 'Thread t = new Thread(() -> { System.out.println(\"Hello World!\"); });', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('156', '多选题', '很难', 'java基础', '异常', '下列哪些选项能正确地创建一个异常？', 'A,B', ' throw new Exception(\"Something went wrong.\");', 'throw new RuntimeException(\"Something went wrong.\"); ', ' try { /* some code / } catch (Exception e) {} ', 'try { / some code */ } catch (IOException e) {}', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('157', '多选题', '容易', 'java基础', '基本数据类型', '下面哪些数据类型可以用来表示小数', 'B,C', 'int ', 'double ', 'float ', 'char', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('158', '多选题', '较难', 'java基础', '基本数据类型', '下面哪些集合类实现了Map接口', 'A,C', 'HashMap ', 'ArrayList ', 'TreeMap ', 'HashSet', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('159', '多选题', '较难', 'java基础', '类，接口', 'Java 中，下面哪些关键字可以用于声明类？', 'A,C', 'class', 'void', 'public', 'static', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('160', '多选题', '中等', 'java基础', '基本数据类型', 'Java 中，下面哪些关键字可以用于声明变量？', 'B,C,D', 'void', 'int', 'final', 'static', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('161', '填空题', '较易', 'java基础', '类，接口', '在类方法中只能调用类变量和类方法，不能调用___方法。', '实例', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('162', '填空题', '容易', 'java基础', '类，接口', '72实例方法既能对类变量操作也能对实例变量操作，而类方法只能对____―进行操作。', '类变量', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('163', '填空题', '很难', 'java基础', '基本数据类型', 'Java中用类创建一个对象包括___和为___两个步骤。', '对象的声明，对象分配内存', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('164', '填空题', '中等', 'java基础', '类，接口', '一个类通过使用____运算符可以创建多个不同对象，这些对象将分配不同得内存空间。', 'new', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('165', '填空题', '较难', 'java基础', '类，接口', '79对象创建完后，通过使用运算符“.”,对象可以实现对变量的访问和____的调用。', '方法', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('168', '单选题', '中等', 'java基础', '三大特性', '1111111111', 'A', 'ssssss', 'ddddddd', 'ddd', 'dd', '', null, '公共题库', '2023-05-18 16:53:55');
INSERT INTO `question` VALUES ('169', '判断题', '中等', 'java基础', '异常', 'java使用try处理异常', '对', null, null, null, null, null, null, '公共题库', null);
INSERT INTO `question` VALUES ('170', '单选题', '较难', 'java基础', '数组', '在表长为n的顺序表上做插入运算，平均要移动的结点数为()', 'C', 'n/4', 'n/3', 'n/2', 'n', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('171', '判断题', '容易', 'java基础', '数组', '数组元素的下标值越大，存取时间越长，这样的说法正确吗？（）', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('172', '单选题', '中等', 'java基础', '类，接口', '欲构造ArrayList下列哪个叙述是正确的类的一个实例，此类继承了List接口，下列哪个方法是正确的 ？（）', 'B', ' ArrayList myList=new Object（）；', ' List myList=new ArrayList（）;', 'ArrayList myList=new List（）;', 'List myList=new List（）;', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('173', '单选题', '较易', 'java基础', '异常', '以下关于异常捕获的原则中，错误的是（）', 'D', 'RuntimeException 可以不被捕获，Java会自动处理运行期异常。', '先列出子类，后列出父类', '先列出具体的异常类，后列出通用的异常类。', 'Exception类必须出现，而且必须作为catch块中第一个匹配的类。', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('174', '多选题', '容易', 'java基础', '基本数据类型', '下面哪些不是java的简单数据类型?（）', 'B,C', 'short', 'Boolean', 'Double', 'float', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('175', '多选题', '容易', 'java基础', '类，接口', '不能用来修饰interface的有（）', 'A,C', 'private', 'public', 'protected', 'static', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('176', '简答题', '较易', 'java基础', '基本数据类型', '== 和 equals 的区别是什么？（）', '    对于基本类型，==比较的是值；  对于引用类型，==比较的是地址；equals不能用于基本类型的比较；如果没有重写equals，equals就相当于==；  如果重写了equals方法，equals比较的是对象的内容；', null, null, null, null, null, null, '公共题库', null);
INSERT INTO `question` VALUES ('177', '判断题', '容易', 'java基础', '基本数据类型', 'String属于基础数据类型（）', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('178', '简答题', '中等', 'java基础', '反射', '什么是反射？', '所谓反射，是java在运行时进行自我观察的能力，通过class、constructor、field、method四个方法获取一个类的各个组成部分。\n\n在Java运行时环境中，对任意一个类，可以知道类有哪些属性和方法。这种动态获取类的信息以及动态调用对象的方法的功能来自于反射机制。', null, null, null, null, null, null, '公共题库', null);
INSERT INTO `question` VALUES ('179', '填空题', '较难', 'java基础', '三大特性', '面向对象程序设计的三个特征是（）', '封装，继承，多态', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('180', '填空题', '中等', 'java基础', '类，接口', '（）是Java的关键字，用来定义类。', 'class', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('181', '填空题', '较易', 'java基础', '基本数据类型', 'Java中用于定义整型变量的关键字有四个：（）', 'byte,short,int,long', null, null, null, null, null, null, '公共题库', null);
INSERT INTO `question` VALUES ('182', '填空题', '较难', 'java基础', '泛型', '泛型的作用是支持类型( )。', '参数化', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('183', '单选题', '较难', 'java基础', 'java关键字', '在使用super 和this关键字时，以下描述正确的是()', 'A', '在子类构造方法中使用super()显示调用父类的构造方法，super()必须写在子类构造方法的第一行，否则编译不通过。', ' super()和this()不一定要放在构造方法内第一行。', 'this()和super()可以同时出现在一个构造函数中', 'this()和super()可以在static环境中使用，包括static方法和static语句块', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('184', '单选题', '中等', 'java基础', '三大特性', '以下对封装的描述正确的是()', 'D', '只能对一个类中的方法进行封装，不能对属性进行封装。', '如果子类继承了父类，对于父类中进行封装的方法，子类仍然可以直接调用。', '封装的意义不大，因此在编码时尽量不要使用。', '封装的主要作用在于对外隐藏内部实现细节，增强程序的安全性。', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('185', '单选题', '较难', 'java基础', 'java关键字', '以下说法错误的是()', 'D', 'super.方法()可以调用父类的所有非私有方法。', 'super()可以调用父类的所有非私有构造函数。', 'super.属性可以调用父类的所有非私有属性。', 'this和super关键字可以出现在同一个构造函数中。', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('186', '多选题', '很难', 'java基础', 'java关键字', ' 以下关于final关键字说法错误的是()', 'A,C', 'final是java中的修饰符，可以修饰类、接口、抽象类、方法和属性。', ' final修饰的类肯定不能被继承。', 'final修饰的方法不能被重载。', 'final修饰的变量不允许被再次赋值。', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('187', '单选题', '中等', 'java基础', 'java关键字', '访问修饰符作用范围由大到小是()', 'D', ' private-default-protected-public', 'public-default-protected-private', 'private-protected-default-public', ' public-protected-default-private', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('188', '单选题', '中等', 'java基础', '类，接口', '以下()不是Object类的方法', 'D', 'clone()', ' finalize()', 'toString()', 'hasNext()', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('189', '单选题', '较难', 'java基础', '三大特性', '多态的表现形式有()', 'A', '重写', '抽象', '继承', '封装', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('190', '单选题', '容易', 'java基础', '类，接口', ' 以下对抽象类的描述正确的是', 'C', '抽象类没有构造方法', '抽象类必须提供抽象方法', '有抽象方法的类一定是抽象类', '抽象类可以通过new关键字直接实例化', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('191', '单选题', '较易', 'java基础', '类，接口', ' 以下对接口描述错误的有()', 'D', '接口没有提供构造方法', '接口中的方法默认使用public、abstract修饰', '接口中的属性默认使用public、static、final修饰', '接口不允许多继承', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('192', '单选题', '很难', 'java基础', '流程控制', '下代码，描述正确的有()interface IDemo{\n\npublic static final String name; 1\n\nvoid print(); 2\n\npublic void getInfo(); 3\n\n}\n\nabstract class Person implements IDemo{ 4\n\npublic void print(){\n\n}\n\n}\n', 'A', '第1行错误，没有给变量赋值', '第2行错误，方法没有修饰符', '第4行错误，没有实现接口的全部方法', '第3行错误，没有方法的实现', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('193', '单选题', '较易', 'java基础', '类，接口', '以下描述正确的有()', 'B', '方法的重写应用在一个类的内部', '方法的重载与返回值类型无关', '构造方法不能重载', '构造方法可以重写', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('194', '单选题', '容易', 'java基础', '异常', '以下对异常的描述不正确的有（）。', 'C', '异常分为Error和Exception', 'Throwable是所有异常类的父类', 'Exception是所有异常类父类', 'Exception包括RuntimeException和RuntimeException之外的异常', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('195', '单选题', '中等', 'java基础', '异常', ' 在try-catch-finally语句块中，以下可以单独与finally一起使用的是()', 'B', 'catch', 'try', 'throws', 'throw', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('196', '单选题', '较易', 'java基础', '异常', ' 以下对自定义异常描述正确的是（）', 'C', '自定义异常必须继承Exception。', '自定义异常可以继承自Error。', '自定义异常可以更加明确定位异常出错的位置和给出详细出错信息。', '程序中已经提供了丰富的异常类，使用自定义异常没有意义。', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('197', '单选题', '容易', 'python编程', '网络编程', '以下对TCP和UDP描述正确的是()', 'D', 'TCP不能提供数据的可靠性。', 'UDP能够保证数据库的可靠性。', 'TCP数据传输效率高于UDP。', 'UDP数据传输效率高于TCP。', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('198', '单选题', '中等', 'java基础', '集合', 'Java中，关于HashMap类的描述，以下错误的是( )。', 'B', 'HashMap使用键/值得形式保存数据', 'HashMap 能够保证其中元素的顺序', 'HashMap允许将null用作键', ' HashMap允许将null用作值', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('199', '单选题', '很难', 'java基础', '集合', 'Java中的集合类包括ArrayList、LinkedList、HashMap等类，下列关于集合类描述错误的是（）', 'C', 'ArrayList和LinkedList均实现了List接口', ' ArrayList的访问速度比LinkedList快', '添加和删除元素时，ArrayList的表现更佳', 'HashMap实现Map接口，它允许任何类型的键和值对象，并允许将null用作键或值', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('200', '简答题', '中等', 'java基础', '类，接口', '请讲述String 和StringBuffer的区别？', 'String 类所定义的对象是用于存放”长度固定”的字符串。\nStringBuffer类所定义的对象是用于存放”长度可变动”的字符串。', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('201', '简答题', '较难', 'java基础', '多线程', '分析sleep()和wait()方法的区别。', 'sleep睡眠的意思 : sleep() 方法用来暂时中止执行的线程。在睡眠后，线程将进入就绪状态。wait等待的意思: 如果调用了 wait() 方法，线程将处于等待状态。用于在两个或多个线程并发运行时。', null, null, null, null, null, null, '公共题库', null);
INSERT INTO `question` VALUES ('202', '判断题', '很难', 'java基础', '类，接口', '抽象方法可以为静态', '错', null, null, null, null, null, null, '公共题库', null);
INSERT INTO `question` VALUES ('203', '多选题', '较难', 'java基础', '基本数据类型', '下面关于变量及其范围的陈述哪些是不正确的（ ）', 'B,C', '实例变量是类的成员变量', '实例变量用关键字static声明', '在方法中定义的局部变量在该方法被执行时创建', '局部变量在使用前必须被初始化', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('204', '单选题', '容易', 'java基础', '基本数据类型', 'Java语言中，String类的IndexOf()方法返回的类型是？', 'C', 'Int16', 'Int32', 'int', 'long', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('205', '单选题', '较易', 'java基础', '多线程', '那个方法是一个类实现java.lang.Runnable interface时要定义的？', 'B', 'void run()', ' public void run()', ' public void start()', 'public void run(int priority)', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('206', '单选题', '容易', 'java基础', '基本数据类型', 'char的值范围?', 'B', '0 … 32767', '0 … 65535', '–256 … 255', '–32768 … 32767', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('207', '多选题', '较难', 'java基础', '数组', '两个可以创建数组实例? ', 'A,D', 'int[] ia = new int [15];', 'float fa = new float [20];', 'char[] ca = “Some String”;', 'Object oa = new float[20];', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('208', '多选题', '较难', 'java基础', '多线程', '下面能让线程停止执行的有( )', 'A,B,D', 'sleep();', 'stop();', 'notify();', 'synchronized();', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('209', '单选题', '较易', 'java基础', '流程控制', 'Java程序的执行过程中用到一套JDK工具，其中java.exe是指( ) ', 'B', 'Java文档生成器 。', 'Java解释器。', 'Java编译器.', 'Java类分解器.', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('210', '单选题', '中等', 'java基础', '基本数据类型', '下面的程序输出结果为？\npublic static void main(String[] args) {\n        int x=-3;\n        int y=-10;\n        System.out.println(y%x);\n    }', 'A', '-1', '2', '1', '3', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('211', '单选题', '很难', 'java基础', '异常', '（  ）类是所有异常类的父类', 'A', 'Throwable', 'Error', 'Exception', 'AWTError', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('212', '单选题', '很难', 'java基础', '数组', '将整数数组（7-6-3-5-4-1-2）按照堆排序的方式进行排序，请问在第一轮排序结束以后，数组的顺序是（）？', 'D', '5-4-3-2-1-6-7   ', '1-2-3-4-5-6-7', '2-6-3-5-4-1-7 ', '6-5-3-2-4-1-7', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('213', '单选题', '很难', 'java基础', '基本数据类型', '下列关于整型类型的说法中，正确的是（）？', 'B', 'short类型的数据存储顺序先低后高', 'Integer.MAX_VALUE表示整型最大值', 'Long.MIN_VALUE表示整型最大值', 'long类型表示数据范围和int类型一样', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('214', '单选题', '容易', 'java基础', '基本数据类型', '下面的语句中正确的表达式为 ', 'C', 'byte b = 128;', 'boolean n = null;', 'double d = 0.9239d;', 'float f = 0.9239;', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('215', '单选题', '中等', 'java基础', 'IO流', '下面哪个流类属于面向字符的输入流(  )', 'D', 'BufferedWriter', 'FileInputStream', 'ObjectInputStream', 'InputStreamReader', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('217', '多选题', '很难', 'java基础', '集合', '下列说法正确的是（）', 'A,C', ' LinkedList继承自List', 'AbstractSet继承自Set', 'HashSet继承自AbstractSet', 'WeakMap继承自HashMap', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('219', '填空题', '容易', 'java基础', '基本数据类型', '浮点型数据根据数据存储长度和数值精度的不同，进一步分为float和(  )两种类型。', 'double', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('220', '填空题', '中等', 'java基础', '基本数据类型', '一个long型数据在内存占(  )个字节', '8', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('221', '填空题', '较难', 'java基础', '基本数据类型', '使用JDK工具生成的Java文档的文件格式是？', ' HTML格式', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('222', '多选题', '较易', 'java基础', '基本数据类型', '下列哪项属于Java语言的基本数据类型？', 'A,C,D', 'int', 'String', 'double', 'boolean', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('225', '多选题', '中等', 'java基础', '三大特性', '下列关于多态的叙述正确的是哪项？()', 'A,C', ' 父类的引用指向子类的实例是一种多态', '子类的引用指向子类的实例是一种多态', '接口的引用指向实现该接口类的实例是一种多态 ', '抽象类的引用指向抽象类的实例是一种多态', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('226', '多选题', '较难', 'java基础', 'java关键字', '下列哪些方法是在编译时刻绑定的？', 'A,B,C', ' 静态方法', ' private方法', 'final方法', '非private方法', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('227', '填空题', '较难', 'java基础', '类，接口', '成员变量的定义格式如下：', '（[< 修饰符 >] ）<变量类型 ><变量名 >（=<初值 >）', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('228', '填空题', '较易', 'java基础', 'java关键字', '在非静态成员方法中，可以使用() 关键字访问类的其他非静态成员。', 'this', null, null, null, null, null, null, '公共题库', null);
INSERT INTO `question` VALUES ('229', '填空题', '较难', 'java基础', 'IO流', 'Java 的输入输出流包括 __________、字符流、文件流、对象流以及 多线程之间通信的管道。', '字节流', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('230', '填空题', '容易', 'java基础', 'IO流', '在 Java 中，()类用于操 作磁盘中的文件和目录。', 'file', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('231', '判断题', '中等', 'java基础', '三大特性', 'java语言中不用区分字母的大写小写', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('232', '判断题', '容易', 'java基础', '基本数据类型', 'Java的字符类型采用的是Unicode编码，每个Unicode码占16个比特。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('233', '判断题', '较难', 'java基础', '基本数据类型', '浮点型数据在内存中都不能准确存储，会有精度丢失。', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('234', '判断题', '容易', 'java基础', '数组', '使用方法length( )可以获得字符串或数组的长度。', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('235', '判断题', '容易', 'java基础', '类，接口', '在Java程序中，可以使用private来修饰一个类。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('236', '判断题', '很难', 'java基础', '类，接口', '一个类的非静态方法可以访问静态成员变量。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('237', '判断题', '容易', 'java基础', 'IO流', 'InputStream类和OutputStream类是所有二进制I/O的根类。', '对', null, null, null, null, null, null, '公共题库', null);
INSERT INTO `question` VALUES ('238', '判断题', '很难', 'java基础', '多线程', '当调用一个正在进行线程的stop()方法时，该线程便会进入休眠状态。', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('239', '判断题', '中等', 'java基础', '异常', '可以使用throws语句来指明方法有异常抛出。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('240', '判断题', '较难', 'java基础', '集合', '在JAVA的集合框架中，Map接口是自Collection接口继承而来。', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('241', '判断题', '容易', 'java基础', '数组', '制造（new）数组时，要指定数组长度，以便为数组分配内存。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('242', '判断题', '较易', 'java基础', '三大特性', '如果一个类的声明中没有使用extends关键字，这个类被系统默认为是继承Object类。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('243', '简答题', '较难', 'java基础', '异常', '运行时异常和一般异常有何异同？', '异常表示程序运行过程中可能出现的非正常状态\n- 运行时异常表示虚拟机通常操作中可能遇到的异常，是一种常见的运行错误\n- java编译器要求方法必须声明或抛出可能发生的非运行时异常\n- 但是并不要求必须抛出声明未捕获的运行时异常', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('244', '简答题', '容易', 'java基础', '集合', 'Connection和Connections的区别？', ' connection是集合类的上级接口，继承于它的接口主要有Set和List\n- Connections是针对集合类的一个帮助类，它提供了一系列的静态方法实现了对各种集合的排序 搜索 和线程安全等操作', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('245', '简答题', '容易', 'java基础', '类，接口', '静态内部类和一般内部类的区别？', '态内部类可以不依赖于外部类实例被实例化, 一般内部类需要在外部类实例化后才能实例化', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('246', '简答题', '中等', 'java基础', '类，接口', 'String s = new String(“xyz”);创建了几个String Object？', '两个对象,一个是\"xyz\", 一个是指向\"xyz\"的引用对象', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('247', '简答题', '中等', 'java基础', '集合', 'List、Set、Map是否继承自Collection接口？', ' List、Set是继承于Collection接口,Map不是', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('248', '简答题', '较难', 'java基础', '基本数据类型', '常见的runtimeException有哪些？', 'ArithmeticException, ArrayStoreException,NullPointerException', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('249', '简答题', '较易', 'java基础', '类，接口', '构造器是否可以被重写？', '构造器不能被继承，因此不能被重写,但是可以被重载', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('250', '简答题', '很难', 'java基础', '基本数据类型', '用最有效率的方法算出2乘以8等于几？', '2<<3 这就是相当于2乘8', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('251', '简答题', '较难', 'java基础', '多线程', '当一个线程进入一个对象的一个synchronized方法后，其他线程是否可以进入此对象的其他方法？', '不能 一个对象的一个synchronized方法只能由一个线程访问。\n- 但是可以访问其它非synchronized的方法', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('252', '判断题', '容易', 'java基础', 'java关键字', '在Java的方法中定义一个常量要用const关键字', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('253', '判断题', '较难', 'java基础', '类，接口', '抽象方法必须在抽象类中，所以抽象类中的方法都必须是抽象方法。', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('254', '判断题', '较易', 'java基础', '类，接口', '覆盖的同名方法中，子类方法不能比父类方法的访问权限低。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('255', '判断题', '容易', 'java基础', '基本数据类型', '在Java中声明变量时必须指定一个类型。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('256', '判断题', '中等', 'java基础', '类，接口', 'package语句必须放在程序的第一句。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('257', '判断题', '较易', 'java基础', '异常', '在方法定义中，可能发生的异常都必须用try{} catch ){}捕捉。', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('258', '判断题', '容易', 'java基础', '三大特性', 'Java的类不允许多重继承，但接口支持多重继承。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('259', '判断题', '中等', 'java基础', '三大特性', '成员变量的值会因为对象的不同而不同。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('260', '判断题', '较难', 'java基础', 'java关键字', 'final 类可以有子类。', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('261', '判断题', '中等', 'java基础', 'java关键字', 'protected修饰的类，类中的所有方法只能给子类使用.', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('262', '判断题', '较难', 'java基础', '多线程', '线程结束等待或者阻塞状态后，会进入运行状态。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('263', '判断题', '很难', 'java基础', '数组', '二维数组中的元素还是一个数组.', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('264', '判断题', '较易', 'java基础', '流程控制', 'if()条件语句和switch()条件语句中的判断条件语句的值都是布尔类型', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('265', '判断题', '中等', 'java基础', '基本数据类型', '包装类可以将基本数据类型的值包装为引用数据类型的对象。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('266', '判断题', '较难', 'java基础', '多线程', 'Runtime类用于表示虚拟机运行时的状态，它用于封装JVM虚拟机进程。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('267', '填空题', '中等', 'java基础', '基本数据类型', '如果将类 MyClass声明为 public ，它的文件名称必须是（ ）才能正常编译。', ' MyClass.java ', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('268', '填空题', '中等', 'java基础', 'java关键字', 'Java 程序中的单行注释符是（  ），多行注释符是（）。', '//, /* / ', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('269', '填空题', '容易', 'java基础', '类，接口', '（）是Java程序中基本的结构单位。', '类', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('270', '填空题', '中等', 'java基础', '基本数据类型', ' 表达式1/2*9的计算结果是（）。', '0', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('271', '填空题', '很难', 'java基础', '基本数据类型', '表达式\"b\"+10的值为（ ），‘b’+10的值为（ ）。', 'b10,108', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('272', '填空题', '较难', 'java基础', '基本数据类型', 'Java中用于定义整型变量的关键字有四个：（ ）（ ）（ ）（long）', 'byte,short,int,long', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('273', '填空题', '容易', 'java基础', 'java关键字', '在一个Java应用程序中main方法必须被说明为(   )。', 'public static void', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('274', '填空题', '容易', 'java基础', '类，接口', 'Java源文件中有多个类，但只能有一个类是_类。', 'public', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('275', '填空题', '较难', 'java基础', '基本数据类型', ' Java语言规定标识符由字母、下划线、美元符号和数字组成，并且第一个字符不能是_。', '数字', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('276', '填空题', '较难', 'java基础', '流程控制', '34 Java语言的控制语句有3种类型，即条件语句、_____、和转移语句。', '循环语句', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('277', '填空题', '容易', 'java基础', '流程控制', '35 Java中有两种类型的控制语句即if和_____。', 'switch', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('278', '填空题', '较难', 'java基础', '流程控制', 'do-while循环和while循环的区别是____________。', 'do-while循环体至少被执行一次', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('279', '填空题', '较难', 'java基础', '流程控制', '在同一个 switch语句中，case后的______必须互不相同。', '常量值', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('280', '填空题', '较易', 'java基础', '流程控制', '在循环体中，如果想结束本次循环可以用______ 语句。', 'continue', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('281', '填空题', '较难', 'java基础', '流程控制', '在循环体中，如果想跳出循环，结束整个循环可以用_____语句', 'break', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('282', '填空题', '较易', 'java基础', '类，接口', ' Java中成员变量又分为_____和类成员变量。', '实例成员变量', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('283', '填空题', '较难', 'java基础', '类，接口', '方法定义包括两部分:____和_____。', '方法声明,方法体', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('284', '填空题', '容易', 'java基础', 'java关键字', '在Java中，当一个方法不需要返回数据时返回类型必须是____。', 'void', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('285', '填空题', '中等', 'java基础', '类，接口', '65在Java程序语言中，它允许在一个class 中有几个方法，都有相同的名字，这种用法称为______。', '方法重载', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('286', '填空题', '较难', 'java基础', '类，接口', '______是一种特殊方法，它的名字必须与它所在的类的名字完全相同，并不返回任何数据类型。', '构造方法', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('287', '简答题', '中等', 'java基础', 'java关键字', '是否可以从一个static方法内部发出对非static方法的调用？ ', '不可以。因为非static方法是要与对象关联在一起的，必须创建一个对象后，才可以在该对象上进行方法调用，而static方法是静态方法，是属于类的方法，调用时不需要创建对象，可以直接调用。也就是说，当一个static方法被调用时，可能还没有创建任何实例对象.', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('288', '简答题', '较难', 'java基础', '基本数据类型', 'Integer与int的区别 ', '1、Integer是int的包装类；int是基本数据类型；2、Integer变量必须实例化后才能使用；int变量不需要；3、Integer实际是对象的引用，指向此new的Integer对象；int是直接存储数据值 ；4、Integer的默认值是null；int的默认值是0。', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('289', '简答题', '容易', 'java基础', '类，接口', '构造器Constructor是否可被override? ', '构造器Constructor不能被继承，因此不能被重写(Override)，但是可以被重载（Overload）', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('290', '简答题', '很难', 'java基础', '基本数据类型', 'String s = new String(“xyz”);创建了几个String Object?二者之间有什么区别？ ', '两个。第一个对象是字符串常量”xyz” 第二个对象是new String(“xyz”)的时候产生的，在堆中分配内存给这个对象，只不过这个对象的内容是指向字符串常量”xyz” 另外还有一个引用s，指向第二个对象。这是一个变量，在栈中分配内存。', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('291', '简答题', '较难', 'java基础', '三大特性', '面向对象的特征有哪些方面 ', '面向对象的三大特征：1.继承 2.封装 3.多态性\n（1）继承：就是保留父类的属性，开扩新的东西。通过子类可以实现继承，子类继承父类的所有状态和行为，同时添加自身的状态和行为。\n（2）封装：就是类的私有化。将代码及处理数据绑定在一起的一种编程机制，该机制保证程序和数据不受外部干扰。\n（3）多态：是允许将父对象设置成为和一个和多个它的子对象相等的技术。包括重载和重写。重载为编译时多态，重写是运行时多态。', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('292', '简答题', '较难', 'java基础', '类，接口', '类和对象的关系？ ', '1、类是抽象概念，对象是类具体的实例。2、一个类可以有多个对象，而一个对象只能属于一个类3、创建对象是类的主要使用方式', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('293', '简答题', '较难', 'java基础', 'java关键字', 'Java中，请说明final关键字的使用 ', '1.用来修饰数据，包括成员变量和局部变量，该变量只能被赋值一次且它的值无法被改变。对于成员变量来讲，我们必须在声明时或者构造方法中对它赋值；2.用来修饰方法参数，表示在变量的生存期中它的值不能被改变；3.修饰方法，表示该方法无法被重写；4.修饰类，表示该类无法被继承。', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('294', '简答题', '很难', 'java基础', '异常', 'java异常处理的五个关键字及其作用。', '1.try：执行可能产生异常的代码2.catch：捕获异常3.finally：无论是否发生异常，此处代码总能执行4.throws：声明异常，声明方法可能抛出的各种异常5.throw：抛出异常，手动抛出异常', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('295', '简答题', '较难', 'java基础', '正则表达式', '正则表达式是什么，有什么作用。', '正则表达式是一个String对象的字符序列，该字符序列中含有具有特殊意义字符，这些特殊字符称做正则表达式中的元字符。是一种匹配字符串的方法，通过一些特殊符号，实现快速查找、删除、替换某个特定字符串。可以使用正则表达式进行字符序列的替换和分解等操作。', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('296', '简答题', '较难', 'java基础', '三大特性', '作用域：public,private,protected,以及不写时的区别', 'ava的四个访问修饰符：\n访问权限    类    包    子类   其他包\npublic       ∨     ∨     ∨      ∨\nprotected     ∨     ∨      ∨      ×\ndefault      ∨     ∨      ×       ×\nprivate      ∨      ×      ×       ×', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('297', '简答题', '中等', 'java基础', '类，接口', '抽象类和接口的区别？', '抽象类的成员变量具有访问级别，而接口的成员变量都是public访问级别,抽象类可以包含字段，而接口不可以,抽象类可以继承接口，而接口不能继承抽象类,抽象类的成员可以具体实现，而接口不行, 抽象类的子类可以选择性的的实现父类的抽象方法，而接口的子类必须全部实现', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('298', '简答题', '很难', 'java基础', '集合', 'hashMap和hashTable的区别？', 'hashMap允许空键值，而hashTable不允许空键值, hashMap是非同步的，hashTable是同步的，hashMap的效率高与hashTable，但是hashTable线程更加安全.hashMap去掉了hashTable中的contians方法，但是加上了contiansKey()和contiansValue()方法.', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('299', '简答题', '很难', 'java基础', '集合', 'Connection和Connections的区别？', 'connection是集合类的上级接口，继承于它的接口主要有Set和List,Connections是针对集合类的一个帮助类，它提供了一系列的静态方法实现了对各种集合的排序 搜索 和线程安全等操作', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('300', '简答题', '很难', 'java基础', '多线程', 'sleep和wait的区别？', 'sleep是线程(Thread)的方法，导致此线程暂停执行指点的时间，给其他线程执行的机会， 但是监控状态依然保持，到时候会自动的恢复。也就是说调用sleep不会释放对象锁，也就是数睡着的时候也抱着这把锁没有放开, wait是Object类的方法，调用wait方法导致本线程放弃对象锁，进入等待此对象等待锁定池，只有针对此对象发出notify方法.', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('301', '简答题', '较难', 'java基础', '异常', 'error和Exception有什么区别？', 'error表示恢复不是不可能，但是很困难的情况下的一种严重的问题，比如内存溢出，不可能指望程序员能处理这样的情况，也就是说程序员无法处理的情况,exception表示一种设计或实现问题，也就是说，它表示如果程序运行正常，从不会发生的情况.', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('302', '简答题', '很难', 'java基础', '基本数据类型', 'Math.round(11.5)等于多少？Math.round(-11.5)等于多少', 'Math.round(11.5)=12, Math.round(-11.5)=-11,round方法返回与参数接近的长整数，参数加1/2后求floor', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('303', '简答题', '很难', 'java基础', '多线程', '启动一个线程是用run()还是start()？', '启动一个线程是调用start()方法, 使线程所代表的虚拟处理机处于可运行状态，这意味着它可以由JVM调度并执行,这并不意味着线程就会立即运行，run()方法可以产生必须退出的标志来停止一个线程。', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('304', '多选题', '中等', 'java基础', '基本数据类型', '下列哪些选项能正确地创建一个字符串对象？', 'A,B', 'String str = \"Hello World!\";', 'String str = new String(\"Hello World!\"); ', 'String str = \'Hello World!\'; ', 'String str = new String[] {\"Hello World!\"};', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('305', '多选题', '中等', 'java基础', '基本数据类型', '下列哪些操作符是Java的逻辑操作符？', 'A,B,C', '|| ', '！', '&', '^', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('306', '多选题', '较难', 'java基础', 'java关键字', '下列哪些关键字是Java的访问修饰符？', 'A,B,C', 'protected ', 'private ', 'public ', 'static', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('307', '多选题', '中等', 'java基础', '数组', '下列哪些选项能正确地定义一个数组？', 'A,B', 'int[] arr = {1, 2, 3}; ', 'int arr[] = new int[]{1, 2, 3}; ', 'int[3] arr = {1, 2, 3}; ', 'int[] arr = new int[3]{1, 2, 3};', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('308', '多选题', '较难', 'java基础', '集合', '下列哪些选项能正确地创建一个ArrayList？', 'A,B,C', 'ArrayList list = new ArrayList();', 'List list = new ArrayList();', 'List<String> list = new ArrayList<>(); ', ' ArrayList<String> list = new List<>();', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('309', '多选题', '很难', 'java基础', '类，接口', '下列哪些选项能正确地定义一个接口？', 'A,C,D', ' interface MyInterface {} ', 'abstract interface MyInterface {} ', 'interface MyInterface { void doSomething(); } ', 'public interface MyInterface { void doSomething(); }', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('310', '多选题', '较易', 'java基础', '多线程', '下列哪些选项能正确地创建一个线程？', 'A,C,D', 'new Thread().start(); ', 'Thread t = new Thread(); t.run(); ', ' Runnable r = () -> { System.out.println(\"Hello World!\"); }; Thread t = new Thread(r); t.start(); ', 'Thread t = new Thread(() -> { System.out.println(\"Hello World!\"); });', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('311', '多选题', '很难', 'java基础', '异常', '下列哪些选项能正确地创建一个异常？', 'A,B', ' throw new Exception(\"Something went wrong.\");', 'throw new RuntimeException(\"Something went wrong.\"); ', ' try { /* some code / } catch (Exception e) {} ', 'try { / some code */ } catch (IOException e) {}', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('312', '多选题', '容易', 'java基础', '基本数据类型', '下面哪些数据类型可以用来表示小数', 'B,C', 'int ', 'double ', 'float ', 'char', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('313', '多选题', '较难', 'java基础', '基本数据类型', '下面哪些集合类实现了Map接口', 'A,C', 'HashMap ', 'ArrayList ', 'TreeMap ', 'HashSet', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('314', '多选题', '较难', 'java基础', '类，接口', 'Java 中，下面哪些关键字可以用于声明类？', 'A,C', 'class', 'void', 'public', 'static', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('315', '多选题', '中等', 'java基础', '基本数据类型', 'Java 中，下面哪些关键字可以用于声明变量？', 'B,C,D', 'void', 'int', 'final', 'static', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('316', '填空题', '较易', 'java基础', '类，接口', '在类方法中只能调用类变量和类方法，不能调用___方法。', '实例', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('317', '填空题', '容易', 'java基础', '类，接口', '72实例方法既能对类变量操作也能对实例变量操作，而类方法只能对____―进行操作。', '类变量', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('318', '填空题', '很难', 'java基础', '基本数据类型', 'Java中用类创建一个对象包括___和为___两个步骤。', '对象的声明，对象分配内存', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('319', '填空题', '中等', 'java基础', '类，接口', '一个类通过使用____运算符可以创建多个不同对象，这些对象将分配不同得内存空间。', 'new', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('320', '填空题', '较难', 'java基础', '类，接口', '79对象创建完后，通过使用运算符“.”,对象可以实现对变量的访问和____的调用。', '方法', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('425', '单选题', '较难', 'java基础', '数组', '在表长为n的顺序表上做插入运算，平均要移动的结点数为()', 'C', 'n/4', 'n/3', 'n/2', 'n', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('426', '判断题', '容易', 'java基础', '数组', '数组元素的下标值越大，存取时间越长，这样的说法正确吗？（）', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('427', '单选题', '中等', 'java基础', '类，接口', '欲构造ArrayList下列哪个叙述是正确的类的一个实例，此类继承了List接口，下列哪个方法是正确的 ？（）', 'B', ' ArrayList myList=new Object（）；', ' List myList=new ArrayList（）;', 'ArrayList myList=new List（）;', 'List myList=new List（）;', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('428', '单选题', '较易', 'java基础', '异常', '以下关于异常捕获的原则中，错误的是（）', 'D', 'RuntimeException 可以不被捕获，Java会自动处理运行期异常。', '先列出子类，后列出父类', '先列出具体的异常类，后列出通用的异常类。', 'Exception类必须出现，而且必须作为catch块中第一个匹配的类。', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('429', '多选题', '容易', 'java基础', '基本数据类型', '下面哪些不是java的简单数据类型?（）', 'B,C', 'short', 'Boolean', 'Double', 'float', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('430', '多选题', '容易', 'java基础', '类，接口', '不能用来修饰interface的有（）', 'A,C', 'private', 'public', 'protected', 'static', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('431', '简答题', '较易', 'java基础', '基本数据类型', '== 和 equals 的区别是什么？（）', '    对于基本类型，==比较的是值；  对于引用类型，==比较的是地址；equals不能用于基本类型的比较；如果没有重写equals，equals就相当于==；  如果重写了equals方法，equals比较的是对象的内容；', null, null, null, null, null, null, '公共题库', null);
INSERT INTO `question` VALUES ('432', '判断题', '容易', 'java基础', '基本数据类型', 'String属于基础数据类型（）', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('433', '简答题', '中等', 'java基础', '反射', '什么是反射？', '所谓反射，是java在运行时进行自我观察的能力，通过class、constructor、field、method四个方法获取一个类的各个组成部分。\n\n在Java运行时环境中，对任意一个类，可以知道类有哪些属性和方法。这种动态获取类的信息以及动态调用对象的方法的功能来自于反射机制。', null, null, null, null, null, null, '公共题库', null);
INSERT INTO `question` VALUES ('434', '填空题', '较难', 'java基础', '三大特性', '面向对象程序设计的三个特征是（）', '封装，继承，多态', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('435', '填空题', '中等', 'java基础', '类，接口', '（）是Java的关键字，用来定义类。', 'class', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('436', '填空题', '较易', 'java基础', '基本数据类型', 'Java中用于定义整型变量的关键字有四个：（）', 'byte,short,int,long', null, null, null, null, null, null, '公共题库', null);
INSERT INTO `question` VALUES ('437', '填空题', '较难', 'java基础', '泛型', '泛型的作用是支持类型( )。', '参数化', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('438', '单选题', '较难', 'java基础', 'java关键字', '在使用super 和this关键字时，以下描述正确的是()', 'A', '在子类构造方法中使用super()显示调用父类的构造方法，super()必须写在子类构造方法的第一行，否则编译不通过。', ' super()和this()不一定要放在构造方法内第一行。', 'this()和super()可以同时出现在一个构造函数中', 'this()和super()可以在static环境中使用，包括static方法和static语句块', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('439', '单选题', '中等', 'java基础', '三大特性', '以下对封装的描述正确的是()', 'D', '只能对一个类中的方法进行封装，不能对属性进行封装。', '如果子类继承了父类，对于父类中进行封装的方法，子类仍然可以直接调用。', '封装的意义不大，因此在编码时尽量不要使用。', '封装的主要作用在于对外隐藏内部实现细节，增强程序的安全性。', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('440', '单选题', '较难', 'java基础', 'java关键字', '以下说法错误的是()', 'D', 'super.方法()可以调用父类的所有非私有方法。', 'super()可以调用父类的所有非私有构造函数。', 'super.属性可以调用父类的所有非私有属性。', 'this和super关键字可以出现在同一个构造函数中。', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('441', '多选题', '很难', 'java基础', 'java关键字', ' 以下关于final关键字说法错误的是()', 'A,C', 'final是java中的修饰符，可以修饰类、接口、抽象类、方法和属性。', ' final修饰的类肯定不能被继承。', 'final修饰的方法不能被重载。', 'final修饰的变量不允许被再次赋值。', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('442', '单选题', '中等', 'java基础', 'java关键字', '访问修饰符作用范围由大到小是()', 'D', ' private-default-protected-public', 'public-default-protected-private', 'private-protected-default-public', ' public-protected-default-private', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('443', '单选题', '中等', 'java基础', '类，接口', '以下()不是Object类的方法', 'D', 'clone()', ' finalize()', 'toString()', 'hasNext()', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('444', '单选题', '较难', 'java基础', '三大特性', '多态的表现形式有()', 'A', '重写', '抽象', '继承', '封装', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('445', '单选题', '容易', 'java基础', '类，接口', ' 以下对抽象类的描述正确的是', 'C', '抽象类没有构造方法', '抽象类必须提供抽象方法', '有抽象方法的类一定是抽象类', '抽象类可以通过new关键字直接实例化', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('446', '单选题', '较易', 'java基础', '类，接口', ' 以下对接口描述错误的有()', 'D', '接口没有提供构造方法', '接口中的方法默认使用public、abstract修饰', '接口中的属性默认使用public、static、final修饰', '接口不允许多继承', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('447', '单选题', '很难', 'java基础', '流程控制', '下代码，描述正确的有()interface IDemo{\n\npublic static final String name; 1\n\nvoid print(); 2\n\npublic void getInfo(); 3\n\n}\n\nabstract class Person implements IDemo{ 4\n\npublic void print(){\n\n}\n\n}\n', 'A', '第1行错误，没有给变量赋值', '第2行错误，方法没有修饰符', '第4行错误，没有实现接口的全部方法', '第3行错误，没有方法的实现', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('448', '单选题', '较易', 'java基础', '类，接口', '以下描述正确的有()', 'B', '方法的重写应用在一个类的内部', '方法的重载与返回值类型无关', '构造方法不能重载', '构造方法可以重写', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('449', '单选题', '容易', 'java基础', '异常', '以下对异常的描述不正确的有（）。', 'C', '异常分为Error和Exception', 'Throwable是所有异常类的父类', 'Exception是所有异常类父类', 'Exception包括RuntimeException和RuntimeException之外的异常', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('450', '单选题', '中等', 'java基础', '异常', ' 在try-catch-finally语句块中，以下可以单独与finally一起使用的是()', 'B', 'catch', 'try', 'throws', 'throw', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('451', '单选题', '较易', 'java基础', '异常', ' 以下对自定义异常描述正确的是（）', 'C', '自定义异常必须继承Exception。', '自定义异常可以继承自Error。', '自定义异常可以更加明确定位异常出错的位置和给出详细出错信息。', '程序中已经提供了丰富的异常类，使用自定义异常没有意义。', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('452', '单选题', '容易', 'python编程', '网络编程', '以下对TCP和UDP描述正确的是()', 'D', 'TCP不能提供数据的可靠性。', 'UDP能够保证数据库的可靠性。', 'TCP数据传输效率高于UDP。', 'UDP数据传输效率高于TCP。', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('453', '单选题', '中等', 'java基础', '集合', 'Java中，关于HashMap类的描述，以下错误的是( )。', 'B', 'HashMap使用键/值得形式保存数据', 'HashMap 能够保证其中元素的顺序', 'HashMap允许将null用作键', ' HashMap允许将null用作值', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('454', '单选题', '很难', 'java基础', '集合', 'Java中的集合类包括ArrayList、LinkedList、HashMap等类，下列关于集合类描述错误的是（）', 'C', 'ArrayList和LinkedList均实现了List接口', ' ArrayList的访问速度比LinkedList快', '添加和删除元素时，ArrayList的表现更佳', 'HashMap实现Map接口，它允许任何类型的键和值对象，并允许将null用作键或值', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('455', '简答题', '中等', 'java基础', '类，接口', '请讲述String 和StringBuffer的区别？', 'String 类所定义的对象是用于存放”长度固定”的字符串。\nStringBuffer类所定义的对象是用于存放”长度可变动”的字符串。', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('456', '简答题', '较难', 'java基础', '多线程', '分析sleep()和wait()方法的区别。', 'sleep睡眠的意思 : sleep() 方法用来暂时中止执行的线程。在睡眠后，线程将进入就绪状态。wait等待的意思: 如果调用了 wait() 方法，线程将处于等待状态。用于在两个或多个线程并发运行时。', null, null, null, null, null, null, '公共题库', null);
INSERT INTO `question` VALUES ('457', '判断题', '很难', 'java基础', '类，接口', '抽象方法可以为静态', '错', null, null, null, null, null, null, '公共题库', null);
INSERT INTO `question` VALUES ('458', '多选题', '较难', 'java基础', '基本数据类型', '下面关于变量及其范围的陈述哪些是不正确的（ ）', 'B,C', '实例变量是类的成员变量', '实例变量用关键字static声明', '在方法中定义的局部变量在该方法被执行时创建', '局部变量在使用前必须被初始化', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('459', '单选题', '容易', 'java基础', '基本数据类型', 'Java语言中，String类的IndexOf()方法返回的类型是？', 'C', 'Int16', 'Int32', 'int', 'long', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('460', '单选题', '较易', 'java基础', '多线程', '那个方法是一个类实现java.lang.Runnable interface时要定义的？', 'B', 'void run()', ' public void run()', ' public void start()', 'public void run(int priority)', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('461', '单选题', '容易', 'java基础', '基本数据类型', 'char的值范围?', 'B', '0 … 32767', '0 … 65535', '–256 … 255', '–32768 … 32767', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('462', '多选题', '较难', 'java基础', '数组', '两个可以创建数组实例? ', 'A,D', 'int[] ia = new int [15];', 'float fa = new float [20];', 'char[] ca = “Some String”;', 'Object oa = new float[20];', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('463', '多选题', '较难', 'java基础', '多线程', '下面能让线程停止执行的有( )', 'A,B,D', 'sleep();', 'stop();', 'notify();', 'synchronized();', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('464', '单选题', '较易', 'java基础', '流程控制', 'Java程序的执行过程中用到一套JDK工具，其中java.exe是指( ) ', 'B', 'Java文档生成器 。', 'Java解释器。', 'Java编译器.', 'Java类分解器.', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('465', '单选题', '中等', 'java基础', '基本数据类型', '下面的程序输出结果为？\npublic static void main(String[] args) {\n        int x=-3;\n        int y=-10;\n        System.out.println(y%x);\n    }', 'A', '-1', '2', '1', '3', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('466', '单选题', '很难', 'java基础', '异常', '（  ）类是所有异常类的父类', 'A', 'Throwable', 'Error', 'Exception', 'AWTError', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('467', '单选题', '很难', 'java基础', '数组', '将整数数组（7-6-3-5-4-1-2）按照堆排序的方式进行排序，请问在第一轮排序结束以后，数组的顺序是（）？', 'D', '5-4-3-2-1-6-7   ', '1-2-3-4-5-6-7', '2-6-3-5-4-1-7 ', '6-5-3-2-4-1-7', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('468', '单选题', '很难', 'java基础', '基本数据类型', '下列关于整型类型的说法中，正确的是（）？', 'B', 'short类型的数据存储顺序先低后高', 'Integer.MAX_VALUE表示整型最大值', 'Long.MIN_VALUE表示整型最大值', 'long类型表示数据范围和int类型一样', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('469', '单选题', '容易', 'java基础', '基本数据类型', '下面的语句中正确的表达式为 ', 'C', 'byte b = 128;', 'boolean n = null;', 'double d = 0.9239d;', 'float f = 0.9239;', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('470', '单选题', '中等', 'java基础', 'IO流', '下面哪个流类属于面向字符的输入流(  )', 'D', 'BufferedWriter', 'FileInputStream', 'ObjectInputStream', 'InputStreamReader', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('471', '单选题', '较易', 'java基础', 'IO流', '当检索一个压缩文件时，首先要建立压缩文件输入流对象，该对象（）', 'B', '以选中的压缩文件为参数', '以FileInputStream对象为参数', '以InputStreamReader对象为参数', '以BufferedReader对象为参数', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('472', '多选题', '很难', 'java基础', '集合', '下列说法正确的是（）', 'A,C', ' LinkedList继承自List', 'AbstractSet继承自Set', 'HashSet继承自AbstractSet', 'WeakMap继承自HashMap', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('473', '单选题', '很难', 'java基础', '集合', 'ArrayList list = new ArrayList(20);中的list扩充几次（）', 'A', '0', '1', '2', '3', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('474', '填空题', '容易', 'java基础', '基本数据类型', '浮点型数据根据数据存储长度和数值精度的不同，进一步分为float和(  )两种类型。', 'double', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('475', '填空题', '中等', 'java基础', '基本数据类型', '一个long型数据在内存占(  )个字节', '8', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('476', '填空题', '较难', 'java基础', '基本数据类型', '使用JDK工具生成的Java文档的文件格式是？', ' HTML格式', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('477', '多选题', '较易', 'java基础', '基本数据类型', '下列哪项属于Java语言的基本数据类型？', 'A,C,D', 'int', 'String', 'double', 'boolean', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('478', '单选题', '较易', 'java基础', '基本数据类型', '下列哪项不是int类型的字面量？A', 'A', '\\u03A6', '077', '0xABBC', ' 20', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('479', '单选题', '较难', 'java基础', '流程控制', '下面程序结果为： for (int i = 0; i < 10; i++) {\n            if (i == 3)\n                break;\n            System.out.print(i);\n        }', 'D', '0123', '012456789', '0123456789', '012', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('480', '多选题', '中等', 'java基础', '三大特性', '下列关于多态的叙述正确的是哪项？()', 'A,C', ' 父类的引用指向子类的实例是一种多态', '子类的引用指向子类的实例是一种多态', '接口的引用指向实现该接口类的实例是一种多态 ', '抽象类的引用指向抽象类的实例是一种多态', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('481', '多选题', '较难', 'java基础', 'java关键字', '下列哪些方法是在编译时刻绑定的？', 'A,B,C', ' 静态方法', ' private方法', 'final方法', '非private方法', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('482', '填空题', '较难', 'java基础', '类，接口', '成员变量的定义格式如下：', '（[< 修饰符 >] ）<变量类型 ><变量名 >（=<初值 >）', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('483', '填空题', '较易', 'java基础', 'java关键字', '在非静态成员方法中，可以使用() 关键字访问类的其他非静态成员。', 'this', null, null, null, null, null, null, '公共题库', null);
INSERT INTO `question` VALUES ('484', '填空题', '较难', 'java基础', 'IO流', 'Java 的输入输出流包括 __________、字符流、文件流、对象流以及 多线程之间通信的管道。', '字节流', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('485', '填空题', '容易', 'java基础', 'IO流', '在 Java 中，()类用于操 作磁盘中的文件和目录。', 'file', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('486', '判断题', '中等', 'java基础', '三大特性', 'java语言中不用区分字母的大写小写', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('487', '判断题', '容易', 'java基础', '基本数据类型', 'Java的字符类型采用的是Unicode编码，每个Unicode码占16个比特。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('488', '判断题', '较难', 'java基础', '基本数据类型', '浮点型数据在内存中都不能准确存储，会有精度丢失。', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('489', '判断题', '容易', 'java基础', '数组', '使用方法length( )可以获得字符串或数组的长度。', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('490', '判断题', '容易', 'java基础', '类，接口', '在Java程序中，可以使用private来修饰一个类。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('491', '判断题', '很难', 'java基础', '类，接口', '一个类的非静态方法可以访问静态成员变量。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('492', '判断题', '容易', 'java基础', 'IO流', 'InputStream类和OutputStream类是所有二进制I/O的根类。', '对', null, null, null, null, null, null, '公共题库', null);
INSERT INTO `question` VALUES ('493', '判断题', '很难', 'java基础', '多线程', '当调用一个正在进行线程的stop()方法时，该线程便会进入休眠状态。', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('494', '判断题', '中等', 'java基础', '异常', '可以使用throws语句来指明方法有异常抛出。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('495', '判断题', '较难', 'java基础', '集合', '在JAVA的集合框架中，Map接口是自Collection接口继承而来。', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('496', '判断题', '容易', 'java基础', '数组', '制造（new）数组时，要指定数组长度，以便为数组分配内存。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('497', '判断题', '较易', 'java基础', '三大特性', '如果一个类的声明中没有使用extends关键字，这个类被系统默认为是继承Object类。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('498', '简答题', '较难', 'java基础', '异常', '运行时异常和一般异常有何异同？', '异常表示程序运行过程中可能出现的非正常状态\n- 运行时异常表示虚拟机通常操作中可能遇到的异常，是一种常见的运行错误\n- java编译器要求方法必须声明或抛出可能发生的非运行时异常\n- 但是并不要求必须抛出声明未捕获的运行时异常', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('499', '简答题', '容易', 'java基础', '集合', 'Connection和Connections的区别？', ' connection是集合类的上级接口，继承于它的接口主要有Set和List\n- Connections是针对集合类的一个帮助类，它提供了一系列的静态方法实现了对各种集合的排序 搜索 和线程安全等操作', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('500', '简答题', '容易', 'java基础', '类，接口', '静态内部类和一般内部类的区别？', '态内部类可以不依赖于外部类实例被实例化, 一般内部类需要在外部类实例化后才能实例化', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('501', '简答题', '中等', 'java基础', '类，接口', 'String s = new String(“xyz”);创建了几个String Object？', '两个对象,一个是\"xyz\", 一个是指向\"xyz\"的引用对象', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('502', '简答题', '中等', 'java基础', '集合', 'List、Set、Map是否继承自Collection接口？', ' List、Set是继承于Collection接口,Map不是', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('503', '简答题', '较难', 'java基础', '基本数据类型', '常见的runtimeException有哪些？', 'ArithmeticException, ArrayStoreException,NullPointerException', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('504', '简答题', '较易', 'java基础', '类，接口', '构造器是否可以被重写？', '构造器不能被继承，因此不能被重写,但是可以被重载', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('505', '简答题', '很难', 'java基础', '基本数据类型', '用最有效率的方法算出2乘以8等于几？', '2<<3 这就是相当于2乘8', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('506', '简答题', '较难', 'java基础', '多线程', '当一个线程进入一个对象的一个synchronized方法后，其他线程是否可以进入此对象的其他方法？', '不能 一个对象的一个synchronized方法只能由一个线程访问。\n- 但是可以访问其它非synchronized的方法', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('507', '判断题', '容易', 'java基础', 'java关键字', '在Java的方法中定义一个常量要用const关键字', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('508', '判断题', '较难', 'java基础', '类，接口', '抽象方法必须在抽象类中，所以抽象类中的方法都必须是抽象方法。', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('509', '判断题', '较易', 'java基础', '类，接口', '覆盖的同名方法中，子类方法不能比父类方法的访问权限低。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('510', '判断题', '容易', 'java基础', '基本数据类型', '在Java中声明变量时必须指定一个类型。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('511', '判断题', '中等', 'java基础', '类，接口', 'package语句必须放在程序的第一句。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('512', '判断题', '较易', 'java基础', '异常', '在方法定义中，可能发生的异常都必须用try{} catch ){}捕捉。', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('513', '判断题', '容易', 'java基础', '三大特性', 'Java的类不允许多重继承，但接口支持多重继承。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('514', '判断题', '中等', 'java基础', '三大特性', '成员变量的值会因为对象的不同而不同。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('515', '判断题', '较难', 'java基础', 'java关键字', 'final 类可以有子类。', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('516', '判断题', '中等', 'java基础', 'java关键字', 'protected修饰的类，类中的所有方法只能给子类使用.', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('517', '判断题', '较难', 'java基础', '多线程', '线程结束等待或者阻塞状态后，会进入运行状态。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('518', '判断题', '很难', 'java基础', '数组', '二维数组中的元素还是一个数组.', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('519', '判断题', '较易', 'java基础', '流程控制', 'if()条件语句和switch()条件语句中的判断条件语句的值都是布尔类型', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('520', '判断题', '中等', 'java基础', '基本数据类型', '包装类可以将基本数据类型的值包装为引用数据类型的对象。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('521', '判断题', '较难', 'java基础', '多线程', 'Runtime类用于表示虚拟机运行时的状态，它用于封装JVM虚拟机进程。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('522', '填空题', '中等', 'java基础', '基本数据类型', '如果将类 MyClass声明为 public ，它的文件名称必须是（ ）才能正常编译。', ' MyClass.java ', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('523', '填空题', '中等', 'java基础', 'java关键字', 'Java 程序中的单行注释符是（  ），多行注释符是（）。', '//, /* / ', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('524', '填空题', '容易', 'java基础', '类，接口', '（）是Java程序中基本的结构单位。', '类', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('525', '填空题', '中等', 'java基础', '基本数据类型', ' 表达式1/2*9的计算结果是（）。', '0', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('526', '填空题', '很难', 'java基础', '基本数据类型', '表达式\"b\"+10的值为（ ），‘b’+10的值为（ ）。', 'b10,108', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('527', '填空题', '较难', 'java基础', '基本数据类型', 'Java中用于定义整型变量的关键字有四个：（ ）（ ）（ ）（long）', 'byte,short,int,long', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('528', '填空题', '容易', 'java基础', 'java关键字', '在一个Java应用程序中main方法必须被说明为(   )。', 'public static void', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('529', '填空题', '容易', 'java基础', '类，接口', 'Java源文件中有多个类，但只能有一个类是_类。', 'public', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('530', '填空题', '较难', 'java基础', '基本数据类型', ' Java语言规定标识符由字母、下划线、美元符号和数字组成，并且第一个字符不能是_。', '数字', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('531', '填空题', '较难', 'java基础', '流程控制', '34 Java语言的控制语句有3种类型，即条件语句、_____、和转移语句。', '循环语句', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('532', '填空题', '容易', 'java基础', '流程控制', '35 Java中有两种类型的控制语句即if和_____。', 'switch', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('533', '填空题', '较难', 'java基础', '流程控制', 'do-while循环和while循环的区别是____________。', 'do-while循环体至少被执行一次', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('534', '填空题', '较难', 'java基础', '流程控制', '在同一个 switch语句中，case后的______必须互不相同。', '常量值', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('535', '填空题', '较易', 'java基础', '流程控制', '在循环体中，如果想结束本次循环可以用______ 语句。', 'continue', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('536', '填空题', '较难', 'java基础', '流程控制', '在循环体中，如果想跳出循环，结束整个循环可以用_____语句', 'break', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('537', '填空题', '较易', 'java基础', '类，接口', ' Java中成员变量又分为_____和类成员变量。', '实例成员变量', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('538', '填空题', '较难', 'java基础', '类，接口', '方法定义包括两部分:____和_____。', '方法声明,方法体', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('542', '简答题', '中等', 'java基础', 'java关键字', '是否可以从一个static方法内部发出对非static方法的调用？ ', '不可以。因为非static方法是要与对象关联在一起的，必须创建一个对象后，才可以在该对象上进行方法调用，而static方法是静态方法，是属于类的方法，调用时不需要创建对象，可以直接调用。也就是说，当一个static方法被调用时，可能还没有创建任何实例对象.', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('543', '简答题', '较难', 'java基础', '基本数据类型', 'Integer与int的区别 ', '1、Integer是int的包装类；int是基本数据类型；2、Integer变量必须实例化后才能使用；int变量不需要；3、Integer实际是对象的引用，指向此new的Integer对象；int是直接存储数据值 ；4、Integer的默认值是null；int的默认值是0。', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('544', '简答题', '容易', 'java基础', '类，接口', '构造器Constructor是否可被override? ', '构造器Constructor不能被继承，因此不能被重写(Override)，但是可以被重载（Overload）', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('545', '简答题', '很难', 'java基础', '基本数据类型', 'String s = new String(“xyz”);创建了几个String Object?二者之间有什么区别？ ', '两个。第一个对象是字符串常量”xyz” 第二个对象是new String(“xyz”)的时候产生的，在堆中分配内存给这个对象，只不过这个对象的内容是指向字符串常量”xyz” 另外还有一个引用s，指向第二个对象。这是一个变量，在栈中分配内存。', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('546', '简答题', '较难', 'java基础', '三大特性', '面向对象的特征有哪些方面 ', '面向对象的三大特征：1.继承 2.封装 3.多态性\n（1）继承：就是保留父类的属性，开扩新的东西。通过子类可以实现继承，子类继承父类的所有状态和行为，同时添加自身的状态和行为。\n（2）封装：就是类的私有化。将代码及处理数据绑定在一起的一种编程机制，该机制保证程序和数据不受外部干扰。\n（3）多态：是允许将父对象设置成为和一个和多个它的子对象相等的技术。包括重载和重写。重载为编译时多态，重写是运行时多态。', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('547', '简答题', '较难', 'java基础', '类，接口', '类和对象的关系？ ', '1、类是抽象概念，对象是类具体的实例。2、一个类可以有多个对象，而一个对象只能属于一个类3、创建对象是类的主要使用方式', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('548', '简答题', '较难', 'java基础', 'java关键字', 'Java中，请说明final关键字的使用 ', '1.用来修饰数据，包括成员变量和局部变量，该变量只能被赋值一次且它的值无法被改变。对于成员变量来讲，我们必须在声明时或者构造方法中对它赋值；2.用来修饰方法参数，表示在变量的生存期中它的值不能被改变；3.修饰方法，表示该方法无法被重写；4.修饰类，表示该类无法被继承。', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('549', '简答题', '很难', 'java基础', '异常', 'java异常处理的五个关键字及其作用。', '1.try：执行可能产生异常的代码2.catch：捕获异常3.finally：无论是否发生异常，此处代码总能执行4.throws：声明异常，声明方法可能抛出的各种异常5.throw：抛出异常，手动抛出异常', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('550', '简答题', '较难', 'java基础', '正则表达式', '正则表达式是什么，有什么作用。', '正则表达式是一个String对象的字符序列，该字符序列中含有具有特殊意义字符，这些特殊字符称做正则表达式中的元字符。是一种匹配字符串的方法，通过一些特殊符号，实现快速查找、删除、替换某个特定字符串。可以使用正则表达式进行字符序列的替换和分解等操作。', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('551', '简答题', '较难', 'java基础', '三大特性', '作用域：public,private,protected,以及不写时的区别', 'ava的四个访问修饰符：\n访问权限    类    包    子类   其他包\npublic       ∨     ∨     ∨      ∨\nprotected     ∨     ∨      ∨      ×\ndefault      ∨     ∨      ×       ×\nprivate      ∨      ×      ×       ×', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('552', '简答题', '中等', 'java基础', '类，接口', '抽象类和接口的区别？', '抽象类的成员变量具有访问级别，而接口的成员变量都是public访问级别,抽象类可以包含字段，而接口不可以,抽象类可以继承接口，而接口不能继承抽象类,抽象类的成员可以具体实现，而接口不行, 抽象类的子类可以选择性的的实现父类的抽象方法，而接口的子类必须全部实现', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('553', '简答题', '很难', 'java基础', '集合', 'hashMap和hashTable的区别？', 'hashMap允许空键值，而hashTable不允许空键值, hashMap是非同步的，hashTable是同步的，hashMap的效率高与hashTable，但是hashTable线程更加安全.hashMap去掉了hashTable中的contians方法，但是加上了contiansKey()和contiansValue()方法.', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('554', '简答题', '很难', 'java基础', '集合', 'Connection和Connections的区别？', 'connection是集合类的上级接口，继承于它的接口主要有Set和List,Connections是针对集合类的一个帮助类，它提供了一系列的静态方法实现了对各种集合的排序 搜索 和线程安全等操作', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('555', '简答题', '很难', 'java基础', '多线程', 'sleep和wait的区别？', 'sleep是线程(Thread)的方法，导致此线程暂停执行指点的时间，给其他线程执行的机会， 但是监控状态依然保持，到时候会自动的恢复。也就是说调用sleep不会释放对象锁，也就是数睡着的时候也抱着这把锁没有放开, wait是Object类的方法，调用wait方法导致本线程放弃对象锁，进入等待此对象等待锁定池，只有针对此对象发出notify方法.', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('556', '简答题', '较难', 'java基础', '异常', 'error和Exception有什么区别？', 'error表示恢复不是不可能，但是很困难的情况下的一种严重的问题，比如内存溢出，不可能指望程序员能处理这样的情况，也就是说程序员无法处理的情况,exception表示一种设计或实现问题，也就是说，它表示如果程序运行正常，从不会发生的情况.', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('557', '简答题', '很难', 'java基础', '基本数据类型', 'Math.round(11.5)等于多少？Math.round(-11.5)等于多少', 'Math.round(11.5)=12, Math.round(-11.5)=-11,round方法返回与参数接近的长整数，参数加1/2后求floor', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('558', '简答题', '很难', 'java基础', '多线程', '启动一个线程是用run()还是start()？', '启动一个线程是调用start()方法, 使线程所代表的虚拟处理机处于可运行状态，这意味着它可以由JVM调度并执行,这并不意味着线程就会立即运行，run()方法可以产生必须退出的标志来停止一个线程。', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('559', '多选题', '中等', 'java基础', '基本数据类型', '下列哪些选项能正确地创建一个字符串对象？', 'A,B', 'String str = \"Hello World!\";', 'String str = new String(\"Hello World!\"); ', 'String str = \'Hello World!\'; ', 'String str = new String[] {\"Hello World!\"};', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('560', '多选题', '中等', 'java基础', '基本数据类型', '下列哪些操作符是Java的逻辑操作符？', 'A,B,C', '|| ', '！', '&', '^', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('561', '多选题', '较难', 'java基础', 'java关键字', '下列哪些关键字是Java的访问修饰符？', 'A,B,C', 'protected ', 'private ', 'public ', 'static', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('562', '多选题', '中等', 'java基础', '数组', '下列哪些选项能正确地定义一个数组？', 'A,B', 'int[] arr = {1, 2, 3}; ', 'int arr[] = new int[]{1, 2, 3}; ', 'int[3] arr = {1, 2, 3}; ', 'int[] arr = new int[3]{1, 2, 3};', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('563', '多选题', '较难', 'java基础', '集合', '下列哪些选项能正确地创建一个ArrayList？', 'A,B,C', 'ArrayList list = new ArrayList();', 'List list = new ArrayList();', 'List<String> list = new ArrayList<>(); ', ' ArrayList<String> list = new List<>();', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('564', '多选题', '很难', 'java基础', '类，接口', '下列哪些选项能正确地定义一个接口？', 'A,C,D', ' interface MyInterface {} ', 'abstract interface MyInterface {} ', 'interface MyInterface { void doSomething(); } ', 'public interface MyInterface { void doSomething(); }', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('565', '多选题', '较易', 'java基础', '多线程', '下列哪些选项能正确地创建一个线程？', 'A,C,D', 'new Thread().start(); ', 'Thread t = new Thread(); t.run(); ', ' Runnable r = () -> { System.out.println(\"Hello World!\"); }; Thread t = new Thread(r); t.start(); ', 'Thread t = new Thread(() -> { System.out.println(\"Hello World!\"); });', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('566', '多选题', '很难', 'java基础', '异常', '下列哪些选项能正确地创建一个异常？', 'A,B', ' throw new Exception(\"Something went wrong.\");', 'throw new RuntimeException(\"Something went wrong.\"); ', ' try { /* some code / } catch (Exception e) {} ', 'try { / some code */ } catch (IOException e) {}', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('567', '多选题', '容易', 'java基础', '基本数据类型', '下面哪些数据类型可以用来表示小数', 'B,C', 'int ', 'double ', 'float ', 'char', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('568', '多选题', '较难', 'java基础', '基本数据类型', '下面哪些集合类实现了Map接口', 'A,C', 'HashMap ', 'ArrayList ', 'TreeMap ', 'HashSet', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('569', '多选题', '较难', 'java基础', '类，接口', 'Java 中，下面哪些关键字可以用于声明类？', 'A,C', 'class', 'void', 'public', 'static', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('570', '多选题', '中等', 'java基础', '基本数据类型', 'Java 中，下面哪些关键字可以用于声明变量？', 'B,C,D', 'void', 'int', 'final', 'static', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('576', '单选题', '中等', 'java基础', '三大特性', '1111111111', 'A', 'ssssss', 'ddddddd', 'ddd', 'dd', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('577', '判断题', '中等', 'java基础', '异常', 'java使用try处理异常', '对', null, null, null, null, null, null, '公共题库', null);
INSERT INTO `question` VALUES ('578', '单选题', '较难', 'java基础', '数组', '在表长为n的顺序表上做插入运算，平均要移动的结点数为()', 'C', 'n/4', 'n/3', 'n/2', 'n', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('579', '判断题', '容易', 'java基础', '数组', '数组元素的下标值越大，存取时间越长，这样的说法正确吗？（）', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('580', '单选题', '中等', 'java基础', '类，接口', '欲构造ArrayList下列哪个叙述是正确的类的一个实例，此类继承了List接口，下列哪个方法是正确的 ？（）', 'B', ' ArrayList myList=new Object（）；', ' List myList=new ArrayList（）;', 'ArrayList myList=new List（）;', 'List myList=new List（）;', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('581', '单选题', '较易', 'java基础', '异常', '以下关于异常捕获的原则中，错误的是（）', 'D', 'RuntimeException 可以不被捕获，Java会自动处理运行期异常。', '先列出子类，后列出父类', '先列出具体的异常类，后列出通用的异常类。', 'Exception类必须出现，而且必须作为catch块中第一个匹配的类。', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('582', '多选题', '容易', 'java基础', '基本数据类型', '下面哪些不是java的简单数据类型?（）', 'B,C', 'short', 'Boolean', 'Double', 'float', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('583', '多选题', '容易', 'java基础', '类，接口', '不能用来修饰interface的有（）', 'A,C', 'private', 'public', 'protected', 'static', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('584', '简答题', '较易', 'java基础', '基本数据类型', '== 和 equals 的区别是什么？（）', '    对于基本类型，==比较的是值；  对于引用类型，==比较的是地址；equals不能用于基本类型的比较；如果没有重写equals，equals就相当于==；  如果重写了equals方法，equals比较的是对象的内容；', null, null, null, null, null, null, '公共题库', null);
INSERT INTO `question` VALUES ('585', '判断题', '容易', 'java基础', '基本数据类型', 'String属于基础数据类型（）', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('586', '简答题', '中等', 'java基础', '反射', '什么是反射？', '所谓反射，是java在运行时进行自我观察的能力，通过class、constructor、field、method四个方法获取一个类的各个组成部分。\n\n在Java运行时环境中，对任意一个类，可以知道类有哪些属性和方法。这种动态获取类的信息以及动态调用对象的方法的功能来自于反射机制。', null, null, null, null, null, null, '公共题库', null);
INSERT INTO `question` VALUES ('594', '多选题', '很难', 'java基础', 'java关键字', ' 以下关于final关键字说法错误的是()', 'A,C', 'final是java中的修饰符，可以修饰类、接口、抽象类、方法和属性。', ' final修饰的类肯定不能被继承。', 'final修饰的方法不能被重载。', 'final修饰的变量不允许被再次赋值。', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('608', '简答题', '中等', 'java基础', '类，接口', '请讲述String 和StringBuffer的区别？', 'String 类所定义的对象是用于存放”长度固定”的字符串。\nStringBuffer类所定义的对象是用于存放”长度可变动”的字符串。', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('609', '简答题', '较难', 'java基础', '多线程', '分析sleep()和wait()方法的区别。', 'sleep睡眠的意思 : sleep() 方法用来暂时中止执行的线程。在睡眠后，线程将进入就绪状态。wait等待的意思: 如果调用了 wait() 方法，线程将处于等待状态。用于在两个或多个线程并发运行时。', null, null, null, null, null, null, '公共题库', null);
INSERT INTO `question` VALUES ('610', '判断题', '很难', 'java基础', '类，接口', '抽象方法可以为静态', '错', null, null, null, null, null, null, '公共题库', null);
INSERT INTO `question` VALUES ('611', '多选题', '较难', 'java基础', '基本数据类型', '下面关于变量及其范围的陈述哪些是不正确的（ ）', 'B,C', '实例变量是类的成员变量', '实例变量用关键字static声明', '在方法中定义的局部变量在该方法被执行时创建', '局部变量在使用前必须被初始化', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('615', '多选题', '较难', 'java基础', '数组', '两个可以创建数组实例? ', 'A,D', 'int[] ia = new int [15];', 'float fa = new float [20];', 'char[] ca = “Some String”;', 'Object oa = new float[20];', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('616', '多选题', '较难', 'java基础', '多线程', '下面能让线程停止执行的有( )', 'A,B,D', 'sleep();', 'stop();', 'notify();', 'synchronized();', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('624', '多选题', '很难', 'java基础', '集合', '下列说法正确的是（）', 'A,C', ' LinkedList继承自List', 'AbstractSet继承自Set', 'HashSet继承自AbstractSet', 'WeakMap继承自HashMap', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('628', '多选题', '较易', 'java基础', '基本数据类型', '下列哪项属于Java语言的基本数据类型？', 'A,C,D', 'int', 'String', 'double', 'boolean', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('629', '多选题', '中等', 'java基础', '三大特性', '下列关于多态的叙述正确的是哪项？()', 'A,C', ' 父类的引用指向子类的实例是一种多态', '子类的引用指向子类的实例是一种多态', '接口的引用指向实现该接口类的实例是一种多态 ', '抽象类的引用指向抽象类的实例是一种多态', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('630', '多选题', '较难', 'java基础', 'java关键字', '下列哪些方法是在编译时刻绑定的？', 'A,B,C', ' 静态方法', ' private方法', 'final方法', '非private方法', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('641', '判断题', '容易', 'java基础', 'IO流', 'InputStream类和OutputStream类是所有二进制I/O的根类。', '对', null, null, null, null, null, null, '公共题库', null);
INSERT INTO `question` VALUES ('642', '判断题', '很难', 'java基础', '多线程', '当调用一个正在进行线程的stop()方法时，该线程便会进入休眠状态。', '错', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('643', '判断题', '中等', 'java基础', '异常', '可以使用throws语句来指明方法有异常抛出。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('645', '判断题', '容易', 'java基础', '数组', '制造（new）数组时，要指定数组长度，以便为数组分配内存。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('646', '判断题', '较易', 'java基础', '三大特性', '如果一个类的声明中没有使用extends关键字，这个类被系统默认为是继承Object类。', '对', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('647', '简答题', '较难', 'java基础', '异常', '运行时异常和一般异常有何异同？', '异常表示程序运行过程中可能出现的非正常状态\n- 运行时异常表示虚拟机通常操作中可能遇到的异常，是一种常见的运行错误\n- java编译器要求方法必须声明或抛出可能发生的非运行时异常\n- 但是并不要求必须抛出声明未捕获的运行时异常', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('648', '简答题', '容易', 'java基础', '集合', 'Connection和Connections的区别？', ' connection是集合类的上级接口，继承于它的接口主要有Set和List\n- Connections是针对集合类的一个帮助类，它提供了一系列的静态方法实现了对各种集合的排序 搜索 和线程安全等操作', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('649', '简答题', '容易', 'java基础', '类，接口', '静态内部类和一般内部类的区别？', '态内部类可以不依赖于外部类实例被实例化, 一般内部类需要在外部类实例化后才能实例化', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('650', '简答题', '中等', 'java基础', '类，接口', 'String s = new String(“xyz”);创建了几个String Object？', '两个对象,一个是\"xyz\", 一个是指向\"xyz\"的引用对象', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('651', '简答题', '中等', 'java基础', '集合', 'List、Set、Map是否继承自Collection接口？', ' List、Set是继承于Collection接口,Map不是', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('652', '简答题', '较难', 'java基础', '基本数据类型', '常见的runtimeException有哪些？', 'ArithmeticException, ArrayStoreException,NullPointerException', null, null, null, null, '', null, '公共题库', null);
INSERT INTO `question` VALUES ('680', '多选题', '容易', 'java基础', '基本数据类型', '下面哪些不是java的简单数据类型?（）', 'B,C', 'short', 'Boolean', 'Double', 'float', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('681', '多选题', '容易', 'java基础', '类，接口', '不能用来修饰interface的有（）', 'A,C', 'private', 'public', 'protected', 'static', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('682', '多选题', '很难', 'java基础', 'java关键字', ' 以下关于final关键字说法错误的是()', 'A,C', 'final是java中的修饰符，可以修饰类、接口、抽象类、方法和属性。', ' final修饰的类肯定不能被继承。', 'final修饰的方法不能被重载。', 'final修饰的变量不允许被再次赋值。', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('683', '多选题', '较难', 'java基础', '基本数据类型', '下面关于变量及其范围的陈述哪些是不正确的（ ）', 'B,C', '实例变量是类的成员变量', '实例变量用关键字static声明', '在方法中定义的局部变量在该方法被执行时创建', '局部变量在使用前必须被初始化', null, null, '公共题库', null);
INSERT INTO `question` VALUES ('684', '多选题', '较难', 'java基础', '数组', '两个可以创建数组实例? ', 'A,D', 'int[] ia = new int [15];', 'float fa = new float [20];', 'char[] ca = “Some String”;', 'Object oa = new float[20];', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('685', '多选题', '较难', 'java基础', '多线程', '下面能让线程停止执行的有( )', 'A,B,D', 'sleep();', 'stop();', 'notify();', 'synchronized();', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('686', '多选题', '很难', 'java基础', '集合', '下列说法正确的是（）', 'A,C', ' LinkedList继承自List', 'AbstractSet继承自Set', 'HashSet继承自AbstractSet', 'WeakMap继承自HashMap', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('687', '多选题', '较易', 'java基础', '基本数据类型', '下列哪项属于Java语言的基本数据类型？', 'A,C,D', 'int', 'String', 'double', 'boolean', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('688', '多选题', '中等', 'java基础', '三大特性', '下列关于多态的叙述正确的是哪项？()', 'A,C', ' 父类的引用指向子类的实例是一种多态', '子类的引用指向子类的实例是一种多态', '接口的引用指向实现该接口类的实例是一种多态 ', '抽象类的引用指向抽象类的实例是一种多态', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('689', '多选题', '较难', 'java基础', 'java关键字', '下列哪些方法是在编译时刻绑定的？', 'A,B,C', ' 静态方法', ' private方法', 'final方法', '非private方法', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('690', '多选题', '中等', 'java基础', '基本数据类型', '下列哪些选项能正确地创建一个字符串对象？', 'A,B', 'String str = \"Hello World!\";', 'String str = new String(\"Hello World!\"); ', 'String str = \'Hello World!\'; ', 'String str = new String[] {\"Hello World!\"};', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('691', '多选题', '中等', 'java基础', '基本数据类型', '下列哪些操作符是Java的逻辑操作符？', 'A,B,C', '|| ', '！', '&', '^', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('692', '多选题', '较难', 'java基础', 'java关键字', '下列哪些关键字是Java的访问修饰符？', 'A,B,C', 'protected ', 'private ', 'public ', 'static', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('693', '多选题', '中等', 'java基础', '数组', '下列哪些选项能正确地定义一个数组？', 'A,B', 'int[] arr = {1, 2, 3}; ', 'int arr[] = new int[]{1, 2, 3}; ', 'int[3] arr = {1, 2, 3}; ', 'int[] arr = new int[3]{1, 2, 3};', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('694', '多选题', '较难', 'java基础', '集合', '下列哪些选项能正确地创建一个ArrayList？', 'A,B,C', 'ArrayList list = new ArrayList();', 'List list = new ArrayList();', 'List<String> list = new ArrayList<>(); ', ' ArrayList<String> list = new List<>();', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('695', '多选题', '很难', 'java基础', '类，接口', '下列哪些选项能正确地定义一个接口？', 'A,C,D', ' interface MyInterface {} ', 'abstract interface MyInterface {} ', 'interface MyInterface { void doSomething(); } ', 'public interface MyInterface { void doSomething(); }', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('696', '多选题', '较易', 'java基础', '多线程', '下列哪些选项能正确地创建一个线程？', 'A,C,D', 'new Thread().start(); ', 'Thread t = new Thread(); t.run(); ', ' Runnable r = () -> { System.out.println(\"Hello World!\"); }; Thread t = new Thread(r); t.start(); ', 'Thread t = new Thread(() -> { System.out.println(\"Hello World!\"); });', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('697', '多选题', '很难', 'java基础', '异常', '下列哪些选项能正确地创建一个异常？', 'A,B', ' throw new Exception(\"Something went wrong.\");', 'throw new RuntimeException(\"Something went wrong.\"); ', ' try { /* some code / } catch (Exception e) {} ', 'try { / some code */ } catch (IOException e) {}', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('698', '多选题', '容易', 'java基础', '基本数据类型', '下面哪些数据类型可以用来表示小数', 'B,C', 'int ', 'double ', 'float ', 'char', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('699', '多选题', '较难', 'java基础', '基本数据类型', '下面哪些集合类实现了Map接口', 'A,C', 'HashMap ', 'ArrayList ', 'TreeMap ', 'HashSet', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('700', '多选题', '较难', 'java基础', '类，接口', 'Java 中，下面哪些关键字可以用于声明类？', 'A,C', 'class', 'void', 'public', 'static', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('701', '多选题', '中等', 'java基础', '基本数据类型', 'Java 中，下面哪些关键字可以用于声明变量？', 'B,C,D', 'void', 'int', 'final', 'static', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('702', '多选题', '容易', 'java基础', '基本数据类型', '下面哪些不是java的简单数据类型?（）', 'B,C', 'short', 'Boolean', 'Double', 'float', '', null, '公共题库', null);
INSERT INTO `question` VALUES ('703', '多选题', '容易', 'java基础', '类，接口', '不能用来修饰interface的有（）', 'A,C', 'private', 'public', 'protected', 'static', null, null, '公共题库', null);

-- ----------------------------
-- Table structure for question_bank
-- ----------------------------
DROP TABLE IF EXISTS `question_bank`;
CREATE TABLE `question_bank` (
  `bank_id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bank_name` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '公共题库' COMMENT '题库名称',
  `choice_count` int NOT NULL DEFAULT '0' COMMENT '单选题数量',
  `multi_count` int NOT NULL DEFAULT '0' COMMENT '多选题数量',
  `blank_filling_count` int NOT NULL DEFAULT '0' COMMENT '填空题数量',
  `judge_count` int NOT NULL DEFAULT '0' COMMENT '判断题数量',
  `short_count` int NOT NULL DEFAULT '0' COMMENT '简答题数量',
  `user_name` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '公共题库' COMMENT '题库所有者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `bank_remark` varchar(225) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='试题库';

-- ----------------------------
-- Records of question_bank
-- ----------------------------
INSERT INTO `question_bank` VALUES ('1', '公共题库', '3', '3', '23', '32', '3', '公共题库', '2023-03-01 11:51:55', null);
INSERT INTO `question_bank` VALUES ('6', 'teacher题库1', '0', '0', '0', '0', '0', 'teacher', '2023-05-14 09:31:00', null);
INSERT INTO `question_bank` VALUES ('8', 'teacher题库2', '0', '0', '0', '0', '0', 'teacher', '2023-05-14 09:31:02', null);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '密码盐',
  `contact` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系方式',
  `user_role` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户角色',
  `user_sex` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '性别',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `latest_login_time` datetime DEFAULT NULL COMMENT '最新登录时间',
  `user_age` int DEFAULT '33',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'teacher', 'teacher', '1', '1386749323', '教师', '男', '2023-04-14 09:31:12', '2024-03-07 17:03:31', '49');
INSERT INTO `sys_user` VALUES ('3', 'admin', 'admin', '1', null, '管理员', '', '2023-03-14 09:31:19', '2024-02-06 08:40:35', '33');
INSERT INTO `sys_user` VALUES ('31', 'test', 'test', '1', null, '教师', '', '2023-03-14 09:31:24', '2023-05-14 09:31:37', '33');
INSERT INTO `sys_user` VALUES ('32', 'yd', 'yd', '1', null, '教师', '', '2023-05-17 12:54:56', '2023-05-18 14:37:05', '33');
INSERT INTO `sys_user` VALUES ('34', '12', '12', '1', null, '管理员', '', '2023-05-18 16:08:54', '2023-05-18 16:09:06', '33');
INSERT INTO `sys_user` VALUES ('35', 'aaaa', '123456', '1', null, '教师', '未知', '2023-05-18 16:24:18', '2023-05-18 16:24:26', '33');
