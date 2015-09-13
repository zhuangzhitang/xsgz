package cn.gdou.xsgz.admin.base.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.junit.Test;

import cn.gdou.xsgz.util.DatabaseUtil;

public class TestExport {

	@Test
	public void export() throws Exception {

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
				+ " FROM class,family,student"
				+ " WHERE student.`classId`=class.`classId` AND "
				+ "family.`studentNum`=student.`studentNum` GROUP BY class.`classId`";
		// 执行查询语句，获得一系列数据
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

		File file = new File("d:/src/test.xls");
		if (file.exists()) {
			file.delete();
		}
		FileOutputStream out = new FileOutputStream(file);
		book.write(out);
	}

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
}
