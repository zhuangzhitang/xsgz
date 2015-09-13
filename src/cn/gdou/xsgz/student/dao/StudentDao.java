package cn.gdou.xsgz.student.dao;

import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.gdou.xsgz.admin.base.dao.ClassDao;
import cn.gdou.xsgz.domain.Family;
import cn.gdou.xsgz.domain.SchoolYear;
import cn.gdou.xsgz.domain.Student;
import cn.gdou.xsgz.domain.UpFile;
import cn.gdou.xsgz.util.DatabaseUtil;
import cn.gdou.xsgz.util.GetScolarYear;
import cn.gdou.xsgz.util.MyQueryRunner;

/**
 * 学生DAO: Student的一系列数据库操作
 * 
 * @author 潘木坚
 * @version 2014-10-05
 */
public class StudentDao {

	MyQueryRunner runner = new MyQueryRunner(DatabaseUtil.getDataSource());

	public Student login(Student student) {
		String sql = " SELECT * FROM student "
				+ " WHERE studentNum = ? AND password = ?";
		student = runner.query(sql, new BeanHandler<Student>(Student.class),
				student.getStudentNum(), student.getPassword());

		return student;
	}

	/**
	 * @方法：isExistApplyType()
	 * @功能：判断是否已存在申请信息
	 * @param studentNum
	 * @param parseInt
	 * @return boolean
	 */
	public boolean isExistApplyType(String studentNum, int parseInt) {
		UpFile upfile = null;
		String sql = " SELECT * FROM upFile "
				+ " WHERE uploadStaff = ? AND applyType = ?";
		upfile = runner.query(sql, new BeanHandler<UpFile>(UpFile.class),
				studentNum, parseInt);
		if (upfile != null)
			return true;
		return false;
	}

	/**
	 * @方法：getExistFileName()
	 * @功能：获取已存在申请文档的文档路径
	 * @param studentNum
	 * @param parseInt
	 * @return String
	 */
	public String getExistFileName(String studentNum, int parseInt) {
		UpFile upfile = null;
		String sql = " SELECT * FROM upFile "
				+ " WHERE uploadStaff = ? AND applyType = ?";
		upfile = runner.query(sql, new BeanHandler<UpFile>(UpFile.class),
				studentNum, parseInt);

		if (upfile != null)
			return upfile.getFileUrl();
		return null;
	}

	/**
	 * @方法：addApplyToDB()
	 * @功能：提交申请文档，记录申请信息
	 * @param id
	 * @param applyWordFileName
	 * @param date
	 * @param newFileName
	 * @param studentNum
	 * @param parseInt
	 * @return boolean
	 */
	public boolean addApplyToDB(String id, String applyWordFileName, Date date,
			String newFileName, String studentNum, int parseInt) {
		String sql = " insert into upFile " + " values(?,?,?,?,?,?)";
		int count = runner.update(sql, id, applyWordFileName, date,
				newFileName, studentNum, parseInt);
		if (count != 0)
			return true;
		return false;
	}

	public boolean updateApplyInfo(String applyWordFileName, Date date,
			String studentNum, int applyType) {
		String sql = " update upFile " + " set fileName=?, upTime=?"
				+ " where uploadStaff='" + studentNum + "' and applyType="
				+ applyType;
		int count = runner.update(sql, applyWordFileName, date);
		if (count != 0)
			return true;
		return false;
	}

	/**
	 * 进行贫困生评定，查看本班级所有的贫困生
	 * 
	 * @author 赵志锋
	 * @param i
	 * @return
	 */
	public List<Student> queryPermission(int i) {
		String sql1 = "SELECT * FROM student" + " WHERE classId=" + i
				+ " and ispoorstudent=1";
		List<Student> students = runner.query(sql1,
				new BeanListHandler<Student>(Student.class));

		return students;
	}

	/**
	 * 在用户上传成功之后，便把申请信息添加到applyinfo表中
	 * 
	 * @param studentNum
	 * @param id
	 * @param applyType
	 * @param classId
	 * @param studentName
	 */
	public void addApplyToApplyinfo(String studentNum, String id,
			int applyType, int classId, String studentName) {
		String sql = "insert into applyinfo" + " values(?,?,?,?,?)";
		runner.update(sql, studentNum, id, applyType, classId, studentName);
	}

	/**
	 * 将投票所得的分数添加到数据库中
	 * 
	 * @param string
	 * @param integer
	 */
	public void addPointsToPoor(String string, Integer integer, String string2) {
		String sql = "update poorStudent set score=score+" + integer
				+ " where studentNum=?";
		int i = runner.update(sql, string);
		if (1 == i) {
			String sql2 = "update student set isallowevaluate=0 where studentNum=?";
			runner.update(sql2, string2);
		}
	}

	/**
	 * 获得一个班的所有学生
	 * 
	 * @param classId
	 * @return
	 */
	public List<Student> getStudentsByClassId(int classId) {
		String sql = "SELECT * FROM student WHERE classId=?";
		List<Student> list = runner.query(sql, new BeanListHandler<Student>(
				Student.class), classId);
		ClassDao classDao = ClassDao.getClassDaoInstance();
		for (Student s : list) {
			s.setClassName(classDao.getClassByClassId(s.getClassId())
					.getClassName());
		}
		return list;
	}

	/**
	 * 获得一个班的学生数目
	 * 
	 * @param classId
	 * @return
	 */
	public int getStudentNumByClassId(int classId) {
		return getStudentsByClassId(classId).size();
	}

	public Student queryStudentByStudentNum(String studentnum) {
		String sql = " SELECT * FROM student " + " WHERE studentNum = ?";
		return runner.query(sql, new BeanHandler<Student>(Student.class),
				studentnum);
	}

	/**
	 * 往Family里面添加东西
	 * 
	 * @param student
	 * @param householdType
	 * @param homenumber
	 * @param everybodyGet
	 * @param perMonthlyIncome
	 * @param sourceIncome
	 * @param comment
	 */
	public void addstudentToFamily(Student student, String householdType,
			int homenumber, int everybodyGet, int perMonthlyIncome,
			String sourceIncome, String comment) {
		String date = GetScolarYear.getScolarYear();
		String sql1 = "select * from family where studentNum="
				+ student.getStudentNum() + " and schoolYear=" + "'" + date
				+ "'";
		Family family = runner.query(sql1,
				new BeanHandler<Family>(Family.class));
		if (family != null) {
			String sql = "update family"
					+ " set householdType=?,familySize=?,monthlyIncome=?,perMonthlyIncome=?,"
					+ " sourceIncome=?,comment=? where studentNum=? and schoolYear="
					+ "'" + date + "'";
			runner.update(sql, householdType, homenumber, everybodyGet,
					perMonthlyIncome, sourceIncome, comment,
					student.getStudentNum());
		} else {
			String sql = "insert into family values(?,?,?,?,?,?,?,?,?,?,?,?)";
			runner.update(sql, student.getStudentNum(), null, date,
					student.getPhoneNum(), student.getAddress(),
					student.getFamilybackground(), householdType, homenumber,
					everybodyGet, perMonthlyIncome, sourceIncome, comment);
			String sql2 = "update student set ispoorstudent=1 where studentNum=?";
			runner.update(sql2, student.getStudentNum());
			String sql3 = "inert into poorStudent values(?,0,?)";
			runner.update(sql3, student.getStudentNum(), student.getClassId());
		}
	}

	public void addstudentToLoanmoney(Student student, int loansmoney) {
		String sql1 = "select studentNum from loanapply where studentNum="
				+ student.getStudentNum();
		String s = (String) runner.query(sql1, new ScalarHandler());
		if (s != null) {
			String sql = "update loanapply set applymoney=" + loansmoney
					+ " where studentNum=" + student.getStudentNum();
			runner.update(sql);
		} else {
			String sql = "insert into loanapply values(?,?)";
			runner.update(sql, student.getStudentNum(), loansmoney);
		}
	}

	/**
	 * 增加东西到临时文件区
	 * 
	 * @param student
	 * @param salary
	 * @param workpalce
	 */
	public void addstudentTojobtemp(Student student, int salary,
			String workpalce) {
		String sql1 = "select studentNum from jobtemp where studentNum=? and schoolYear=?";
		String s = (String) runner.query(sql1, new ScalarHandler(),
				student.getStudentNum(), GetScolarYear.getScolarYear());
		// 不存在的时候
		if (s == null) {
			String sql = "insert into jobtemp values(?,?,?,?)";
			runner.update(sql, student.getStudentNum(),
					GetScolarYear.getScolarYear(), salary, workpalce);
		} else {
			String sql = "update jobtemp set slarry=? , workplace=? where studentNum=?  and schoolYear=? ";
			runner.update(sql, salary, workpalce, student.getStudentNum(),
					GetScolarYear.getScolarYear());
		}

	}

	public String getStudentClassName(int classId) {
		String sql = "select className from class where classId=?";
		return (String)runner.query(sql, new ScalarHandler(),classId);
	}

}
