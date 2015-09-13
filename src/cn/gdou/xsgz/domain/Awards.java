package cn.gdou.xsgz.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * 获奖信息
 */
@SuppressWarnings("serial")
public class Awards implements Serializable{
	// 学号
	private String studentNum;
	// 奖项名称
	private String awardsName;
	// 颁奖单位
	private String rewardsBureau;
	// 获奖时间
	private Date obtainTime;

	// 学生实体
	private Student student;
	
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
	 * 奖项名称
	 */
	public String getAwardsName() {
		return awardsName;
	}
	/**
	 * 奖项名称
	 */
	public void setAwardsName(String awardsName) {
		this.awardsName = awardsName;
	}

	/**
	 * 颁奖单位
	 */
	public String getRewardsBureau() {
		return rewardsBureau;
	}
	/**
	 * 颁奖单位
	 */
	public void setRewardsBureau(String rewardsBureau) {
		this.rewardsBureau = rewardsBureau;
	}

	/**
	 * 获奖时间
	 */
	public Date getObtainTime() {
		return obtainTime;
	}
	/**
	 * 获奖时间
	 */
	public void setObtainTime(Date obtainTime) {
		this.obtainTime = obtainTime;
	}
	
	
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}

}