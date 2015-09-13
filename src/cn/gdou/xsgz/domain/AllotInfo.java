package cn.gdou.xsgz.domain;

import java.io.Serializable;

/**
 * 三金分配信息
 */
@SuppressWarnings("serial")
public class AllotInfo implements Serializable{
	// 学号
	private String studentNum;
	// 学年
	private String schoolYear;
	// 文件Id
	private int type;
	//学生姓名
	private String studentName;
	
	//学生尸体
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
	 * 申请类别（1：助学金，2：国家励志奖学金，3：国家奖学金）
	 */
	public int getType() {
		return type;
	}
	/**
	 * 申请类别（1：助学金，2：国家励志奖学金，3：国家奖学金）
	 */
	public void setType(int type) {
		this.type = type;
	}
	
	
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}

}