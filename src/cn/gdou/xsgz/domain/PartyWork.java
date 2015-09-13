package cn.gdou.xsgz.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * 个人党务信息
 */
@SuppressWarnings("serial")
public class PartyWork implements Serializable{
	// 个人党务Id
	private int partyWorkId;
	// 学号
	private String studentNum;
	// 政治面貌
	private String politicsStatus;
	// 党校成绩
	private String score;
	// 第几期培训班
	private String trainNo;
	// 入党联系人1
	private String linkMan1;
	// 入党联系人2
	private String linkMan2;
	// 入党介绍人1
	private String introduceMan1;
	// 入党介绍人2
	private String introduceMan2;
	// 提交入党申请书时间
	private Date applyDate;
	// 推优时间
	private Date recommendDate;
	// 转发展对象时间
	private Date developDate;
	// 转预备时间
	private Date readyDate;
	// 转正时间
	private Date positiveDate;
	// 党校结业时间
	private Date graduateDate;

	// 学生实体
	private Student student;
	
	/**
	 * 个人党务Id
	 */
	public int getPartyWorkId() {
		return partyWorkId;
	}
	/**
	 * 个人党务Id
	 */
	public void setPartyWorkId(int partyWorkId) {
		this.partyWorkId = partyWorkId;
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
	 * 政治面貌
	 */
	public String getPoliticsStatus() {
		return politicsStatus;
	}
	/**
	 * 政治面貌
	 */
	public void setPoliticsStatus(String politicsStatus) {
		this.politicsStatus = politicsStatus;
	}

	/**
	 * 党校成绩
	 */
	public String getScore() {
		return score;
	}
	/**
	 * 党校成绩
	 */
	public void setScore(String score) {
		this.score = score;
	}

	/**
	 * 第几期培训班
	 */
	public String getTrainNo() {
		return trainNo;
	}
	/**
	 * 第几期培训班
	 */
	public void setTrainNo(String trainNo) {
		this.trainNo = trainNo;
	}

	/**
	 * 入党联系人1
	 */
	public String getLinkMan1() {
		return linkMan1;
	}
	/**
	 * 入党联系人1
	 */
	public void setLinkMan1(String linkMan1) {
		this.linkMan1 = linkMan1;
	}

	/**
	 * 入党联系人2
	 */
	public String getLinkMan2() {
		return linkMan2;
	}
	/**
	 * 入党联系人2
	 */
	public void setLinkMan2(String linkMan2) {
		this.linkMan2 = linkMan2;
	}

	/**
	 * 入党介绍人1
	 */
	public String getIntroduceMan1() {
		return introduceMan1;
	}
	/**
	 * 入党介绍人1
	 */
	public void setIntroduceMan1(String introduceMan1) {
		this.introduceMan1 = introduceMan1;
	}

	/**
	 * 入党介绍人2
	 */
	public String getIntroduceMan2() {
		return introduceMan2;
	}
	/**
	 * 入党介绍人2
	 */
	public void setIntroduceMan2(String introduceMan2) {
		this.introduceMan2 = introduceMan2;
	}

	/**
	 * 提交入党申请书时间
	 */
	public Date getApplyDate() {
		return applyDate;
	}
	/**
	 * 提交入党申请书时间
	 */
	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	/**
	 * 推优时间
	 */
	public Date getRecommendDate() {
		return recommendDate;
	}
	/**
	 * 推优时间
	 */
	public void setRecommendDate(Date recommendDate) {
		this.recommendDate = recommendDate;
	}

	/**
	 * 转发展对象时间
	 */
	public Date getDevelopDate() {
		return developDate;
	}
	/**
	 * 转发展对象时间
	 */
	public void setDevelopDate(Date developDate) {
		this.developDate = developDate;
	}

	/**
	 * 转预备时间
	 */
	public Date getReadyDate() {
		return readyDate;
	}
	/**
	 * 转预备时间
	 */
	public void setReadyDate(Date readyDate) {
		this.readyDate = readyDate;
	}

	/**
	 * 转正时间
	 */
	public Date getPositiveDate() {
		return positiveDate;
	}
	/**
	 * 转正时间
	 */
	public void setPositiveDate(Date positiveDate) {
		this.positiveDate = positiveDate;
	}

	/**
	 * 党校结业时间
	 */
	public Date getGraduateDate() {
		return graduateDate;
	}
	/**
	 * 党校结业时间
	 */
	public void setGraduateDate(Date graduateDate) {
		this.graduateDate = graduateDate;
	}
	
	
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}

}