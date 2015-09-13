package demo;


import org.apache.commons.dbutils.QueryRunner;

import cn.gdou.xsgz.domain.Student;
import cn.gdou.xsgz.util.DatabaseUtil;

public class AddtoStudent {
	public static void main(String args[]) throws Exception{
		QueryRunner qr = new QueryRunner(DatabaseUtil.getDataSource());
		String sql ="INSERT INTO student(studentNum,studentName,classId,PASSWORD,sex,"+
		"birth,IdentityNum,phoneNum)VALUES(?,?,?,?,?,?,?,?)";
		//"201211621131,'赵志锋',1,123,'男','1994-10-17',362329199410171675,11621331)
		Student s = new Student();
		int i =1;
		while(i<30){
			
			
			
			
			
			qr.update(sql,s.getStudentNum(),s.getStudentName(),
					s.getClassId(),s.getPassword(),s.getSex(),s.getBirth(),s.getIdentityNum(),s.getPhoneNum());
		}
	}
	

}
