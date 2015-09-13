package cn.gdou.xsgz.admin.system.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.gdou.xsgz.domain.Admin;
import cn.gdou.xsgz.domain.Menu;
import cn.gdou.xsgz.util.DatabaseUtil;
import cn.gdou.xsgz.util.MyQueryRunner;

/**
 * 管理员DAO: 关于Admin的一系列数据库操作
 * 
 * @author 李楚富
 * @version 2014-04-22
 */
public class AdminDao {
	
	MyQueryRunner runner = new MyQueryRunner(DatabaseUtil.getDataSource());
	
	/**
	 * 根据用户名和密码查找用户（用于登录）
	 */
	public Admin findAdmin(Admin admin) {		
		String sql = " SELECT * FROM admin " +
					 " WHERE userName = ? AND password = ?";
		admin = runner.query(sql, new BeanHandler<Admin>(Admin.class),
		        admin.getUsername(), admin.getPassword() );
		
		return admin;
	}
	
	/**
	 * 根据ID查找管理员
	 */
	public Admin getAdminById(Integer adminId) {		
		String sql = " SELECT * FROM admin " +
					 " WHERE adminId = ?";
		Admin admin = runner.query(sql, new BeanHandler<Admin>(Admin.class), adminId );
		
		return admin;
	}
	
	/**
     * 判断管理员对于某个url是否有权限
     * @param admin 管理员实体
     * @param url 请求路径
     * @return true or false
     */
    public boolean isHavePermissionOnUrl(Admin admin, String url){
        String sql = " SELECT count(*) " +
                     " FROM admin " +
                     " INNER JOIN role ON admin.roleId = role.roleId " +
                     " INNER JOIN roleMenu ON role.roleId = roleMenu.roleId " +
                     " INNER JOIN menu ON menu.menuId = roleMenu.menuId " +
                     " WHERE admin.adminId = ? AND menu.menuUrl = ?";
        
        String result = runner.query(sql, new ScalarHandler(),
                admin.getAdminId(), url).toString();
        
        if("0".equals(result))
            return false;
        else
            return true;
    }
	
	/**
	 * 获取管理员功能菜单列表
	 * @param admin 管理员实体
	 * @return Menu的List集合
	 */
	public List<Menu> getMenuList(Admin admin){
	    String sql = " SELECT menu.* "+
	                 " FROM admin " +
	                 " INNER JOIN role ON admin.roleId = role.roleId " +
	                 " INNER JOIN roleMenu ON role.roleId = roleMenu.roleId " +
	                 " INNER JOIN menu ON menu.menuId = roleMenu.menuId "+
	                 " WHERE admin.adminId = ? AND menu.subject IS NOT NULL";
	    
	    List<Menu> list  = runner.query(sql, 
	            new BeanListHandler<Menu>(Menu.class), admin.getAdminId());
	   
	    return list;
	}
	
	/**
	 * 记录管理员的登录时间
	 */
	public void recordLoginTime(Admin admin){
		String sql = " UPDATE admin "+
					 " SET lastTime = ? " +			        
				     " WHERE adminId = ? ";
		int i = runner.update(sql, admin.getLastTime(), admin.getAdminId());
		if( 1 != i)
			System.out.println("管理员登录时间记录失败！adminId : "+ admin.getAdminId());
	}
	
	/**
	 * 根据学院ID，获取该院的所有专业级管理员（由院级管理员调用此方法）
	 * @param academyId 学院ID
	 * @return List<Map<String, Object>>
	 */
	public List<Map<String, Object>> listMajorAdminsByAcademyId(Integer academyId) {		
		String sql = " SELECT admin.adminId, admin.username, major.majorName, " + 
					 "        admin.registerTime , admin.lastTime " + 
					 " FROM admin " + 
					 " INNER JOIN major ON admin.subjectId = major.majorId " +
					 " WHERE admin.roleId = 2 AND major.academyId = ? ";
		/* 专业级管理员的角色Id = 2 */
		
		List<Map<String, Object>> list = runner.query(sql,
				new MapListHandler(), academyId);
		
		return list;
	}
	
	/**
	 * 判断某专业是否是自己学院的，是才有权管辖（由院级管理员调用此方法）
	 * @param majroId 目标专业管理员的专业Id
	 * @param academyId 院级管理员的学院Id
	 */
	public boolean isMajorInAcademyControl(Integer majroId, Integer academyId) {		
		String sql = " SELECT COUNT(*) " +
					 " FROM major " +
					 " WHERE majorId = ? AND academyId = ? ";
		Long count = (Long) 
				runner.query(sql, new ScalarHandler(), majroId, academyId);
		
		if(1 == count)
			return true;
		else
		    return false;
	}
	
	/**
	 * 是否已存在该用户名
	 * @param username 管理员的用户名
	 */
	public boolean isExistUsername(String username) {		
		String sql = " SELECT COUNT(*) " +
					 " FROM admin " +
		             " WHERE username = ? ";
		Long count = (Long) 
				runner.query(sql, new ScalarHandler(), username);
		
		if(0 == count)
			return false;
		else
		    return true;
	}
	
	/**
	 * 添加管理员
	 */
	public int 	addAdmin(Admin admin){
		String sql = " INSERT INTO admin(username, subjectId, password, roleId) " +
				     " VALUES(?, ?, ?, ?) ";
		int result = runner.update(sql, admin.getUsername(), admin.getSubjectId(), 
				admin.getPassword(), admin.getRoleId());
		
		return result;
	}
	
	/**
	 * 修改管理员密码
	 * @param admin 管理员对象
	 * @param isRoleIdEquals2  需要修改密码的管理员是否为专业级管理员
	 */
	public int 	changePassword(Admin admin, boolean isRoleIdEquals2){
		String sql = " UPDATE admin " +
				     " SET `password` = ? " +
				     " WHERE adminId = ? ";
		// 为防止院级管理员修改院级管理员密码，加上此句
		if(isRoleIdEquals2)
			sql += " AND roleId = 2 ";
		
		int result = runner.update(sql, admin.getPassword(), admin.getAdminId());
		
		return result;
	}
	
	/**
	 * 删除管理员
	 * @param adminId 管理员ID
	 * @param isRoleIdEquals2  要删除的管理员是否为专业级管理员
	 */
	public int deleteAdminById(Integer adminId, boolean isRoleIdEquals2){
		String sql = " DELETE FROM admin " +
				     " WHERE adminId = ? ";
		// 为防止院级管理员删除院级管理员，加上此句
		if(isRoleIdEquals2)
			sql += " AND roleId = 2 ";
		
		int result = runner.update(sql, adminId);
		
		return result;
	}
	
	/**
	 * 查询所有【院级】管理员
	 * @return List<Map<String, Object>>
	 */
	public List<Map<String, Object>> queryAllAcademyAdmins( ) {	
		// 注意：MapListHandler对academyName的别名unitName不做处理，
		// 仍以academyName为key封装到Map，需在service层做替换！
		String sql = " SELECT admin.adminId, admin.username, academy.academyName AS unitName, " + 
					 "        admin.registerTime , admin.lastTime " + 
					 " FROM admin " + 
					 " INNER JOIN academy ON admin.subjectId = academy.academyId " +
					 " WHERE admin.roleId = 1 ";
		/* 【院级】管理员的角色Id = 1 */
		
		List<Map<String, Object>> list = runner.query(sql, new MapListHandler());
		
		return list;
	}
	
	/**
	 * 查询管理员的管辖范围
	 */
	public String querySubjectName( Admin admin ) {	
		String sql = null;
		
		if(admin.getRoleId() == 2){ //查询专业级管理员管辖的专业名称
			sql = " SELECT major.majorName " + 
				  " FROM admin , major " + 
				  " WHERE admin.subjectId = major.majorId AND admin.roleId = 2 AND admin.adminId = ? ";
		}else if(admin.getRoleId() == 1){ //查询院级管理员管辖的学院名称
			sql = " SELECT academy.academyName " + 
			      " FROM admin , academy " + 
				  " WHERE admin.subjectId = academy.academyId AND admin.roleId = 1 AND admin.adminId = ? ";
		}else{
			// 超级管理员：no zuo no die
			return "整个系统";
		}
		
		String subjectName = (String) runner.query(sql, new ScalarHandler(), admin.getAdminId());
		return subjectName;
	}
}
