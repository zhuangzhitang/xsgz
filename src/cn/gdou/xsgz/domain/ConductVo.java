package cn.gdou.xsgz.domain;
/**
 * 操行分vo类
 * @author ZheTang
 * @date 2015-7-6
 *
 */
public class ConductVo {
    private int id;//
    private String conductName;//名称
    private double conductScore;//分数
    
	public ConductVo() {
		super();
	}

	public ConductVo(int id, String conductName, double conductScore) {
		super();
		this.id = id;
		this.conductName = conductName;
		this.conductScore = conductScore;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getConductName() {
		return conductName;
	}

	public void setConductName(String conductName) {
		this.conductName = conductName;
	}

	public double getConductScore() {
		return conductScore;
	}

	public void setConductScore(double conductScore) {
		this.conductScore = conductScore;
	}
	
	
}
