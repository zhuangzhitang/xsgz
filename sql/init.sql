USE xsgz;

-- 新增角色
INSERT INTO role(roleId, roleName, description) VALUES(0, '超级管理员', '管理整个系统');
INSERT INTO role(roleId, roleName, description) VALUES(1, '学院管理员', '管理本学院');
INSERT INTO role(roleId, roleName, description) VALUES(2, '专业管理员', '管理本专业');

-- 新增管理员(所有密码的明文为123)
INSERT INTO admin(adminId, username, password, subjectId, roleId) VALUES(1, 'admin','6f7b18b1fba856aae59a56647c729abf', 0, 0); -- 超级管理员
INSERT INTO admin(adminId, username, password, subjectId, roleId) VALUES(2, 'xinyuan','86921fc812bf6dc1fcb16d7b9389b1d6', 1, 1); -- 学院管理员
INSERT INTO admin(adminId, username, password, subjectId, roleId) VALUES(3, 'jike','f915923b8532e0346f24e0ee16fc2449', 1, 2); -- 专业级管理员


-- 新增菜单 ------------------start-----------------
-- system（系统管理）
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(1, 'system/admin_updateOwnerPassword.gdou', null, '管理员修改自己的密码'); -- 0,1,2
-- system-【超管】独家访问
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(2, 'system/admin0.jsp', 'system', '用户管理');
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(3, 'system/log.jsp', 'system', '系统日志'); 
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(4, 'system/admin_getAcademyAdmins.gdou', null, '【超管】查询所有的【院管】');
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(5, 'system/admin_getMajorAdmins.gdou', null, '【超管】查询某院的所有【专管】');
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(6, 'system/admin_addAdmin.gdou', null, '【超管】添加管理员');
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(7, 'system/admin_changePassword.gdou', null, '【超管】修改管理员密码');
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(8, 'system/admin_deleteAdmin.gdou', null, '【超管】删除管理员');
-- system-【院管】独家访问
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(9, 'system/admin1.jsp', 'system', '用户管理');
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(10, 'system/admin_role1GetMajorAdmins.gdou', null, '【院管】查询其院的所有【专管】');
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(11, 'system/admin_role1AddMajorAdmin.gdou', null, '【院管】添加【专管】');
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(12, 'system/admin_role1ChangeRole2Pwd.gdou', null, '【院管】修改【专管】密码');
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(13, 'system/admin_role1DeleteMajorAdmin.gdou', null, '【院管】删除【专管】');

-- base（综合管理）
-- base-academy：学院信息只有【超管】可访问
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(14, 'base/academy.jsp', 'base', '学院信息维护');
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(15, 'base/academy_add.gdou', null, '添加学院');
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(16, 'base/academy_update.gdou', null, '更新学院');
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(17, 'base/academy_delete.gdou', null, '删除学院');
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(18, 'base/academy_queryByPage.gdou', null, '分页提取学院信息（用于显示学院的整体信息）');
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(19, 'base/academy_getAllAcademys.gdou', null, '查询所有学院（用于下拉框）');
-- base-major：
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(20, 'base/major.jsp', 'base', '专业信息维护'); -- 0，1
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(21, 'base/major_getMajorsByAcademyId.gdou', null, '【超管】查某院的所有专业');
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(22, 'base/major_role1GetMajorsByAcademyId.gdou', null, '【院管】查本院的所有专业');
-- base-class/student：
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(23, 'base/class.jsp', 'base', '班级信息维护');-- 0，1，2
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(24, 'base/student.jsp', 'base', '学生信息维护');-- 0，1，2

-- scholarships（奖学金）:
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(25, 'scholarships/meritScholarship.jsp', 'scholarships', '优秀奖学金管理');
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(26, 'scholarships/nationalScholarship.jsp', 'scholarships', '国家奖学金管理');
-- workstudy（勤工助学）:
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(27, 'workstudy/attendancePosts.jsp', 'workstudy', '勤工岗位管理');
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(28, 'workstudy/grants.jsp', 'workstudy', '助学金管理');
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(29, 'workstudy/loans.jsp', 'workstudy', '助学贷款管理');
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(30, 'workstudy/motivationalScholarships.jsp', 'workstudy', '励志奖学金管理');
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(31, 'workstudy/poorStudents.jsp', 'workstudy', '贫困生管理');
-- yard（宿舍管理）:只有【超管】可访问
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(32, 'yard/yard.jsp', 'yard', '大院信息维护');
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(33, 'yard/dormitory.jsp', 'yard', '宿舍信息维护');
-- party（党务管理）:
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(34, 'party/party1.jsp', 'party', '党务管理1');
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(35, 'party/party2.jsp', 'party', '党务管理2');
-- other（其他功能）:
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(36, 'other/other1.jsp', 'other', '其他功能1');
INSERT INTO menu(menuId, menuUrl, subject, description) VALUES(37, 'other/other2.jsp', 'other', '其他功能2');
-- 新增菜单 ------------------end-----------------

-- 新增角色菜单 ------------------start-----------------
-- 【超管】拥有的权限：
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 1);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 2);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 3);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 4);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 5);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 6);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 7);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 8);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 14);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 15);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 16);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 17);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 18);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 19);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 20);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 21);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 23);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 24);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 25);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 26);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 27);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 28);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 29);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 30);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 31);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 32);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 33);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 34);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 35);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 36);
INSERT INTO roleMenu(roleId, menuId) VALUES(0, 37);
-- 【院管】拥有的权限：
INSERT INTO roleMenu(roleId, menuId) VALUES(1, 1);
INSERT INTO roleMenu(roleId, menuId) VALUES(1, 9);
INSERT INTO roleMenu(roleId, menuId) VALUES(1, 10);
INSERT INTO roleMenu(roleId, menuId) VALUES(1, 11);
INSERT INTO roleMenu(roleId, menuId) VALUES(1, 12);
INSERT INTO roleMenu(roleId, menuId) VALUES(1, 13);
INSERT INTO roleMenu(roleId, menuId) VALUES(1, 20);
INSERT INTO roleMenu(roleId, menuId) VALUES(1, 22);
INSERT INTO roleMenu(roleId, menuId) VALUES(1, 23);
INSERT INTO roleMenu(roleId, menuId) VALUES(1, 24);
INSERT INTO roleMenu(roleId, menuId) VALUES(1, 25);
INSERT INTO roleMenu(roleId, menuId) VALUES(1, 26);
INSERT INTO roleMenu(roleId, menuId) VALUES(1, 27);
INSERT INTO roleMenu(roleId, menuId) VALUES(1, 28);
INSERT INTO roleMenu(roleId, menuId) VALUES(1, 29);
INSERT INTO roleMenu(roleId, menuId) VALUES(1, 30);
INSERT INTO roleMenu(roleId, menuId) VALUES(1, 31);
INSERT INTO roleMenu(roleId, menuId) VALUES(1, 34);
INSERT INTO roleMenu(roleId, menuId) VALUES(1, 35);
INSERT INTO roleMenu(roleId, menuId) VALUES(1, 36);
INSERT INTO roleMenu(roleId, menuId) VALUES(1, 37);
-- 【专管】拥有的权限：
INSERT INTO roleMenu(roleId, menuId) VALUES(2, 1);
INSERT INTO roleMenu(roleId, menuId) VALUES(2, 23);
INSERT INTO roleMenu(roleId, menuId) VALUES(2, 24);
INSERT INTO roleMenu(roleId, menuId) VALUES(2, 25);
INSERT INTO roleMenu(roleId, menuId) VALUES(2, 26);
INSERT INTO roleMenu(roleId, menuId) VALUES(2, 27);
INSERT INTO roleMenu(roleId, menuId) VALUES(2, 28);
INSERT INTO roleMenu(roleId, menuId) VALUES(2, 29);
INSERT INTO roleMenu(roleId, menuId) VALUES(2, 30);
INSERT INTO roleMenu(roleId, menuId) VALUES(2, 31);
INSERT INTO roleMenu(roleId, menuId) VALUES(2, 34);
INSERT INTO roleMenu(roleId, menuId) VALUES(2, 35);
INSERT INTO roleMenu(roleId, menuId) VALUES(2, 36);
INSERT INTO roleMenu(roleId, menuId) VALUES(2, 37);
-- 新增角色菜单 ------------------end-----------------

-- 新增年级
INSERT INTO grade(grade) VALUES('2011'); 
INSERT INTO grade(grade) VALUES('2012'); 
INSERT INTO grade(grade) VALUES('2013'); 
INSERT INTO grade(grade) VALUES('2014'); 
INSERT INTO grade(grade) VALUES('2015'); 

-- 新增学年
INSERT INTO schoolYear(schoolYear) VALUES('2011-2012'); 
INSERT INTO schoolYear(schoolYear) VALUES('2012-2013'); 
INSERT INTO schoolYear(schoolYear) VALUES('2013-2014'); 
INSERT INTO schoolYear(schoolYear) VALUES('2014-2015'); 
INSERT INTO schoolYear(schoolYear) VALUES('2015-2016'); 

-- 新增学院
INSERT INTO academy(academyId, academyName, shortName, dean, tel, email, address) VALUES(1, '信息学院', '信院',  '谢仕义', '0759-2383064', 'xxxy@gdou.edu.cn', '广东海洋大学主校区科技楼404');
INSERT INTO academy(academyId, academyName, shortName, dean, tel, email, address) VALUES(2, '水产学院', '水院',  '某某某', '0759-2383236', 'scxy@gdou.edu.cn', '广东海洋大学主校区');
INSERT INTO academy(academyId, academyName, shortName, dean, tel, email, address) VALUES(3, '食品科技学院', '食院',  '某某某', '0759-2396026', 'spxy@gdou.edu.cn', '广东海洋大学主校区');
INSERT INTO academy(academyId, academyName, shortName, dean, tel, email, address) VALUES(4, '海洋与气象学院', '海院',  '某某某', '0759-2383247', 'hyqx@gdou.edu.cn', '广东海洋大学主校区');
INSERT INTO academy(academyId, academyName, shortName, dean, tel, email, address) VALUES(5, '农学院', '农院',  '某某某', '0759-2383236', 'nongxy@gdou.edu.cn', '广东海洋大学主校区');
INSERT INTO academy(academyId, academyName, shortName, dean, tel, email, address) VALUES(6, '工程学院', '工院',  '某某某', '0759-2383223', 'gcxy@gdou.edu.cn', '广东海洋大学主校区');
INSERT INTO academy(academyId, academyName, shortName, dean, tel, email, address) VALUES(7, '经济管理学院', '经院',  '某某某', '0759-2383233', 'jjglxy@gdou.edu.cn', '广东海洋大学主校区');
INSERT INTO academy(academyId, academyName, shortName, dean, tel, email, address) VALUES(8, '航海学院', '航院',  '某某某', '0759-2382006', 'hhxy@gdou.edu.cn', '广东海洋大学主校区');
INSERT INTO academy(academyId, academyName, shortName, dean, tel, email, address) VALUES(9, '理学院', '理院',  '某某某', '0759-2383300', 'lxy@gdou.edu.cn', '广东海洋大学主校区');
INSERT INTO academy(academyId, academyName, shortName, dean, tel, email, address) VALUES(10,'外国语学院', '外院',  '某某某', '0759-2383301', 'waiyx@gdou.edu.cn', '广东海洋大学主校区');
INSERT INTO academy(academyId, academyName, shortName, dean, tel, email, address) VALUES(11,'文学院', '文院',  '某某某', '0759-2383285', 'wxy@gdou.edu.cn', '广东海洋大学主校区');
INSERT INTO academy(academyId, academyName, shortName, dean, tel, email, address) VALUES(12,'法学院', '法院',  '某某某', '0759-2396128', 'fxy@gdou.edu.cn', '广东海洋大学主校区');
INSERT INTO academy(academyId, academyName, shortName, dean, tel, email, address) VALUES(13,'思政理论课教学部', '思政部',  '某某某', '0759-2383171', 'sk171@163.com', '广东海洋大学主校区');
INSERT INTO academy(academyId, academyName, shortName, dean, tel, email, address) VALUES(14,'政治与行政学院', '政院',  '某某某', '0759-2396009', 'xzxy009@163.com', '广东海洋大学主校区');
INSERT INTO academy(academyId, academyName, shortName, dean, tel, email, address) VALUES(15,'中歌艺术学院', '艺院',  '某某某', '0759-2383699', 'ysxy@gdou.edu.cn', '广东海洋大学主校区');
INSERT INTO academy(academyId, academyName, shortName, dean, tel, email, address) VALUES(16,'体育与休闲学院', '体院',  '某某某', '0759-2383309', 'tyb@gdou.edu.cn', '广东海洋大学主校区');
INSERT INTO academy(academyId, academyName, shortName, dean, tel, email, address) VALUES(17,'职业技术学院', '职院',  '某某某', '0759-3295546', 'zyjsxy@gdou.edu.cn', '广东海洋大学海滨校区');
INSERT INTO academy(academyId, academyName, shortName, dean, tel, email, address) VALUES(18,'继续教育学院', '教院',  '某某某', '0759-2382452', 'cjy@gdou.edu.cn', '广东海洋大学霞山校区');
INSERT INTO academy(academyId, academyName, shortName, dean, tel, email, address) VALUES(19,'寸金学院', '寸金',  '某某某', '0759-3324968', 'cjxy@gdou.edu.cn', '广东海洋大学寸金校区');

-- 新增专业
INSERT INTO major(majorId, academyId, majorName, shortName, counselor, tel) VALUES(1, 1, '计算机科学与技术', '计科', '陈韶伟', '13922083031'); 
INSERT INTO major(majorId, academyId, majorName, shortName, counselor, tel) VALUES(2, 1, '软件工程', '软件', '金鑫', '13234234234'); 
INSERT INTO major(majorId, academyId, majorName, shortName, counselor, tel) VALUES(3, 1, '信息管理与信息系统', '信管', '某老师', '12345678901'); 
INSERT INTO major(majorId, academyId, majorName, shortName, counselor, tel) VALUES(4, 2, '养鱼专业', '养鱼', '郭志峰', '12345678901'); 
INSERT INTO major(majorId, academyId, majorName, shortName, counselor, tel) VALUES(5, 2, '养虾专业', '养虾', '郭灶鹏', '12345678901'); 

-- 新增班级
INSERT INTO class(classId, className, majorId, grade, classTeacher, teacherTel, monitor) VALUES(1, '计科1113', 1, '2011', '冼远清', '13922092216', '陈嘉濠'); 
INSERT INTO class(classId, className, majorId, grade, classTeacher, teacherTel, monitor) VALUES(2, '计科1114', 1, '2011', '冼远清', '13922092216', '许健鹏'); 
INSERT INTO class(classId, className, majorId, grade, classTeacher, teacherTel, monitor) VALUES(3, '软件1111', 2, '2011', '无名', '12345678901', '殷梓淞'); 
INSERT INTO class(classId, className, majorId, grade, classTeacher, teacherTel, monitor) VALUES(4, '信管1101', 3, '2011', '丁又专', '12345678901', '陈义兰'); 
-- 新增大院
INSERT INTO yard(yardId, yardName, manager, tel) VALUES(1, '海趣', '文强', '12345678901');
INSERT INTO yard(yardId, yardName, manager, tel) VALUES(2, '海韵', '阿姨', '12345678901');
INSERT INTO yard(yardId, yardName, manager, tel) VALUES(3, '海乐A', '小乐', '12345678901');
INSERT INTO yard(yardId, yardName, manager, tel) VALUES(4, '海乐B', '大乐', '12345678901');

-- 新增宿舍
INSERT INTO dormitory(dormitoryId, dormitoryNum, yardId) VALUES(1, '204', 1);
INSERT INTO dormitory(dormitoryId, dormitoryNum, yardId) VALUES(2, '206', 1);
INSERT INTO dormitory(dormitoryId, dormitoryNum, yardId) VALUES(3, '208', 1);
INSERT INTO dormitory(dormitoryId, dormitoryNum, yardId) VALUES(4, '211', 1);
INSERT INTO dormitory(dormitoryId, dormitoryNum, yardId) VALUES(5, '109', 2);


-- 新增学生
INSERT INTO student(studentNum, studentName, classId, password, sex, birth, IdentityNum, phoneNum, shortNum, dormitoryId) 
VALUES('201111621314','李楚富', 1, '9fab38e12bd886da15ca8694aca2caef', '男', '1992-01-01', '445281199201011234', '13763041914', '661914', 2);
INSERT INTO student(studentNum, studentName, classId, password, sex, birth, IdentityNum, phoneNum, shortNum, dormitoryId) 
VALUES('201111621320','刘楚燮', 1, 'bac653fc46f3a1f530e5a1afc7bde51a', '男', '1992-01-01', '445281199201011234', '13763092778', '622778', 1);
INSERT INTO student(studentNum, studentName, classId, password, sex, birth, IdentityNum, phoneNum, shortNum, dormitoryId) 
VALUES('201111621321','龙飞玲', 1, 'bbc754fd47f4a2f631e6a2b0c8bee61b', '男', '1992-01-01', '445281199201011234', '13824841091', '631091', 5);
INSERT INTO student(studentNum, studentName, classId, password, sex, birth, IdentityNum, phoneNum, shortNum, dormitoryId)
VALUES('201111621405','陈泽芳', 2, '424edb84ce7b297db86d29374f456d92', '女', '1992-01-01', '445281199201011234', '13824824425', '614425', 5);
INSERT INTO student(studentNum, studentName, classId, password, sex, birth, IdentityNum, phoneNum, shortNum, dormitoryId) 
VALUES('201111621416','潘木坚', 2, '626efba4ee9b499dd88d49576f658db2', '男', '1992-01-01', '445281199201011234', '13726913726', '633726', 3);

-- 新增获奖信息
INSERT INTO awards(studentNum, awardsName, rewardsBureau, obtainTime) VALUES('201111621314','最佳基友奖', '海大招待所', '2014-06-27');
INSERT INTO awards(studentNum, awardsName, rewardsBureau, obtainTime) VALUES('201111621320','最佳基友奖', '海大招待所', '2014-06-27');
INSERT INTO awards(studentNum, awardsName, rewardsBureau, obtainTime) VALUES('201111621321','最佳舍友奖', '海韵小卖部', '2014-06-27');
INSERT INTO awards(studentNum, awardsName, rewardsBureau, obtainTime) VALUES('201111621405','最佳舍友奖', '海韵小卖部', '2014-06-27');

-- 新增综合测评
INSERT INTO score(studentNum, schoolYear, sumScore, filedClassCount, failedClassCredit, level) VALUES('201111621314','2013-2014', 77.77, 0, 0, 3);
INSERT INTO score(studentNum, schoolYear, sumScore, filedClassCount, failedClassCredit, level) VALUES('201111621320','2013-2014', 88.88, 10, 21.5, 0);
INSERT INTO score(studentNum, schoolYear, sumScore, filedClassCount, failedClassCredit, level) VALUES('201111621321','2013-2014', 66.66, 3, 10, 2);
INSERT INTO score(studentNum, schoolYear, sumScore, filedClassCount, failedClassCredit, level) VALUES('201111621405','2013-2014', 55.55, 5, 7, 2);
INSERT INTO score(studentNum, schoolYear, sumScore, filedClassCount, failedClassCredit, level) VALUES('201111621416','2013-2014', 44.44, 20, 40.5, 3);

-- 新增困难学生家庭情况
INSERT INTO family(studentNum, level, schoolYear, tel, address, origin, householdType, familySize, monthlyIncome, perMonthlyIncome, sourceIncome, comment )
 VALUES('201111621314','一般困难', '2013-2014', '13763041914', '广东普宁', '农民', '农村', 3, 3000, 1000, '上班', '该生成绩良好');
INSERT INTO family(studentNum, level, schoolYear, tel, address, origin, householdType, familySize, monthlyIncome, perMonthlyIncome, sourceIncome, comment )
 VALUES('201111621416','困难', '2013-2014', '13763041914', '广东从化', '农民', '城市', 3, 3000, 1000, '上班', '该生的父母后台很硬');
INSERT INTO family(studentNum, level, schoolYear, tel, address, origin, householdType, familySize, monthlyIncome, perMonthlyIncome, sourceIncome, comment )
 VALUES('201111621320','特殊困难', '2013-2014', '13763041914', '广东潮州', '农民', '农村', 3, 3000, 1000, '上班', '该生是学生会的人');


-- 新增贷款申请
INSERT INTO loanApply(studentNum, applyMoney) VALUES('201111621314',3000);
INSERT INTO loanApply(studentNum, applyMoney) VALUES('201111621416',6000);

-- 新增贷款分配
INSERT INTO loanAllot(studentNum, loanMoney, loanYear) VALUES('201111621314',2000, '2014');
INSERT INTO loanAllot(studentNum, loanMoney, loanYear) VALUES('201111621416',6000, '2014');

-- 新增下载文件
INSERT INTO `downfile` VALUES ('5b371a7b4340474abbc57f5d0aa3d8cb', '国家奖学金申请表.doc', '', '2014-12-01 16:53:52', '1', '国家奖学金申请表');
INSERT INTO `downfile` VALUES ('738e95f4ce6d4721a9ab65dac7c8a712', '广东海洋大学学生及家庭情况调查表.doc', '', '2014-12-01 16:53:52', '1', '广东海洋大学学生及家庭情况调查表');
INSERT INTO `downfile` VALUES ('ac63abe21e734df1926c4fc60c1d4d76', '国家助学贷款申请表.doc', '', '2014-12-01 16:53:52', '1', '国家助学贷款申请表');
INSERT INTO `downfile` VALUES ('d50a1a02b7ab4fbebf7c2a4881a94716', '国家励志奖学金申请表.doc', '', '2014-12-01 16:53:52', '1', '国家励志奖学金申请表');
INSERT INTO `downfile` VALUES ('f485b02fb50443b998197046942287c2', '家庭经济困难证明.doc', '', '2014-12-01 16:53:52', '1', '家庭经济困难证明');
INSERT INTO `downfile` VALUES ('f9da4bb8a66c43b09454389c6bed3f56', '家长承诺书.doc', '', '2014-12-01 16:53:52', '1', '家长承诺书');
INSERT INTO `downfile` VALUES ('fd48a767fb8e48cfa5e092d9fdfb4802', '勤工助学申请表.doc', '', '2014-12-01 16:53:52', '1', '勤工助学申请表');
