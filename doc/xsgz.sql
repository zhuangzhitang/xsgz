/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : xsgz

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2015-07-07 09:45:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for academy
-- ----------------------------
DROP TABLE IF EXISTS `academy`;
CREATE TABLE `academy` (
  `academyId` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '学院Id',
  `academyName` varchar(20) NOT NULL COMMENT '学院名称',
  `shortName` varchar(10) NOT NULL COMMENT '学院简称',
  `dean` varchar(10) NOT NULL COMMENT '院长',
  `tel` varchar(20) NOT NULL COMMENT '学院办公室电话',
  `email` varchar(50) DEFAULT NULL COMMENT '学院邮箱',
  `address` varchar(100) DEFAULT NULL COMMENT '学院地址',
  PRIMARY KEY (`academyId`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='学院';

-- ----------------------------
-- Records of academy
-- ----------------------------
INSERT INTO `academy` VALUES ('1', '信息学院', '信院', '谢仕义', '0759-2383064', 'xxxy@gdou.edu.cn', '广东海洋大学主校区科技楼404');
INSERT INTO `academy` VALUES ('2', '水产学院', '水院', '某某某', '0759-2383236', 'scxy@gdou.edu.cn', '广东海洋大学主校区');
INSERT INTO `academy` VALUES ('3', '食品科技学院', '食院', '某某某', '0759-2396026', 'spxy@gdou.edu.cn', '广东海洋大学主校区');
INSERT INTO `academy` VALUES ('4', '海洋与气象学院', '海院', '某某某', '0759-2383247', 'hyqx@gdou.edu.cn', '广东海洋大学主校区');
INSERT INTO `academy` VALUES ('5', '农学院', '农院', '某某某', '0759-2383236', 'nongxy@gdou.edu.cn', '广东海洋大学主校区');
INSERT INTO `academy` VALUES ('6', '工程学院', '工院', '某某某', '0759-2383223', 'gcxy@gdou.edu.cn', '广东海洋大学主校区');
INSERT INTO `academy` VALUES ('7', '经济管理学院', '经院', '某某某', '0759-2383233', 'jjglxy@gdou.edu.cn', '广东海洋大学主校区');
INSERT INTO `academy` VALUES ('8', '航海学院', '航院', '某某某', '0759-2382006', 'hhxy@gdou.edu.cn', '广东海洋大学主校区');
INSERT INTO `academy` VALUES ('9', '理学院', '理院', '某某某', '0759-2383300', 'lxy@gdou.edu.cn', '广东海洋大学主校区');
INSERT INTO `academy` VALUES ('10', '外国语学院', '外院', '某某某', '0759-2383301', 'waiyx@gdou.edu.cn', '广东海洋大学主校区');
INSERT INTO `academy` VALUES ('11', '文学院', '文院', '某某某', '0759-2383285', 'wxy@gdou.edu.cn', '广东海洋大学主校区');
INSERT INTO `academy` VALUES ('12', '法学院', '法院', '某某某', '0759-2396128', 'fxy@gdou.edu.cn', '广东海洋大学主校区');
INSERT INTO `academy` VALUES ('13', '思政理论课教学部', '思政部', '某某某', '0759-2383171', 'sk171@163.com', '广东海洋大学主校区');
INSERT INTO `academy` VALUES ('14', '政治与行政学院', '政院', '某某某', '0759-2396009', 'xzxy009@163.com', '广东海洋大学主校区');
INSERT INTO `academy` VALUES ('15', '中歌艺术学院', '艺院', '某某某', '0759-2383699', 'ysxy@gdou.edu.cn', '广东海洋大学主校区');
INSERT INTO `academy` VALUES ('16', '体育与休闲学院', '体院', '某某某', '0759-2383309', 'tyb@gdou.edu.cn', '广东海洋大学主校区');
INSERT INTO `academy` VALUES ('17', '职业技术学院', '职院', '某某某', '0759-3295546', 'zyjsxy@gdou.edu.cn', '广东海洋大学海滨校区');
INSERT INTO `academy` VALUES ('18', '继续教育学院', '教院', '某某某', '0759-2382452', 'cjy@gdou.edu.cn', '广东海洋大学霞山校区');
INSERT INTO `academy` VALUES ('19', '寸金学院', '寸金', '某某某', '0759-3324968', 'cjxy@gdou.edu.cn', '广东海洋大学寸金校区');
INSERT INTO `academy` VALUES ('20', '海洋与气象学院', '养殖', '某某某', '15812352256', '2546923527@qq.com', '广东海洋大学主校区');
INSERT INTO `academy` VALUES ('21', '海洋与气象学院', '养殖', '某某某', '15812352256', '2546923527@qq.com', '广东海洋大学主校区');
INSERT INTO `academy` VALUES ('22', '海洋与气象学院', '养殖', 'xx', '0759-2383247', '2546923527@qq.com', '广东海洋大学主校区');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员Id',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `subjectId` smallint(6) NOT NULL COMMENT '学院Id/专业Id（如果是专业级管理员，则为专业ID，否则为学院ID）',
  `roleId` tinyint(4) NOT NULL COMMENT '角色Id（0：超级管理员；1：院级管理员；2:专业级管理员）',
  `registerTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `lastTime` datetime DEFAULT NULL COMMENT '上次登录时间',
  PRIMARY KEY (`adminId`),
  KEY `fk_admin_role` (`roleId`),
  CONSTRAINT `fk_admin_role` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='管理员';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '6f7b18b1fba856aae59a56647c729abf', '0', '0', '2015-04-20 13:20:24', '2015-07-07 09:22:00');
INSERT INTO `admin` VALUES ('2', 'xinyuan', '86921fc812bf6dc1fcb16d7b9389b1d6', '1', '1', '2015-04-20 13:20:24', '2015-07-07 09:33:06');
INSERT INTO `admin` VALUES ('3', 'jike', 'f915923b8532e0346f24e0ee16fc2449', '1', '2', '2015-04-20 13:20:24', '2015-07-07 09:41:03');
INSERT INTO `admin` VALUES ('4', 'zaopeng', '2ea53f688c122fcd7aaa2a4ec995fccc', '1', '3', '2015-06-03 20:44:36', '2015-06-03 21:24:04');
INSERT INTO `admin` VALUES ('5', 'shuichang', '714533e07e879184d141646b67ae9957', '2', '1', '2015-06-16 18:24:25', '2015-06-16 21:40:56');
INSERT INTO `admin` VALUES ('6', 'yangzhi', 'bf93812eccd5dfd21f8fb2b9b5fce7a5', '8', '2', '2015-06-16 19:52:09', '2015-07-07 08:38:45');

-- ----------------------------
-- Table structure for allotinfo
-- ----------------------------
DROP TABLE IF EXISTS `allotinfo`;
CREATE TABLE `allotinfo` (
  `studentNum` char(12) NOT NULL COMMENT '学号',
  `schoolYear` char(9) NOT NULL COMMENT '学年',
  `type` smallint(6) NOT NULL COMMENT '申请类别（1：助学金，2：国家励志奖学金，3：国家奖学金）',
  KEY `fk_allotInfo_student` (`studentNum`),
  KEY `fk_allotInfo_schoolYear` (`schoolYear`),
  CONSTRAINT `fk_allotInfo_student` FOREIGN KEY (`studentNum`) REFERENCES `student` (`studentNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分配信息';

-- ----------------------------
-- Records of allotinfo
-- ----------------------------
INSERT INTO `allotinfo` VALUES ('201011621101', '2014-2015', '3');

-- ----------------------------
-- Table structure for applyinfo
-- ----------------------------
DROP TABLE IF EXISTS `applyinfo`;
CREATE TABLE `applyinfo` (
  `studentNum` char(12) NOT NULL COMMENT '学号',
  `fileId` varchar(32) NOT NULL DEFAULT '' COMMENT '文件Id',
  `type` smallint(6) NOT NULL COMMENT '申请类别（1：助学金，2：国家励志奖学金，3：国家奖学金，4：勤工岗位）',
  `classId` int(11) DEFAULT NULL,
  `studentName` varchar(10) DEFAULT NULL,
  KEY `fk_applyInfo_student` (`studentNum`),
  KEY `fk_applyInfo_upFile` (`fileId`),
  KEY `classId` (`classId`),
  KEY `studentName` (`studentName`),
  CONSTRAINT `applyinfo_ibfk_1` FOREIGN KEY (`classId`) REFERENCES `class` (`classId`),
  CONSTRAINT `fk_applyInfo_student` FOREIGN KEY (`studentNum`) REFERENCES `student` (`studentNum`),
  CONSTRAINT `fk_applyInfo_upFile` FOREIGN KEY (`fileId`) REFERENCES `upfile` (`fileId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='申请信息';

-- ----------------------------
-- Records of applyinfo
-- ----------------------------
INSERT INTO `applyinfo` VALUES ('201011621101', '2010116211013', '3', '23', '陈凯佳');

-- ----------------------------
-- Table structure for awards
-- ----------------------------
DROP TABLE IF EXISTS `awards`;
CREATE TABLE `awards` (
  `studentNum` char(12) NOT NULL COMMENT '学号',
  `awardsName` varchar(40) NOT NULL COMMENT '奖项名称',
  `rewardsBureau` varchar(40) NOT NULL COMMENT '颁奖单位',
  `obtainTime` date NOT NULL COMMENT '获奖时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='获奖信息';

-- ----------------------------
-- Records of awards
-- ----------------------------
INSERT INTO `awards` VALUES ('201111621314', '最佳基友奖', '海大招待所', '2014-06-27');
INSERT INTO `awards` VALUES ('201111621320', '最佳基友奖', '海大招待所', '2014-06-27');
INSERT INTO `awards` VALUES ('201111621321', '最佳舍友奖', '海韵小卖部', '2014-06-27');
INSERT INTO `awards` VALUES ('201111621405', '最佳舍友奖', '海韵小卖部', '2014-06-27');

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `classId` int(11) NOT NULL AUTO_INCREMENT COMMENT '班级Id',
  `className` varchar(20) NOT NULL COMMENT '班级名称',
  `majorId` smallint(6) NOT NULL COMMENT '专业Id',
  `grade` char(4) NOT NULL COMMENT '年级',
  `classTeacher` varchar(10) NOT NULL COMMENT '班主任',
  `teacherTel` varchar(20) DEFAULT NULL COMMENT '班主任联系电话',
  `monitor` varchar(10) DEFAULT NULL COMMENT '班长',
  `monitor_connection` varchar(20) DEFAULT NULL COMMENT '班长联系方式',
  PRIMARY KEY (`classId`),
  KEY `fk_class_major` (`majorId`),
  KEY `fk_class_grade` (`grade`),
  CONSTRAINT `fk_class_grade` FOREIGN KEY (`grade`) REFERENCES `grade` (`grade`),
  CONSTRAINT `fk_class_major` FOREIGN KEY (`majorId`) REFERENCES `major` (`majorId`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='班级';

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('3', '软件1111', '2', '2011', '无名', '12345678901', '殷梓淞', null);
INSERT INTO `class` VALUES ('4', '信管1101', '3', '2011', '丁又专', '12345678901', '陈义兰', null);
INSERT INTO `class` VALUES ('5', '计科1122', '1', '2012', '陈韶伟', '12121212122', '郭灶鹏', null);
INSERT INTO `class` VALUES ('6', '计科1121', '1', '2012', '陈XX', '12112121212', 'zhuanhitan', '158445785');
INSERT INTO `class` VALUES ('7', '计科1121', '1', '2012', '陈绍伟', '15812352269', '梁建成', '15812352269');
INSERT INTO `class` VALUES ('15', '养鱼1121', '4', '2012', '称稍微', '158123522269', '班长', '158123522691');
INSERT INTO `class` VALUES ('17', '养鱼1122', '4', '2012', 'adfsa', '158123522269', '班长', '158123522691');
INSERT INTO `class` VALUES ('19', '计科1111', '1', '2011', '称稍微', '158123522269', '班长', '158123522691');
INSERT INTO `class` VALUES ('22', '养殖1121', '8', '2012', 'sdaf11', '158123522269', '班长', '158123522691');
INSERT INTO `class` VALUES ('23', '计科1101', '1', '2010', 'sdaf', '12112121212', '班长', '158123522691');

-- ----------------------------
-- Table structure for classscore
-- ----------------------------
DROP TABLE IF EXISTS `classscore`;
CREATE TABLE `classscore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classId` int(11) NOT NULL COMMENT '班级id值',
  `schoolyear` varchar(255) NOT NULL COMMENT '学年',
  `teamum` int(255) NOT NULL DEFAULT '0' COMMENT '该学年的第几学期',
  `status` int(11) NOT NULL COMMENT '0表示已经导入成绩，1表示已经产生成绩统计结果的',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COMMENT='该表保存已经导入某一学年成绩的班级';

-- ----------------------------
-- Records of classscore
-- ----------------------------
INSERT INTO `classscore` VALUES ('63', '6', '2013-2014', '3', '0');
INSERT INTO `classscore` VALUES ('64', '6', '2013-2014', '4', '0');
INSERT INTO `classscore` VALUES ('65', '6', '2014-2015', '5', '0');
INSERT INTO `classscore` VALUES ('66', '6', '2012-2013', '1', '0');
INSERT INTO `classscore` VALUES ('67', '5', '2012-2013', '1', '0');
INSERT INTO `classscore` VALUES ('68', '5', '2012-2013', '2', '0');
INSERT INTO `classscore` VALUES ('69', '5', '2013-2014', '3', '0');
INSERT INTO `classscore` VALUES ('70', '5', '2013-2014', '4', '0');
INSERT INTO `classscore` VALUES ('71', '5', '2014-2015', '5', '0');
INSERT INTO `classscore` VALUES ('72', '6', '2012-2013', '2', '0');
INSERT INTO `classscore` VALUES ('75', '7', '2012-2013', '1', '0');
INSERT INTO `classscore` VALUES ('76', '7', '2012-2013', '2', '0');
INSERT INTO `classscore` VALUES ('108', '6', '2012-2013', '0', '1');
INSERT INTO `classscore` VALUES ('109', '5', '2012-2013', '0', '1');
INSERT INTO `classscore` VALUES ('110', '7', '2012-2013', '0', '1');
INSERT INTO `classscore` VALUES ('111', '6', '2013-2014', '0', '1');
INSERT INTO `classscore` VALUES ('112', '5', '2013-2014', '0', '1');

-- ----------------------------
-- Table structure for conductbasicdata
-- ----------------------------
DROP TABLE IF EXISTS `conductbasicdata`;
CREATE TABLE `conductbasicdata` (
  `id` int(10) NOT NULL,
  `conduct_basic` varchar(30) NOT NULL COMMENT '操行分统计中的一些固定数据',
  `conduct_score` double(10,2) NOT NULL COMMENT '分数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操行分的一些基本的不变的数据存储表';

-- ----------------------------
-- Records of conductbasicdata
-- ----------------------------
INSERT INTO `conductbasicdata` VALUES ('1', '思想道德素质|基本分', '11.00');

-- ----------------------------
-- Table structure for conducthavenext
-- ----------------------------
DROP TABLE IF EXISTS `conducthavenext`;
CREATE TABLE `conducthavenext` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conduct_havenext` varchar(40) NOT NULL COMMENT '操行分有下一级项目的项',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of conducthavenext
-- ----------------------------
INSERT INTO `conducthavenext` VALUES ('1', '思想道德素质|奖励加分项');
INSERT INTO `conducthavenext` VALUES ('2', '思想道德素质|扣分项');
INSERT INTO `conducthavenext` VALUES ('3', '社会实践能力|技术技能');

-- ----------------------------
-- Table structure for conductitem
-- ----------------------------
DROP TABLE IF EXISTS `conductitem`;
CREATE TABLE `conductitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conduct_name` varchar(255) NOT NULL COMMENT '手动添加的操行分项',
  `conduct_superitem` int(10) NOT NULL COMMENT '该操行分的上一级项',
  `schoolyear` varchar(255) NOT NULL COMMENT '学年',
  PRIMARY KEY (`id`),
  KEY `superitem` (`conduct_superitem`),
  KEY `schoolyear` (`schoolyear`),
  CONSTRAINT `schoolyear` FOREIGN KEY (`schoolyear`) REFERENCES `schoolyear` (`schoolYear`),
  CONSTRAINT `superitem` FOREIGN KEY (`conduct_superitem`) REFERENCES `conducthavenext` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of conductitem
-- ----------------------------
INSERT INTO `conductitem` VALUES ('2', '早读迟到', '2', '2014-2015');
INSERT INTO `conductitem` VALUES ('3', '草坪活动', '3', '2014-2015');
INSERT INTO `conductitem` VALUES ('4', '参加晚会', '1', '2014-2015');
INSERT INTO `conductitem` VALUES ('5', '挑战杯', '3', '2014-2015');
INSERT INTO `conductitem` VALUES ('6', '逃课', '2', '2014-2015');
INSERT INTO `conductitem` VALUES ('7', '政治面貌', '1', '2014-2015');
INSERT INTO `conductitem` VALUES ('8', '团组织生活', '1', '2014-2015');
INSERT INTO `conductitem` VALUES ('9', '宿舍卫生', '2', '2014-2015');
INSERT INTO `conductitem` VALUES ('10', '纪律', '2', '2014-2015');
INSERT INTO `conductitem` VALUES ('11', '食堂文明岗', '1', '2014-2015');
INSERT INTO `conductitem` VALUES ('13', '义务献血', '1', '2014-2015');
INSERT INTO `conductitem` VALUES ('16', '好人好事', '1', '2014-2015');
INSERT INTO `conductitem` VALUES ('17', '军服捐献', '1', '2014-2015');
INSERT INTO `conductitem` VALUES ('18', '早读', '1', '2014-2015');
INSERT INTO `conductitem` VALUES ('19', '早读违纪', '2', '2014-2015');
INSERT INTO `conductitem` VALUES ('20', '膳食主题班会', '3', '2014-2015');
INSERT INTO `conductitem` VALUES ('21', '海洋知识竞赛', '3', '2014-2015');
INSERT INTO `conductitem` VALUES ('22', '中文演讲比赛', '3', '2014-2015');
INSERT INTO `conductitem` VALUES ('23', '十大歌手比赛', '3', '2014-2015');
INSERT INTO `conductitem` VALUES ('24', '模拟面试大赛', '3', '2014-2015');
INSERT INTO `conductitem` VALUES ('25', '职业规划大赛', '3', '2014-2015');
INSERT INTO `conductitem` VALUES ('26', '书画艺术作品大赛', '3', '2014-2015');
INSERT INTO `conductitem` VALUES ('27', '体育竞赛', '3', '2014-2015');

-- ----------------------------
-- Table structure for conductnotnext
-- ----------------------------
DROP TABLE IF EXISTS `conductnotnext`;
CREATE TABLE `conductnotnext` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conduct_nothavenext` varchar(40) DEFAULT NULL COMMENT '操行分没有下一级项目的项',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of conductnotnext
-- ----------------------------
INSERT INTO `conductnotnext` VALUES ('1', '社会实践能力|科技创新');
INSERT INTO `conductnotnext` VALUES ('2', '社会实践能力|组织管理分');
INSERT INTO `conductnotnext` VALUES ('3', '社会实践能力|特殊分');

-- ----------------------------
-- Table structure for conduct_next_score
-- ----------------------------
DROP TABLE IF EXISTS `conduct_next_score`;
CREATE TABLE `conduct_next_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` varchar(255) NOT NULL COMMENT '外键，学生',
  `c_item` int(10) NOT NULL COMMENT '外键，关联conductitem表',
  `score` double(10,4) NOT NULL COMMENT '分数',
  PRIMARY KEY (`id`),
  KEY `c_item` (`c_item`),
  CONSTRAINT `c_item` FOREIGN KEY (`c_item`) REFERENCES `conductitem` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of conduct_next_score
-- ----------------------------
INSERT INTO `conduct_next_score` VALUES ('1', '201111621314', '3', '2.5000');
INSERT INTO `conduct_next_score` VALUES ('2', '201111621320', '3', '2.5000');
INSERT INTO `conduct_next_score` VALUES ('3', '201111621321', '3', '2.5000');
INSERT INTO `conduct_next_score` VALUES ('4', '201111621321', '3', '2.5000');
INSERT INTO `conduct_next_score` VALUES ('5', '201111621405', '3', '2.5000');
INSERT INTO `conduct_next_score` VALUES ('6', '201111621416', '3', '2.5000');
INSERT INTO `conduct_next_score` VALUES ('7', '201111621416', '3', '2.5000');
INSERT INTO `conduct_next_score` VALUES ('9', '201211621201', '5', '2.5000');
INSERT INTO `conduct_next_score` VALUES ('10', '201211621202', '5', '5.0000');
INSERT INTO `conduct_next_score` VALUES ('11', '201211621201', '3', '3.5000');
INSERT INTO `conduct_next_score` VALUES ('12', '201211621202', '3', '7.0000');
INSERT INTO `conduct_next_score` VALUES ('13', '201211621201', '4', '2.5000');
INSERT INTO `conduct_next_score` VALUES ('14', '201211621202', '4', '5.0000');
INSERT INTO `conduct_next_score` VALUES ('17', '201211621207', '3', '2.0000');
INSERT INTO `conduct_next_score` VALUES ('18', '201211621208', '3', '2.0000');
INSERT INTO `conduct_next_score` VALUES ('19', '201211621209', '3', '2.0000');
INSERT INTO `conduct_next_score` VALUES ('20', '201211621212', '3', '2.0000');
INSERT INTO `conduct_next_score` VALUES ('21', '201211621226', '3', '2.0000');
INSERT INTO `conduct_next_score` VALUES ('22', '201211621229', '3', '2.0000');
INSERT INTO `conduct_next_score` VALUES ('23', '201211621230', '3', '4.0000');
INSERT INTO `conduct_next_score` VALUES ('24', '201211621207', '5', '2.0000');
INSERT INTO `conduct_next_score` VALUES ('25', '201211621208', '5', '2.0000');
INSERT INTO `conduct_next_score` VALUES ('26', '201211621209', '5', '2.0000');
INSERT INTO `conduct_next_score` VALUES ('27', '201211621212', '5', '2.0000');
INSERT INTO `conduct_next_score` VALUES ('28', '201211621225', '5', '2.0000');
INSERT INTO `conduct_next_score` VALUES ('29', '201211621226', '5', '2.0000');
INSERT INTO `conduct_next_score` VALUES ('30', '201211621227', '5', '2.0000');
INSERT INTO `conduct_next_score` VALUES ('31', '201211621228', '5', '2.0000');
INSERT INTO `conduct_next_score` VALUES ('32', '201211621233', '5', '4.0000');
INSERT INTO `conduct_next_score` VALUES ('52', '201211621227', '11', '2.0000');
INSERT INTO `conduct_next_score` VALUES ('53', '201211621229', '11', '2.0000');
INSERT INTO `conduct_next_score` VALUES ('54', '201211621231', '11', '4.0000');
INSERT INTO `conduct_next_score` VALUES ('55', '201211621227', '17', '1.5000');
INSERT INTO `conduct_next_score` VALUES ('56', '201211621229', '17', '1.5000');
INSERT INTO `conduct_next_score` VALUES ('57', '201211621231', '17', '3.0000');
INSERT INTO `conduct_next_score` VALUES ('58', '201211621202', '22', '0.1000');
INSERT INTO `conduct_next_score` VALUES ('59', '201211621206', '22', '0.1000');
INSERT INTO `conduct_next_score` VALUES ('60', '201211621208', '22', '0.1000');
INSERT INTO `conduct_next_score` VALUES ('61', '201211621209', '22', '0.1000');
INSERT INTO `conduct_next_score` VALUES ('62', '201211621227', '22', '0.1000');
INSERT INTO `conduct_next_score` VALUES ('63', '201211621229', '22', '0.1000');
INSERT INTO `conduct_next_score` VALUES ('64', '201211621231', '22', '0.2000');
INSERT INTO `conduct_next_score` VALUES ('65', '201211621207', '24', '0.1000');
INSERT INTO `conduct_next_score` VALUES ('66', '201211621209', '24', '0.1000');
INSERT INTO `conduct_next_score` VALUES ('67', '201211621214', '24', '0.1000');
INSERT INTO `conduct_next_score` VALUES ('68', '201211621226', '24', '0.1000');
INSERT INTO `conduct_next_score` VALUES ('69', '201211621229', '24', '0.1000');
INSERT INTO `conduct_next_score` VALUES ('70', '201211621233', '24', '0.2000');
INSERT INTO `conduct_next_score` VALUES ('71', '201211621207', '25', '0.1000');
INSERT INTO `conduct_next_score` VALUES ('72', '201211621209', '25', '0.1000');
INSERT INTO `conduct_next_score` VALUES ('73', '201211621214', '25', '0.1000');
INSERT INTO `conduct_next_score` VALUES ('74', '201211621226', '25', '0.1000');
INSERT INTO `conduct_next_score` VALUES ('75', '201211621229', '25', '0.1000');
INSERT INTO `conduct_next_score` VALUES ('76', '201211621233', '25', '0.2000');
INSERT INTO `conduct_next_score` VALUES ('102', '201211621201', '21', '0.1000');
INSERT INTO `conduct_next_score` VALUES ('103', '201211621202', '21', '0.1000');
INSERT INTO `conduct_next_score` VALUES ('104', '201211621206', '21', '0.1000');
INSERT INTO `conduct_next_score` VALUES ('105', '201211621208', '21', '0.1000');
INSERT INTO `conduct_next_score` VALUES ('106', '201211621211', '21', '0.1000');
INSERT INTO `conduct_next_score` VALUES ('107', '201211621213', '21', '0.1000');
INSERT INTO `conduct_next_score` VALUES ('108', '201211621226', '21', '0.1000');
INSERT INTO `conduct_next_score` VALUES ('109', '201211621228', '21', '0.1000');
INSERT INTO `conduct_next_score` VALUES ('110', '201211621233', '21', '0.2000');
INSERT INTO `conduct_next_score` VALUES ('111', '201211621227', '20', '0.5000');
INSERT INTO `conduct_next_score` VALUES ('112', '201211621228', '20', '1.0000');
INSERT INTO `conduct_next_score` VALUES ('113', '201211621202', '23', '2.0000');
INSERT INTO `conduct_next_score` VALUES ('114', '201211621231', '23', '2.0000');
INSERT INTO `conduct_next_score` VALUES ('115', '201211621233', '23', '4.0000');
INSERT INTO `conduct_next_score` VALUES ('116', '201211621202', '19', '-1.5000');
INSERT INTO `conduct_next_score` VALUES ('117', '201211621208', '19', '-1.5000');
INSERT INTO `conduct_next_score` VALUES ('118', '201211621209', '19', '-1.5000');
INSERT INTO `conduct_next_score` VALUES ('119', '201211621211', '19', '-3.0000');
INSERT INTO `conduct_next_score` VALUES ('120', '201211621202', '9', '-2.0000');
INSERT INTO `conduct_next_score` VALUES ('121', '201211621225', '9', '-2.0000');
INSERT INTO `conduct_next_score` VALUES ('122', '201211621227', '9', '-2.0000');
INSERT INTO `conduct_next_score` VALUES ('123', '201211621228', '9', '-2.0000');
INSERT INTO `conduct_next_score` VALUES ('124', '201211621230', '9', '-4.0000');
INSERT INTO `conduct_next_score` VALUES ('125', '201211621201', '7', '1.0000');
INSERT INTO `conduct_next_score` VALUES ('126', '201211621202', '7', '2.0000');
INSERT INTO `conduct_next_score` VALUES ('127', '201211621206', '7', '1.0000');
INSERT INTO `conduct_next_score` VALUES ('128', '201211621207', '7', '1.0000');
INSERT INTO `conduct_next_score` VALUES ('129', '201211621208', '7', '1.0000');
INSERT INTO `conduct_next_score` VALUES ('130', '201211621209', '7', '1.0000');
INSERT INTO `conduct_next_score` VALUES ('131', '201211621211', '7', '1.0000');
INSERT INTO `conduct_next_score` VALUES ('132', '201211621212', '7', '1.0000');
INSERT INTO `conduct_next_score` VALUES ('133', '201211621213', '7', '1.0000');
INSERT INTO `conduct_next_score` VALUES ('134', '201211621214', '7', '1.0000');
INSERT INTO `conduct_next_score` VALUES ('135', '201211621225', '7', '1.0000');
INSERT INTO `conduct_next_score` VALUES ('136', '201211621226', '7', '1.0000');
INSERT INTO `conduct_next_score` VALUES ('137', '201211621227', '7', '1.0000');
INSERT INTO `conduct_next_score` VALUES ('138', '201211621228', '7', '1.0000');
INSERT INTO `conduct_next_score` VALUES ('139', '201211621229', '7', '1.0000');
INSERT INTO `conduct_next_score` VALUES ('140', '201211621230', '7', '1.0000');
INSERT INTO `conduct_next_score` VALUES ('141', '201211621231', '7', '1.0000');
INSERT INTO `conduct_next_score` VALUES ('142', '201211621233', '7', '2.0000');

-- ----------------------------
-- Table structure for conduct_notnext_score
-- ----------------------------
DROP TABLE IF EXISTS `conduct_notnext_score`;
CREATE TABLE `conduct_notnext_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` varchar(255) NOT NULL COMMENT '学生外键',
  `c_notnext` int(11) NOT NULL COMMENT '外键，没有下一级项目的操行分项目表',
  `score` double NOT NULL,
  `schoolyear` varchar(255) NOT NULL COMMENT '学年',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `notnext_item` (`c_notnext`),
  KEY `schooleyear` (`schoolyear`),
  CONSTRAINT `notnext_item` FOREIGN KEY (`c_notnext`) REFERENCES `conductnotnext` (`id`),
  CONSTRAINT `schooleyear` FOREIGN KEY (`schoolyear`) REFERENCES `schoolyear` (`schoolYear`),
  CONSTRAINT `sid` FOREIGN KEY (`sid`) REFERENCES `student` (`studentNum`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of conduct_notnext_score
-- ----------------------------
INSERT INTO `conduct_notnext_score` VALUES ('1', '201111621314', '1', '2.5', '2014-2015');
INSERT INTO `conduct_notnext_score` VALUES ('2', '201111621320', '1', '2.5', '2014-2015');
INSERT INTO `conduct_notnext_score` VALUES ('3', '201111621321', '1', '2.5', '2014-2015');
INSERT INTO `conduct_notnext_score` VALUES ('4', '201211621201', '1', '7.5', '2014-2015');
INSERT INTO `conduct_notnext_score` VALUES ('5', '201211621202', '1', '9.5', '2014-2015');
INSERT INTO `conduct_notnext_score` VALUES ('6', '201211621201', '2', '6.5', '2014-2015');
INSERT INTO `conduct_notnext_score` VALUES ('7', '201211621202', '2', '9', '2014-2015');
INSERT INTO `conduct_notnext_score` VALUES ('8', '201211621201', '3', '4.5', '2014-2015');
INSERT INTO `conduct_notnext_score` VALUES ('9', '201211621202', '3', '9.5', '2014-2015');
INSERT INTO `conduct_notnext_score` VALUES ('10', '201211621207', '2', '2', '2014-2015');
INSERT INTO `conduct_notnext_score` VALUES ('11', '201211621211', '2', '4', '2014-2015');
INSERT INTO `conduct_notnext_score` VALUES ('12', '201211621206', '1', '0.5', '2014-2015');
INSERT INTO `conduct_notnext_score` VALUES ('13', '201211621208', '1', '0.5', '2014-2015');
INSERT INTO `conduct_notnext_score` VALUES ('14', '201211621211', '1', '0.5', '2014-2015');
INSERT INTO `conduct_notnext_score` VALUES ('15', '201211621213', '1', '0.5', '2014-2015');
INSERT INTO `conduct_notnext_score` VALUES ('16', '201211621226', '1', '0.5', '2014-2015');
INSERT INTO `conduct_notnext_score` VALUES ('17', '201211621228', '1', '0.5', '2014-2015');
INSERT INTO `conduct_notnext_score` VALUES ('18', '201211621230', '1', '0.5', '2014-2015');
INSERT INTO `conduct_notnext_score` VALUES ('19', '201211621231', '1', '0.5', '2014-2015');
INSERT INTO `conduct_notnext_score` VALUES ('20', '201211621233', '1', '1', '2014-2015');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `cno` varchar(20) NOT NULL COMMENT '课程名',
  `majorID` smallint(6) DEFAULT NULL COMMENT '外键，专业',
  `grade` int(10) DEFAULT NULL COMMENT ' 年级，类似12级的就是12',
  `course_status` int(10) NOT NULL COMMENT '课程的状态，0为必修，1为选修，2为体育课',
  `credit` double(10,2) DEFAULT NULL COMMENT '学分',
  `schoolyear` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `major` (`majorID`),
  CONSTRAINT `major` FOREIGN KEY (`majorID`) REFERENCES `major` (`majorId`)
) ENGINE=InnoDB AUTO_INCREMENT=839 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('624', 'C++程序设计x1', '1', '12', '0', '3.50', '2012-2013');
INSERT INTO `course` VALUES ('625', '大学英语1', '1', '12', '0', '3.50', '2012-2013');
INSERT INTO `course` VALUES ('626', '高等数学Ⅰx1', '1', '12', '0', '4.50', '2012-2013');
INSERT INTO `course` VALUES ('627', '计算机导论', '1', '12', '0', '3.50', '2012-2013');
INSERT INTO `course` VALUES ('628', '篮球(初)', null, null, '2', null, null);
INSERT INTO `course` VALUES ('629', '轮滑', null, null, '2', null, null);
INSERT INTO `course` VALUES ('630', '排球', null, null, '2', null, null);
INSERT INTO `course` VALUES ('631', '乒乓球', null, null, '2', null, null);
INSERT INTO `course` VALUES ('632', '青年学生健康教育', '1', '12', '0', '1.50', '2012-2013');
INSERT INTO `course` VALUES ('633', '散打', null, null, '2', null, null);
INSERT INTO `course` VALUES ('634', '思想道德修养与法律基础', '1', '12', '0', '3.50', '2012-2013');
INSERT INTO `course` VALUES ('635', '网球', null, null, '2', null, null);
INSERT INTO `course` VALUES ('636', '武术', null, null, '2', null, null);
INSERT INTO `course` VALUES ('637', '形势与政策教育1', '1', '12', '0', '1.50', '2012-2013');
INSERT INTO `course` VALUES ('638', '足球', null, null, '2', null, null);
INSERT INTO `course` VALUES ('639', 'C++程序设计x2', '1', '12', '0', '3.50', '2012-2013');
INSERT INTO `course` VALUES ('640', 'C++程序设计课程设计', '1', '12', '0', '1.00', '2012-2013');
INSERT INTO `course` VALUES ('641', '棒垒球', null, null, '2', null, null);
INSERT INTO `course` VALUES ('642', '贝类学', null, null, '1', null, null);
INSERT INTO `course` VALUES ('643', '宠物养殖', null, null, '1', null, null);
INSERT INTO `course` VALUES ('644', '大学生心理素质教育', null, null, '1', null, null);
INSERT INTO `course` VALUES ('645', '大学物理Ⅲ', '1', '12', '0', '3.50', '2012-2013');
INSERT INTO `course` VALUES ('646', '大学物理实验Ⅱ', '1', '12', '0', '2.50', '2012-2013');
INSERT INTO `course` VALUES ('647', '大学英语2', '1', '12', '0', '3.50', '2012-2013');
INSERT INTO `course` VALUES ('648', '大学语文', null, null, '1', null, null);
INSERT INTO `course` VALUES ('649', '大众口头作品欣赏', null, null, '1', null, null);
INSERT INTO `course` VALUES ('650', '蛋白质科学与生活', null, null, '1', null, null);
INSERT INTO `course` VALUES ('651', '电路与模拟电子技术', '1', '12', '0', '3.50', '2012-2013');
INSERT INTO `course` VALUES ('652', '定向越野', null, null, '2', null, null);
INSERT INTO `course` VALUES ('653', '动物营养与健康', null, null, '1', null, null);
INSERT INTO `course` VALUES ('654', '法律与电影', null, null, '1', null, null);
INSERT INTO `course` VALUES ('655', '高等数学Ⅰx2', '1', '12', '0', '5.50', '2012-2013');
INSERT INTO `course` VALUES ('656', '古诗词鉴赏', null, null, '1', null, null);
INSERT INTO `course` VALUES ('657', '观赏园艺', null, null, '1', null, null);
INSERT INTO `course` VALUES ('658', '海洋空间规划', null, null, '1', null, null);
INSERT INTO `course` VALUES ('659', '海洋与环境', null, null, '1', null, null);
INSERT INTO `course` VALUES ('660', '合同法', null, null, '1', null, null);
INSERT INTO `course` VALUES ('661', '家庭影视制作技巧', null, null, '1', null, null);
INSERT INTO `course` VALUES ('662', '交谊舞', null, null, '2', null, null);
INSERT INTO `course` VALUES ('663', '军事理论', '1', '12', '0', '2.50', '2012-2013');
INSERT INTO `course` VALUES ('664', '篮球(初)', null, null, '2', null, null);
INSERT INTO `course` VALUES ('665', '轮滑', null, null, '2', null, null);
INSERT INTO `course` VALUES ('666', '美术鉴赏', null, null, '1', null, null);
INSERT INTO `course` VALUES ('667', '民俗文化', null, null, '1', null, null);
INSERT INTO `course` VALUES ('668', '排球', null, null, '2', null, null);
INSERT INTO `course` VALUES ('669', '乒乓球', null, null, '2', null, null);
INSERT INTO `course` VALUES ('670', '企业管理', null, null, '1', null, null);
INSERT INTO `course` VALUES ('671', '趣味化学', null, null, '1', null, null);
INSERT INTO `course` VALUES ('672', '声乐', null, null, '1', null, null);
INSERT INTO `course` VALUES ('673', '食品营养学', null, null, '1', null, null);
INSERT INTO `course` VALUES ('674', '书法鉴赏', null, null, '1', null, null);
INSERT INTO `course` VALUES ('675', '网球', null, null, '2', null, null);
INSERT INTO `course` VALUES ('676', '文学名作欣赏', null, null, '1', null, null);
INSERT INTO `course` VALUES ('677', '武术', null, null, '2', null, null);
INSERT INTO `course` VALUES ('678', '舞蹈鉴赏', null, null, '1', null, null);
INSERT INTO `course` VALUES ('679', '信息检索与利用', null, null, '1', null, null);
INSERT INTO `course` VALUES ('680', '遗传与人类', null, null, '1', null, null);
INSERT INTO `course` VALUES ('681', '艺术导论', null, null, '1', null, null);
INSERT INTO `course` VALUES ('682', '音乐欣赏', null, null, '1', null, null);
INSERT INTO `course` VALUES ('683', '影视鉴赏', null, null, '1', null, null);
INSERT INTO `course` VALUES ('684', '影视文学', null, null, '1', null, null);
INSERT INTO `course` VALUES ('685', '游泳初级班', null, null, '2', null, null);
INSERT INTO `course` VALUES ('686', '瑜伽', null, null, '2', null, null);
INSERT INTO `course` VALUES ('687', '羽毛球', null, null, '2', null, null);
INSERT INTO `course` VALUES ('688', '语言文化漫谈', null, null, '1', null, null);
INSERT INTO `course` VALUES ('689', '哲学与人生', null, null, '1', null, null);
INSERT INTO `course` VALUES ('690', '中国近现代史纲要', '1', '12', '0', '3.50', '2012-2013');
INSERT INTO `course` VALUES ('691', '中外广告鉴赏', null, null, '1', null, null);
INSERT INTO `course` VALUES ('692', '中外社会科学名著导读', null, null, '1', null, null);
INSERT INTO `course` VALUES ('693', '中西文化概论', null, null, '1', null, null);
INSERT INTO `course` VALUES ('694', '棒垒球', null, null, '2', null, null);
INSERT INTO `course` VALUES ('695', '草坪建植与养护', null, null, '1', null, null);
INSERT INTO `course` VALUES ('696', '茶文化', null, null, '1', null, null);
INSERT INTO `course` VALUES ('697', '宠物养殖', null, null, '1', null, null);
INSERT INTO `course` VALUES ('698', '大学生心理素质教育', null, null, '1', null, null);
INSERT INTO `course` VALUES ('699', '大学英语3', '1', '12', '0', '3.50', '2013-2014');
INSERT INTO `course` VALUES ('700', '大学语文', null, null, '1', null, null);
INSERT INTO `course` VALUES ('701', '当代大众文化研究', null, null, '1', null, null);
INSERT INTO `course` VALUES ('702', '定向越野', null, null, '2', null, null);
INSERT INTO `course` VALUES ('703', '动物保护学概论', null, null, '1', null, null);
INSERT INTO `course` VALUES ('704', '动物营养与健康', null, null, '1', null, null);
INSERT INTO `course` VALUES ('705', '法律与电影', null, null, '1', null, null);
INSERT INTO `course` VALUES ('706', '公司法', null, null, '1', null, null);
INSERT INTO `course` VALUES ('707', '观赏园艺', null, null, '1', null, null);
INSERT INTO `course` VALUES ('708', '国际贸易', null, null, '1', null, null);
INSERT INTO `course` VALUES ('709', '海洋生物鉴赏', null, null, '1', null, null);
INSERT INTO `course` VALUES ('710', '海洋与环境', null, null, '1', null, null);
INSERT INTO `course` VALUES ('711', '合同法', null, null, '1', null, null);
INSERT INTO `course` VALUES ('712', '家庭影视制作技巧', null, null, '1', null, null);
INSERT INTO `course` VALUES ('713', '健身', null, null, '2', null, null);
INSERT INTO `course` VALUES ('714', '毽球', null, null, '2', null, null);
INSERT INTO `course` VALUES ('715', '交谊舞', null, null, '2', null, null);
INSERT INTO `course` VALUES ('716', '篮球(初)', null, null, '2', null, null);
INSERT INTO `course` VALUES ('717', '离散数学', '1', '12', '0', '3.50', '2013-2014');
INSERT INTO `course` VALUES ('718', '旅游与文化', null, null, '1', null, null);
INSERT INTO `course` VALUES ('719', '绿色食品与有机农业', null, null, '1', null, null);
INSERT INTO `course` VALUES ('720', '马克思主义基本原理', '1', '12', '0', '3.50', '2013-2014');
INSERT INTO `course` VALUES ('721', '美术鉴赏', null, null, '1', null, null);
INSERT INTO `course` VALUES ('722', '民俗文化', null, null, '1', null, null);
INSERT INTO `course` VALUES ('723', '排球', null, null, '2', null, null);
INSERT INTO `course` VALUES ('724', '乒乓球', null, null, '2', null, null);
INSERT INTO `course` VALUES ('725', '企业管理', null, null, '1', null, null);
INSERT INTO `course` VALUES ('726', '气象与生活', null, null, '1', null, null);
INSERT INTO `course` VALUES ('727', '趣味化学', null, null, '1', null, null);
INSERT INTO `course` VALUES ('728', '设施园艺', null, null, '1', null, null);
INSERT INTO `course` VALUES ('729', '声乐', null, null, '1', null, null);
INSERT INTO `course` VALUES ('730', '实用科技研究方法', null, null, '1', null, null);
INSERT INTO `course` VALUES ('731', '食品营养学', null, null, '1', null, null);
INSERT INTO `course` VALUES ('732', '食品与微生物', null, null, '1', null, null);
INSERT INTO `course` VALUES ('733', '数据结构', '1', '12', '0', '2.50', '2013-2014');
INSERT INTO `course` VALUES ('734', '数据结构课程设计', '1', '12', '0', '1.00', '2013-2014');
INSERT INTO `course` VALUES ('735', '数字电路逻辑设计', '1', '12', '0', '3.50', '2013-2014');
INSERT INTO `course` VALUES ('736', '孙子兵法与竞争', null, null, '1', null, null);
INSERT INTO `course` VALUES ('737', '体育游戏', null, null, '2', null, null);
INSERT INTO `course` VALUES ('738', '微生物与人类', null, null, '1', null, null);
INSERT INTO `course` VALUES ('739', '微生物与人类健康', null, null, '1', null, null);
INSERT INTO `course` VALUES ('740', '微型小说研究', null, null, '1', null, null);
INSERT INTO `course` VALUES ('741', '武术', null, null, '2', null, null);
INSERT INTO `course` VALUES ('742', '戏曲鉴赏', null, null, '1', null, null);
INSERT INTO `course` VALUES ('743', '线性代数', '1', '12', '0', '3.50', '2013-2014');
INSERT INTO `course` VALUES ('744', '信息检索与利用', null, null, '1', null, null);
INSERT INTO `course` VALUES ('745', '形势与政策教育2', '1', '12', '0', '1.50', '2013-2014');
INSERT INTO `course` VALUES ('746', '演讲与口才', null, null, '1', null, null);
INSERT INTO `course` VALUES ('747', '音乐欣赏', null, null, '1', null, null);
INSERT INTO `course` VALUES ('748', '饮食文化', null, null, '1', null, null);
INSERT INTO `course` VALUES ('749', '影视鉴赏', null, null, '1', null, null);
INSERT INTO `course` VALUES ('750', '游泳初级班', null, null, '2', null, null);
INSERT INTO `course` VALUES ('751', '瑜伽', null, null, '2', null, null);
INSERT INTO `course` VALUES ('752', '羽毛球', null, null, '2', null, null);
INSERT INTO `course` VALUES ('753', '语言文化漫谈', null, null, '1', null, null);
INSERT INTO `course` VALUES ('754', '哲学思维与应用', null, null, '1', null, null);
INSERT INTO `course` VALUES ('755', '中国近海海洋学', null, null, '1', null, null);
INSERT INTO `course` VALUES ('756', '中国文化', null, null, '1', null, null);
INSERT INTO `course` VALUES ('757', '中外广告鉴赏', null, null, '1', null, null);
INSERT INTO `course` VALUES ('758', '足球欣赏与锻炼', null, null, '1', null, null);
INSERT INTO `course` VALUES ('759', 'AutoCAD绘图基础', null, null, '1', null, null);
INSERT INTO `course` VALUES ('760', '贝类学', null, null, '1', null, null);
INSERT INTO `course` VALUES ('761', '草坪建植与养护', null, null, '1', null, null);
INSERT INTO `course` VALUES ('762', '宠物养殖', null, null, '1', null, null);
INSERT INTO `course` VALUES ('763', '大学英语4', '1', '12', '0', '3.50', '2013-2014');
INSERT INTO `course` VALUES ('764', '定向越野', null, null, '2', null, null);
INSERT INTO `course` VALUES ('765', '动物疾病与人类健康', null, null, '1', null, null);
INSERT INTO `course` VALUES ('766', '蜂产品与保健', null, null, '1', null, null);
INSERT INTO `course` VALUES ('767', '概率论与数理统计', '1', '12', '0', '3.00', '2013-2014');
INSERT INTO `course` VALUES ('768', '歌词研究', null, null, '1', null, null);
INSERT INTO `course` VALUES ('769', '观赏园艺', null, null, '1', null, null);
INSERT INTO `course` VALUES ('770', '海洋环境腐蚀与防护', null, null, '1', null, null);
INSERT INTO `course` VALUES ('771', '海洋空间规划', null, null, '1', null, null);
INSERT INTO `course` VALUES ('772', '海洋与环境', null, null, '1', null, null);
INSERT INTO `course` VALUES ('773', '化学与人类生活', null, null, '1', null, null);
INSERT INTO `course` VALUES ('774', '汇编语言', '1', '12', '0', '3.00', '2013-2014');
INSERT INTO `course` VALUES ('775', '汇编语言课程实习', '1', '12', '0', '1.00', '2013-2014');
INSERT INTO `course` VALUES ('776', '计算机组成原理', '1', '12', '0', '3.00', '2013-2014');
INSERT INTO `course` VALUES ('777', '计算机组成原理课程实习', '1', '12', '0', '1.00', '2013-2014');
INSERT INTO `course` VALUES ('778', '健身', null, null, '2', null, null);
INSERT INTO `course` VALUES ('779', '毽球', null, null, '2', null, null);
INSERT INTO `course` VALUES ('780', '交谊舞', null, null, '2', null, null);
INSERT INTO `course` VALUES ('781', '解读基因时代', null, null, '1', null, null);
INSERT INTO `course` VALUES ('782', '进化论', null, null, '1', null, null);
INSERT INTO `course` VALUES ('783', '科研方法与论文写作', null, null, '1', null, null);
INSERT INTO `course` VALUES ('784', '篮球(初)', null, null, '2', null, null);
INSERT INTO `course` VALUES ('785', '绿色食品与有机农业', null, null, '1', null, null);
INSERT INTO `course` VALUES ('786', '毛泽东思想和中国特色社会主义理论体系概论', '1', '12', '0', '4.00', '2013-2014');
INSERT INTO `course` VALUES ('787', '农产品储运保护学', null, null, '1', null, null);
INSERT INTO `course` VALUES ('788', '排球', null, null, '2', null, null);
INSERT INTO `course` VALUES ('789', '乒乓球', null, null, '2', null, null);
INSERT INTO `course` VALUES ('790', '普拉提', null, null, '2', null, null);
INSERT INTO `course` VALUES ('791', '散打', null, null, '2', null, null);
INSERT INTO `course` VALUES ('792', '社会与语言', null, null, '1', null, null);
INSERT INTO `course` VALUES ('793', '生理学概论', null, null, '1', null, null);
INSERT INTO `course` VALUES ('794', '数据库原理及应用', '1', '12', '0', '3.50', '2013-2014');
INSERT INTO `course` VALUES ('795', '数据库原理及应用课程设计', '1', '12', '0', '1.00', '2013-2014');
INSERT INTO `course` VALUES ('796', '网球', null, null, '2', null, null);
INSERT INTO `course` VALUES ('797', '微生物与人类', null, null, '1', null, null);
INSERT INTO `course` VALUES ('798', '微生物与人类健康', null, null, '1', null, null);
INSERT INTO `course` VALUES ('799', '武术', null, null, '2', null, null);
INSERT INTO `course` VALUES ('800', '舞蹈鉴赏', null, null, '1', null, null);
INSERT INTO `course` VALUES ('801', '现代生物技术导论', null, null, '1', null, null);
INSERT INTO `course` VALUES ('802', '信息检索与利用', null, null, '1', null, null);
INSERT INTO `course` VALUES ('803', '音乐欣赏', null, null, '1', null, null);
INSERT INTO `course` VALUES ('804', '影视鉴赏', null, null, '1', null, null);
INSERT INTO `course` VALUES ('805', '游泳初级班', null, null, '2', null, null);
INSERT INTO `course` VALUES ('806', '瑜伽', null, null, '2', null, null);
INSERT INTO `course` VALUES ('807', '羽毛球', null, null, '2', null, null);
INSERT INTO `course` VALUES ('808', '语言文化漫谈', null, null, '1', null, null);
INSERT INTO `course` VALUES ('809', '园艺文化', null, null, '1', null, null);
INSERT INTO `course` VALUES ('810', '中国近海海洋学', null, null, '1', null, null);
INSERT INTO `course` VALUES ('811', 'Java程序设计', '1', '12', '0', '3.50', '2014-2015');
INSERT INTO `course` VALUES ('812', 'Java程序设计课程设计', '1', '12', '0', '1.00', '2014-2015');
INSERT INTO `course` VALUES ('813', '爱情与婚姻', null, null, '1', null, null);
INSERT INTO `course` VALUES ('814', '标准化概论', null, null, '1', null, null);
INSERT INTO `course` VALUES ('815', '操作系统', '1', '12', '0', '3.50', '2014-2015');
INSERT INTO `course` VALUES ('816', '大学生创业教育概论', null, null, '1', null, null);
INSERT INTO `course` VALUES ('817', '海洋体育休闲', null, null, '1', null, null);
INSERT INTO `course` VALUES ('818', '红楼梦诗词与人物', null, null, '1', null, null);
INSERT INTO `course` VALUES ('819', '计算机接口技术', '1', '12', '0', '3.50', '2014-2015');
INSERT INTO `course` VALUES ('820', '计算机接口技术课程实习', '1', '12', '0', '3.00', '2014-2015');
INSERT INTO `course` VALUES ('821', '计算机网络', '1', '12', '0', '3.50', '2014-2015');
INSERT INTO `course` VALUES ('822', '计算机职业素质教育', '1', '12', '0', '2.50', '2014-2015');
INSERT INTO `course` VALUES ('823', '计算机专业英语', '1', '12', '0', '3.00', '2014-2015');
INSERT INTO `course` VALUES ('824', '软件工程', '1', '12', '0', '3.00', '2014-2015');
INSERT INTO `course` VALUES ('825', '形势与政策教育3', '1', '12', '0', '1.50', '2014-2015');
INSERT INTO `course` VALUES ('826', '医学养生', null, null, '1', null, null);
INSERT INTO `course` VALUES ('827', '益生菌基础与应用', null, null, '1', null, null);
INSERT INTO `course` VALUES ('838', '篮球(高)', null, null, '2', null, null);

-- ----------------------------
-- Table structure for dormitory
-- ----------------------------
DROP TABLE IF EXISTS `dormitory`;
CREATE TABLE `dormitory` (
  `dormitoryId` int(11) NOT NULL AUTO_INCREMENT COMMENT '宿舍Id',
  `dormitoryNum` varchar(10) NOT NULL COMMENT '宿舍号',
  `yardId` smallint(6) NOT NULL COMMENT '大院Id',
  PRIMARY KEY (`dormitoryId`),
  KEY `fk_dormitory_yard` (`yardId`),
  CONSTRAINT `fk_dormitory_yard` FOREIGN KEY (`yardId`) REFERENCES `yard` (`yardId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='宿舍';

-- ----------------------------
-- Records of dormitory
-- ----------------------------
INSERT INTO `dormitory` VALUES ('1', '204', '1');
INSERT INTO `dormitory` VALUES ('2', '206', '1');
INSERT INTO `dormitory` VALUES ('3', '208', '1');
INSERT INTO `dormitory` VALUES ('4', '211', '1');
INSERT INTO `dormitory` VALUES ('5', '109', '2');

-- ----------------------------
-- Table structure for downfile
-- ----------------------------
DROP TABLE IF EXISTS `downfile`;
CREATE TABLE `downfile` (
  `fileId` char(32) NOT NULL COMMENT '文件Id',
  `fileName` varchar(255) NOT NULL COMMENT '文件名',
  `fileUrl` varchar(255) NOT NULL COMMENT '文件路径',
  `releaseTime` datetime NOT NULL COMMENT '发布时间',
  `adminId` int(11) NOT NULL COMMENT '上传者',
  `description` varchar(100) NOT NULL COMMENT '文件描述',
  PRIMARY KEY (`fileId`),
  KEY `fk_downFile_admin` (`adminId`),
  CONSTRAINT `fk_downFile_admin` FOREIGN KEY (`adminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件下载';

-- ----------------------------
-- Records of downfile
-- ----------------------------
INSERT INTO `downfile` VALUES ('5b371a7b4340474abbc57f5d0aa3d8cb', '国家奖学金申请表.doc', '', '2014-12-01 16:53:52', '1', '国家奖学金申请表');
INSERT INTO `downfile` VALUES ('738e95f4ce6d4721a9ab65dac7c8a712', '广东海洋大学学生及家庭情况调查表.doc', '', '2014-12-01 16:53:52', '1', '广东海洋大学学生及家庭情况调查表');
INSERT INTO `downfile` VALUES ('ac63abe21e734df1926c4fc60c1d4d76', '国家助学贷款申请表.doc', '', '2014-12-01 16:53:52', '1', '国家助学贷款申请表');
INSERT INTO `downfile` VALUES ('d50a1a02b7ab4fbebf7c2a4881a94716', '国家励志奖学金申请表.doc', '', '2014-12-01 16:53:52', '1', '国家励志奖学金申请表');
INSERT INTO `downfile` VALUES ('f485b02fb50443b998197046942287c2', '家庭经济困难证明.doc', '', '2014-12-01 16:53:52', '1', '家庭经济困难证明');
INSERT INTO `downfile` VALUES ('f9da4bb8a66c43b09454389c6bed3f56', '家长承诺书.doc', '', '2014-12-01 16:53:52', '1', '家长承诺书');
INSERT INTO `downfile` VALUES ('fd48a767fb8e48cfa5e092d9fdfb4802', '勤工助学申请表.doc', '', '2014-12-01 16:53:52', '1', '勤工助学申请表');

-- ----------------------------
-- Table structure for excellentapply
-- ----------------------------
DROP TABLE IF EXISTS `excellentapply`;
CREATE TABLE `excellentapply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` char(255) NOT NULL COMMENT '学号',
  `leval` int(11) NOT NULL COMMENT '奖学金等级，1为一等奖，以此类推',
  `schoolyear` varchar(255) NOT NULL COMMENT '学年',
  `classid` int(255) DEFAULT NULL COMMENT '班级',
  PRIMARY KEY (`id`),
  KEY `classid` (`classid`),
  CONSTRAINT `classid` FOREIGN KEY (`classid`) REFERENCES `class` (`classId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of excellentapply
-- ----------------------------

-- ----------------------------
-- Table structure for extend_table
-- ----------------------------
DROP TABLE IF EXISTS `extend_table`;
CREATE TABLE `extend_table` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `extend_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of extend_table
-- ----------------------------

-- ----------------------------
-- Table structure for family
-- ----------------------------
DROP TABLE IF EXISTS `family`;
CREATE TABLE `family` (
  `studentNum` char(12) NOT NULL COMMENT '学号',
  `level` varchar(10) DEFAULT '' COMMENT '困难等级 (0：特殊困难，1：困难，2：一般困难)',
  `schoolYear` char(9) NOT NULL COMMENT '学年',
  `tel` varchar(20) NOT NULL COMMENT '家庭电话',
  `address` varchar(50) DEFAULT '' COMMENT '家庭地址',
  `origin` varchar(20) DEFAULT NULL COMMENT '家庭出身',
  `householdType` varchar(10) NOT NULL COMMENT '家庭户口类型',
  `familySize` smallint(6) NOT NULL COMMENT '家庭人口总数',
  `monthlyIncome` int(11) NOT NULL COMMENT '家庭月收入(整数)',
  `perMonthlyIncome` int(11) NOT NULL COMMENT '人均月收入(整数)',
  `sourceIncome` varchar(20) NOT NULL COMMENT '收入来源',
  `comment` varchar(100) DEFAULT NULL COMMENT '备注',
  KEY `fk_family_student` (`studentNum`),
  KEY `fk_family_schoolYear` (`schoolYear`),
  CONSTRAINT `fk_family_schoolYear` FOREIGN KEY (`schoolYear`) REFERENCES `schoolyear` (`schoolYear`),
  CONSTRAINT `fk_family_student` FOREIGN KEY (`studentNum`) REFERENCES `student` (`studentNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='家庭情况';

-- ----------------------------
-- Records of family
-- ----------------------------
INSERT INTO `family` VALUES ('201011621103', '困难', '2014-2015', '13729023226', '贵州省遵义市江川区高坪镇排军村', '农民', '城镇', '3', '1000', '1000', '打工', '没钱');
INSERT INTO `family` VALUES ('201011621104', '特别困难', '2014-2015', '13763046679', '皖枞阳县老洲镇鲍家二组', '农民', '农村', '4', '2000', '1500', '种田', '没钱，要买iphone');
INSERT INTO `family` VALUES ('201011621107', '特别困难', '2014-2015', '13425949300', '佛山市顺德区北滘镇西海村六丰上街116号', '农民', '农村', '5', '800', '1000', '打工', '家庭负担太重了');
INSERT INTO `family` VALUES ('201011621101', '困难', '2014-2015', '13763074627', '澄海区陆盾围D9幢204', '农民', '农村', '10', '30000', '1000', '打工', '没钱');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `grade` char(4) NOT NULL COMMENT '年级（如：2011）',
  PRIMARY KEY (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='年级';

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('2009');
INSERT INTO `grade` VALUES ('2010');
INSERT INTO `grade` VALUES ('2011');
INSERT INTO `grade` VALUES ('2012');
INSERT INTO `grade` VALUES ('2013');
INSERT INTO `grade` VALUES ('2014');
INSERT INTO `grade` VALUES ('2015');
INSERT INTO `grade` VALUES ('2016');
INSERT INTO `grade` VALUES ('2017');
INSERT INTO `grade` VALUES ('2018');
INSERT INTO `grade` VALUES ('2019');
INSERT INTO `grade` VALUES ('2020');
INSERT INTO `grade` VALUES ('2021');

-- ----------------------------
-- Table structure for jobarrange
-- ----------------------------
DROP TABLE IF EXISTS `jobarrange`;
CREATE TABLE `jobarrange` (
  `studentNum` char(12) NOT NULL COMMENT '学号',
  `schoolYear` char(9) NOT NULL COMMENT '学年',
  `arrangeJob` varchar(20) NOT NULL COMMENT '安排岗位',
  `path` varchar(200) NOT NULL COMMENT '申请表路径',
  `salary` int(11) DEFAULT NULL COMMENT '工资',
  `comment` varchar(50) DEFAULT NULL COMMENT '备注',
  KEY `fk_jobArrange_student` (`studentNum`),
  KEY `fk_jobArrange_schoolYear` (`schoolYear`),
  CONSTRAINT `fk_jobArrange_schoolYear` FOREIGN KEY (`schoolYear`) REFERENCES `schoolyear` (`schoolYear`),
  CONSTRAINT `fk_jobArrange_student` FOREIGN KEY (`studentNum`) REFERENCES `student` (`studentNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='勤工助学岗位安排';

-- ----------------------------
-- Records of jobarrange
-- ----------------------------

-- ----------------------------
-- Table structure for jobtemp
-- ----------------------------
DROP TABLE IF EXISTS `jobtemp`;
CREATE TABLE `jobtemp` (
  `studentNum` char(36) DEFAULT NULL,
  `schoolYear` char(36) DEFAULT NULL,
  `slarry` int(11) DEFAULT NULL,
  `workplace` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobtemp
-- ----------------------------
INSERT INTO `jobtemp` VALUES ('201011621101', '2014-2015', '2100', '四饭');

-- ----------------------------
-- Table structure for loanallot
-- ----------------------------
DROP TABLE IF EXISTS `loanallot`;
CREATE TABLE `loanallot` (
  `studentNum` char(12) DEFAULT NULL COMMENT '学号',
  `loanMoney` int(11) NOT NULL COMMENT '贷款金额',
  `loanYear` char(4) NOT NULL COMMENT '贷款年份',
  KEY `fk_loanAllot_student` (`studentNum`),
  KEY `fk_loanAllot_grade` (`loanYear`),
  CONSTRAINT `fk_loanAllot_grade` FOREIGN KEY (`loanYear`) REFERENCES `grade` (`grade`),
  CONSTRAINT `fk_loanAllot_student` FOREIGN KEY (`studentNum`) REFERENCES `student` (`studentNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='贷款分配';

-- ----------------------------
-- Records of loanallot
-- ----------------------------

-- ----------------------------
-- Table structure for loanapply
-- ----------------------------
DROP TABLE IF EXISTS `loanapply`;
CREATE TABLE `loanapply` (
  `studentNum` char(12) NOT NULL COMMENT '学号',
  `applyMoney` int(11) DEFAULT NULL COMMENT '计划贷款金额',
  KEY `fk_loanApply_student` (`studentNum`),
  CONSTRAINT `fk_loanApply_student` FOREIGN KEY (`studentNum`) REFERENCES `student` (`studentNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='贷款申请';

-- ----------------------------
-- Records of loanapply
-- ----------------------------

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `majorId` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '专业Id',
  `academyId` smallint(6) NOT NULL COMMENT '学院Id',
  `majorName` varchar(30) NOT NULL COMMENT '专业名称',
  `shortName` varchar(20) NOT NULL COMMENT '专业简称',
  `counselor` varchar(10) NOT NULL COMMENT '辅导员',
  `tel` varchar(20) DEFAULT NULL COMMENT '辅导员联系电话',
  PRIMARY KEY (`majorId`),
  KEY `fk_major_academy` (`academyId`),
  CONSTRAINT `fk_major_academy` FOREIGN KEY (`academyId`) REFERENCES `academy` (`academyId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='专业';

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES ('1', '1', '计算机科学与技术', '计科', '陈韶伟', '13922083031');
INSERT INTO `major` VALUES ('2', '1', '软件工程', '软件', '金鑫', '13234234234');
INSERT INTO `major` VALUES ('3', '1', '信息管理与信息系统', '信管', '某老师', '12345678901');
INSERT INTO `major` VALUES ('4', '2', '养鱼专业', '养鱼', '郭志峰', '12345678901');
INSERT INTO `major` VALUES ('5', '2', '养虾专业', '养虾', '郭灶鹏', '12345678901');
INSERT INTO `major` VALUES ('8', '2', '水产养殖', '养殖', '称独岛', '15812352256');
INSERT INTO `major` VALUES ('12', '1', '信息管理与信息系统', '信管', '陈绍伟', '15812352269');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `menuId` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单Id',
  `menuUrl` varchar(100) NOT NULL COMMENT '菜单路径',
  `subject` varchar(20) DEFAULT NULL COMMENT '模块名（system:系统管理; base:综合管理。。。）,若为null则不是导航菜单',
  `description` varchar(50) DEFAULT NULL COMMENT '菜单描述',
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='菜单';

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', 'system/admin_updateOwnerPassword.gdou', null, '管理员修改自己的密码');
INSERT INTO `menu` VALUES ('2', 'system/admin0.jsp', 'system', '用户管理');
INSERT INTO `menu` VALUES ('3', 'system/log.jsp', 'system', '系统日志');
INSERT INTO `menu` VALUES ('4', 'system/admin_getAcademyAdmins.gdou', null, '【超管】查询所有的【院管】');
INSERT INTO `menu` VALUES ('5', 'system/admin_getMajorAdmins.gdou', null, '【超管】查询某院的所有【专管】');
INSERT INTO `menu` VALUES ('6', 'system/admin_addAdmin.gdou', null, '【超管】添加管理员');
INSERT INTO `menu` VALUES ('7', 'system/admin_changePassword.gdou', null, '【超管】修改管理员密码');
INSERT INTO `menu` VALUES ('8', 'system/admin_deleteAdmin.gdou', null, '【超管】删除管理员');
INSERT INTO `menu` VALUES ('9', 'system/admin1.jsp', 'system', '用户管理');
INSERT INTO `menu` VALUES ('10', 'system/admin_role1GetMajorAdmins.gdou', null, '【院管】查询其院的所有【专管】');
INSERT INTO `menu` VALUES ('11', 'system/admin_role1AddMajorAdmin.gdou', null, '【院管】添加【专管】');
INSERT INTO `menu` VALUES ('12', 'system/admin_role1ChangeRole2Pwd.gdou', null, '【院管】修改【专管】密码');
INSERT INTO `menu` VALUES ('13', 'system/admin_role1DeleteMajorAdmin.gdou', null, '【院管】删除【专管】');
INSERT INTO `menu` VALUES ('14', 'base/academy.jsp', 'base', '学院信息维护');
INSERT INTO `menu` VALUES ('15', 'base/academy_add.gdou', null, '添加学院');
INSERT INTO `menu` VALUES ('16', 'base/academy_update.gdou', null, '更新学院');
INSERT INTO `menu` VALUES ('17', 'base/academy_delete.gdou', null, '删除学院');
INSERT INTO `menu` VALUES ('18', 'base/academy_queryByPage.gdou', null, '分页提取学院信息（用于显示学院的整体信息）');
INSERT INTO `menu` VALUES ('19', 'base/academy_getAllAcademys.gdou', null, '查询所有学院（用于下拉框）');
INSERT INTO `menu` VALUES ('20', 'base/major0.jsp', 'base', '专业信息维护');
INSERT INTO `menu` VALUES ('21', 'base/major_getMajorsByAcademyId.gdou', null, '【超管】查某院的所有专业');
INSERT INTO `menu` VALUES ('22', 'base/major_role1GetMajorsByAcademyId.gdou', null, '【院管】查本院的所有专业');
INSERT INTO `menu` VALUES ('23', 'base/class0.jsp', 'base', '班级信息维护');
INSERT INTO `menu` VALUES ('24', 'base/student.jsp', 'base', '学生信息维护');
INSERT INTO `menu` VALUES ('25', 'scholarships/meritScholarship.jsp', 'scholarships', '优秀奖学金管理');
INSERT INTO `menu` VALUES ('26', 'workstudy/nationalScholarship.jsp', 'scholarships', '国家奖学金管理');
INSERT INTO `menu` VALUES ('27', 'workstudy/attendancePosts.jsp', 'workstudy', '勤工岗位管理');
INSERT INTO `menu` VALUES ('28', 'workstudy/grants.jsp', 'workstudy', '助学金管理');
INSERT INTO `menu` VALUES ('29', 'workstudy/loans.jsp', 'workstudy', '助学贷款管理');
INSERT INTO `menu` VALUES ('30', 'workstudy/motivationalScholarships.jsp', 'workstudy', '励志奖学金管理');
INSERT INTO `menu` VALUES ('31', 'workstudy/poorStudents.jsp', 'workstudy', '贫困生管理');
INSERT INTO `menu` VALUES ('32', 'yard/yard.jsp', 'yard', '大院信息维护');
INSERT INTO `menu` VALUES ('33', 'yard/dormitory.jsp', 'yard', '宿舍信息维护');
INSERT INTO `menu` VALUES ('34', 'party/party1.jsp', 'party', '党务管理1');
INSERT INTO `menu` VALUES ('35', 'party/party2.jsp', 'party', '党务管理2');
INSERT INTO `menu` VALUES ('36', 'other/other1.jsp', 'other', '其他功能1');
INSERT INTO `menu` VALUES ('37', 'other/other2.jsp', 'other', '其他功能2');
INSERT INTO `menu` VALUES ('38', 'scholarships/scoreInput.jsp', 'scholarships', '班级成绩导入');
INSERT INTO `menu` VALUES ('39', 'scholarships/scoreInput_fileupload.gdou', null, '导入成绩表格');
INSERT INTO `menu` VALUES ('40', 'scholarships/scoreInput_scoreInput.gdou', null, '成绩导入');
INSERT INTO `menu` VALUES ('41', 'conductpoints/conductCut.jsp', 'conductpoints', '操行分数据导出');
INSERT INTO `menu` VALUES ('42', 'conductpoints/conductPoints.jsp', 'conductpoints', '操行分数据管理');
INSERT INTO `menu` VALUES ('43', 'conductpoints/conduct_getSecondConduct.gdou', null, '获得操行分二级项');
INSERT INTO `menu` VALUES ('44', 'conductpoints/conduct_getSchooltyear.gdou', null, '获得学年');
INSERT INTO `menu` VALUES ('45', 'conductpoints/conduct_insertConduct.gdou', null, '保存操行分项');
INSERT INTO `menu` VALUES ('46', 'conductpoints/conduct_getAcademy.gdou', null, '获取学院');
INSERT INTO `menu` VALUES ('47', 'conductpoints/conduct_getMajor.gdou', null, '获取专业');
INSERT INTO `menu` VALUES ('48', 'conductpoints/conduct_getClassWithMajor.gdou', null, '获取班级');
INSERT INTO `menu` VALUES ('49', 'conductpoints/conduct_getStudent.gdou', null, '获得一个班的所有学生');
INSERT INTO `menu` VALUES ('50', 'conductpoints/conduct_getConductItem.gdou', null, '获取操行分选项');
INSERT INTO `menu` VALUES ('51', 'conductpoints/conduct_insertConductScore.gdou', null, '添加操行分');
INSERT INTO `menu` VALUES ('52', 'system/admin_role1AddStudentAdmin.gdou', null, '添加学生管理员');
INSERT INTO `menu` VALUES ('53', 'system/admin_role1GetStudentAdmins.gdou', null, '获得某个学院的所有学生管理员');
INSERT INTO `menu` VALUES ('54', 'scholarships/scholarshipCut.jsp', 'scholarships', '奖学金数据导出');
INSERT INTO `menu` VALUES ('55', 'scholarships/scholarships_downDataTable.gdou', null, '导出表格');
INSERT INTO `menu` VALUES ('56', 'conductpoints/conductOut_downDataTable.gdou', null, '操行分表格的导出');
INSERT INTO `menu` VALUES ('57', 'scholarships/scholarships_showjiangxuejingByClass.gdou', null, '展示一个班的奖学金获得的情况');
INSERT INTO `menu` VALUES ('58', 'scholarships/scholarships_refresh.gdou', null, '刷新奖学金名单');
INSERT INTO `menu` VALUES ('59', 'workstudy/admin_showpoorstudent.gdou', null, '查看申请学生');
INSERT INTO `menu` VALUES ('60', 'workstudy/admin_allotStudent.gdou', null, '分配评定权限');
INSERT INTO `menu` VALUES ('61', 'workstudy/admin_showResult.gdou', null, '查看评定结果');
INSERT INTO `menu` VALUES ('62', 'workstudy/admin_saveallot.gdou', null, '分配学生');
INSERT INTO `menu` VALUES ('63', 'workstudy/admin_queryClasses.gdou', null, '查询该辅导员管理的班级');
INSERT INTO `menu` VALUES ('64', 'workstudy/admin_getApplyStudents.gdou', null, '显示一些东西');
INSERT INTO `menu` VALUES ('65', 'workstudy/admin_getLoanStudents.gdou', null, '处理贷款相关信息');
INSERT INTO `menu` VALUES ('66', 'workstudy/admin_getAttendanceStudents.gdou', null, '处理勤工岗位的信息');
INSERT INTO `menu` VALUES ('67', 'workstudy/admin_getMotivationalStudents.gdou', null, '处理励志奖学金');
INSERT INTO `menu` VALUES ('68', 'unfinish.jsp', null, '未完成评估学生的名单');
INSERT INTO `menu` VALUES ('69', 'workstudy/todo_allotManyMoney.gdou', null, '分配一些东西');
INSERT INTO `menu` VALUES ('70', 'workstudy/admin_showStudent.gdou', null, '查看学生的个人资料');
INSERT INTO `menu` VALUES ('71', 'workstudy/admin_showStudent.jsp', null, '下载学生的申请表格');
INSERT INTO `menu` VALUES ('72', 'workstudy/exporttable.jsp', 'workstudy', '导出表格');
INSERT INTO `menu` VALUES ('73', 'workstudy/admin_export.gdou', null, null);
INSERT INTO `menu` VALUES ('74', 'base/major1.jsp', 'base', '专业信息维护');
INSERT INTO `menu` VALUES ('75', 'base/major_role0AddMajor.gdou', null, '添加专业（超级管理员）');
INSERT INTO `menu` VALUES ('76', 'base/major_role0EditMajor.gdou', null, '修改专业信息（超级管理员）');
INSERT INTO `menu` VALUES ('77', 'base/major_role0DestoryMajor.gdou', null, '删除专业信息（超级管理员）');
INSERT INTO `menu` VALUES ('78', 'base/major_role1AddMajor.gdou', null, '添加专业（院级管理员）');
INSERT INTO `menu` VALUES ('79', 'base/major_role1EditMajor.gdou', null, '修改专业（院级管理员）');
INSERT INTO `menu` VALUES ('80', 'base/major_role1DestoryMajor.gdou', null, '删除专业信息（院级管理员）');
INSERT INTO `menu` VALUES ('81', 'base/class_getClasssByMajorId.gdou', null, '获取班级列表');
INSERT INTO `menu` VALUES ('82', 'base/class_role0AddClass.gdou', null, '添加班级信息');
INSERT INTO `menu` VALUES ('83', 'base/class_role0EditClass.gdou', null, '编辑班级信息');
INSERT INTO `menu` VALUES ('84', 'base/class_role0DestoryClass.gdou', null, '删除班级信息');
INSERT INTO `menu` VALUES ('85', 'base/class1.jsp', 'base', '班级信息维护');
INSERT INTO `menu` VALUES ('86', 'base/class2.jsp', 'base', '班级信息维护');
INSERT INTO `menu` VALUES ('87', 'base/studentInfo_queryStudentInfo.gdou', null, '获取学生简略信息');
INSERT INTO `menu` VALUES ('88', 'base/studentInfo_getAllInfosByNum.gdou', null, '获取学生详细信息');
INSERT INTO `menu` VALUES ('89', 'base/studentInfo_exportData.gdou', null, '导出学生信息');
INSERT INTO `menu` VALUES ('90', 'base/studentInfo_uploadFile.gdou', null, '上传学生信息或图片');
INSERT INTO `menu` VALUES ('91', 'base/studentInfo_getStudentInfoByClassName.gdou', null, '通过班级名称获取班级的所有学生');
INSERT INTO `menu` VALUES ('92', 'base/studentInfo.jsp', null, '显示学生信息');
INSERT INTO `menu` VALUES ('93', 'base/studentInfo1_editStudentInfos.gdou', null, '更改学生信息');
INSERT INTO `menu` VALUES ('94', 'base/student1.jsp', 'base', '学生信息维护');
INSERT INTO `menu` VALUES ('95', 'base/student2.jsp', 'base', '学生信息维护');
INSERT INTO `menu` VALUES ('96', 'workstudy/admin_showAllotResult.gdou', null, '查看分配的学生信息');
INSERT INTO `menu` VALUES ('97', 'base/studentInfo1_getStudentScoreBynum.gdou', null, '获取学生个人成绩');
INSERT INTO `menu` VALUES ('98', 'base/showStudent.jsp', null, '展示学生');
INSERT INTO `menu` VALUES ('99', 'base/null.jsp', null, null);
INSERT INTO `menu` VALUES ('100', 'base/personInfo.jsp', null, '显示学生个人成绩页面');
INSERT INTO `menu` VALUES ('101', 'base/personPoint.jsp', null, '显示学生操勤分页面');
INSERT INTO `menu` VALUES ('102', 'base/personScore.jsp', null, '显示学生个人成绩页面');
INSERT INTO `menu` VALUES ('103', 'base/studentInfo_forwardShowStudentpage.gdou', null, '跳转到showStudent.jsp页面');
INSERT INTO `menu` VALUES ('104', 'base/studentInfo_forwardStudentInfopage.gdou', null, '跳转到studentInfo.jsp');
INSERT INTO `menu` VALUES ('105', 'base/studentInfo_forwardStudentScorepage.gdou', null, '跳转到studentScore.jsp页面');
INSERT INTO `menu` VALUES ('106', 'base/studentInfo_forwardStudentPointpage.gdou', null, '跳转到studentPoint.jsp页面');
INSERT INTO `menu` VALUES ('107', 'base/studentInfo1_getStudentPoint.gdou', null, '获取学生操行分');
INSERT INTO `menu` VALUES ('108', 'base/studentInfo1_updateStudentScore.gdou', null, '修改学生成绩');
INSERT INTO `menu` VALUES ('109', 'base/studentInfo_updateStudentPoint.gdou', null, '修改学生操行分');

-- ----------------------------
-- Table structure for partymember
-- ----------------------------
DROP TABLE IF EXISTS `partymember`;
CREATE TABLE `partymember` (
  `partyMemberId` int(11) NOT NULL AUTO_INCREMENT COMMENT '党员Id',
  `studentNum` char(12) NOT NULL COMMENT '学号',
  `cadre` varchar(20) NOT NULL COMMENT '职务',
  `cadreTime` date NOT NULL COMMENT '任职时间',
  `thinkReport` tinyint(1) NOT NULL COMMENT '思想汇报',
  `applyBook` tinyint(1) NOT NULL COMMENT '入党申请书',
  `developRegister` tinyint(1) NOT NULL COMMENT '发展对象登记表',
  `inspection` tinyint(1) NOT NULL COMMENT '入党积极分子 培养考察登记表',
  `schoolMemberRegister` tinyint(1) NOT NULL COMMENT '党校学员登记表',
  `research` tinyint(1) NOT NULL COMMENT '群众意见调查表',
  `politicalAudit` tinyint(1) NOT NULL COMMENT '政审材料',
  `turnPositive` tinyint(1) NOT NULL COMMENT '转正申请书',
  `autobiography` tinyint(1) NOT NULL COMMENT '个人自传',
  PRIMARY KEY (`partyMemberId`),
  KEY `fk_partyMember_student` (`studentNum`),
  CONSTRAINT `fk_partyMember_student` FOREIGN KEY (`studentNum`) REFERENCES `student` (`studentNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='党员资料';

-- ----------------------------
-- Records of partymember
-- ----------------------------

-- ----------------------------
-- Table structure for partyorganization
-- ----------------------------
DROP TABLE IF EXISTS `partyorganization`;
CREATE TABLE `partyorganization` (
  `partyOrganizationId` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '党组织Id',
  `orgName` varchar(20) NOT NULL COMMENT '党组织名称',
  `orgNumber` varchar(10) NOT NULL COMMENT '党组织编号',
  `majorId` smallint(6) DEFAULT NULL COMMENT '专业Id',
  PRIMARY KEY (`partyOrganizationId`),
  KEY `fk_partyOrganization_major` (`majorId`),
  CONSTRAINT `fk_partyOrganization_major` FOREIGN KEY (`majorId`) REFERENCES `major` (`majorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='党组织信息';

-- ----------------------------
-- Records of partyorganization
-- ----------------------------

-- ----------------------------
-- Table structure for partywork
-- ----------------------------
DROP TABLE IF EXISTS `partywork`;
CREATE TABLE `partywork` (
  `partyWorkId` int(11) NOT NULL AUTO_INCREMENT COMMENT '个人党务Id',
  `studentNum` char(12) DEFAULT NULL COMMENT '学号',
  `politicsStatus` varchar(10) NOT NULL COMMENT '政治面貌',
  `score` double(4,2) NOT NULL COMMENT '党校成绩',
  `trainNo` varchar(16) NOT NULL COMMENT '第几期培训班',
  `linkMan1` varchar(10) NOT NULL COMMENT '入党联系人1',
  `linkMan2` varchar(10) NOT NULL COMMENT '入党联系人2',
  `introduceMan1` varchar(10) NOT NULL COMMENT '入党介绍人1',
  `introduceMan2` varchar(10) NOT NULL COMMENT '入党介绍人2',
  `applyDate` date NOT NULL COMMENT '提交入党申请书时间',
  `recommendDate` date NOT NULL COMMENT '推优时间',
  `developDate` date NOT NULL COMMENT '转发展对象时间',
  `readyDate` date NOT NULL COMMENT '转预备时间',
  `positiveDate` date NOT NULL COMMENT '转正时间',
  `graduateDate` date NOT NULL COMMENT '党校结业时间',
  PRIMARY KEY (`partyWorkId`),
  KEY `fk_partyWork_student` (`studentNum`),
  CONSTRAINT `fk_partyWork_student` FOREIGN KEY (`studentNum`) REFERENCES `student` (`studentNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人党务信息';

-- ----------------------------
-- Records of partywork
-- ----------------------------

-- ----------------------------
-- Table structure for poorstudent
-- ----------------------------
DROP TABLE IF EXISTS `poorstudent`;
CREATE TABLE `poorstudent` (
  `studentNum` char(12) NOT NULL,
  `score` int(6) NOT NULL DEFAULT '0',
  `classId` int(11) NOT NULL,
  PRIMARY KEY (`studentNum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of poorstudent
-- ----------------------------
INSERT INTO `poorstudent` VALUES ('201011621101', '1', '23');
INSERT INTO `poorstudent` VALUES ('201011621103', '2', '23');
INSERT INTO `poorstudent` VALUES ('201011621104', '3', '23');
INSERT INTO `poorstudent` VALUES ('201011621107', '4', '23');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleId` tinyint(4) NOT NULL COMMENT '角色Id（取值范围：0,1,2）',
  `roleName` varchar(20) NOT NULL COMMENT '角色名',
  `description` varchar(50) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('0', '超级管理员', '管理整个系统');
INSERT INTO `role` VALUES ('1', '学院管理员', '管理本学院');
INSERT INTO `role` VALUES ('2', '专业管理员', '管理本专业');
INSERT INTO `role` VALUES ('3', '学生管理员', '帮助辅导员管理本专业');

-- ----------------------------
-- Table structure for rolemenu
-- ----------------------------
DROP TABLE IF EXISTS `rolemenu`;
CREATE TABLE `rolemenu` (
  `roleId` tinyint(4) NOT NULL DEFAULT '0' COMMENT '角色Id',
  `menuId` int(11) NOT NULL DEFAULT '0' COMMENT '菜单Id',
  PRIMARY KEY (`roleId`,`menuId`),
  KEY `fk_roleMenu_menu` (`menuId`),
  CONSTRAINT `fk_roleMenu_menu` FOREIGN KEY (`menuId`) REFERENCES `menu` (`menuId`),
  CONSTRAINT `fk_roleMenu_role` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色菜单';

-- ----------------------------
-- Records of rolemenu
-- ----------------------------
INSERT INTO `rolemenu` VALUES ('0', '1');
INSERT INTO `rolemenu` VALUES ('1', '1');
INSERT INTO `rolemenu` VALUES ('2', '1');
INSERT INTO `rolemenu` VALUES ('0', '2');
INSERT INTO `rolemenu` VALUES ('0', '3');
INSERT INTO `rolemenu` VALUES ('0', '4');
INSERT INTO `rolemenu` VALUES ('0', '5');
INSERT INTO `rolemenu` VALUES ('0', '6');
INSERT INTO `rolemenu` VALUES ('0', '7');
INSERT INTO `rolemenu` VALUES ('0', '8');
INSERT INTO `rolemenu` VALUES ('1', '9');
INSERT INTO `rolemenu` VALUES ('1', '10');
INSERT INTO `rolemenu` VALUES ('1', '11');
INSERT INTO `rolemenu` VALUES ('1', '12');
INSERT INTO `rolemenu` VALUES ('1', '13');
INSERT INTO `rolemenu` VALUES ('0', '14');
INSERT INTO `rolemenu` VALUES ('0', '15');
INSERT INTO `rolemenu` VALUES ('0', '16');
INSERT INTO `rolemenu` VALUES ('0', '17');
INSERT INTO `rolemenu` VALUES ('0', '18');
INSERT INTO `rolemenu` VALUES ('0', '19');
INSERT INTO `rolemenu` VALUES ('0', '20');
INSERT INTO `rolemenu` VALUES ('0', '21');
INSERT INTO `rolemenu` VALUES ('1', '22');
INSERT INTO `rolemenu` VALUES ('0', '23');
INSERT INTO `rolemenu` VALUES ('0', '24');
INSERT INTO `rolemenu` VALUES ('0', '25');
INSERT INTO `rolemenu` VALUES ('1', '25');
INSERT INTO `rolemenu` VALUES ('2', '25');
INSERT INTO `rolemenu` VALUES ('0', '26');
INSERT INTO `rolemenu` VALUES ('1', '26');
INSERT INTO `rolemenu` VALUES ('2', '26');
INSERT INTO `rolemenu` VALUES ('0', '27');
INSERT INTO `rolemenu` VALUES ('1', '27');
INSERT INTO `rolemenu` VALUES ('2', '27');
INSERT INTO `rolemenu` VALUES ('0', '28');
INSERT INTO `rolemenu` VALUES ('1', '28');
INSERT INTO `rolemenu` VALUES ('2', '28');
INSERT INTO `rolemenu` VALUES ('0', '29');
INSERT INTO `rolemenu` VALUES ('1', '29');
INSERT INTO `rolemenu` VALUES ('2', '29');
INSERT INTO `rolemenu` VALUES ('0', '30');
INSERT INTO `rolemenu` VALUES ('1', '30');
INSERT INTO `rolemenu` VALUES ('2', '30');
INSERT INTO `rolemenu` VALUES ('0', '31');
INSERT INTO `rolemenu` VALUES ('1', '31');
INSERT INTO `rolemenu` VALUES ('2', '31');
INSERT INTO `rolemenu` VALUES ('0', '32');
INSERT INTO `rolemenu` VALUES ('0', '33');
INSERT INTO `rolemenu` VALUES ('0', '34');
INSERT INTO `rolemenu` VALUES ('1', '34');
INSERT INTO `rolemenu` VALUES ('2', '34');
INSERT INTO `rolemenu` VALUES ('0', '35');
INSERT INTO `rolemenu` VALUES ('1', '35');
INSERT INTO `rolemenu` VALUES ('2', '35');
INSERT INTO `rolemenu` VALUES ('0', '36');
INSERT INTO `rolemenu` VALUES ('1', '36');
INSERT INTO `rolemenu` VALUES ('2', '36');
INSERT INTO `rolemenu` VALUES ('0', '37');
INSERT INTO `rolemenu` VALUES ('1', '37');
INSERT INTO `rolemenu` VALUES ('2', '37');
INSERT INTO `rolemenu` VALUES ('0', '38');
INSERT INTO `rolemenu` VALUES ('1', '38');
INSERT INTO `rolemenu` VALUES ('2', '38');
INSERT INTO `rolemenu` VALUES ('0', '39');
INSERT INTO `rolemenu` VALUES ('1', '39');
INSERT INTO `rolemenu` VALUES ('2', '39');
INSERT INTO `rolemenu` VALUES ('0', '40');
INSERT INTO `rolemenu` VALUES ('1', '40');
INSERT INTO `rolemenu` VALUES ('2', '40');
INSERT INTO `rolemenu` VALUES ('0', '41');
INSERT INTO `rolemenu` VALUES ('1', '41');
INSERT INTO `rolemenu` VALUES ('2', '41');
INSERT INTO `rolemenu` VALUES ('3', '41');
INSERT INTO `rolemenu` VALUES ('0', '42');
INSERT INTO `rolemenu` VALUES ('1', '42');
INSERT INTO `rolemenu` VALUES ('2', '42');
INSERT INTO `rolemenu` VALUES ('3', '42');
INSERT INTO `rolemenu` VALUES ('0', '43');
INSERT INTO `rolemenu` VALUES ('1', '43');
INSERT INTO `rolemenu` VALUES ('2', '43');
INSERT INTO `rolemenu` VALUES ('3', '43');
INSERT INTO `rolemenu` VALUES ('0', '44');
INSERT INTO `rolemenu` VALUES ('1', '44');
INSERT INTO `rolemenu` VALUES ('2', '44');
INSERT INTO `rolemenu` VALUES ('3', '44');
INSERT INTO `rolemenu` VALUES ('0', '45');
INSERT INTO `rolemenu` VALUES ('1', '45');
INSERT INTO `rolemenu` VALUES ('2', '45');
INSERT INTO `rolemenu` VALUES ('3', '45');
INSERT INTO `rolemenu` VALUES ('0', '46');
INSERT INTO `rolemenu` VALUES ('1', '46');
INSERT INTO `rolemenu` VALUES ('2', '46');
INSERT INTO `rolemenu` VALUES ('3', '46');
INSERT INTO `rolemenu` VALUES ('0', '47');
INSERT INTO `rolemenu` VALUES ('1', '47');
INSERT INTO `rolemenu` VALUES ('2', '47');
INSERT INTO `rolemenu` VALUES ('3', '47');
INSERT INTO `rolemenu` VALUES ('0', '48');
INSERT INTO `rolemenu` VALUES ('1', '48');
INSERT INTO `rolemenu` VALUES ('2', '48');
INSERT INTO `rolemenu` VALUES ('3', '48');
INSERT INTO `rolemenu` VALUES ('0', '49');
INSERT INTO `rolemenu` VALUES ('1', '49');
INSERT INTO `rolemenu` VALUES ('2', '49');
INSERT INTO `rolemenu` VALUES ('3', '49');
INSERT INTO `rolemenu` VALUES ('0', '50');
INSERT INTO `rolemenu` VALUES ('1', '50');
INSERT INTO `rolemenu` VALUES ('2', '50');
INSERT INTO `rolemenu` VALUES ('3', '50');
INSERT INTO `rolemenu` VALUES ('0', '51');
INSERT INTO `rolemenu` VALUES ('1', '51');
INSERT INTO `rolemenu` VALUES ('2', '51');
INSERT INTO `rolemenu` VALUES ('3', '51');
INSERT INTO `rolemenu` VALUES ('1', '52');
INSERT INTO `rolemenu` VALUES ('1', '53');
INSERT INTO `rolemenu` VALUES ('0', '54');
INSERT INTO `rolemenu` VALUES ('1', '54');
INSERT INTO `rolemenu` VALUES ('2', '54');
INSERT INTO `rolemenu` VALUES ('0', '55');
INSERT INTO `rolemenu` VALUES ('1', '55');
INSERT INTO `rolemenu` VALUES ('2', '55');
INSERT INTO `rolemenu` VALUES ('0', '56');
INSERT INTO `rolemenu` VALUES ('1', '56');
INSERT INTO `rolemenu` VALUES ('2', '56');
INSERT INTO `rolemenu` VALUES ('3', '56');
INSERT INTO `rolemenu` VALUES ('0', '57');
INSERT INTO `rolemenu` VALUES ('1', '57');
INSERT INTO `rolemenu` VALUES ('2', '57');
INSERT INTO `rolemenu` VALUES ('0', '58');
INSERT INTO `rolemenu` VALUES ('1', '58');
INSERT INTO `rolemenu` VALUES ('2', '58');
INSERT INTO `rolemenu` VALUES ('2', '59');
INSERT INTO `rolemenu` VALUES ('2', '60');
INSERT INTO `rolemenu` VALUES ('1', '61');
INSERT INTO `rolemenu` VALUES ('2', '61');
INSERT INTO `rolemenu` VALUES ('2', '62');
INSERT INTO `rolemenu` VALUES ('2', '63');
INSERT INTO `rolemenu` VALUES ('2', '64');
INSERT INTO `rolemenu` VALUES ('1', '65');
INSERT INTO `rolemenu` VALUES ('2', '65');
INSERT INTO `rolemenu` VALUES ('1', '66');
INSERT INTO `rolemenu` VALUES ('2', '66');
INSERT INTO `rolemenu` VALUES ('2', '67');
INSERT INTO `rolemenu` VALUES ('2', '68');
INSERT INTO `rolemenu` VALUES ('2', '69');
INSERT INTO `rolemenu` VALUES ('1', '70');
INSERT INTO `rolemenu` VALUES ('2', '70');
INSERT INTO `rolemenu` VALUES ('1', '71');
INSERT INTO `rolemenu` VALUES ('2', '71');
INSERT INTO `rolemenu` VALUES ('1', '72');
INSERT INTO `rolemenu` VALUES ('2', '72');
INSERT INTO `rolemenu` VALUES ('1', '73');
INSERT INTO `rolemenu` VALUES ('2', '73');
INSERT INTO `rolemenu` VALUES ('1', '74');
INSERT INTO `rolemenu` VALUES ('0', '75');
INSERT INTO `rolemenu` VALUES ('0', '76');
INSERT INTO `rolemenu` VALUES ('0', '77');
INSERT INTO `rolemenu` VALUES ('1', '78');
INSERT INTO `rolemenu` VALUES ('1', '79');
INSERT INTO `rolemenu` VALUES ('1', '80');
INSERT INTO `rolemenu` VALUES ('0', '81');
INSERT INTO `rolemenu` VALUES ('1', '81');
INSERT INTO `rolemenu` VALUES ('2', '81');
INSERT INTO `rolemenu` VALUES ('0', '82');
INSERT INTO `rolemenu` VALUES ('1', '82');
INSERT INTO `rolemenu` VALUES ('2', '82');
INSERT INTO `rolemenu` VALUES ('0', '83');
INSERT INTO `rolemenu` VALUES ('1', '83');
INSERT INTO `rolemenu` VALUES ('2', '83');
INSERT INTO `rolemenu` VALUES ('0', '84');
INSERT INTO `rolemenu` VALUES ('1', '84');
INSERT INTO `rolemenu` VALUES ('2', '84');
INSERT INTO `rolemenu` VALUES ('1', '85');
INSERT INTO `rolemenu` VALUES ('2', '86');
INSERT INTO `rolemenu` VALUES ('0', '87');
INSERT INTO `rolemenu` VALUES ('1', '87');
INSERT INTO `rolemenu` VALUES ('2', '87');
INSERT INTO `rolemenu` VALUES ('0', '88');
INSERT INTO `rolemenu` VALUES ('1', '88');
INSERT INTO `rolemenu` VALUES ('2', '88');
INSERT INTO `rolemenu` VALUES ('0', '89');
INSERT INTO `rolemenu` VALUES ('1', '89');
INSERT INTO `rolemenu` VALUES ('2', '89');
INSERT INTO `rolemenu` VALUES ('0', '90');
INSERT INTO `rolemenu` VALUES ('1', '90');
INSERT INTO `rolemenu` VALUES ('2', '90');
INSERT INTO `rolemenu` VALUES ('0', '91');
INSERT INTO `rolemenu` VALUES ('1', '91');
INSERT INTO `rolemenu` VALUES ('2', '91');
INSERT INTO `rolemenu` VALUES ('0', '92');
INSERT INTO `rolemenu` VALUES ('1', '92');
INSERT INTO `rolemenu` VALUES ('2', '92');
INSERT INTO `rolemenu` VALUES ('0', '93');
INSERT INTO `rolemenu` VALUES ('1', '93');
INSERT INTO `rolemenu` VALUES ('2', '93');
INSERT INTO `rolemenu` VALUES ('1', '94');
INSERT INTO `rolemenu` VALUES ('2', '95');
INSERT INTO `rolemenu` VALUES ('2', '96');
INSERT INTO `rolemenu` VALUES ('0', '97');
INSERT INTO `rolemenu` VALUES ('1', '97');
INSERT INTO `rolemenu` VALUES ('2', '97');
INSERT INTO `rolemenu` VALUES ('0', '98');
INSERT INTO `rolemenu` VALUES ('1', '98');
INSERT INTO `rolemenu` VALUES ('2', '98');
INSERT INTO `rolemenu` VALUES ('0', '99');
INSERT INTO `rolemenu` VALUES ('1', '99');
INSERT INTO `rolemenu` VALUES ('2', '99');
INSERT INTO `rolemenu` VALUES ('0', '100');
INSERT INTO `rolemenu` VALUES ('1', '100');
INSERT INTO `rolemenu` VALUES ('2', '100');
INSERT INTO `rolemenu` VALUES ('0', '101');
INSERT INTO `rolemenu` VALUES ('1', '101');
INSERT INTO `rolemenu` VALUES ('2', '101');
INSERT INTO `rolemenu` VALUES ('0', '102');
INSERT INTO `rolemenu` VALUES ('1', '102');
INSERT INTO `rolemenu` VALUES ('2', '102');
INSERT INTO `rolemenu` VALUES ('0', '103');
INSERT INTO `rolemenu` VALUES ('1', '103');
INSERT INTO `rolemenu` VALUES ('2', '103');
INSERT INTO `rolemenu` VALUES ('0', '104');
INSERT INTO `rolemenu` VALUES ('1', '104');
INSERT INTO `rolemenu` VALUES ('2', '104');
INSERT INTO `rolemenu` VALUES ('0', '105');
INSERT INTO `rolemenu` VALUES ('1', '105');
INSERT INTO `rolemenu` VALUES ('2', '105');
INSERT INTO `rolemenu` VALUES ('0', '106');
INSERT INTO `rolemenu` VALUES ('1', '106');
INSERT INTO `rolemenu` VALUES ('2', '106');
INSERT INTO `rolemenu` VALUES ('0', '107');
INSERT INTO `rolemenu` VALUES ('1', '107');
INSERT INTO `rolemenu` VALUES ('2', '107');
INSERT INTO `rolemenu` VALUES ('0', '108');
INSERT INTO `rolemenu` VALUES ('1', '108');
INSERT INTO `rolemenu` VALUES ('2', '108');
INSERT INTO `rolemenu` VALUES ('0', '109');
INSERT INTO `rolemenu` VALUES ('1', '109');
INSERT INTO `rolemenu` VALUES ('2', '109');

-- ----------------------------
-- Table structure for schoolyear
-- ----------------------------
DROP TABLE IF EXISTS `schoolyear`;
CREATE TABLE `schoolyear` (
  `schoolYear` varchar(9) NOT NULL COMMENT '学年（如：2011-2012）',
  PRIMARY KEY (`schoolYear`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学年';

-- ----------------------------
-- Records of schoolyear
-- ----------------------------
INSERT INTO `schoolyear` VALUES ('2011-2012');
INSERT INTO `schoolyear` VALUES ('2012-2013');
INSERT INTO `schoolyear` VALUES ('2013-2014');
INSERT INTO `schoolyear` VALUES ('2014-2015');
INSERT INTO `schoolyear` VALUES ('2015-2016');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `sid` varchar(12) NOT NULL COMMENT '学生外键',
  `cid` int(12) NOT NULL COMMENT '课程的外键',
  `grade` double(10,0) NOT NULL COMMENT '成绩，-1表示缺考，-2表示取消资格，-3表示缓考',
  `bukao` double(10,0) DEFAULT NULL COMMENT '补考成绩',
  `chongkao` double(10,0) DEFAULT NULL COMMENT '重考',
  `qingkao` double(10,0) DEFAULT NULL COMMENT '清考',
  `schoolyear` varchar(10) DEFAULT NULL COMMENT '学年',
  PRIMARY KEY (`id`),
  KEY `course_score` (`cid`),
  KEY `student_score` (`sid`),
  CONSTRAINT `course_score` FOREIGN KEY (`cid`) REFERENCES `course` (`id`),
  CONSTRAINT `student_score` FOREIGN KEY (`sid`) REFERENCES `student` (`studentNum`)
) ENGINE=InnoDB AUTO_INCREMENT=7134 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES ('5468', '201211621201', '625', '80', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5469', '201211621201', '634', '80', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5470', '201211621201', '637', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5471', '201211621201', '632', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5472', '201211621201', '624', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5473', '201211621201', '799', '84', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5474', '201211621201', '627', '91', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5475', '201211621201', '626', '74', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5476', '201211621201', '808', '96', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5477', '201211621201', '647', '80', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5478', '201211621201', '639', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5479', '201211621201', '690', '84', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5480', '201211621201', '805', '98', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5481', '201211621201', '646', '73', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5482', '201211621201', '651', '69', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5483', '201211621201', '663', '86', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5484', '201211621201', '803', '84', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5485', '201211621201', '645', '71', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5486', '201211621201', '655', '77', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5487', '201211621201', '640', '95', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5488', '201211621201', '804', '63', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5489', '201211621201', '745', '81', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5490', '201211621201', '807', '82', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5491', '201211621201', '743', '77', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5492', '201211621201', '720', '71', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5493', '201211621201', '733', '83', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5494', '201211621201', '717', '74', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5495', '201211621201', '735', '84', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5496', '201211621201', '734', '95', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5497', '201211621201', '699', '77', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5498', '201211621201', '786', '70', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5499', '201211621201', '767', '65', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5500', '201211621201', '776', '84', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5501', '201211621201', '775', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5502', '201211621201', '794', '88', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5503', '201211621201', '795', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5504', '201211621201', '777', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5505', '201211621201', '774', '90', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5506', '201211621201', '771', '81', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5507', '201211621201', '763', '64', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5508', '201211621201', '824', '72', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5509', '201211621201', '823', '99', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5510', '201211621201', '822', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5511', '201211621201', '727', '87', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5512', '201211621201', '819', '63', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5513', '201211621201', '798', '75', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5514', '201211621201', '825', '87', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5515', '201211621201', '811', '84', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5516', '201211621201', '789', '70', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5517', '201211621201', '812', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5518', '201211621201', '820', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5519', '201211621201', '821', '86', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5520', '201211621201', '815', '99', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5521', '201211621202', '625', '79', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5522', '201211621202', '634', '74', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5523', '201211621202', '637', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5524', '201211621202', '632', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5525', '201211621202', '624', '47', '69', null, null, '2012-2013');
INSERT INTO `score` VALUES ('5526', '201211621202', '789', '78', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5527', '201211621202', '627', '70', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5528', '201211621202', '626', '38', '63', null, null, '2012-2013');
INSERT INTO `score` VALUES ('5529', '201211621202', '647', '67', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5530', '201211621202', '639', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5531', '201211621202', '690', '89', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5532', '201211621202', '721', '80', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5533', '201211621202', '646', '69', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5534', '201211621202', '807', '81', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5535', '201211621202', '731', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5536', '201211621202', '651', '62', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5537', '201211621202', '663', '86', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5538', '201211621202', '645', '74', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5539', '201211621202', '655', '54', '62', null, null, '2012-2013');
INSERT INTO `score` VALUES ('5540', '201211621202', '640', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5541', '201211621202', '745', '90', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5542', '201211621202', '785', '71', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5543', '201211621202', '779', '66', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5544', '201211621202', '698', '87', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5545', '201211621202', '743', '70', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5546', '201211621202', '720', '70', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5547', '201211621202', '733', '66', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5548', '201211621202', '717', '70', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5549', '201211621202', '803', '80', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5550', '201211621202', '735', '80', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5551', '201211621202', '734', '95', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5552', '201211621202', '699', '72', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5553', '201211621202', '786', '76', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5554', '201211621202', '767', '63', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5555', '201211621202', '776', '70', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5556', '201211621202', '775', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5557', '201211621202', '794', '77', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5558', '201211621202', '772', '91', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5559', '201211621202', '795', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5560', '201211621202', '777', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5561', '201211621202', '774', '72', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5562', '201211621202', '784', '76', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5563', '201211621202', '763', '67', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5564', '201211621202', '824', '77', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5565', '201211621202', '823', '97', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5566', '201211621202', '822', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5567', '201211621202', '727', '72', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5568', '201211621202', '819', '61', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5569', '201211621202', '825', '90', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5570', '201211621202', '811', '78', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5571', '201211621202', '812', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5572', '201211621202', '820', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5573', '201211621202', '821', '75', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5574', '201211621202', '815', '88', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5575', '201211621203', '625', '72', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5576', '201211621203', '634', '76', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5577', '201211621203', '637', '84', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5578', '201211621203', '632', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5579', '201211621203', '624', '71', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5580', '201211621203', '627', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5581', '201211621203', '784', '76', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5582', '201211621203', '626', '53', '68', null, null, '2012-2013');
INSERT INTO `score` VALUES ('5583', '201211621203', '647', '68', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5584', '201211621203', '639', '86', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5585', '201211621203', '690', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5586', '201211621203', '665', '94', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5587', '201211621203', '646', '66', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5588', '201211621203', '651', '76', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5589', '201211621203', '663', '86', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5590', '201211621203', '645', '63', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5591', '201211621203', '655', '69', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5592', '201211621203', '649', '91', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5593', '201211621203', '640', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5594', '201211621203', '797', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5595', '201211621203', '745', '86', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5596', '201211621203', '807', '76', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5597', '201211621203', '743', '52', '79', null, null, '2013-2014');
INSERT INTO `score` VALUES ('5598', '201211621203', '731', '81', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5599', '201211621203', '720', '71', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5600', '201211621203', '733', '61', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5601', '201211621203', '717', '70', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5602', '201211621203', '735', '64', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5603', '201211621203', '722', '87', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5604', '201211621203', '734', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5605', '201211621203', '699', '68', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5606', '201211621203', '786', '66', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5607', '201211621203', '767', '60', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5608', '201211621203', '805', '99', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5609', '201211621203', '776', '78', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5610', '201211621203', '775', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5611', '201211621203', '794', '68', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5612', '201211621203', '793', '87', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5613', '201211621203', '795', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5614', '201211621203', '777', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5615', '201211621203', '774', '67', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5616', '201211621203', '763', '65', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5617', '201211621203', '824', '67', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5618', '201211621203', '823', '91', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5619', '201211621203', '822', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5620', '201211621203', '819', '64', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5621', '201211621203', '827', '83', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5622', '201211621203', '825', '89', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5623', '201211621203', '811', '79', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5624', '201211621203', '800', '76', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5625', '201211621203', '812', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5626', '201211621203', '820', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5627', '201211621203', '821', '86', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5628', '201211621203', '815', '84', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5629', '201211621204', '625', '68', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5630', '201211621204', '634', '84', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5631', '201211621204', '637', '83', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5632', '201211621204', '632', '88', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5633', '201211621204', '624', '64', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5634', '201211621204', '799', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5635', '201211621204', '627', '84', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5636', '201211621204', '626', '74', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5637', '201211621204', '639', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5638', '201211621204', '690', '89', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5639', '201211621204', '645', '63', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5640', '201211621204', '640', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5641', '201211621204', '647', '71', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5642', '201211621204', '796', '92', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5643', '201211621204', '705', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5644', '201211621204', '721', '77', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5645', '201211621204', '646', '65', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5646', '201211621204', '711', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5647', '201211621204', '651', '67', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5648', '201211621204', '663', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5649', '201211621204', '655', '88', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5650', '201211621204', '756', '83', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5651', '201211621204', '725', '73', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5652', '201211621204', '745', '84', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5653', '201211621204', '709', '83', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5654', '201211621204', '807', '72', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5655', '201211621204', '743', '82', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5656', '201211621204', '720', '78', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5657', '201211621204', '733', '78', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5658', '201211621204', '717', '79', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5659', '201211621204', '735', '79', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5660', '201211621204', '734', '95', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5661', '201211621204', '699', '73', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5662', '201211621204', '786', '83', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5663', '201211621204', '767', '63', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5664', '201211621204', '776', '61', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5665', '201211621204', '775', '65', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5666', '201211621204', '794', '73', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5667', '201211621204', '785', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5668', '201211621204', '779', '72', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5669', '201211621204', '795', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5670', '201211621204', '777', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5671', '201211621204', '774', '53', '61', null, null, '2013-2014');
INSERT INTO `score` VALUES ('5672', '201211621204', '801', '80', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5673', '201211621204', '763', '67', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5674', '201211621204', '824', '67', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5675', '201211621204', '797', '91', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5676', '201211621204', '823', '88', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5677', '201211621204', '822', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5678', '201211621204', '819', '64', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5679', '201211621204', '825', '87', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5680', '201211621204', '772', '88', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5681', '201211621204', '811', '80', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5682', '201211621204', '812', '65', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5683', '201211621204', '820', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5684', '201211621204', '821', '76', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5685', '201211621204', '815', '89', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5686', '201211621206', '625', '76', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5687', '201211621206', '634', '72', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5688', '201211621206', '637', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5689', '201211621206', '632', '88', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5690', '201211621206', '624', '73', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5691', '201211621206', '788', '98', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5692', '201211621206', '627', '80', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5693', '201211621206', '626', '86', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5694', '201211621206', '796', '88', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5695', '201211621206', '647', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5696', '201211621206', '639', '91', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5697', '201211621206', '690', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5698', '201211621206', '646', '69', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5699', '201211621206', '698', '84', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5700', '201211621206', '650', '81', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5701', '201211621206', '651', '79', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5702', '201211621206', '663', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5703', '201211621206', '645', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5704', '201211621206', '655', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5705', '201211621206', '640', '95', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5706', '201211621206', '806', '91', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5707', '201211621206', '727', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5708', '201211621206', '745', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5709', '201211621206', '743', '77', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5710', '201211621206', '720', '74', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5711', '201211621206', '754', '87', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5712', '201211621206', '733', '89', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5713', '201211621206', '717', '80', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5714', '201211621206', '735', '78', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5715', '201211621206', '734', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5716', '201211621206', '699', '83', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5717', '201211621206', '786', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5718', '201211621206', '767', '67', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5719', '201211621206', '776', '73', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5720', '201211621206', '775', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5721', '201211621206', '794', '82', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5722', '201211621206', '795', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5723', '201211621206', '777', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5724', '201211621206', '789', '88', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5725', '201211621206', '774', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5726', '201211621206', '771', '86', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5727', '201211621206', '763', '70', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5728', '201211621206', '824', '69', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5729', '201211621206', '823', '97', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5730', '201211621206', '822', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5731', '201211621206', '819', '69', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5732', '201211621206', '825', '88', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5733', '201211621206', '811', '93', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5734', '201211621206', '812', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5735', '201211621206', '820', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5736', '201211621206', '803', '60', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5737', '201211621206', '821', '83', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5738', '201211621206', '815', '92', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5739', '201211621207', '625', '81', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5740', '201211621207', '634', '74', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5741', '201211621207', '637', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5742', '201211621207', '632', '88', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5743', '201211621207', '624', '66', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5744', '201211621207', '627', '78', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5745', '201211621207', '784', '83', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5746', '201211621207', '626', '60', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5747', '201211621207', '647', '72', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5748', '201211621207', '639', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5749', '201211621207', '727', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5750', '201211621207', '690', '87', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5751', '201211621207', '646', '70', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5752', '201211621207', '807', '83', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5753', '201211621207', '731', '83', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5754', '201211621207', '651', '66', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5755', '201211621207', '663', '86', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5756', '201211621207', '645', '62', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5757', '201211621207', '655', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5758', '201211621207', '640', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5759', '201211621207', '745', '86', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5760', '201211621207', '785', '66', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5761', '201211621207', '779', '65', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5762', '201211621207', '698', '79', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5763', '201211621207', '743', '90', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5764', '201211621207', '720', '72', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5765', '201211621207', '733', '70', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5766', '201211621207', '717', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5767', '201211621207', '803', '80', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5768', '201211621207', '735', '86', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5769', '201211621207', '734', '95', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5770', '201211621207', '699', '80', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5771', '201211621207', '786', '79', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5772', '201211621207', '792', '90', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5773', '201211621207', '767', '69', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5774', '201211621207', '776', '74', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5775', '201211621207', '775', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5776', '201211621207', '794', '78', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5777', '201211621207', '790', '76', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5778', '201211621207', '795', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5779', '201211621207', '777', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5780', '201211621207', '774', '73', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5781', '201211621207', '763', '68', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5782', '201211621207', '824', '79', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5783', '201211621207', '823', '97', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5784', '201211621207', '822', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5785', '201211621207', '819', '75', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5786', '201211621207', '825', '87', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5787', '201211621207', '811', '87', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5788', '201211621207', '812', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5789', '201211621207', '820', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5790', '201211621207', '821', '82', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5791', '201211621207', '815', '96', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5792', '201211621208', '625', '81', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5793', '201211621208', '634', '79', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5794', '201211621208', '637', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5795', '201211621208', '632', '88', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5796', '201211621208', '624', '68', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5797', '201211621208', '789', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5798', '201211621208', '627', '79', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5799', '201211621208', '626', '66', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5800', '201211621208', '808', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5801', '201211621208', '647', '71', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5802', '201211621208', '639', '81', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5803', '201211621208', '690', '77', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5804', '201211621208', '646', '68', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5805', '201211621208', '780', '86', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5806', '201211621208', '651', '67', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5807', '201211621208', '663', '83', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5808', '201211621208', '803', '88', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5809', '201211621208', '645', '70', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5810', '201211621208', '655', '71', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5811', '201211621208', '640', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5812', '201211621208', '705', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5813', '201211621208', '745', '81', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5814', '201211621208', '743', '67', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5815', '201211621208', '799', '74', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5816', '201211621208', '720', '68', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5817', '201211621208', '733', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5818', '201211621208', '717', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5819', '201211621208', '735', '77', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5820', '201211621208', '802', '-1', '60', null, null, '2013-2014');
INSERT INTO `score` VALUES ('5821', '201211621208', '734', '95', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5822', '201211621208', '699', '74', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5823', '201211621208', '786', '68', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5824', '201211621208', '767', '60', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5825', '201211621208', '805', '98', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5826', '201211621208', '776', '83', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5827', '201211621208', '775', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5828', '201211621208', '794', '81', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5829', '201211621208', '795', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5830', '201211621208', '777', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5831', '201211621208', '774', '77', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5832', '201211621208', '771', '83', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5833', '201211621208', '765', '82', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5834', '201211621208', '763', '67', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5835', '201211621208', '824', '68', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5836', '201211621208', '823', '97', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5837', '201211621208', '822', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5838', '201211621208', '819', '54', '65', null, null, '2014-2015');
INSERT INTO `score` VALUES ('5839', '201211621208', '798', '74', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5840', '201211621208', '825', '88', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5841', '201211621208', '811', '78', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5842', '201211621208', '812', '75', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5843', '201211621208', '820', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5844', '201211621208', '821', '80', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5845', '201211621208', '815', '89', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5846', '201211621209', '625', '77', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5847', '201211621209', '634', '78', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5848', '201211621209', '637', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5849', '201211621209', '632', '80', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5850', '201211621209', '624', '73', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5851', '201211621209', '799', '76', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5852', '201211621209', '627', '87', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5853', '201211621209', '626', '74', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5854', '201211621209', '647', '79', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5855', '201211621209', '639', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5856', '201211621209', '690', '84', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5857', '201211621209', '805', '84', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5858', '201211621209', '646', '73', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5859', '201211621209', '681', '89', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5860', '201211621209', '651', '55', '72', null, null, '2012-2013');
INSERT INTO `score` VALUES ('5861', '201211621209', '663', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5862', '201211621209', '771', '91', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5863', '201211621209', '645', '70', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5864', '201211621209', '655', '78', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5865', '201211621209', '640', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5866', '201211621209', '778', '74', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5867', '201211621209', '745', '90', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5868', '201211621209', '696', '89', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5869', '201211621209', '732', '82', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5870', '201211621209', '743', '79', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5871', '201211621209', '720', '84', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5872', '201211621209', '733', '73', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5873', '201211621209', '717', '66', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5874', '201211621209', '803', '93', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5875', '201211621209', '735', '83', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5876', '201211621209', '734', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5877', '201211621209', '699', '77', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5878', '201211621209', '786', '83', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5879', '201211621209', '770', '93', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5880', '201211621209', '767', '62', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5881', '201211621209', '804', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5882', '201211621209', '776', '86', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5883', '201211621209', '775', '95', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5884', '201211621209', '794', '82', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5885', '201211621209', '795', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5886', '201211621209', '777', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5887', '201211621209', '774', '74', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5888', '201211621209', '764', '77', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5889', '201211621209', '763', '77', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5890', '201211621209', '824', '66', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5891', '201211621209', '823', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5892', '201211621209', '822', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5893', '201211621209', '819', '72', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5894', '201211621209', '825', '89', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5895', '201211621209', '811', '79', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5896', '201211621209', '812', '75', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5897', '201211621209', '820', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5898', '201211621209', '821', '74', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5899', '201211621209', '815', '93', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5900', '201211621210', '625', '77', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5901', '201211621210', '634', '73', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5902', '201211621210', '637', '84', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5903', '201211621210', '632', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5904', '201211621210', '624', '80', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5905', '201211621210', '788', '96', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5906', '201211621210', '627', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5907', '201211621210', '626', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5908', '201211621210', '725', '71', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5909', '201211621210', '647', '66', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5910', '201211621210', '639', '88', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5911', '201211621210', '806', '81', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5912', '201211621210', '690', '79', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5913', '201211621210', '646', '73', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5914', '201211621210', '704', '74', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5915', '201211621210', '651', '68', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5916', '201211621210', '663', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5917', '201211621210', '803', '79', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5918', '201211621210', '645', '70', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5919', '201211621210', '655', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5920', '201211621210', '640', '95', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5921', '201211621210', '745', '80', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5922', '201211621210', '757', '73', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5923', '201211621210', '780', '88', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5924', '201211621210', '743', '83', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5925', '201211621210', '731', '78', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5926', '201211621210', '720', '70', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5927', '201211621210', '733', '84', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5928', '201211621210', '717', '76', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5929', '201211621210', '735', '78', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5930', '201211621210', '734', '95', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5931', '201211621210', '699', '71', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5932', '201211621210', '786', '-1', '65', null, null, '2013-2014');
INSERT INTO `score` VALUES ('5933', '201211621210', '796', '86', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5934', '201211621210', '767', '-1', '64', null, null, '2013-2014');
INSERT INTO `score` VALUES ('5935', '201211621210', '776', '-1', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5936', '201211621210', '775', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5937', '201211621210', '794', '-1', '69', null, null, '2013-2014');
INSERT INTO `score` VALUES ('5938', '201211621210', '795', '65', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5939', '201211621210', '777', '-1', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5940', '201211621210', '774', '62', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5941', '201211621210', '810', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5942', '201211621210', '763', '-1', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5943', '201211621210', '824', '67', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5944', '201211621210', '823', '88', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5945', '201211621210', '822', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5946', '201211621210', '819', '82', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5947', '201211621210', '825', '90', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5948', '201211621210', '811', '67', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5949', '201211621210', '812', '65', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5950', '201211621210', '820', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5951', '201211621210', '821', '76', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5952', '201211621210', '815', '97', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5953', '201211621211', '625', '71', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5954', '201211621211', '634', '78', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5955', '201211621211', '637', '83', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5956', '201211621211', '632', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5957', '201211621211', '624', '61', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5958', '201211621211', '799', '94', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5959', '201211621211', '627', '83', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5960', '201211621211', '626', '66', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5961', '201211621211', '647', '71', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5962', '201211621211', '639', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5963', '201211621211', '690', '86', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5964', '201211621211', '646', '78', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5965', '201211621211', '698', '89', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5966', '201211621211', '651', '54', '60', null, null, '2012-2013');
INSERT INTO `score` VALUES ('5967', '201211621211', '663', '88', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5968', '201211621211', '784', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5969', '201211621211', '645', '60', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5970', '201211621211', '655', '53', '60', null, null, '2012-2013');
INSERT INTO `score` VALUES ('5971', '201211621211', '640', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('5972', '201211621211', '804', '81', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5973', '201211621211', '745', '82', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5974', '201211621211', '772', '84', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5975', '201211621211', '789', '76', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5976', '201211621211', '743', '61', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5977', '201211621211', '720', '77', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5978', '201211621211', '733', '66', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5979', '201211621211', '717', '45', '62', null, null, '2013-2014');
INSERT INTO `score` VALUES ('5980', '201211621211', '803', '82', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5981', '201211621211', '735', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5982', '201211621211', '734', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5983', '201211621211', '699', '78', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5984', '201211621211', '786', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5985', '201211621211', '806', '89', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5986', '201211621211', '767', '64', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5987', '201211621211', '762', '80', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5988', '201211621211', '776', '86', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5989', '201211621211', '775', '95', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5990', '201211621211', '794', '79', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5991', '201211621211', '795', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5992', '201211621211', '777', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5993', '201211621211', '773', '81', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5994', '201211621211', '774', '70', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5995', '201211621211', '763', '73', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('5996', '201211621211', '824', '68', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5997', '201211621211', '823', '97', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5998', '201211621211', '822', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('5999', '201211621211', '819', '72', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6000', '201211621211', '825', '89', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6001', '201211621211', '811', '87', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6002', '201211621211', '812', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6003', '201211621211', '820', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6004', '201211621211', '821', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6005', '201211621211', '815', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6006', '201211621212', '625', '76', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6007', '201211621212', '634', '84', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6008', '201211621212', '637', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6009', '201211621212', '632', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6010', '201211621212', '624', '91', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6011', '201211621212', '799', '98', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6012', '201211621212', '627', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6013', '201211621212', '626', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6014', '201211621212', '639', '87', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6015', '201211621212', '804', '68', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6016', '201211621212', '690', '80', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6017', '201211621212', '780', '74', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6018', '201211621212', '803', '89', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6019', '201211621212', '645', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6020', '201211621212', '640', '95', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6021', '201211621212', '808', '93', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6022', '201211621212', '647', '78', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6023', '201211621212', '805', '99', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6024', '201211621212', '646', '74', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6025', '201211621212', '651', '78', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6026', '201211621212', '663', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6027', '201211621212', '655', '89', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6028', '201211621212', '798', '86', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6029', '201211621212', '745', '83', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6030', '201211621212', '807', '78', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6031', '201211621212', '743', '76', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6032', '201211621212', '720', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6033', '201211621212', '733', '92', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6034', '201211621212', '717', '94', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6035', '201211621212', '735', '95', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6036', '201211621212', '734', '95', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6037', '201211621212', '699', '79', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6038', '201211621212', '786', '80', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6039', '201211621212', '767', '91', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6040', '201211621212', '776', '91', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6041', '201211621212', '775', '95', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6042', '201211621212', '794', '91', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6043', '201211621212', '795', '95', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6044', '201211621212', '777', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6045', '201211621212', '789', '88', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6046', '201211621212', '773', '80', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6047', '201211621212', '774', '95', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6048', '201211621212', '771', '86', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6049', '201211621212', '763', '78', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6050', '201211621212', '824', '84', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6051', '201211621212', '823', '99', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6052', '201211621212', '822', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6053', '201211621212', '819', '96', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6054', '201211621212', '825', '89', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6055', '201211621212', '811', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6056', '201211621212', '812', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6057', '201211621212', '820', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6058', '201211621212', '821', '97', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6059', '201211621212', '815', '98', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6060', '201211621213', '625', '83', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6061', '201211621213', '634', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6062', '201211621213', '637', '83', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6063', '201211621213', '632', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6064', '201211621213', '624', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6065', '201211621213', '789', '76', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6066', '201211621213', '627', '73', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6067', '201211621213', '626', '81', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6068', '201211621213', '647', '86', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6069', '201211621213', '639', '87', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6070', '201211621213', '690', '77', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6071', '201211621213', '721', '74', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6072', '201211621213', '646', '65', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6073', '201211621213', '807', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6074', '201211621213', '731', '81', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6075', '201211621213', '651', '50', '69', null, null, '2012-2013');
INSERT INTO `score` VALUES ('6076', '201211621213', '663', '86', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6077', '201211621213', '645', '80', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6078', '201211621213', '655', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6079', '201211621213', '640', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6080', '201211621213', '745', '86', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6081', '201211621213', '779', '68', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6082', '201211621213', '743', '63', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6083', '201211621213', '720', '71', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6084', '201211621213', '733', '77', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6085', '201211621213', '717', '77', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6086', '201211621213', '735', '79', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6087', '201211621213', '746', '76', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6088', '201211621213', '802', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6089', '201211621213', '734', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6090', '201211621213', '699', '76', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6091', '201211621213', '786', '80', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6092', '201211621213', '767', '62', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6093', '201211621213', '776', '77', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6094', '201211621213', '775', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6095', '201211621213', '794', '79', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6096', '201211621213', '795', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6097', '201211621213', '777', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6098', '201211621213', '769', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6099', '201211621213', '774', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6100', '201211621213', '784', '83', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6101', '201211621213', '763', '73', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6102', '201211621213', '824', '68', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6103', '201211621213', '823', '97', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6104', '201211621213', '822', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6105', '201211621213', '819', '49', '73', null, null, '2014-2015');
INSERT INTO `score` VALUES ('6106', '201211621213', '825', '89', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6107', '201211621213', '811', '78', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6108', '201211621213', '818', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6109', '201211621213', '812', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6110', '201211621213', '820', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6111', '201211621213', '821', '72', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6112', '201211621213', '815', '83', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6113', '201211621214', '625', '60', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6114', '201211621214', '634', '78', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6115', '201211621214', '637', '84', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6116', '201211621214', '632', '88', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6117', '201211621214', '624', '73', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6118', '201211621214', '789', '84', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6119', '201211621214', '627', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6120', '201211621214', '626', '70', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6121', '201211621214', '647', '55', '52', '0', null, '2012-2013');
INSERT INTO `score` VALUES ('6122', '201211621214', '639', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6123', '201211621214', '690', '68', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6124', '201211621214', '676', '93', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6125', '201211621214', '646', '73', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6126', '201211621214', '651', '69', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6127', '201211621214', '663', '86', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6128', '201211621214', '712', '83', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6129', '201211621214', '764', '79', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6130', '201211621214', '645', '44', '24', '36', null, '2012-2013');
INSERT INTO `score` VALUES ('6131', '201211621214', '655', '65', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6132', '201211621214', '640', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6133', '201211621214', '740', '74', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6134', '201211621214', '705', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6135', '201211621214', '745', '80', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6136', '201211621214', '743', '81', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6137', '201211621214', '731', '89', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6138', '201211621214', '788', '84', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6139', '201211621214', '720', '65', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6140', '201211621214', '733', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6141', '201211621214', '717', '67', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6142', '201211621214', '735', '79', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6143', '201211621214', '703', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6144', '201211621214', '734', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6145', '201211621214', '699', '48', '5', '0', null, '2013-2014');
INSERT INTO `score` VALUES ('6146', '201211621214', '786', '79', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6147', '201211621214', '806', '82', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6148', '201211621214', '767', '77', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6149', '201211621214', '776', '74', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6150', '201211621214', '775', '65', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6151', '201211621214', '794', '78', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6152', '201211621214', '795', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6153', '201211621214', '777', '65', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6154', '201211621214', '774', '51', '63', null, null, '2013-2014');
INSERT INTO `score` VALUES ('6155', '201211621214', '771', '81', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6156', '201211621214', '763', '73', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6157', '201211621214', '824', '65', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6158', '201211621214', '823', '63', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6159', '201211621214', '822', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6160', '201211621214', '819', '66', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6161', '201211621214', '825', '83', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6162', '201211621214', '811', '68', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6163', '201211621214', '812', '75', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6164', '201211621214', '820', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6165', '201211621214', '803', '68', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6166', '201211621214', '821', '77', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6167', '201211621214', '815', '87', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6168', '201211621215', '625', '84', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6169', '201211621215', '634', '78', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6170', '201211621215', '637', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6171', '201211621215', '632', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6172', '201211621215', '624', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6173', '201211621215', '627', '70', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6174', '201211621215', '784', '92', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6175', '201211621215', '626', '94', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6176', '201211621215', '647', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6177', '201211621215', '639', '91', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6178', '201211621215', '804', '71', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6179', '201211621215', '690', '83', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6180', '201211621215', '646', '77', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6181', '201211621215', '789', '88', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6182', '201211621215', '651', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6183', '201211621215', '663', '87', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6184', '201211621215', '760', '80', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6185', '201211621215', '645', '67', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6186', '201211621215', '655', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6187', '201211621215', '640', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6188', '201211621215', '745', '81', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6189', '201211621215', '785', '66', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6190', '201211621215', '743', '79', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6191', '201211621215', '788', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6192', '201211621215', '720', '77', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6193', '201211621215', '733', '79', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6194', '201211621215', '717', '84', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6195', '201211621215', '735', '90', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6196', '201211621215', '712', '78', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6197', '201211621215', '734', '95', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6198', '201211621215', '699', '70', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6199', '201211621215', '808', '81', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6200', '201211621215', '786', '76', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6201', '201211621215', '767', '82', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6202', '201211621215', '776', '82', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6203', '201211621215', '775', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6204', '201211621215', '794', '83', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6205', '201211621215', '795', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6206', '201211621215', '777', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6207', '201211621215', '799', '89', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6208', '201211621215', '774', '70', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6209', '201211621215', '763', '64', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6210', '201211621215', '824', '70', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6211', '201211621215', '823', '97', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6212', '201211621215', '822', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6213', '201211621215', '819', '74', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6214', '201211621215', '696', '66', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6215', '201211621215', '825', '88', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6216', '201211621215', '813', '79', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6217', '201211621215', '811', '88', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6218', '201211621215', '812', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6219', '201211621215', '820', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6220', '201211621215', '821', '87', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6221', '201211621215', '815', '99', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6222', '201211621216', '625', '80', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6223', '201211621216', '634', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6224', '201211621216', '637', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6225', '201211621216', '632', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6226', '201211621216', '624', '60', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6227', '201211621216', '789', '88', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6228', '201211621216', '627', '62', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6229', '201211621216', '626', '73', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6230', '201211621216', '647', '76', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6231', '201211621216', '639', '78', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6232', '201211621216', '690', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6233', '201211621216', '646', '73', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6234', '201211621216', '681', '83', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6235', '201211621216', '799', '78', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6236', '201211621216', '651', '65', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6237', '201211621216', '663', '86', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6238', '201211621216', '803', '73', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6239', '201211621216', '645', '42', '34', '9', null, '2012-2013');
INSERT INTO `score` VALUES ('6240', '201211621216', '655', '37', '78', null, null, '2012-2013');
INSERT INTO `score` VALUES ('6241', '201211621216', '640', '65', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6242', '201211621216', '745', '80', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6243', '201211621216', '721', '92', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6244', '201211621216', '728', '80', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6245', '201211621216', '743', '69', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6246', '201211621216', '720', '73', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6247', '201211621216', '733', '56', '78', null, null, '2013-2014');
INSERT INTO `score` VALUES ('6248', '201211621216', '717', '62', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6249', '201211621216', '735', '77', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6250', '201211621216', '764', '81', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6251', '201211621216', '734', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6252', '201211621216', '699', '74', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6253', '201211621216', '786', '68', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6254', '201211621216', '767', '61', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6255', '201211621216', '776', '71', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6256', '201211621216', '775', '65', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6257', '201211621216', '809', '78', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6258', '201211621216', '794', '54', '61', null, null, '2013-2014');
INSERT INTO `score` VALUES ('6259', '201211621216', '795', '65', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6260', '201211621216', '777', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6261', '201211621216', '807', '77', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6262', '201211621216', '774', '67', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6263', '201211621216', '760', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6264', '201211621216', '763', '78', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6265', '201211621216', '824', '67', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6266', '201211621216', '823', '94', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6267', '201211621216', '822', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6268', '201211621216', '819', '43', '66', null, null, '2014-2015');
INSERT INTO `score` VALUES ('6269', '201211621216', '825', '90', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6270', '201211621216', '811', '62', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6271', '201211621216', '812', '65', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6272', '201211621216', '820', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6273', '201211621216', '821', '88', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6274', '201211621216', '815', '87', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6275', '201211621217', '625', '67', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6276', '201211621217', '634', '79', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6277', '201211621217', '637', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6278', '201211621217', '632', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6279', '201211621217', '665', '86', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6280', '201211621217', '624', '73', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6281', '201211621217', '627', '84', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6282', '201211621217', '626', '69', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6283', '201211621217', '693', '86', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6284', '201211621217', '647', '69', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6285', '201211621217', '639', '84', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6286', '201211621217', '690', '87', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6287', '201211621217', '646', '71', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6288', '201211621217', '800', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6289', '201211621217', '789', '88', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6290', '201211621217', '651', '61', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6291', '201211621217', '663', '86', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6292', '201211621217', '689', '83', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6293', '201211621217', '645', '52', '30', '72', null, '2012-2013');
INSERT INTO `score` VALUES ('6294', '201211621217', '655', '60', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6295', '201211621217', '640', '95', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6296', '201211621217', '745', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6297', '201211621217', '743', '68', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6298', '201211621217', '720', '77', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6299', '201211621217', '733', '68', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6300', '201211621217', '717', '68', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6301', '201211621217', '735', '65', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6302', '201211621217', '810', '69', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6303', '201211621217', '802', '65', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6304', '201211621217', '737', '87', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6305', '201211621217', '734', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6306', '201211621217', '699', '62', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6307', '201211621217', '761', '70', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6308', '201211621217', '786', '72', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6309', '201211621217', '767', '49', '61', null, null, '2013-2014');
INSERT INTO `score` VALUES ('6310', '201211621217', '776', '76', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6311', '201211621217', '775', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6312', '201211621217', '794', '71', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6313', '201211621217', '795', '95', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6314', '201211621217', '777', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6315', '201211621217', '788', '81', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6316', '201211621217', '774', '66', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6317', '201211621217', '763', '65', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6318', '201211621217', '824', '64', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6319', '201211621217', '823', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6320', '201211621217', '822', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6321', '201211621217', '819', '53', '43', null, null, '2014-2015');
INSERT INTO `score` VALUES ('6322', '201211621217', '816', '84', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6323', '201211621217', '825', '86', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6324', '201211621217', '811', '78', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6325', '201211621217', '812', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6326', '201211621217', '820', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6327', '201211621217', '821', '69', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6328', '201211621217', '815', '81', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6329', '201211621218', '625', '78', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6330', '201211621218', '634', '77', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6331', '201211621218', '637', '83', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6332', '201211621218', '632', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6333', '201211621218', '624', '64', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6334', '201211621218', '638', '98', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6335', '201211621218', '627', '74', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6336', '201211621218', '626', '60', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6337', '201211621218', '647', '66', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6338', '201211621218', '639', '73', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6339', '201211621218', '690', '76', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6340', '201211621218', '646', '61', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6341', '201211621218', '704', '88', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6342', '201211621218', '807', '89', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6343', '201211621218', '729', '95', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6344', '201211621218', '651', '55', '62', null, null, '2012-2013');
INSERT INTO `score` VALUES ('6345', '201211621218', '663', '77', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6346', '201211621218', '645', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6347', '201211621218', '655', '68', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6348', '201211621218', '640', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6349', '201211621218', '762', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6350', '201211621218', '805', '73', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6351', '201211621218', '745', '83', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6352', '201211621218', '758', '98', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6353', '201211621218', '743', '90', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6354', '201211621218', '720', '82', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6355', '201211621218', '733', '72', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6356', '201211621218', '717', '95', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6357', '201211621218', '735', '86', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6358', '201211621218', '734', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6359', '201211621218', '699', '79', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6360', '201211621218', '786', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6361', '201211621218', '767', '68', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6362', '201211621218', '776', '72', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6363', '201211621218', '775', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6364', '201211621218', '794', '74', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6365', '201211621218', '795', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6366', '201211621218', '777', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6367', '201211621218', '789', '79', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6368', '201211621218', '768', '90', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6369', '201211621218', '774', '73', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6370', '201211621218', '763', '70', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6371', '201211621218', '824', '65', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6372', '201211621218', '823', '88', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6373', '201211621218', '822', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6374', '201211621218', '819', '73', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6375', '201211621218', '826', '84', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6376', '201211621218', '825', '86', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6377', '201211621218', '811', '77', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6378', '201211621218', '812', '75', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6379', '201211621218', '820', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6380', '201211621218', '817', '100', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6381', '201211621218', '821', '56', '68', null, null, '2014-2015');
INSERT INTO `score` VALUES ('6382', '201211621218', '815', '87', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6383', '201211621219', '625', '68', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6384', '201211621219', '796', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6385', '201211621219', '634', '71', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6386', '201211621219', '637', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6387', '201211621219', '632', '88', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6388', '201211621219', '624', '71', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6389', '201211621219', '627', '68', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6390', '201211621219', '626', '81', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6391', '201211621219', '647', '67', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6392', '201211621219', '639', '83', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6393', '201211621219', '690', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6394', '201211621219', '646', '74', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6395', '201211621219', '807', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6396', '201211621219', '731', '80', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6397', '201211621219', '651', '73', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6398', '201211621219', '663', '86', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6399', '201211621219', '722', '78', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6400', '201211621219', '645', '79', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6401', '201211621219', '655', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6402', '201211621219', '640', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6403', '201211621219', '727', '80', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6404', '201211621219', '745', '90', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6405', '201211621219', '779', '82', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6406', '201211621219', '698', '73', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6407', '201211621219', '743', '70', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6408', '201211621219', '720', '74', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6409', '201211621219', '733', '71', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6410', '201211621219', '717', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6411', '201211621219', '748', '90', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6412', '201211621219', '735', '80', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6413', '201211621219', '734', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6414', '201211621219', '699', '73', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6415', '201211621219', '786', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6416', '201211621219', '806', '88', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6417', '201211621219', '767', '74', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6418', '201211621219', '781', '68', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6419', '201211621219', '776', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6420', '201211621219', '775', '95', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6421', '201211621219', '794', '79', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6422', '201211621219', '795', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6423', '201211621219', '777', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6424', '201211621219', '774', '80', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6425', '201211621219', '763', '60', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6426', '201211621219', '824', '66', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6427', '201211621219', '823', '99', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6428', '201211621219', '822', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6429', '201211621219', '819', '84', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6430', '201211621219', '825', '90', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6431', '201211621219', '811', '80', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6432', '201211621219', '812', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6433', '201211621219', '820', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6434', '201211621219', '821', '83', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6435', '201211621219', '815', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6436', '201211621220', '625', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6437', '201211621220', '634', '81', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6438', '201211621220', '637', '84', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6439', '201211621220', '632', '88', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6440', '201211621220', '624', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6441', '201211621220', '788', '97', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6442', '201211621220', '627', '87', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6443', '201211621220', '626', '86', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6444', '201211621220', '796', '92', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6445', '201211621220', '647', '77', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6446', '201211621220', '639', '93', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6447', '201211621220', '690', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6448', '201211621220', '721', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6449', '201211621220', '646', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6450', '201211621220', '711', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6451', '201211621220', '651', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6452', '201211621220', '663', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6453', '201211621220', '645', '68', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6454', '201211621220', '674', '80', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6455', '201211621220', '655', '92', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6456', '201211621220', '640', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6457', '201211621220', '745', '78', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6458', '201211621220', '701', '87', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6459', '201211621220', '709', '87', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6460', '201211621220', '807', '81', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6461', '201211621220', '743', '90', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6462', '201211621220', '720', '83', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6463', '201211621220', '733', '86', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6464', '201211621220', '717', '87', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6465', '201211621220', '735', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6466', '201211621220', '734', '95', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6467', '201211621220', '699', '76', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6468', '201211621220', '786', '69', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6469', '201211621220', '782', '99', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6470', '201211621220', '767', '90', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6471', '201211621220', '776', '91', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6472', '201211621220', '775', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6473', '201211621220', '794', '87', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6474', '201211621220', '779', '74', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6475', '201211621220', '795', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6476', '201211621220', '777', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6477', '201211621220', '773', '84', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6478', '201211621220', '774', '72', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6479', '201211621220', '763', '68', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6480', '201211621220', '824', '67', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6481', '201211621220', '823', '94', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6482', '201211621220', '822', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6483', '201211621220', '819', '74', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6484', '201211621220', '825', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6485', '201211621220', '811', '90', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6486', '201211621220', '812', '75', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6487', '201211621220', '820', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6488', '201211621220', '821', '83', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6489', '201211621220', '815', '90', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6490', '201211621221', '625', '78', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6491', '201211621221', '634', '76', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6492', '201211621221', '637', '83', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6493', '201211621221', '632', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6494', '201211621221', '624', '56', '66', null, null, '2012-2013');
INSERT INTO `score` VALUES ('6495', '201211621221', '789', '92', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6496', '201211621221', '627', '64', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6497', '201211621221', '626', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6498', '201211621221', '647', '69', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6499', '201211621221', '639', '77', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6500', '201211621221', '694', '91', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6501', '201211621221', '690', '76', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6502', '201211621221', '646', '76', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6503', '201211621221', '698', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6504', '201211621221', '651', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6505', '201211621221', '663', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6506', '201211621221', '645', '81', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6507', '201211621221', '655', '84', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6508', '201211621221', '640', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6509', '201211621221', '808', '80', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6510', '201211621221', '745', '91', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6511', '201211621221', '701', '62', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6512', '201211621221', '743', '62', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6513', '201211621221', '720', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6514', '201211621221', '733', '73', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6515', '201211621221', '717', '79', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6516', '201211621221', '803', '70', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6517', '201211621221', '735', '72', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6518', '201211621221', '734', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6519', '201211621221', '784', '86', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6520', '201211621221', '699', '79', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6521', '201211621221', '786', '68', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6522', '201211621221', '767', '77', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6523', '201211621221', '787', '78', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6524', '201211621221', '776', '49', '80', null, null, '2013-2014');
INSERT INTO `score` VALUES ('6525', '201211621221', '775', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6526', '201211621221', '794', '84', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6527', '201211621221', '795', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6528', '201211621221', '777', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6529', '201211621221', '788', '84', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6530', '201211621221', '774', '63', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6531', '201211621221', '761', '86', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6532', '201211621221', '763', '76', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6533', '201211621221', '824', '76', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6534', '201211621221', '823', '88', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6535', '201211621221', '822', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6536', '201211621221', '819', '84', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6537', '201211621221', '825', '84', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6538', '201211621221', '811', '82', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6539', '201211621221', '812', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6540', '201211621221', '820', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6541', '201211621221', '821', '77', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6542', '201211621221', '815', '82', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6543', '201211621222', '625', '76', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6544', '201211621222', '634', '78', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6545', '201211621222', '637', '83', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6546', '201211621222', '632', '84', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6547', '201211621222', '624', '73', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6548', '201211621222', '789', '86', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6549', '201211621222', '627', '68', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6550', '201211621222', '626', '81', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6551', '201211621222', '647', '73', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6552', '201211621222', '639', '72', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6553', '201211621222', '684', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6554', '201211621222', '690', '86', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6555', '201211621222', '805', '78', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6556', '201211621222', '646', '72', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6557', '201211621222', '698', '78', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6558', '201211621222', '651', '60', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6559', '201211621222', '663', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6560', '201211621222', '645', '67', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6561', '201211621222', '655', '80', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6562', '201211621222', '640', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6563', '201211621222', '727', '80', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6564', '201211621222', '778', '74', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6565', '201211621222', '718', '82', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6566', '201211621222', '745', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6567', '201211621222', '743', '87', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6568', '201211621222', '720', '82', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6569', '201211621222', '769', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6570', '201211621222', '733', '70', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6571', '201211621222', '717', '79', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6572', '201211621222', '735', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6573', '201211621222', '734', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6574', '201211621222', '699', '78', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6575', '201211621222', '786', '79', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6576', '201211621222', '806', '87', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6577', '201211621222', '767', '60', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6578', '201211621222', '776', '88', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6579', '201211621222', '775', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6580', '201211621222', '794', '68', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6581', '201211621222', '795', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6582', '201211621222', '777', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6583', '201211621222', '774', '65', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6584', '201211621222', '771', '77', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6585', '201211621222', '759', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6586', '201211621222', '763', '71', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6587', '201211621222', '824', '67', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6588', '201211621222', '823', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6589', '201211621222', '822', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6590', '201211621222', '819', '58', '73', null, null, '2014-2015');
INSERT INTO `score` VALUES ('6591', '201211621222', '825', '89', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6592', '201211621222', '814', '82', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6593', '201211621222', '811', '71', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6594', '201211621222', '812', '75', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6595', '201211621222', '820', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6596', '201211621222', '680', '83', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6597', '201211621222', '821', '82', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6598', '201211621222', '815', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6599', '201211621223', '625', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6600', '201211621223', '634', '78', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6601', '201211621223', '637', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6602', '201211621223', '632', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6603', '201211621223', '624', '68', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6604', '201211621223', '638', '98', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6605', '201211621223', '627', '69', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6606', '201211621223', '626', '73', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6607', '201211621223', '796', '92', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6608', '201211621223', '656', '79', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6609', '201211621223', '647', '71', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6610', '201211621223', '639', '67', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6611', '201211621223', '690', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6612', '201211621223', '646', '66', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6613', '201211621223', '651', '72', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6614', '201211621223', '680', '80', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6615', '201211621223', '663', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6616', '201211621223', '645', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6617', '201211621223', '655', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6618', '201211621223', '640', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6619', '201211621223', '756', '68', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6620', '201211621223', '694', '91', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6621', '201211621223', '745', '83', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6622', '201211621223', '708', '67', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6623', '201211621223', '743', '70', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6624', '201211621223', '720', '76', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6625', '201211621223', '733', '54', '61', null, null, '2013-2014');
INSERT INTO `score` VALUES ('6626', '201211621223', '717', '61', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6627', '201211621223', '735', '62', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6628', '201211621223', '734', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6629', '201211621223', '699', '66', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6630', '201211621223', '786', '73', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6631', '201211621223', '797', '84', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6632', '201211621223', '767', '64', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6633', '201211621223', '776', '53', '69', null, null, '2013-2014');
INSERT INTO `score` VALUES ('6634', '201211621223', '775', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6635', '201211621223', '794', '60', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6636', '201211621223', '795', '65', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6637', '201211621223', '777', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6638', '201211621223', '780', '86', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6639', '201211621223', '774', '60', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6640', '201211621223', '763', '56', '42', null, null, '2013-2014');
INSERT INTO `score` VALUES ('6641', '201211621223', '824', '65', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6642', '201211621223', '823', '66', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6643', '201211621223', '822', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6644', '201211621223', '819', '72', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6645', '201211621223', '825', '84', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6646', '201211621223', '811', '60', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6647', '201211621223', '812', '65', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6648', '201211621223', '820', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6649', '201211621223', '803', '90', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6650', '201211621223', '821', '84', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6651', '201211621223', '815', '81', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6652', '201211621224', '625', '87', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6653', '201211621224', '634', '81', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6654', '201211621224', '637', '86', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6655', '201211621224', '632', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6656', '201211621224', '624', '91', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6657', '201211621224', '627', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6658', '201211621224', '784', '88', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6659', '201211621224', '626', '94', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6660', '201211621224', '647', '88', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6661', '201211621224', '639', '96', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6662', '201211621224', '690', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6663', '201211621224', '646', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6664', '201211621224', '789', '88', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6665', '201211621224', '731', '80', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6666', '201211621224', '651', '89', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6667', '201211621224', '663', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6668', '201211621224', '760', '80', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6669', '201211621224', '645', '87', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6670', '201211621224', '655', '88', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6671', '201211621224', '640', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6672', '201211621224', '745', '86', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6673', '201211621224', '698', '78', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6674', '201211621224', '742', '87', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6675', '201211621224', '743', '83', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6676', '201211621224', '788', '76', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6677', '201211621224', '720', '88', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6678', '201211621224', '733', '96', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6679', '201211621224', '717', '99', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6680', '201211621224', '735', '86', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6681', '201211621224', '746', '86', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6682', '201211621224', '734', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6683', '201211621224', '699', '80', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6684', '201211621224', '786', '76', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6685', '201211621224', '767', '83', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6686', '201211621224', '776', '92', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6687', '201211621224', '775', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6688', '201211621224', '794', '87', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6689', '201211621224', '795', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6690', '201211621224', '777', '95', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6691', '201211621224', '799', '89', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6692', '201211621224', '766', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6693', '201211621224', '774', '90', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6694', '201211621224', '763', '83', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6695', '201211621224', '824', '77', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6696', '201211621224', '823', '83', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6697', '201211621224', '822', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6698', '201211621224', '819', '81', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6699', '201211621224', '825', '87', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6700', '201211621224', '811', '86', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6701', '201211621224', '812', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6702', '201211621224', '820', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6703', '201211621224', '821', '86', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6704', '201211621224', '815', '91', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6705', '201211621225', '625', '73', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6706', '201211621225', '634', '71', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6707', '201211621225', '637', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6708', '201211621225', '632', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6709', '201211621225', '624', '68', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6710', '201211621225', '627', '79', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6711', '201211621225', '784', '100', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6712', '201211621225', '626', '70', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6713', '201211621225', '647', '73', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6714', '201211621225', '639', '91', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6715', '201211621225', '690', '83', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6716', '201211621225', '646', '68', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6717', '201211621225', '692', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6718', '201211621225', '788', '94', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6719', '201211621225', '651', '66', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6720', '201211621225', '663', '83', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6721', '201211621225', '645', '77', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6722', '201211621225', '655', '72', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6723', '201211621225', '640', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6724', '201211621225', '805', '98', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6725', '201211621225', '745', '86', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6726', '201211621225', '743', '87', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6727', '201211621225', '720', '74', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6728', '201211621225', '733', '61', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6729', '201211621225', '729', '92', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6730', '201211621225', '706', '87', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6731', '201211621225', '717', '74', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6732', '201211621225', '735', '69', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6733', '201211621225', '736', '93', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6734', '201211621225', '734', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6735', '201211621225', '699', '70', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6736', '201211621225', '786', '76', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6737', '201211621225', '806', '88', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6738', '201211621225', '767', '60', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6739', '201211621225', '776', '86', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6740', '201211621225', '775', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6741', '201211621225', '794', '62', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6742', '201211621225', '795', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6743', '201211621225', '777', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6744', '201211621225', '774', '64', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6745', '201211621225', '802', '65', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6746', '201211621225', '763', '64', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6747', '201211621225', '824', '66', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6748', '201211621225', '823', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6749', '201211621225', '822', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6750', '201211621225', '819', '75', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6751', '201211621225', '827', '83', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6752', '201211621225', '825', '87', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6753', '201211621225', '811', '77', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6754', '201211621225', '812', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6755', '201211621225', '820', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6756', '201211621225', '729', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6757', '201211621225', '821', '74', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6758', '201211621225', '815', '86', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6759', '201211621226', '625', '69', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6760', '201211621226', '634', '79', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6761', '201211621226', '637', '83', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6762', '201211621226', '632', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6763', '201211621226', '624', '68', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6764', '201211621226', '638', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6765', '201211621226', '627', '78', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6766', '201211621226', '626', '62', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6767', '201211621226', '647', '63', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6768', '201211621226', '639', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6769', '201211621226', '690', '79', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6770', '201211621226', '646', '71', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6771', '201211621226', '789', '88', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6772', '201211621226', '651', '70', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6773', '201211621226', '663', '80', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6774', '201211621226', '645', '60', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6775', '201211621226', '655', '48', '60', null, null, '2012-2013');
INSERT INTO `score` VALUES ('6776', '201211621226', '640', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6777', '201211621226', '745', '83', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6778', '201211621226', '698', '79', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6779', '201211621226', '807', '84', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6780', '201211621226', '743', '65', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6781', '201211621226', '720', '67', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6782', '201211621226', '754', '76', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6783', '201211621226', '733', '61', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6784', '201211621226', '717', '43', '67', null, null, '2013-2014');
INSERT INTO `score` VALUES ('6785', '201211621226', '735', '72', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6786', '201211621226', '734', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6787', '201211621226', '699', '61', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6788', '201211621226', '791', '87', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6789', '201211621226', '786', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6790', '201211621226', '767', '51', '66', null, null, '2013-2014');
INSERT INTO `score` VALUES ('6791', '201211621226', '776', '77', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6792', '201211621226', '775', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6793', '201211621226', '794', '82', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6794', '201211621226', '795', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6795', '201211621226', '777', '95', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6796', '201211621226', '774', '60', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6797', '201211621226', '763', '66', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6798', '201211621226', '824', '72', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6799', '201211621226', '823', '88', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6800', '201211621226', '822', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6801', '201211621226', '819', '84', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6802', '201211621226', '798', '70', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6803', '201211621226', '825', '86', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6804', '201211621226', '813', '80', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6805', '201211621226', '811', '87', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6806', '201211621226', '812', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6807', '201211621226', '820', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6808', '201211621226', '821', '86', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6809', '201211621226', '815', '96', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6810', '201211621227', '791', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6811', '201211621227', '625', '73', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6812', '201211621227', '634', '79', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6813', '201211621227', '637', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6814', '201211621227', '632', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6815', '201211621227', '624', '54', '60', null, null, '2012-2013');
INSERT INTO `score` VALUES ('6816', '201211621227', '627', '80', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6817', '201211621227', '626', '52', '66', null, null, '2012-2013');
INSERT INTO `score` VALUES ('6818', '201211621227', '647', '71', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6819', '201211621227', '639', '78', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6820', '201211621227', '804', '74', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6821', '201211621227', '690', '86', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6822', '201211621227', '772', '88', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6823', '201211621227', '646', '76', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6824', '201211621227', '698', '91', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6825', '201211621227', '789', '84', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6826', '201211621227', '769', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6827', '201211621227', '651', '60', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6828', '201211621227', '663', '93', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6829', '201211621227', '645', '74', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6830', '201211621227', '655', '43', '71', null, null, '2012-2013');
INSERT INTO `score` VALUES ('6831', '201211621227', '640', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6832', '201211621227', '805', '79', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6833', '201211621227', '798', '84', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6834', '201211621227', '745', '84', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6835', '201211621227', '743', '63', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6836', '201211621227', '720', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6837', '201211621227', '733', '72', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6838', '201211621227', '717', '67', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6839', '201211621227', '803', '84', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6840', '201211621227', '735', '77', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6841', '201211621227', '734', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6842', '201211621227', '699', '68', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6843', '201211621227', '786', '78', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6844', '201211621227', '767', '63', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6845', '201211621227', '781', '88', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6846', '201211621227', '776', '72', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6847', '201211621227', '775', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6848', '201211621227', '794', '71', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6849', '201211621227', '779', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6850', '201211621227', '795', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6851', '201211621227', '777', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6852', '201211621227', '774', '70', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6853', '201211621227', '763', '65', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6854', '201211621227', '824', '68', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6855', '201211621227', '770', '90', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6856', '201211621227', '823', '91', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6857', '201211621227', '822', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6858', '201211621227', '819', '64', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6859', '201211621227', '825', '88', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6860', '201211621227', '758', '98', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6861', '201211621227', '811', '73', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6862', '201211621227', '812', '75', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6863', '201211621227', '820', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6864', '201211621227', '821', '74', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6865', '201211621227', '815', '92', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6866', '201211621228', '625', '86', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6867', '201211621228', '634', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6868', '201211621228', '637', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6869', '201211621228', '632', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6870', '201211621228', '624', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6871', '201211621228', '799', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6872', '201211621228', '627', '69', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6873', '201211621228', '626', '76', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6874', '201211621228', '647', '79', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6875', '201211621228', '639', '84', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6876', '201211621228', '690', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6877', '201211621228', '646', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6878', '201211621228', '698', '80', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6879', '201211621228', '757', '72', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6880', '201211621228', '651', '71', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6881', '201211621228', '663', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6882', '201211621228', '784', '84', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6883', '201211621228', '645', '64', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6884', '201211621228', '655', '60', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6885', '201211621228', '640', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6886', '201211621228', '804', '72', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6887', '201211621228', '798', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6888', '201211621228', '745', '88', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6889', '201211621228', '789', '77', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6890', '201211621228', '743', '77', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6891', '201211621228', '720', '79', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6892', '201211621228', '733', '78', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6893', '201211621228', '717', '71', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6894', '201211621228', '735', '70', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6895', '201211621228', '734', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6896', '201211621228', '699', '80', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6897', '201211621228', '786', '82', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6898', '201211621228', '806', '94', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6899', '201211621228', '767', '54', '61', null, null, '2013-2014');
INSERT INTO `score` VALUES ('6900', '201211621228', '762', '78', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6901', '201211621228', '776', '70', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6902', '201211621228', '775', '95', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6903', '201211621228', '794', '86', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6904', '201211621228', '795', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6905', '201211621228', '777', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6906', '201211621228', '774', '76', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6907', '201211621228', '763', '82', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6908', '201211621228', '824', '73', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6909', '201211621228', '823', '97', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6910', '201211621228', '822', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6911', '201211621228', '819', '51', '66', null, null, '2014-2015');
INSERT INTO `score` VALUES ('6912', '201211621228', '825', '89', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6913', '201211621228', '811', '88', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6914', '201211621228', '812', '75', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6915', '201211621228', '731', '83', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6916', '201211621228', '820', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6917', '201211621228', '821', '88', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6918', '201211621228', '815', '93', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6919', '201211621229', '625', '81', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6920', '201211621229', '634', '73', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6921', '201211621229', '637', '84', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6922', '201211621229', '632', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6923', '201211621229', '624', '88', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6924', '201211621229', '789', '81', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6925', '201211621229', '627', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6926', '201211621229', '626', '81', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6927', '201211621229', '647', '74', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6928', '201211621229', '639', '86', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6929', '201211621229', '762', '76', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6930', '201211621229', '690', '81', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6931', '201211621229', '665', '91', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6932', '201211621229', '646', '68', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6933', '201211621229', '651', '60', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6934', '201211621229', '663', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6935', '201211621229', '802', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6936', '201211621229', '645', '64', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6937', '201211621229', '655', '88', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6938', '201211621229', '640', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6939', '201211621229', '730', '74', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6940', '201211621229', '745', '83', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6941', '201211621229', '708', '80', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6942', '201211621229', '698', '76', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6943', '201211621229', '743', '70', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6944', '201211621229', '799', '71', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6945', '201211621229', '720', '80', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6946', '201211621229', '733', '82', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6947', '201211621229', '717', '76', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6948', '201211621229', '735', '77', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6949', '201211621229', '734', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6950', '201211621229', '699', '71', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6951', '201211621229', '786', '73', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6952', '201211621229', '767', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6953', '201211621229', '798', '73', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6954', '201211621229', '776', '80', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6955', '201211621229', '775', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6956', '201211621229', '794', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6957', '201211621229', '779', '72', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6958', '201211621229', '795', '95', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6959', '201211621229', '777', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6960', '201211621229', '774', '70', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6961', '201211621229', '810', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6962', '201211621229', '763', '66', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6963', '201211621229', '824', '67', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6964', '201211621229', '823', '91', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6965', '201211621229', '822', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6966', '201211621229', '819', '84', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6967', '201211621229', '825', '86', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6968', '201211621229', '811', '84', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6969', '201211621229', '812', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6970', '201211621229', '820', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6971', '201211621229', '821', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6972', '201211621229', '815', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('6973', '201211621230', '625', '78', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6974', '201211621230', '634', '73', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6975', '201211621230', '637', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6976', '201211621230', '632', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6977', '201211621230', '624', '77', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6978', '201211621230', '789', '76', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6979', '201211621230', '627', '84', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6980', '201211621230', '626', '77', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6981', '201211621230', '647', '67', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6982', '201211621230', '639', '83', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6983', '201211621230', '806', '91', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6984', '201211621230', '690', '88', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6985', '201211621230', '646', '74', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6986', '201211621230', '731', '81', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6987', '201211621230', '651', '76', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6988', '201211621230', '663', '86', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6989', '201211621230', '722', '79', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6990', '201211621230', '645', '71', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6991', '201211621230', '655', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6992', '201211621230', '640', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('6993', '201211621230', '745', '88', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6994', '201211621230', '779', '87', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6995', '201211621230', '711', '89', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6996', '201211621230', '704', '86', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6997', '201211621230', '743', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6998', '201211621230', '720', '71', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('6999', '201211621230', '733', '78', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7000', '201211621230', '729', '93', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7001', '201211621230', '717', '73', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7002', '201211621230', '735', '86', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7003', '201211621230', '734', '95', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7004', '201211621230', '699', '67', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7005', '201211621230', '786', '73', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7006', '201211621230', '767', '68', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7007', '201211621230', '781', '72', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7008', '201211621230', '776', '88', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7009', '201211621230', '775', '95', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7010', '201211621230', '794', '79', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7011', '201211621230', '795', '95', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7012', '201211621230', '777', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7013', '201211621230', '774', '88', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7014', '201211621230', '763', '67', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7015', '201211621230', '824', '78', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7016', '201211621230', '823', '99', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7017', '201211621230', '822', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7018', '201211621230', '819', '93', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7019', '201211621230', '825', '90', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7020', '201211621230', '790', '81', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7021', '201211621230', '811', '90', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7022', '201211621230', '812', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7023', '201211621230', '820', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7024', '201211621230', '821', '83', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7025', '201211621230', '815', '93', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7026', '201211621231', '625', '76', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7027', '201211621231', '634', '77', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7028', '201211621231', '637', '82', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7029', '201211621231', '632', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7030', '201211621231', '624', '71', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7031', '201211621231', '789', '83', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7032', '201211621231', '627', '84', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7033', '201211621231', '626', '22', '65', null, null, '2012-2013');
INSERT INTO `score` VALUES ('7034', '201211621231', '647', '80', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7035', '201211621231', '639', '76', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7036', '201211621231', '804', '76', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7037', '201211621231', '690', '84', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7038', '201211621231', '721', '71', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7039', '201211621231', '646', '73', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7040', '201211621231', '799', '79', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7041', '201211621231', '651', '70', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7042', '201211621231', '663', '87', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7043', '201211621231', '645', '69', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7044', '201211621231', '655', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7045', '201211621231', '640', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7046', '201211621231', '725', '70', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7047', '201211621231', '745', '82', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7048', '201211621231', '700', '65', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7049', '201211621231', '780', '84', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7050', '201211621231', '743', '47', '-1', '78', null, '2013-2014');
INSERT INTO `score` VALUES ('7051', '201211621231', '720', '71', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7052', '201211621231', '769', '65', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7053', '201211621231', '733', '76', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7054', '201211621231', '717', '46', '62', null, null, '2013-2014');
INSERT INTO `score` VALUES ('7055', '201211621231', '735', '61', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7056', '201211621231', '802', '65', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7057', '201211621231', '734', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7058', '201211621231', '699', '-1', '61', null, null, '2013-2014');
INSERT INTO `score` VALUES ('7059', '201211621231', '786', '62', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7060', '201211621231', '767', '52', '0', '47', null, '2013-2014');
INSERT INTO `score` VALUES ('7061', '201211621231', '776', '48', '0', null, null, '2013-2014');
INSERT INTO `score` VALUES ('7062', '201211621231', '775', '-1', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7063', '201211621231', '794', '65', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7064', '201211621231', '795', '-1', '75', null, null, '2013-2014');
INSERT INTO `score` VALUES ('7065', '201211621231', '777', '-1', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7066', '201211621231', '800', '70', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7067', '201211621231', '788', '75', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7068', '201211621231', '774', '38', '0', null, null, '2013-2014');
INSERT INTO `score` VALUES ('7069', '201211621231', '803', '68', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7070', '201211621231', '763', '67', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7071', '201211621231', '824', '66', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7072', '201211621231', '823', '88', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7073', '201211621231', '822', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7074', '201211621231', '819', '71', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7075', '201211621231', '825', '87', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7076', '201211621231', '811', '66', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7077', '201211621231', '812', '65', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7078', '201211621231', '820', '85', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7079', '201211621231', '821', '74', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7080', '201211621231', '815', '89', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7081', '201211621233', '625', '84', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7082', '201211621233', '634', '83', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7083', '201211621233', '637', '84', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7084', '201211621233', '632', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7085', '201211621233', '624', '77', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7086', '201211621233', '789', '90', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7087', '201211621233', '627', '77', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7088', '201211621233', '626', '81', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7089', '201211621233', '639', '88', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7090', '201211621233', '690', '89', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7091', '201211621233', '676', '88', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7092', '201211621233', '700', '75', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7093', '201211621233', '807', '83', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7094', '201211621233', '645', '83', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7095', '201211621233', '640', '95', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7096', '201211621233', '647', '78', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7097', '201211621233', '721', '80', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7098', '201211621233', '646', '80', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7099', '201211621233', '651', '85', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7100', '201211621233', '663', '87', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7101', '201211621233', '655', '88', null, null, null, '2012-2013');
INSERT INTO `score` VALUES ('7102', '201211621233', '726', '87', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7103', '201211621233', '743', '89', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7104', '201211621233', '720', '79', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7105', '201211621233', '769', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7106', '201211621233', '733', '81', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7107', '201211621233', '717', '94', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7108', '201211621233', '735', '88', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7109', '201211621233', '802', '65', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7110', '201211621233', '734', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7111', '201211621233', '784', '79', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7112', '201211621233', '699', '79', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7113', '201211621233', '786', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7114', '201211621233', '778', '79', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7115', '201211621233', '767', '85', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7116', '201211621233', '776', '90', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7117', '201211621233', '775', '95', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7118', '201211621233', '794', '91', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7119', '201211621233', '795', '95', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7120', '201211621233', '777', '95', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7121', '201211621233', '774', '73', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7122', '201211621233', '783', '82', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7123', '201211621233', '763', '77', null, null, null, '2013-2014');
INSERT INTO `score` VALUES ('7124', '201211621233', '824', '69', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7125', '201211621233', '823', '99', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7126', '201211621233', '822', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7127', '201211621233', '819', '87', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7128', '201211621233', '825', '100', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7129', '201211621233', '811', '90', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7130', '201211621233', '812', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7131', '201211621233', '820', '95', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7132', '201211621233', '821', '94', null, null, null, '2014-2015');
INSERT INTO `score` VALUES ('7133', '201211621233', '815', '93', null, null, null, '2014-2015');

-- ----------------------------
-- Table structure for scoreresult
-- ----------------------------
DROP TABLE IF EXISTS `scoreresult`;
CREATE TABLE `scoreresult` (
  `studentNum` char(12) NOT NULL COMMENT '学号',
  `schoolYear` char(9) NOT NULL COMMENT '学年',
  `sumScore` double(4,2) NOT NULL COMMENT '总评分数(两位整数，两位小数)',
  `filedClassCount` smallint(6) DEFAULT '0' COMMENT '挂科数目',
  `failedClassCredit` double(3,1) DEFAULT '0.0' COMMENT '挂科学分(一位小数)',
  `level` tinyint(4) NOT NULL COMMENT '评定等级（取值：0：没得奖，1：一等奖,2：二等奖,3：三等奖）',
  KEY `fk_score_student` (`studentNum`),
  KEY `fk_score_schoolYear` (`schoolYear`),
  CONSTRAINT `fk_score_schoolYear` FOREIGN KEY (`schoolYear`) REFERENCES `schoolyear` (`schoolYear`),
  CONSTRAINT `fk_score_student` FOREIGN KEY (`studentNum`) REFERENCES `student` (`studentNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='综合测评';

-- ----------------------------
-- Records of scoreresult
-- ----------------------------
INSERT INTO `scoreresult` VALUES ('201211621224', '2012-2013', '77.28', '0', '0.0', '1');
INSERT INTO `scoreresult` VALUES ('201211621212', '2012-2013', '74.45', '0', '0.0', '2');
INSERT INTO `scoreresult` VALUES ('201211621220', '2012-2013', '74.25', '0', '0.0', '2');
INSERT INTO `scoreresult` VALUES ('201211621233', '2012-2013', '73.91', '0', '0.0', '3');
INSERT INTO `scoreresult` VALUES ('201211621206', '2012-2013', '72.77', '0', '0.0', '3');
INSERT INTO `scoreresult` VALUES ('201211621201', '2012-2013', '71.69', '0', '0.0', '3');
INSERT INTO `scoreresult` VALUES ('201211621230', '2012-2013', '70.41', '0', '0.0', '3');
INSERT INTO `scoreresult` VALUES ('201211621229', '2012-2013', '70.25', '0', '0.0', '3');
INSERT INTO `scoreresult` VALUES ('201211621221', '2012-2013', '69.48', '1', '3.5', '0');
INSERT INTO `scoreresult` VALUES ('201211621228', '2012-2013', '69.06', '0', '0.0', '3');
INSERT INTO `scoreresult` VALUES ('201211621213', '2012-2013', '68.92', '1', '3.5', '0');
INSERT INTO `scoreresult` VALUES ('201211621225', '2012-2013', '68.77', '0', '0.0', '0');
INSERT INTO `scoreresult` VALUES ('201211621223', '2012-2013', '68.74', '0', '0.0', '0');
INSERT INTO `scoreresult` VALUES ('201211621219', '2012-2013', '68.48', '0', '0.0', '0');
INSERT INTO `scoreresult` VALUES ('201211621209', '2012-2013', '68.13', '1', '3.5', '0');
INSERT INTO `scoreresult` VALUES ('201211621222', '2012-2013', '67.88', '0', '0.0', '0');
INSERT INTO `scoreresult` VALUES ('201211621231', '2012-2013', '67.55', '1', '4.5', '0');
INSERT INTO `scoreresult` VALUES ('201211621208', '2012-2013', '67.35', '0', '0.0', '0');
INSERT INTO `scoreresult` VALUES ('201211621207', '2012-2013', '67.16', '0', '0.0', '0');
INSERT INTO `scoreresult` VALUES ('201211621217', '2012-2013', '66.31', '1', '3.5', '0');
INSERT INTO `scoreresult` VALUES ('201211621211', '2012-2013', '65.46', '2', '9.0', '0');
INSERT INTO `scoreresult` VALUES ('201211621218', '2012-2013', '64.68', '1', '3.5', '0');
INSERT INTO `scoreresult` VALUES ('201211621226', '2012-2013', '64.59', '1', '5.5', '0');
INSERT INTO `scoreresult` VALUES ('201211621227', '2012-2013', '64.42', '3', '13.5', '0');
INSERT INTO `scoreresult` VALUES ('201211621214', '2012-2013', '63.87', '2', '7.0', '0');
INSERT INTO `scoreresult` VALUES ('201211621202', '2012-2013', '63.28', '3', '13.5', '0');
INSERT INTO `scoreresult` VALUES ('201211621301', '2012-2013', '46.00', '16', '50.5', '0');
INSERT INTO `scoreresult` VALUES ('201211621302', '2012-2013', '46.00', '16', '50.5', '0');
INSERT INTO `scoreresult` VALUES ('201211621303', '2012-2013', '46.00', '16', '50.5', '0');
INSERT INTO `scoreresult` VALUES ('201211621215', '2012-2013', '73.60', '0', '0.0', '3');
INSERT INTO `scoreresult` VALUES ('201211621210', '2012-2013', '69.46', '0', '0.0', '0');
INSERT INTO `scoreresult` VALUES ('201211621204', '2012-2013', '69.18', '0', '0.0', '0');
INSERT INTO `scoreresult` VALUES ('201211621203', '2012-2013', '66.28', '1', '4.5', '0');
INSERT INTO `scoreresult` VALUES ('201211621216', '2012-2013', '63.66', '2', '9.0', '0');
INSERT INTO `scoreresult` VALUES ('201211621212', '2013-2014', '75.70', '0', '0.0', '1');
INSERT INTO `scoreresult` VALUES ('201211621224', '2013-2014', '75.60', '0', '0.0', '2');
INSERT INTO `scoreresult` VALUES ('201211621233', '2013-2014', '73.75', '1', '1.5', '0');
INSERT INTO `scoreresult` VALUES ('201211621220', '2013-2014', '71.65', '0', '0.0', '2');
INSERT INTO `scoreresult` VALUES ('201211621218', '2013-2014', '70.03', '0', '0.0', '3');
INSERT INTO `scoreresult` VALUES ('201211621209', '2013-2014', '69.94', '0', '0.0', '3');
INSERT INTO `scoreresult` VALUES ('201211621206', '2013-2014', '69.80', '0', '0.0', '3');
INSERT INTO `scoreresult` VALUES ('201211621219', '2013-2014', '69.15', '0', '0.0', '3');
INSERT INTO `scoreresult` VALUES ('201211621228', '2013-2014', '68.97', '1', '3.0', '0');
INSERT INTO `scoreresult` VALUES ('201211621207', '2013-2014', '68.85', '0', '0.0', '3');
INSERT INTO `scoreresult` VALUES ('201211621229', '2013-2014', '68.62', '0', '0.0', '3');
INSERT INTO `scoreresult` VALUES ('201211621222', '2013-2014', '68.50', '0', '0.0', '0');
INSERT INTO `scoreresult` VALUES ('201211621230', '2013-2014', '67.57', '0', '0.0', '0');
INSERT INTO `scoreresult` VALUES ('201211621201', '2013-2014', '67.51', '0', '0.0', '0');
INSERT INTO `scoreresult` VALUES ('201211621213', '2013-2014', '67.49', '0', '0.0', '0');
INSERT INTO `scoreresult` VALUES ('201211621221', '2013-2014', '67.12', '1', '3.0', '0');
INSERT INTO `scoreresult` VALUES ('201211621208', '2013-2014', '67.03', '0', '0.0', '0');
INSERT INTO `scoreresult` VALUES ('201211621211', '2013-2014', '66.71', '1', '3.5', '0');
INSERT INTO `scoreresult` VALUES ('201211621225', '2013-2014', '66.33', '0', '0.0', '0');
INSERT INTO `scoreresult` VALUES ('201211621202', '2013-2014', '65.79', '0', '0.0', '0');
INSERT INTO `scoreresult` VALUES ('201211621214', '2013-2014', '65.06', '2', '6.5', '0');
INSERT INTO `scoreresult` VALUES ('201211621227', '2013-2014', '65.04', '0', '0.0', '0');
INSERT INTO `scoreresult` VALUES ('201211621217', '2013-2014', '63.92', '1', '3.0', '0');
INSERT INTO `scoreresult` VALUES ('201211621226', '2013-2014', '62.95', '2', '6.5', '0');
INSERT INTO `scoreresult` VALUES ('201211621223', '2013-2014', '60.50', '3', '9.0', '0');
INSERT INTO `scoreresult` VALUES ('201211621231', '2013-2014', '56.42', '9', '22.5', '0');
INSERT INTO `scoreresult` VALUES ('201211621301', '2013-2014', '46.00', '17', '45.5', '0');
INSERT INTO `scoreresult` VALUES ('201211621302', '2013-2014', '46.00', '17', '45.5', '0');
INSERT INTO `scoreresult` VALUES ('201211621303', '2013-2014', '46.00', '17', '45.5', '0');
INSERT INTO `scoreresult` VALUES ('201011621103', '2014-2015', '99.00', '1', '44.5', '1');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `studentNum` char(12) NOT NULL COMMENT '学号',
  `studentName` varchar(10) NOT NULL COMMENT '姓名',
  `classId` int(11) NOT NULL COMMENT '班级Id',
  `password` char(32) NOT NULL COMMENT '密码',
  `sex` char(2) NOT NULL COMMENT '性别',
  `birth` date NOT NULL COMMENT '出生日期（固定格式，如：19992-01-01）',
  `IdentityNum` char(18) NOT NULL COMMENT '身份证号',
  `phoneNum` char(11) DEFAULT NULL COMMENT '手机号码',
  `shortNum` varchar(6) DEFAULT NULL COMMENT '短号',
  `dormitory` varchar(11) DEFAULT NULL COMMENT '宿舍名',
  `qqNum` varchar(15) DEFAULT NULL COMMENT 'QQ号码',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `familyPhone` varchar(20) DEFAULT NULL COMMENT '家庭电话',
  `address` varchar(50) DEFAULT NULL COMMENT '家庭地址',
  `politicsStatus` varchar(10) DEFAULT NULL COMMENT '政治面貌',
  `nation` varchar(20) DEFAULT NULL COMMENT '民族',
  `nativePlace` varchar(10) DEFAULT NULL COMMENT '籍贯',
  `postcode` char(6) DEFAULT NULL COMMENT '邮编',
  `bankCardNum` varchar(20) DEFAULT NULL COMMENT '银行卡号',
  `healthStatus` varchar(20) DEFAULT NULL COMMENT '健康状况',
  `education` varchar(10) DEFAULT NULL COMMENT '教育程度',
  `maritalStatus` tinyint(1) DEFAULT NULL COMMENT '婚姻状况',
  `isallowevaluate` tinyint(1) DEFAULT '0' COMMENT '是否有权限进入贫困生评定',
  `photo_path` varchar(30) DEFAULT NULL COMMENT '头像',
  `timeofstart` varchar(20) DEFAULT NULL COMMENT '入学时间',
  `highschool` varchar(20) DEFAULT NULL COMMENT '毕业中学',
  `fathername` varchar(20) DEFAULT NULL COMMENT '父亲姓名',
  `fatheroffice` varchar(32) DEFAULT NULL COMMENT '父亲工作地点',
  `mothername` varchar(20) DEFAULT NULL COMMENT '母亲姓名',
  `motheroffice` varchar(32) DEFAULT NULL COMMENT '母亲工作地点',
  `admission_ticket` varchar(20) DEFAULT NULL COMMENT '准考证号',
  `ispoorstudent` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否为贫困生，0为否，1为是',
  `familybackground` varchar(10) DEFAULT NULL COMMENT '家庭背景（农民还是城市户口）',
  `extend_field1` varchar(20) DEFAULT NULL COMMENT '扩展字段',
  `extend_field2` varchar(20) DEFAULT NULL,
  `extend_field3` varchar(20) DEFAULT NULL,
  `extend_field4` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`studentNum`),
  KEY `index_studentNum` (`studentNum`),
  KEY `fk_student_class` (`classId`),
  KEY `fk_student_dormitory` (`dormitory`),
  CONSTRAINT `fk_student_class` FOREIGN KEY (`classId`) REFERENCES `class` (`classId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生';

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('201011621101', '陈凯佳', '23', 'fa16933c8633e1357025e1ef17fd254a', '男', '1991-09-30', '44058319910930451x', '13763074627', '642269', '海乐B609', '123', '123', '0754-85878586', '澄海区陆盾围D9幢204', '团员', '汉族', '广东', '0', '6227003131020266337', '健康', '高中', null, '0', '201011621101.png', '2010', null, null, null, null, null, null, '1', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621102', '陈泳发', '23', 'fb17943d8734e2367126e2f018fe264b', '男', '1990-12-16', '440921199012167136', '13763011134', null, '海乐B607', '123', '123', '0668-8193555', '信宜区思贺镇大榔正垌', '团员', '汉族', '广东', '525338', '6227003131020266048', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621103', '丁国建', '23', 'fc18953e8835e3377227e3f119ff274c', '男', '1990-05-13', '522121199005136014', '13729023226', null, '海乐B603', '123', '123', '0852-3112651', '贵州省遵义市江川区高坪镇排军村', '群众', '汉族', '贵州', '563000', '6227003131020290485', '健康', '高中', null, '0', '201011621103.png', '2010', null, null, null, null, null, null, '1', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621104', '干逢雨', '23', 'fd19963f8936e4387328e4f21a10284d', '男', '1991-10-06', '340823199110065639', '13763046679', null, '海乐B601', '123', '123', '0556-2913871', '皖枞阳县老洲镇鲍家二组', '团员', '汉族', '安徽', '246720', '6227003131020287622', '健康', '高中', null, '0', '201011621104.png', '2010', null, null, null, null, null, null, '1', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621105', '黄君杰', '23', 'fe1a97408a37e5397429e5f31b11294e', '男', '1991-10-12', '440106199110120318', '13763091387', null, '海乐B605', '123', '123', '', '广州市天河区下元岗西十巷十三号', '团员', '汉族', '广东', '510500', '6227003131020266253', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621106', '黄燊艺', '23', 'ff1b98418b38e63a752ae6f41c122a4f', '男', '1991-02-24', '441323199102245311', '13729032479', null, '海乐B602', '123', '123', '0752-3368030', '惠州惠阳淡水从山下村', '团员', '汉族', '广东', '0', '6227003131020265495', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621107', '霍浩研', '23', '101c99428c39e73b762be7f51d132b50', '男', '1992-03-28', '440681199203282655', '13425949300', null, '海乐B607', '123', '123', '0757-26639983', '佛山市顺德区北滘镇西海村六丰上街116号', '团员', '汉族', '广东', '528311', '6227003131020265875', '健康', '高中', null, '0', '201011621107.png', '2010', null, null, null, null, null, null, '1', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621108', '江文创', '23', '111d9a438d3ae83c772ce8f61e142c51', '男', '1991-09-26', '441602199109262215', '13763029889', null, '海乐B602', '123', '123', '0762-3299608', '河源市源城区校前街14号', '团员', '汉族', '广东', '517000', '6227003131020265669', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621109', '揭英发', '23', '121e9b448e3be93d782de9f71f152d52', '男', '1992-11-08', '440881199211085716', '13434655611', null, '海乐B603', '123', '123', '', '廉江市长山镇大头竹村51号', '团员', '汉族', '广东', '524458', '6227003131020266428', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621110', '赖木圣', '23', '1824b15aa451ff538e43ff1d251b4368', '男', '1991-03-03', '440921199103033854', '1373608805', null, '海乐B605', '123', '123', '0668-8626401', '信宜市怀乡镇罗马石桥村', '团员', '汉族', '广东', '525324', '6227003131020265750', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621111', '李正文', '23', '1925b25ba55210548f44101e261c4469', '男', '1991-04-02', '440301199104025516', '13763068736', null, '海乐B607', '123', '123', '0755-83921676', '深圳市福田区莲花天心楼A403', '团员', '汉族', '广东', '518036', '6227003131020266295', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621112', '梁国模', '23', '1a26b35ca65311559045111f271d456a', '男', '1989-09-09', '450981198909090413', '13763097723', null, '海乐B601', '123', '123', '020-34780891', '番禺区大石镇105国道富丽广场丽茹居309', '群众', '汉族', '广东', '511430', '6227003131020265917', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621113', '梁家彦', '23', '1b27b45da754125691461210281e466b', '男', '1992-01-04', '440681199201045998', '13726913694', null, '海乐B606', '123', '123', '0757-28616339', '佛山市顺德区容桂上佳市隔涌路安庆巷1号', '群众', '汉族', '广东', '528303', '6227003131020265586', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621114', '梁宇浩', '23', '1c28b55ea855135792471311291f476c', '男', '1991-02-06', '440181199102062410', '13729034605', null, '海乐B606', '123', '123', '020-84980659', '广州市南沙区珠江西路48号', '群众', '汉族', '广东', '511458', '6227003131020265537', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621115', '林显能', '23', '1d29b65fa9561458934814122a20486d', '男', '1989-09-10', '441723198909102474', '13763085211', null, '海乐B609', '123', '123', '0662-6691984', '江阳市阳东县北惯镇', '团员', '汉族', '广东', '529932', '6227003131020265792', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621116', '林永锋', '23', '1e2ab760aa571559944915132b21496e', '男', '1992-06-14', '440782199206143310', '13630450257', null, '海乐B604', '123', '123', '0750-6416275', '江门市新合区双水镇楼墩村3队', '团员', '汉族', '广东', '529153', '6227003131020265701', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621117', '刘彩楼', '23', '1f2bb861ab58165a954a16142c224a6f', '女', '1988-05-21', '500223198805216328', '13729016577', null, '海韵A304', '123', '123', '15120306148', '贵州省遵义市红花岗区万里路228号', '团员', '汉族', '贵州', '563000', '6227003131020290493', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621118', '刘火坤', '23', '202cb962ac59175b964b17152d234b70', '男', '1991-02-13', '441622199102135710', '13824823059', null, '海乐B606', '123', '123', '', '河源市赤光镇潭芬村', '团员', '汉族', '广东', '0', '6227003131020265966', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621119', '刘嘉杰', '23', '212dba63ad5a185c974c18162e244c71', '男', '1991-10-20', '442000199110204237', '13763077854', null, '海乐B604', '123', '123', '0760-22267289', '中山市小榄镇北区祥开巷五号之一', '团员', '汉族', '广东', '528415', '6227003131020266006', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621120', '潘仪洪', '23', '3743d079c3701e72ad621e2c443a6287', '男', '1991-06-26', '445321199106263411', '13824822023', null, '海乐B605', '123', '123', '0766-22361365', '云浮市新兴县河村管理区耕下村47号', '团员', '汉族', '广东', '527428', '6227003131020265263', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621121', '屈嘉照', '23', '3844d17ac4711f73ae631f2d453b6388', '男', '1991-12-04', '440181199112044857', '13824846488', null, '海乐B608', '123', '123', '84729991', '广州市番禺区新造镇贤村上街一巷12号', '团员', '汉族', '广东', '511436', '6227003131020266089', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621122', '沈昌腾', '23', '3945d27bc5722074af64202e463c6489', '男', '1991-07-12', '440823199107122034', '13434897237', null, '海乐B607', '123', '123', '', '佛山市三水区三水农场', '团员', '汉族', '广东', '528100', '4367423116160130000', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621123', '苏荣??', '23', '3a46d37cc6732175b065212f473d658a', '男', '1991-04-06', '441723199104061710', '13432563063', null, '海乐B605', '123', '123', '0662-6758031', '阳江市新洲镇葛边村', '团员', '汉族', '广东', '569938', '4367423116160130000', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621124', '覃健雄', '23', '3b47d47dc7742276b1662230483e668b', '男', '1991-06-02', '441702199106020312', '13822547802', null, '海乐B603', '123', '123', '3212695', '阳江市江城区南门街二巷37号', '团员', '汉族', '广东', '529500', '6227003131020265347', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621125', '汪伟伟', '23', '3c48d57ec8752377b2672331493f678c', '男', '1992-09-08', '445222199209082753', '13729037140', null, '海乐B602', '123', '123', '0751-3823365', '南雄市黎口斜头3幢4号', '团员', '汉族', '广东', '512400', '6227003131020265420', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621126', '王更强', '23', '3d49d67fc9762478b36824324a40688d', '男', '1992-11-10', '350624199211104032', '13763082090', null, '海乐B608', '123', '123', '87632800', '广州市天河区伍仙桥54号', '团员', '汉族', '广东', '0', '6227003131020266139', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621127', '王团辉', '23', '3e4ad780ca772579b46925334b41698e', '男', '1990-09-04', '412723199009040810', '13729031024', null, '海乐B608', '123', '123', '', '河南省商水县汤庄乡刘庄', '团员', '汉族', '河南', '466100', '6227003131020292846', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621128', '肖钊利', '23', '3f4bd881cb78267ab56a26344c426a8f', '男', '1990-10-12', '440923199010126333', '13590054596', null, '海乐B603', '123', '123', '0668-5710209', '茂名市电白那霍水石', '团员', '汉族', '广东', '0', '6227003131020266386', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621129', '谢钦明', '23', '404cd982cc79277bb66b27354d436b90', '男', '1991-06-05', '445322199106055811', '13729037411', null, '海乐B606', '123', '123', '0766-7596292', '云浮市郁南县都城镇大堤路53号', '团员', '汉族', '广东', '527100', '6227003131020265388', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621130', '袁鑫', '23', '5662ef98e28f3d91cc813d4b635981a6', '男', '1992-02-22', '342222199202221654', '13763038919', null, '海乐B602', '123', '123', '0557-5369484', '安徽省宿州市薪县新庄镇团结村前唐32号', '团员', '汉族', '安徽', '235212', '6227003131020287572', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621131', '岳正灵', '23', '5763f099e3903e92cd823e4c645a82a7', '男', '1992-02-28', '511526199202281131', '13763087663', null, '海乐B608', '123', '123', '', '四川省宴宾市珙县巡场镇兵林村社', '团员', '汉族', '四川', '644500', '6227003131020297274', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621132', '曾庆仲', '23', '5864f19ae4913f93ce833f4d655b83a8', '男', '1991-12-18', '44170119911218005x', '123', null, '海乐B604', '123', '123', '0662-3711872', '江阳市海陵镇山白管理区', '团员', '汉族', '广东', '529535', '6227003131020265628', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621133', '张巧玲', '23', '5965f29be5924094cf84404e665c84a9', '女', '1990-04-25', '44160219900425282x', '123', null, '海韵A304', '123', '123', '0762-3831358', '河源市源城区白因村42号', '团员', '汉族', '广东', '517000', '6227003131020265933', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621134', '郑永生', '23', '5a66f39ce6934195d085414f675d85aa', '男', '1990-05-16', '440582199005162055', '13822549858', null, '海乐B601', '123', '123', '0754-82213696', '汕头市潮南区龙因镇东仙村新东里五巷4号', '团员', '汉族', '广东', '515135', '6227003131020265305', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621135', '郑智斌', '23', '5b67f49de7944296d1864250685e86ab', '男', '1991-08-24', '44200019910824001x', '13590040708', null, '海乐B604', '123', '123', '0760-88878379', '中山市石岐区崎港公路日华坊11幢401', '团员', '汉族', '广东', '528400', '6227003131020266170', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201011621136', '周钦雄', '23', '5c68f59ee8954397d2874351695f87ac', '男', '1990-04-17', '440582199004175436', '13726942522', null, '海乐B601', '123', '123', '0754-87784729', '汕头市湖南峡山街道泗联埔', '团员', '汉族', '广东', '515144', '6227003131020266212', '健康', '高中', null, '0', null, '2010', null, null, null, null, null, null, '0', '农民', null, null, null, null);
INSERT INTO `student` VALUES ('201111621314', '李楚富', '3', '9fab38e12bd886da15ca8694aca2caef', '男', '1992-01-01', '445281199201011234', '13763041914', '661914', '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201111621320', '刘楚燮', '3', 'bac653fc46f3a1f530e5a1afc7bde51a', '男', '1992-01-01', '445281199201011234', '13763092778', '622778', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201111621321', '龙飞玲', '3', 'bbc754fd47f4a2f631e6a2b0c8bee61b', '男', '1992-01-01', '445281199201011234', '13824841091', '631091', '5', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201111621405', '陈泽芳', '3', '424edb84ce7b297db86d29374f456d92', '女', '1992-01-01', '445281199201011234', '13824824425', '614425', '5', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201111621416', '潘木坚', '3', '626efba4ee9b499dd88d49576f658db2', '男', '1992-01-01', '445281199201011234', '13726913726', '633726', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201111621417', '蔡洁敏', '3', '626efba4ee9b499dd88d49576f658db2', '男', '1992-01-01', '445281199201011234', '13726913726', '633726', '3', '', '', '', '', '', '', '', '', '', '', '', null, null, '', '', '', '', '', '', '', '', '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201111621418', '林界', '3', '626efba4ee9b499dd88d49576f658db2', '男', '1992-01-01', '445281199201011234', '13726913726', '633726', '3', '', '', '', '', '', '', '', '', '', '', '', null, null, '', '11', null, '', '', '', '', '', '0', '', null, null, null, null);
INSERT INTO `student` VALUES ('201211621201', '程帜良', '5', '121121212121', '男', '2015-05-12', '440544455522222899', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621202', '甘芳琳', '5', '121212121212', '女', '2015-05-28', '454545452432453245', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621203', '郭灶鹏17', '7', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621204', '郭灶鹏16', '7', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621206', '郭灶鹏14', '5', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621207', '郭灶鹏15', '5', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621208', '郭灶鹏11', '5', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621209', '郭灶鹏13', '5', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621210', '郭灶鹏6', '7', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621211', '郭灶鹏5', '5', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621212', '郭灶鹏4', '5', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621213', '郭灶鹏2', '5', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621214', '郭灶鹏0', '5', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621215', '郭灶鹏25', '7', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621216', '郭灶鹏27', '7', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621217', '郭灶鹏28', '6', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621218', '郭灶鹏29', '6', '123123123312', '男', '2015-06-05', '440582199401265514', '', '', '', '', '', '', '', '', '', '', '', '', '', null, null, '0', '', '', null, null, null, null, null, null, '0', '', null, null, null, null);
INSERT INTO `student` VALUES ('201211621219', '郭灶鹏30', '6', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621220', '郭灶鹏19', '6', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621221', '郭灶鹏18', '6', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621222', '郭灶鹏21', '6', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621223', '郭灶鹏20', '6', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621224', '郭灶鹏24', '6', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621225', '郭灶鹏23', '5', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621226', '郭灶鹏10', '5', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621227', '郭灶鹏12', '5', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621228', '郭灶鹏8', '5', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621229', '郭灶鹏9', '5', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621230', '郭灶鹏3', '5', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621231', '郭灶鹏1', '5', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621233', '郭灶鹏7', '5', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621301', '蔡洁敏', '6', '232334234233', '女', '2015-06-16', '123123121212321323', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621302', '陈国赞', '6', '121212132132', '男', '2015-06-16', '212132121321231212', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621303', '陈恰怀', '6', '134131341314', '男', '2015-06-30', '121212121212312312', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211621321', '郭灶鹏26', '3', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);
INSERT INTO `student` VALUES ('201211629081', '郭灶鹏22', '3', '123123123312', '男', '2015-06-05', '440582199401265514', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null);

-- ----------------------------
-- Table structure for upfile
-- ----------------------------
DROP TABLE IF EXISTS `upfile`;
CREATE TABLE `upfile` (
  `fileId` char(32) NOT NULL COMMENT '文件Id',
  `fileName` varchar(255) NOT NULL COMMENT '文件名',
  `upTime` datetime NOT NULL COMMENT '上传时间',
  `fileUrl` varchar(255) NOT NULL COMMENT '文件路径',
  `uploadStaff` varchar(20) NOT NULL COMMENT '上传人员',
  `applyType` smallint(6) NOT NULL COMMENT '申请类型',
  PRIMARY KEY (`fileId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of upfile
-- ----------------------------
INSERT INTO `upfile` VALUES ('2010116211013', '保健品方案.docx', '2015-06-30 11:01:06', 'E:\\apache-tomcat-7.0.62\\webapps\\xsgz\\file\\up\\word_3\\201011621101.docx', '201011621101', '3');

-- ----------------------------
-- Table structure for yard
-- ----------------------------
DROP TABLE IF EXISTS `yard`;
CREATE TABLE `yard` (
  `yardId` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '大院Id',
  `yardName` varchar(10) NOT NULL COMMENT '大院名称',
  `manager` varchar(10) DEFAULT NULL COMMENT '大院管理员',
  `tel` varchar(20) DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`yardId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='大院';

-- ----------------------------
-- Records of yard
-- ----------------------------
INSERT INTO `yard` VALUES ('1', '海趣', '文强', '12345678901');
INSERT INTO `yard` VALUES ('2', '海韵', '阿姨', '12345678901');
INSERT INTO `yard` VALUES ('3', '海乐A', '小乐', '12345678901');
INSERT INTO `yard` VALUES ('4', '海乐B', '大乐', '12345678901');
