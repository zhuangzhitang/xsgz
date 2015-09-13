package cn.gdou.xsgz.domain;

import java.io.Serializable;

/**
 * 学院
 */
@SuppressWarnings("serial")
public class Academy implements Serializable{
	// 学院Id
	private int academyId;
	// 学院名称
	private String academyName;
	// 学院简称
	private String shortName;
	// 院长
	private String dean;
	// 学院办公室电话
	private String tel;
	// 学院邮箱
	private String email;
	// 学院地址
	private String address;

	/**
	 * 学院Id
	 */
	public int getAcademyId() {
		return academyId;
	}
	/**
	 * 学院Id
	 */
	public void setAcademyId(int academyId) {
		this.academyId = academyId;
	}

	public void setAcademyId(String academyId) {
		this.academyId = Integer.parseInt(academyId);
	}
	/**
	 * 学院名称
	 */
	public String getAcademyName() {
		return academyName;
	}
	/**
	 * 学院名称
	 */
	public void setAcademyName(String academyName) {
		this.academyName = academyName;
	}

	/**
	 * 学院简称
	 */
	public String getShortName() {
		return shortName;
	}
	/**
	 * 学院简称
	 */
	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	/**
	 * 院长
	 */
	public String getDean() {
		return dean;
	}
	/**
	 * 院长
	 */
	public void setDean(String dean) {
		this.dean = dean;
	}

	/**
	 * 学院办公室电话
	 */
	public String getTel() {
		return tel;
	}
	/**
	 * 学院办公室电话
	 */
	public void setTel(String tel) {
		this.tel = tel;
	}

	/**
	 * 学院邮箱
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * 学院邮箱
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * 学院地址
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * 学院地址
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}