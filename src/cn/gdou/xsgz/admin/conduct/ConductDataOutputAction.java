package cn.gdou.xsgz.admin.conduct;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.apache.struts2.ServletActionContext;

import cn.gdou.xsgz.admin.base.service.ClassService;
import cn.gdou.xsgz.admin.base.service.MajorService;
import cn.gdou.xsgz.admin.conduct.service.ConductDataOutputService;

public class ConductDataOutputAction {
	    private Integer aca; //学院Id
	    private Integer major; //专业Id
	    private Integer cla;   //班级Id
	    private String year;    //学年
	    
	    private String fileName;  //文件的名字
	    private InputStream input;  //文件下载必备的输入流
	    private ConductDataOutputService service=new ConductDataOutputService();
	    public ConductDataOutputAction(){}
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
	         * 【2014-2015学年】【计科1123】班操行分情况表
	         */
			ClassService classService=new ClassService();
			String className=classService.getClassByClassId(cla).getClassName();
			String filename=year+"学年"+className+"班操行分情况表.xls";
		    return new String(filename.getBytes(),"ISO8859-1");
		}
		public void setFileName(String fileName) {
			this.fileName = fileName;
		}
		/**
		 * 获得文件下载必备的读取流
		 * @return
		 * @throws FileNotFoundException
		 * @throws UnsupportedEncodingException
		 */
		public InputStream getInput() throws FileNotFoundException, UnsupportedEncodingException {
			String filename=getFileName();
			service.createConductExcel(cla,year);
			return new FileInputStream(ServletActionContext.getServletContext()
					.getRealPath("/file/excel")+"/"+filename);
		}
		public void setInput(InputStream input) {
			this.input = input;
		}
	    
		public String downDataTable(){
			return "download";
		}
		
		
}
