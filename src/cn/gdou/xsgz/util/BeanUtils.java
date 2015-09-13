package cn.gdou.xsgz.util;
import java.util.Map;

/**
 * javaBean工具类 <br/>
 * 重写org.apache.commons.beanutils.BeanUtils.populate方法避免try,catch的麻烦
 * 
 * @author 李楚富
 * @version 2014-04-22
 */
public class BeanUtils {
	
	public static <T>T populate(T t,Map<String,Object> map){
		try{
			org.apache.commons.beanutils.BeanUtils.populate(t,map);
			return t;
		}catch(Exception e){
			throw new RuntimeException(e.getMessage(),e);
		}
	}
	
	public static <T>T populate(Class<T> cls,Map<String,Object> map){
		try{
			T t = cls.newInstance();
			return populate(t, map);
		}catch(Exception e){
			throw new RuntimeException(e.getMessage(),e);
		}
	}
}
