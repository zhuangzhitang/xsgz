package cn.gdou.xsgz.admin.base.dao;

import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.gdou.xsgz.domain.Class;
import cn.gdou.xsgz.domain.Student;
import cn.gdou.xsgz.util.DatabaseUtil;
import cn.gdou.xsgz.util.MyQueryRunner;


/**
 * 
 *  Class（班级）的数据库操作类
 * @author 庄智堂
 * @version 2015-4-28
 */
public class ClassDao {
	private MyQueryRunner runner = new MyQueryRunner(DatabaseUtil.getDataSource());
	
	/**创建类的实体，保证在同一线程中运作*/
	private ClassDao(){}
	private static ThreadLocal<ClassDao> map = new ThreadLocal<ClassDao>();
	public static ClassDao getClassDaoInstance(){
		ClassDao instance = map.get();
		if(instance ==null){
			instance = new ClassDao();
			map.set(instance);
		}
		return instance;
	}
	
	/**
	 *查询某个专业下的所有班级 
	 * @param majorId
	 * @return
	 */
	public List<Class> listClassByMajorId(int majorId){
		String sql = "SELECT * FROM class WHERE majorId = ?";
		List<Class> list = runner.query(sql, new BeanListHandler<Class>(Class.class),majorId);
		return list;
	}
	
	/**
	 * 添加班级
	 * @param grade 班级实体
	 * @return  受影响行数
	 */
	public int add(Class grade){
		String sql = "INSERT INTO class" +
				"(className,majorId,grade,classTeacher,teacherTel,monitor,monitor_connection)" +
				"VALUES(?,?,?,?,?,?,?)";
		int result = runner.update(sql,grade.getClassName(),grade.getMajorId(),
				             grade.getGrade(),grade.getClassTeacher(),grade.getTeacherTel(),grade.getMonitor(),
				             grade.getMonitor_connection());
		return result;
	}
	
	/**
	 * 修改班级
	 * @param grade 班级实体
	 * @return  受影响行数
	 */
	public int update(Class grade){
		String sql = "UPDATE class SET " +
				"className=?,grade=?,classTeacher=?,teacherTel=?,monitor=?,monitor_connection=?,majorId=? WHERE classId=?";
		int result = runner.update(sql,grade.getClassName(),
						grade.getGrade(),grade.getClassTeacher(),
						grade.getTeacherTel(),grade.getMonitor(),
						grade.getMonitor_connection(),grade.getMajorId(),grade.getClassId());
		return result;
	}
	
	/**
	 * 删除班级信息
	 * @param classId   班级Id号
	 * @return 受影响的行数
	 */
	public int delete(int classId){
		String sql = "DELETE FROM class WHERE classId = ?";
		int result = runner.update(sql,classId);
		return result;
	}
	
	public Class getClassByClassId(int classId){
		String sql = "SELECT * FROM class WHERE classId = ?";
		return runner.query(sql,new BeanHandler<Class>(Class.class),classId);
	}

	public Class getClassByClassName(String className) {
		String sql = "SELECT * FROM class WHERE className = ?";
		return runner.query(sql,new BeanHandler<Class>(Class.class),className);
	}

	public List<Student> listStudentByClassId(int classId) {
		String sql="SELECT * FROM student WHERE classId=?";
		return runner.query(sql,new BeanListHandler<Student>(Student.class));
	}
	
	/**
	 *通过班级名获取班级id
	 */
	public int getClassIdByClassName(String className){
		String sql = "SELECT classId FROM class WHERE className=?";
		Object result =  runner.query( sql, new ScalarHandler(),className);
	    if(result==null){
	    	return 0;
	    }
		return Integer.parseInt(result.toString());
	}
	
	/**
	 * 判断班级名称是否存在数据库中
	 * 如果存在,返回1，不存在返回0；
	 */
	public int isExistClassName(String className){
		String sql = "select className from class Where className=? LIMIT 0,1";
		Object result = runner.query(sql,new ScalarHandler(), className);
		  if(result==null){
		    	return 0;
		    }
		return 1;
	}
}