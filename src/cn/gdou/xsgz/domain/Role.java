package cn.gdou.xsgz.domain;

import java.io.Serializable;

/**
 * 角色
 */
@SuppressWarnings("serial")
public class Role implements Serializable{
	// 角色Id（取值范围：0,1,2）
	private int roleId;
	// 角色名
	private String roleName;
	// 角色描述
	private String description;

	/**
	 * 角色Id
	 */
	public int getRoleId() {
		return roleId;
	}
	/**
	 * 角色Id
	 */
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	/**
	 * 角色名
	 */
	public String getRoleName() {
		return roleName;
	}
	/**
	 * 角色名
	 */
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	/**
	 * 角色描述
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * 角色描述
	 */
	public void setDescription(String description) {
		this.description = description;
	}

}