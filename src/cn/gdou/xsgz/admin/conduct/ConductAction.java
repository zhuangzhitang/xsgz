package cn.gdou.xsgz.admin.conduct;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.struts2.ServletActionContext;


import cn.gdou.xsgz.admin.conduct.service.ConductService;
import cn.gdou.xsgz.domain.Admin;
import cn.gdou.xsgz.domain.ConductHaveNext;
import cn.gdou.xsgz.domain.Conductitem;

import com.opensymphony.xwork2.ActionSupport;

public class ConductAction extends ActionSupport{
	private String year;
	private Integer item;
	private Double score;
	private String allStudent;
	private ConductService conductService=new ConductService();
	private Conductitem conductitem;
	
    public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public Integer getItem() {
		return item;
	}

	public void setItem(Integer item) {
		this.item = item;
	}

	public Double getScore() {
		return score;
	}

	public void setScore(Double score) {
		this.score = score;
	}

	public Conductitem getConductitem() {
		return conductitem;
	}

	public void setConductitem(Conductitem conductitem) {
		this.conductitem = conductitem;
	}

	public String getAllStudent() {
		return allStudent;
	}

	public void setAllStudent(String allStudent) {
		this.allStudent = allStudent;
	}
	
	public void getSecondConduct() throws IOException{
    	int firstId=Integer.parseInt(ServletActionContext.getRequest().getParameter("firstId"));
    	PrintWriter p=ServletActionContext.getResponse().getWriter();
		p.print(conductService.getSecondConduct(firstId));
		p.close();
		
    }
    
    public void getSchooltyear() throws IOException{
    	PrintWriter p=ServletActionContext.getResponse().getWriter();
		p.print(conductService.getSchoolyear());
		p.close();
    }
 
    public void insertConduct() throws IOException{
    	JSONObject jsonObject=conductService.insertConduct(conductitem);
    	PrintWriter p=ServletActionContext.getResponse().getWriter();
    	p.print(jsonObject);
    	p.close();
    	
    }
    public void getAcademy() throws IOException{
    	Admin admin=(Admin)ServletActionContext.getRequest().getSession().getAttribute("user");
    	JSONArray jsonArray=conductService.getAcademy(admin);
    	PrintWriter p=ServletActionContext.getResponse().getWriter();
    	p.print(jsonArray);
    	p.close();
    }
	
    public void getMajor() throws IOException{
    	Admin admin=(Admin)ServletActionContext.getRequest().getSession().getAttribute("user");
    	Integer academyId=Integer.parseInt(ServletActionContext.getRequest().getParameter("academyId"));
    	JSONArray jsonArray=conductService.getMajor(admin,academyId);
    	PrintWriter p=ServletActionContext.getResponse().getWriter();
    	p.print(jsonArray);
    	p.close();
    }
    
    public void getClassWithMajor() throws IOException{
    	Integer majorId=Integer.parseInt(ServletActionContext.getRequest().getParameter("majorId"));
    	JSONArray jsonArray=conductService.getClassWithMajor(majorId);
    	PrintWriter p=ServletActionContext.getResponse().getWriter();
    	p.print(jsonArray);
    	p.close();
    }
    public void getStudent() throws IOException{
    	Integer classId=Integer.parseInt(ServletActionContext.getRequest().getParameter("classId"));
    	JSONArray jsonArray=conductService.getStudent(classId);
    	//System.out.println(jsonArray.toString());
    	PrintWriter p=ServletActionContext.getResponse().getWriter();
    	p.print(jsonArray);
    	p.close();
    }
    
    public void getConductItem() throws IOException{
    	String schoolyear=ServletActionContext.getRequest().getParameter("schoolYear");
        JSONArray jsonArray=conductService.getConductItem(schoolyear);
        PrintWriter p=ServletActionContext.getResponse().getWriter();
       // System.out.println(jsonArray.toString());
    	p.print(jsonArray);
    	p.close();
    }
    
    public void insertConductScore() throws IOException{
    	List<String> studentNumList=Arrays.asList(allStudent.split("D"));
    	int i=0;
    	if(item>0){
    		 i=conductService.insertConductNotNextScore(item,year,studentNumList,score);
    	}else if(item<0){
    		item=0-item;
    		i=conductService.insertConductItemScore(item,year,studentNumList,score);
    	}
    	JSONObject jsonObject=new JSONObject();
    	if(i>0){
    		jsonObject.put("message","添加操行分数成功");
    	}else{
    		jsonObject.put("message","添加操行分数失败，请重新操作");
    	}
    	PrintWriter p=ServletActionContext.getResponse().getWriter();
    	p.print(jsonObject);
    	p.close();
    }

}
