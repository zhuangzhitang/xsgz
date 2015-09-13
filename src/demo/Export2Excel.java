package demo;

import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import cn.gdou.xsgz.util.DatabaseUtil;

/**
 * 例子: 将数据库"xsgz"的所有表(包括数据)导出到Excel
 */
public class Export2Excel {

	public static void main(String[] args) throws Exception {
		
		//0. 建立数据库连接，得到数据库信息
		Connection con = DatabaseUtil.getConnection();
		DatabaseMetaData dmd = con.getMetaData();				
		String catName = "xsgz";//数据库名称
		ResultSet rs_tables = dmd.getTables(catName, catName, null, new String[]{"TABLE"});		
		
		List<String> list_tables = new ArrayList<String>();//---------所有表名
		while(rs_tables.next()){
			String tableName = rs_tables.getString("TABLE_NAME");
			list_tables.add(tableName);
		}		
		
		//1. 创建工作薄
		Workbook book = new HSSFWorkbook();		
		
		//2. 创建各个工作表，文件名称为各个表的名称
		Statement stm = con.createStatement();
		stm.execute("use "+catName);
		for(String name : list_tables){
			Sheet table = book.createSheet(name);
			
			//执行查询语句，得到表的所有数据				
			String sql = "select * from "+name;
			ResultSet data = stm.executeQuery(sql);
			
			//分析结果集元数据对象，获取表信息
			ResultSetMetaData rsmd = data.getMetaData();
			
		    //3. 在表中创建首行,值为表的字段名
			Row head = table.createRow(0);			
			int cols = rsmd.getColumnCount();
			for(int i=0;i<cols;i++){//---------------------所有字段名
				//为首行创建列，并写入表名
				Cell fcell = head.createCell(i);
				String field = rsmd.getColumnName(i+1);
				fcell.setCellValue(field);
			}
			
		    //4. 遍历ResultSet每行数据，将其各列数据填充到新建的单元格中
			int index = 1;
			while(data.next()){
				Row row = table.createRow(index++);		
				for(int i=0;i<cols;i++){
					Cell cell = row.createCell(i);
					cell.setCellValue(data.getString(i+1));
				}
			}
		}
		
		//5. 将工作薄写到磁盘,，文件名称为要导出数据的数据库名称
		FileOutputStream out = new FileOutputStream("d:/"+catName+".xls");
		book.write(out);
		out.close();
		
		System.out.println(catName+" 导出成功！！！！！！"); 	
	}

}
