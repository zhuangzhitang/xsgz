package demo;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;

/**
 * 例子: 文件上传
 */
public class UploadServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String path = getServletContext().getRealPath("/up");
		DiskFileItemFactory disk = new DiskFileItemFactory();
		disk.setRepository(new File("d:/a"));		
		ServletFileUpload up = new ServletFileUpload(disk);
		
		//将多个文件上传到服务器
		try {
			FileItemIterator it = up.getItemIterator(request);
			while(it.hasNext()){
				//得到的直接是上传文件封装成的输入流对象
				FileItemStream item = it.next();
				InputStream in = item.openStream();				
				path = path + "/" + item.getName();
				FileUtils.copyInputStreamToFile(in, new File(path));
			}
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
