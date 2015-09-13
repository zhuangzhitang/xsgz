package cn.gdou.xsgz.domain;

public class poorStudent {
	private String studentNum;
	private int score;
	private int classId;
	public String getStudentNum() {
		return studentNum;
	}
	public void setStudentNum(String studentNum) {
		this.studentNum = studentNum;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}
	@Override
	public String toString() {
		return "poorStrudent [studentNum=" + studentNum + ", score=" + score
				+ ", classId=" + classId + "]";
	}
	public poorStudent(String studentNum, int score, int classId) {
		this.studentNum = studentNum;
		this.score = score;
		this.classId = classId;
	}
	public poorStudent() {
	}
	

}
