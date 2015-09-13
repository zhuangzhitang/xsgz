package cn.gdou.xsgz.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * 党员资料
 */
@SuppressWarnings("serial")
public class PartyMember implements Serializable{
	// 党员Id
	private int partyMemberId;
	// 学号
	private String studentNum;
	// 职务
	private String cadre;
	// 任职时间
	private Date cadreTime;
	// 思想汇报
	private int thinkReport;
	// 入党申请书
	private int applyBook;
	// 发展对象登记表
	private int developRegister;
	// 入党积极分子 培养考察登记表
	private int inspection;
	// 党校学员登记表
	private int schoolMemberRegister;
	// 群众意见调查表
	private int research;
	// 政审材料
	private int politicalAudit;
	// 转正申请书
	private int turnPositive;
	// 个人自传
	private int autobiography;
	
	// 学生实体
	private Student student;

	/**
	 * 党员Id
	 */
	public int getPartyMemberId() {
		return partyMemberId;
	}
	/**
	 * 党员Id
	 */
	public void setPartyMemberId(int partyMemberId) {
		this.partyMemberId = partyMemberId;
	}

	/**
	 * 学号
	 */
	public String getStudentNum() {
		return studentNum;
	}
	/**
	 * 学号
	 */
	public void setStudentNum(String studentNum) {
		this.studentNum = studentNum;
	}

	/**
	 * 职务
	 */
	public String getCadre() {
		return cadre;
	}
	/**
	 * 职务
	 */
	public void setCadre(String cadre) {
		this.cadre = cadre;
	}

	/**
	 * 任职时间
	 */
	public Date getCadreTime() {
		return cadreTime;
	}
	/**
	 * 任职时间
	 */
	public void setCadreTime(Date cadreTime) {
		this.cadreTime = cadreTime;
	}

	/**
	 * 思想汇报
	 */
	public int getThinkReport() {
		return thinkReport;
	}
	/**
	 * 思想汇报
	 */
	public void setThinkReport(int thinkReport) {
		this.thinkReport = thinkReport;
	}

	/**
	 * 入党申请书
	 */
	public int getApplyBook() {
		return applyBook;
	}
	/**
	 * 入党申请书
	 */
	public void setApplyBook(int applyBook) {
		this.applyBook = applyBook;
	}

	/**
	 * 发展对象登记表
	 */
	public int getDevelopRegister() {
		return developRegister;
	}
	/**
	 * 发展对象登记表
	 */
	public void setDevelopRegister(int developRegister) {
		this.developRegister = developRegister;
	}

	/**
	 * 入党积极分子 培养考察登记表
	 */
	public int getInspection() {
		return inspection;
	}
	/**
	 * 入党积极分子 培养考察登记表
	 */
	public void setInspection(int inspection) {
		this.inspection = inspection;
	}

	/**
	 * 党校学员登记表
	 */
	public int getSchoolMemberRegister() {
		return schoolMemberRegister;
	}
	/**
	 * 党校学员登记表
	 */
	public void setSchoolMemberRegister(int schoolMemberRegister) {
		this.schoolMemberRegister = schoolMemberRegister;
	}

	/**
	 * 群众意见调查表
	 */
	public int getResearch() {
		return research;
	}
	/**
	 * 群众意见调查表
	 */
	public void setResearch(int research) {
		this.research = research;
	}

	/**
	 * 政审材料
	 */
	public int getPoliticalAudit() {
		return politicalAudit;
	}
	/**
	 * 政审材料
	 */
	public void setPoliticalAudit(int politicalAudit) {
		this.politicalAudit = politicalAudit;
	}

	/**
	 * 转正申请书
	 */
	public int getTurnPositive() {
		return turnPositive;
	}
	/**
	 * 转正申请书
	 */
	public void setTurnPositive(int turnPositive) {
		this.turnPositive = turnPositive;
	}

	/**
	 * 个人自传
	 */
	public int getAutobiography() {
		return autobiography;
	}
	/**
	 * 个人自传
	 */
	public void setAutobiography(int autobiography) {
		this.autobiography = autobiography;
	}
	
	
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}

}