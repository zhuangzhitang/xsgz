package cn.gdou.xsgz.admin.scholarships.dao;


import java.sql.Connection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;


import cn.gdou.xsgz.domain.Course;
import cn.gdou.xsgz.domain.Score;
import cn.gdou.xsgz.util.DatabaseUtil;
import cn.gdou.xsgz.util.MyQueryRunner;

public class ScoreInputDao {
	private final MyQueryRunner runner=new MyQueryRunner(DatabaseUtil.getDataSource());
	private final MyQueryRunner tranrunner=new MyQueryRunner();
    public Integer getMajorID(String majorname){
	  String sql="select majorId from major where majorName=?";
	  return (Integer)runner.query(sql,new ArrayHandler(),majorname)[0];
   }
    public Integer getCourseID(String coursename){
  	  String sql="select id from course where cno=?";
  	  return (Integer)runner.query(sql,new ArrayHandler(),coursename)[0];
     }
    /**
     * 插入所有课程
     * @param course
     */
    public int[] insertAllCourse(List<Course> course){
    	String sql="INSERT INTO course(cno,majorID,grade,schoolyear,course_status,credit) VALUES (?,?,?,?,?,?)";
    	int size=course.size();
    	Object[][] params=new Object[size][];
    	for(int i=0;i<size;i++){
    		params[i]=new Object[]{course.get(i).getCno(),course.get(i).getMajorID(),
    				   course.get(i).getGrade(),course.get(i).getSchoolyear(),
    				   course.get(i).getCoursestatus(),course.get(i).getCredit()};
    	}
    	return runner.batch(sql, params);
    }
    public int[] insertgrade(List<Score> scorelist){
    	Connection conn=DatabaseUtil.getConnection();
    	int num[]=null;
    	try {
			DatabaseUtil.startTransaation();
			String sql="INSERT INTO score(sid,cid,grade,bukao,chongkao,qingkao,schoolyear) VALUES (?,?,?,?,?,?,?)";
			int size=scorelist.size();
			Object[][] params=new Object[size][];
			for(int i=0;i<size;i++){
				params[i]=new Object[]{scorelist.get(i).getStudentnum(),scorelist.get(i).getCourseid(),
						               scorelist.get(i).getGrade(),scorelist.get(i).getBukao(),
						               scorelist.get(i).getChongkao(),scorelist.get(i).getQingkao(),
						               scorelist.get(i).getSchoolyear()};
			}
			 num=tranrunner.batch(conn,sql, params);
			 DatabaseUtil.commit();
		} catch (Exception e) {
			DatabaseUtil.rollback();
			e.printStackTrace();
			throw new RuntimeException();
		} finally{
			DatabaseUtil.close();
		}
    	return num;
    }
	public void insertClassScore(Integer classId, String year,String termnum) {
		String sql="SELECT * FROM classscore WHERE classId=? AND schoolyear=? AND status=0 AND teamum=?";
		Object[] o=runner.query(sql,new ArrayHandler(),classId,year,termnum);
		if(o==null){
			sql="INSERT INTO classscore(classId,schoolyear,status,teamum) VALUES (?,?,?,?)";
			runner.update(sql,classId,year,0,termnum);
		}
	}
	public List<Object> alreadyInputTermNum(int classId) {
		String sql="SELECT teamum FROM classscore WHERE classId=? AND status=0";
		return runner.query(sql,new ColumnListHandler(1),classId);
	}
	
   
}
