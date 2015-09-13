package cn.gdou.xsgz.admin.workstudy;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.junit.Test;

import cn.gdou.xsgz.util.DatabaseUtil;
import cn.gdou.xsgz.util.GetScolarYear;

public class ExportWorkStudy {

	/**
	 * 导出助学金获得者的表
	 * @param aSubject 
	 * @param aRole 
	 * 
	 */
	public static String grants(HttpServletRequest request, HttpServletResponse response, int aRole, int aSubject) throws Exception {
		// 要操作的数据库名称
		String dbName = "xsgz";
		// 新建工作簿
		HSSFWorkbook book = new HSSFWorkbook();
		Map<String, CellStyle> styles = createStyles(book);
		// 获取数据库连接
		Connection conn = DatabaseUtil.getConnection();
		// 得到分析元数据的 dmd
		DatabaseMetaData dmd = conn.getMetaData();
		Statement st = conn.createStatement();
		// 结果集
		ResultSet rs = dmd.getTables(dbName, dbName, null,
				new String[] { "TABLE" });
		HSSFSheet sheet = book.createSheet();
		// 要查询的东西
		String sql = "SELECT studentName,IdentityNum,academy.`academyName`,"
				+ "major.`majorName`,studentNum,sex,nation,student.`timeofstart` FROM student,class,major,academy WHERE student.`classId`=class.`classId`"
				+ " AND class.`majorId`=major.`majorId` AND major.`academyId`=academy.`academyId`";

		if(aRole==2){
			sql = sql+" and major.`majorId`="+aSubject;
		// 执行查询语句，获得一系列数据
		}
		if(aRole==1){
			sql += "AND major.`academyId`="+aSubject;
		}
		// 执行查询语句，获得一系列数据
		rs = st.executeQuery(sql);
		ResultSetMetaData rsmd = rs.getMetaData();
		// 获得总列数
		int cols = rsmd.getColumnCount();
		String[] name = { "序号", "学生姓名", "公民身份证号码", "学院", "专业", "学号", "性别",
				"名族", "入学年月" };

		// title Row
		Row titleRow = sheet.createRow(0);
		// 设置表头格式
		titleRow.setHeightInPoints(25);
		Cell titlecell = titleRow.createCell(0);
		titlecell.setCellValue(GetScolarYear.getScolarYear()+"学年度国家助学金学生初审名单表");
		titlecell.setCellStyle(styles.get("title"));
		sheet.addMergedRegion(CellRangeAddress.valueOf("$A$1:$L$1"));
		// 创建第一行
		// title Row
		HSSFRow titleRow2 = sheet.createRow(1);
		// 设置表头格式
		titleRow2.setHeightInPoints(25);
		HSSFCell titlecell2 = titleRow2.createCell(0);
		titlecell2.setCellValue("学院名称(盖章)");
		HSSFCellStyle cstyle = titlecell2.getCellStyle();
		titlecell2.setCellStyle(styles.get("atitle"));
		cstyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
		cstyle.setBorderTop((short) 0);
		sheet.addMergedRegion(CellRangeAddress.valueOf("$A$2:$B$2"));

		// 创建第二行： 列名
		HSSFRow row = sheet.createRow(2);
		for (int i = 0; i < name.length; i++) {
			HSSFCell cell = row.createCell(i);
			cell.setCellValue(name[i]);
		}
		// 填充这些列
		int idx = 3;
		while (rs.next()) {
			row = sheet.createRow(idx++);
			int j = idx - 2;
			for (int i = 0; i < cols; i++) {
				String value = rs.getString(i + 1);

				HSSFCell cel = row.createCell(i + 1);
				cel.setCellValue(value);
				cel.getCellStyle().setAlignment(HSSFCellStyle.ALIGN_CENTER);
			}
			HSSFCell cell = row.createCell(0);
			cell.setCellValue(j);
		}
		// 某些列设置宽度
		sheet.setColumnWidth(0, 8 * 256);
		sheet.setColumnWidth(1, 15 * 256);
		sheet.setColumnWidth(2, 28 * 256);
		sheet.setColumnWidth(3, 18 * 256);
		sheet.setColumnWidth(4, 20 * 256);
		sheet.setColumnWidth(5, 20 * 256);
		sheet.setColumnWidth(6, 8 * 256);
		sheet.setColumnWidth(7, 8 * 256);
		sheet.setColumnWidth(8, 10 * 256);
		
		//生成文件到服务器
		String s ="test.xls";
		String unloadPath = WriteToWeb(request, book ,s);
		return unloadPath;
	}
	private static String WriteToWeb(HttpServletRequest request,
			HSSFWorkbook book,String s) throws FileNotFoundException, IOException {
		String unloadPath = getWebRootPath(request)+"\\file\\temp\\";
		File file = new File(unloadPath+s);
		if (file.exists()) {
			file.delete();
		}
		FileOutputStream out = new FileOutputStream(file);
		book.write(out);
		return unloadPath+s;
	}
	/**
	 * 导出贫困生的表
	 * @param aSubject 
	 * @param aRole 
	 * @throws Exception
	 */
	public static String exportPoorstudent(HttpServletRequest request, HttpServletResponse response, int aRole, int aSubject) throws Exception {

		// 要操作的数据库名称
		String dbName = "xsgz";
		// 新建工作簿
		HSSFWorkbook book = new HSSFWorkbook();
		Map<String, CellStyle> styles = createStyles(book);
		// 获取数据库连接
		Connection conn = DatabaseUtil.getConnection();
		// 得到分析元数据的 dmd
		DatabaseMetaData dmd = conn.getMetaData();
		Statement st = conn.createStatement();
		// 结果集
		ResultSet rs = dmd.getTables(dbName, dbName, null,
				new String[] { "TABLE" });
		HSSFSheet sheet = book.createSheet();
		String sql = "SELECT academy.`academyName`,major.`majorName`,class.`className`,student.studentName,student.`address`," +
				"	student.studentNum,student.`politicsStatus`,sex,family.`familySize`,family.`monthlyIncome`,"
				+ " family.`level` FROM student,class,major,academy,family WHERE"
				+ " student.`classId`=class.`classId`"
				+ " AND class.`majorId`=major.`majorId` AND major.`academyId`=academy.`academyId` " +
				" AND student.studentNum=family.`studentNum` ";
		// 要查询的东西
		if(aRole==2){
			sql = sql+" and major.`majorId`="+aSubject;
		// 执行查询语句，获得一系列数据
		}
		if(aRole==1){
			sql += "AND major.`academyId`="+aSubject;
		}
		sql+=" order BY student.classid";
		rs = st.executeQuery(sql);
		ResultSetMetaData rsmd = rs.getMetaData();
		// 获得总列数
		int cols = rsmd.getColumnCount();
		String[] name = { "序号", "学院", "专业(全称)","班级", "姓名", "省份", "学号", "政治面貌", "性别",
				"家庭口", "均收入", "认定等级", "备注" };

		// title Row
		Row titleRow = sheet.createRow(0);
		// 设置表头格式
		titleRow.setHeightInPoints(25);
		Cell titlecell = titleRow.createCell(0);
		titlecell.setCellValue("广东海洋大学  学年家庭经济困难学生名册");
		titlecell.setCellStyle(styles.get("title"));
		sheet.addMergedRegion(CellRangeAddress.valueOf("$A$1:$M$1"));
		// 创建第二行： 列名
		HSSFRow row = sheet.createRow(1);
		for (int i = 0; i < name.length; i++) {
			HSSFCell cell = row.createCell(i);
			cell.setCellValue(name[i]);
		}
		// 填充这些列
		int idx = 2;
		while (rs.next()) {
			row = sheet.createRow(idx++);
			int j = idx - 2;
			for (int i = 0; i < cols; i++) {
				String value = rs.getString(i + 1);
				HSSFCell cel = row.createCell(i + 1);
				cel.setCellValue(value);
				cel.getCellStyle().setAlignment(HSSFCellStyle.ALIGN_CENTER);
			}
			HSSFCell cell = row.createCell(0);
			cell.setCellValue(j);
		}
		// 某些列设置宽度
		sheet.setColumnWidth(0, 6 * 256);
		sheet.setColumnWidth(1, 15 * 256);
		sheet.setColumnWidth(2, 20 * 256);
		sheet.setColumnWidth(3, 15 * 256);
		sheet.setColumnWidth(4, 12 * 256);
		sheet.setColumnWidth(5, 12 * 256);
		sheet.setColumnWidth(6, 20 * 256);
		sheet.setColumnWidth(7, 8 * 256);
		sheet.setColumnWidth(8, 6 * 256);
		sheet.setColumnWidth(9, 10 * 256);
		sheet.setColumnWidth(10, 10 * 256);
		sheet.setColumnWidth(11, 10 * 256);
		sheet.setColumnWidth(12, 10 * 256);
		String s ="test2.xls";
		String s2 = WriteToWeb(request, book, s);
		return s2;
	}
	/**
	 * 导出励志奖学金表
	 * @param aSubject 
	 * @param aRole 
	 */
	public static String attendancesPosts(HttpServletRequest request, HttpServletResponse response, int aRole, int aSubject) throws Exception {

		// 要操作的数据库名称
		String dbName = "xsgz";
		// 新建工作簿
		HSSFWorkbook book = new HSSFWorkbook();
		Map<String, CellStyle> styles = createStyles(book);
		// 获取数据库连接
		Connection conn = DatabaseUtil.getConnection();
		// 得到分析元数据的 dmd
		DatabaseMetaData dmd = conn.getMetaData();
		Statement st = conn.createStatement();
		// 结果集
		ResultSet rs = dmd.getTables(dbName, dbName, null,
				new String[] { "TABLE" });
		HSSFSheet sheet = book.createSheet();
		// 要查询的东西
		String sql = "SELECT student.`studentName` ,student.`IdentityNum`,"
				+ " academy.`academyName`,major.`majorName`,student.`studentNum`,student.`sex`,"
				+ " student.`nation`,student.`timeofstart`,family.`level`,scoreresult.`level` FROM student"
				+ " ,academy,major,family,scoreresult,allotinfo,class "
				+ " WHERE student.`studentNum`=allotinfo.`studentNum`  AND allotinfo.`type`=5 "
				+ " AND student.`classId`=class.`classId` AND class.`majorId`=major.`majorId` AND "
				+ " major.`academyId`=academy.`academyId` AND student.`studentNum`=family.`studentNum` AND "
				+ " scoreresult.`studentNum`=student.`studentNum` AND allotinfo.`schoolYear`=scoreresult.`schoolYear`";
		// 执行查询语句，获得一系列数据
		if(aRole==2){
			sql = sql+" and major.`majorId`="+aSubject;
		// 执行查询语句，获得一系列数据
		}
		if(aRole==1){
			sql += "AND major.`academyId`="+aSubject;
		}
		rs = st.executeQuery(sql);
		ResultSetMetaData rsmd = rs.getMetaData();
		// 获得总列数
		int cols = rsmd.getColumnCount();
		String[] name = { "序号", "学生姓名", "公民身份证号码", "院系", "专业", "学号", "性别",
				"民族", "入学年月", "家庭经济困难程度", "学习成绩" };

		// title Row
		Row titleRow = sheet.createRow(0);
		// 设置表头格式
		titleRow.setHeightInPoints(25);
		Cell titlecell = titleRow.createCell(0);
		titlecell.setCellValue(GetScolarYear.getScolarYear()+"  学年度普通高等学校国家励志奖学金获奖学生初审名单汇总表");
		titlecell.setCellStyle(styles.get("title"));
		sheet.addMergedRegion(CellRangeAddress.valueOf("$A$1:$M$1"));
		// 创建第二行： 列名
		HSSFRow titleRow2 = sheet.createRow(1);
		// 设置表头格式
		titleRow2.setHeightInPoints(25);
		HSSFCell titlecell2 = titleRow2.createCell(0);
		titlecell2.setCellValue("学院名称(盖章)");
		HSSFCellStyle cstyle = titlecell2.getCellStyle();
		titlecell2.setCellStyle(styles.get("atitle"));
		cstyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
		cstyle.setBorderTop((short) 0);
		sheet.addMergedRegion(CellRangeAddress.valueOf("$A$2:$C$2"));

		HSSFCell titlecell3 = titleRow2.createCell(7);
		titlecell3.setCellValue("填表日期：    年   月   日");
		HSSFCellStyle c2style = titlecell3.getCellStyle();
		c2style.setAlignment(HSSFCellStyle.ALIGN_LEFT);
		sheet.addMergedRegion(CellRangeAddress.valueOf("$H$2:$K$2"));
		titlecell3.setCellStyle(styles.get("btitle"));

		// 创建第三行
		HSSFRow row = sheet.createRow(2);
		for (int i = 0; i < name.length; i++) {
			HSSFCell cell = row.createCell(i);
			cell.setCellValue(name[i]);
		}
		// 填充这些列
		int idx = 3;
		while (rs.next()) {
			row = sheet.createRow(idx++);
			int j = idx - 3;
			for (int i = 0; i < cols; i++) {
				String value = rs.getString(i + 1);
				if (i == cols - 1) {
					int x = Integer.parseInt(value);
					if (x == 1 || x == 2)
						value = "优秀";
					else if (x == 3)
						value = "良好";
					else
						value = "一般";
				}
				HSSFCell cel = row.createCell(i + 1);
				cel.setCellValue(value);
				cel.getCellStyle().setAlignment(HSSFCellStyle.ALIGN_CENTER);
			}
			HSSFCell cell = row.createCell(0);
			cell.setCellValue(j);
		}
		HSSFRow row4 = sheet.createRow(idx);
		HSSFCell cell4 = row4.createCell(0);
		cell4.setCellStyle(styles.get("ctitle"));
		cell4.setCellValue("注："+"\r\n" + "1.家庭经济困难程度根据学校认定标准可分为一般困难、困难、特别困难；"
				+"\r\n"+"2.学习成绩根据学生上一学年的学习成绩分为优秀、良好、一般。");
		sheet.addMergedRegion(CellRangeAddress.valueOf("$A$"+(idx+1)+":$K$"+(idx+1)));
		row4.setHeight((short) 700.625);
		
		//最后一行
		HSSFRow row5 = sheet.createRow(idx+2);
		HSSFCell cell5 = row5.createCell(0);
		cell5.setCellValue("经办人：                        联系电话：                传真：              电子邮箱： ");
		sheet.addMergedRegion(CellRangeAddress.valueOf("$A$"+(idx+3)+":$K$"+(idx+3)));
		cell5.setCellStyle(styles.get("dtitle"));
		// 某些列设置宽度
		sheet.setColumnWidth(0, 6 * 256);
		sheet.setColumnWidth(1, 10 * 256);
		sheet.setColumnWidth(2, 20 * 256);
		sheet.setColumnWidth(3, 15 * 256);
		sheet.setColumnWidth(4, 20 * 256);
		sheet.setColumnWidth(5, 12 * 256);
		sheet.setColumnWidth(6, 6 * 256);
		sheet.setColumnWidth(7, 10 * 256);
		sheet.setColumnWidth(8, 15 * 256);
		sheet.setColumnWidth(9, 15 * 256);
		sheet.setColumnWidth(10, 10 * 256);

		String s ="test3.xls";
		String s3 = WriteToWeb(request, book, s);
		return s3;
	}
	/**
	 * 导出贫困生认定表
	 * @param aSubject 
	 * @param aRole 
	 * @throws Exception 
	 *
	 */
	public static String poorStudent(HttpServletRequest request, HttpServletResponse response, int aRole, int aSubject) throws Exception{

			// 要操作的数据库名称
			String dbName = "xsgz";
			// 新建工作簿
			HSSFWorkbook book = new HSSFWorkbook();
			Map<String, CellStyle> styles = createStyles(book);
			// 获取数据库连接
			Connection conn = DatabaseUtil.getConnection();
			// 得到分析元数据的 dmd
			DatabaseMetaData dmd = conn.getMetaData();
			Statement st = conn.createStatement();
			// 结果集
			ResultSet rs = dmd.getTables(dbName, dbName, null,
					new String[] { "TABLE" });
			HSSFSheet sheet = book.createSheet();
			// 要查询的东西
			String sql = "SELECT class.`className`,family.`level`,student.`studentName`"
					+ " FROM class,family,student,major"
					+ " WHERE student.`classId`=class.`classId` AND "
					+ "family.`studentNum`=student.`studentNum` AND class.`majorId`=major.`majorId`";
			// 执行查询语句，获得一系列数据
			if(aRole==2){
				sql = sql+" and major.`majorId`="+aSubject;
			// 执行查询语句，获得一系列数据
			}
			if(aRole==1){
				sql += "AND major.`academyId`="+aSubject;
			}
			sql +=" Order BY class.`classId`";
			rs = st.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();
			// 获得总列数
			int cols = rsmd.getColumnCount();
			String[] name = { "班级", "贫困等级", "姓名", "贷款金额", "签名" };
			// 创建第三行
			HSSFRow row = sheet.createRow(2);
			for (int i = 0; i < name.length; i++) {
				HSSFCell cell = row.createCell(i);
				cell.setCellValue(name[i]);
			}
			// 填充这些列
			int idx = 3;
			while (rs.next()) {
				row = sheet.createRow(idx++);
				for (int i = 0; i < cols; i++) {
					String value = rs.getString(i + 1);
					HSSFCell cel = row.createCell(i);
					cel.setCellValue(value);
					cel.getCellStyle().setAlignment(HSSFCellStyle.ALIGN_CENTER);
				}
			}

			// 某些列设置宽度
			sheet.setColumnWidth(0, 15 * 256);
			sheet.setColumnWidth(1, 15 * 256);
			sheet.setColumnWidth(2, 15 * 256);
			sheet.setColumnWidth(3, 10 * 256);
			sheet.setColumnWidth(4, 15 * 256);

			String s ="test4.xls";
			String s3 = WriteToWeb(request, book, s);
			return s3;
		}
	/**
	 * 字体样式
	 * @param wb
	 * @return
	 */
	private static Map<String, CellStyle> createStyles(Workbook wb) {
		Map<String, CellStyle> styles = new HashMap<String, CellStyle>();
		CellStyle style;
		Font titleFont = wb.createFont();
		titleFont.setFontHeightInPoints((short) 18);
		titleFont.setBoldweight(Font.BOLDWEIGHT_BOLD);
		style = wb.createCellStyle();
		style.setAlignment(CellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
		style.setFont(titleFont);
		styles.put("title", style);

		Font atitlefont = wb.createFont();
		atitlefont.setFontName("宋体");
		atitlefont.setFontHeightInPoints((short) 14);
		atitlefont.setBoldweight(Font.BOLDWEIGHT_BOLD);
		style = wb.createCellStyle();
		style.setAlignment(CellStyle.ALIGN_LEFT);
		style.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
		style.setFont(atitlefont);
		styles.put("atitle", style);

		Font btitlefont = wb.createFont();
		btitlefont.setFontName("宋体");
		btitlefont.setFontHeightInPoints((short) 14);
		style = wb.createCellStyle();
		style.setAlignment(CellStyle.ALIGN_LEFT);
		style.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
		style.setFont(btitlefont);
		styles.put("btitle", style);
		
		Font ctitleFont = wb.createFont();
		ctitleFont.setFontHeightInPoints((short) 10);
		style = wb.createCellStyle();
		style.setAlignment(CellStyle.ALIGN_LEFT);
		style.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
		style.setFont(ctitleFont);
		styles.put("ctitle", style);
		
		Font dtitleFont = wb.createFont();
		dtitleFont.setFontHeightInPoints((short) 15);
		style = wb.createCellStyle();
		style.setAlignment(CellStyle.ALIGN_LEFT);
		style.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
		style.setFont(dtitleFont);
		styles.put("dtitle", style);
		return styles;
	}
	public static String getWebRootPath(HttpServletRequest request) {  
        return request.getSession().getServletContext().getRealPath("/");  
    }
	
}
