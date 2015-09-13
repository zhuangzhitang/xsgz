package cn.gdou.xsgz.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;

/**
 * 通用工具 (以后还有什么常用的方法继续添加到此工具类中,未完待续...)
 * 
 * @author 李楚富
 * @version 2014-04-22
 */
public class GenericUtil {
	
	/**
	 * 获取32位的随机字符串，用于生成ID
	 */
	public static String getUUID(){
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	/**
	 * 获取当前日期的字符串
	 */
	public static String getDate(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(new Date());
	}
	
	/**
	 * 获取当前时间的字符串
	 */
	public static String getDateTime(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(new Date());
	}
	
	/**
	 * 获取系统的换行符
	 */
	public static String getLineSeparator(){
		return System.getProperty("line.separator");
	}
	
	/**
	 * 根据用户名和密码进行加密
	 * @param name 用户名
	 * @param pwd  密码
	 * @return 加密后的密码
	 */
	public static String encrypt(String name, String pwd){	
		if(StringUtils.isBlank(name))
			throw new RuntimeException("加密失败！name不能为空！");
		if(StringUtils.isBlank(pwd))
			throw new RuntimeException("加密失败！pwd不能为空！");
		
		int nameHash = name.hashCode();//盐值
		StringBuilder result = new StringBuilder();
		
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] bs = md.digest(pwd.getBytes());		
			
			for(byte b:bs){
				int tmp = b + nameHash;
				int num = tmp & 0xff;
				if(num<16){
					num+=16;
				}
				String numHex = Integer.toHexString(num);
				result.append(numHex);
			}			
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException("加密失败: "+e.getMessage());
		}	
		
		return result.toString();
	}
	
	
	/**
	 * 输出操作成功或失败的json消息
	 * @param result 操作结果（成功则为"success"，否则为错误信息）
	 * @param successMsg 操作成功返回给前台的消息
	 * @param json 以success或errorMsg为key的JSONObject
	 */
	public static JSONObject getOperateJSONObject(String result, String successMsg){
		if(StringUtils.isBlank(result))
			throw new RuntimeException("JSONObject生成失败！result不能为空！");
		if(StringUtils.isBlank(successMsg))
			throw new RuntimeException("JSONObject生成失败！successMsg不能为空！");
		
		JSONObject json = new JSONObject();
		if("success".equals(result)){
			json.put("success", successMsg);
		}else{
			json.put("errorMsg", result);
		}
		
		return json;
	}
	
}
