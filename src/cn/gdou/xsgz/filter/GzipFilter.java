package cn.gdou.xsgz.filter;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.zip.GZIPOutputStream;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
/**
 * 压缩过滤器: 对系统的所有响应信息进行压缩
 * 
 * @author 李楚富
 * @version 2014-04-22
 */
public class GzipFilter implements Filter {
	
	public void init(FilterConfig filterConfig) throws ServletException {	}
	public void destroy() {	}
	
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		//过来时拦截后将response包装后再放行
		HttpServletResponse resp  = (HttpServletResponse) response;
		MyResponse my = new MyResponse(resp);
	
		chain.doFilter(request, my);
		//获取数据的字节数组,使用GZIPOutputStream将其压缩到ByteArrayOutputStream中
		byte[] src = my.getSrcBytes();		
		ByteArrayOutputStream dest = new ByteArrayOutputStream();
		GZIPOutputStream gzip = new GZIPOutputStream(dest);
		gzip.write(src);
		gzip.close();
				
		byte[] destBytes = dest.toByteArray();
		//向浏览器输出必须使用原生的response
		resp.setContentType("text/html;charset=UTF-8");
		resp.setHeader("Content-encoding", "gzip");
		resp.setContentLength(destBytes.length);
		ServletOutputStream out = resp.getOutputStream();
		out.write(destBytes);
		
	}
}

class MyResponse extends HttpServletResponseWrapper{
	private ByteArrayOutputStream dest;
	private PrintWriter out;
	ServletOutputStream output;
	public MyResponse(HttpServletResponse response) {
		super(response);		
	}
	
	public PrintWriter getWriter() throws IOException{
		dest = new ByteArrayOutputStream();
		out = new PrintWriter(new OutputStreamWriter(dest,"UTF-8"));		
		return out;		
	}
	
	@Override
	public ServletOutputStream getOutputStream() throws IOException {
		dest = new ByteArrayOutputStream();
		output = new ServletOutputStream() {
			public void write(int b) throws IOException {
				//在Servlet中使用getOutputStream写入数据时必须指定编码格式!!!!!!!!!!!!!
				dest.write(b);
			}
		};
		return output;
	}
	
	public byte[] getSrcBytes() throws IOException{
		//若不关闭PrintWriter,所有数据不会清空写入到ByteArrayOutputStream中
		if(out!=null){
			out.close();
		}
		return dest.toByteArray();
	}
	
}