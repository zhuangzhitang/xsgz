package cn.gdou.xsgz.admin.system;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import cn.gdou.xsgz.admin.system.service.AdminService;
import cn.gdou.xsgz.domain.Admin;
import cn.gdou.xsgz.domain.Menu;
import cn.gdou.xsgz.util.GenericUtil;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 管理员Action: 用户登录退出和【用户管理】功能
 * 
 * @author 李楚富
 * @version 2014-12-12
 */
@SuppressWarnings("serial")
public class AdminAction extends ActionSupport {
	private  static final AdminService service = new AdminService();
	private Admin admin;
	
	public AdminAction(){
		HttpServletRequest req = ServletActionContext.getRequest();
		Object user = req.getSession().getAttribute("user");
		admin = (Admin) user;
	}
	
	/**
	 * 管理员登录
	 */
	public String login(){
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpSession session = req.getSession();
		String username = req.getParameter("username");		
		
		String sessionCheckCode = (String) session.getAttribute("checkCode");
		if(sessionCheckCode == null){
			session.setAttribute("username", username);
			session.setAttribute("error", "验证码过期，请刷新页面重试！");
			return INPUT;
		}
		
		String reqCheckCode = req.getParameter("checkCode");
		if(StringUtils.isBlank(reqCheckCode)){
			session.setAttribute("username", username);
			session.setAttribute("error", "验证码不能为空!");
			return INPUT;
		}
		//验证码忽略大小写
		if(!reqCheckCode.equalsIgnoreCase(sessionCheckCode)){
			session.setAttribute("username", username);
			session.setAttribute("error", "验证码错误!");
			return INPUT;
		}
		
		if(StringUtils.isBlank(username)){ 
			session.setAttribute("error", "账号不能为空!");
			return INPUT;
		}
		
		String password = req.getParameter("password");
		if(StringUtils.isBlank(password)){
			session.setAttribute("username", username);
			session.setAttribute("error", "密码不能为空!");
			return INPUT;
		}
		
		Admin loginAdmin = new Admin();	
		loginAdmin.setUsername(username);
		loginAdmin.setPassword(password);
		loginAdmin = service.findAdmin(loginAdmin);
		
		if(loginAdmin == null){ //登录失败
			session.setAttribute("username", username);
			session.setAttribute("error", "账号或密码错误!");
			return INPUT;
		}
		
		String subjectName = service.querySubjectName(loginAdmin);
		loginAdmin.setSubjectName(subjectName);
		
		//登录成功，将管理员实体设置到session中
		session.setAttribute("user", loginAdmin);
		session.removeAttribute("username");
		session.removeAttribute("error");
		
		//管理员有权访问的模块功能列表
		Map<String, List<Menu>> menus = service.getMenuList(loginAdmin);
		session.setAttribute("menus", menus);
		
		//记录登陆时间
		service.recordLoginTime(loginAdmin);
		
		// path:       /xsgz
		String path = req.getContextPath();
		// basePath:   http://localhost:8080/xsgz
		String basePath = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+path+"/";
		// adminPath:  http://localhost:8080/xsgz/admin/
		String adminPath = basePath + "admin/";
		// 将网站根路径和管理员访问链接的根路径写到session，这样在每个jsp页面中都可以拿到这两个值^_^
		session.setAttribute("basePath", basePath);
		session.setAttribute("adminPath", adminPath);
		
		return SUCCESS;
	}
	
	/**
	 * 管理员退出
	 */
	public String exit(){
	    ServletActionContext.getContext().getSession().remove("user");
	    return INPUT;
	}
	
	/**
	 * 管理员更改自己的密码
	 */
	public void updateOwnerPassword() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		String oldPassword = req.getParameter("oldPassword");
		String newPassword = req.getParameter("newPassword");
		
		String result = service.updateOwnerPassword(admin, oldPassword, newPassword);
		
		String successMsg = "修改密码成功！";
		JSONObject json = GenericUtil.getOperateJSONObject(result, successMsg);
        
		printJson(json);
	}

	/**
	 * 输出json
	 */
	private void printJson(JSONObject json) throws IOException{
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		out.print(json);
		out.close();
	}

	/* --------------------------------- ↓ 院级管理员调用的方法 ↓ --------------------------------- */
	/**
	 * 院级管理员：查找某个院的所有专业级管理员
	 */
	public void role1GetMajorAdmins() throws IOException{
        JSONObject json = new JSONObject();
        String  jsonStr = service.getMajorAdminsJson(admin.getSubjectId());  
        json.put("rows",jsonStr);         
         
        printJson(json);
	}
	
	/**
	 * 院级管理员：添加专业级管理员
	 */
	public void role1AddMajorAdmin() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		
		String username = req.getParameter("username");		
		String majorId = req.getParameter("majorId");
		String password = req.getParameter("password");
		
		Admin newAdmin = new Admin();
		newAdmin.setUsername(username);
		/* 专业级管理员的subjectId存放的是专业Id */
		newAdmin.setSubjectId(Integer.parseInt(majorId));
		newAdmin.setPassword(password);
		/* 专业级管理员的角色Id = 2 */
		newAdmin.setRoleId(2);
		
		/* 当前用户是院级管理员，SubjectId为院级Id */
		String result = service.addMajorAdmin(newAdmin, admin.getSubjectId());
		
		String successMsg = "添加管理员成功！";
		JSONObject json = GenericUtil.getOperateJSONObject(result, successMsg);
        
		printJson(json);
	}
	
	/**
	 * 院级管理员：修改专业级管理员密码
	 */
	public void	role1ChangeRole2Pwd() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		
		String adminId = req.getParameter("adminId");		
		String password = req.getParameter("password");
		/* 不要轻易相信客户端传来的参数！ */
		//String majorId = req.getParameter("majorId");
		//String username = req.getParameter("username");		
		
		Admin newAdmin = service.getAdminById(Integer.parseInt(adminId));
		newAdmin.setPassword(password);
		
		/* 当前用户是院级管理员，SubjectId为院级Id */
		String result = service.academyAdminChangeMajorAdminPassword(
				newAdmin, admin.getSubjectId());
		
		String successMsg = "密码修改成功！";
		JSONObject json = GenericUtil.getOperateJSONObject(result, successMsg);
        
		printJson(json);
	}
	
	/**
	 * 院级管理员：删除专业级管理员
	 */
	public void	role1DeleteMajorAdmin() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		
		String adminId = req.getParameter("adminId");				
		Admin oldAdmin = service.getAdminById(Integer.parseInt(adminId));
		
		/* 当前用户是院级管理员，SubjectId为院级Id */
		String result = service.deleteMajorAdmin(oldAdmin, admin.getSubjectId());
		
		String successMsg = "删除管理员成功！";
		JSONObject json = GenericUtil.getOperateJSONObject(result, successMsg);
        
		printJson(json);
	}
	/* --------------------------------- ↑ 院级管理员调用的方法 ↑ --------------------------------- */
	
	
	/* --------------------------------- ↓ 超级管理员调用的方法 ↓ --------------------------------- */
	/**
	 * 超级管理员：查找某个院的所有院级管理员
	 */
	public void getAcademyAdmins() throws IOException{
        JSONObject json = new JSONObject();
        String  jsonStr = service.queryAllAcademyAdmins();  
        json.put("rows",jsonStr);         
         
        printJson(json);
	}
	
	/**
	 * 超级管理员：添加管理员
	 */
	public void addAdmin() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		
		String roleId = req.getParameter("roleId");		
		String username = req.getParameter("username");		
		String subjectId = req.getParameter("subjectId");
		String password = req.getParameter("password");
		
		Admin newAdmin = new Admin();
		
		if("1".equals(roleId))
			newAdmin.setRoleId(1);// 院级管理员
		else
			newAdmin.setRoleId(2);// 专业级管理员
		
		newAdmin.setUsername(username);
		newAdmin.setSubjectId(Integer.parseInt(subjectId));
		newAdmin.setPassword(password);
		
		String result = service.addAdmin(newAdmin);
		
		String successMsg = "添加管理员成功！";
		JSONObject json = GenericUtil.getOperateJSONObject(result, successMsg);
        
		printJson(json);
	}
	
	/**
	 * 超级管理员：修改管理员密码
	 */
	public void	changePassword() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();		
		String adminId = req.getParameter("adminId");		
		String password = req.getParameter("password");
		
		//newAdmin必须从数据库查出来，加密时要用到用户名
		Admin newAdmin = service.getAdminById(Integer.parseInt(adminId));
		newAdmin.setPassword(password);
		
		String result = service.changePassword(newAdmin, false);
		
		String successMsg = "密码修改成功！";
		JSONObject json = GenericUtil.getOperateJSONObject(result, successMsg);
        
		printJson(json);
	}
	
	/**
	 * 超级管理员：删除管理员
	 */
	public void deleteAdmin() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();		
		String adminId = req.getParameter("adminId");				
		
		String result = service.deleteAdminById(Integer.parseInt(adminId), false);
		
		String successMsg = "删除管理员成功！";
		JSONObject json = GenericUtil.getOperateJSONObject(result, successMsg);
        
		printJson(json);
	}
	
	/**
	 * 超级管理员：查找某个院的所有专业级管理员
	 */
	public void getMajorAdmins() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		String academyId = req.getParameter("academyId");		
		
		String  jsonStr = service.getMajorAdminsJson(Integer.parseInt(academyId));  
		JSONObject json = new JSONObject();
		json.put("rows",jsonStr);         
		
		printJson(json);
	}
	/* --------------------------------- ↑ 超级管理员调用的方法 ↑ --------------------------------- */

	
}
