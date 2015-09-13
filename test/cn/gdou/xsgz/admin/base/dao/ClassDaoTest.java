package cn.gdou.xsgz.admin.base.dao;

import java.util.List;

import org.junit.Test;

import cn.gdou.xsgz.domain.Class;

public class ClassDaoTest {
	
	ClassDao  dao = ClassDao.getClassDaoInstance();
	@Test
	public void testListClassByMajorId() {
		List<Class> list = dao.listClassByMajorId(1);
		for (Class domain:list) {
			System.out.println(domain);
		}
	}

	@Test
	public void testAdd() {
		Class class1 = new Class();
		class1.setClassName("计科1121");
		class1.setClassTeacher("陈绍伟");
		class1.setGrade("2012");
		class1.setMajorId(1);
		class1.setMonitor("梁建成");
		class1.setMonitor_connection("15812352269");
		class1.setTeacherTel("15812352269");
		dao.add(class1);
	}

	@Test
	public void testUpdate() {
		Class class1 = new Class();
		class1.setClassId(7);
		class1.setClassName("计科1122");
		class1.setClassTeacher("陈绍伟");
		class1.setGrade("2012");
		class1.setMajorId(1);
		class1.setMonitor("梁建成");
		class1.setMonitor_connection("15812352269");
		class1.setTeacherTel("15812352269");
		dao.update(class1);
	}

	@Test
	public void testDelete() {
		dao.delete(7);
	}
	
	@Test
	public void testisExistClassName() {
		int i =dao.isExistClassName("计科1121");
		System.out.print(i);
	}
}
