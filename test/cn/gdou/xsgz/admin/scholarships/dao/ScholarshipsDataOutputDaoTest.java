package cn.gdou.xsgz.admin.scholarships.dao;

import org.junit.Test;

public class ScholarshipsDataOutputDaoTest {
    ScholarshipsDataOutputDao dao = new ScholarshipsDataOutputDao();
	@Test
	public void testUpdateScoreById() {
		int result = dao.updateScoreById("5468", "80", null,null, null);
		System.out.println("result:"+result);
	}

}
