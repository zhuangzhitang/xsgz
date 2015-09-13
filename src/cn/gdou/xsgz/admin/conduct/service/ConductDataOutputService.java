package cn.gdou.xsgz.admin.conduct.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import cn.gdou.xsgz.admin.base.dao.ClassDao;
import cn.gdou.xsgz.admin.conduct.dao.ConductDataOutputDao;
import cn.gdou.xsgz.domain.Conduct;
import cn.gdou.xsgz.domain.ConductVo;
import cn.gdou.xsgz.domain.Student;
import cn.gdou.xsgz.student.dao.StudentDao;
import cn.gdou.xsgz.util.CreateExcelUtil;

public class ConductDataOutputService {
	private ConductDataOutputDao dao=new ConductDataOutputDao();
	private StudentDao stuDao=new StudentDao();
	private ClassDao classDao=ClassDao.getClassDaoInstance();
	/**
	 * 查找出一个班的每一个学生的操行分具体
	 * @param classId
	 * @param schoolyear
	 * @return
	 */
    public List<Conduct> queryAllClassConduct(Integer classId,String schoolyear){
    	List<Conduct> list=new ArrayList<Conduct>();
    	List<Student> studentlist=stuDao.getStudentsByClassId(classId);
    	for(Student s:studentlist){
    		Conduct c=new Conduct();
    		c.setStudent(s);
    		Map<Integer,Double> notnextScoreMap=dao.queryNotNextScore(s.getStudentNum(),schoolyear);
    	    Map<Integer,Double>  jiafengScoreMap=dao.queryjiafengScore(s.getStudentNum(),schoolyear);      
    		Map<Integer,Double>  koufengScoreMap=dao.querykoufengScore(s.getStudentNum(),schoolyear);       
    		Map<Integer,Double>  jishuScoreMap=dao.queryjishuScore(s.getStudentNum(),schoolyear);  
    		
    		c.setJiafengScoreMap(jiafengScoreMap);
    		c.setKoufengScoreMap(koufengScoreMap);
    		c.setJishuScoreMap(jishuScoreMap);
    		c.setNotnextScoreMap(notnextScoreMap);
    		
    		c.setJiafengAllScore(getSum(jiafengScoreMap));  
    		c.setKoufengAllScore(getSum(koufengScoreMap));   //为负数
    		c.setJishuAllScore(getSum(jishuScoreMap));
    		c.setAllScore(getSum(jiafengScoreMap)+getSum(koufengScoreMap)+getSum(jishuScoreMap)+getSum(notnextScoreMap)+11);
    		
    		list.add(c);
    	}
    	return list;
    }
    /**
     * 根据传入的学号和学年查找出该学年该学生操行分的详细信息
     * @param studentnum  学号
     * @param schoolyear   学年
     * @return
     */
    public Conduct queryConductByStudentNum(String studentnum,String schoolyear){
    	Conduct c=new Conduct();
    	Student s=new Student();
    	s.setStudentNum(studentnum);
		c.setStudent(s);
		Map<Integer,Double> notnextScoreMap=dao.queryNotNextScoreForShowConduct(studentnum,schoolyear);
	    Map<Integer,Double>  jiafengScoreMap=dao.queryjiafengScoreForShowConduct(studentnum,schoolyear);      
		Map<Integer,Double>  koufengScoreMap=dao.querykoufengScoreForShowConduct(studentnum,schoolyear);       
		Map<Integer,Double>  jishuScoreMap=dao.queryjishuScoreForShowConduct(studentnum,schoolyear);  
		
		c.setJiafengScoreMap(jiafengScoreMap);
		c.setKoufengScoreMap(koufengScoreMap);
		c.setJishuScoreMap(jishuScoreMap);
		c.setNotnextScoreMap(notnextScoreMap);
		
		c.setJiafengAllScore(getSum(jiafengScoreMap));  
		c.setKoufengAllScore(getSum(koufengScoreMap));   //为负数
		c.setJishuAllScore(getSum(jishuScoreMap));
		c.setAllScore(getSum(jiafengScoreMap)+getSum(koufengScoreMap)+getSum(jishuScoreMap)+getSum(notnextScoreMap)+11);
		return c;
    }
    
    /**
     * 展示操行分
     * @description
     * @param map
     * @return
     * 
     */
    public List<ConductVo> getConductsByNumAndYear(String studentNum,String schoolYear){
    	List<ConductVo> list = new ArrayList<ConductVo>();
    	Conduct conduct = queryConductByStudentNum(studentNum, schoolYear);
    	Map<Integer, Double> notnextScoreMap = conduct.getNotnextScoreMap();
    	for (Entry<Integer, Double> entry: notnextScoreMap.entrySet()) {
			int id  = entry.getKey();
			String conductName = dao.queryConductNameById(id).split("\\|")[1];
		
			Double conductScore = entry.getValue();
			ConductVo vo = new ConductVo(id, conductName, conductScore);
			list.add(vo);
			
		}
    	Map<Integer, Double> jiafengScoreMap = conduct.getJiafengScoreMap();
    	for (Entry<Integer, Double> entry: jiafengScoreMap.entrySet()) {
			int id  = entry.getKey();
			String conductName = dao.queryConductNameById(id);
			Double conductScore = entry.getValue();
			ConductVo vo = new ConductVo(id, conductName, conductScore);
			list.add(vo);
			
		}
    	Map<Integer, Double> koufengScoreMap = conduct.getKoufengScoreMap();
    	for (Entry<Integer, Double> entry: koufengScoreMap.entrySet()) {
			int id  = entry.getKey();
			String conductName = dao.queryConductNameById(id);
			Double conductScore = entry.getValue();
			ConductVo vo = new ConductVo(id, conductName, conductScore);
			list.add(vo);
			
		}
    	Map<Integer, Double> jishuScoreMap = conduct.getJishuScoreMap();
    	for (Entry<Integer, Double> entry: jishuScoreMap.entrySet()) {
			int id  = entry.getKey();
			String conductName = dao.queryConductNameById(id);
			Double conductScore = entry.getValue();
			ConductVo vo = new ConductVo(id, conductName, conductScore);
			list.add(vo);
			
		}
    	return list;
    }
    
    public Double getSum(Map<Integer,Double> map){
    	Double d=0.0;
    	for(Integer i:map.keySet()){
    		d+=map.get(i);
    	}
    	return d;
    }
    
    public void createConductExcel(Integer classId,String year) throws UnsupportedEncodingException{
    	String className=classDao.getClassByClassId(classId).getClassName();
    	List<Conduct> conductList=queryAllClassConduct(classId,year);
    	Map<Integer,List<Integer>> allConductitemMap=dao.queryConductItemByClassIdAndYear(classId, year);
    	HSSFWorkbook wb=CreateExcelUtil.createConductExcel(className,conductList,allConductitemMap);
    	//【2014-2015学年】【计科1123】班操行分情况表
    	 String fileName=ServletActionContext.getServletContext().getRealPath("/file/excel")+"/"+year+"学年"+className+"班操行分情况表.xls";
 		 //将excel文件写出
 		 CreateExcelUtil.outputExcel(new String(fileName.getBytes(),"ISO8859-1"), wb);
    }
    
    /**
	 * 更新操行分学分
	 * @param id
	 * @param score
	 * @return
	 */
	public String updateConductScoreById(Integer id,String score){
		 int result =  dao.updateConductScoreById(id, score);
		 if(result ==1){
			 return "success";
		 }else{
			 return "修改成绩失败，稍后再试";
		 }
	}
}
