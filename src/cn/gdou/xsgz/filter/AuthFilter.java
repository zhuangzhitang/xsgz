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

import cn.gdou.xsgz.admin.system.service.AdminService;
import cn.gdou.xsgz.domain.Admin;
import cn.gdou.xsgz.domain.Student;

/**
 * 认证过滤器: 用户已登录且具有相应的权限才能访问所请求的资源
 * 
 * @author 李楚富
 * @version 2014-04-22
 */
public class AuthFilter implements Filter {
	private AdminService service = new AdminService();

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpServletRequest req = (HttpServletRequest) request;
		
		Object user = req.getSession().getAttribute("user");
		String url = req.getRequestURI().replace(req.getContextPath(), "");
		System.out.println(url);
		if(user instanceof Admin){// -------------------------- 该用户是管理员
			Admin admin = (Admin) user;
			if(url.startsWith("/admin/") ){	    
			    url = url.replace("/admin/", "");
			    
			    if(url.equals("index.jsp")){// 访问的是首页，放行
			        chain.doFilter(request, response);
			        
			    }else{
			    	if(service.isHavePermissionOnUrl(admin, url)){
                        chain.doFilter(request, response); //拥有权限，放行
			    		System.err.println("已经通过了");}
                    else //没权限访问资源，转到403页面
                    	resp.sendError(403);
			    }
				
			}else{ //资源不存在，转到404页面
				resp.sendError(404);
			}
			
		}else if(user instanceof Student){ // -------------------------- 该用户是学生
			if(url.startsWith("/student/")){
				chain.doFilter(req, resp);
				
			}else{ //资源不存在，转到404页面
				resp.sendError(404);
			}
			
		}else{// -------------------------- --------------------------   该用户不是人
			req.getSession().removeAttribute("user");
		}
		
	}
	public void init(FilterConfig filterConfig) throws ServletException {  }
	public void destroy() {	}

}
