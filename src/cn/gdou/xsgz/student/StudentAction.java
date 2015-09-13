package cn.gdou.xsgz.student;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import cn.gdou.xsgz.domain.Student;
import cn.gdou.xsgz.student.service.StudentService;
import cn.gdou.xsgz.util.GenericUtil;
import cn.gdou.xsgz.util.JacobUtil;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 学生Action: 处理关于Student的请求
 * 
 * @author 潘木坚
 * @modify 李楚富 2014-12-17
 * @version 2014-10-05
 */
@SuppressWarnings("serial")
public class StudentAction extends ActionSupport implements
		ModelDriven<Student> {
	StudentService service = new StudentService();

	private Student student = new Student();

	// 上传文件的申请类型
	private String applyType;

	// 文件域3个参数
	private File applyWord;
	private String applyWordFileName;
	private String applyWordContentType;
	/**
	 * 贫困生的几个参数
	 */
	// 家庭户口类型
	private String householdType;
	// 家庭人口总数
	private int homenumber;
	// 家庭月收入(整数)
	private int everybodyGet;
	// 人均月收入(整数)
	private int perMonthlyIncome;
	// 收入来源
	private String sourceIncome;
	// 备注
	private String comment;
	/**
	 * 勤工助学的几个参数
	 */
	private String aworkplace;
	private int salary;
	private String arrangement;
	/**
	 * 助学贷款的几个参数
	 */
	private int loansmoney;
	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public String getArrangement() {
		return arrangement;
	}

	public void setArrangement(String arrangement) {
		this.arrangement = arrangement;
	}

	public int getLoansmoney() {
		return loansmoney;
	}

	public void setLoansmoney(int loansmoney) {
		this.loansmoney = loansmoney;
	}

	public String getHouseholdType() {
		return householdType;
	}

	public void setHouseholdType(String householdType) {
		this.householdType = householdType;
	}
	public int getPerMonthlyIncome() {
		return perMonthlyIncome;
	}
	public void setPerMonthlyIncome(int perMonthlyIncome) {
		this.perMonthlyIncome = perMonthlyIncome;
	}

	public String getSourceIncome() {
		return sourceIncome;
	}

	public void setSourceIncome(String sourceIncome) {
		this.sourceIncome = sourceIncome;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Student getModel() {
		return student;
	}

	public File getApplyWord() {
		return applyWord;
	}

	public void setApplyWord(File applyWord) {
		this.applyWord = applyWord;
	}

	public String getApplyWordFileName() {
		return applyWordFileName;
	}

	public void setApplyWordFileName(String applyWordFileName) {
		this.applyWordFileName = applyWordFileName;
	}

	public String getApplyWordContentType() {
		return applyWordContentType;
	}

	public void setApplyWordContentType(String applyWordContentType) {
		this.applyWordContentType = applyWordContentType;
	}

	public String getApplyType() {
		return applyType;
	}

	public void setApplyType(String applyType) {
		this.applyType = applyType;
	}
	

	public int getHomenumber() {
		return homenumber;
	}

	public void setHomenumber(int homenumber) {
		this.homenumber = homenumber;
	}

	public int getEverybodyGet() {
		return everybodyGet;
	}

	public void setEverybodyGet(int everybodyGet) {
		this.everybodyGet = everybodyGet;
	}

	/**
	 * 学生登录
	 * 
	 * @author 潘木坚
	 * @modify 李楚富
	 */
	public String login() {
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpSession session = req.getSession();
		String studentNum = req.getParameter("username");

		String sessionCheckCode = (String) session.getAttribute("checkCode");
		if (sessionCheckCode == null) {
			session.setAttribute("username", studentNum);
			session.setAttribute("error", "验证码过期，请刷新页面重试！");
			return INPUT;
		}

		String reqCheckCode = req.getParameter("checkCode");
		if (StringUtils.isBlank(reqCheckCode)) {
			session.setAttribute("username", studentNum);
			session.setAttribute("error", "验证码不能为空!");
			return INPUT;
		}
		// 验证码忽略大小写
		if (!reqCheckCode.equalsIgnoreCase(sessionCheckCode)) {
			session.setAttribute("username", studentNum);
			session.setAttribute("error", "验证码错误!");
			return INPUT;
		}

		if (StringUtils.isBlank(studentNum)) {
			session.setAttribute("error", "学号不能为空!");
			return INPUT;
		}

		String password = req.getParameter("password");
		if (StringUtils.isBlank(password)) {
			session.setAttribute("username", studentNum);
			session.setAttribute("error", "密码不能为空!");
			return INPUT;
		}

		Student loginStudent = new Student();
		loginStudent.setStudentNum(studentNum);
		loginStudent.setPassword(password);
		loginStudent = service.login(loginStudent);

		if (loginStudent == null) { // 登录失败
			session.setAttribute("username", studentNum);
			session.setAttribute("error", "学号或密码错误!");
			return INPUT;
		}

		// 登录成功，将学生实体设置到session中
		session.setAttribute("user", loginStudent);
		session.removeAttribute("username");
		session.removeAttribute("error");

		// path: /xsgz
		String path = req.getContextPath();
		// basePath: http://localhost:8080/xsgz
		String basePath = req.getScheme() + "://" + req.getServerName() + ":"
				+ req.getServerPort() + path + "/";
		// studentPath: http://localhost:8080/xsgz/student/
		String studentPath = basePath + "student/";
		// 将网站根路径和学生访问链接的根路径写到session，这样在每个jsp页面中都可以拿到这两个值^_^
		session.setAttribute("basePath", basePath);
		session.setAttribute("studentPath", studentPath);

		return SUCCESS;
	}

	public String exit() {
		ServletActionContext.getContext().getSession().remove("user");
		return INPUT;
	}

	/**
	 * 上传文件
	 * 
	 * @return
	 * @throws Exception
	 */
	public String applyUpload() throws Exception {
		student = (Student) ServletActionContext.getRequest().getSession()
				.getAttribute("user");
		boolean isApplySuccess = false;// 向数据库插入申请提交信息，或修改申请信息是否成功：false：不成功；true：成功
		// 生成文件url规则：文件在服务器的保存路径+UUID+"_"+学号。
		String uploadPathBase = ServletActionContext.getServletContext()
				.getRealPath("/file/up");
		Integer i = Integer.parseInt(applyType);
		switch (i) {
		case 1:
			uploadPathBase += "\\word_1\\";
			break;
		case 2:
			uploadPathBase += "\\word_2\\";
			break;
		case 3:
			uploadPathBase += "\\word_3\\";
			break;
		case 4:
			uploadPathBase += "\\word_4\\";
			break;
		case 5:
			uploadPathBase += "\\word_5\\";
			break;
		}
		if (i != 6) {
			// 判断学生是否已上传相同类型的文件，有则覆盖文件，更新申请时间，更新文件名称。
			String newFileName = uploadPathBase;

			if (service.isExistApplyType(student.getStudentNum(),
					Integer.parseInt(applyType))) {
				// 获取已存在的文件名
				newFileName = service.getExistFileName(student.getStudentNum(),
						Integer.parseInt(applyType));
				isApplySuccess = service.updateApplyInfo(applyWordFileName,
						new Date(), student.getStudentNum(),
						Integer.parseInt(applyType));
			} else {
				newFileName += student.getStudentNum()
						+ applyWordFileName.substring(applyWordFileName
								.lastIndexOf("."));
				// 把文件ID，文件名，上传时间，文件路径，上传人员，申请类型，写入数据库。
				String id = student.getStudentNum() + applyType;
				isApplySuccess = service.addApplyToDB(id, applyWordFileName,
						new Date(), newFileName, student.getStudentNum(),
						Integer.parseInt(applyType));
				// 把申请人的信息增加到申请人列表 学号，对应的文件名，申请类型，班级号 加入到applyinfo这个表中
				service.addApplyToApplyinfo(student.getStudentNum(), id,
						Integer.parseInt(applyType), student.getClassId(),
						student.getStudentName());
				if (!isApplySuccess)
					return ERROR;
			}
			// 将提交的文件写入到服务器
			FileInputStream is = new FileInputStream(applyWord);
			FileOutputStream os = new FileOutputStream(newFileName);
			byte[] buff = new byte[1024];
			int hasRead = 0;
			while ((hasRead = is.read(buff)) > 0) {
				os.write(buff, 0, hasRead);
			}
			is.close();
			os.close();
			// 将已经上传了的文件转换成htm文件方便查看
			// 保存的文件名为 路径+学号+.htm
			String saveto = uploadPathBase + student.getStudentNum() + ".htm";
			JacobUtil.wordToHtml(newFileName, saveto);
			test(i);
			return SUCCESS;
		} else {
			return test(6);
		}
	}

	/**
	 * 申请贫困生要填写的东西
	 * 
	 * @param i
	 * 
	 * @return
	 */
	private String test(int i) {
		if (i == 6) {
			service.addstudentToFamily(student, householdType, homenumber,
					everybodyGet, perMonthlyIncome, sourceIncome, comment);
		}
		if(i==4){
			service.addstudentToLoanmoney(student,loansmoney);
		}
		if(i==3){
			service.addstudentTojobtemp(student,salary,aworkplace);
		}
		return SUCCESS;
	}

	/**
	 * 学生进行贫困生评定
	 * 
	 * @author 赵志锋
	 * 
	 */
	public String ishavepermission() {
		HttpServletRequest req = ServletActionContext.getRequest();
		student = (Student) req.getSession().getAttribute("user");
		int i = student.getIsallowevaluate();
		if (1 == i) {
			System.err.println("ok");
			List<Student> students = service.queryPermission(student
					.getClassId());
			int s = students.size();
			int ss = 3;
			String sClassName = service.getStudentClassName(student.getClassId());
			req.getSession().setAttribute("classID", sClassName);
			req.getSession().setAttribute("size", s);
			req.getSession().setAttribute("me", ss);
			req.getSession().setAttribute("users", students);
			req.getSession().setAttribute("msg", "欢迎您,请点击确定进入评定页面");
			return "success";
		} else
			return "error";
	}

	/**
	 * 把分数加到相应的学生当中
	 * 
	 * @return
	 */
	public String addtoStudent() {
		HttpServletRequest req = ServletActionContext.getRequest();
		Student st = (Student) req.getSession().getAttribute("user");
		String studentNum = st.getStudentNum();
		int i = (Integer) req.getSession().getAttribute("size");
		String[] s = req.getParameterValues("studentNum");
		String[] s2 = req.getParameterValues("number");
		for (int b = 0; b < s2.length; b++) {
			if (s2[b].equals("") || s2[b] == null) {
				req.getSession().setAttribute("msg", "不好意思，您输入的格式有误，请重新输入");
				return "againvote";
			}
		}
		Integer[] b2 = strArray2intArray(s2);
		if (Isqualified(b2, i)) {
			for (int x = 0; x < i; x++) {
				service.addPointsToPoor(s[x], b2[x], studentNum);
			}
			st.setIsallowevaluate(0);
			return "success";
		}
		req.getSession().setAttribute("msg", "不好意思，您输入的格式有误，请重新输入");
		return "againvote";
	}

	public Integer[] strArray2intArray(String... arr) {
		Integer[] intArr = new Integer[arr.length];
		for (int i = 0; i < arr.length; i++) {
			intArr[i] = Integer.parseInt(arr[i]);
		}
		return intArr;
	}

	/**
	 * 判断用户输入的数是否符合规则 在1~size之间且不重复
	 * 
	 * @param a
	 * @return
	 */
	private boolean Isqualified(Integer[] a, int b) {
		for (int i = 0; i < a.length; i++) {
			for (int j = i + 1; j < a.length; j++) {
				if (a[i] == a[j])
					return false;
			}
		}
		int k = 0;
		while (a[k] <= b && a[k] > 0) {
			k++;
			if (k > a.length - 1)
				return true;
		}
		return false;
	}

	public String getAworkplace() {
		return aworkplace;
	}

	public void setAworkplace(String aworkplace) {
		this.aworkplace = aworkplace;
	}
}
