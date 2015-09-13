package cn.gdou.xsgz.domain;

import java.util.Map;

/**
 * 操行分对象，一个对象代表导出操行分表格的一行数据
 * @author PAD
 *
 */
public class Conduct {
   private Student student;
    /*
     * 没有下一项（也即没有更多细节项）的操行分数
     * key为1代表科技创新
     * 2代表组织管理
     * 3代表特殊分
     */
   private Map<Integer,Double> notnextScoreMap;   
   private Map<Integer,Double>  jiafengScoreMap;       //奖励加分项对应的操行分数。key为操行分小项（conductitem）的id值，value代表分数。
   private Map<Integer,Double>  koufengScoreMap;       //扣分项
   private Map<Integer,Double>  jishuScoreMap;         //技术技能
    
   private Double jiafengAllScore;     //奖励总分
   private Double koufengAllScore;     //扣分总分
   private Double jishuAllScore;      //技术技能总分
   
   private Double allScore;       //全部总分
    public Conduct(){}
	public Conduct(Student student,
			Map<Integer, Double> notnextScoreMap,
			Map<Integer, Double> jiafengScoreMap,
			Map<Integer, Double> koufengScoreMap,
			Map<Integer, Double> jishuScoreMap, Double jiafengAllScore,
			Double koufengAllScore, Double jishuAllScore, Double allScore) {
		super();
		this.student = student;
		this.notnextScoreMap = notnextScoreMap;
		this.jiafengScoreMap = jiafengScoreMap;
		this.koufengScoreMap = koufengScoreMap;
		this.jishuScoreMap = jishuScoreMap;
		this.jiafengAllScore = jiafengAllScore;
		this.koufengAllScore = koufengAllScore;
		this.jishuAllScore = jishuAllScore;
		this.allScore = allScore;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Map<Integer, Double> getNotnextScoreMap() {
		return notnextScoreMap;
	}
	public void setNotnextScoreMap(Map<Integer, Double> notnextScoreMap) {
		this.notnextScoreMap = notnextScoreMap;
	}
	public Map<Integer, Double> getJiafengScoreMap() {
		return jiafengScoreMap;
	}
	public void setJiafengScoreMap(Map<Integer, Double> jiafengScoreMap) {
		this.jiafengScoreMap = jiafengScoreMap;
	}
	public Map<Integer, Double> getKoufengScoreMap() {
		return koufengScoreMap;
	}
	public void setKoufengScoreMap(Map<Integer, Double> koufengScoreMap) {
		this.koufengScoreMap = koufengScoreMap;
	}
	public Map<Integer, Double> getJishuScoreMap() {
		return jishuScoreMap;
	}
	public void setJishuScoreMap(Map<Integer, Double> jishuScoreMap) {
		this.jishuScoreMap = jishuScoreMap;
	}
	public Double getJiafengAllScore() {
		return jiafengAllScore;
	}
	public void setJiafengAllScore(Double jiafengAllScore) {
		this.jiafengAllScore = jiafengAllScore;
	}
	public Double getKoufengAllScore() {
		return koufengAllScore;
	}
	public void setKoufengAllScore(Double koufengAllScore) {
		this.koufengAllScore = koufengAllScore;
	}
	public Double getJishuAllScore() {
		return jishuAllScore;
	}
	public void setJishuAllScore(Double jishuAllScore) {
		this.jishuAllScore = jishuAllScore;
	}
	public Double getAllScore() {
		return allScore;
	}
	public void setAllScore(Double allScore) {
		this.allScore = allScore;
	}
    
	
	
   
	   
}
