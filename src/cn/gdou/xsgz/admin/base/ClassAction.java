package cn.gdou.xsgz.admin.base;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import cn.gdou.xsgz.admin.base.service.ClassService;
import cn.gdou.xsgz.domain.Admin;
import cn.gdou.xsgz.domain.Class;
import cn.gdou.xsgz.util.GenericUtil;

import com.opensymphony.xwork2.ActionSupport;
import com.sun.xml.internal.bind.v2.model.core.ID;

import flexjson.JSONSerializer;

/**
 * 班级Action:处理关于Class请求
 * @author 庄智堂
 * @date 2015-4-28
 *
 */
@SuppressWarnings("serial")
public class ClassAction extends ActionSupport{
	private static ClassService service = new ClassService();
	
	
	private void printJson(String json) throws IOException{
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		out.print(json);
		out.close();
	}
	
	/**
	 * 输出json
	 * @param json
	 * @author 庄智堂
	 */
	private void printJson(JSONObject json) throws IOException{
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		out.print(json);
		out.close();
	}
	
	/**
	 * 查询某专业下的所有班级
	 * @param majorId  专业ID
	 */
	public void getClasssByMajorId() throws IOException{
		System.out.println("enter ClasssByMajorId");
		HttpServletRequest req = ServletActionContext.getRequest();
		int majorId =Integer.parseInt(req.getParameter("majorId")) ;
		Object user = req.getSession().getAttribute("user");
		Admin admin = (Admin) user;
		System.out.println("majorID:"+admin.getRoleId());
		if(admin.getRoleId() ==2){
			
			majorId = admin.getSubjectId();
		}
		List<Class> list = service.listClassByMajorId(majorId);
		
		JSONSerializer jsonRowS = new JSONSerializer();
		String jsonStr = jsonRowS.serialize(list);
		printJson(jsonStr);
	}
	
	
	/**
	 * 添加班级
	 */
	public void role0AddClass() throws IOException{
		System.out.println("add class");
		
		
		HttpServletRequest req = ServletActionContext.getRequest();
		Object user = req.getSession().getAttribute("user");
		Admin admin = (Admin) user;
		int roleId = admin.getRoleId();
		int majorId ;
		if(roleId ==0||roleId==1){
			 majorId = Integer.parseInt(req.getParameter("majorId"));
		}else{
			majorId = admin.getSubjectId();
		}
		System.out.println("更新majorId:"+majorId);
		String className = req.getParameter("className");
		
		/**
		 * 判断班级是否存在
		 */
		int i = service.isExistClassName(className);
		if(i==1){//班级已经存在
			JSONObject json = GenericUtil.getOperateJSONObject("1", "班级已经存在");
			printJson(json);
		}
		String grade = req.getParameter("grade");
		String classTeacher = req.getParameter("classTeacher");
		String teacherTel = req.getParameter("teacherTel");
		String monitor = req.getParameter("monitor");
		String monitor_connection = req.getParameter("monitor_connection");
		Class class1 = new Class();
		class1.setClassName(className);
		class1.setClassTeacher(classTeacher);
		class1.setGrade(grade);
		class1.setMajorId(majorId);
		class1.setMonitor(monitor);
		class1.setMonitor_connection(monitor_connection);
		class1.setTeacherTel(teacherTel);
		String result = service.add(class1);
		
		String successMsg = "添加班级成功！";
		JSONObject json = GenericUtil.getOperateJSONObject(result, successMsg);
		
		printJson(json);
	}
	
	/**
	 * 修改班级
	 */
	public void role0EditClass() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		int majorId = Integer.parseInt(req.getParameter("majorId"));
		int classId = Integer.parseInt(req.getParameter("classId"));
		String className = req.getParameter("className");
		/**
		 * 判断班级是否存在
		 */
		int i = service.isExistClassName(className);
		if(i==1){//班级已经存在
			JSONObject json = GenericUtil.getOperateJSONObject("1", "班级已经存在");
			printJson(json);
		}
		String grade = req.getParameter("grade");
		String classTeacher = req.getParameter("classTeacher");
		String teacherTel = req.getParameter("teacherTel");
		String monitor = req.getParameter("monitor");
		String monitor_connection = req.getParameter("monitor_connection");
		
		Class class1 = new Class();
		class1.setClassId(classId);
		class1.setClassName(className);
		class1.setClassTeacher(classTeacher);
		class1.setGrade(grade);
		class1.setMajorId(majorId);
		class1.setMonitor(monitor);
		class1.setMonitor_connection(monitor_connection);
		class1.setTeacherTel(teacherTel);
		
		String result = service.update(class1);
		String successMsg = "修改班级成功！";
		JSONObject json = GenericUtil.getOperateJSONObject(result, successMsg);
		
		printJson(json);
	}
	
	/**
	 * 删除班级
	 */
	public void role0DestoryClass() throws IOException{
		System.out.println("-------role0DestoryClass");
		HttpServletRequest req = ServletActionContext.getRequest();
		int classId = Integer.parseInt(req.getParameter("classId"));
		System.out.println("classId:"+classId);
		String result = service.delete(classId);
		String successMsg = "删除班级信息成功！";
		JSONObject json = GenericUtil.getOperateJSONObject(result, successMsg);
		
		printJson(json);
	}
	
}
