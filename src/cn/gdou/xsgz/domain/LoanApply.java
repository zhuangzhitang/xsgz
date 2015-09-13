package cn.gdou.xsgz.domain;

import java.io.Serializable;

/**
 * 贷款申请
 */
@SuppressWarnings("serial")
public class LoanApply implements Serializable{
	// 学号
	private String studentNum;
	// 计划贷款金额
	private int applyMoney;
	
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
	 * 计划贷款金额
	 */
	public int getApplyMoney() {
		return applyMoney;
	}
	/**
	 * 计划贷款金额
	 */
	public void setApplyMoney(int applyMoney) {
		this.applyMoney = applyMoney;
	}
	
	
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}

}