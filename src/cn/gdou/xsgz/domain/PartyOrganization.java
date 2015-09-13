package cn.gdou.xsgz.domain;

import java.io.Serializable;

/**
 * 党组织信息
 */
@SuppressWarnings("serial")
public class PartyOrganization implements Serializable{
	// 党组织Id
	private int partyOrganizationId;
	// 党组织名称
	private String orgName;
	// 党组织编号
	private String orgNumber;
	// 专业Id
	private int majorId;
	
	// 专业实体
	private Major major;

	/**
	 * 党组织Id
	 */
	public int getPartyOrganizationId() {
		return partyOrganizationId;
	}
	/**
	 * 党组织Id
	 */
	public void setPartyOrganizationId(int partyOrganizationId) {
		this.partyOrganizationId = partyOrganizationId;
	}

	/**
	 * 党组织名称
	 */
	public String getOrgName() {
		return orgName;
	}
	/**
	 * 党组织名称
	 */
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	/**
	 * 党组织编号
	 */
	public String getOrgNumber() {
		return orgNumber;
	}
	/**
	 * 党组织编号
	 */
	public void setOrgNumber(String orgNumber) {
		this.orgNumber = orgNumber;
	}

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
	
	
	public Major getMajor() {
		return major;
	}
	public void setMajor(Major major) {
		this.major = major;
	}

}