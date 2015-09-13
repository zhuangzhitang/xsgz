package cn.gdou.xsgz.domain;
/**
 * 导入学生信息
 * @author ZheTang
 * @date 2015-6-13
 *
 */
public class StudentInfo {
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
	private String birth;//出生年月
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
	
	public StudentInfo() {
		super();
	}
	public StudentInfo(String studentNum, String studentName, String sex,
			int classId, String timeofstart, String dormitory, String nation,
			String familybackground, String education, String identityNum,
			String bankCardNum, String birth, String politicsStatus,
			String healthStatus, String phoneNum, String qqNum, String email,
			String nativePlace, String postcode, String familyPhone,
			String address, String password) {
		super();
		this.studentNum = studentNum;
		this.studentName = studentName;
		this.sex = sex;
		this.classId = classId;
		this.timeofstart = timeofstart;
		this.dormitory = dormitory;
		this.nation = nation;
		this.familybackground = familybackground;
		this.education = education;
		this.identityNum = identityNum;
		this.bankCardNum = bankCardNum;
		this.birth = birth;
		this.politicsStatus = politicsStatus;
		this.healthStatus = healthStatus;
		this.phoneNum = phoneNum;
		this.qqNum = qqNum;
		this.email = email;
		this.nativePlace = nativePlace;
		this.postcode = postcode;
		this.familyPhone = familyPhone;
		this.address = address;
		this.password = password;
	}
	public String getStudentNum() {
		return studentNum;
	}
	public void setStudentNum(String studentNum) {
		this.studentNum = studentNum;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
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
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
