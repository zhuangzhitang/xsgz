package cn.gdou.xsgz.admin.base;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.junit.runner.Request;

import cn.gdou.xsgz.admin.base.dao.StudentInfoDao;
import cn.gdou.xsgz.admin.base.service.StudentInfoService;
import cn.gdou.xsgz.admin.conduct.service.ConductDataOutputService;
import cn.gdou.xsgz.admin.scholarships.service.ScholarshipsDataOutputService;
import cn.gdou.xsgz.domain.Admin;
import cn.gdou.xsgz.domain.ConductVo;
import cn.gdou.xsgz.domain.Score;
import cn.gdou.xsgz.domain.Student;
import cn.gdou.xsgz.domain.StudentVo;
import cn.gdou.xsgz.util.DeCompressUtil;
import cn.gdou.xsgz.util.ExportStudentInfos;
import cn.gdou.xsgz.util.GenericUtil;
import cn.gdou.xsgz.util.ReadExcel;

import com.opensymphony.xwork2.ActionSupport;

import flexjson.JSONSerializer;


public class StudentInfoAction extends ActionSupport {
	
	

	private static final long serialVersionUID = 1L;
	
	@SuppressWarnings("unused")
	private String uploadtype;
	
	private File uploadFile;
	@SuppressWarnings("unused")
	private String uploadFileContentType;//上传的文件类型
	private String uploadFileFileName=null;//上传文件的名称
	
	private Student infos  ;
	
	
	
	public Student getInfos() {
		System.out.println("------getInfos--------");
		return infos;
	}


	public void setInfos(Student infos) {
		System.out.println("--------setInfos--------");
		this.infos = infos;
	}

	private static StudentInfoService service = new StudentInfoService();
	
	public void setUploadtype(String uploadtype) {
		this.uploadtype = uploadtype;
	}


	public void setUploadFile(File uploadFile) {
		this.uploadFile = uploadFile;
	}


	public void setUploadFileContentType(String uploadFileContentType) {
		this.uploadFileContentType = uploadFileContentType;
	}


	public void setUploadFileFileName(String uploadFileFileName) {
		this.uploadFileFileName = uploadFileFileName;
	}

	public void uploadFile() throws Exception{
		System.out.println("enter uploadFile");
		if(uploadFile == null){
			String result = "请选择文件";
			JSONObject json = GenericUtil.getOperateJSONObject(result, "导入学生信息成功");
			printJson(json);
			return;
		}
		//将提交的文件写入到服务器
		HttpServletRequest req = ServletActionContext.getRequest();
		int uploadtype = Integer.parseInt(req.getParameter("uploadtype"));
		
		FileInputStream is = new FileInputStream(uploadFile);
		
		if(uploadtype ==1){
			System.out.println("进入导入学生信息");
			if(!uploadFileFileName.contains("xls")){
				String result = "导入学生信息失败！请检查文件格式为xls格式";
				JSONObject json = GenericUtil.getOperateJSONObject(result, "导入学生信息成功");
				printJson(json);
				return;
			}
			ReadExcel readExcel = new ReadExcel(is);
			List<String[]> lists= readExcel.getAllData(0);
			if(lists.get(1).length!=21){
				String result = "导入学生信息失败！请导入正确的表格文件";
				JSONObject json = GenericUtil.getOperateJSONObject(result, "导入学生信息成功");
				printJson(json);
				return;
			}
			
			String result = service.batchInsertStudentInfo(lists);
			String successMsg = "导入学生信息成功！";//"导入学生信息失败！请稍后重试！"
			JSONObject json = GenericUtil.getOperateJSONObject(result, successMsg);
			printJson(json);
		}else if(uploadtype ==2){
			String uploadPathBase = ServletActionContext.getServletContext().getRealPath("/file/temp");
			//将提交的文件写入到服务器
			String path = uploadPathBase+"\\"+uploadFileFileName;
			String destDir = ServletActionContext.getServletContext().getRealPath("/file/image");
			List<String> namepaths = DeCompressUtil.getNames(uploadFile);
			String result = service.batchInsertImagePath(namepaths);
			if(result == "success"){
				DeCompressUtil.deCompress(path,uploadFile, destDir);
			}
			String successMsg = "导入图片信息成功！";
			JSONObject json = GenericUtil.getOperateJSONObject(result, successMsg);
			printJson(json);
		}
		
	
	}
	
	/*
	 * 
	 * System.out.println("-----------uploadFile-------------");
		String uploadPathBase = ServletActionContext.getServletContext().getRealPath("/file/temp");
		//将提交的文件写入到服务器
		HttpServletRequest req = ServletActionContext.getRequest();
		int uploadtype = Integer.parseInt(req.getParameter("uploadtype"));
		
		String path = uploadPathBase+"\\"+uploadFileFileName;
		FileInputStream is = new FileInputStream(uploadFile);
		FileOutputStream os = new FileOutputStream(path);
		byte[] buff = new byte[4096];
		int hasRead = 0;
		while((hasRead = is.read(buff))>0){
			os.write(buff,0,hasRead);
		}
		is.close();
		os.close();
		if(uploadtype ==1){
			ReadExcel readExcel = new ReadExcel(path);
			List<String[]> lists= readExcel.getAllData(0);
			String result = service.batchInsertStudentInfo(lists);
			String successMsg = "导入学生信息成功！";
			JSONObject json = GenericUtil.getOperateJSONObject(result, successMsg);
			printJson(json);
		}else if(uploadtype ==2){
			String destDir = ServletActionContext.getServletContext().getRealPath("/file/image");
			List<String> namepaths = DeCompressUtil.getNames(path);
			String result = service.batchInsertImagePath(namepaths);
			if(result == "success"){
				DeCompressUtil.deCompress(path, destDir);
			}
			String successMsg = "导入图片信息成功！";
			JSONObject json = GenericUtil.getOperateJSONObject(result, successMsg);
			printJson(json);
		}
	 */
	
	//修改学生信息
		public void editStudentInfos() throws Exception{
			System.out.println("--------editStudentInfos-------------");
			if(uploadFileFileName!=null){
				String uploadPathBase = ServletActionContext.getServletContext().getRealPath("/file/image");
				String trueName = infos.getStudentNum()+uploadFileFileName.substring(uploadFileFileName.lastIndexOf("."));
				String path = uploadPathBase+"\\"+trueName;
				FileInputStream is = new FileInputStream(uploadFile);
				FileOutputStream os = new FileOutputStream(path);
				byte[] buff = new byte[4096];
				int hasRead = 0;
				while((hasRead = is.read(buff))>0){
					os.write(buff,0,hasRead);
				}
				is.close();
				os.close();
				infos.setPhoto_path(trueName);
			}
			String newpas = infos.getPassword();
			Student oldinfos = service.getAllInfosByStudentNum(infos.getStudentNum());
			if(!newpas.equals(oldinfos.getPassword())){
				String password = GenericUtil.encrypt(infos.getStudentNum(), infos.getPassword());
				infos.setPassword(password);
				System.out.println("new pass:"+password);
				System.out.println("old pass:"+oldinfos.getPassword());
			}
			
			String result = service.updateStudentInfos(infos);
			
			String successMsg = "修改学生信息成功！";
			JSONObject json = GenericUtil.getOperateJSONObject(result, successMsg);
			printJson(json);
		}
		
	/**
	 *返回班级的所有学生信息 
	 * @throws Exception
	 */
	public void getStudentInfoByClassName() throws Exception{
		System.out.println("-------------getStudentInfoByClassName----------------");
		HttpServletRequest req = ServletActionContext.getRequest();
		String className = req.getParameter("className");
		className = URLDecoder.decode(className,"utf-8");
			
		System.out.println("-------------->"+className);
		
		List<StudentVo> list = service.queryAllClass(className);
		JSONSerializer jsonRows = new JSONSerializer();
        String  jsonStr =jsonRows.serialize(list); 
		
        printJson(jsonStr);
	}
	/**
	 * 模糊搜索
	 */
	public void queryStudentInfo() throws Exception{
		System.out.println("-----queryStudentInfo---------");
		HttpServletRequest req = ServletActionContext.getRequest();
		String value  = req.getParameter("value");
		value =  URLDecoder.decode(value,"utf-8");
		//判断是否是学号还是姓名查询
		boolean status = pattern(value);
		List<StudentVo> list  =null;
		
		Admin admin = (Admin)req.getSession().getAttribute("user");
		int majorId = admin.getSubjectId();
		int roleId = admin.getRoleId();
		System.out.println("roleId:"+roleId);
		if(status){
			switch (roleId) {
			case 0:
				list = service.queryStudentsInfoBynums(value);
				break;
			case 1:
				int academyId = majorId;
				list = service.queryStudentsInfoBynumsOnAcd(value,academyId);
				break;
			case 2:
				list = service.queryStudentsInfoBynumsOnMaj(value,majorId);
				break;
			}
			
		}else{
			switch (roleId) {
			case 0:
				list = service.queryStudentsInfoByName(value);
				break;
			case 1:
				int academyId = majorId;
				list = service.queryStudentsInfoByNameOnAcd(value,academyId);
				break;
			case 2:
				list = service.queryStudentsInfoByNameOnMaj(value,majorId);
				break;
			}
		}
		JSONSerializer jsonRows = new JSONSerializer();
        String  jsonStr =jsonRows.serialize(list); 
		
        printJson(jsonStr);
	}
	
	//导出数据
	public void exportData() throws Exception{
		System.out.println("-------exportData()-----------");
		HttpServletResponse rep = ServletActionContext.getResponse();
		HttpServletRequest req = ServletActionContext.getRequest();
		String  className = (String)req.getParameter("className");
		System.out.println("className------:"+className);
		rep.setContentType("octets/stream");
		rep.addHeader("Content-Disposition", "attachment;filename="+className+".xls");
		String title = className+"_学生信息.xls";
		System.out.println("title:"+title);
		String[] header = {"学号", "姓名" ,"性别" ,"班级" ,"入学年份" ,"宿舍 ","民族" ,"家庭出身", "教育程度" ,"身份证号" ,"银行卡号","出生年月", "政治面貌" ,"健康状况 ","手机","QQ号码","Email","籍贯","邮政编码","家庭电话 ","家庭地址" };
		StudentInfoDao dao = StudentInfoDao.getStudentInfoDaoInstance();
		List<Student> list = dao.getClassStudentsInfosByclassName(className);
        System.out.println();
		ExportStudentInfos exports = new ExportStudentInfos();
		exports.ExportStudent(title, header, list, rep.getOutputStream());
	}
	//获取学生成绩
	public void getStudentScoreBynum() throws IOException{
		System.out.println("获取学生个人成绩Acction");
		
		HttpServletRequest req = ServletActionContext.getRequest();
		ScholarshipsDataOutputService service = new ScholarshipsDataOutputService();
		String studentnum = req.getParameter("studentNum");
		String schoolyear = req.getParameter("schoolyear");
		System.out.println("学号："+studentnum);
		System.out.println("学年："+schoolyear);
		List<Score> list = service.queryAllScreByStudentnum(studentnum, schoolyear);
		System.out.println("list.size()"+list.size());
		JSONSerializer jsonRows = new JSONSerializer();
        String  jsonStr =jsonRows.serialize(list); 
		System.out.println("json:"+jsonStr);
        printJson(jsonStr);
		
	}
	//获取学生操行分
	public void getStudentPoint() throws IOException{
		System.out.println("-------getStudentPoint---------");
		HttpServletRequest req = ServletActionContext.getRequest();
		String studentnum = req.getParameter("studentNum");
		String schoolyear = req.getParameter("schoolyear");
		System.out.println("学号："+studentnum);
		System.out.println("学年："+schoolyear);
		ConductDataOutputService service = new ConductDataOutputService();
		List<ConductVo> list = service.getConductsByNumAndYear(studentnum, schoolyear);
		System.out.println("list.size:"+list.size());
		JSONSerializer jsonRows = new JSONSerializer();
        String  jsonStr =jsonRows.serialize(list); 
		System.out.println("json:"+jsonStr);
        printJson(jsonStr);
	}
	//判断是否是学号还是姓名查询
	private boolean pattern(String value){
		Pattern p = Pattern.compile("^[0-9]+$");
		Matcher m = p.matcher(value);
		return m.matches();
	}
	
	
	//查看学生详细信息
	public String getAllInfosByNum(){
		System.out.println("-------getAllInfosByNum---------");
		HttpServletRequest req = ServletActionContext.getRequest();
		String studentNum = req.getParameter("studentNum");
		Student student =service.getAllInfosByStudentNum(studentNum);
		
		req.setAttribute("infos", student);
		return "infos";
	}
	
	
	//跳转到showStudent.jsp页面
	public String forwardShowStudentpage(){
		System.out.println("-------forwardShowStudentpage---------");
		HttpServletRequest req = ServletActionContext.getRequest();
		String studentNum = req.getParameter("studentNum");
		req.setAttribute("studentNum",studentNum);
		System.out.println("studentNum:"+studentNum);
		return "showStudent";
	}
	
	//跳转到studentInfo.jsp页面
	public String forwardStudentInfopage(){
		System.out.println("-------forwardStudentInfopage---------");
		HttpServletRequest req = ServletActionContext.getRequest();
		String studentNum = req.getParameter("studentNum");
		req.setAttribute("studentNum",studentNum);
		System.out.println("studentNum:"+studentNum);
		return "studentInfo";
	}
	
	//跳转到studentSocre.jsp页面
	public String forwardStudentScorepage(){
		System.out.println("-------forwardStudentScorepage---------");
		HttpServletRequest req = ServletActionContext.getRequest();
		String studentNum = req.getParameter("studentNum");
		req.setAttribute("studentNum",studentNum);
		System.out.println("studentNum:"+studentNum);
		return "studentScore";
	}
		
	//跳转到studentPoint.jsp页面
	public String forwardStudentPointpage(){
		System.out.println("-------forwardStudentPointpage---------");
		HttpServletRequest req = ServletActionContext.getRequest();
		String studentNum = req.getParameter("studentNum");
		req.setAttribute("studentNum",studentNum);
		System.out.println("studentNum:"+studentNum);
		return "studentPoint";
	}
	
	//修改成绩
	public void updateStudentScore() throws Exception{
		System.out.println("----------updateStudentScore--------------");
		HttpServletRequest req = ServletActionContext.getRequest();
		String id = req.getParameter("id");
		String grade = req.getParameter("grade");
		String bukao = req.getParameter("bukao");
		String chongkao = req.getParameter("chongkao");
		String qingkao = req.getParameter("qingkao");
		System.out.println("id:"+id+";qingkao="+qingkao+"---");
		if(bukao==""){
			bukao = null;
		}
		if(chongkao ==""){
			chongkao = null;
		}
		if(qingkao==""){
			qingkao=null;
		}
		ScholarshipsDataOutputService service = new ScholarshipsDataOutputService();
		String result = service.updateScoreById(id, grade, bukao, chongkao, qingkao);
		System.out.println("result:"+result);
		
		String successMsg = "修改成绩成功！";
		JSONObject json = GenericUtil.getOperateJSONObject(result, successMsg);
		printJson(json);

	}
	//修改操勤分
	public void updateStudentPoint() throws IOException{
		System.out.println("----------updateStudentPoint--------------");
		HttpServletRequest req = ServletActionContext.getRequest();
		String id = req.getParameter("id");
		String conductScore = req.getParameter("conductScore");
		System.out.println("id:"+id+";score="+conductScore);
		ConductDataOutputService service = new ConductDataOutputService();
		String result = service.updateConductScoreById(Integer.parseInt(id), conductScore);
        System.out.println("result:"+result);
		
		String successMsg = "修改操行分成功！";
		JSONObject json = GenericUtil.getOperateJSONObject(result, successMsg);
		printJson(json);
	}
	private void printJson(JSONObject json) throws IOException{
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		out.print(json);
		out.close();
	}
	
	private void printJson(String json) throws IOException{
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		out.print(json);
		out.close();
	}


	
}
