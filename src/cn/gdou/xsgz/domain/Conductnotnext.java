package cn.gdou.xsgz.domain;

public class Conductnotnext {
    private Integer id;
    private String conduct_nothavenext;
    public Conductnotnext(){}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getConduct_nothavenext() {
		return conduct_nothavenext;
	}
	public void setConduct_nothavenext(String conduct_nothavenext) {
		this.conduct_nothavenext = conduct_nothavenext;
	}
	public Conductnotnext(Integer id, String conduct_nothavenext) {
		super();
		this.id = id;
		this.conduct_nothavenext = conduct_nothavenext;
	}
    
}
