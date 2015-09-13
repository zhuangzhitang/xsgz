package cn.gdou.xsgz.admin.scholarships;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;


import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import cn.gdou.xsgz.admin.base.service.ClassService;
import cn.gdou.xsgz.admin.base.service.MajorService;
import cn.gdou.xsgz.admin.scholarships.service.ScholarshipsDataOutputService;
import cn.gdou.xsgz.domain.ScoreResult;
import cn.gdou.xsgz.domain.Student;
import cn.gdou.xsgz.student.service.StudentService;
import cn.gdou.xsgz.util.CreateExcelUtil;

public class ScholarshipsDataOutputAction {
    private Integer dataId; //表格形式
    private Integer aca; //学院Id
    private Integer major; //专业Id
    private Integer cla;   //班级Id
    private String year;    //学年
    
    private String fileName;  //文件的名字
    private InputStream input;  //文件下载必备的输入流
    private ScholarshipsDataOutputService service=new ScholarshipsDataOutputService();
    private StudentService studentService=new StudentService();
    private ClassService classService=new ClassService();
    private MajorService majorService=MajorService.getNajorServiceInstance();
    public ScholarshipsDataOutputAction(){}
	public Integer getDataId() {
		return dataId;
	}
	public void setDataId(Integer dataId) {
		this.dataId = dataId;
	}
	public Integer getAca() {
		return aca;
	}
	public void setAca(Integer aca) {
		this.aca = aca;
	}
	public Integer getMajor() {
		return major;
	}
	public void setMajor(Integer major) {
		this.major = major;
	}
	public Integer getCla() {
		return cla;
	}
	public void setCla(Integer cla) {
		this.cla = cla;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	
	/*
	 * 根据前台的数据获取文件名
	 * 
	 */
	public String getFileName() throws UnsupportedEncodingException {
        /*
         * 表格的标准格式
         * 【2014-2015学年】【计科1123】班综合测评表  1
         * 【2014-2015学年】【计科】系综合测评表  2
         * 【2014-2015学年】【计科】系奖学金获得者名单 3
         * 【2014-2015学年】【计科】系奖学金发放表  4
         */
		MajorService majorService=MajorService.getNajorServiceInstance();
		String majorName=majorService.queryMajorById(major).getShortName();
		String filename=year+"学年";
		if(dataId==1){
			ClassService classService=new ClassService();
			String className=classService.getClassByClassId(cla).getClassName();
			filename+=className+"班综合测评表.xls";
		}else if(dataId==2){
			filename+=majorName+"系综合测评表.xls";
		}else if(dataId==3){
			filename+=majorName+"系奖学金获得者名单.xls";
		}else if(dataId==4){
			filename+=majorName+"系奖学金发放表.xls"; //系奖学金发放表.xls
		}
    	System.out.println(filename);
        return new String(filename.getBytes(),"ISO8859-1");           
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	/**
	 * 获得文件下载必备的读取流
	 * @return
	 * @throws IOException 
	 */
	public InputStream getInput() throws IOException {
		/**
		 *  1.判断是否有该excel文件
		 *  2.如果有，产生输入流
		 *    如果没有，生成excel表格，并将excel表格存于服务器本地
		 */
		
		String fileName=this.getFileName();
		//fileName=URLDecoder.decode(fileName,"UTF-8");
		
		File dir=new File(ServletActionContext.getServletContext()
				.getRealPath("/file/excel")+"/");
		boolean b=false;
		for(String name:dir.list()){
			if(name.equals(fileName)){
				b=true;
				break;
			}
		}
		//如果不存在该文件
		if(!b){
			//生成excel表格
			if(dataId==1){
				System.out.println(ServletActionContext.getServletContext()
						.getRealPath("/file/excel")+"/");
				service.createFirstExcel(aca,major,cla,year);
			}else if(dataId==2){
				service.createSecondExcel(major, aca, year);
			}else if(dataId==3){
				service.createThirdExcel(major,aca,year);
			}else if(dataId==4){
				service.createFourExcel(major,year,aca);
			}
		}
		return new FileInputStream(ServletActionContext.getServletContext()
				.getRealPath("/file/excel")+"/"+fileName);
	}
	public void setInput(InputStream input) {
		this.input = input;
	}
    
	public String downDataTable(){
		return "download";
	}
	
	public void showjiangxuejingByClass() throws IOException{
		String year=ServletActionContext.getRequest().getParameter("year");
		Integer classId=Integer.parseInt(ServletActionContext.getRequest().getParameter("classId"));
		List<ScoreResult> list=service.queryScoreResultByClassId(classId, year);
		if(list.size()==0){
			if(service.ishasScore(classId, year)){
				Integer majorId=classService.getClassByClassId(classId).getMajorId();
				service.getClassScoreResult(majorId, classId, year);
			   list=service.queryScoreResultByClassId(classId, year);
			}else{
				PrintWriter p=ServletActionContext.getResponse().getWriter();
			    p.print("1");
			   	p.close();
			}
		}
		for(ScoreResult s:list){
			String studentName=studentService.queryStudentByStudentNum(s.getStudentNum()).getStudentName();
			s.setStudentName(studentName);
			if(s.getLevel()==1){
				s.setLevelString("一等奖");
			}else if(s.getLevel()==2){
				s.setLevelString("二等奖");
			}else if(s.getLevel()==3){
				s.setLevelString("三等奖");
			}
		}
			JSONArray jsonArray=JSONArray.fromObject(list);
			PrintWriter p=ServletActionContext.getResponse().getWriter();
		    p.print(jsonArray.toString());
		   	p.close();
		
	}
	
	public void refresh() throws IOException{
		Integer acaId=Integer.parseInt(ServletActionContext.getRequest().getParameter("academy0"));
		Integer majorId=Integer.parseInt(ServletActionContext.getRequest().getParameter("major0"));
		String year=ServletActionContext.getRequest().getParameter("year0");
		    //重新生成已经导入成绩的班级的综合测评表格以及全系学生综合测评表
		 int i=service.againgetScoreResultAllMajor(majorId, acaId, year);
		 /**
		  * 如果i=0,则代表此时该系该学年没有一个班导入了成绩，自然不会生成任何表格。
		  */
		 if(i==1){
			Map<Integer,List<Student>> map=service.getStudentByjiangxuejing(majorId, year);
			//重新生成全系奖学金获得者名单的表格
			service.createhuodezheExcel(majorId, acaId, year,map);
			//重新生成全系奖学金发放表格
			String majorName=majorService.queryMajorById(majorId).getShortName();
			HSSFWorkbook wb=new HSSFWorkbook();
			wb=CreateExcelUtil.createfafangExcel(map, majorName, year, wb);
			//【2014-2015学年】【计科】系奖学金发放表 
			String fileName=ServletActionContext.getServletContext().getRealPath("/file/excel")+"/"+year+"学年"+majorName+"系奖学金发放表.xls";
			
	 		 //将excel文件写出
	 		 CreateExcelUtil.outputExcel(new String(fileName.getBytes(),"ISO8859-1"), wb);
		 }
 		 JSONObject jsonObject=new JSONObject();
 		 jsonObject.put("message","重新统计奖学金获得者名单成功");
 	     PrintWriter p=ServletActionContext.getResponse().getWriter();
	     p.print(jsonObject.toString());
	   	 p.close();
 		 
	}
}
