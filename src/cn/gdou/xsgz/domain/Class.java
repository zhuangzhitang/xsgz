package cn.gdou.xsgz.domain;

import java.io.Serializable;

/**
 * 班级信息
 */
@SuppressWarnings("serial")
public class Class implements Serializable{
	// 班级Id
	private int classId;
	// 班级名称
	private String className;
	// 专业Id
	private int majorId;
	// 年级
	private String grade;
	// 班主任
	private String classTeacher;
	// 班主任联系电话
	private String teacherTel;
	// 班长
	private String monitor;
	
	//联系方式
	private String monitor_connection;
	
	// 专业实体
	private Major major;

	public String getMonitor_connection() {
		return monitor_connection;
	}
	public void setMonitor_connection(String monitor_connection) {
		this.monitor_connection = monitor_connection;
	}
	/**
	 * 班级Id
	 */
	public int getClassId() {
		return classId;
	}
	/**
	 * 班级Id
	 */
	public void setClassId(int classId) {
		this.classId = classId;
	}

	/**
	 * 班级名称
	 */
	public String getClassName() {
		return className;
	}
	/**
	 * 班级名称
	 */
	public void setClassName(String className) {
		this.className = className;
	}

	/**
	 * 专业Id
	 */
	public int getMajorId() {
		return majorId;
	}
	/**
	 * 专业Id
	 */
	public void setMajorId(int majorId) {
		this.majorId = majorId;
	}

	/**
	 * 年级
	 */
	public String getGrade() {
		return grade;
	}
	/**
	 * 年级
	 */
	public void setGrade(String grade) {
		this.grade = grade;
	}

	/**
	 * 班主任
	 */
	public String getClassTeacher() {
		return classTeacher;
	}
	/**
	 * 班主任
	 */
	public void setClassTeacher(String classTeacher) {
		this.classTeacher = classTeacher;
	}

	/**
	 * 班主任联系电话
	 */
	public String getTeacherTel() {
		return teacherTel;
	}
	/**
	 * 班主任联系电话
	 */
	public void setTeacherTel(String teacherTel) {
		this.teacherTel = teacherTel;
	}

	/**
	 * 班长
	 */
	public String getMonitor() {
		return monitor;
	}
	/**
	 * 班长
	 */
	public void setMonitor(String monitor) {
		this.monitor = monitor;
	}
	@Override
	public String toString() {
		return "Class [classId=" + classId + ", className=" + className
				+ ", majorId=" + majorId + ", grade=" + grade
				+ ", classTeacher=" + classTeacher + ", teacherTel="
				+ teacherTel + ", monitor=" + monitor + "]";
	}
	
	
	public Major getMajor() {
		return major;
	}
	public void setMajor(Major major) {
		this.major = major;
	}
	
}