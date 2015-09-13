package cn.gdou.xsgz.domain;

import java.io.Serializable;

/**
 * 勤工岗位安排
 */
@SuppressWarnings("serial")
public class JobArrange implements Serializable{
	// 学号
	private String studentNum;
	//姓名
	private String studentName;
	// 学年
	private String schoolYear;
	//申请的岗位
	private String workplace;
	// 安排岗位
	private String arrangeJob;
	// 申请表路径
	private String path;
	// 工资
	private int salary;
	// 备注
	private String comment;
	//是否获得各金
	private String loans;
	
	private String grants;
	
	private String level;
	private String motivational;
	
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
	 * 安排岗位
	 */
	public String getArrangeJob() {
		return arrangeJob;
	}
	/**
	 * 安排岗位
	 */
	public void setArrangeJob(String arrangeJob) {
		this.arrangeJob = arrangeJob;
	}

	/**
	 * 申请表路径
	 */
	public String getPath() {
		return path;
	}
	/**
	 * 申请表路径
	 */
	public void setPath(String path) {
		this.path = path;
	}

	/**
	 * 工资
	 */
	public int getSalary() {
		return salary;
	}
	/**
	 * 工资
	 */
	public void setSalary(int salary) {
		this.salary = salary;
	}

	/**
	 * 备注
	 */
	public String getComment() {
		return comment;
	}
	/**
	 * 备注
	 */
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public String getLoans() {
		return loans;
	}
	public void setLoans(String loans) {
		this.loans = loans;
	}
	public String getGrants() {
		return grants;
	}
	public void setGrants(String grants) {
		this.grants = grants;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getMotivational() {
		return motivational;
	}
	public void setMotivational(String motivational) {
		this.motivational = motivational;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	
	public String getWorkplace() {
		return workplace;
	}
	public void setWorkplace(String workplace) {
		this.workplace = workplace;
	}

}