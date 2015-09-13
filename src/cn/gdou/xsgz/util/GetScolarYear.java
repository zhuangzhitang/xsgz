package cn.gdou.xsgz.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class GetScolarYear {
	public static String getScolarYear() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM");
		System.out.println(df.format(new Date()));
		String s2 = null;
		String s = df.format(new Date());
		String[] b = s.split("-");
		int a = Integer.parseInt(b[1]);
		if (a > 9) {
			s2 = b[0] + "-" + (Integer.parseInt(b[0]) + 1);
		} else {
			s2 = (Integer.parseInt(b[0]) - 1) + "-" + b[0];
		}
		return s2;
	}
	public static String getLoanYear(){
		SimpleDateFormat df = new SimpleDateFormat("yyyy");
		System.out.println(df.format(new Date()));
		String s2 =df.format(new Date());
		return s2;
	}
}
