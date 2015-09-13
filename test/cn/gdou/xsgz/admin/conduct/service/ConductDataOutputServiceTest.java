package cn.gdou.xsgz.admin.conduct.service;

import org.junit.Test;

import cn.gdou.xsgz.domain.Conduct;

public class ConductDataOutputServiceTest {

	ConductDataOutputService service = new ConductDataOutputService();
	@Test
	public void testQueryConductByStudentNum() {
		Conduct conduct = service.queryConductByStudentNum("201211621201", "2013-2014");
		System.out.println(conduct.toString());
	}

}
