package cn.gdou.xsgz.admin.scholarships;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.commons.collections.map.HashedMap;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.struts2.ServletActionContext;

import cn.gdou.xsgz.admin.scholarships.service.ScoreInputService;
import cn.gdou.xsgz.domain.Course;
import cn.gdou.xsgz.domain.StudentGradeExcel;
import cn.gdou.xsgz.student.service.StudentService;
import cn.gdou.xsgz.util.ScoreInputUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ScoreInputAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private String academy;  //学院
	private String major;   //专业
	private String banji;   //班级
	//文件上传的三个参数
	private File scoreExcel;
	private String scoreExcelContentType;
	private String scoreExcelFileName;
	
	private List<Course> course=new ArrayList<Course>();
	private ScoreInputService scoreService=ScoreInputService.getScoreInputServiceInstance();
	private StudentService studentservice=new StudentService();
	public ScoreInputAction(){}
	
	public String getBanji() {
		return banji;
	}


	public void setBanji(String banji) {
		this.banji = banji;
	}


	public File getScoreExcel() {
		return scoreExcel;
	}


	public void setScoreExcel(File scoreExcel) {
		this.scoreExcel = scoreExcel;
	}


	public String getScoreExcelContentType() {
		return scoreExcelContentType;
	}


	public void setScoreExcelContentType(String scoreExcelContentType) {
		this.scoreExcelContentType = scoreExcelContentType;
	}


	public String getScoreExcelFileName() {
		return scoreExcelFileName;
	}


	public void setScoreExcelFileName(String scoreExcelFileName) {
		this.scoreExcelFileName = scoreExcelFileName;
	}
    
	public List<Course> getCourse() {
		return course;
	}

	public void setCourse(List<Course> course) {
		this.course = course;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}
	
	public String getAcademy() {
		return academy;
	}

	public void setAcademy(String academy) {
		this.academy = academy;
	}
	
	@SuppressWarnings("unchecked")
	public String fileupload(){
		if(scoreExcel==null){
			ActionContext.getContext().put("message","请导入Excel表格");
		}
		HSSFSheet sheet=ScoreInputUtil.getSheet(scoreExcel);
		String title=ScoreInputUtil.getTitle(sheet);
		if(scoreService.compareClass(title, banji)){
			List<Object> termNumList=scoreService.alreadyInputTermNum(banji);
			Map<Integer,List<String>> map=ScoreInputUtil.getSubjectNameEveryTerm(sheet,termNumList);
		    List<StudentGradeExcel> studentGradeExcelList=ScoreInputUtil.getAllStudentGrade(sheet,termNumList);
		    int g=scoreService.getGrade(title); //年级
		    Object[] o=scoreService.autoInputScore(map,studentGradeExcelList,Integer.parseInt(major),g);
		    map=(Map<Integer,List<String>>)o[0];
		    studentGradeExcelList=(List<StudentGradeExcel>)o[1];
			int num=0;
			Map<Long,Integer> numMap=new HashMap<Long,Integer>();
			for(Integer x:map.keySet()){
				numMap.put((long)x,num);
				num+=map.get(x).size();
			}
			List<Integer> deletexueqi=new ArrayList<Integer>();
			for(Integer i:map.keySet()){
				List<String> subjectNameList=map.get(i);
				if(subjectNameList.size()==0){
					deletexueqi.add(i);
				}
			}
			for(Integer i:deletexueqi){
				map.remove(i);
			}
			if(map.size()==0){
				map=null;
				ActionContext.getContext().put("message","该班级的成绩已经导入成功");
			}
			ActionContext.getContext().put("subjectnum",numMap);
			ActionContext.getContext().put("allsubject",map);
			ActionContext.getContext().put("grade",g);     //年级,12=》12级
			ActionContext.getContext().put("majorID",Integer.parseInt(major));        //专业
			ActionContext.getContext().getSession().put("allgarde",studentGradeExcelList);
			return "fileupload";
		}else{
			ActionContext.getContext().put("message","导入成绩的班级与用户要导入的班级不匹配");
			return "disCompareClass";   //不能匹配班级
		}
		
	}
    @SuppressWarnings("unchecked")
	public String scoreInput(){
    	String g=ServletActionContext.getRequest().getParameter("grade");
    	HashSet<String> schoolyearSet=(HashSet<String>) scoreService.insertAllCourse(course);
    	System.out.println(schoolyearSet.size());
    	for(int i=0;i<course.size();i++){
    		course.get(i).setId(scoreService.getCourseID(course.get(i).getCno()));
    	}	
    	 List<StudentGradeExcel> gardelist=(List<StudentGradeExcel>) ActionContext.getContext().getSession().get("allgarde");
    	 int num[]=scoreService.insertgrade(gardelist, course,Integer.parseInt(g));
    	 if(num.length==0){
 			 ActionContext.getContext().put("message","导入成绩失败，请检查成绩表格的格式或者查看表格是否导入了不存在的学生的成绩");
    		 return "fail";          //插入成绩失败
    	 }else{
 			ActionContext.getContext().put("message","导入成绩成功");
 			Random ran=new Random();
 			int i=ran.nextInt(gardelist.size());
 			String studentnum=gardelist.get(i).getStudent().getStudentNum();
 			Integer classId=studentservice.queryStudentByStudentNum(studentnum).getClassId();
 			for(String year:schoolyearSet){
 				System.out.println(year);
 				String[] ss=year.split("\\|");
 				scoreService.insertClassScore(classId,ss[0],ss[1]);
 			}
    	    return "success";        //导入成绩成功
    	 }
    }

	

	
	
	

}
