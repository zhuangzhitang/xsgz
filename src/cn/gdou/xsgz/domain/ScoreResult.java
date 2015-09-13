package cn.gdou.xsgz.domain;

import java.io.Serializable;

/**
 * 综合测评
 */
@SuppressWarnings("serial")
public class ScoreResult implements Serializable{
	// 学号
	private String studentNum;
	// 学年
	private String schoolYear;
	// 总评分数(两位整数，两位小数)
	private String sumScore;
	// 挂科数目
	private int filedClassCount;
	// 挂科学分(一位小数)
	private String failedClassCredit;
	// 评定等级（取值：0：没得奖，1：一等奖,2：二等奖,3：三等奖）
	private int level;
	
	private String studentName;
	//奖学金等级中文字符串，便于转化为json.
	private String levelString;
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
	 * 学年
	 */
	public String getSchoolYear() {
		return schoolYear;
	}
	/**
	 * 学年
	 */
	public void setSchoolYear(String schoolYear) {
		this.schoolYear = schoolYear;
	}

	/**
	 * 总评分数(两位整数，两位小数)
	 */
	public String getSumScore() {
		return sumScore;
	}
	/**
	 * 总评分数(两位整数，两位小数)
	 */
	public void setSumScore(String sumScore) {
		this.sumScore = sumScore;
	}

	/**
	 * 挂科数目
	 */
	public int getFiledClassCount() {
		return filedClassCount;
	}
	/**
	 * 挂科数目
	 */
	public void setFiledClassCount(int filedClassCount) {
		this.filedClassCount = filedClassCount;
	}

	/**
	 * 挂科学分(一位小数)
	 */
	public String getFailedClassCredit() {
		return failedClassCredit;
	}
	/**
	 * 挂科学分(一位小数)
	 */
	public void setFailedClassCredit(String failedClassCredit) {
		this.failedClassCredit = failedClassCredit;
	}

	/**
	 * 评定等级（取值：0：没得奖，1：一等奖,2：二等奖,3：三等奖）
	 */
	public int getLevel() {
		return level;
	}
	/**
	 * 评定等级（取值：0：没得奖，1：一等奖,2：二等奖,3：三等奖）
	 */
	public void setLevel(int level) {
		this.level = level;
	}
	
	
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getLevelString() {
		return levelString;
	}
	public void setLevelString(String levelString) {
		this.levelString = levelString;
	}

}