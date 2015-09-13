package cn.gdou.xsgz.admin.conduct.dao;

import static org.junit.Assert.*;

import org.junit.Test;

import com.sun.org.apache.bcel.internal.generic.NEW;

public class ConductDataOutputDaoTest {
    ConductDataOutputDao dao = new ConductDataOutputDao();
	@Test
	public void testUpdateConductScoreById() {
		int result = dao.updateConductScoreById(1,"8");
		System.out.println("result:"+result);
	}

}
