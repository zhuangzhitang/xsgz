-- 3列对应的值：menuUrl, subject, description【subject ：模块名（system:系统管理; base:综合管理。。。）,若为null则不是导航菜单' 】

-- system（系统管理）
'system/admin_updateOwnerPassword.gdou', null, '管理员修改自己的密码' -- 0,1,2
-- system-【超管】独家访问
'system/log.jsp', 'system', '系统日志' 
'system/admin0.jsp', 'system', '用户管理'
'system/admin_getAcademyAdmins.gdou', null, '【超管】查询所有的【院管】'
'system/admin_getMajorAdmins.gdou', null, '【超管】查询某院的所有【专管】'
'system/admin_addAdmin.gdou', null, '【超管】添加管理员'
'system/admin_changePassword.gdou', null, '【超管】修改管理员密码'
'system/admin_deleteAdmin.gdou', null, '【超管】删除管理员'
-- system-【院管】独家访问
'system/admin1.jsp', 'system', '用户管理'
'system/admin_role1GetMajorAdmins.gdou', null, '【院管】查询其院的所有【专管】'
'system/admin_role1AddMajorAdmin.gdou', null, '【院管】添加【专管】'
'system/admin_role1ChangeRole2Pwd.gdou', null, '【院管】修改【专管】密码'
'system/admin_role1DeleteMajorAdmin.gdou', null, '【院管】删除【专管】'

-- base（综合管理）
-- base-academy：学院信息只有【超管】可访问
'base/academy.jsp', 'base', '学院信息维护'
'base/academy_add.gdou', null, '添加学院'
'base/academy_update.gdou', null, '更新学院'
'base/academy_delete.gdou', null, '删除学院'
'base/academy_queryByPage.gdou', null, '分页提取学院信息（用于显示学院的整体信息）'
'base/academy_getAllAcademys.gdou', null, '查询所有学院（用于下拉框）'
-- base-major：
'base/major.jsp', 'base', '专业信息维护' -- 0，1
'base/major_getMajorsByAcademyId.gdou', null, '【超管】查某院的所有专业'
'base/major_role1GetMajorsByAcademyId.gdou', null, '【院管】查本院的所有专业'
-- base-class/student：
'base/class.jsp', 'base', '班级信息维护'-- 0，1，2
'base/student.jsp', 'base', '学生信息维护'-- 0，1，2

-- scholarships（奖学金）:
'scholarships/meritScholarship.jsp', 'scholarships', '优秀奖学金管理'
'scholarships/nationalScholarship.jsp', 'scholarships', '国家奖学金管理'
-- workstudy（勤工助学）:
'workstudy/attendancePosts.jsp', 'workstudy', '勤工岗位管理'
'workstudy/grants.jsp', 'workstudy', '助学金管理'
'workstudy/loans.jsp', 'workstudy', '助学贷款管理'
'workstudy/motivationalScholarships.jsp', 'workstudy', '励志奖学金管理'
'workstudy/poorStudents.jsp', 'workstudy', '贫困生管理'
-- yard（宿舍管理）:
'yard/yard.jsp', 'yard', '大院信息维护'
'yard/dormitory.jsp', 'yard', '宿舍信息维护'
-- party（党务管理）:
'party/party1.jsp', 'party', '党务管理1'
'party/party2.jsp', 'party', '党务管理2'
-- other（其他功能）:
'other/other1.jsp', 'other', '其他功能1'
'other/other2.jsp', 'other', '其他功能2'