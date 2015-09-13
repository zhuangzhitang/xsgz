package cn.gdou.xsgz.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * 学生
 */
@SuppressWarnings("serial")
public class Student implements Serializable{
	private String studentNum;//学号
	private String studentName;//姓名
	private String sex;//性别
	private int  classId;//班级id
	private String timeofstart;//入学年份
	private String dormitory;//宿舍
	private String nation;//民族
	private String familybackground;//家庭出身
	private String education;//教育程度
	private String identityNum;//身份证号
	private String bankCardNum;//银行卡号
	private Date birth;//出生年月
	private String politicsStatus;//政治面貌
	private String healthStatus;//健康状况
	private String phoneNum;//手机
	private String qqNum;//QQ号码
	private String email;//Email
	private String nativePlace;//籍贯
	private String postcode;//邮政编码
	private String familyPhone;//家庭电话
	private String address;//家庭地址
	private String password;//密码
    private String shortNum;//短号
    private String highschool;//毕业高中
	
	
	// 班级实体
	private Class _class;
	
	//是否有权限进行贫困生评定
	private int isallowevaluate;
	
	//是否为贫困生
	
	private int ispoorstudent;
	
	//头像照片路径
	
	private String photo_path;
	
	//班名
	private String className;
	private int familySize;
	// 家庭月收入(整数)
	private int monthlyIncome;
	// 困难等级 (0：特殊困难，1：困难，2：一般困难)
	private String level;
	
	private String comment;
	
	
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getShortNum() {
		return shortNum;
	}
	public void setShortNum(String shortNum) {
		this.shortNum = shortNum;
	}
	public String getHighschool() {
		return highschool;
	}
	public void setHighschool(String highschool) {
		this.highschool = highschool;
	}
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
	 * 姓名
	 */
	public String getStudentName() {
		return studentName;
	}
	/**
	 * 姓名
	 */
	public void setStudentName(String studentName) {
		this.studentName = studentName;
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
	 * 密码
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * 密码
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * 性别
	 */
	public String getSex() {
		return sex;
	}
	/**
	 * 性别
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getTimeofstart() {
		return timeofstart;
	}
	public void setTimeofstart(String timeofstart) {
		this.timeofstart = timeofstart;
	}
	public String getDormitory() {
		return dormitory;
	}
	public void setDormitory(String dormitory) {
		this.dormitory = dormitory;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getFamilybackground() {
		return familybackground;
	}
	public void setFamilybackground(String familybackground) {
		this.familybackground = familybackground;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getIdentityNum() {
		return identityNum;
	}
	public void setIdentityNum(String identityNum) {
		this.identityNum = identityNum;
	}
	public String getBankCardNum() {
		return bankCardNum;
	}
	public void setBankCardNum(String bankCardNum) {
		this.bankCardNum = bankCardNum;
	}
	
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getPoliticsStatus() {
		return politicsStatus;
	}
	public void setPoliticsStatus(String politicsStatus) {
		this.politicsStatus = politicsStatus;
	}
	public String getHealthStatus() {
		return healthStatus;
	}
	public void setHealthStatus(String healthStatus) {
		this.healthStatus = healthStatus;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getQqNum() {
		return qqNum;
	}
	public void setQqNum(String qqNum) {
		this.qqNum = qqNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNativePlace() {
		return nativePlace;
	}
	public void setNativePlace(String nativePlace) {
		this.nativePlace = nativePlace;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getFamilyPhone() {
		return familyPhone;
	}
	public void setFamilyPhone(String familyPhone) {
		this.familyPhone = familyPhone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Class get_class() {
		return _class;
	}
	public void set_class(Class _class) {
		this._class = _class;
	}
	public int getIsallowevaluate() {
		return isallowevaluate;
	}
	public void setIsallowevaluate(int isallowevaluate) {
		this.isallowevaluate = isallowevaluate;
	}
	public int getIspoorstudent() {
		return ispoorstudent;
	}
	public void setIspoorstudent(int ispoorstudent) {
		this.ispoorstudent = ispoorstudent;
	}
	public String getPhoto_path() {
		return photo_path;
	}
	public void setPhoto_path(String photo_path) {
		this.photo_path = photo_path;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public int getFamilySize() {
		return familySize;
	}
	public void setFamilySize(int familySize) {
		this.familySize = familySize;
	}
	public int getMonthlyIncome() {
		return monthlyIncome;
	}
	public void setMonthlyIncome(int monthlyIncome) {
		this.monthlyIncome = monthlyIncome;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}

	
	
	
}

