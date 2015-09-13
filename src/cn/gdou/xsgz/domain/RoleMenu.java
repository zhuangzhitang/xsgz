package cn.gdou.xsgz.domain;

import java.io.Serializable;

/**
 * 角色菜单
 */
@SuppressWarnings("serial")
public class RoleMenu implements Serializable{
	// 角色Id
	private int roleId;
	// 菜单Id
	private int menuId;
	
	// 角色实体
	private Role role;
	// 功能菜单实体
	private Menu menu;

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
	 * 菜单Id
	 */
	public int getMenuId() {
		return menuId;
	}
	/**
	 * 菜单Id
	 */
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public Menu getMenu() {
		return menu;
	}
	public void setMenu(Menu menu) {
		this.menu = menu;
	}
}