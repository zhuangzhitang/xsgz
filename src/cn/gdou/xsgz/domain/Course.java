package cn.gdou.xsgz.domain;

import java.util.Comparator;

public class Course implements Comparable<Course>{
   private Integer id;
   private String cno;
   private Integer majorID;
   //年级，如12级
   private Integer grade;
   private Integer termnum;
   //课程的状态，0为必修，1为选修，2为体育课。
   private Integer coursestatus;
   private Double credit;
   
   private String schoolyear;
   public Course(){}
   public Course(String cno, Integer majorID, Integer grade, Integer termnum,
			Integer coursestatus, Double credit,String schoolyear) {
		super();
		this.cno = cno;
		this.majorID = majorID;
		this.grade = grade;
		this.termnum = termnum;
		this.coursestatus = coursestatus;
		this.credit = credit;
		this.setSchoolyear(schoolyear);
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}
	
	public Integer getMajorID() {
		return majorID;
	}
	public void setMajorID(Integer majorID) {
		this.majorID = majorID;
	}
	
	public Integer getGrade() {
		return grade;
	}
	public void setGrade(Integer grade) {
		this.grade = grade;
	}
	public Integer getTermnum() {
		return termnum;
	}
	public void setTermnum(Integer termnum) {
		this.termnum = termnum;
	}
	public Integer getCoursestatus() {
		return coursestatus;
	}
	public void setCoursestatus(Integer coursestatus) {
		this.coursestatus = coursestatus;
	}
	public Double getCredit() {
		return credit;
	}
	public void setCredit(Double credit) {
		this.credit = credit;
	}
	public String getSchoolyear() {
		return schoolyear;
	}
	public void setSchoolyear(String schoolyear) {
		this.schoolyear = schoolyear;
	}
	@Override
	public int compareTo(Course o) {
		// TODO Auto-generated method stub
		if(o.getId()>this.getId()){
			return 1;
		}else if(o.getId()<this.getId()){
			return -1;
		}else{
		  return 0;
		}
	}
	
}
