package demo;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 例子: 文件下载
 */
public class DownLoadServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/force-download");	
		
		String fileName = request.getParameter("file");		
		String path = getServletContext().getRealPath("/up/"+fileName);
		InputStream in = new FileInputStream(path);
		//处理中文问题,下载时文件名要进行URL编码(因为下载后浏览器会对文件名URL解码)	
		fileName = URLEncoder.encode(fileName, "UTF-8");
		response.setHeader("Content-Disposition", "attachment;filename="+fileName);
		
		OutputStream out = response.getOutputStream();
		int len = -1;
		byte[] b = new byte[1024];
		while((len = in.read(b))!=-1){
			out.write(b, 0, len);
		}
		out.close();
		in.close();
		
	}

}
