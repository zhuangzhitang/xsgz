package cn.gdou.xsgz.admin.base.dao;

import java.io.IOException;
import java.io.PrintWriter;

import org.apache.struts2.ServletActionContext;
import org.junit.Test;

/**
 * 普通测试
 * 
 * @author 李楚富
 * @version 2014-12-14
 */
public class NoNameTest {
	
	@Test
	public void testServletActionContext(){
		PrintWriter out = null;
		try {
			out = ServletActionContext.getResponse().getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.print("111111111111");
		out.close();
	}
}
