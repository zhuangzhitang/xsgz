package cn.gdou.xsgz.admin.base.dao;

import java.util.LinkedList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import cn.gdou.xsgz.admin.workstudy.dao.WorkstudyDao;
import cn.gdou.xsgz.domain.Student;
import flexjson.JSONSerializer;

public class Testjson {
	public static void main(String args[]){
		WorkstudyDao dao = new WorkstudyDao();
		String s = dao.queryLevel("201111621314");
		System.out.println(s);
	}

	private static void extracted() {
		WorkstudyDao dao = new WorkstudyDao();
		List<Student> st = dao.queryPoorStudent(2, 1, 0);
		List<String> st1 = new LinkedList<String>();
		JSONSerializer json = new JSONSerializer();
		String jsonArray=json.serialize(st);
		System.out.println(jsonArray.toString());
	}
}
