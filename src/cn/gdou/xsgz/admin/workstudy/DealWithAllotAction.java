package cn.gdou.xsgz.admin.workstudy;

import cn.gdou.xsgz.admin.workstudy.service.WorkstudyService;

public class DealWithAllotAction {
	public String studentnums;
	public int classId;
	public int type;

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
	 * 对学生的各种分配（1，助学金 2，国家奖学金 3，勤工岗位4，贷款申请 5，国家励志奖学金。）
	 * 
	 */
	public String allotManyMoney() {
		String s = studentnums;
		int t = type;
		String[] s2 = s.split("-");
		System.out.println(s + "=====" + t);
		for (int i = 0; i < s2.length; i++) {
			service.addToallotInfo(s2[i], type);
		}
		return null;
	}
}
