package cn.gdou.xsgz.admin.system.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.gdou.xsgz.admin.system.dao.AdminDao;
import cn.gdou.xsgz.domain.Admin;
import cn.gdou.xsgz.domain.Menu;
import cn.gdou.xsgz.util.GenericUtil;
import flexjson.JSONSerializer;
import flexjson.transformer.DateTransformer;

/**
 * 管理员Service: 处理Admin的逻辑业务
 * 
 * @author 李楚富
 * @version 2014-04-22
 */
public class AdminService {
    private AdminDao dao = new AdminDao();
    
    public Admin findAdmin(Admin admin) {
        // 将管理员的密码加密
        String password = GenericUtil.encrypt(admin.getUsername(), admin.getPassword());
        admin.setPassword(password);

        return dao.findAdmin(admin);
    }
    
	public Admin getAdminById(Integer adminId) {	
		return dao.getAdminById(adminId);
	}
    
    public boolean isHavePermissionOnUrl(Admin admin, String url){
        return dao.isHavePermissionOnUrl(admin, url);
    }
    
    public Map<String, List<Menu>> getMenuList(Admin admin) {
    	 Map<String, List<Menu>> menuMap = new HashMap<String, List<Menu>>();
         
         List<Menu> menus = dao.getMenuList(admin);
         //各个模块的功能菜单列表
         List<Menu> system       = new ArrayList<Menu>();
         List<Menu> yard         = new ArrayList<Menu>();
         List<Menu> base         = new ArrayList<Menu>();
         List<Menu> scholarships = new ArrayList<Menu>();
         List<Menu> workstudy    = new ArrayList<Menu>();
         List<Menu> party        = new ArrayList<Menu>();
         List<Menu> conductpoints= new ArrayList<Menu>();
         List<Menu> other        = new ArrayList<Menu>();
         Map<String,Integer> subjectMap=new HashMap<String, Integer>();
         subjectMap.put("system",1);
         subjectMap.put("yard",2);
         subjectMap.put("base",3);
         subjectMap.put("scholarships",4);
         subjectMap.put("workstudy",5);
         subjectMap.put("party",6);
         subjectMap.put("conductpoints",7);
         subjectMap.put("other",8);
         for(Menu m : menus){
             String subject = m.getSubject();
             int subjectID=subjectMap.get(subject);
             switch(subjectID) {
                 case 1:       // 系统管理
                     system.add(m);
                     break;
                 case 2:         // 宿舍管理
                     yard.add(m);
                     break;
                 case 3:         // 综合管理
                     base.add(m);
                     break;
                 case 4: // 奖学金管理
                     scholarships.add(m);
                     break;
                 case 5:    // 勤工助学管理
                     workstudy.add(m);
                     break;
                 case 6:        // 党务管理
                     party.add(m);
                     break;
                 case 7:        // 操行分管理
                     conductpoints.add(m);
                     break;
                 case 8:
                 	other.add(m);
                     break;
                 default: break;
             }
             
         }
         
         if(system.size() > 0)
             menuMap.put("system", system);
         if(yard.size() > 0)
             menuMap.put("yard", yard);
         if(base.size() > 0)
             menuMap.put("base", base);
         if(scholarships.size() > 0)
             menuMap.put("scholarships", scholarships);
         if(workstudy.size() > 0)
             menuMap.put("workstudy", workstudy);
         if(party.size() > 0)
             menuMap.put("party", party);
         if(conductpoints.size()>0)
         	menuMap.put("conductpoints",conductpoints);
         if(other.size() > 0)
             menuMap.put("other", other);
         
         return menuMap;

    }
    
    public void recordLoginTime(Admin admin){
    	admin.setLastTime(GenericUtil.getDateTime());
    	dao.recordLoginTime(admin);
    }

    /**
     * 获取某学院的所有专业级管理员，并对时间格式进行处理，返回json格式字符串
     */
	public String getMajorAdminsJson(Integer academyId) {	
		
		List<Map<String, Object>> list =  
				dao.listMajorAdminsByAcademyId(academyId);
		
		JSONSerializer jsonRows = new JSONSerializer();
		//格式化注册时间和上次登录时间
		jsonRows.transform(new DateTransformer("yyyy-MM-dd HH:mm:ss"), 
				new String[] { "registerTime" });
		jsonRows.transform(new DateTransformer("yyyy-MM-dd HH:mm:ss"), 
				new String[] { "lastTime" });
		
        String  jsonStr =jsonRows.serialize(list);     
        
		return jsonStr;
	}
	
	/**
	 * 添加管理员
	 * @param admin 管理员
	 * @return 操作结果
	 */
	public String addAdmin(Admin admin){
				
		//判断该用户名是否已被使用
		boolean flag = dao.isExistUsername(admin.getUsername());
		if(flag)
			return "该用户名已被使用！";
		//加密密码
		admin.setPassword(GenericUtil.encrypt(
				admin.getUsername(), admin.getPassword()));
		
		int result = dao.addAdmin(admin);
		if(result == 1)
			return "success";
		else
			return "添加管理员失败！请稍后重试！";
	}
	
	/**
	 * 院级管理员添加专业级管理员
	 * @param admin 专业级管理员
	 * @param academyId 院级管理员的学院Id
	 * @return 操作结果
	 */
	public String addMajorAdmin(Admin admin, Integer academyId){
		//先判断要添加的专业级管理员所在专业 是否属于院级管理员所在学院
		boolean flag = dao.isMajorInAcademyControl(
				admin.getSubjectId(), academyId);
		if(!flag)
			return "非法操作：所选专业不在管辖范围内！";
		
		String returnStr = addAdmin(admin);
		
		return returnStr;
	}
	
	/**
	 * 院级管理员修改专业级管理员密码
	 * @param admin 专业级管理员
	 * @param academyId 院级管理员的学院Id
	 * @return 操作结果
	 */
	public String academyAdminChangeMajorAdminPassword(Admin admin, Integer academyId){
		//先判断要添加的专业级管理员所在专业是否属于院级管理员所在学院
		boolean flag = dao.isMajorInAcademyControl(admin.getSubjectId(), academyId);
		if(!flag)
			return "非法操作：该专业级管理员不在管辖范围内！";
		
		return changePassword(admin, true);
	}
	
	/**
	 * 院级管理员删除专业级管理员
	 * @param admin 专业级管理员
	 * @param academyId 院级管理员的学院Id
	 * @return 操作结果
	 */
	public String deleteMajorAdmin(Admin admin, Integer academyId){
		//先判断要删除的专业级管理员所在专业是否属于院级管理员所在学院
		boolean flag = dao.isMajorInAcademyControl(admin.getSubjectId(), academyId);
		if(!flag)
			return "非法操作：该专业级管理员不在管辖范围内！";
		
		return deleteAdminById(admin.getAdminId(), true);
	}
	
	public String deleteAdminById(Integer adminId, boolean isRoleIdEquals2){
		int result = dao.deleteAdminById(adminId, isRoleIdEquals2);
		if(result == 1)
			return "success";
		else
			return "删除管理员失败！请稍后重试！";
	}
	
	/**
	 * 查询所有【院级】管理员，并对时间格式进行处理，返回json格式数据
	 * @return json格式的字符串
	 */
	public String queryAllAcademyAdmins( ) {		
		
		List<Map<String, Object>> list = dao.queryAllAcademyAdmins();
		
		JSONSerializer jsonRows = new JSONSerializer();
		//格式化注册时间和上次登录时间
		jsonRows.transform(new DateTransformer("yyyy-MM-dd HH:mm:ss"), 
				new String[] { "registerTime" });
		jsonRows.transform(new DateTransformer("yyyy-MM-dd HH:mm:ss"), 
				new String[] { "lastTime" });
		
        String  jsonStr =jsonRows.serialize(list); 
        //将academyName的key替换成majorName，这样majorName和academyName就可以在前台共用一个name
        jsonStr = jsonStr.replaceAll("\"academyName\"", "\"majorName\"");
        
		return jsonStr;
	}
	
	/**
	 * 修改管理员密码（isRoleIdEquals2为true则是院级管理员使用，false为超级管理员使用）
	 * @return 操作结果
	 */
	public String changePassword(Admin admin, boolean isRoleIdEquals2){		
		String pwd = GenericUtil.encrypt(admin.getUsername(), admin.getPassword());
		admin.setPassword(pwd);
		
		int result = dao.changePassword(admin, isRoleIdEquals2);
		if(result == 1)
			return "success";
		else
			return "修改密码失败！请稍后重试！";
	}
	
	/**
	 * 管理员更改自己的密码
	 * @return 操作结果
	 */
	public String updateOwnerPassword(Admin admin, String oldPassword, String newPassword){
		oldPassword = GenericUtil.encrypt(admin.getUsername(), oldPassword);
		if(!oldPassword.equals(admin.getPassword())){
			return "原密码错误！";
		}
		
		newPassword = GenericUtil.encrypt(admin.getUsername(), newPassword);
		admin.setPassword(newPassword);
		
		int result = dao.changePassword(admin, false);
		if(result == 1){
			return "success";
		}else{
			// 修改密码失败，则旧密码不变
			admin.setPassword(oldPassword);
			return "修改密码失败！请稍后重试！";
		}
	}
	
	public String querySubjectName( Admin admin ) {
		if(admin == null)
			return "admin is error";
		return dao.querySubjectName(admin);
	}
}
