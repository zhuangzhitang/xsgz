package cn.gdou.xsgz.domain;

import java.io.Serializable;

/**
 * 管理员
 */
@SuppressWarnings("serial")
public class Admin implements Serializable{
	// 管理员Id
	private int adminId;
	// 用户名
	private String username;
	// 密码
	private String password;
	// 学院Id/专业Id（如果是专业级管理员，则为专业ID，否则为学院ID）
	private int subjectId;
	// 角色Id（0：超级管理员；1：院级管理员；2:专业级管理员）
	private int roleId;
	// 注册时间
	private String registerTime;
	// 上次登录时间
	private String lastTime;
	
	// 管辖范围
	private String subjectName;

	/**
	 * 管理员Id
	 */
	public int getAdminId() {
		return adminId;
	}
	/**
	 * 管理员Id
	 */
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}

	/**
	 * 用户名
	 */
	public String getUsername() {
		return username;
	}
	/**
	 * 用户名
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * 密码
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * 密码
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * 学院Id/专业Id
	 */
	public int getSubjectId() {
		return subjectId;
	}
	/**
	 * 学院Id/专业Id
	 */
	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}

	/**
	 * 角色Id（0：超级管理员；1：院级管理员；2:专业级管理员；3：学生管理员）
	 */
	public int getRoleId() {
		return roleId;
	}
	/**
	 * 角色Id（0：超级管理员；1：院级管理员；2:专业级管理员；3：学生管理员）
	 */
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	/**
	 * 注册时间
	 */
	public String getRegisterTime() {
		return registerTime;
	}
	/**
	 * 注册时间
	 */
	public void setRegisterTime(String registerTime) {
		this.registerTime = registerTime;
	}

	/**
	 * 上次登录时间
	 */
	public String getLastTime() {
		return lastTime;
	}
	/**
	 * 上次登录时间
	 */
	public void setLastTime(String lastTime) {
		this.lastTime = lastTime;
	}
	
	/**
	 * 管辖范围
	 */
	public String getSubjectName() {
		return subjectName;
	}
	/**
	 * 管辖范围
	 */
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	

}