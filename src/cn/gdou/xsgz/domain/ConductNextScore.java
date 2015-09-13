package cn.gdou.xsgz.domain;

public class ConductNextScore {
   private Integer id;
   private String sid;
   private Integer c_item;
   private Double score;
   public ConductNextScore(){}
	public ConductNextScore(Integer id, String sid, Integer c_item, Double score) {
		super();
		this.id = id;
		this.sid = sid;
		this.c_item = c_item;
		this.score = score;
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
	public Integer getC_item() {
		return c_item;
	}
	public void setC_item(Integer c_item) {
		this.c_item = c_item;
	}
	public Double getScore() {
		return score;
	}
	public void setScore(Double score) {
		this.score = score;
	}
	   
}
