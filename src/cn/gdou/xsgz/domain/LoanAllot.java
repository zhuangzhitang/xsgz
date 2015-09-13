package cn.gdou.xsgz.domain;

import java.io.Serializable;

/**
 * 贷款分配
 */
@SuppressWarnings("serial")
public class LoanAllot implements Serializable{
	// 学号
	private String studentNum;
	// 贷款金额
	private int loanMoney;
	// 贷款年份
	private String loanYear;

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
	 * 贷款金额
	 */
	public int getLoanMoney() {
		return loanMoney;
	}
	/**
	 * 贷款金额
	 */
	public void setLoanMoney(int loanMoney) {
		this.loanMoney = loanMoney;
	}

	/**
	 * 贷款年份
	 */
	public String getLoanYear() {
		return loanYear;
	}
	/**
	 * 贷款年份
	 */
	public void setLoanYear(String loanYear) {
		this.loanYear = loanYear;
	}
	
	
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}

}