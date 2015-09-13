package cn.gdou.xsgz.domain;

import java.io.Serializable;

/**
 * 大院
 */
@SuppressWarnings("serial")
public class Yard implements Serializable{
	// 大院Id
	private int yardId;
	// 大院名称
	private String yardName;
	// 大院管理员
	private String manager;
	// 联系电话
	private String tel;

	/**
	 * 大院Id
	 */
	public int getYardId() {
		return yardId;
	}
	/**
	 * 大院Id
	 */
	public void setYardId(int yardId) {
		this.yardId = yardId;
	}

	/**
	 * 大院名称
	 */
	public String getYardName() {
		return yardName;
	}
	/**
	 * 大院名称
	 */
	public void setYardName(String yardName) {
		this.yardName = yardName;
	}

	/**
	 * 大院管理员
	 */
	public String getManager() {
		return manager;
	}
	/**
	 * 大院管理员
	 */
	public void setManager(String manager) {
		this.manager = manager;
	}

	/**
	 * 联系电话
	 */
	public String getTel() {
		return tel;
	}
	/**
	 * 联系电话
	 */
	public void setTel(String tel) {
		this.tel = tel;
	}

}