

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.junit.Test;

import cn.gdou.xsgz.admin.base.dao.MajorDao;
import cn.gdou.xsgz.admin.scholarships.dao.CourseDao;
import cn.gdou.xsgz.admin.scholarships.dao.ScholarshipsDataOutputDao;
import cn.gdou.xsgz.admin.scholarships.service.ScholarshipsDataOutputService;
import cn.gdou.xsgz.domain.Course;
import cn.gdou.xsgz.domain.ScoreAndConduct;
import cn.gdou.xsgz.domain.ScoreResult;
import cn.gdou.xsgz.domain.Student;
import cn.gdou.xsgz.student.dao.StudentDao;
import cn.gdou.xsgz.util.CreateExcelUtil;

public class ScholarshipsDataOutputServiceTest {
    private ScholarshipsDataOutputService s=new ScholarshipsDataOutputService();
	@Test
	public void testIshasScore() {
		System.out.println(s.ishasScore(5,"2012-2013"));
	}
	@Test
	public void ishasScoreAllMajorTest(){
		System.out.println(s.ishasScoreAllMajor(1,"2012-2013"));
	}
	
	@Test
	public void ishasScoreResultMajorTest(){
		System.out.println(s.ishasScoreResultMajor(1,"2012-2013"));
	}
	@Test
	public void getZongheCePingClassTest(){
		
		for(ScoreAndConduct sc:s.getZongheCePingClass(1, 5, "2012-2013","12")){
			System.out.println(sc.getStudent().getStudentName()+" 绩点："+sc.getAvgCredit()+" 学业成绩："+sc.getAllscore()+" 学业成绩排名："+sc.getAllscoreNum()+" 体育分："+sc.getSportscore()+" 操行分："+sc.getCaoxingScore()+" 操行分排名："+sc.getCaoxingScoreNum()+"  能力分："+sc.getNengliScore()+" 总分："+sc.getAllscore()+" 总分排名："+sc.getAllscoreNum());
		}
		/*
		
		List<ScoreAndConduct> scList=s.getZongheCePingClass(1, 1, 5, "2013-2014","12");
		ScoreAndConduct[] array=new ScoreAndConduct[scList.size()];
		scList.toArray(array);
		Arrays.sort(array);
		  for(int j=0;j<array.length;j++){
				 array[j].setAllscoreNum(j+1);
		  }
		  Arrays.sort(array);
		  for(int j=0;j<array.length;j++){
				 array[j].setAllscoreNum(j+1);
		  }
		  */
		System.out.println(56.49<66.53);
	}
	@Test
	public void createZongheSheetTest(){
		CourseDao courseDao=new CourseDao();
		 HSSFWorkbook wb = new HSSFWorkbook();  
		// HSSFSheet sheet =wb.createSheet("计科1122"+"班");
		List<Course> courseList=courseDao.queryClassAllCourse("2012-2013",1,"12");
		 Set<Course> treeSet=new TreeSet<Course>();
		 for(Course course:courseList){
			 treeSet.add(course);
		 }
		List<ScoreAndConduct> scList=s.getZongheCePingClass(1, 5, "2012-2013","12");
		//获得一个班综合测评表的三个名次
		 scList=s.getAlreadySortArray(scList,0);
		 scList=s.getAlreadySortArray(scList,1);
		 scList=s.getAlreadySortArray(scList,3);
		 wb=CreateExcelUtil.createZongheSheetHaveSport(scList, treeSet, "信息学院","计算机科学与技术","计科1122","2012-2013", wb);
		 CreateExcelUtil.outputExcel("D:\\aa.xls", wb);
	}
	@Test
	public void testexcel(){
		StudentDao studentDao=new StudentDao();
		 ScholarshipsDataOutputDao dao=new ScholarshipsDataOutputDao();
		List<ScoreResult> scoreresultList=dao.queryScoreResult(1,"2012-2013");
		Map<Integer,List<Student>> map=new TreeMap<Integer, List<Student>>();
		List<Student> firstStudent=new ArrayList<Student>();  //获得一等奖的学生
		List<Student> secondStudent=new ArrayList<Student>();
		List<Student> thirdStudent=new ArrayList<Student>();
		for(ScoreResult s:scoreresultList){
			Student stu=studentDao.queryStudentByStudentNum(s.getStudentNum());
			if(s.getLevel()==1){
				firstStudent.add(stu);
			}else if(s.getLevel()==2){
				secondStudent.add(stu);
			}else if(s.getLevel()==3){
				thirdStudent.add(stu);
			}
		}
		map.put(1,firstStudent);
		map.put(2,secondStudent);
		map.put(3,thirdStudent);
		MajorDao majorDao=MajorDao.getMajorDaoInstance();
		String majorName=majorDao.queryMajorById(1).getShortName();
		HSSFWorkbook wb=new HSSFWorkbook();
		wb=CreateExcelUtil.createhuodezheExcel(map, majorName, "2012-2013", wb);
	}
}
