package cn.gdou.xsgz.domain;

public class ConductNotNextScore {
  private Integer id;
  private String sid;
  private Integer c_notnext;
  private Double score;
  private String schoolyear;
  public ConductNotNextScore(){}
	public ConductNotNextScore(Integer id, String sid, Integer c_notnext,
			Double score, String schoolyear) {
		super();
		this.id = id;
		this.sid = sid;
		this.c_notnext = c_notnext;
		this.score = score;
		this.schoolyear = schoolyear;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public Integer getC_notnext() {
		return c_notnext;
	}
	public void setC_notnext(Integer c_notnext) {
		this.c_notnext = c_notnext;
	}
	public Double getScore() {
		return score;
	}
	public void setScore(Double score) {
		this.score = score;
	}
	public String getSchoolyear() {
		return schoolyear;
	}
	public void setSchoolyear(String schoolyear) {
		this.schoolyear = schoolyear;
	}
  
}
