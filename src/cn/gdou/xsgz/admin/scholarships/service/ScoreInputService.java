package cn.gdou.xsgz.admin.scholarships.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.collections.map.HashedMap;

import cn.gdou.xsgz.admin.base.dao.ClassDao;
import cn.gdou.xsgz.admin.base.dao.MajorDao;
import cn.gdou.xsgz.admin.scholarships.dao.CourseDao;
import cn.gdou.xsgz.admin.scholarships.dao.ScoreInputDao;
import cn.gdou.xsgz.domain.Course;
import cn.gdou.xsgz.domain.Score;
import cn.gdou.xsgz.domain.StudentGradeExcel;
import cn.gdou.xsgz.student.dao.StudentDao;

public class ScoreInputService {
	private static ThreadLocal<ScoreInputService> map = new ThreadLocal<ScoreInputService>();
	private ScoreInputDao scoreDao=new ScoreInputDao();
	private ClassDao classDao=ClassDao.getClassDaoInstance();
	private CourseDao courseDao=new CourseDao();
	private StudentDao studentdao = new StudentDao();
	public ScoreInputService(){}
	public static ScoreInputService getScoreInputServiceInstance(){
		ScoreInputService instance = map.get();
		if(instance==null){
			instance = new ScoreInputService();
			map.set(instance);
		}
		return instance;
	}
	/**
	 * 比较excel表格提交的班级和表单提交的班级是否一致。
	 * @author 郭灶鹏
	 * @param title banji
	 * @return
	 */
    public boolean compareClass(String title,String banji){
    	String regex="[\u4e00-\u9fa5]{2}[0-9]{4}";
    	Pattern pattern=Pattern.compile(regex);
    	Matcher matcher=pattern.matcher(title);
    	while(matcher.find()){
    		return matcher.group().equals(banji);
    	}
    	return false;
    }
    /**
     * 得到年级
     * @param title
     * @return
     */
    public int getGrade(String title){
    	String regex="[0-9]{4}";
    	Pattern pattern=Pattern.compile(regex);
    	Matcher matcher=pattern.matcher(title);
    	while(matcher.find()){
    		return Integer.parseInt(matcher.group().substring(1,3));
    	}
    	return 0;
    }
    public Integer getMajorID(String majorname){
    	return scoreDao.getMajorID(majorname);
    }
    public Integer getCourseID(String coursename){
    	return scoreDao.getCourseID(coursename);
    }
	public Set<String> insertAllCourse(List<Course> course) {
		Set<String> schoolyearSet=new HashSet<String>();
		for(Course c:course){
	    		Integer termnum=c.getTermnum();
	    		int grade=c.getGrade();
	    		if(termnum==1||termnum==2){
	    			int start=2000+grade;
	    			int end=2000+grade+1;
	    			String schooyear=start+"-"+end;
	    			c.setSchoolyear(schooyear);
	    			schoolyearSet.add(schooyear+"|"+termnum);
	    		}else if(termnum==3||termnum==4){
	    			int start=2000+grade+1;
	    			int end=2000+grade+2;
	    			String schooyear=start+"-"+end;
	    			c.setSchoolyear(schooyear);
	    			schoolyearSet.add(schooyear+"|"+termnum);
	    		}else if(termnum==5||termnum==6){
	    			int start=2000+grade+2;
	    			int end=2000+grade+3;
	    			String schooyear=start+"-"+end;
	    			c.setSchoolyear(schooyear);
	    			schoolyearSet.add(schooyear+"|"+termnum);
	    		}else if(termnum==7||termnum==8){
	    			int start=2000+grade+3;
	    			int end=2000+grade+4;
	    			String schooyear=start+"-"+end;
	    			c.setSchoolyear(schooyear);
	    			schoolyearSet.add(schooyear+"|"+termnum);
	    		}
	    		
	    		if(c.getCoursestatus()!=0){
					c.setCredit(null);
					c.setGrade(null);
					c.setMajorID(null);
					c.setTermnum(null);	
					c.setSchoolyear(null);
		    	}
		}
		 scoreDao.insertAllCourse(course);
		 return schoolyearSet;
	}
	public int[] insertgrade(List<StudentGradeExcel> gradelist,List<Course> course,int g){
		List<Score> scorelist=new ArrayList<Score>();
		for(StudentGradeExcel sge:gradelist){
			for(Integer key:sge.getGrade().keySet()){
			  int year=2000+g+(key-1)/2;
		      int nextyear=year+1;
			   Map<String,String> grademap=sge.getGrade().get(key);
			   for(String coursename:grademap.keySet()){
				   Score score=new Score();
				   score.setStudentnum(sge.getStudent().getStudentNum());
				   score.setCourseid(this.getCourseId(coursename,course));
				   score.setSchoolyear(year+"-"+nextyear);
				   String value=grademap.get(coursename);
				   score=this.setScore(value, score);
				   scorelist.add(score);
			   }
			}
		}
		return scoreDao.insertgrade(scorelist);
	}
	private int getCourseId(String coursename,List<Course> course){
		for(Course c:course){
			if(c.getCno().equals(coursename)){
				return c.getId();
			}
		}
		return 0;
	}
	private Score setScore(String value,Score score){
		String[] s=value.split("/");
		for(int i=0;i<s.length;i++){
			String sc=null;
			if(i!=0){
				Pattern p=Pattern.compile("[0-9]{1,3}");
				Matcher m=p.matcher(s[i]);
				while(m.find()){
				  sc=m.group().trim();
				}
				if(sc==null){
					if(i==1){
						sc=s[i].substring(1).trim();
					}else if(i==2){
						sc=s[i].substring(3).trim();
					}
				}
			}else{
				sc=s[i].trim();
			}
			
			if(sc.equals("缺考")){
				if(i==0){
					score.setGrade(-1.0);
				}else if(i==1){
					score.setBukao(-1.0);
				}else if(i==2){
					score.setChongkao(-1.0);
				}
			}else if(sc.equals("取消考试资格")){
				if(i==0){
					score.setGrade(-2.0);
				}else if(i==1){
					score.setBukao(-2.0);
				}else if(i==2){
					score.setChongkao(-2.0);
				}
			}else if(sc.equals("优秀")){
				if(i==0){
					score.setGrade(95.0);
				}else if(i==1){
					score.setBukao(95.0);
				}else if(i==2){
					score.setChongkao(95.0);
				}
			}else if(sc.equals("良好")){
				if(i==0){
					score.setGrade(85.0);
				}else if(i==1){
					score.setBukao(85.0);
				}else if(i==2){
					score.setChongkao(85.0);
				}
			}else if(sc.equals("中等")){
				if(i==0){
					score.setGrade(75.0);
				}else if(i==1){
					score.setBukao(75.0);
				}else if(i==2){
					score.setChongkao(75.0);
				}
			}else if(sc.equals("及格")){
				if(i==0){
					score.setGrade(65.0);
				}else if(i==1){
					score.setBukao(65.0);
				}else if(i==2){
					score.setChongkao(65.0);
				}
			}else if(sc.equals("不及格")){
				if(i==0){
					score.setGrade(55.0);
				}else if(i==1){
					score.setBukao(55.0);
				}else if(i==2){
					score.setChongkao(55.0);
				}
			}else if(sc.equals("免修")){
				score.setGrade(100.0);
			}else{
				if(i==0){
					score.setGrade(Double.parseDouble(sc));
				}else if(i==1){
					score.setBukao(Double.parseDouble(sc));
				}else if(i==2){
					score.setChongkao(Double.parseDouble(sc));
				}
			}
		}
		return score;
	}
	public void insertClassScore(Integer classId, String year,String termnum) {
		scoreDao.insertClassScore(classId,year,termnum);
	}
	public List<Object> alreadyInputTermNum(String banji) {
		int classId=classDao.getClassByClassName(banji).getClassId();
		return scoreDao.alreadyInputTermNum(classId);
	}
	public Object[] autoInputScore(Map<Integer, List<String>> map,
			List<StudentGradeExcel> studentGradeExcelList, int majorId, int g) {
		Random ran=new Random();
		int n=ran.nextInt(studentGradeExcelList.size());
		String studentnum=studentGradeExcelList.get(n).getStudent().getStudentNum();
		List<Course> courseList=courseDao.queryCourseByMajorAndGrade(majorId,g);
		List<Course> xuanxiuCourseList=courseDao.queryXuanxiuCourse();
		Map<String,Course> courseNameMap=new HashMap<String, Course>();
		Map<String,Course> xuanxiuCourseNameMap=new HashMap<String, Course>();
		for (Course c:courseList){
			courseNameMap.put(c.getCno(),c);
		}
		for (Course c:xuanxiuCourseList){
			xuanxiuCourseNameMap.put(c.getCno(),c);
		}
		for(Integer i:map.keySet()){
			List<String> deleteList=new ArrayList<String>();
			for(String s:map.get(i)){
				if(courseNameMap.containsKey(s)){
					 deleteList.add(s);
				}
				if(xuanxiuCourseNameMap.containsKey(s)){
					deleteList.add(s);
				}
			}
			for(String delete:deleteList){
				map.get(i).remove(delete);
			}
		}
		List<Score> scorelist=new ArrayList<Score>();
		for(StudentGradeExcel se:studentGradeExcelList){
			for(Integer i:se.getGrade().keySet()){
				Map<String,String> courseName_score=se.getGrade().get(i);
				List<String> deleteList=new ArrayList<String>();
			    int year=2000+g+(i-1)/2;
		        int nextyear=year+1;
				for(String name:courseName_score.keySet()){
					 if(courseNameMap.containsKey(name)){
						   String sc=courseName_score.get(name);//成绩
						   Course c=courseNameMap.get(name);
						   Score score=new Score();
						   score.setStudentnum(se.getStudent().getStudentNum());
						   score.setCourseid(c.getId());
						   score.setSchoolyear(year+"-"+nextyear);
						   score=this.setScore(sc, score);
						   scorelist.add(score);
						   deleteList.add(name);
					 }
					 if(xuanxiuCourseNameMap.containsKey(name)){
						   String sc=courseName_score.get(name);//成绩
						   Course c=xuanxiuCourseNameMap.get(name);
						   Score score=new Score();
						   score.setStudentnum(se.getStudent().getStudentNum());
						   score.setCourseid(c.getId());
						   score.setSchoolyear(year+"-"+nextyear);
						   score=this.setScore(sc, score);
						   scorelist.add(score);
						   deleteList.add(name);
					 }
				}
				for(String delete:deleteList){
					courseName_score.remove(delete);
				}
			}
		}
		scoreDao.insertgrade(scorelist);
		for(Integer i:map.keySet()){
			if(map.get(i).size()==0){
				Integer classId=studentdao.queryStudentByStudentNum(studentnum).getClassId();
				int year=2000+g+(i-1)/2;
				int nextyear=year+1;
	 			insertClassScore(classId,year+"-"+nextyear,i+"");
			}
		}
		return new Object[]{map,studentGradeExcelList};
	}
}
