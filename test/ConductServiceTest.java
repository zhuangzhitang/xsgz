

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.junit.Test;

import cn.gdou.xsgz.admin.conduct.dao.ConductDao;
import cn.gdou.xsgz.admin.conduct.dao.ConductDataOutputDao;
import cn.gdou.xsgz.admin.conduct.service.ConductService;
import cn.gdou.xsgz.domain.Conductitem;

public class ConductServiceTest {
   private ConductService service=new ConductService();
   private ConductDataOutputDao d=new ConductDataOutputDao();
   private ConductDao dao=new ConductDao();
	@Test
	public void testgetSecondConduct() {
		System.out.println(service.getSecondConduct(0));
	}
	@Test
	public void testgetConductItem(){
		//System.out.println(service.getConductItem().toString());
	}
	@Test
	public void teat(){
		Conductitem c=new Conductitem(1,"义务献血",1,"2014-2015");
		System.out.println(dao.isHaveConductItem(c));
	}
	@Test
	public void test(){
		
	}
}
