package cn.gdou.xsgz.admin.base.service;

import java.util.ArrayList;
import java.util.List;

import cn.gdou.xsgz.admin.base.dao.ClassDao;
import cn.gdou.xsgz.admin.base.dao.StudentInfoDao;
import cn.gdou.xsgz.domain.Student;
import cn.gdou.xsgz.domain.StudentInfo;
import cn.gdou.xsgz.domain.StudentVo;
import cn.gdou.xsgz.util.GenericUtil;

public class StudentInfoService {
	private StudentInfoDao dao = StudentInfoDao.getStudentInfoDaoInstance();
	private ClassDao classDao = ClassDao.getClassDaoInstance();
	/**
	 * 批量导入excel表格数据
	 */
	public String batchInsertStudentInfo(List<String[]> datas){
		System.out.println("enter database daoru"+datas.size());
		int count = 0;
		int result = 0;
		List<StudentInfo> infos = new ArrayList<StudentInfo>();
		for(String[] data:datas){
			if(count==0){
				count++;
				continue;
			}
			String password = GenericUtil.encrypt(data[0], "123");//data[0]学号
			System.out.println("bang"+data[3]);
			int classId = classDao.getClassIdByClassName(data[3]);//data【3】班级名称
			
			if(classId ==0){
				System.out.println("不存在班级"+data[3]);
				return "不存在班级："+data[3]+"请核对数据属实后，再导入。或者先创建该班级，再导入";
			}
			StudentInfo info = new StudentInfo(data[0],data[1],data[2],classId,data[4],data[5],data[6],data[7],data[8],data[9],data[10],data[11],data[12],data[13],data[14],data[15],data[16],data[17],data[18],data[19],data[20],password);
			infos.add(info);
		}
		result = dao.batchInsertStudentInfos(infos);
		if(result == 1)
			return "success";
		else
			return "导入学生信息失败！请稍后重试！";
	}
	
	/**
	 * 批量导入图片路径
	 */
	public String batchInsertImagePath(List<String> paths){
		int result = 0;
		for(String path:paths){
			String studentNum = path.substring(0, path.lastIndexOf("."));
			result = dao.insertImage(path, studentNum);
			if(result ==0){
				return "【"+studentNum+"】学号不存在，请修改该图片名称后重新导入！！";
			}
		}
		if(result == 1)
			return "success";
		else
			return "导入图片信息失败！请检查图片名称！";
	}
	/**
	 *返回某班级的所有学生 
	 * @return
	 */
	public List<StudentVo> queryAllClass(String className){
		int classId = classDao.getClassIdByClassName(className);
		
		return dao.getClassStudentsInfosByclassId(classId);
	}
	
	/**
	 * 通过具体学号拿出学生的信息
	 */
	public Student getAllInfosByStudentNum(String studentNum){
	//	Student student = dao.getAllInfosByStudentNum(studentNum);
		return dao.getAllInfosByStudentNum(studentNum);
	}
	
	/**
	 * 修改学生个人信息
	 */
	public String updateStudentInfos(Student infos){
		int classId = classDao.getClassIdByClassName(infos.getClassName());
		if(classId ==0){
			return "班级不存在，请重新修改后再保存";
		}
		infos.setClassId(classId);
		int result =  dao.updateStudentInfos(infos);
		if(result == 1)
			return "success";
		else
			return "修改学生信息失败！请检查图片名称！";
	}
     
	/**
	 * 全校搜索，通过姓名匹配
	 * @param value
	 * @return
	 */
	public List<StudentVo> queryStudentsInfoByName(String value) {
		
		return dao.queryStudentsInfoByName(value);
	}

	/**
	 * 全院信息搜索，通过姓名匹配
	 * @param value
	 * @param academyId
	 * @return
	 */
	public List<StudentVo> queryStudentsInfoByNameOnAcd(String value,
			int academyId) {
		
		return dao.queryStudentsInfoByNameOnAcd(value, academyId);
	}

	/**
	 * 全专业信息搜索，通过姓名匹配
	 * @param value
	 * @param majorId
	 * @return
	 */
	public List<StudentVo> queryStudentsInfoByNameOnMaj(String value, int majorId) {
		
		return dao.queryStudentsInfoByNameOnMaj(value, majorId);
	}
	
	/**
	 * 全校信息搜索，通过学号匹配
	 * @param value
	 * @return
	 */
	public List<StudentVo> queryStudentsInfoBynums(String value) {
		System.out.println("enter --queryStudentsInfoBynums(String value)");
		return dao.queryStudentsInfoBynums(value);
	}
	
	
	/**
	 * 全院信息搜索，通过学号匹配
	 * @param value
	 * @param academyId
	 * @return
	 */
	public List<StudentVo> queryStudentsInfoBynumsOnAcd(String value,
			int academyId) {
		
		return null;
	}
	
	/**
	 * 全专业搜索，通过学号匹配
	 * @param value
	 * @param majorId
	 * @return
	 */
	public List<StudentVo> queryStudentsInfoBynumsOnMaj(String value, int majorId) {
		
		return null;
	}
	
}
