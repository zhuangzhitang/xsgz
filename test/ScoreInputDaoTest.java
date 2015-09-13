

import static org.junit.Assert.*;

import org.junit.Test;

import cn.gdou.xsgz.admin.scholarships.dao.ScoreInputDao;

public class ScoreInputDaoTest {
   private ScoreInputDao dao=new ScoreInputDao();
	@Test
	public void testAlreadyInputTermNum() {
		System.out.println(dao.alreadyInputTermNum(5));
	}

}
