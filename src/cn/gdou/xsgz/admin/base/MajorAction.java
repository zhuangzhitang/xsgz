package cn.gdou.xsgz.admin.base;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;
import net.sf.json.processors.JsonBeanProcessor;

import org.apache.struts2.ServletActionContext;

import cn.gdou.xsgz.admin.base.service.MajorService;
import cn.gdou.xsgz.domain.Admin;
import cn.gdou.xsgz.domain.Major;
import cn.gdou.xsgz.util.GenericUtil;

import com.opensymphony.xwork2.ActionSupport;

import flexjson.JSONSerializer;

/**
 * 专业Action:处理关于Academy请求
 * @author 刘楚燮
 * @modify 李楚富 2014-12-12 16:01:23
 * @modify 庄智堂 2015-04-27 19:15::22
 * @version 2014-9-19
 */

@SuppressWarnings("serial")
public class MajorAction extends ActionSupport{
	private MajorService service = MajorService.getNajorServiceInstance();
	
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
	 * 查询某个学院下的所有专业
	 * @author 李楚富
	 */
	public void getMajorsByAcademyId(Integer academyId) throws IOException{
		List<Major> list = service.listMajorByAcademyId(academyId);
		
		JSONSerializer jsonRows = new JSONSerializer();
        String  jsonStr =jsonRows.serialize(list); 
		
        printJson(jsonStr);
	}
	
	/**
	 * 添加专业
	 * @author 庄智堂
	 */
	public void role1AddMajor() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		Object user = req.getSession().getAttribute("user");
		Admin admin = (Admin) user;
		int academyId = admin.getSubjectId();
		String majorName = req.getParameter("majorName");
		/**
		 * 判断专业名称是否存在
		 */
		int i = service.isExistMajorName(majorName);
		 if(i==1){//专业名称已经存在
			    JSONObject json = GenericUtil.getOperateJSONObject("1", "专业信息已经存在");
				printJson(json);
				return ;
			}
		String shortName = req.getParameter("shortName");
		String counselor = req.getParameter("counselor");
		String tel = req.getParameter("tel");
		
		Major major = new Major();
		major.setAcademyId(academyId);
		major.setCounselor(counselor);
		major.setMajorName(majorName);
		major.setShortName(shortName);
		major.setTel(tel);
		
		String result = service.add(major);
		
		String successMsg = "添加专业成功！";
		JSONObject json = GenericUtil.getOperateJSONObject(result, successMsg);
		
		printJson(json);
	}
	
	/**
	 * 修改专业
	 * @author 庄智堂
	 */
	public void role1EditMajor() throws IOException{
		this.role0EditMajor();
	}
	
	/**
	 * 删除专业
	 * @author 庄智堂
	 */
	public void role1DestoryMajor() throws IOException{
		this.role0DestoryMajor();
	}
	/* --------------------------------- ↓ 院级管理员调用的方法 ↓ --------------------------------- */
	
	/**
	 * 查询某个学院下的所有专业（院级管理员调用）
	 * @author 李楚富
	 */
	public void role1GetMajorsByAcademyId() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		Object user = req.getSession().getAttribute("user");
		Admin admin = (Admin) user;
		getMajorsByAcademyId(admin.getSubjectId());
	}
	
	/* --------------------------------- ↓ 超级管理员调用的方法 ↓ --------------------------------- */
	/**
	 * 查询某个学院下的所有专业（超级管理员调用）
	 * @author 李楚富
	 */
	public void getMajorsByAcademyId() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		String academyId = req.getParameter("academyId");
		getMajorsByAcademyId(Integer.parseInt(academyId));
	}
	
	/**
	 * 添加专业
	 * @author 庄智堂
	 */
	public void role0AddMajor() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		int academyId = Integer.parseInt(req.getParameter("academyId"));
		String majorName = req.getParameter("majorName");
		/**
		 * 判断专业名称是否存在
		 */
		int i = service.isExistMajorName(majorName);
		 if(i==1){//专业名称已经存在
			    JSONObject json = GenericUtil.getOperateJSONObject("1", "专业信息已经存在");
				printJson(json);
				return ;
			}
		String shortName = req.getParameter("shortName");
		String counselor = req.getParameter("counselor");
		String tel = req.getParameter("tel");
		
		Major major = new Major();
		major.setAcademyId(academyId);
		major.setCounselor(counselor);
		major.setMajorName(majorName);
		major.setShortName(shortName);
		major.setTel(tel);
		
		String result = service.add(major);
		
		String successMsg = "添加专业成功！";
		JSONObject json = GenericUtil.getOperateJSONObject(result, successMsg);
		
		printJson(json);
	}
	
	/**
	 * 修改专业
	 * @author 庄智堂
	 */
	public void role0EditMajor() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		int academyId = Integer.parseInt(req.getParameter("academyId"));
		int majorId = Integer.parseInt(req.getParameter("majorId"));
		String majorName = req.getParameter("majorName");
		/**
		 * 判断专业名称是否存在
		 */
		int i = service.isExistMajorName(majorName);
		 if(i==1){//专业名称已经存在
			    JSONObject json = GenericUtil.getOperateJSONObject("1", "专业信息已经存在");
				printJson(json);
				return ;
			}
		String shortName = req.getParameter("shortName");
		String counselor = req.getParameter("counselor");
		String tel = req.getParameter("tel");
		
		Major major = new Major();
		major.setMajorId(majorId);
		major.setAcademyId(academyId);
		major.setCounselor(counselor);
		major.setMajorName(majorName);
		major.setShortName(shortName);
		major.setTel(tel);
		
		String result = service.update(major);
		
		String successMsg = "修改专业信息成功！";
		JSONObject json = GenericUtil.getOperateJSONObject(result, successMsg);
		
		printJson(json);
	}
	
	/**
	 * 删除专业
	 * @author 庄智堂
	 */
	public void role0DestoryMajor() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		int majorId = Integer.parseInt(req.getParameter("majorId"));
		String result = service.delete(majorId);
		String successMsg = "删除专业信息成功！";
		JSONObject json = GenericUtil.getOperateJSONObject(result, successMsg);
		
		printJson(json);
	}
	
	/* --------------------------------- ↑ 超级管理员调用的方法 ↑ --------------------------------- */
}
