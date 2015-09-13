package cn.gdou.xsgz.admin.workstudy;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import cn.gdou.xsgz.admin.workstudy.service.WorkstudyService;
import cn.gdou.xsgz.domain.Admin;
import cn.gdou.xsgz.domain.AllotInfo;
import cn.gdou.xsgz.domain.ApplyInfo;
import cn.gdou.xsgz.domain.JobArrange;
import cn.gdou.xsgz.domain.Student;
import cn.gdou.xsgz.domain.Class;

import com.opensymphony.xwork2.ActionSupport;

import flexjson.JSONSerializer;

@SuppressWarnings("serial")
public class ShowPoorStudentAction extends ActionSupport {
	public String studentnums;
	public int classId;
	public int type;
	public int kind;

	public int getKind() {
		return kind;
	}

	public void setKind(int kind) {
		this.kind = kind;
	}

	public String getStudentnums() {
		return studentnums;
	}

	public void setStudentnums(String studentnums) {
		this.studentnums = studentnums;
	}

	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
		this.classId = classId;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	private WorkstudyService service = new WorkstudyService();
	/**
	 * 查询申请贫困生的学生
	 * 
	 * @throws Exception
	 */
	HttpServletRequest req = ServletActionContext.getRequest();
	HttpServletResponse resp = ServletActionContext.getResponse();
	Admin admin = (Admin) req.getSession().getAttribute("user");
	/**
	 * 获取管理员的真实身份
	 */
	int aRole = admin.getRoleId();
	int aSubject = admin.getSubjectId();

	/**
	 * 查询所有贫困生信息
	 */
	public void showpoorstudent() throws Exception {
		List<Student> students = service.queryPoorStudent(aRole, aSubject,classId);
		// 将查询到的学生信息返回到json中
		Tojson(students);
	}

	/**
	 * 分配评定贫困生的学生
	 * 
	 * @throws Exception
	 * 
	 */
	public void allotStudent() throws Exception {
		List<Student> st = service.allotStudent(aRole, aSubject,classId);
		Tojson(st);
	}

	/**
	 * 查看评定结果
	 * 
	 * @throws Exception
	 * 
	 */
	public void showResult() throws Exception {
		// 对评定结果进行分析
		service.totakeResult();
		showpoorstudent();
	}

	/**
	 * 把List<Student> 对象放入到json里面。
	 * 
	 * @param students
	 * @throws IOException
	 */
	private void Tojson(List<Student> students) throws IOException {
		JSONObject json = new JSONObject();
		JSONSerializer jsonRow = new JSONSerializer();
		String jsons = jsonRow.serialize(students);
		System.out.println(jsons);
		json.put("rows", jsons);
		json.put("total", students.size());
		PrintWriter wr = ServletActionContext.getResponse().getWriter();
		wr.print(json);
		wr.close();
	}

	/**
	 * 分配评定权限给各班级的评定学生
	 * 
	 * @return
	 */
	public String saveallot() {
		String s = studentnums;
		String[] s2 = s.split("-");
		service.allotStudent(s2);
		return "success";
	}

	/**
	 * 查询辅导员管理的班级
	 * 
	 * @throws Exception
	 *             admin_queryClasses.gdou
	 */
	public void queryClasses() throws Exception {
		System.err.println("laile");
		List<Class> aclass = service.queryClasses(aRole, aSubject);
		JSONSerializer jsons = new JSONSerializer();
		String json = jsons.serialize(aclass);
		System.err.println(json);
		PrintWriter wr = ServletActionContext.getResponse().getWriter();
		wr.print(json);
		wr.close();
	}

	/**
	 * 查看申请某类型的学生
	 * 因为在查看申请贷款人的时候，要显示贷款金额。所以在applyInfo那里，加上贷款的
	 * @throws Exception
	 */
	public void getApplyStudents() throws Exception {
		HttpServletRequest req = ServletActionContext.getRequest();
		// 得到当前页和每页显示的条数
		int page = Integer.parseInt(req.getParameter("page"));
		int rows = Integer.parseInt(req.getParameter("rows"));
		int startRow = (page - 1) * rows;
		int classid = classId;
		List<ApplyInfo> applyStudent = service.getAllotStudents(classid, type,
				startRow, rows);
		for (ApplyInfo apply : applyStudent) {
			String level = service.queryLevel(apply.getStudentNum());
			apply.setLevel(level);
		}
		JSONSerializer jsons = new JSONSerializer();
		String json = jsons.serialize(applyStudent);
		System.err.println(json);
		PrintWriter wr = ServletActionContext.getResponse().getWriter();
		wr.print(json);
		wr.close();
	}

	/**
	 * 查看学生申请表信息
	 */
	public String showStudent() {
		String studentNum = studentnums;
		int typeid = type;
		String path = service.findPath(studentNum, typeid);
		String subs = "\\file";
		int a = path.indexOf(subs);
		path = path.substring(a,path.length());
		path = path.replace("\\","/");
		System.out.println(path);
		String lookpath = path.replaceAll(".docx", ".htm");
		System.out.println(lookpath);
		req.getSession().setAttribute("path", path);
		req.getSession().setAttribute("lookpath", lookpath);
		return "showStudent";
	}

	/**
	 * 导出各种表格
	 * 
	 * @throws Exception
	 */
	public void export() throws Exception {
		String filePath = null;
		switch (kind) {
		case 1:
			filePath = ExportWorkStudy.poorStudent(req, resp, aRole, aSubject);
			break;
		case 2:
			filePath = ExportWorkStudy.attendancesPosts(req, resp, aRole,
					aSubject);
			break;
		case 3:
			filePath = ExportWorkStudy.grants(req, resp, aRole, aSubject);
			break;
		case 4:
			filePath = ExportWorkStudy.exportPoorstudent(req, resp, aRole,
					aSubject);
			break;
		default:
			break;
		}
		System.out.println("ok");
		DownloadExcel.downLoad(filePath, resp, false);
	}

	/**
	 * 查看各种money的分配情况
	 * 
	 * @throws Exception
	 * 
	 */
	public void showAllotResult() throws Exception {
		List<AllotInfo> allotInfo = service.showAllotResult(type);
		JSONSerializer jsons = new JSONSerializer();
		String json = jsons.serialize(allotInfo);
		System.err.println(json);
		PrintWriter wr = ServletActionContext.getResponse().getWriter();
		wr.print(json);
		wr.close();
	}

	/**
	 * 勤工岗位管理。 
	 * 1.查看学生是否获得各种奖学金
	 * 2.查看学生是否
	 * @throws Exception 
	 * 
	 */
	public void getAttendanceStudents() throws Exception {
		//是否获得各金
		List<JobArrange> jobarrange = service.getAttendanceStudents(aRole,aSubject);
		for(JobArrange s : jobarrange){
			String sn  = s.getStudentNum();
			if(service.queryIsGetLoans(sn))
				s.setLoans("已获得");
			else
				s.setLoans("未获得");
			if(service.queryIsGetGrants(sn))
				s.setGrants("已获得");
			else
				s.setGrants("未获得");
			if(service.queryIsGetMotivational(sn))
				s.setMotivational("已获得");
			else
				s.setMotivational("未获得");
		}
		JSONSerializer jsons = new JSONSerializer();
		String json = jsons.serialize(jobarrange);
		System.err.println(json);
		PrintWriter wr = ServletActionContext.getResponse().getWriter();
		wr.print(json);
		wr.close();
	}
}
