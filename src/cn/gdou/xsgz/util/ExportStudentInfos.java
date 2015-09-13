package cn.gdou.xsgz.util;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;

import cn.gdou.xsgz.admin.base.dao.StudentInfoDao;
import cn.gdou.xsgz.domain.Student;

public class ExportStudentInfos {
	public boolean ExportStudent(String title,String[] headers,List<Student> infos,OutputStream out) throws Exception{
		//声明一个工作簿
		HSSFWorkbook workbook = new HSSFWorkbook();
		//生成一个表格
		HSSFSheet sheet = workbook.createSheet(title);
		//设置表格默认列宽度为15字节
		sheet.setDefaultColumnWidth(15);
		//生成一个样式
		HSSFCellStyle style = workbook.createCellStyle();
		
		// 设置这些样式
	      style.setFillForegroundColor(HSSFColor.WHITE.index);
	      style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
	      style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	      style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	      style.setBorderRight(HSSFCellStyle.BORDER_THIN);
	      style.setBorderTop(HSSFCellStyle.BORDER_THIN);
	      style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
	      // 生成一个字体
	      HSSFFont font = workbook.createFont();
	      font.setColor(HSSFColor.BLACK.index);
	      font.setFontHeightInPoints((short) 15);
	      font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
	      // 把字体应用到当前的样式
	      style.setFont(font);
	  
	      
	   // 生成并设置另一个样式
	      HSSFCellStyle style2 = workbook.createCellStyle();
	      // 生成另一个字体
	      HSSFFont font2 = workbook.createFont();
	      font2.setFontHeightInPoints((short) 12);
	      font2.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
	      // 把字体应用到当前的样式
	      style2.setFont(font2);
	      
	    //产生表格标题行
	      HSSFRow row = sheet.createRow(0);
	      for (short i = 0; i < headers.length; i++) {
			HSSFCell cell = row.createCell(i);
	         cell.setCellStyle(style);
	         HSSFRichTextString text = new HSSFRichTextString(headers[i]);
	         cell.setCellValue(text);
	      }
	      
	      //遍历集合数据，产生数据行
	      Iterator<Student> it = infos.iterator();
	      int index = 0;
	      while (it.hasNext()) {
	         index++;
	         row = sheet.createRow(index);
	         Student info = it.next();
	         HSSFCell cell = row.createCell(0);
             cell.setCellValue(info.getStudentNum());
             cell.setCellStyle(style2);
             cell = row.createCell(1);
             cell.setCellValue(info.getStudentName());
             cell.setCellStyle(style2);
             
             cell = row.createCell(2);
             cell.setCellValue(info.getSex());
             cell.setCellStyle(style2);
             
             cell = row.createCell(3);
             cell.setCellValue(info.getClassName());
             cell.setCellStyle(style2);
             
             cell = row.createCell(4);
             cell.setCellValue(info.getTimeofstart());
             cell.setCellStyle(style2);
             
             cell = row.createCell(5);
             cell.setCellValue(info.getDormitory());
             cell.setCellStyle(style2);
             
             cell = row.createCell(6);
             cell.setCellValue(info.getNation());
             cell.setCellStyle(style2);
             
             cell = row.createCell(7);
             cell.setCellValue(info.getFamilybackground());
             cell.setCellStyle(style2);
             
             cell = row.createCell(8);
             cell.setCellValue(info.getEducation());
             cell.setCellStyle(style2);
             
             cell = row.createCell(9);
             cell.setCellValue(info.getIdentityNum());
             cell.setCellStyle(style2);
             
             cell = row.createCell(10);
             cell.setCellValue(info.getBankCardNum());
             cell.setCellStyle(style2);
             
             cell = row.createCell(11);
             Date date = (Date) info.getBirth();
             SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
             cell.setCellValue(sdf.format(date));
             cell.setCellStyle(style2);
             
             cell = row.createCell(12);
             cell.setCellValue(info.getPoliticsStatus());
             cell.setCellStyle(style2);
             
             cell = row.createCell(13);
             cell.setCellValue(info.getHealthStatus());
             cell.setCellStyle(style2);
             
             cell = row.createCell(14);
             cell.setCellValue(info.getPhoneNum());
             cell.setCellStyle(style2);
             
             cell = row.createCell(15);
             cell.setCellValue(info.getQqNum());
             cell.setCellStyle(style2);
             
             cell = row.createCell(16);
             cell.setCellValue(info.getEmail());
             cell.setCellStyle(style2);
             
             cell = row.createCell(17);
             cell.setCellValue(info.getNativePlace());
             cell.setCellStyle(style2);
             
             cell = row.createCell(18);
             cell.setCellValue(info.getPostcode());
             cell.setCellStyle(style2);
             
             cell = row.createCell(19);
             cell.setCellValue(info.getFamilyPhone());
             cell.setCellStyle(style2);
             
             cell = row.createCell(20);
             cell.setCellValue(info.getAddress());
             cell.setCellStyle(style2);
	      }
	      workbook.write(out);
		return true ;
	}
	
	
	public static void main(String[] args) throws Exception {
		String title = "计科1101_学生信息.xls";
		String[] header = {"学号", "姓名" ,"性别" ,"班级" ,"入学年份" ,"宿舍 ","民族" ,"家庭出身", "教育程度" ,"身份证号" ,"银行卡号","出生年月", "政治面貌" ,"健康状况 ","手机","QQ号码","Email","籍贯","邮政编码","家庭电话 ","家庭地址" };
		StudentInfoDao dao = StudentInfoDao.getStudentInfoDaoInstance();
		List<Student> list = dao.getClassStudentsInfosByclassName("计科1101");
		FileOutputStream out = new FileOutputStream("c://abc.xls");
		ExportStudentInfos exports = new ExportStudentInfos();
		exports.ExportStudent(title, header, list, out);
		}
}
