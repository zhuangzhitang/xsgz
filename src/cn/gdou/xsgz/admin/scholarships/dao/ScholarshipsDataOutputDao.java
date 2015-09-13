package cn.gdou.xsgz.admin.scholarships.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;

import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;

import cn.gdou.xsgz.util.DatabaseUtil;
import cn.gdou.xsgz.util.MyQueryRunner;
import cn.gdou.xsgz.domain.Class;
import cn.gdou.xsgz.domain.ConductNextScore;
import cn.gdou.xsgz.domain.ConductNotNextScore;
import cn.gdou.xsgz.domain.Score;
import cn.gdou.xsgz.domain.ScoreAndConduct;
import cn.gdou.xsgz.domain.ScoreResult;
import cn.gdou.xsgz.domain.Student;

public class ScholarshipsDataOutputDao {
  private final MyQueryRunner runner=new MyQueryRunner(DatabaseUtil.getDataSource());
  public boolean ishasScore(int classId,String schoolyear){
	  String sql="SELECT * FROM classscore WHERE classId=? AND schoolyear=? AND status=0";
	  List<Object[]> o=runner.query(sql,new ArrayListHandler(),classId,schoolyear); 
	  if(o!=null&&o.size()==2){
		   return true;
	  }else{
		  return false;
	  }
  }
 public List<Class> queryAllClassByMajorId(int[] grade, Integer majorId) {
	String sql="SELECT * FROM class WHERE majorId=? AND grade IN ("+"?,?,?)";
	return runner.query(sql,new BeanListHandler<Class>(Class.class),majorId,grade[0],grade[1],grade[2]);
 }

 public boolean ishasScoreResultMajor(int classId,String schoolyear){
	  String sql="SELECT * FROM classscore WHERE classId=? AND schoolyear=? AND status=1";
	  Object[] o=runner.query(sql,new ArrayHandler(),classId,schoolyear);  
	  if(o==null){
		  return false;
	  }else{
		  return true;
	  }
 }
 
 public void insertClassScore(Integer classId, String year) {
		String sql="SELECT * FROM classscore WHERE classId=? AND schoolyear=? AND status=1";
		Object[] o=runner.query(sql,new ArrayHandler(),classId,year);
		if(o==null){
			sql="INSERT INTO classscore(classId,schoolyear,status) VALUES (?,?,?)";
			runner.update(sql,classId,year,1);
		}
}
/**
 * 查询到一个班级的所有学生
 * @param classId
 * @return
 */
  public List<Object[]> queryAllStudentNumByClassId(Integer classId){
	  String sql="SELECT studentNum,studentName FROM student WHERE classId=?";
	  return runner.query(sql,new ArrayListHandler(),classId);
  }
  /**
   * 查询该班级所有学生在某一学年的所有科目的成绩
   * @param classId
   * @param majorId
   * @param grade
   * @param year
 * @param daji 
   * @return
   */
  public List<ScoreAndConduct> queryScoreAllStudent(Integer classId,Integer majorId,Integer grade,String year, int daji){
	  List<ScoreAndConduct> list=new ArrayList<ScoreAndConduct>();
	  for(Object[] i:queryAllStudentNumByClassId(classId)){
		Student s=new Student();
		s.setStudentNum((String)i[0]);
		s.setStudentName((String)i[1]);
		ScoreAndConduct sc=new ScoreAndConduct();
		sc.setStudent(s);
		Map<Integer,Double> scoreMap=new TreeMap<Integer,Double>();
	    String sql="SELECT c.id,s.grade FROM course c LEFT JOIN score s ON s.cid=c.id  WHERE c.majorID=? AND c.grade=? AND c.schoolyear=? AND s.sid=?";
	    for(Object[] o:runner.query(sql,new ArrayListHandler(),majorId,grade,year,i[0])){
	    	scoreMap.put((Integer)o[0],(Double)o[1]);
	    }
	    if(daji==1||daji==2){
		    sql="SELECT c.id,s.grade FROM course c LEFT JOIN score s ON s.cid=c.id  WHERE c.course_status=2 AND s.sid=? AND s.schoolyear=?";
		    List<Object[]> sportScoreList=runner.query(sql,new ArrayListHandler(),i[0],year);
		    if(sportScoreList==null||sportScoreList.size()==0){
		    	scoreMap.put(-1,0.0);
		    	scoreMap.put(-2,0.0);
		    }else if(sportScoreList.size()==1){
		    	scoreMap.put(-1,(Double)sportScoreList.get(0)[1]);
		    	scoreMap.put(-2,0.0);
		    }else{
		    	scoreMap.put(-1,(Double)sportScoreList.get(0)[1]);
		    	scoreMap.put(-2,(Double)sportScoreList.get(1)[1]);
		    }
	    }
	    sc.setScore(scoreMap);
	    list.add(sc);
	  }
	  return list;
  }
  
  /**
   * 根据学号和学年查找出该学生这一学年的所有学科的成绩，包括选修和体育课。
   * @param studnetnum  学号
   * @param scholyear   学年
   * @return
   */
  public List<Score> queryAllScreByStudentnum(String studnetnum,String scholyear){
	  String sql="SELECT * FROM score WHERE sid=? AND schoolyear=?";
	  List<Score> scoreList=runner.query(sql,new BeanListHandler<Score>(Score.class),studnetnum,scholyear);
	  CourseDao dao=new CourseDao();
	  for(Score s:scoreList){
		 // System.out.println(s.getCourseid());
		  String courseName=dao.queryCourseById(s.getCid()).getCno();
		  s.setCourseName(courseName);
	  }
	  return scoreList;
  }
  public Map<Integer, Double> queryConductAllStudent(Student student, String year) {
	  Map<Integer, Double> conductMap=new TreeMap<Integer, Double>();
	  String sql="SELECT * FROM conduct_notnext_score WHERE sid=? AND schoolyear=?";
	  List<ConductNotNextScore> notnextScore=runner.query(sql,new BeanListHandler<ConductNotNextScore>(ConductNotNextScore.class),student.getStudentNum(),year);
	  conductMap.put(1,0.0);
	  conductMap.put(2,0.0);
	  conductMap.put(3,0.0);
	  conductMap.put(4,0.0);  //加分项
	  conductMap.put(5,0.0);  //扣分项
	  conductMap.put(6,0.0);  //技术技能
	  for(ConductNotNextScore cnn:notnextScore){
		  if(cnn.getC_notnext()==1){
			  conductMap.put(1,cnn.getScore());  //科技创新
		  }else if(cnn.getC_notnext()==2){
			  conductMap.put(2,cnn.getScore());  //组织管理
		  }else if(cnn.getC_notnext()==3){
			  conductMap.put(3,cnn.getScore());  //特殊分
		  }
	  }
	  sql="SELECT c.id,SUM(s.score) FROM conduct_next_score s,conductitem item,conducthavenext c WHERE item.id=s.c_item AND item.conduct_superitem=c.id AND s.sid=? AND item.schoolyear=? GROUP BY c.id";
	  List<Object[]> nextScore=runner.query(sql,new ArrayListHandler(),student.getStudentNum(),year);
	  for(Object[] o:nextScore){
		  if((Integer)o[0]==1){
			  conductMap.put(4,(Double)o[1]);
		  }else if((Integer)o[0]==2){
			  conductMap.put(5,(Double)o[1]);
		  }else if((Integer)o[0]==3){
			  conductMap.put(6,(Double)o[1]);
		  }
	  }
	  return conductMap;
  }
  /**
   * 插入成绩统计结果
   * @param studentNum 学号
   * @param year  学年
   * @param allscore  总评成绩
   * @param guakeNUm  挂科数目
   * @param guakeCredit  挂科学分
   * @param level     获奖等级
   */
	public void insertScoreResult(String studentNum, String year, Double allscore,
			Integer guakeNUm, Double guakeCredit, int level) {
		String sql="SELECT * FROM scoreresult WHERE studentNum=? AND schoolYear=?";
		Object[] o=runner.query(sql, new ArrayHandler(),studentNum,year);
		if(o==null){
	     sql="INSERT INTO scoreresult(studentNum,schoolYear,sumScore,filedClassCount,failedClassCredit,level) VALUES(?,?,?,?,?,?)";
		 runner.update(sql,studentNum,year,allscore,guakeNUm,guakeCredit,level);
		}else{
			sql="UPDATE scoreresult SET sumScore=?,filedClassCount=?,failedClassCredit=?,level=? WHERE studentNum=? AND schoolYear=?";
			runner.update(sql,allscore,guakeNUm,guakeCredit,level,studentNum,year);
		}
	}
	
	public List<ScoreResult> queryScoreResult(Integer major, String year) {
		String sql="SELECT sr.* FROM scoreresult sr LEFT JOIN student s ON sr.studentNum=s.studentNum LEFT JOIN class c ON s.classId=c.classId WHERE c.majorId=? AND sr.schoolYear=? AND level IN ('1','2','3')";
		return runner.query(sql,new BeanListHandler<ScoreResult>(ScoreResult.class),major,year);
	}
  
	
	public List<ScoreResult> queryScoreResultByClassId(Integer classId, String year) {
		String sql="SELECT sr.* FROM scoreresult sr LEFT JOIN student s ON sr.studentNum=s.studentNum LEFT JOIN class c ON s.classId=c.classId WHERE c.classId=? AND sr.schoolYear=?";
		return runner.query(sql,new BeanListHandler<ScoreResult>(ScoreResult.class),classId,year);
	}  
  /**
   * 修改成绩
   * @author zhitang
   * @param id  :成绩id
   * @param grade ：分数
   * @param bukao ：补考成绩
   * @param chongkao：重考成绩
   * @param qingkao：清考成绩
   * @return
   */
  public int updateScoreById(String id,String grade,String bukao,String chongkao,String qingkao){
	  String sql = "UPDATE score set grade=?,bukao=?,chongkao=?,qingkao=? WHERE id=?";
	  return  runner.update(sql, grade,bukao,chongkao,qingkao,id);
  }
  
  
}
