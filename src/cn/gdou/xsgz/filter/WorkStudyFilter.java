package cn.gdou.xsgz.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.gdou.xsgz.admin.workstudy.service.WorkstudyService;
import cn.gdou.xsgz.domain.Admin;
import cn.gdou.xsgz.domain.Student;

/**
 * 判断某辅导员管理的班级贫困生评定是否已经结束
 * 
 * @author zhao
 * 
 */
public class WorkStudyFilter implements Filter {
	WorkstudyService service = new WorkstudyService();

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		System.out.println("进入过滤器");
		// 查询某辅导员管理的学生是否都完成评定工作
		String url = req.getRequestURI().replace(req.getContextPath(), "");
		Admin admin = (Admin) req.getSession().getAttribute("user");
		int aRole = admin.getRoleId();
		int aSubject = admin.getSubjectId();
		if (aRole == 0 || aRole == 1) {
			chain.doFilter(request, response);
		} else {
			if ("/admin/workstudy/poorStudents.jsp".equals(url)
					|| url.equals("/admin/workstudy/admin_allotStudent.gdou")
					|| url.equals("/admin/workstudy/admin_showpoorstudent.gdou")
					|| url.equals("/admin/workstudy/admin_queryClasses.gdou")) {
				chain.doFilter(request, response);
			} else {
				List<Student> st = service.queryIsNostudent(aRole, aSubject);
				if (st.isEmpty()) {
					chain.doFilter(request, response);
				} else {
					req.getSession().setAttribute("student", st);
					System.out.println(req.getContextPath());
					resp.sendRedirect(req.getContextPath()
							+ "/admin/unfinish.jsp");
					System.out.println(req.getContextPath()
							+ "/admin/unfinish.jsp");
				}

			}
		}

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

	public void destroy() {
	}

}
