

import java.util.List;
import java.util.Map;

import org.junit.Test;

import cn.gdou.xsgz.admin.scholarships.dao.CourseDao;
import cn.gdou.xsgz.admin.scholarships.dao.ScholarshipsDataOutputDao;
import cn.gdou.xsgz.domain.Course;
import cn.gdou.xsgz.domain.Score;
import cn.gdou.xsgz.domain.ScoreAndConduct;
import cn.gdou.xsgz.student.dao.StudentDao;

public class ScholarshipsDataOutputDaoTest {
    private ScholarshipsDataOutputDao dao=new ScholarshipsDataOutputDao();
	@Test
	public void testQueryScoreAllStudent() {
		
	  for(ScoreAndConduct sc:dao.queryScoreAllStudent(5, 1, 12, "2013-2014",12)){
		//  System.out.print(sc.getStudent().getStudentName()+" ");
		  System.out.print(sc.getStudent().getStudentName());
		  for(int courseId:sc.getScore().keySet()){
			  System.out.println("   课程号："+courseId+"  成绩："+sc.getScore().get(courseId));
		  }
	  }
	  
		
	}
	@Test
	public void testishasScore(){
		System.out.println(dao.ishasScore(6,"2012-2013"));
	}
	@Test
	public void test(){
		CourseDao courseDao=new CourseDao();
		 List<Course> courseList=courseDao.queryClassAllCourse("2014-2015",1,"12");
		 List<ScoreAndConduct> scList=dao.queryScoreAllStudent(5,1, Integer.parseInt("12"), "2014-2015",2);
		 //System.out.println(scList.size());
		 for(ScoreAndConduct sc:scList){
			//获取操行分
			 sc.setConduct(dao.queryConductAllStudent(sc.getStudent(),"2014-2015"));
		 }
		 //没有成绩的科目默认为0分
		 for(Course course:courseList){
			 Integer courseId=course.getId();
			 for(ScoreAndConduct sc:scList){
				 if(!sc.getScore().containsKey(courseId)){
					 sc.getScore().put(courseId,0.0);
				 }
			 }
		 }
	
		 for(ScoreAndConduct sc:scList){
			 System.out.println(sc.getStudent().getStudentName());
			 Map<Integer,Double> conductMap=sc.getConduct();
			 Double caoxingScore=conductMap.get(4)-conductMap.get(5)+11;  //操行总分
			 System.out.println(sc.getStudent().getStudentName()+" "+caoxingScore);
		 }
	}
	@Test
	public void queryScoreResulttest(){
		StudentDao sDao=new StudentDao();
		System.out.println(dao.queryScoreResult(1,"2014-2015").size());
		
	}
	@Test 
	public void queryStudentscoreBynum(){
		ScholarshipsDataOutputDao dao = new ScholarshipsDataOutputDao();
		List<Score> scores = dao.queryAllScreByStudentnum("201211621201","2012-2013");
		System.out.println(scores.size());
	}
}
