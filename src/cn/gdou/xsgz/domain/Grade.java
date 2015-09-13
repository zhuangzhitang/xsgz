package cn.gdou.xsgz.domain;

import java.io.Serializable;

/**
 * 年级
 */
@SuppressWarnings("serial")
public class Grade implements Serializable{
	// 年级（如：2011）
	private String grade;

	/**
	 * 年级（如：2011）
	 */
	public String getGrade() {
		return grade;
	}
	/**
	 * 年级（如：2011）
	 */
	public void setGrade(String grade) {
		this.grade = grade;
	}

}