package cn.gdou.xsgz.domain;

public class ConductHaveNext {
   private Integer id;
   private String conduct_havenext;
   public ConductHaveNext(){}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getConduct_havenext() {
		return conduct_havenext;
	}
	public void setConduct_havenext(String conduct_havenext) {
		this.conduct_havenext = conduct_havenext;
	}
	public ConductHaveNext(Integer id, String conduct_havenext) {
		super();
		this.id = id;
		this.conduct_havenext = conduct_havenext;
	}
   
}
