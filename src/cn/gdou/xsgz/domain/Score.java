package cn.gdou.xsgz.domain;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Score implements Serializable{
    private Integer id;
    private String studentnum;
    //这个才是学号
    private String sid;
    //这个才是课程id
    private Integer cid;
    private Integer courseid;
    private Double grade;
    private Double bukao;
    private Double chongkao;
    private Double qingkao;
    private String schoolyear;
    private String courseName;
    public Score(){}
	public Score(Integer id, String studentnum, String sid, Integer cid,
			Integer courseid, Double grade, Double bukao, Double chongkao,
			Double qingkao, String schoolyear, String courseName) {
		super();
		this.id = id;
		this.studentnum = studentnum;
		this.sid = sid;
		this.cid = cid;
		this.courseid = courseid;
		this.grade = grade;
		this.bukao = bukao;
		this.chongkao = chongkao;
		this.qingkao = qingkao;
		this.schoolyear = schoolyear;
		this.courseName = courseName;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getStudentnum() {
		return studentnum;
	}
	public void setStudentnum(String studentnum) {
		this.studentnum = studentnum;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public Integer getCourseid() {
		return courseid;
	}
	public void setCourseid(Integer courseid) {
		this.courseid = courseid;
	}
	public Double getGrade() {
		return grade;
	}
	public void setGrade(Double grade) {
		this.grade = grade;
	}
	public Double getBukao() {
		return bukao;
	}
	public void setBukao(Double bukao) {
		this.bukao = bukao;
	}
	public Double getChongkao() {
		return chongkao;
	}
	public void setChongkao(Double chongkao) {
		this.chongkao = chongkao;
	}
	public Double getQingkao() {
		return qingkao;
	}
	public void setQingkao(Double qingkao) {
		this.qingkao = qingkao;
	}
	public String getSchoolyear() {
		return schoolyear;
	}
	public void setSchoolyear(String schoolyear) {
		this.schoolyear = schoolyear;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	
}
