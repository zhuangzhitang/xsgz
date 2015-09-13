package cn.gdou.xsgz.admin.base.dao;

import java.sql.Connection;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.gdou.xsgz.domain.Academy;
import cn.gdou.xsgz.domain.Student;
import cn.gdou.xsgz.domain.StudentInfo;
import cn.gdou.xsgz.domain.StudentVo;
import cn.gdou.xsgz.util.DatabaseUtil;
import cn.gdou.xsgz.util.MyQueryRunner;

public class StudentInfoDao {
	private final MyQueryRunner runner = new MyQueryRunner(DatabaseUtil.getDataSource());
	private final MyQueryRunner tranrunner=new MyQueryRunner();
	
	private StudentInfoDao(){}
	
	private static ThreadLocal<StudentInfoDao> map = new ThreadLocal<StudentInfoDao>();
	public static StudentInfoDao getStudentInfoDaoInstance(){
		StudentInfoDao instance = map.get();
		if(instance == null){
			instance = new StudentInfoDao();
			map.set(instance);
		}
		return instance;
	}
	
	/**
	 * 从excel表中导入数据
	 */
	public int InsertStudentInfo(String[] data,String pass){
		String sql = "INSERT INTO student(studentNum,studentName,sex,className,timeofstart,dormitory,nation,familybackground,education,identityNum,bankCardNum,birth,politicsStatus,healthStatus,phoneNum,qqNum,email,nativePlace,postcode,familyPhone,address,password)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int result = runner.update(sql,data[0],data[1],data[2],data[3],data[4],data[5],data[6],data[7],data[8],data[9],data[10],data[11],data[12],data[13],data[14],data[15],data[16],data[17],data[18],data[19],data[20],pass);
		return result;
	}
	
	@SuppressWarnings("finally")
	public int batchInsertStudentInfos(List<StudentInfo> datas){
		Connection conn=DatabaseUtil.getConnection();
		int num[]=null;
		try{
			DatabaseUtil.startTransaation();
			String sql = "INSERT INTO student(studentNum,studentName,sex,classId,timeofstart,dormitory,nation,familybackground,education,identityNum,bankCardNum,birth,politicsStatus,healthStatus,phoneNum,qqNum,email,nativePlace,postcode,familyPhone,address,password)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			int size=datas.size();
			Object[][] params=new Object[size][];
			for(int i=0;i<size;i++){
				params[i]=new Object[]{datas.get(i).getStudentNum(),datas.get(i).getStudentName(),datas.get(i).getSex(),
						              datas.get(i).getClassId(),datas.get(i).getTimeofstart(),datas.get(i).getDormitory(),
						              datas.get(i).getNation(),datas.get(i).getFamilybackground(),datas.get(i).getEducation(),
						              datas.get(i).getIdentityNum(),datas.get(i).getBankCardNum(),datas.get(i).getBirth(),
						              datas.get(i).getPoliticsStatus(),datas.get(i).getHealthStatus(),datas.get(i).getPhoneNum(),
						              datas.get(i).getQqNum(),datas.get(i).getEmail(),datas.get(i).getNativePlace(),datas.get(i).getPostcode(),
						              datas.get(i).getFamilyPhone(),datas.get(i).getAddress(),datas.get(i).getPassword()};
			}
			 num=tranrunner.batch(conn,sql, params);
			 DatabaseUtil.commit();
		} catch (Exception e) {
			DatabaseUtil.rollback();
			e.printStackTrace();
			throw new RuntimeException();
		} finally{
			DatabaseUtil.close();
			if(num==null)
				return 0;
			else{
				return 1;
			}
			
		}	
	}
	/**
	 *通过班级名获取本班级的所有学生信息
	 */
	public List<Student> getClassStudentsInfosByclassName(String className){
		String sql = "SELECT *"+
				" FROM student"+
				" INNER JOIN class ON student.classId = class.classId " +
				" WHERE class.className=?";
		List<Student> list = runner.query(sql,  new BeanListHandler<Student>(Student.class), className);
		
		return list;
	}
	
	/**
	 *  全校搜索，通过学号匹配
	 */
	public List<StudentVo> queryStudentsInfoBynums(String studentNum){
		String sql = "SELECT student.studentNum,student.studentName,class.className," +
				" student.sex,student.phoneNum,student.dormitory,student.qqNum,student.email"+
				" FROM student"+
				" INNER JOIN class ON student.classId = class.classId " +
				" WHERE studentNum like  '%"+studentNum+"%' LIMIT 0,15";
		List<StudentVo> list = runner.query(sql,  new BeanListHandler<StudentVo>(StudentVo.class));
		return list;
	}
	
	/**
	 * 全院信息搜索，通过学号匹配
	 * @param studentNum
	 * @param academyId
	 * @return
	 */
	public List<StudentVo> queryStudentsInfoBynumsOnAcd(String studentNum,
			int academyId) {
		String sql = "SELECT student.studentNum,student.studentName,class.className," +
				" student.sex,student.phoneNum,student.dormitory,student.qqNum,student.email"+
				" FROM student"+
				" INNER JOIN class ON student.classId = class.classId " +
				" INNER JOIN major ON class.majorId = major.majorId" +
				" INNER JOIN academy ON major.academyId = academy.academyId" +
				" WHERE studentNum like  '%"+studentNum+"%' AND academy.academyId=?  LIMIT 0,15";
		List<StudentVo> list = runner.query(sql,  new BeanListHandler<StudentVo>(StudentVo.class),academyId);
		return list;
	}
	
	/**
	 * 全专业搜索，通过学号匹配
	 * @param studentNum
	 * @param majorId
	 * @return
	 */
	public List<StudentVo> queryStudentsInfoBynumsOnMaj(String studentNum, int majorId) {
		String sql = "SELECT student.studentNum,student.studentName,class.className," +
				" student.sex,student.phoneNum,student.dormitory,student.qqNum,student.email"+
				" FROM student"+
				" INNER JOIN class ON student.classId = class.classId " +
				" INNER JOIN major ON class.majorId = major.majorId" +
				" INNER JOIN academy ON major.academyId = academy.academyId" +
				" WHERE studentNum like  '%"+studentNum+"%' AND major.majorId=?  LIMIT 0,15";
		List<StudentVo> list = runner.query(sql,  new BeanListHandler<StudentVo>(StudentVo.class),majorId);
		return list;
	}
	
	/**
	 *  全校搜索，通过姓名匹配
	 */
	public List<StudentVo> queryStudentsInfoByName(String studentName){
		String sql = "SELECT student.studentNum,student.studentName,class.className," +
				" student.sex,student.phoneNum,student.dormitory,student.qqNum,student.email"+
				" FROM student"+
				" INNER JOIN class ON student.classId = class.classId " +
				" WHERE studentName like '%"+studentName+"%' LIMIT 0,15";
		List<StudentVo> list = runner.query(sql,  new BeanListHandler<StudentVo>(StudentVo.class));
		return list;
	}
	
	/**
	 * 全院信息搜索，通过姓名匹配
	 * @param value
	 * @param academyId
	 * @return
	 */
	public List<StudentVo> queryStudentsInfoByNameOnAcd(String studentName,
			int academyId) {
		String sql = "SELECT student.studentNum,student.studentName,class.className," +
				" student.sex,student.phoneNum,student.dormitory,student.qqNum,student.email"+
				" FROM student"+
				" INNER JOIN class ON student.classId = class.classId " +
				" INNER JOIN major ON class.majorId = major.majorId" +
				" INNER JOIN academy ON major.academyId = academy.academyId" +
				" WHERE studentName like  '%"+studentName+"%' AND academy.academyId=?  LIMIT 0,15";
		List<StudentVo> list = runner.query(sql,  new BeanListHandler<StudentVo>(StudentVo.class),academyId);
		return list;
	}
	
	/**
	 * 全专业信息搜索，通过姓名匹配
	 * @param value
	 * @param majorId
	 * @return
	 */
	public List<StudentVo> queryStudentsInfoByNameOnMaj(String studentName, int majorId) {
		String sql = "SELECT student.studentNum,student.studentName,class.className," +
				" student.sex,student.phoneNum,student.dormitory,student.qqNum,student.email"+
				" FROM student"+
				" INNER JOIN class ON student.classId = class.classId " +
				" INNER JOIN major ON class.majorId = major.majorId" +
				" INNER JOIN academy ON major.academyId = academy.academyId" +
				" WHERE studentName like  '%"+studentName+"%' AND major.majorId=?  LIMIT 0,15";
		List<StudentVo> list = runner.query(sql,  new BeanListHandler<StudentVo>(StudentVo.class),majorId);
		return list;
	}
	
	
	
	
	/**
	 * 班级范围的学号查询
	 */
	public List<Student> queryStudentsInfoBynumsInclass(String studentNum,String className){
		String sql = "SELECT * FROM student WHERE className ='"+className+"' AND studentNum like '%"+studentNum+"%' ";
		List<Student> list = runner.query(sql,  new BeanListHandler<Student>(Student.class));
		return list;
	}
	
	/**
	 * 班级范围的姓名查询
	 */
	public List<Student> queryStudentsInfoBynameInclass(String studentName,String className){
		String sql = "SELECT * FROM student WHERE className ='"+className+"' AND studentName like  '%"+studentName+"%' ";
		List<Student> list = runner.query(sql,  new BeanListHandler<Student>(Student.class));
		return list;
	}
	
	public int insertImage(String imagePath,String studentNum){
		String sql = "UPDATE student set photo_path=? where studentNum =?";
		int result = runner.update(sql, imagePath,studentNum);
		return result;
	}
	
	/**
	 * 通过具体学号拿出学生的信息
	 */
	public Student getAllInfosByStudentNum(String studentNum){
		String sql = "SELECT * FROM student INNER JOIN class ON student.classId = class.classId WHERE studentNum =?";
		Student student = runner.query(sql, new BeanHandler<Student>(Student.class), studentNum);
		return student;
	}
	
	/**
	 * 批量导入学生信息，如果
	 */
	/**
	 * 修改学生信息
	 */
	public int updateStudentInfos(Student infos){
		String sql = "UPDATE student SET studentName=?,classId=?,sex=?," +
							"timeofstart=?,nation=?,postcode=?,healthStatus=?," +
							"familybackground=?,password=?,identityNum=?," +
							"bankCardNum=?,birth=?,dormitory=?,familyPhone=?," +
							"shortNum=?,phoneNum=?,qqNum=?,email=?,nativePlace=?," +
							"politicsStatus=?,highschool=?,address=?,photo_path=?" +
							" WHERE studentNum=? ";
		int result = runner.update(sql,infos.getStudentName(),infos.getClassId(),infos.getSex(),
				infos.getTimeofstart(),infos.getNation(),infos.getPostcode(),
				infos.getHealthStatus(),infos.getFamilybackground(),infos.getPassword(),
				infos.getIdentityNum(),infos.getBankCardNum(),infos.getBirth(),
				infos.getDormitory(),infos.getFamilyPhone(),infos.getShortNum(),
				infos.getPhoneNum(),infos.getQqNum(),infos.getEmail(),
				infos.getNativePlace(),infos.getPoliticsStatus(),infos.getHighschool(),
				infos.getAddress(),infos.getPhoto_path(),infos.getStudentNum()
				);
		return result;	
	}

	public List<StudentVo> getClassStudentsInfosByclassId(int classId) {
		String sql = "SELECT student.studentNum,student.studentName,class.className," +
				" student.sex,student.phoneNum,student.dormitory,student.qqNum,student.email"+
				" FROM student"+
				" INNER JOIN class ON student.classId = class.classId"+
				" WHERE student.classId = ?";
		  List<StudentVo> list = runner.query(sql, 
	                new BeanListHandler<StudentVo>(StudentVo.class), classId);
		return list;
	}
}
