package cn.gdou.xsgz.admin.base.dao;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;


import cn.gdou.xsgz.admin.workstudy.dao.WorkstudyDao;
import cn.gdou.xsgz.domain.Student;
import cn.gdou.xsgz.domain.poorStudent;
import cn.gdou.xsgz.util.DatabaseUtil;


public class Fftest {
	public static void main(String args[]) throws Exception{
		QueryRunner qr = new QueryRunner(DatabaseUtil.getDataSource());
		
		String sql = "select * from poorstudent order by classid";
		
		List<poorStudent> st = qr.query(sql, new BeanListHandler<poorStudent>(poorStudent.class));
		takeResult(st);
	}

	private static void takeResult(List<poorStudent> st) {
		Collections.sort(st, new Comparator<poorStudent>(){
			public int compare(poorStudent o1, poorStudent o2) {
				if (o1.getClassId() == o2.getClassId()) {
					if ((o1.getScore() < o2.getScore()))
						return 1;
					if (o1.getScore() == o2.getScore())
						return 0;
					return -1;
				}
				return 0;
			}
		});
		Map<Integer,ArrayList<String>> allotLevel = new HashMap<Integer,ArrayList<String>>();
		for(poorStudent s : st){
			int classid = s.getClassId();
			List<String> studentNum = new ArrayList<String>();
			if(allotLevel.containsKey(classid)){
				allotLevel.get(classid).add(s.getStudentNum());
			}else{
				studentNum.add(s.getStudentNum());
				allotLevel.put(classid, (ArrayList<String>) studentNum);
			}
		}
		for(Map.Entry<Integer, ArrayList<String>> entry : allotLevel.entrySet()){
			ArrayList<String> value = entry.getValue();
			String s="特别困难";
			String s1="困难";
			String s2="一般困难";
			for(int i=0;i<value.size();i++){
				if(i==0||i==1){
					setLevel(s);
				}
				else if(i>1&&i<6){
					setLevel(s1);
				}
				else
					setLevel(s2);
			}
		}
	}

	private static void setLevel(String s) {
		
	}
}
