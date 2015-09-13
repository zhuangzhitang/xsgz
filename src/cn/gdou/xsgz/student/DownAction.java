package cn.gdou.xsgz.student;

import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import cn.gdou.xsgz.student.service.DownService;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 下载Action: 处理关于Student的文件下载请求
 * 
 * @author 潘木坚
 * @version 2014-10-05
 */
@SuppressWarnings("serial")
public class DownAction extends ActionSupport{
	
	DownService service = new DownService();
	private String res;//需要下载的文件
	private String resType;//需要下载的文件类型
	private String resName;//需要下载的文件名称
	
	private Map<String,Object> fileList;;
	private String sEcho;// sEcho，这个参数从客户端接收后，要原封不动的返回客户端
	private Integer iDisplayStart;// iDisplayStart，开始显示项如：0，10，20
	private Integer iDisplayLength;// iDisplayLength，显示多少条
	
	public String getRes() {
		return res;
	}
	public void setRes(String res) throws Exception {
		//预防需要下载的文件含有中文字符
//		this.res = res;
		this.res = URLDecoder.decode(res,"utf-8");
	}
	public String getResType() {
		return resType;
	}
	public void setResType(String resType) {
		this.resType = resType;
	}
	public String getResName() {
		return resName;
	}
	public void setResName(String resName) {
		this.resName = resName;
	}
	public Map<String, Object> getFileList() {
		return fileList;
	}
	public void setFileList(Map<String, Object> fileList) {
		this.fileList = fileList;
	}
	
	public InputStream getFile() throws Exception{
		return new FileInputStream(ServletActionContext.getServletContext()
				.getRealPath("/file/down")+"/"+res);
	}
	
	@SuppressWarnings("unchecked")
	public String getDownfileList(){
		Map<String,Object> result = new HashMap<String,Object>();
		if(iDisplayStart == null){
			iDisplayStart = 0;
		}
		if(iDisplayLength == null){
			iDisplayLength = 10;
		}
		//获取供下载文档信息，封装成map
		try {
			result = service.getDownfileList(iDisplayStart, iDisplayLength);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("stauts", -1);
			result.put("error", "获取下载文档列表出错!");
		}
		
		result.put("sEcho", sEcho);
		
		result.put("stauts", 0);
		result.put("error", "");
		fileList = JSONObject.fromObject(result);
		
		return SUCCESS;
	}

}
