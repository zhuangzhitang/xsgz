package cn.gdou.xsgz.admin.workstudy.service;

import java.util.List;

import cn.gdou.xsgz.admin.workstudy.dao.WorkstudyDao;
import cn.gdou.xsgz.domain.AllotInfo;
import cn.gdou.xsgz.domain.ApplyInfo;
import cn.gdou.xsgz.domain.JobArrange;
import cn.gdou.xsgz.domain.Student;

public class WorkstudyService {
	private WorkstudyDao dao = new WorkstudyDao();

	public List<Student> queryPoorStudent(int aRole, int aSubject, int classId) {
		
		return dao.queryPoorStudent(aRole,aSubject,classId);
	}

	public List<Student> allotStudent(int aRole, int aSubject, int classId) {
		return dao.allotStudent(aRole ,aSubject,classId);
	}

	public void allotStudent(String[] s2) {
		dao.allotStudent(s2);
	}

	public List<cn.gdou.xsgz.domain.Class> queryClasses(int aRole, int aSubject) {
		return dao.queryClasses(aRole,aSubject);
	}

	public List<ApplyInfo> getAllotStudents(int s,int type, int startRow, int rows) {
		return dao.getAllotStudents(s,type,startRow,rows);
	}

	public String queryLevel(String studentNum) {
		return dao.queryLevel(studentNum);
	}

	public List<Student> queryIsNostudent(int aRole,int aSubject) {
		return dao.queryIsNoStudent(aRole,aSubject);
	}

	public void totakeResult() {
		dao.totakeResult();
	}

	public void addToallotInfo(String s2, int type) {

		dao.addToallotInfo(s2,type);
	}

	public String findPath(String studentNum,int type) {
		
		return dao.findPath(studentNum,type);
	}

	public List<AllotInfo> showAllotResult(int type) {
		return dao.showAllotResult(type);
	}

	public List<JobArrange> getAttendanceStudents(int aRole, int aSubject) {
		return dao.getAttendanceStudents(aRole,aSubject);
	}

	public boolean queryIsGetLoans(String sn) {
		return dao.queryIsGetLoans(sn);
	}

	public boolean queryIsGetGrants(String sn) {
		return dao.queryIsGetGrants(sn);
	}

	public boolean queryIsGetMotivational(String sn) {
		return dao.queryIsGetMotivational(sn);
	}



}
