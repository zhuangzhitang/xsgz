package cn.gdou.xsgz.filter;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.lang.StringUtils;

/**
 * 字符编码过滤器：  <br> <br>
 * 1. 设置request和response的编码格式 <br>
 * 2. 包装HttpServletRequest，处理中文参数问题 <br>
 * 
 * @author 李楚富
 * @version 2014-04-22
 */
public class CharacterEncodingFilter implements Filter {
	
	private String encoding;
	public void init(FilterConfig filterConfig) throws ServletException {
		//读取CharacterEncodingFilter的配置参数
		System.out.println("enter CharacterEncodingFilter");
		encoding = filterConfig.getInitParameter("encoding");		
	}
	
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		//1.设置request和response的编码格式 
		request.setCharacterEncoding(encoding);
		response.setContentType("text/html;charset="+encoding);
		
		//为了提高性能，先判断请求方式是否为GET，是GET才对request进行包装
		HttpServletRequest req = (HttpServletRequest) request;
		if(req.getMethod().equals("GET")){
			req = new MyRequest(req); 
		}
		
		chain.doFilter(req, response);
	}
	public void destroy() {

	}
}

/**
 * 对get方式的request进行包装,处理参数乱码问题,已完成四个获取请求参数方法的重写
 */
class MyRequest extends HttpServletRequestWrapper{
	
	public MyRequest(HttpServletRequest request) {
		super(request);		
	}
	
	public String getParameter(String name){
		String value = super.getRequest().getParameter(name);
		if(StringUtils.isBlank(value))
			return value;
		
		try {
			//--------------------将 "ISO-8859-1" 格式转换成 request的编码格式
			value = new String(value.getBytes("ISO-8859-1"),super.getCharacterEncoding());
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return value;
	}	
	
	public Enumeration<String> getParameterNames(){
		Enumeration<String> en = super.getRequest().getParameterNames();
		List<String> list = new ArrayList<String>();
		
		while(en.hasMoreElements()){			
			try {
				String value = en.nextElement();
				if(StringUtils.isNotBlank(value))
					value = new String(value.getBytes("ISO-8859-1"),super.getCharacterEncoding());	
				
				list.add(value);
					
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}			
		}		
		return Collections.enumeration(list);
	}
	
	public Map<String, String[]> getParameterMap(){
		Map<String, String[]> map= super.getRequest().getParameterMap();
		Map<String, String[]> newMap = new HashMap<String, String[]>();
		Iterator<Map.Entry<String, String[]>> it = map.entrySet().iterator();
		try {
			while(it.hasNext()){
				Entry<String, String[]> entry = it.next();
				String key = entry.getKey();	
				if(StringUtils.isNotBlank(key))
					key = new String(key.getBytes("ISO-8859-1"),super.getCharacterEncoding());
				
				String [] values = entry.getValue();
				for(int i=0;i<values.length;i++){
					if(StringUtils.isNotBlank(values[i]))
						values[i] = new String(values[i] .getBytes("ISO-8859-1"),super.getCharacterEncoding());
				}
				newMap.put(key, values);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.err.println(newMap);
		return newMap;
	}
	
	public String[] getParameterValues(String name){
		String[] values = super.getRequest().getParameterValues(name);
		for(int i=0;i<values.length;i++){
			try {
				if(StringUtils.isNotBlank(values[i]))
					values[i] = new String(values[i].getBytes("ISO-8859-1"),super.getCharacterEncoding());
				
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return values;
	}
	
}
