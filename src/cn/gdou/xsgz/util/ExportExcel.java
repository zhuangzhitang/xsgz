package cn.gdou.xsgz.util;


import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.hssf.util.Region;
  
public class ExportExcel {  
  
    private HSSFWorkbook wb = null;  
  
    private HSSFSheet sheet = null;  
  
    /** 
     * @param wb 
     * @param sheet 
     */  
    public ExportExcel(HSSFWorkbook wb, HSSFSheet sheet) {  
        super();  
        this.wb = wb;  
        this.sheet = sheet;  
    }  
  
    /** 
     * @return the sheet 
     */  
    public HSSFSheet getSheet() {  
        return sheet;  
    }  
  
    /** 
     * @param sheet 
     *            the sheet to set 
     */  
    public void setSheet(HSSFSheet sheet) {  
        this.sheet = sheet;  
    }  
  
    /** 
     * @return the wb 
     */  
    public HSSFWorkbook getWb() {  
        return wb;  
    }  
  
    /** 
     * @param wb 
     *            the wb to set 
     */  
    public void setWb(HSSFWorkbook wb) {  
        this.wb = wb;  
    }  
  
    /** 
     * 创建通用EXCEL头部 
     *  
     * @param headString 
     *            头部显示的字符 
     * @param colSum 
     *            该报表的列数 
     */  
    @SuppressWarnings("deprecation")
	public void createNormalHead(int colSum) {  
  
        HSSFRow row = sheet.createRow(0);   
        row.setHeight((short)800);  
        for(int i=0;i<=colSum;i++){
        	if(i==0){
        		 // 设置第一行  
                HSSFCell cell = row.createCell(0);  
          
                // 定义单元格为字符串类型  
                cell.setCellType(HSSFCell.ENCODING_UTF_16);  
                cell.setCellValue(new HSSFRichTextString("学 生 素 质 综 合 测 评 表"));
                HSSFCellStyle cellStyle = wb.createCellStyle();  
                
                cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);        // 指定单元格居中对齐  
                cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 指定单元格垂直居中对齐  
                cellStyle.setWrapText(true);// 指定单元格自动换行  
                
          
                // 设置单元格字体  
                HSSFFont font = wb.createFont();  
                font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);  
                font.setFontName("宋体");  
                font.setFontHeight((short) 450);  
                cellStyle.setFont(font);  
          
                cell.setCellStyle(cellStyle);  
        	}else{
        		HSSFCell cell = row.createCell(i);
        		HSSFCellStyle cellStyle=wb.createCellStyle();
				cellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 设置单无格的边框为粗体 
    	        cellStyle.setBottomBorderColor(HSSFColor.BLACK.index); // 设置单元格的边框颜色． 
    	        cellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN); 
    	        cellStyle.setLeftBorderColor(HSSFColor.BLACK.index); 
    	        cellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN); 
    	        cellStyle.setRightBorderColor(HSSFColor.BLACK.index); 
    	        cellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN); 
    	        cellStyle.setTopBorderColor(HSSFColor.BLACK.index); 
    	        cell.setCellStyle(cellStyle);
        	}
        }
       
        
        // 指定合并区域  
        sheet.addMergedRegion(new Region(0, (short) 0, 0, (short) colSum));  
  
       
    }  
  
    @SuppressWarnings("deprecation")
	public void createNormalHead1(int colSum,String s){
    	 HSSFRow row = sheet.createRow(0);   
         row.setHeight((short)600);  
         for(int i=0;i<=colSum;i++){
         	if(i==0){
         		 // 设置第一行  
                 HSSFCell cell = row.createCell(0);  
           
                 // 定义单元格为字符串类型  
                 cell.setCellType(HSSFCell.ENCODING_UTF_16);  
                 cell.setCellValue(new HSSFRichTextString(s));
                 HSSFCellStyle cellStyle = wb.createCellStyle();  
                 
                 cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);        // 指定单元格居中对齐  
                 cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 指定单元格垂直居中对齐  
                 cellStyle.setWrapText(true);// 指定单元格自动换行  
                 
           
                 // 设置单元格字体  
                 HSSFFont font = wb.createFont();  
                 font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);  
                 font.setFontName("宋体");  
                 font.setFontHeight((short) 350);  
                 cellStyle.setFont(font);  
           
                 cell.setCellStyle(cellStyle);  
         	}else{
         		HSSFCell cell = row.createCell(i);
         		HSSFCellStyle cellStyle=wb.createCellStyle();
 				cellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 设置单无格的边框为粗体 
     	        cellStyle.setBottomBorderColor(HSSFColor.BLACK.index); // 设置单元格的边框颜色． 
     	        cellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN); 
     	        cellStyle.setLeftBorderColor(HSSFColor.BLACK.index); 
     	        cellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN); 
     	        cellStyle.setRightBorderColor(HSSFColor.BLACK.index); 
     	        cellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN); 
     	        cellStyle.setTopBorderColor(HSSFColor.BLACK.index); 
     	        cell.setCellStyle(cellStyle);
         	}
         }
        
         
         // 指定合并区域  
         sheet.addMergedRegion(new Region(0, (short) 0, 0, (short) colSum));  
    }
    /** 
     * 创建通用报表第二行 
     *  
     * @param params 
     *            统计条件数组 
     * @param colSum 
     *            需要合并到的列索引 
     */  
    @SuppressWarnings("deprecation")
	public void createNormalTwoRow(String[] params, int colSum) {  
    	HSSFRow row1 = sheet.createRow(1);  
        row1.setHeight((short) 600);  
          for(int i=0;i<=colSum;i++){
          	if(i==0){
          		 HSSFCell cell2 = row1.createCell(0);  
                 cell2.setCellType(HSSFCell.ENCODING_UTF_16);  
                 cell2.setCellValue(new HSSFRichTextString(params[0]+"(盖章) "+params[1]+" "+params[2]+"班 "+params[3]+"学年")); 

                 HSSFCellStyle cellStyle = wb.createCellStyle();  
                 cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 指定单元格居中对齐  
                 cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 指定单元格垂直居中对齐  
                 cellStyle.setWrapText(true);// 指定单元格自动换行  
           
                 // 设置单元格字体  
                 HSSFFont font = wb.createFont();  
                 font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);  
                 font.setFontName("宋体");  
                 font.setFontHeight((short) 350);  
                 cellStyle.setFont(font);  
           
                 cell2.setCellStyle(cellStyle);  
           
          	}else{
          		HSSFCell cell = row1.createCell(i);
          		HSSFCellStyle cellStyle=wb.createCellStyle();
  				cellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 设置单无格的边框为粗体 
      	        cellStyle.setBottomBorderColor(HSSFColor.BLACK.index); // 设置单元格的边框颜色． 
      	        cellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN); 
      	        cellStyle.setLeftBorderColor(HSSFColor.BLACK.index); 
      	        cellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN); 
      	        cellStyle.setRightBorderColor(HSSFColor.BLACK.index); 
      	        cellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN); 
      	        cellStyle.setTopBorderColor(HSSFColor.BLACK.index); 
      	        cell.setCellStyle(cellStyle);
          	}
          }
        // 指定合并区域  
        sheet.addMergedRegion(new Region(1, (short) 0, 1, (short) colSum));  
  
  
    }  
    /** 
     * 创建内容单元格 
     *  
     * @param wb 
     *            HSSFWorkbook 
     * @param row 
     *            HSSFRow 
     * @param col 
     *            short型的列索引 
     * @param align 
     *            对齐方式 
     * @param val 
     *            列值 
     */  
    public void createCell(HSSFWorkbook wb, HSSFRow row, int col, short align,  
            String val) {  
        HSSFCell cell = row.createCell(col);  
        cell.setCellType(HSSFCell.ENCODING_UTF_16);  
        cell.setCellValue(new HSSFRichTextString(val));  
        HSSFCellStyle cellstyle = wb.createCellStyle();  
        cellstyle.setAlignment(align);  
        cell.setCellStyle(cellstyle);  
    }  
    
  
    public HSSFCellStyle createCellStyleWithoutjiacu(){
    	// 创建单元格样式  
        HSSFCellStyle cellStyle = wb.createCellStyle();  
  
        // 指定单元格居中对齐  
        cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);  
  
        // 指定单元格垂直居中对齐  
        cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);  
  
        // 指定当单元格内容显示不下时自动换行  
        cellStyle.setWrapText(true);  
        
        // 设置单元格字体  
        HSSFFont font = wb.createFont();  
        font.setFontName("宋体");  
        font.setFontHeight((short) 200);  
        cellStyle.setFont(font);  
        return  cellStyle;
    }
    public HSSFCellStyle createCellStyle(){
    	// 创建单元格样式  
        HSSFCellStyle cellStyle = wb.createCellStyle();  
  
        // 指定单元格居中对齐  
        cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);  
  
        // 指定单元格垂直居中对齐  
        cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);  
  
        // 指定当单元格内容显示不下时自动换行  
        cellStyle.setWrapText(true);  
  
        cellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 设置单无格的边框为粗体 
        cellStyle.setBottomBorderColor(HSSFColor.BLACK.index); // 设置单元格的边框颜色． 
        cellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN); 
        cellStyle.setLeftBorderColor(HSSFColor.BLACK.index); 
        cellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN); 
        cellStyle.setRightBorderColor(HSSFColor.BLACK.index); 
        cellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN); 
        cellStyle.setTopBorderColor(HSSFColor.BLACK.index); 
        
        
        // 设置单元格字体  
        HSSFFont font = wb.createFont();  
        font.setFontName("宋体");  
        font.setFontHeight((short) 250);  
        cellStyle.setFont(font);  
        return  cellStyle;
    }
    
    public void createConductHead(String className, int colSum){
    	 HSSFRow row = sheet.createRow(0);   
         row.setHeight((short)800);  
         for(int i=0;i<=colSum;i++){
         	if(i==0){
         		 // 设置第一行  
                 HSSFCell cell = row.createCell(0);  
           
                 // 定义单元格为字符串类型  
                 cell.setCellType(HSSFCell.ENCODING_UTF_16);  
                 cell.setCellValue(new HSSFRichTextString(className+"班综合素质测评分公示表"));
                 HSSFCellStyle cellStyle = wb.createCellStyle();  
                 
                 cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);        // 指定单元格居中对齐  
                 cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 指定单元格垂直居中对齐  
                 cellStyle.setWrapText(true);// 指定单元格自动换行  
                 
           
                 // 设置单元格字体  
                 HSSFFont font = wb.createFont();  
                 font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);  
                 font.setFontName("宋体");  
                 font.setFontHeight((short) 450);  
                 cellStyle.setFont(font);  
           
                 cell.setCellStyle(cellStyle);  
         	}else{
         		HSSFCell cell = row.createCell(i);
         		HSSFCellStyle cellStyle=wb.createCellStyle();
 				cellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 设置单无格的边框为粗体 
     	        cellStyle.setBottomBorderColor(HSSFColor.BLACK.index); // 设置单元格的边框颜色． 
     	        cellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN); 
     	        cellStyle.setLeftBorderColor(HSSFColor.BLACK.index); 
     	        cellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN); 
     	        cellStyle.setRightBorderColor(HSSFColor.BLACK.index); 
     	        cellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN); 
     	        cellStyle.setTopBorderColor(HSSFColor.BLACK.index); 
     	        cell.setCellStyle(cellStyle);
         	}
         }
        
         
         // 指定合并区域  
         sheet.addMergedRegion(new Region(0, (short) 0, 0, (short) colSum));  
   
    }
}  
