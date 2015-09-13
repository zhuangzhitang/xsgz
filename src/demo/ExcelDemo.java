package demo;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

/**
 * 例子: 创建一个简单的Excel文件
 */
public class ExcelDemo {

	public static void main(String[] args) {
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("第一个表");
		Row row = sheet.createRow(0);
		Cell cell = row.createCell(0);
		cell.setCellValue("第一个单元");
	    try {
			FileOutputStream fileOut = new FileOutputStream("d:/学生工作管理系统.xls");
			wb.write(fileOut);
			fileOut.close();
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
