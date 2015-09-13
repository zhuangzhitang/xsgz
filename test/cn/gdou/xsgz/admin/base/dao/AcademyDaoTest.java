package cn.gdou.xsgz.admin.base.dao;

import static org.junit.Assert.*;

import org.junit.Test;

public class AcademyDaoTest {
   AcademyDao dao = new AcademyDao();
	@Test
	public void testExistacademyName() {
		int i = dao.isExistacademyName("信息学院");
		System.out.println(i);
	}

}
