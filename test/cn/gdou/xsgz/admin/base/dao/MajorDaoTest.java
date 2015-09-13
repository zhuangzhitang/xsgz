package cn.gdou.xsgz.admin.base.dao;

import org.junit.Test;

import cn.gdou.xsgz.domain.Major;

public class MajorDaoTest {
	private MajorDao dao = MajorDao.getMajorDaoInstance();
	@Test
	public void testAdd() {
		Major major = new Major();
		major.setAcademyId(1);
		major.setCounselor("陈绍伟");
		major.setMajorName("信息管理与信息系统");
		major.setShortName("信管");
		major.setTel("15812352269");
		int result = dao.add(major);
		System.out.println(result);
	}
	
	@Test
	public void testUpdate() {
		Major major = new Major();
		major.setMajorId(9);
		major.setAcademyId(1);
		major.setCounselor("庄智堂");
		major.setMajorName("信息管理与信息系统");
		major.setShortName("信管");
		major.setTel("1458751231");
		int result = dao.update(major);
		System.out.println(result);
	}
	
	@Test
	public void testDelete() {
		
		int result = dao.delete(10);
		System.out.println(result);
	}
	@Test
	public void testisExistMajorName(){
		int i = dao.isExistMajorName("计算机科学与技术");
		System.out.println(i);
	}
}
