package cn.gdou.xsgz.domain;

public class Conductitem {
   private Integer id;
   private String conduct_name;
   private Integer conduct_superitem;
   private String schoolyear;
   private ConductHaveNext conductHaveNext;
   public Conductitem(){}
	public Conductitem(Integer id, String conduct_name, Integer conduct_superitem,
			String schoolyear) {
		super();
		this.id = id;
		this.conduct_name = conduct_name;
		this.conduct_superitem = conduct_superitem;
		this.schoolyear = schoolyear;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getConduct_name() {
		return conduct_name;
	}
	public void setConduct_name(String conduct_name) {
		this.conduct_name = conduct_name;
	}
	public Integer getConduct_superitem() {
		return conduct_superitem;
	}
	public void setConduct_superitem(Integer conduct_superitem) {
		this.conduct_superitem = conduct_superitem;
	}
	public String getSchoolyear() {
		return schoolyear;
	}
	public void setSchoolyear(String schoolyear) {
		this.schoolyear = schoolyear;
	}
	public ConductHaveNext getConductHaveNext() {
		return conductHaveNext;
	}
	public void setConductHaveNext(ConductHaveNext conductHaveNext) {
		this.conductHaveNext = conductHaveNext;
	}
	   
}
