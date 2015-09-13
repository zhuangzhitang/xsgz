package cn.gdou.xsgz.domain;

import java.io.Serializable;

/**
 * 申请信息
 */
@SuppressWarnings("serial")
public class ApplyInfo implements Serializable{
	// 学号
	private String studentNum;
	// 文件Id
	private String fileId;
	// 申请类别（1：助学金，2：国家励志奖学金，3：国家奖学金，4：勤工岗位）
	private int type;

	//学生尸体
	private Student student;
	//班级id
	private int classId;
	//贫困等级
	private String level;
	//贷款金额
	private String applyMoney;
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
	 * 文件Id
	 */
	public String getFileId() {
		return fileId;
	}
	/**
	 * 文件Id
	 */
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	/**
	 * 申请类别（1：助学金，2：国家励志奖学金，3：国家奖学金，4：勤工岗位）
	 */
	public int getType() {
		return type;
	}
	/**
	 * 申请类别（1：助学金，2：国家励志奖学金，3：国家奖学金，4：勤工岗位）
	 */
	public void setType(int type) {
		this.type = type;
	}
	/**
	 * 班级名称
	 */
	private String studentName;
	
	public Student getStudent() {
		return student;
	}
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
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
	
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	
	public String getApplyMoney() {
		return applyMoney;
	}
	public void setApplyMoney(String applyMoney) {
		this.applyMoney = applyMoney;
	}
	@Override
	public String toString() {
		return "ApplyInfo [studentNum=" + studentNum + ", fileId=" + fileId
				+ ", type=" + type + ", student=" + student + ", classId="
				+ classId + ", level=" + level + ", applyMoney=" + applyMoney
				+ ", studentName=" + studentName + "]";
	}
	
	
}