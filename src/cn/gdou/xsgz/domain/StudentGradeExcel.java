package cn.gdou.xsgz.domain;
import java.io.Serializable;
import java.util.Map;


public class StudentGradeExcel implements Serializable{
   private Student student;
   private Map<Integer,Map<String,String>> grade;
   public StudentGradeExcel(){}
   public StudentGradeExcel(Student student, Map<Integer, Map<String, String>> grade) {
	  super();
	  this.student = student;
	  this.grade = grade;
  }
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Map<Integer, Map<String, String>> getGrade() {
		return grade;
	}
	public void setGrade(Map<Integer, Map<String,String>> grade) {
		this.grade = grade;
	}
	   
   
}
