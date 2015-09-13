package cn.gdou.xsgz.domain;

import java.util.Comparator;
import java.util.Map;

/**
 * 一个对象代表综合测评表的一行数据
 * @author guozaopeng
 *
 */
public class ScoreAndConduct implements Comparable<ScoreAndConduct>{
   private Student student;
   //成绩集合,key值是课程Id,value是成绩
   private Map<Integer,Double> score;
   //操行分集合，key是操行分项目代号，value是操行分数
   private Map<Integer,Double> conduct;
   private Double avgCredit; //平均绩点
   private Double avgScore;  //学业成绩
   private Integer avgScoreNum; //学业成绩名次
   private Double caoxingScore; //操行总分
   private Integer caoxingScoreNum; //操行总分名次
   private Double nengliScore;   //能力总分
   private Double allscore;   //总评分数
   private Integer allscoreNum; //总评名次
   private Double sportscore;   //体育分
   
   private String num="";  //获奖等级
   private Integer guakeNUm;//挂科数目
   private Double guakeCredit;//挂科学分
   public Double getAvgCredit() {
	return avgCredit;
  }
	public void setAvgCredit(Double avgCredit) {
		this.avgCredit = avgCredit;
	}
	public Double getAvgScore() {
		return avgScore;
	}
	public void setAvgScore(Double avgScore) {
		this.avgScore = avgScore;
	}
	public Integer getAvgScoreNum() {
		return avgScoreNum;
	}
	public void setAvgScoreNum(Integer avgScoreNum) {
		this.avgScoreNum = avgScoreNum;
	}
	public Double getCaoxingScore() {
		return caoxingScore;
	}
	public void setCaoxingScore(Double caoxingScore) {
		this.caoxingScore = caoxingScore;
	}
	public Integer getCaoxingScoreNum() {
		return caoxingScoreNum;
	}
	public void setCaoxingScoreNum(Integer caoxingScoreNum) {
		this.caoxingScoreNum = caoxingScoreNum;
	}
	public Double getNengliScore() {
		return nengliScore;
	}
	public void setNengliScore(Double nengliScore) {
		this.nengliScore = nengliScore;
	}
	public Double getAllscore() {
		return allscore;
	}
	public void setAllscore(Double allscore) {
		this.allscore = allscore;
	}
	public Integer getAllscoreNum() {
		return allscoreNum;
	}
	public void setAllscoreNum(Integer allscoreNum) {
		this.allscoreNum = allscoreNum;
	}
	public Double getSportscore() {
		return sportscore;
	}
	public void setSportscore(Double sportscore) {
		this.sportscore = sportscore;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public Integer getGuakeNUm() {
		return guakeNUm;
	}
	public void setGuakeNUm(Integer guakeNUm) {
		this.guakeNUm = guakeNUm;
	}
    public ScoreAndConduct(){}
	public ScoreAndConduct(Student student, Map<Integer, Double> score,
			Map<Integer, Double> conduct) {
		super();
		this.student = student;
		this.score = score;
		this.conduct = conduct;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Map<Integer, Double> getScore() {
		return score;
	}
	public void setScore(Map<Integer, Double> score) {
		this.score = score;
	}
	public Map<Integer, Double> getConduct() {
		return conduct;
	}
	public void setConduct(Map<Integer, Double> conduct) {
		this.conduct = conduct;
	}
	@Override
	public int compareTo(ScoreAndConduct o) {
		if(o.getAllscore()>this.getAllscore()){
			return 1;
		}else if(o.getAllscore()<this.getAllscore()){
			return -1;
		}else{
		   return 0;
		}
	}
	public Double getGuakeCredit() {
		return guakeCredit;
	}
	public void setGuakeCredit(Double guakeCredit) {
		this.guakeCredit = guakeCredit;
	}
	  
}
  
