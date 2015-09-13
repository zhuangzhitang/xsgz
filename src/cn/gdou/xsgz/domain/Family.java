package cn.gdou.xsgz.domain;

import java.io.Serializable;

/**
 * 困难学生家庭情况
 */
@SuppressWarnings("serial")
public class Family implements Serializable{
	// 学号
	private String studentNum;
	// 困难等级 (0：特殊困难，1：困难，2：一般困难)
	private String level;
	// 学年
	private String schoolYear;
	// 家庭电话
	private String tel;
	// 家庭地址
	private String address;
	// 家庭出身
	private String origin;
	// 家庭户口类型
	private String householdType;
	// 家庭人口总数
	private int familySize;
	// 家庭月收入(整数)
	private int monthlyIncome;
	// 人均月收入(整数)
	private int perMonthlyIncome;
	// 收入来源
	private String sourceIncome;
	// 备注
	private String comment;

	// 学生实体
	private Student student;
	//班级号
	private int classId;
	
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
	 * 困难等级 (0：特殊困难，1：困难，2：一般困难)
	 */
	public String getLevel() {
		return level;
	}
	/**
	 * 困难等级 (0：特殊困难，1：困难，2：一般困难)
	 */
	public void setLevel(String level) {
		this.level = level;
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
	 * 家庭电话
	 */
	public String getTel() {
		return tel;
	}
	/**
	 * 家庭电话
	 */
	public void setTel(String tel) {
		this.tel = tel;
	}

	/**
	 * 家庭地址
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * 家庭地址
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * 家庭出身
	 */
	public String getOrigin() {
		return origin;
	}
	/**
	 * 家庭出身
	 */
	public void setOrigin(String origin) {
		this.origin = origin;
	}

	/**
	 * 家庭户口类型
	 */
	public String getHouseholdType() {
		return householdType;
	}
	/**
	 * 家庭户口类型
	 */
	public void setHouseholdType(String householdType) {
		this.householdType = householdType;
	}

	/**
	 * 家庭人口总数
	 */
	public int getFamilySize() {
		return familySize;
	}
	/**
	 * 家庭人口总数
	 */
	public void setFamilySize(int familySize) {
		this.familySize = familySize;
	}

	/**
	 * 家庭月收入(整数)
	 */
	public int getMonthlyIncome() {
		return monthlyIncome;
	}
	/**
	 * 家庭月收入(整数)
	 */
	public void setMonthlyIncome(int monthlyIncome) {
		this.monthlyIncome = monthlyIncome;
	}

	/**
	 * 人均月收入(整数)
	 */
	public int getPerMonthlyIncome() {
		return perMonthlyIncome;
	}
	/**
	 * 人均月收入(整数)
	 */
	public void setPerMonthlyIncome(int perMonthlyIncome) {
		this.perMonthlyIncome = perMonthlyIncome;
	}

	/**
	 * 收入来源
	 */
	public String getSourceIncome() {
		return sourceIncome;
	}
	/**
	 * 收入来源
	 */
	public void setSourceIncome(String sourceIncome) {
		this.sourceIncome = sourceIncome;
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
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}
	public Family(String studentNum, String level, String schoolYear,
			String tel, String address, String origin, String householdType,
			int familySize, int monthlyIncome, int perMonthlyIncome,
			String sourceIncome, String comment, int classId) {
		this.studentNum = studentNum;
		this.level = level;
		this.schoolYear = schoolYear;
		this.tel = tel;
		this.address = address;
		this.origin = origin;
		this.householdType = householdType;
		this.familySize = familySize;
		this.monthlyIncome = monthlyIncome;
		this.perMonthlyIncome = perMonthlyIncome;
		this.sourceIncome = sourceIncome;
		this.comment = comment;
		this.classId = classId;
	}
	public Family() {
	}
	@Override
	public String toString() {
		return "Family [studentNum=" + studentNum + ", level=" + level
				+ ", schoolYear=" + schoolYear + ", tel=" + tel + ", address="
				+ address + ", origin=" + origin + ", householdType="
				+ householdType + ", familySize=" + familySize
				+ ", monthlyIncome=" + monthlyIncome + ", perMonthlyIncome="
				+ perMonthlyIncome + ", sourceIncome=" + sourceIncome
				+ ", comment=" + comment + ", student=" + student
				+ ", classId=" + classId + "]";
	}
	
	
	

}