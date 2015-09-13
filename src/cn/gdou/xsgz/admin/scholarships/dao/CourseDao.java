package cn.gdou.xsgz.admin.scholarships.dao;

import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.gdou.xsgz.domain.Course;
import cn.gdou.xsgz.util.DatabaseUtil;
import cn.gdou.xsgz.util.MyQueryRunner;


public class CourseDao {
	private MyQueryRunner runner = new MyQueryRunner(DatabaseUtil.getDataSource());
   /**
    * 查出一个班本学年所有的课程
    * @param year
    * @param major
    * @param grade
    * @return
    */
	public List<Course> queryClassAllCourse(String year, Integer major,
			String grade) {
	    String sql="SELECT * FROM course WHERE majorID=? AND grade=? AND schoolyear=?";
		return runner.query(sql,new BeanListHandler<Course>(Course.class),major,grade,year);
	}
   
	public Course queryCourseById(Integer courseId) {
	    String sql="SELECT * FROM course WHERE id=?";
		return runner.query(sql,new BeanHandler<Course>(Course.class),courseId);
	}

	public List<Course> queryCourseByMajorAndGrade(int majorId, int g) {
		 String sql="SELECT * FROM course WHERE majorID=? AND grade=? AND course_status=0";
		 return runner.query(sql,new BeanListHandler<Course>(Course.class),majorId,g);
	}

	public List<Course> queryXuanxiuCourse() {
		String sql="SELECT * FROM course WHERE course_status IN ('1','2')";
		return runner.query(sql,new BeanListHandler<Course>(Course.class));
	}
}
