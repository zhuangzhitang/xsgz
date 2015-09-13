package cn.gdou.xsgz.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 验证过滤器: 只有登录的用户才能访问系统
 * 
 * @author 李楚富
 * @version 2014-04-22
 */
public class LoginFilter implements Filter {
	
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		Object user = req.getSession().getAttribute("user");
		
		//用户未登录，重定向到登录页面
		if(user==null){
		    HttpServletResponse resp = (HttpServletResponse) response;
			resp.sendRedirect(req.getContextPath()+"/index.jsp");
			
		}else{
			chain.doFilter(request, response);
		}
	}
	
	public void init(FilterConfig filterConfig) throws ServletException {    }
	public void destroy() {	}
}
