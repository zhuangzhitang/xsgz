CREATE DATABASE xsgz CHARACTER SET UTF8;
-- drop database xsgz;
USE xsgz;


-- -------------------------------- 功能权限---------------------------------

/*角色表*/
CREATE TABLE role(
    roleId TINYINT PRIMARY KEY COMMENT '角色Id（取值范围：0,1,2）',
    roleName NVARCHAR(20) NOT NULL COMMENT '角色名',
    description  NVARCHAR(50) COMMENT '角色描述'
) COMMENT='角色';

-- 管理员表
CREATE TABLE admin(
    adminId INT AUTO_INCREMENT PRIMARY KEY COMMENT '管理员Id',
    username NVARCHAR(20) NOT NULL COMMENT '用户名',
    `password` CHAR(32) NOT NULL COMMENT '密码',
    subjectId SMALLINT NOT NULL COMMENT '学院Id/专业Id（如果是专业级管理员，则为专业ID，否则为学院ID）',
    roleId TINYINT NOT NULL COMMENT '角色Id（0：超级管理员；1：院级管理员；2:专业级管理员）',
    registerTime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
    lastTime DATETIME COMMENT '上次登录时间'
) COMMENT='管理员';
-- drop table admin;


/*菜单表*/
CREATE TABLE menu(
    menuId INT AUTO_INCREMENT PRIMARY KEY COMMENT '菜单Id',
    menuUrl NVARCHAR(100) NOT NULL COMMENT '菜单路径',
    subject NVARCHAR(20) COMMENT '模块名（system:系统管理; base:综合管理。。。）,若为null则不是导航菜单',
    description  NVARCHAR(50) COMMENT '菜单描述'
) COMMENT='菜单';

/*角色菜单表*/
CREATE TABLE roleMenu(
    roleId TINYINT COMMENT '角色Id',
    menuId INT COMMENT '菜单Id',    
    CONSTRAINT pk_roleMenu PRIMARY KEY (roleId,menuId)
) COMMENT='角色菜单';



-- -------------------------------- 文件上传与下载 ---------------------------------
-- 文件下载表
CREATE TABLE downFile(
    fileId CHAR(32) PRIMARY KEY COMMENT '文件Id',
    fileName NVARCHAR(255) NOT NULL COMMENT '文件名',
    fileUrl NVARCHAR(255) NOT NULL COMMENT '文件路径',
    releaseTime DATETIME NOT NULL COMMENT '发布时间',
    adminId INT NOT NULL COMMENT '上传者',
    description NVARCHAR(100) NOT NULL COMMENT '文件描述'
) COMMENT='文件下载';

-- 文件上传表
CREATE TABLE upFile(
    fileId CHAR(32) PRIMARY KEY COMMENT '文件Id',
    fileName NVARCHAR(255) NOT NULL COMMENT '文件名',
    upTime DATETIME NOT NULL COMMENT '上传时间',
    fileUrl NVARCHAR(255) NOT NULL COMMENT '文件路径',
    uploadStaff NVARCHAR(20) NOT NULL COMMENT '上传人员',
    applyType SMALLINT NOT NULL COMMENT '申请类型'
) COMMENT='文件上传';

-- ---------------------------------- 基础表 ---------------------------------

-- 年级表
CREATE TABLE grade(
    grade CHAR(4) NOT NULL PRIMARY KEY COMMENT '年级（如：2011）'
) COMMENT='年级';
-- drop table grade;

-- 学年表
CREATE TABLE schoolYear(
    schoolYear CHAR(9) NOT NULL PRIMARY KEY  COMMENT '学年（如：2011-2012）'
) COMMENT='学年';
-- drop table schoolYear;

-- 学院表
CREATE TABLE academy(
    academyId SMALLINT AUTO_INCREMENT PRIMARY KEY COMMENT '学院Id',
    academyName NVARCHAR(20) NOT NULL COMMENT '学院名称',
    shortName NVARCHAR(10) NOT NULL COMMENT '学院简称',
    dean NVARCHAR(10) NOT NULL COMMENT '院长',
    tel VARCHAR(20)  NOT NULL COMMENT '学院办公室电话',
    email VARCHAR(50)   COMMENT '学院邮箱',
    address NVARCHAR(100)  COMMENT '学院地址'
) COMMENT='学院';
-- drop table academy;

-- 专业表
CREATE TABLE major(
    majorId SMALLINT AUTO_INCREMENT PRIMARY KEY COMMENT '专业Id',
    academyId SMALLINT NOT NULL  COMMENT '学院Id',
    majorName NVARCHAR(30) NOT NULL COMMENT '专业名称',
    shortName NVARCHAR(20) NOT NULL COMMENT '专业简称',
    counselor NVARCHAR(10) NOT NULL COMMENT '辅导员',
    tel VARCHAR(20) COMMENT '辅导员联系电话'
) COMMENT='专业';
-- drop table major;

-- 班级表
CREATE TABLE class(
    classId INT AUTO_INCREMENT PRIMARY KEY COMMENT '班级Id',
    className NVARCHAR(20) NOT NULL COMMENT '班级名称',
    majorId SMALLINT NOT NULL COMMENT '专业Id',
    grade CHAR(4) NOT NULL COMMENT '年级',
    classTeacher NVARCHAR(10) NOT NULL COMMENT '班主任',
    teacherTel VARCHAR(20) COMMENT '班主任联系电话',
    `monitor` NVARCHAR(10) COMMENT '班长'
) COMMENT='班级';
-- drop table class;

-- 大院表
CREATE TABLE yard(
    yardId SMALLINT PRIMARY KEY AUTO_INCREMENT COMMENT '大院Id',
    yardName NVARCHAR(10) NOT NULL COMMENT '大院名称',
    manager NVARCHAR(10) COMMENT '大院管理员',
    tel NVARCHAR(20) COMMENT '联系电话'
) COMMENT='大院';
-- drop table yard;

-- 宿舍表
CREATE TABLE dormitory(
    dormitoryId INT AUTO_INCREMENT PRIMARY KEY COMMENT '宿舍Id',
    dormitoryNum NVARCHAR(10) NOT NULL COMMENT '宿舍号',
    yardId SMALLINT NOT NULL COMMENT '大院Id'
) COMMENT='宿舍';
-- drop table dormitory;

-- 学生表
CREATE TABLE student(
    studentNum CHAR(12) PRIMARY KEY COMMENT '学号',
    studentName NVARCHAR(10) NOT NULL COMMENT '姓名',
    classId INT NOT NULL COMMENT '班级Id',
    `password` CHAR(32) NOT NULL COMMENT '密码',    
    sex CHAR(2) NOT NULL COMMENT '性别' CHECK(sSex='男' OR sSex='女'),  
    birth DATE NOT NULL COMMENT '出生日期（固定格式，如：19992-01-01）',
    IdentityNum CHAR(18) NOT NULL COMMENT '身份证号',
    phoneNum CHAR(11)  COMMENT '手机号码',
    shortNum VARCHAR(6) COMMENT '短号',
    dormitoryId INT COMMENT '宿舍Id',
    qqNum VARCHAR(15) COMMENT 'QQ号码',
    email NVARCHAR(50) COMMENT '邮箱', 
    familyPhone NVARCHAR(20) COMMENT '家庭电话',
    address NVARCHAR(50) COMMENT '家庭地址',
    politicsStatus VARCHAR(10) COMMENT '政治面貌',
    nation VARCHAR(20) COMMENT '民族',
    nativePlace VARCHAR(10) COMMENT '籍贯',    
    postcode CHAR(6) COMMENT '邮编',
    bankCardNum VARCHAR(20)  COMMENT '银行卡号',
    healthStatus VARCHAR(20) COMMENT '健康状况',
    education VARCHAR(10) COMMENT '教育程度',
    maritalStatus BOOL  COMMENT '婚姻状况'
) COMMENT='学生';
-- drop table student;

-- 获奖信息表
CREATE TABLE awards(
    studentNum CHAR(12) NOT NULL COMMENT '学号',
    awardsName VARCHAR(40) NOT NULL COMMENT '奖项名称',
    rewardsBureau VARCHAR(40) NOT NULL COMMENT '颁奖单位',
    obtainTime DATE NOT NULL COMMENT '获奖时间'
) COMMENT='获奖信息';
-- drop table awards;


-- ------------------------------------------------  综合测评和优秀奖学金  --------------------------------------------------
-- 综合测评表
CREATE TABLE score(
    studentNum CHAR(12) NOT NULL COMMENT '学号',
    schoolYear CHAR(9)  NOT NULL COMMENT '学年',
    sumScore DOUBLE(4,2) NOT NULL COMMENT '总评分数(两位整数，两位小数)',
    filedClassCount SMALLINT DEFAULT 0 COMMENT '挂科数目',
    failedClassCredit DOUBLE(3,1) DEFAULT 0.0 COMMENT '挂科学分(一位小数)',
    `level` TINYINT NOT NULL COMMENT '评定等级（取值：0：没得奖，1：一等奖,2：二等奖,3：三等奖）'    
) COMMENT='综合测评';
-- drop table score;


-- ------------------------------- 三金（助学金、国家奖学金、国家励志奖学金） -------------------------------
-- 申请信息表(临时表，只在当年有用)
CREATE TABLE applyInfo(
    studentNum CHAR(12) NOT NULL COMMENT '学号',
    fileId VARCHAR(20) NOT NULL COMMENT '文件Id',
    `type` SMALLINT NOT NULL COMMENT '申请类别（1：助学金，2：国家励志奖学金，3：国家奖学金，4：勤工岗位）'
) COMMENT='申请信息';
-- drop table applyInfo;

-- 三金分配信息表
CREATE TABLE allotInfo(
    studentNum CHAR(12) NOT NULL COMMENT '学号',
    schoolYear CHAR(9)  NOT NULL COMMENT '学年',
    fileId VARCHAR(20) NOT NULL COMMENT '文件Id',
    `type` SMALLINT NOT NULL  COMMENT '申请类别（1：助学金，2：国家励志奖学金，3：国家奖学金）'
) COMMENT='分配信息';
-- drop table allotInfo;

-- ------------------------------------------------  贫困认定和勤工岗位  --------------------------------------------------

-- 困难学生家庭情况表
CREATE TABLE family(
    studentNum CHAR(12) NOT NULL COMMENT '学号',
    `level` VARCHAR(10) NOT NULL COMMENT '困难等级 (0：特殊困难，1：困难，2：一般困难)',
    schoolYear CHAR(9) NOT NULL COMMENT '学年',
    tel VARCHAR(20) NOT NULL COMMENT '家庭电话',
    address NVARCHAR(50) NOT NULL COMMENT '家庭地址',
    origin NVARCHAR(20) COMMENT '家庭出身',
    householdType NVARCHAR(10) NOT NULL COMMENT '家庭户口类型',
    familySize SMALLINT NOT NULL COMMENT '家庭人口总数',
    monthlyIncome INT NOT NULL COMMENT '家庭月收入(整数)',
    perMonthlyIncome INT NOT NULL COMMENT '人均月收入(整数)',
    sourceIncome NVARCHAR(20) NOT NULL COMMENT '收入来源',
    `comment` VARCHAR(100) COMMENT '备注'
) COMMENT='家庭情况';
-- drop table family;

-- 勤工岗位安排表
CREATE TABLE jobArrange(
    studentNum CHAR(12) NOT NULL COMMENT '学号',
    schoolYear CHAR(9)  NOT NULL COMMENT '学年',
    arrangeJob NVARCHAR(20) NOT NULL COMMENT '安排岗位',
    `path` VARCHAR(200) NOT NULL COMMENT '申请表路径', 
    salary INT COMMENT '工资',    
    `comment` NVARCHAR(50) COMMENT '备注'
) COMMENT='勤工助学岗位安排';
-- drop table jobArrange;

-- ------------------------------------------------  贷款  --------------------------------------------------

-- 贷款申请表(临时表，只在当年有用)
CREATE TABLE loanApply(
    studentNum CHAR(12) NOT NULL COMMENT '学号',
    applyMoney INT  COMMENT '计划贷款金额'
) COMMENT='贷款申请';
-- drop table loanApply;

-- 贷款分配表
CREATE TABLE loanAllot(
    studentNum CHAR(12) COMMENT '学号',
    loanMoney INT NOT NULL COMMENT '贷款金额',
    loanYear CHAR(4) NOT NULL COMMENT '贷款年份'
) COMMENT='贷款分配';
-- drop table loanAllot;

-- ------------------------------------------------  党建  --------------------------------------------------
-- 个人党务信息表
CREATE TABLE partyWork(
    partyWorkId INT AUTO_INCREMENT PRIMARY KEY COMMENT '个人党务Id',
    studentNum CHAR(12)   COMMENT '学号',
    politicsStatus VARCHAR(10) NOT NULL COMMENT '政治面貌',
    score DOUBLE(4,2) NOT NULL COMMENT '党校成绩',
    trainNo VARCHAR(16) NOT NULL COMMENT '第几期培训班',
    linkMan1 VARCHAR(10) NOT NULL COMMENT '入党联系人1',
    linkMan2 VARCHAR(10) NOT NULL COMMENT '入党联系人2',
    introduceMan1 VARCHAR(10) NOT NULL COMMENT '入党介绍人1',
    introduceMan2 VARCHAR(10) NOT NULL COMMENT '入党介绍人2',
    applyDate DATE NOT NULL COMMENT '提交入党申请书时间',
    recommendDate DATE NOT NULL COMMENT '推优时间',
    developDate DATE NOT NULL COMMENT '转发展对象时间',
    readyDate DATE NOT NULL COMMENT '转预备时间',
    positiveDate DATE NOT NULL COMMENT '转正时间',
    graduateDate DATE NOT NULL COMMENT '党校结业时间'
) COMMENT='个人党务信息';
-- drop table partyWork;

-- 党员资料表
CREATE TABLE partyMember(
    partyMemberId INT AUTO_INCREMENT PRIMARY KEY  COMMENT '党员Id',
    studentNum CHAR(12) NOT NULL  COMMENT '学号',
    cadre VARCHAR(20) NOT NULL  COMMENT '职务',
    cadreTime DATE NOT NULL  COMMENT '任职时间',
    thinkReport BOOL NOT NULL  COMMENT '思想汇报',
    applyBook BOOL NOT NULL  COMMENT '入党申请书',
    developRegister  BOOL NOT NULL   COMMENT '发展对象登记表',
    inspection BOOL NOT NULL  COMMENT '入党积极分子 培养考察登记表',
    schoolMemberRegister BOOL NOT NULL  COMMENT '党校学员登记表',
    research BOOL NOT NULL  COMMENT '群众意见调查表',
    politicalAudit BOOL NOT NULL  COMMENT '政审材料',
    turnPositive BOOL NOT NULL  COMMENT '转正申请书',
    autobiography BOOL NOT NULL   COMMENT '个人自传'
) COMMENT='党员资料';
-- drop table partyMember;

-- 党组织信息表
CREATE TABLE partyOrganization(
    partyOrganizationId SMALLINT AUTO_INCREMENT PRIMARY KEY  COMMENT '党组织Id',
    orgName VARCHAR(20) NOT NULL  COMMENT '党组织名称',
    orgNumber VARCHAR(10) NOT NULL  COMMENT '党组织编号',
    majorId SMALLINT  COMMENT '专业Id'
) COMMENT='党组织信息';
-- drop table partyOrganization;

-- ------------------------------------------------------------ 索引--------------------------------------
-- 为学号创建索引
CREATE INDEX index_studentNum ON student(studentNum);
-- drop index index_studentNum on student;

-- ------------------------------------------------------------ 外键约束  -----------------------------------------------------------------
-- 外键命名规则 fk_table1_table2  table1是副表 table2是主表 主表不可删除

-- 管理员表外键
ALTER TABLE admin
ADD CONSTRAINT fk_admin_role FOREIGN KEY (roleId) REFERENCES role(roleId);

-- 文件下载表外键
ALTER TABLE downFile
ADD CONSTRAINT fk_downFile_admin FOREIGN KEY (adminId) REFERENCES admin(adminId);

-- 角色菜单表外键
ALTER TABLE roleMenu 
ADD CONSTRAINT fk_roleMenu_role FOREIGN KEY (roleId) REFERENCES role(roleId),
ADD CONSTRAINT fk_roleMenu_menu FOREIGN KEY (menuId) REFERENCES menu(menuId);

-- 专业表外键
ALTER TABLE major 
ADD CONSTRAINT fk_major_academy FOREIGN KEY(academyId) REFERENCES academy(academyId);
-- ALTER TABLE major drop foreign key fk_major_academy;

-- 班级表外键
ALTER TABLE class
ADD CONSTRAINT fk_class_major FOREIGN KEY(majorId) REFERENCES major(majorId),
ADD CONSTRAINT fk_class_grade FOREIGN KEY(grade) REFERENCES grade(grade);
-- ALTER TABLE class drop foreign key fk_class_major;
-- ALTER TABLE class drop foreign key fk_class_grade;

-- 宿舍表外键
ALTER TABLE dormitory 
ADD CONSTRAINT fk_dormitory_yard FOREIGN KEY(yardId) REFERENCES yard(yardId);
-- ALTER TABLE dormitory drop foreign key fk_dormitory_yard;

-- 管理员表外键
/*
ALTER TABLE admin 
ADD CONSTRAINT fk_admin_academy FOREIGN KEY(academyId) REFERENCES academy(academyId);*/
-- ALTER TABLE admin drop foreign key fk_admin_academy;

-- 学生信息表外键
ALTER TABLE student
ADD CONSTRAINT fk_student_class FOREIGN KEY(classId) REFERENCES class(classId),
ADD CONSTRAINT fk_student_dormitory FOREIGN KEY(dormitoryId) REFERENCES dormitory(dormitoryId);
-- ALTER TABLE student DROP FOREIGN KEY fk_student_class;
-- ALTER TABLE student DROP FOREIGN KEY fk_student_dormitory;


-- 综合测评表外键
ALTER TABLE score 
ADD CONSTRAINT fk_score_student FOREIGN KEY(studentNum) REFERENCES student(studentNum),
ADD CONSTRAINT fk_score_schoolYear FOREIGN KEY(schoolYear) REFERENCES schoolYear(schoolYear);
-- ALTER TABLE score drop foreign key fk_score_student;
-- ALTER TABLE score drop foreign key fk_score_schoolYear;


-- 申请信息表外键
ALTER TABLE applyInfo 
ADD CONSTRAINT fk_applyInfo_student FOREIGN KEY(studentNum) REFERENCES student(studentNum),
ADD CONSTRAINT fk_applyInfo_upFile FOREIGN KEY(fileId) REFERENCES upFile(fileId);
-- ALTER TABLE applyInfo drop foreign key fk_applyInfo_student;
-- ALTER TABLE applyInfo drop foreign key fk_applyInfo_upFile;

-- 分配信息表外键
ALTER TABLE allotInfo 
ADD CONSTRAINT fk_allotInfo_student FOREIGN KEY(studentNum) REFERENCES student(studentNum),
ADD CONSTRAINT fk_allotInfo_schoolYear FOREIGN KEY(schoolYear) REFERENCES schoolYear(schoolYear),
ADD CONSTRAINT fk_allotInfo_upFile FOREIGN KEY(fileId) REFERENCES upFile(fileId);
-- ALTER TABLE allotInfo drop foreign key fk_allotInfo_student;
-- ALTER TABLE allotInfo drop foreign key fk_allotInfo_schoolYear;

-- 困难学生家庭情况表外键
ALTER TABLE family 
ADD CONSTRAINT fk_family_student FOREIGN KEY(studentNum) REFERENCES student(studentNum),
ADD CONSTRAINT fk_family_schoolYear FOREIGN KEY(schoolYear) REFERENCES schoolYear(schoolYear);
-- ALTER TABLE family drop foreign key fk_family_student;
-- ALTER TABLE family drop foreign key fk_family_schoolYear;

-- 分配信息表外键
ALTER TABLE jobArrange 
ADD CONSTRAINT fk_jobArrange_student FOREIGN KEY(studentNum) REFERENCES student(studentNum),
ADD CONSTRAINT fk_jobArrange_schoolYear FOREIGN KEY(schoolYear) REFERENCES schoolYear(schoolYear);
-- ALTER TABLE jobArrange drop foreign key fk_jobArrange_student;
-- ALTER TABLE jobArrange drop foreign key fk_jobArrange_schoolYear;


-- 贷款申请表外键
ALTER TABLE loanApply 
ADD CONSTRAINT fk_loanApply_student FOREIGN KEY(studentNum) REFERENCES student(studentNum);
-- ALTER TABLE loanApply drop foreign key fk_loanApply_student;

-- 贷款分配表外键
ALTER TABLE loanAllot 
ADD CONSTRAINT fk_loanAllot_student FOREIGN KEY(studentNum) REFERENCES student(studentNum),
ADD CONSTRAINT fk_loanAllot_grade FOREIGN KEY(loanYear) REFERENCES grade(grade);
-- ALTER TABLE loanAllot drop foreign key fk_loanAllot_student;
-- ALTER TABLE loanAllot drop foreign key fk_loanAllot_grade;



-- 个人党务信息表外键
ALTER TABLE partyWork 
ADD CONSTRAINT fk_partyWork_student FOREIGN KEY(studentNum) REFERENCES student(studentNum);
-- ALTER TABLE partyWork drop foreign key fk_partyWork_student;

-- 党员资料表外键
ALTER TABLE partyMember 
ADD CONSTRAINT fk_partyMember_student FOREIGN KEY(studentNum) REFERENCES student(studentNum);
-- ALTER TABLE partyMember drop foreign key fk_partyMember_student;

-- 党组织信息表外键
ALTER TABLE partyOrganization 
ADD CONSTRAINT fk_partyOrganization_major FOREIGN KEY(majorId) REFERENCES major(majorId);
-- ALTER TABLE partyOrganization drop foreign key fk_partyOrganization_major;
