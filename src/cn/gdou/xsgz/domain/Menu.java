package cn.gdou.xsgz.domain;

import java.io.Serializable;

/**
 * 功能菜单
 */
@SuppressWarnings("serial")
public class Menu implements Serializable{
	// 菜单Id
	private int menuId;
	// 菜单路径
	private String menuUrl;
	// 模块名（system:系统管理; base:综合管理。。。等jsp页面）,若为null则不是导航菜单
	private String subject;
	// 菜单描述
	private String description;

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

	/**
	 * 菜单路径
	 */
	public String getMenuUrl() {
		return menuUrl;
	}
	/**
	 * 菜单路径
	 */
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}

	/**
	 * 模块名（system:系统管理; base:综合管理。。。）,若为null则不是导航菜单
	 */
	public String getSubject() {
		return subject;
	}
	/**
	 * 模块名（system:系统管理; base:综合管理。。。）,若为null则不是导航菜单
	 */
	public void setSubject(String subject) {
		this.subject = subject;
	}

	/**
	 * 菜单描述
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * 菜单描述
	 */
	public void setDescription(String description) {
		this.description = description;
	}

}