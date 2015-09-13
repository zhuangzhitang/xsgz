package cn.gdou.xsgz.admin.scholarships.service;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.util.Region;
import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONObject;

import cn.gdou.xsgz.admin.base.dao.AcademyDao;
import cn.gdou.xsgz.admin.base.dao.ClassDao;
import cn.gdou.xsgz.admin.base.dao.MajorDao;
import cn.gdou.xsgz.admin.base.service.ClassService;
import cn.gdou.xsgz.admin.scholarships.dao.CourseDao;
import cn.gdou.xsgz.admin.scholarships.dao.ScholarshipsDataOutputDao;
import cn.gdou.xsgz.domain.Class;
import cn.gdou.xsgz.domain.Course;
import cn.gdou.xsgz.domain.Score;
import cn.gdou.xsgz.domain.ScoreAndConduct;
import cn.gdou.xsgz.domain.ScoreResult;
import cn.gdou.xsgz.domain.Student;
import cn.gdou.xsgz.student.dao.StudentDao;
import cn.gdou.xsgz.util.CreateExcelUtil;
import cn.gdou.xsgz.util.ExportExcel;

public class ScholarshipsDataOutputService {
	 private ClassService classService=new ClassService();
	 private ScholarshipsDataOutputDao dao=new ScholarshipsDataOutputDao();
	 private ClassDao classDao=ClassDao.getClassDaoInstance();
	 private AcademyDao acaDao=new AcademyDao();
	 private MajorDao majorDao=MajorDao.getMajorDaoInstance();
	 private CourseDao courseDao=new CourseDao();
	 private StudentDao studentDao=new StudentDao();
	 /**
	  * 判断两个班是否已经导入成绩
	  * @param classId
	  * @return
	  */
     public boolean ishasScore(Integer classId,String schoolyear){
    	  if(dao.ishasScore(classId, schoolyear)){
			String className=classService.getClassByClassId(classId).getClassName();
			Class cla=getNextClass(className);
			if(cla==null){
				return true;
			}
			Integer nextclassId=cla.getClassId();
			return dao.ishasScore(nextclassId, schoolyear);
    	  }else{
			return false;
    	  }
     }
     
    /**
     * 验证整个系的相关班级是否导入成绩
     */
     public boolean ishasScoreAllMajor(Integer majorId,String schoolyear){
          int year=Integer.parseInt(schoolyear.split("\\-")[0]);
    	  int[] grade=new int[]{year,year-1,year-2};
    	  List<Class> classList=dao.queryAllClassByMajorId(grade,majorId);
		  for(Class c:classList){
			  if(!dao.ishasScore(c.getClassId(), schoolyear)){
				  return false;
			  }
		  }
		  return true;
     }
     
     /**
      * 判断该专业全系是否已经产生了成绩的统计结果
      * @param majorId
      * @param schoolyear
      * @return
      */
     public boolean ishasScoreResultMajor(Integer majorId,String schoolyear){
    	 int year=Integer.parseInt(schoolyear.split("\\-")[0]);
   	     int[] grade=new int[]{year,year-1,year-2};
   	     List<Class> classList=dao.queryAllClassByMajorId(grade,majorId);
    	  for(Class c:classList){
    		 if(!dao.ishasScoreResultMajor(c.getClassId(), schoolyear)){
    			 return false;
    		 }
    	  }
    	  return true;
     }
     /**
      * (ˇˍˇ) 向ClassScore表添加某个学年某个班已经产生统计结果的信息。
      * @param classId 
      * @param year
      */
     public void insertClassScore(Integer classId, String year){
    	 dao.insertClassScore(classId, year);
     }
     /**
      * 获得一个系的奖学金获得者名单，key为奖学金的等级，value为学生对象。
      * @param major  系Id
      * @param year   学年
      * @return
      */
     public Map<Integer,List<Student>> getStudentByjiangxuejing(Integer major,String year){
    	 List<ScoreResult> scoreresultList=dao.queryScoreResult(major,year);
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
			return map;
     }
     /**
      * 生成并且写出全系的奖学金获得者名单的excel表格
      * @param major
      * @param aca
      * @param year
      * @throws UnsupportedEncodingException
      */
     public void createhuodezheExcel(Integer major,Integer aca,String year, Map<Integer,List<Student>> map) throws UnsupportedEncodingException{
			String majorName=majorDao.queryMajorById(major).getShortName();
			HSSFWorkbook wb=new HSSFWorkbook();
			wb=CreateExcelUtil.createhuodezheExcel(map, majorName, year, wb);
			//【2014-2015学年】【计科】系奖学金获得者名单 3
			 String fileName=ServletActionContext.getServletContext().getRealPath("/file/excel")+"/"+year+"学年"+majorName+"系奖学金获得者名单.xls";
	 		 //将excel文件写出
	 		 CreateExcelUtil.outputExcel(new String(fileName.getBytes(),"ISO8859-1"), wb);
     }
	public void createThirdExcel(Integer major,Integer aca,String year) throws IOException{
		/**
		 * 从Scoreresult表中查询数据
		 *     1如果不存在数据，则进行重新统计获取数据
		 *        1.1 同样判断成绩有无导入
		 *        1.2生成excel表格
		 *        1.3将结果存入scoreResult表中
		 *     2 如果存在数据，生成excel表格
		 */
		JSONObject jsonObject=new JSONObject();
		if(ishasScoreResultMajor(major, year)){
			//生成表格
		    Map<Integer,List<Student>> map=getStudentByjiangxuejing(major, year);
			createhuodezheExcel(major, aca, year,map);
		}else{
			if(ishasScoreAllMajor(major, year)){
				/**
				 * 重新进行统计，将结果存入scoreResult表中，生成每个班的综合测评表和全系综合测评表
				 * 设置已经统计的标志
				 * 
				 */
				againgetScoreResultAllMajor(major, aca, year);
				Map<Integer,List<Student>> map=getStudentByjiangxuejing(major, year);
				//生成全系奖学金获得者名单的表格
				createhuodezheExcel(major, aca, year,map);
				
			}else{
				//未导入成绩
				jsonObject.put("message","您尚未导入系中相关班级的成绩，无法生成相应的表格");
				PrintWriter p=ServletActionContext.getResponse().getWriter();
				p.print(jsonObject);
				p.close();
			}
		}
	}

	public void createFourExcel(Integer major, String year,Integer aca) throws IOException {
		JSONObject jsonObject=new JSONObject();
		if(ishasScoreResultMajor(major, year)){
			//生成表格
			Map<Integer,List<Student>> map=getStudentByjiangxuejing(major, year);
			String majorName=majorDao.queryMajorById(major).getShortName();
			HSSFWorkbook wb=new HSSFWorkbook();
			wb=CreateExcelUtil.createfafangExcel(map, majorName, year, wb);
			//【2014-2015学年】【计科】系奖学金发放表 
			String fileName=ServletActionContext.getServletContext().getRealPath("/file/excel")+"/"+year+"学年"+majorName+"系奖学金发放表.xls";
	 		 //将excel文件写出
	 		 CreateExcelUtil.outputExcel(new String(fileName.getBytes(),"ISO8859-1"), wb);
		}else{
			if(ishasScoreAllMajor(major, year)){
				/**
				 * 重新进行统计，将结果存入scoreResult表中，
				 * 设置已经统计的标志，
				 * 生成excel表格
				 */
				againgetScoreResultAllMajor(major, aca, year);
				Map<Integer,List<Student>> map=getStudentByjiangxuejing(major, year);
				//生成全系奖学金获得者名单的表格
				createhuodezheExcel(major, aca, year,map);
				//生成全系奖学金发放表格
				String majorName=majorDao.queryMajorById(major).getShortName();
				HSSFWorkbook wb=new HSSFWorkbook();
				wb=CreateExcelUtil.createfafangExcel(map, majorName, year, wb);
				//【2014-2015学年】【计科】系奖学金发放表 
				String fileName=ServletActionContext.getServletContext().getRealPath("/file/excel")+"/"+year+"学年"+majorName+"系奖学金发放表.xls";
				
		 		 //将excel文件写出
		 		 CreateExcelUtil.outputExcel(new String(fileName.getBytes(),"ISO8859-1"), wb);
			}else{
				//未导入成绩
				jsonObject.put("message","您尚未导入系中相关班级的成绩，无法生成相应的表格");
				PrintWriter p=ServletActionContext.getResponse().getWriter();
				p.print(jsonObject);
				p.close();
			}
		}
		
	}
	public void createFirstExcel(Integer aca,Integer major,Integer cla, String year) throws IOException {
		 /**
		  * 1.判断相应的成绩有无导入（即两个班的成绩是否导入）
		  * 2.生成excel表格
		  * 3.将统计的结果存入或更新进入scoreResult表中，并且在classScore表中加入已经统计的班级。
		  * 
		  */
		JSONObject jsonObject=new JSONObject();
		if(ishasScore(cla, year)){
			 createZongheCePingAllMajor(null, aca, major, cla, year);
		}else{
			//未导入成绩
			jsonObject.put("message","您尚未导入相关班级的成绩，无法生成相应的表格");
			PrintWriter p=ServletActionContext.getResponse().getWriter();
			p.print(jsonObject);
			p.close();
		}
	}
	/**
	 * 如果有更好的方法，请进行优化 ，进行奖学金的评定
	 * @param studentnum
	 * @param twoscList
	 * @return
	 */
  private List<ScoreAndConduct> pingjiangxuejing(int studentnum,
			List<ScoreAndConduct> twoscList) {
	     BigDecimal firstnum=new BigDecimal(studentnum*0.03).setScale(0, BigDecimal.ROUND_HALF_UP);
		 BigDecimal secondnum=new BigDecimal(studentnum*0.07).setScale(0, BigDecimal.ROUND_HALF_UP);
		 BigDecimal thirdnum=new BigDecimal(studentnum*0.2).setScale(0, BigDecimal.ROUND_HALF_UP);
		 int first=firstnum.intValue();  //一等奖人数
		 int second=secondnum.intValue();  //二等奖人数
		 int third=thirdnum.intValue();    //三等奖人数
		
		 Map<Integer,ScoreAndConduct> map=new TreeMap<Integer, ScoreAndConduct>();
		 Map<Integer,ScoreAndConduct> otherMap=new TreeMap<Integer, ScoreAndConduct>();
		 for(int i=1;i<twoscList.size()+1;i++){
			 map.put(i,twoscList.get(i-1));
			 otherMap.put(i,twoscList.get(i-1));
		 }
		List<Integer> list=new ArrayList<Integer>();
		 for(Integer i:otherMap.keySet()){
			 ScoreAndConduct sc=otherMap.get(i);
			 if(sc.getGuakeNUm()>0){
				list.add(i);
			 }
		 }
		for(Integer i:list){
			otherMap.remove(i);
		}
		Integer[] iarray=new Integer[otherMap.keySet().size()]; 
		otherMap.keySet().toArray(iarray);
		for(Integer i=1;i<iarray.length+1;i++){
			ScoreAndConduct sc=map.get(iarray[i-1]);
			 if(i<=first){
				 sc.setNum("一");
			 }else if(i>first&&i<=second+first){
				 sc.setNum("二");
			 }else if(i>second+first&&i<=first+second+third){
				 sc.setNum("三");
			 }else{
				 sc.setNum("");
			 }
		}
		List<ScoreAndConduct> sList=new ArrayList<ScoreAndConduct>();
		for(Integer i:map.keySet()){
			sList.add(map.get(i));
		}
		return sList;
	}

/**
    * 
    * @param scList  要排序的集合
    * @param i       id 值。0代表按照学业成绩排序，1代表按照操行分拍照，2代表按照总评排序
    * @return
    */
	public List<ScoreAndConduct> getAlreadySortArray(List<ScoreAndConduct> scList,
			int i) {
		ScoreAndConduct[] array=new ScoreAndConduct[scList.size()];
		scList.toArray(array);
		if(i==0){
		  Arrays.sort(array,new MyComparator1());
		  for(int j=0;j<array.length;j++){
				 array[j].setAvgScoreNum(j+1);
		  }
		}else if(i==1){
	      Arrays.sort(array,new MyComparator2());
	      for(int j=0;j<array.length;j++){
				 array[j].setCaoxingScoreNum(j+1);
		  }
		}else if(i==3){
		  Arrays.sort(array);
		  for(int j=0;j<array.length;j++){
				 array[j].setAllscoreNum(j+1);
		  }
		}
		return Arrays.asList(array);
	}
	/**
	 * 创建整个系的综合测评表，同时生成每个班的综合测评表（注：当传入的majorwb 为空的时候，调用该方法生成一个班的综合测评表）
	 * @param majorwb   全系综合测评表的excel对象
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
    public HSSFWorkbook createZongheCePingAllMajor(HSSFWorkbook majorwb,Integer aca,Integer major,Integer cla, String year) throws UnsupportedEncodingException{
    	//院名
		 String acaName=acaDao.queryAcademyById(aca).getAcademyName();
		 //系名
		 String majorName=majorDao.queryMajorById(major).getMajorName();
		 Class c=classDao.getClassByClassId(cla);
		 //班级名
		 String className=c.getClassName();
		 //年级
		 String grade=c.getGrade();
		 grade=(Integer.parseInt(grade)-2000)+"";
		 System.out.println(grade+" 年级");
		 //获取课程集合，并且按照课程id排序
		 List<Course> courseList=courseDao.queryClassAllCourse(year,major,grade);
		 Set<Course> treeSet=new TreeSet<Course>();
		 for(Course course:courseList){
			 treeSet.add(course);
		 }
		 //一个班的统计结果
		 List<ScoreAndConduct> scList=this.getZongheCePingClass(major, cla, year, grade);
		//获得一个班综合测评表的三个名次
		 scList=getAlreadySortArray(scList,0);
		 scList=getAlreadySortArray(scList,1);
		 scList=getAlreadySortArray(scList,3);
		 List<ScoreAndConduct> nextscList=new ArrayList<ScoreAndConduct>();
		 int studentnum=studentDao.getStudentNumByClassId(c.getClassId());
		 Class nextClass=getNextClass(className);
		 String nextClassName="";
		 if(nextClass!=null){
			 nextClassName=nextClass.getClassName();
		     Pattern p=Pattern.compile("(\\D{2,})(\\d{4})");
			 Matcher m=p.matcher(nextClassName);
			 while(m.find()){
				nextClassName=m.group(2);
			 }
			 //相邻的班的统计结果
			  nextscList=this.getZongheCePingClass(major,nextClass.getClassId(), year, grade);
			 //两个班的总人数
			  studentnum=studentnum+studentDao.getStudentNumByClassId(nextClass.getClassId());
		 }
		 //两个班的统计结果
		 List<ScoreAndConduct> twoscList=new ArrayList<ScoreAndConduct>();
		 twoscList.addAll(scList);
		 twoscList.addAll(nextscList);
		//获得两个班综合测评表的三个名次
		 twoscList=getAlreadySortArray(twoscList,0);
		 twoscList=getAlreadySortArray(twoscList,1);
		 twoscList=getAlreadySortArray(twoscList,3);
		 int daji=Integer.parseInt(year.split("\\-")[0])-2000-Integer.parseInt(grade)+1;       //大几
		 HSSFWorkbook wb = new HSSFWorkbook();  
		
		  //评定奖学金
		 twoscList=pingjiangxuejing(studentnum,twoscList);
		 
		 if(daji==3||daji==4){
			 wb=CreateExcelUtil.createZongheSheetNoSport(scList,treeSet,acaName,majorName,className,year,wb);
			 if(nextClassName.equals("")){
				 if(majorwb!=null){
				   majorwb=CreateExcelUtil.createZongheSheetNoSport(twoscList,treeSet,acaName,majorName,className,year,majorwb);
				 }
			 }else{
				 wb=CreateExcelUtil.createZongheSheetNoSport(twoscList,treeSet,acaName,majorName,className+"-"+nextClassName,year,wb);
				 if(majorwb!=null){
				   majorwb=CreateExcelUtil.createZongheSheetNoSport(twoscList,treeSet,acaName,majorName,className+"-"+nextClassName,year,majorwb);
				 }
			 }
			
		 }else if(daji==1||daji==2){
			 wb=CreateExcelUtil.createZongheSheetHaveSport(scList,treeSet,acaName,majorName,className,year,wb);
			 if(nextClassName.equals("")){
				 if(majorwb!=null){
					 majorwb=CreateExcelUtil.createZongheSheetHaveSport(twoscList,treeSet,acaName,majorName,className,year,majorwb);
				 }
			 }else{
				 wb=CreateExcelUtil.createZongheSheetHaveSport(twoscList,treeSet,acaName,majorName,className+"-"+nextClassName,year,wb);
				 if(majorwb!=null){
					 majorwb=CreateExcelUtil.createZongheSheetHaveSport(twoscList,treeSet,acaName,majorName,className+"-"+nextClassName,year,majorwb);
				 }
			 }
		 }
       
		 //将统计结果插入ScoreResult表中
		 for(ScoreAndConduct sc:twoscList){
			 int level=0;
		   if(sc.getNum().equals("一")){
			   level=1;
		   }else if(sc.getNum().equals("二")){
			   level=2;
		   }else if(sc.getNum().equals("三")){
			   level=3;
		   }
		   dao.insertScoreResult(sc.getStudent().getStudentNum(),year,sc.getAllscore(),sc.getGuakeNUm(),sc.getGuakeCredit(),level);
		 }
		 //插入已经统计产生结果的班级和学年到classscore表中
		 dao.insertClassScore(c.getClassId(), year);
		 if(nextClass!=null){
		    dao.insertClassScore(nextClass.getClassId(), year);
		 }
		 /*
		         表格的标准格式
        * 【2014-2015学年】【计科1123】班综合测评表  1
        */
		 String fileName=ServletActionContext.getServletContext().getRealPath("/file/excel")+"/"+year+"学年"+className+"班综合测评表.xls";
		 //将excel文件写出
		 CreateExcelUtil.outputExcel(new String(fileName.getBytes(),"ISO8859-1"), wb);
		 return majorwb;
    }
    /**
     * 重新统计全系的成绩和操行分，并且生成每个班的综合测评表以及全系综合测评表。
     * @param major 系Id
     * @param aca   院Id
     * @param year  学年
     * @throws UnsupportedEncodingException
     */
    public int againgetScoreResultAllMajor(Integer major, Integer aca,String year) throws UnsupportedEncodingException{
	      int y=Integer.parseInt(year.split("\\-")[0]);
	      String majorName=majorDao.queryMajorById(major).getShortName();
	  	  int[] grade=new int[]{y,y-1,y-2};
	  	  List<Class> classList=dao.queryAllClassByMajorId(grade,major);
	  	  /**
	  	   * 对查找出来的班级验证是否已经导入成绩，如果没有导入，删除该班级。（主要是为刷新奖学金名单准备的）
	  	   */
	  	  List<Class> deleteList=new ArrayList<Class>();
	  	  for(Class c:classList){
	  		  if(!ishasScore(c.getClassId(),year)){
	  			  deleteList.add(c);
	  		  }
	  	  }
	  	  classList.removeAll(deleteList);
	  	  if(classList.size()==0){
	  		  return 0;
	  	  }
	  	  List<Integer> classIdList=new ArrayList<Integer>();
	  	  List<Integer> otherList=new ArrayList<Integer>();
	  	  for(Class c:classList){
	  		  String className=c.getClassName();
	  		  Pattern p=Pattern.compile("(\\D{2,})(\\d{4})");
				  Matcher m=p.matcher(className);
			   	  while(m.find()){
					 className=m.group(2);
			     }
			   	  //班级的数目（例如计科1121）的1121为奇数
			   	  if(Integer.parseInt(className)%2==1){
			   		  classIdList.add(c.getClassId());
			   	  }else{
			   		  otherList.add(c.getClassId());
			   	  }
	  	  }
	  	  HSSFWorkbook majorwb=new HSSFWorkbook();
	  	  if(classIdList.size()!=0){
		  	  for(Integer classId:classIdList){
		  		  majorwb=createZongheCePingAllMajor(majorwb, aca, major, classId, year);
		  	  }
		  	 /*
		  	   * 表格的标准格式
		  	   * 【2014-2015学年】【计科】系综合测评表  2
		  	   */
		  	  String fileName=ServletActionContext.getServletContext().getRealPath("/file/excel")+"/"+year+"学年"+majorName+"系综合测评表.xls";
				 //将excel文件写出
			  CreateExcelUtil.outputExcel(new String(fileName.getBytes(),"ISO8859-1"), majorwb);
	  	  }
	  	  //创建另一半班级数目为偶数的班级的综合测评表
	  	  for(Integer classId:otherList){
	  		  createZongheCePingAllMajor(null, aca, major,classId, year);
	  	  }
	  	  return 1;
    }
	public void createSecondExcel(Integer major, Integer aca,String year) throws IOException {
		JSONObject jsonObject=new JSONObject();
		if(ishasScoreAllMajor(major, year)){
			againgetScoreResultAllMajor(major, aca, year);
		}else{
			//未导入成绩
			jsonObject.put("message","您尚未导入系中相关班级的成绩，无法生成相应的表格");
			PrintWriter p=ServletActionContext.getResponse().getWriter();
			p.print(jsonObject);
			p.close();
		}
		
	}
	/**
	 * 统计出一个班的综合测评数据
	 * 
	 * @param major 专业id
	 * @param cla  班级id
	 * @param year  学年
	 * @param grade  年级
	 * @return
	 */
	public List<ScoreAndConduct> getZongheCePingClass(Integer major,Integer cla, String year,String grade){
		 //所有的课程
		 List<Course> courseList=courseDao.queryClassAllCourse(year,major,grade);
	
		 int daji=Integer.parseInt(year.split("\\-")[0])-2000-Integer.parseInt(grade)+1; //大几
		 List<ScoreAndConduct> scList=dao.queryScoreAllStudent(cla, major, Integer.parseInt(grade), year,daji);
		 for(ScoreAndConduct sc:scList){
			//获取操行分
			 sc.setConduct(dao.queryConductAllStudent(sc.getStudent(),year));
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
			 Double credit=0.0;
			 Double scoreCredit=0.0;
			 int guakeShu=0;
			 double guakeCredit=0.0;
			 for(Integer courseId:sc.getScore().keySet()){
				 if(courseId>0){
					 Double cre=courseDao.queryCourseById(courseId).getCredit();
					 credit+=cre;
					 Double s=sc.getScore().get(courseId);
					 if(s<60){
						 scoreCredit+=0;
						 guakeShu++;
						 guakeCredit=guakeCredit+cre;
					 }else{
					   scoreCredit+=(s/10-5)*cre;
					 }
				 }
			 }
			 DecimalFormat df = new DecimalFormat("0.00");
		//	 System.out.println(scoreCredit+"   哈   "+scoreCredit+" ha "+df.format(scoreCredit/scoreCredit));
			 //挂科学分。
			 sc.setGuakeCredit(guakeCredit);
			 Double avgCredit=Double.valueOf(df.format(scoreCredit/credit));  //平均学分绩点
			 sc.setAvgCredit(avgCredit);  //设置平均绩点
			 Map<Integer,Double> conductMap=sc.getConduct();
			 Double caoxingScore=conductMap.get(4)-conductMap.get(5)+11;  //操行总分
			 sc.setCaoxingScore(caoxingScore);
			 Double nengliScore=conductMap.get(1)+conductMap.get(2)+conductMap.get(3)+conductMap.get(6);//能力总分
			 sc.setNengliScore(nengliScore);
			 sc.setGuakeNUm(guakeShu);        //挂科数
			 if(daji==3||daji==4){
				 Double avgScore=Double.valueOf(df.format((avgCredit*10+50)*0.75));
				 sc.setAvgScore(avgScore);   //V6*10+50)*0.75 设置学业成绩
				 sc.setAllscore(avgScore+caoxingScore+nengliScore);  //总评成绩
			 }else if(daji==1||daji==2){
				 Double avgScore=Double.valueOf(df.format((avgCredit*10+50)*0.7));
				 sc.setAvgScore(avgScore);
				 Double sportScore=Double.valueOf(df.format((sc.getScore().get(-1)+sc.getScore().get(-2))*0.05/2)); //体育分
				 sc.setSportscore(sportScore); 
				 Double allScore=Double.valueOf(df.format(avgScore+caoxingScore+nengliScore+sportScore));
				 sc.setAllscore(allScore);   //总评成绩
			 }
		 }
		 return scList;
	}
	/**
	 * 对一个班以及相邻的班的成绩及操行分进行统计
	 * @param major
	 * @param classId
	 * @param year
	 */
    public void getClassScoreResult(Integer major,Integer classId,String year){
		 Class c=classDao.getClassByClassId(classId);
		 //班级名
		 String className=c.getClassName();
		 //年级
		 String grade=c.getGrade();
		 grade=(Integer.parseInt(grade)-2000)+"";
		 System.out.println(grade+" 年级");
		 //获取课程集合，并且按照课程id排序
		 List<Course> courseList=courseDao.queryClassAllCourse(year,major,grade);
		 Set<Course> treeSet=new TreeSet<Course>();
		 for(Course course:courseList){
			 treeSet.add(course);
		 }
		 //一个班的统计结果
		 List<ScoreAndConduct> scList=this.getZongheCePingClass(major, classId, year, grade);
		//获得一个班综合测评表的三个名次
		 scList=getAlreadySortArray(scList,0);
		 scList=getAlreadySortArray(scList,1);
		 scList=getAlreadySortArray(scList,3);
		 List<ScoreAndConduct> nextscList=new ArrayList<ScoreAndConduct>();
		 int studentnum=studentDao.getStudentNumByClassId(c.getClassId());
		 Class nextClass=getNextClass(className);
		 String nextClassName="";
		 if(nextClass!=null){
			 nextClassName=nextClass.getClassName();
		     Pattern p=Pattern.compile("(\\D{2,})(\\d{4})");
			 Matcher m=p.matcher(nextClassName);
			 while(m.find()){
				nextClassName=m.group(2);
			 }
			 //相邻的班的统计结果
			  nextscList=this.getZongheCePingClass(major,nextClass.getClassId(), year, grade);
			 //两个班的总人数
			  studentnum=studentnum+studentDao.getStudentNumByClassId(nextClass.getClassId());
		 }
		 //两个班的统计结果
		 List<ScoreAndConduct> twoscList=new ArrayList<ScoreAndConduct>();
		 twoscList.addAll(scList);
		 twoscList.addAll(nextscList);
		//获得两个班综合测评表的三个名次
		 twoscList=getAlreadySortArray(twoscList,0);
		 twoscList=getAlreadySortArray(twoscList,1);
		 twoscList=getAlreadySortArray(twoscList,3);
		
		  //评定奖学金
		 twoscList=pingjiangxuejing(studentnum,twoscList);
      
		 //将统计结果插入ScoreResult表中
		 for(ScoreAndConduct sc:twoscList){
			 int level=0;
		   if(sc.getNum().equals("一")){
			   level=1;
		   }else if(sc.getNum().equals("二")){
			   level=2;
		   }else if(sc.getNum().equals("三")){
			   level=3;
		   }
		   dao.insertScoreResult(sc.getStudent().getStudentNum(),year,sc.getAllscore(),sc.getGuakeNUm(),sc.getGuakeCredit(),level);
		 }
		 //插入已经统计产生结果的班级和学年到classscore表中
		 dao.insertClassScore(c.getClassId(), year);
		 if(nextClass!=null){
		    dao.insertClassScore(nextClass.getClassId(), year);
		 }
    }
	/**
	 * 获得相邻的班级的对象
	 * @param className
	 * @return
	 */
	
	private Class getNextClass(String className){
		Pattern p=Pattern.compile("(\\D{2,})(\\d{4})");
		Matcher m=p.matcher(className);
		String nextclassName=null;
		if(m.find()){
			String name=m.group(1);
			int i=Integer.parseInt(m.group(2));
			if(i%2==0){
				i=i-1;
			}else{
				i=i+1;
			}
			nextclassName=name+i;
			System.out.println(nextclassName);
		}
		Class cla=classService.getClassByClassName(nextclassName);
		return cla;
	}
   public List<ScoreResult> queryScoreResultByClassId(Integer classId, String year){
	   return dao.queryScoreResultByClassId(classId, year);
   }
   
   /**
    * 根据学号和学年查找出该学生这一学年的所有学科的成绩，包括选修和体育课。
    * @param studnetnum  学号
    * @param scholyear   学年
    * @return
    */
   public List<Score> queryAllScreByStudentnum(String studnetnum,String scholyear){
	 return  dao.queryAllScreByStudentnum(studnetnum, scholyear);
   }
   
   /*
    * 修改成绩
    */
   public String updateScoreById(String id,String grade,String bukao,String chongkao,String qingkao){
		 int result = dao.updateScoreById(id, grade, bukao, chongkao, qingkao);
		 if(result ==1){
			 return "success";
		 }else{
			 return "修改成绩失败，稍后再试";
		 }
   }
}



class MyComparator1 implements Comparator<ScoreAndConduct>{

	@Override
	public int compare(ScoreAndConduct o1, ScoreAndConduct o2) {
		if(o1.getAvgScore()>o2.getAvgScore()){
			return 1;
		}else if(o1.getAvgScore()<o2.getAvgScore()){
			return -1;
		}else{
		  return 0;
		}
	}
	
 }
  
  class MyComparator2 implements Comparator<ScoreAndConduct>{

		@Override
		public int compare(ScoreAndConduct o1, ScoreAndConduct o2) {
			if(o1.getCaoxingScore()>o2.getCaoxingScore()){
				return 1;
			}else if(o1.getCaoxingScore()<o2.getCaoxingScore()){
				return -1;
			}else{
			  return 0;
			}
		}
		
	 }

