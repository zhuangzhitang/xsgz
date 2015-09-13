package cn.gdou.xsgz.domain;

import java.io.Serializable;

/**
 * 学年
 */
@SuppressWarnings("serial")
public class SchoolYear implements Serializable{
	// 学年（如：2011-2012）
	private String schoolYear;

	/**
	 * 学年（如：2011-2012）
	 */
	public String getSchoolYear() {
		return schoolYear;
	}
	/**
	 * 学年（如：2011-2012）
	 */
	public void setSchoolYear(String schoolYear) {
		this.schoolYear = schoolYear;
	}

}