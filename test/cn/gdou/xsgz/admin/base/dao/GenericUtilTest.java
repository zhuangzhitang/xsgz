package cn.gdou.xsgz.admin.base.dao;

import org.junit.Test;

import cn.gdou.xsgz.util.GenericUtil;

/**
 * 测试GenericUtil
 * 
 * @author 李楚富
 * @version 2014-12-14
 */
public class GenericUtilTest {
	
	@Test
	public void testEncrypt(){
		String name = "201211621131";
		String pwd = "123";
		
		System.out.println(GenericUtil.encrypt(name, pwd));
		
	}
}
