package cn.gdou.xsgz.admin.workstudy.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.gdou.xsgz.admin.workstudy.TakeResult;
import cn.gdou.xsgz.domain.AllotInfo;
import cn.gdou.xsgz.domain.ApplyInfo;
import cn.gdou.xsgz.domain.JobArrange;
import cn.gdou.xsgz.domain.Student;
import cn.gdou.xsgz.domain.Class;
import cn.gdou.xsgz.domain.poorStudent;
import cn.gdou.xsgz.util.DatabaseUtil;
import cn.gdou.xsgz.util.GetScolarYear;
import cn.gdou.xsgz.util.MyQueryRunner;

/**
 * 
 * @author zhao
 * 
 */
public class WorkstudyDao {
	MyQueryRunner runner = new MyQueryRunner(DatabaseUtil.getDataSource());

	/**
	 * @author 赵志锋
	 * @param aRole
	 * @param aSubject
	 * @param classId
	 * @return 查询贫困学生所有信息
	 */
	public List<Student> queryPoorStudent(int aRole, int aSubject, int classId) {
		String sql = "select * from student,class";

		if (aRole == 2) {
			sql += ",family" + " WHERE class.classId=student.classId"
					+ " AND student.studentNum=family.studentNum"
					+ " AND class.majorId=?" + " and class.classId=" + classId;
		}
		if (aRole == 1) {
			sql += ",major WHERE class.classId=student.classId"
					+ " AND class.majorId=major.majorId AND academyId=?";
		}
		if (aRole == 0) {
			sql = "select * from student where ispoorstudent=?";
			aSubject = 1;
		}
		List<Student> students = runner.query(sql,
				new BeanListHandler<Student>(Student.class), aSubject);

		return students;
	}

	/**
	 * 查看非贫困生的学生
	 * 
	 * @author zhao
	 * @param aRole
	 * @param aSubject
	 * @param classId
	 * @return
	 */
	public List<Student> allotStudent(int aRole, int aSubject, int classId) {
		String sql = "select * from student,class where student.ispoorstudent=0 "
				+ " AND class.classId=student.classId"
				+ "  AND class.majorId=?" + " and class.classId=" + classId;
		if (aRole == 2) {
			List<Student> st = runner.query(sql, new BeanListHandler<Student>(
					Student.class), aSubject);
			return st;
		}
		return null;

	}

	/**
	 * 分配评定权限
	 * 
	 * @param s2
	 */
	public void allotStudent(String[] s2) {
		String sql = "update student set isallowevaluate=1 where studentNum=?";
		for (String s : s2) {
			runner.update(sql, s);
		}
	}

	/**
	 * 查看某辅导员管理的班级
	 * 
	 * @param aRole
	 * @param aSubject
	 * @return
	 */
	public List<Class> queryClasses(int aRole, int aSubject) {
		String sql = "SELECT * FROM class WHERE majorid=?";
		if (aRole == 2) {
			List<Class> aclass = runner.query(sql, new BeanListHandler<Class>(
					Class.class), aSubject);
			return aclass;
		}
		return null;
	}

	/**
	 * 查看各个奖金的申请信息 申请类别为1，助学金 2，国家奖学金 3，勤工岗位4，贷款申请 5，国家励志奖学金。
	 * 
	 * @param s
	 * @param type
	 * @param rows
	 * @param startRow
	 * @return
	 */
	public List<ApplyInfo> getAllotStudents(int s, int type, int startRow,
			int rows) {
		String sql = "select * from applyinfo where classId=? and type=?"
				+ " LIMIT ?,?";
		if (type == 4)
			sql = "SELECT applyinfo.*,loanapply.`applyMoney` FROM applyinfo,loanapply WHERE"
					+ " applyinfo.`studentNum`=loanapply.`studentNum` AND classId=? AND TYPE=?"
					+ " LIMIT ?,?";
		List<ApplyInfo> apply = runner.query(sql,
				new BeanListHandler<ApplyInfo>(ApplyInfo.class), s, type,
				startRow, rows);
		return apply;
	}

	/**
	 * 查看贫困生的贫困等级（按照分数进行排序）
	 * 
	 * @param studentNum
	 * @return
	 */
	public String queryLevel(String studentNum) {
		String sql = "select level from family where studentNum=?";
		String s = (String) runner.query(sql, new ScalarHandler(), studentNum);
		return s;
	}

	/**
	 * 查看某辅导员管理的班级，是否完成评估了
	 * 
	 * @param aRole
	 * @param aSubject
	 * @return
	 */
	public List<Student> queryIsNoStudent(int aRole, int aSubject) {

		if (2 == aRole) {
			String sql = "select * from student,class where student.isallowevaluate=1 "
					+ " AND class.classId=student.classId"
					+ "  AND class.majorId=?";
			List<Student> st = runner.query(sql, new BeanListHandler<Student>(
					Student.class), aSubject);
			return st;
		}

		return null;
	}

	/**
	 * 对评分进行排序,对贫困生进行分类 分类的方式是根据每个班学生评定出来的结果 按照前两名为特别困难，3-6名为困难，其它都是一般困难
	 * 
	 */
	public void totakeResult() {

		String sql = "select * from poorstudent order by classid";
		List<poorStudent> st = runner.query(sql,
				new BeanListHandler<poorStudent>(poorStudent.class));
		Map<Integer, ArrayList<String>> allotLevel = TakeResult.takeResult(st);
		for (Map.Entry<Integer, ArrayList<String>> entry : allotLevel
				.entrySet()) {
			ArrayList<String> value = entry.getValue();
			String s = "特别困难";
			String s1 = "困难";
			String s2 = "一般困难";
			for (int i = 0; i < value.size(); i++) {
				if (i == 0 || i == 1) {
					setLevel(value.get(i), s);
				} else if (i > 1 && i < 6) {
					setLevel(value.get(i), s1);
				} else
					setLevel(value.get(i), s2);
			}
		}
	}

	private void setLevel(String s1, String s) {
		String sql = "update family set level=" + "'" + s + "'"
				+ " where studentNum=?";
		runner.update(sql, s1);
	}

	public int getStudentConut() {

		return 0;
	}

	/**
	 * 分配学生申请,如果已经分配了，则不会添加到数据库里面。
	 * 
	 * @param s2
	 * @param type
	 */
	public void addToallotInfo(String s2, int type) {
		String date = GetScolarYear.getScolarYear();
		if (type == 4) {
			String sql1 = "select studentNum from loanallot where studentNum=?  and loanYear= ?";
			date = GetScolarYear.getLoanYear();
			String s = (String) runner.query(sql1, new ScalarHandler(), s2,
					date);
			if (s == null) {
				String sql2 = "select applyMoney from loanapply where studentNum="
						+ s2;

				int money = (Integer) runner.query(sql2, new ScalarHandler());
				String sql = "insert into loanallot values(?,?,?)";
				runner.update(sql, s2, money, date);
			}
		}
		if(type==3){
			
		}
		String sql1 = "select studentNum from allotInfo where studentNum=? and type=? and schoolYear=?";
		String s = (String) runner.query(sql1, new ScalarHandler(), s2, type,
				date);
		if (s == null) {
			String sql = "insert into allotInfo values(?,?,?)";
			runner.update(sql, s2, date, type);
		}
	}

	/**
	 * 查看文档路径
	 * 
	 * @param studentNum
	 * @param type
	 * @return
	 */
	public String findPath(String studentNum, int type) {
		String sql = "select fileUrl from upfile where uploadStaff ="
				+ studentNum + " and applyType=" + type;
		String path = (String) runner.query(sql, new ScalarHandler());
		System.err.println(path);
		return path;
	}

	/**
	 * 已分配的学生名单
	 * 
	 * @param classId
	 * @return
	 */
	public List<AllotInfo> showAllotResult(int type) {
		String sql = "SELECT allotinfo.`studentNum`,allotinfo.`schoolYear`,applyinfo.`studentName` FROM allotinfo,applyinfo WHERE allotinfo.`studentNum`=applyinfo.studentNum"
				+ " AND allotinfo.`type`=applyinfo.`type`"
				+ " AND applyinfo.type=" + type;
		List<AllotInfo> allotinfo = runner.query(sql,
				new BeanListHandler<AllotInfo>(AllotInfo.class));
		return allotinfo;
	}

	/**
	 * 查看勤工助学的申请
	 * 
	 * @param aRole
	 * @param aSubject
	 * @return
	 */
	public List<JobArrange> getAttendanceStudents(int aRole, int aSubject) {
		List<JobArrange> jobarange = new ArrayList<JobArrange>();
		if (aRole == 2) {
			String sql = "SELECT applyinfo.*,jobtemp.`workplace`,jobtemp.`slarry` FROM"
					+ " applyinfo,jobtemp"
					+ " WHERE applyinfo.`studentNum`=jobtemp.`studentNum` AND"
					+ " TYPE=3";
			jobarange = runner.query(sql, new BeanListHandler<JobArrange>(
					JobArrange.class));
		}
		return jobarange;
	}
	/**
	 * 查看是否获得各金
	 * @param sn
	 * @return
	 */
	public boolean queryIsGetLoans(String sn) {
		if(getAllot(sn, 1)!=null)
			return true;
		else
			return false;
	}
	public boolean queryIsGetGrants(String sn) {
		if(getAllot(sn, 4)!=null)
			return true;
		else
			return false;
	}
	public boolean queryIsGetMotivational(String sn) {
		if(getAllot(sn, 5)!=null)
			return true;
		else
			return false;
	}
	private String getAllot(String sn,int type){
		String sql = "select studentNum from allotinfo where studentNum=? and schoolYear=? and type=?";
		String s = (String) runner.query(sql, new ScalarHandler(),sn,GetScolarYear.getScolarYear(),type);
		return s;
	}
	
}
