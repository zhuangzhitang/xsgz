package cn.gdou.xsgz.domain;

import java.io.Serializable;

/**
 * 宿舍
 */
@SuppressWarnings("serial")
public class Dormitory implements Serializable{
	// 宿舍Id
	private int dormitoryId;
	// 宿舍号
	private String dormitoryNum;
	// 大院Id
	private int yardId;
	
	// 大院实体
	private Yard yard;

	/**
	 * 宿舍Id
	 */
	public int getDormitoryId() {
		return dormitoryId;
	}
	/**
	 * 宿舍Id
	 */
	public void setDormitoryId(int dormitoryId) {
		this.dormitoryId = dormitoryId;
	}

	/**
	 * 宿舍号
	 */
	public String getDormitoryNum() {
		return dormitoryNum;
	}
	/**
	 * 宿舍号
	 */
	public void setDormitoryNum(String dormitoryNum) {
		this.dormitoryNum = dormitoryNum;
	}

	/**
	 * 大院Id
	 */
	public int getYardId() {
		return yardId;
	}
	/**
	 * 大院Id
	 */
	public void setYardId(int yardId) {
		this.yardId = yardId;
	}
	
	
	public Yard getYard() {
		return yard;
	}
	public void setYard(Yard yard) {
		this.yard = yard;
	}

}