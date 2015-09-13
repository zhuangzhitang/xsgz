package cn.gdou.xsgz.admin.workstudy;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.gdou.xsgz.domain.poorStudent;

public class TakeResult {
	public static Map<Integer,ArrayList<String>> takeResult(List<poorStudent> st) {
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
		return allotLevel;
	}

}
