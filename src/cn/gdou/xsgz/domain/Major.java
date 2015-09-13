package cn.gdou.xsgz.domain;

import java.io.Serializable;

/**
 * 专业
 */
@SuppressWarnings("serial")
public class Major implements Serializable{
	// 专业Id
	private int majorId;
	// 学院Id
	private int academyId;
	// 专业名称
	private String majorName;
	// 专业简称
	private String shortName;
	// 辅导员
	private String counselor;
	// 辅导员联系电话
	private String tel;
	
	// 学院实体
	private Academy academy;

	/**
	 * 专业Id
	 */
	public int getMajorId() {
		return majorId;
	}
	/**
	 * 专业Id
	 */
	public void setMajorId(int majorId) {
		this.majorId = majorId;
	}

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

	/**
	 * 专业名称
	 */
	public String getMajorName() {
		return majorName;
	}
	/**
	 * 专业名称
	 */
	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}

	/**
	 * 专业简称
	 */
	public String getShortName() {
		return shortName;
	}
	/**
	 * 专业简称
	 */
	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	/**
	 * 辅导员
	 */
	public String getCounselor() {
		return counselor;
	}
	/**
	 * 辅导员
	 */
	public void setCounselor(String counselor) {
		this.counselor = counselor;
	}

	/**
	 * 辅导员联系电话
	 */
	public String getTel() {
		return tel;
	}
	/**
	 * 辅导员联系电话
	 */
	public void setTel(String tel) {
		this.tel = tel;
	}

	
	public Academy getAcademy() {
		return academy;
	}
	public void setAcademy(Academy academy) {
		this.academy = academy;
	}
	
}