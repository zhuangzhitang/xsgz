package cn.gdou.xsgz.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.util.Region;

import cn.gdou.xsgz.admin.conduct.dao.ConductDataOutputDao;
import cn.gdou.xsgz.domain.Conduct;
import cn.gdou.xsgz.domain.Course;
import cn.gdou.xsgz.domain.ScoreAndConduct;
import cn.gdou.xsgz.domain.Student;

public class CreateExcelUtil {
	/**
	 * 创建学生综合测评表（大三，没有体育素质分）
	 * @param scList 代表学生综合测评表各项分数的对象集合
	 * @param courseSet 课程集合，按照课程ID排序
	 * @param acaName   院名
	 * @param majorName 专业名
	 * @param className  班级名
	 * @param year    学年
	 * @param wb
	 * @return
	 */
   @SuppressWarnings("deprecation")
  public static HSSFWorkbook createZongheSheetNoSport(List<ScoreAndConduct> scList,Set<Course> courseSet,
			String acaName, String majorName, String className, String year,HSSFWorkbook wb) {
	   HSSFSheet sheet =wb.createSheet(className+"班");
	    //基本的列数
	    int number=18;
        ExportExcel excel=new ExportExcel(wb, sheet);
        HSSFCellStyle cellStyle=excel.createCellStyle();
        Course[] array=new Course[courseSet.size()];
        courseSet.toArray(array);
			number+=courseSet.size();
			// 给工作表列定义列宽(实际应用自己更改列数)  
	        for (int i = 0; i < number+1; i++) {  
	        	if(i==1){
	        		sheet.setColumnWidth(i, 3200);
	        	}else if(i==2+array.length||i==array.length+3||i==array.length+15){
	        		 sheet.setColumnWidth(i, 2000);
	        	} else{
	               sheet.setColumnWidth(i, 1200);
	        	}
	        }  
	        excel.createNormalHead(number);
	        excel.createNormalTwoRow(new String[]{acaName,majorName,className,year},number);
	        
	        HSSFRow row2=sheet.createRow(2);
	        row2.setHeight((short)300);
	        HSSFCell cell0 = row2.createCell(0);  
	        cell0.setCellStyle(cellStyle);  
	        cell0.setCellValue(new HSSFRichTextString("序号"));  
	        
	        HSSFCell cell1 = row2.createCell(1);  
	        cell1.setCellStyle(cellStyle);  
	        cell1.setCellValue(new HSSFRichTextString("科  目        成绩(绩点)    姓名"));  
	        
	        for(int i=0;i<array.length;i++){
	        	String courseName=array[i].getCno();
	            StringBuilder sb = new StringBuilder();
				for (String s : courseName.split("")) {
					sb.append(s);
					sb.append("\r\n");
				}
				HSSFCell cell=row2.createCell(2+i);
				cell.setCellStyle(cellStyle);
				cell.setCellValue(new HSSFRichTextString(sb.toString()));
	        }
	       
	        String[] ss=new String[]{"学期平均学分绩点","学业成绩75%","名次"};
	        for(int i=0;i<ss.length;i++){
	            StringBuilder sb = new StringBuilder();
				for (String s : ss[i].split("")) {
					sb.append(s);
					sb.append("\r\n");
				}
				HSSFCell cell=row2.createCell(2+array.length+i);
				cell.setCellStyle(cellStyle);
				cell.setCellValue(new HSSFRichTextString(sb.toString()));
	        }
	         
	        
	        for(int i=2+array.length+ss.length;i<2+array.length+ss.length+10;i++){
	        	if(i==2+array.length+ss.length){
	        	    HSSFCell cxfcell = row2.createCell(i);  
	 		        cxfcell.setCellStyle(cellStyle);  
	 		        cxfcell.setCellValue(new HSSFRichTextString("操行分15%")); 
	 		        continue;
	        	}
	        	if(i==2+array.length+ss.length+5){
	        		HSSFCell nlfcell = row2.createCell(2+array.length+ss.length+5);  
			        nlfcell.setCellStyle(cellStyle);  
			        nlfcell.setCellValue(new HSSFRichTextString("能力分10%")); 
			        continue;
	        	}
	        	HSSFCellStyle style=wb.createCellStyle();
	        	style.setBorderTop(HSSFCellStyle.BORDER_THIN); 
	  	        style.setTopBorderColor(HSSFColor.BLACK.index); 
	        	row2.createCell(i).setCellStyle(style);
	        }
	        String[] ss1=new String[]{"学期总评","总评名次","获奖等级","备注(挂科数)"};
	        
	        for(int i=0;i<ss1.length;i++){
	            StringBuilder sb = new StringBuilder();
				for (String s : ss1[i].split("")) {
					sb.append(s);
					sb.append("\r\n");
				}
				HSSFCell cell=row2.createCell(2+array.length+ss.length+10+i);
				cell.setCellStyle(cellStyle);
				cell.setCellValue(new HSSFRichTextString(sb.toString()));
	        }
	        
	        HSSFRow row3=sheet.createRow(3);
	        HSSFCellStyle cellStyle1=wb.createCellStyle();  
        	cellStyle1.setBorderRight(HSSFCellStyle.BORDER_THIN); 
            cellStyle1.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 设置单无格的边框为粗体 
 	        cellStyle1.setBottomBorderColor(HSSFColor.BLACK.index); // 设置单元格的边框颜色． 
        	cellStyle1.setBorderRight(HSSFCellStyle.BORDER_THIN);
	        for(int i=0;i<5+courseSet.size();i++){
	        	row3.createCell(i).setCellStyle(cellStyle1);
	        }
	        
	        row3.setHeight((short)2000);
	        String[] ss2=new String[]{"基本分","奖励分","扣除分","总分","名次","科技创新","技术技能","组织管理","特殊加分","总分"};
	        for(int i=0;i<ss2.length;i++){
	            StringBuilder sb = new StringBuilder();
				for (String s : ss2[i].split("")) {
					sb.append(s);
					sb.append("\r\n");
				}
				HSSFCell cell=row3.createCell(2+array.length+ss.length+i);
				cell.setCellStyle(cellStyle);
				cell.setCellValue(new HSSFRichTextString(sb.toString()));
	        }
	        
	        for(int i=2+array.length+ss.length+ss2.length;i<2+array.length+ss.length+ss2.length+4;i++){
	        	row3.createCell(i).setCellStyle(cellStyle1);
	        }
	        for(int i=0;i<5+courseSet.size();i++){
	        	sheet.addMergedRegion(new Region((short)2,(short)i,(short)3,(short)i));
	        }
	        //合并操行分单元格
	        sheet.addMergedRegion(new Region((short)2,(short)(5+courseSet.size()),(short)2,(short)(9+courseSet.size())));
	        //合并能力分单元格
	        sheet.addMergedRegion(new Region((short)2,(short)(10+courseSet.size()),(short)2,(short)(14+courseSet.size())));
	        //合并最后几项
	        for(int i=15+courseSet.size();i<=18+courseSet.size();i++){
	        	sheet.addMergedRegion(new Region((short)2,(short)i,(short)3,(short)i));
	        }
	        
	        HSSFRow row4=sheet.createRow(4);
	        row4.setHeight((short)300);
	        for(int i=1;i<2+array.length+17;i++){
	        	if(i==1){
	        		HSSFCell cell=row4.createCell(1);
	        		cell.setCellStyle(cellStyle);
	        		cell.setCellValue("学分");
	        	}else if(i<2+array.length){
	        		HSSFCell cell=row4.createCell(i);
	        		cell.setCellStyle(cellStyle);
	        		cell.setCellValue(array[i-2].getCredit());
	        	}else{
	        		HSSFCell cell=row4.createCell(i);
	        		cell.setCellStyle(cellStyle);
	        	}
	        }
	        
	        for(int i=0;i<scList.size();i++){
	        	 HSSFRow row=sheet.createRow(5+i);
	        	 row.setHeight((short)400);
	        	 //序号
	        	 HSSFCell cell=row.createCell(0);
	             cell.setCellStyle(cellStyle);
	        	 cell.setCellValue(new HSSFRichTextString((i+1)+""));
	        	 //姓名
	        	 HSSFCell namecell=row.createCell(1);
	        	 namecell.setCellStyle(cellStyle);
	        	 namecell.setCellValue(new HSSFRichTextString(scList.get(i).getStudent().getStudentName()));
	        	 
	        	 Map<Integer,Double> scoreMap=scList.get(i).getScore();
	        	 //设置成绩
	        	 for(int j=2;j<2+array.length;j++){
	        		 Integer courseId=array[j-2].getId();
	        		 Double score=scoreMap.get(courseId);
	        		 HSSFCell scorecell=row.createCell(j);
	        		 scorecell.setCellStyle(cellStyle);
	        		 scorecell.setCellValue(score);
	        	 }
	             //设置绩点
	        	 HSSFCell jidiancell=row.createCell(2+array.length);
	        	 jidiancell.setCellStyle(cellStyle);
	        	 jidiancell.setCellValue(scList.get(i).getAvgCredit());
	        	 
	        	 //设置学业成绩
	        	 HSSFCell avgScorecell=row.createCell(2+array.length+1);
	        	 avgScorecell.setCellStyle(cellStyle);
	        	 avgScorecell.setCellValue(scList.get(i).getAvgScore());
	        	 
	        	 //设置学业成绩名次
	        	 HSSFCell avgScoreNumcell=row.createCell(2+array.length+2);
	        	 avgScoreNumcell.setCellStyle(cellStyle);
	        	 avgScoreNumcell.setCellValue(scList.get(i).getAvgScoreNum());
	        	 
	        	 //设置操行分的基本分
	        	 HSSFCell baseCaoxingcell=row.createCell(2+array.length+3);
	        	 baseCaoxingcell.setCellStyle(cellStyle);
	        	 baseCaoxingcell.setCellValue(11);
	        	 
	        	 Map<Integer,Double> conductMap=scList.get(i).getConduct();
	        	 
	        	 //设置奖励分
	        	 HSSFCell jianglicell=row.createCell(2+array.length+4);
	        	 jianglicell.setCellStyle(cellStyle);
	        	 jianglicell.setCellValue(conductMap.get(4));
	        	 
	        	//设置扣除分
	        	 HSSFCell kouchucell=row.createCell(2+array.length+5);
	        	 kouchucell.setCellStyle(cellStyle);
	        	 kouchucell.setCellValue(conductMap.get(5));
	        	 
	        	//设置操行分总分
	        	 HSSFCell caoxingcell=row.createCell(2+array.length+6);
	        	 caoxingcell.setCellStyle(cellStyle);
	        	 caoxingcell.setCellValue(scList.get(i).getCaoxingScore());
	        	 
	        	//设置操行分名次
	        	 HSSFCell caoxingNumcell=row.createCell(2+array.length+7);
	        	 caoxingNumcell.setCellStyle(cellStyle);
	        	 caoxingNumcell.setCellValue(scList.get(i).getCaoxingScoreNum());
	        	 
	        	//设置科技创新
	        	 HSSFCell kejicell=row.createCell(2+array.length+8);
	        	 kejicell.setCellStyle(cellStyle);
	        	 kejicell.setCellValue(conductMap.get(1));
	        	 
	        	//设置技术技能
	        	 HSSFCell jishucell=row.createCell(2+array.length+9);
	        	 jishucell.setCellStyle(cellStyle);
	        	 jishucell.setCellValue(conductMap.get(6));
	        	 
	        	//设置组织管理
	        	 HSSFCell zuzhicell=row.createCell(2+array.length+10);
	        	 zuzhicell.setCellStyle(cellStyle);
	        	 zuzhicell.setCellValue(conductMap.get(2));
	        	 
	        	//设置特殊加分
	        	 HSSFCell tesucell=row.createCell(2+array.length+11);
	        	 tesucell.setCellStyle(cellStyle);
	        	 tesucell.setCellValue(conductMap.get(3));
	        	 
	        	//设置能力总分
	        	 HSSFCell nenglicell=row.createCell(2+array.length+12);
	        	 nenglicell.setCellStyle(cellStyle);
	        	 nenglicell.setCellValue(scList.get(i).getNengliScore());
	        	 
	        	 //设置总评
	        	 HSSFCell allScorecell=row.createCell(2+array.length+13);
	        	 allScorecell.setCellStyle(cellStyle);
	        	 allScorecell.setCellValue(scList.get(i).getAllscore());
	        	 
	        	 //设置总评名次
	        	 HSSFCell allScoreNumcell=row.createCell(2+array.length+14);
	        	 allScoreNumcell.setCellStyle(cellStyle);
	        	 allScoreNumcell.setCellValue(scList.get(i).getAllscoreNum());
	        	 
	        	 //获奖
	        	 HSSFCell huajiangcell=row.createCell(2+array.length+15);
	        	 huajiangcell.setCellStyle(cellStyle);
	        	 huajiangcell.setCellValue(scList.get(i).getNum());
	        	 //设置挂科数
	        	 HSSFCell guakecell=row.createCell(2+array.length+16);
	        	 guakecell.setCellStyle(cellStyle);
	        	 int num=scList.get(i).getGuakeNUm();
	        	 if(num==0){
	        		 guakecell.setCellValue("");
	        	 }else{
	        	     guakecell.setCellValue(num);
	        	 }
	        }
	        return wb;
	}
   
   @SuppressWarnings("deprecation")
   public static HSSFWorkbook createZongheSheetHaveSport(List<ScoreAndConduct> scList,Set<Course> courseSet,
 			String acaName, String majorName, String className, String year,HSSFWorkbook wb) {
 	   HSSFSheet sheet =wb.createSheet(className+"班");
 	    //基本的列数
 	    int number=21;
         ExportExcel excel=new ExportExcel(wb, sheet);
         HSSFCellStyle cellStyle=excel.createCellStyle();
         Course[] array=new Course[courseSet.size()];
         courseSet.toArray(array);
 			number+=courseSet.size();
 			// 给工作表列定义列宽(实际应用自己更改列数)  
 	        for (int i = 0; i < number+1; i++) {  
 	        	if(i==1){
 	        		sheet.setColumnWidth(i, 3200);
 	        	}else if(i==4+array.length||i==array.length+5||i==array.length+18){
 	        		 sheet.setColumnWidth(i, 2000);
 	        	} else{
 	               sheet.setColumnWidth(i, 1200);
 	        	}
 	        }  
 	        excel.createNormalHead(number);
 	        excel.createNormalTwoRow(new String[]{acaName,majorName,className,year},number);
 	        
 	        HSSFRow row2=sheet.createRow(2);
 	        row2.setHeight((short)300);
 	        HSSFCell cell0 = row2.createCell(0);  
 	        cell0.setCellStyle(cellStyle);  
 	        cell0.setCellValue(new HSSFRichTextString("序号"));  
 	        
 	        HSSFCell cell1 = row2.createCell(1);  
 	        cell1.setCellStyle(cellStyle);  
 	        cell1.setCellValue(new HSSFRichTextString("科  目        成绩(绩点)    姓名"));  
 	        
 	        for(int i=0;i<array.length+2;i++){
 	        	String courseName=null;
 	        	if(i==array.length){
 	        		courseName="体育1";
 	        	}else if(i==array.length+1){
 	        		courseName="体育2";
 	        	}else{
 	        	  courseName=array[i].getCno();
 	        	}
 	             StringBuilder sb = new StringBuilder();
 				 for (String s : courseName.split("")) {
 					sb.append(s);
 					sb.append("\r\n");
 				}
 				HSSFCell cell=row2.createCell(2+i);
 				cell.setCellStyle(cellStyle);
 				cell.setCellValue(new HSSFRichTextString(sb.toString()));
 	        }
 	       
 	        String[] ss=new String[]{"学期平均学分绩点","学业成绩70%","名次"};
 	        for(int i=0;i<ss.length;i++){
 	            StringBuilder sb = new StringBuilder();
 				for (String s : ss[i].split("")) {
 					sb.append(s);
 					sb.append("\r\n");
 				}
 				HSSFCell cell=row2.createCell(2+array.length+i+2);
 				cell.setCellStyle(cellStyle);
 				cell.setCellValue(new HSSFRichTextString(sb.toString()));
 	        }
 	         
 	        
 	        for(int i=2+array.length+ss.length+2;i<2+array.length+ss.length+12;i++){
 	        	if(i==2+array.length+ss.length+2){
 	        	    HSSFCell cxfcell = row2.createCell(i);  
 	 		        cxfcell.setCellStyle(cellStyle);  
 	 		        cxfcell.setCellValue(new HSSFRichTextString("操行分15%")); 
 	 		        continue;
 	        	}
 	        	if(i==2+array.length+ss.length+7){
 	        		HSSFCell nlfcell = row2.createCell(2+array.length+ss.length+7);  
 			        nlfcell.setCellStyle(cellStyle);  
 			        nlfcell.setCellValue(new HSSFRichTextString("能力分10%")); 
 			        continue;
 	        	}
 	        	HSSFCellStyle style=wb.createCellStyle();
 	        	style.setBorderTop(HSSFCellStyle.BORDER_THIN); 
 	  	        style.setTopBorderColor(HSSFColor.BLACK.index); 
 	        	row2.createCell(i).setCellStyle(style);
 	        }
 	        
 	        String[] ss1=new String[]{"体育分 5%","学期总评","总评名次","获奖等级","备注(挂科数)"};
 	        
 	        for(int i=0;i<ss1.length;i++){
 	            StringBuilder sb = new StringBuilder();
 				for (String s : ss1[i].split("")) {
 					sb.append(s);
 					sb.append("\r\n");
 				}
 				HSSFCell cell=row2.createCell(2+array.length+ss.length+10+i+2);
 				cell.setCellStyle(cellStyle);
 				cell.setCellValue(new HSSFRichTextString(sb.toString()));
 	        }
 	        
 	        HSSFRow row3=sheet.createRow(3);
 	        HSSFCellStyle cellStyle1=wb.createCellStyle();  
         	cellStyle1.setBorderRight(HSSFCellStyle.BORDER_THIN); 
             cellStyle1.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 设置单无格的边框为粗体 
  	        cellStyle1.setBottomBorderColor(HSSFColor.BLACK.index); // 设置单元格的边框颜色． 
         	cellStyle1.setBorderRight(HSSFCellStyle.BORDER_THIN);
 	        for(int i=0;i<5+courseSet.size()+2;i++){
 	        	row3.createCell(i).setCellStyle(cellStyle1);
 	        }
 	        
 	        row3.setHeight((short)2400);
 	        String[] ss2=new String[]{"基本分","奖励分","扣除分","总分","名次","科技创新","技术技能","组织管理","特殊加分","总分"};
 	        for(int i=0;i<ss2.length;i++){
 	            StringBuilder sb = new StringBuilder();
 				for (String s : ss2[i].split("")) {
 					sb.append(s);
 					sb.append("\r\n");
 				}
 				HSSFCell cell=row3.createCell(2+array.length+ss.length+i+2);
 				cell.setCellStyle(cellStyle);
 				cell.setCellValue(new HSSFRichTextString(sb.toString()));
 	        }
 	        
 	        for(int i=2+array.length+ss.length+ss2.length+2;i<2+array.length+ss.length+ss2.length+4+3;i++){
 	        	row3.createCell(i).setCellStyle(cellStyle1);
 	        }
 	        for(int i=0;i<5+courseSet.size()+2;i++){
 	        	sheet.addMergedRegion(new Region((short)2,(short)i,(short)3,(short)i));
 	        }
 	        //合并操行分单元格
 	        sheet.addMergedRegion(new Region((short)2,(short)(5+courseSet.size()+2),(short)2,(short)(9+courseSet.size()+2)));
 	        //合并能力分单元格
 	        sheet.addMergedRegion(new Region((short)2,(short)(10+courseSet.size()+2),(short)2,(short)(14+courseSet.size()+2)));
 	        //合并最后几项
 	        for(int i=15+courseSet.size()+2;i<=21+courseSet.size();i++){
 	        	sheet.addMergedRegion(new Region((short)2,(short)i,(short)3,(short)i));
 	        }
 	        
 	        
 	        HSSFRow row4=sheet.createRow(4);
 	        row4.setHeight((short)300);
 	        for(int i=1;i<2+array.length+17;i++){
 	        	if(i==1){
 	        		HSSFCell cell=row4.createCell(1);
 	        		cell.setCellStyle(cellStyle);
 	        		cell.setCellValue("学分");
 	        	}else if(i<2+array.length){
 	        		HSSFCell cell=row4.createCell(i);
 	        		cell.setCellStyle(cellStyle);
 	        		cell.setCellValue(array[i-2].getCredit());
 	        	}else{
 	        		HSSFCell cell=row4.createCell(i);
 	        		cell.setCellStyle(cellStyle);
 	        	}
 	        }
 	        
 	        for(int i=0;i<scList.size();i++){
 	        	 HSSFRow row=sheet.createRow(5+i);
 	        	 row.setHeight((short)400);
 	        	 //序号
 	        	 HSSFCell cell=row.createCell(0);
 	             cell.setCellStyle(cellStyle);
 	        	 cell.setCellValue(new HSSFRichTextString((i+1)+""));
 	        	 //姓名
 	        	 HSSFCell namecell=row.createCell(1);
 	        	 namecell.setCellStyle(cellStyle);
 	        	 namecell.setCellValue(new HSSFRichTextString(scList.get(i).getStudent().getStudentName()));
 	        	 
 	        	 Map<Integer,Double> scoreMap=scList.get(i).getScore();
 	        	 //设置成绩
 	        	 for(int j=2;j<2+array.length;j++){
 	        		 Integer courseId=array[j-2].getId();
 	        		 Double score=scoreMap.get(courseId);
 	        		 HSSFCell scorecell=row.createCell(j);
 	        		 scorecell.setCellStyle(cellStyle);
 	        		 scorecell.setCellValue(score);
 	        	 }
 	        	//设置体育1
        		 HSSFCell sportcell=row.createCell(2+array.length);
        		 sportcell.setCellStyle(cellStyle);
        		 sportcell.setCellValue(scoreMap.get(-1));
        		 
        		//设置体育2
        		 HSSFCell sportcell1=row.createCell(2+array.length+1);
        		 sportcell1.setCellStyle(cellStyle);
        		 sportcell1.setCellValue(scoreMap.get(-2));
        		 
 	             //设置绩点
 	        	 HSSFCell jidiancell=row.createCell(2+array.length+2);
 	        	 jidiancell.setCellStyle(cellStyle);
 	        	 jidiancell.setCellValue(scList.get(i).getAvgCredit());
 	        	 
 	        	 //设置学业成绩
 	        	 HSSFCell avgScorecell=row.createCell(2+array.length+1+2);
 	        	 avgScorecell.setCellStyle(cellStyle);
 	        	 avgScorecell.setCellValue(scList.get(i).getAvgScore());
 	        	 
 	        	 //设置学业成绩名次
 	        	 HSSFCell avgScoreNumcell=row.createCell(2+array.length+2+2);
 	        	 avgScoreNumcell.setCellStyle(cellStyle);
 	        	 avgScoreNumcell.setCellValue(scList.get(i).getAvgScoreNum());
 	        	 
 	        	 //设置操行分的基本分
 	        	 HSSFCell baseCaoxingcell=row.createCell(2+array.length+3+2);
 	        	 baseCaoxingcell.setCellStyle(cellStyle);
 	        	 baseCaoxingcell.setCellValue(11);
 	        	 
 	        	 Map<Integer,Double> conductMap=scList.get(i).getConduct();
 	        	 
 	        	 //设置奖励分
 	        	 HSSFCell jianglicell=row.createCell(2+array.length+4+2);
 	        	 jianglicell.setCellStyle(cellStyle);
 	        	 jianglicell.setCellValue(conductMap.get(4));
 	        	 
 	        	//设置扣除分
 	        	 HSSFCell kouchucell=row.createCell(2+array.length+5+2);
 	        	 kouchucell.setCellStyle(cellStyle);
 	        	 kouchucell.setCellValue(conductMap.get(5));
 	        	 
 	        	//设置操行分总分
 	        	 HSSFCell caoxingcell=row.createCell(2+array.length+6+2);
 	        	 caoxingcell.setCellStyle(cellStyle);
 	        	 caoxingcell.setCellValue(scList.get(i).getCaoxingScore());
 	        	 
 	        	//设置操行分名次
 	        	 HSSFCell caoxingNumcell=row.createCell(2+array.length+7+2);
 	        	 caoxingNumcell.setCellStyle(cellStyle);
 	        	 caoxingNumcell.setCellValue(scList.get(i).getCaoxingScoreNum());
 	        	 
 	        	//设置科技创新
 	        	 HSSFCell kejicell=row.createCell(2+array.length+8+2);
 	        	 kejicell.setCellStyle(cellStyle);
 	        	 kejicell.setCellValue(conductMap.get(1));
 	        	 
 	        	//设置技术技能
 	        	 HSSFCell jishucell=row.createCell(2+array.length+9+2);
 	        	 jishucell.setCellStyle(cellStyle);
 	        	 jishucell.setCellValue(conductMap.get(6));
 	        	 
 	        	//设置组织管理
 	        	 HSSFCell zuzhicell=row.createCell(2+array.length+10+2);
 	        	 zuzhicell.setCellStyle(cellStyle);
 	        	 zuzhicell.setCellValue(conductMap.get(2));
 	        	 
 	        	//设置特殊加分
 	        	 HSSFCell tesucell=row.createCell(2+array.length+11+2);
 	        	 tesucell.setCellStyle(cellStyle);
 	        	 tesucell.setCellValue(conductMap.get(3));
 	        	 
 	        	//设置能力总分
 	        	 HSSFCell nenglicell=row.createCell(2+array.length+12+2);
 	        	 nenglicell.setCellStyle(cellStyle);
 	        	 nenglicell.setCellValue(scList.get(i).getNengliScore());
 	        	 
 	        	 //设置体育分
 	        	 HSSFCell scell=row.createCell(2+array.length+12+3);
 	        	 scell.setCellStyle(cellStyle);
 	        	 scell.setCellValue(scList.get(i).getSportscore());
 	        	 
 	        	 //设置总评
 	        	 HSSFCell allScorecell=row.createCell(2+array.length+13+3);
 	        	 allScorecell.setCellStyle(cellStyle);
 	        	 allScorecell.setCellValue(scList.get(i).getAllscore());
 	        	 
 	        	 //设置总评名次
 	        	 HSSFCell allScoreNumcell=row.createCell(2+array.length+14+3);
 	        	 allScoreNumcell.setCellStyle(cellStyle);
 	        	 allScoreNumcell.setCellValue(scList.get(i).getAllscoreNum());
 	        	 
 	        	 //获奖
 	        	 HSSFCell huajiangcell=row.createCell(2+array.length+15+3);
 	        	 huajiangcell.setCellStyle(cellStyle);
 	        	  huajiangcell.setCellValue(scList.get(i).getNum());
 	        	 
 	        	 //设置挂科数
 	        	 HSSFCell guakecell=row.createCell(2+array.length+16+3);
 	        	 guakecell.setCellStyle(cellStyle);
 	        	 int num=scList.get(i).getGuakeNUm();
 	        	 if(num==0){
 	        		 guakecell.setCellValue("");
 	        	 }else{
 	        	     guakecell.setCellValue(num);
 	        	 }
 	        }
 	        
 	        return wb;
 	}
   /** 
    * 输出EXCEL文件 
    *  
    * @param fileName 文件路径
    *            
    */  
   public static void outputExcel(String fileName,HSSFWorkbook wb) {  
       FileOutputStream fos = null;  
       try {  
           fos = new FileOutputStream(new File(fileName));  
           wb.write(fos);  
           fos.close();  
       } catch (FileNotFoundException e) {  
           e.printStackTrace();  
       } catch (IOException e) {  
           e.printStackTrace();  
       }  
   }  
   /**
    * 创建一个系奖学金获得者名单的excel表格
    * @param map   获得奖学金的学生，key代表获得的奖学金的等级
    * @param majorName  系名
    * @param year  学年
    * @param wb
    * @return
    */
   public static HSSFWorkbook createhuodezheExcel(Map<Integer,List<Student>> map,String majorName,String year,HSSFWorkbook wb){
	   HSSFSheet sheet=wb.createSheet(majorName+"系");
	   ExportExcel ex=new ExportExcel(wb, sheet);
	   ex.createNormalHead1(8, majorName+"系"+year+"学年"+"优秀学生奖学金获得者名单");
	   int number=9;
	   for (int i = 1; i < number+1; i++) {  
        	if(i%3==1){
        		sheet.setColumnWidth(i-1,1600);
        	}else if(i%3==2){
        		sheet.setColumnWidth(i-1,2600);
        	}else if(i%3==0){
        		sheet.setColumnWidth(i-1,3600);
        	}
        }  
	   sheet.createRow(1).setHeight((short)400);
	  HSSFCellStyle style=ex.createCellStyle();
	  
	  for(int j=1;j<=3;j++){
		  int start=0;
		  if(j==1){
			   start=2;
		  }else if(j==2){
			   if(map.get(1).size()%3==0){
				   start=2+2+map.get(1).size()/3;
			   }else{
				   start=2+2+map.get(1).size()/3+1;
			   }
		  }else if(j==3){
			  if(map.get(1).size()%3==0&&map.get(1).size()%3==0){
				  start=2+2+2+map.get(1).size()/3+map.get(2).size()/3;
			  }else if(map.get(1).size()%3!=0&&map.get(1).size()%3!=0){
				  start=2+2+map.get(1).size()/3+1+2+map.get(2).size()/3+1;
			  }else{
				  start=2+2+map.get(1).size()/3+2+map.get(2).size()/3+1;
			  }
			  
		  }
		  System.out.println(start);
		  HSSFRow row2=sheet.createRow(start);
		  row2.setHeight((short)450);
		  HSSFCell cell2_0=row2.createCell(0);
		  HSSFCellStyle cellstyle=ex.createCellStyleWithoutjiacu();
		  cell2_0.setCellStyle(cellstyle);
		  if(j==1){
		    cell2_0.setCellValue("一等奖");
		  }else if(j==2){
			  cell2_0.setCellValue("二等奖");
		  }else if(j==3){
			  cell2_0.setCellValue("三等奖");
		  }
		  
		  sheet.addMergedRegion(new Region((short)start, (short)0, (short)start, (short)1));
		  
		  HSSFCell cell2_2=row2.createCell(2);
		  cell2_2.setCellStyle(cellstyle);
		  if(j==1){
			  cell2_2.setCellValue(map.get(1).size()+"人");
		  }else if(j==2){
				  cell2_2.setCellValue(map.get(2).size()+"人");
		  }else if(j==3){
				  cell2_2.setCellValue(map.get(3).size()+"人");
		  }
		 
		  HSSFRow row3=sheet.createRow(start+1);
		  row3.setHeight((short)400);
		  for(int i=1;i<number+1;i++){
			  if(i%3==1){
	      		HSSFCell cell=row3.createCell(i-1);
	      		cell.setCellStyle(style);
	      		cell.setCellValue("序号");
	      	}else if(i%3==2){
	      		HSSFCell cell=row3.createCell(i-1);
	      		cell.setCellStyle(style);
	      		cell.setCellValue("姓名");
	      	}else if(i%3==0){
	      		HSSFCell cell=row3.createCell(i-1);
	      		cell.setCellStyle(style);
	      		cell.setCellValue("学号");
	      	}
		  }
		  
		   int rownum=start+2;
		   List<Student> firstList=null;
		   if(j==1){
				firstList=map.get(1);
		   }else if(j==2){
			    firstList=map.get(2);
		   }else if(j==3){
			   firstList=map.get(3);
		   }
		   HSSFRow row=null;
		   for(int i=1;i<firstList.size()+1;i++){
			   if(i%3==1){
				   row=sheet.createRow(rownum);
				   row.setHeight((short)400);
				   rownum++;
				   HSSFCell cell=row.createCell(0);
				   cell.setCellStyle(style);
		      	   cell.setCellValue(i);
		      	   
		      	   HSSFCell namecell=row.createCell(1);
		      	   namecell.setCellStyle(style);
		      	   namecell.setCellValue(firstList.get(i-1).getStudentName());
		      	   
		      	   HSSFCell xuehaocell=row.createCell(2);
		      	   xuehaocell.setCellStyle(style);
		           xuehaocell.setCellValue(firstList.get(i-1).getStudentNum());
			   }else if(i%3==2){
				   HSSFCell cell=row.createCell(3);
				   cell.setCellStyle(style);
		      	   cell.setCellValue(i);
		      	   
		      	   HSSFCell namecell=row.createCell(4);
		      	   namecell.setCellStyle(style);
		      	   namecell.setCellValue(firstList.get(i-1).getStudentName());
		      	   
		      	   HSSFCell xuehaocell=row.createCell(5);
		      	   xuehaocell.setCellStyle(style);
		      	   xuehaocell.setCellValue(firstList.get(i-1).getStudentNum());
			   }else if(i%3==0){
				   HSSFCell cell=row.createCell(6);
				   cell.setCellStyle(style);
		      	   cell.setCellValue(i);
		      	   
		      	   HSSFCell namecell=row.createCell(7);
		      	   namecell.setCellStyle(style);
		      	   namecell.setCellValue(firstList.get(i-1).getStudentName());
		      	   
		      	   HSSFCell xuehaocell=row.createCell(8);
		      	   xuehaocell.setCellStyle(style);
		      	   xuehaocell.setCellValue(firstList.get(i-1).getStudentNum());
			   }
		   }
	  }
	   return wb;
   }
   
   public static HSSFWorkbook createfafangExcel(Map<Integer,List<Student>> map,String majorName,String year,HSSFWorkbook wb){
	   HSSFSheet sheet=wb.createSheet(majorName+"系");
	   ExportExcel ex=new ExportExcel(wb, sheet);
	   ex.createNormalHead1(7,year+"学年"+majorName+"系优秀学生奖学金发放表");
	   int num=8;
	   for(int i=1;i<num+1;i++){
		   if(i==1){
			   sheet.setColumnWidth(0, 1600);
		   }else if(i==3||i==5){
			   sheet.setColumnWidth(i-1,4500);
		   }else if(i==4){
			   sheet.setColumnWidth(i-1,8000);
		   }else{
			   sheet.setColumnWidth(i-1,2800);
		   }
	   }
	   HSSFRow row1=sheet.createRow(1);
	   row1.setHeight((short)500);
	   String[] ss=new String[]{"序号","姓名","学号","建行银行卡号","获奖等级","金额","签领","备注"};
	   HSSFCellStyle cellStyle=ex.createCellStyle();
	   for(int i=0;i<ss.length;i++){
		   HSSFCell cell=row1.createCell(i);
		   cell.setCellStyle(cellStyle);
		   cell.setCellValue(ss[i]);
	   }
	   int row=2;
	   int n=1;
	   for(int i=1;i<=3;i++){
		   List<Student> stuList=map.get(i);
		   for(Student s:stuList){
			   HSSFRow sturow=sheet.createRow(row);
			   sturow.setHeight((short)500);
			   HSSFCell cell1=sturow.createCell(0);
			   cell1.setCellStyle(cellStyle);
			   cell1.setCellValue(n);
			   
			   HSSFCell cell2=sturow.createCell(1);
			   cell2.setCellStyle(cellStyle);
			   cell2.setCellValue(s.getStudentName());
			   
			   HSSFCell cell3=sturow.createCell(2);
			   cell3.setCellStyle(cellStyle);
			   cell3.setCellValue(s.getStudentNum());
			   
			   HSSFCell cell4=sturow.createCell(3);
			   cell4.setCellStyle(cellStyle);
			   cell4.setCellValue(s.getBankCardNum());
			   
			   HSSFCell cell5=sturow.createCell(4);
			   cell5.setCellStyle(cellStyle);
			   if(i==1){
				   cell5.setCellValue("一等");
			   }else if(i==2){
				   cell5.setCellValue("二等");
			   }else if(i==3){
				   cell5.setCellValue("三等");
			   }
			   
			   HSSFCell cell6=sturow.createCell(5);
			   cell6.setCellStyle(cellStyle);
			   if(i==1){
				   cell6.setCellValue(1400);
			   }else if(i==2){
				   cell6.setCellValue(700);
			   }else if(i==3){
				   cell6.setCellValue(300);
			   }
			   
			   HSSFCell cell7=sturow.createCell(6);
			   cell7.setCellStyle(cellStyle);
			   
			   HSSFCell cell8=sturow.createCell(7);
			   cell8.setCellStyle(cellStyle);
			   row++;
			   n++;
		   }
	   }
	   return wb;
   }


	@SuppressWarnings("deprecation")
	public static HSSFWorkbook createConductExcel(String className,List<Conduct> conductList,Map<Integer, List<Integer>> allConductitemMap) {
		HSSFWorkbook wb=new HSSFWorkbook();
		HSSFSheet sheet=wb.createSheet(className+"操行分表");
		ExportExcel ex=new ExportExcel(wb, sheet);
		int jiafennum=allConductitemMap.get(1).size();;
		int koufennum=allConductitemMap.get(2).size();;
		int jishunum=allConductitemMap.get(3).size();;
		int num=3+jiafennum+1+koufennum+1+jishunum+1+3+1;
		ex.createConductHead(className,num-1);
		for(int i=0;i<num;i++){
			if(i==0){
				sheet.setColumnWidth(i,4500);
			}else if(i==1){
				sheet.setColumnWidth(i,3200);
			}else{
				sheet.setColumnWidth(i,1600);
			}
		}
		String[] ss=new String[]{"学号","姓名","思想道德素质","社会实践能力","总分"};
		HSSFCellStyle cellStyle=ex.createCellStyle();
		HSSFRow row1=sheet.createRow(1);
		row1.setHeight((short)300);
		for(int i=0;i<num;i++){
			HSSFCell cell=row1.createCell(i);
			if(i==0||i==1){
				String ss1=ss[i];
	            StringBuilder sb = new StringBuilder();
				for (String s : ss1.split("")) {
					sb.append(s);
					sb.append("\r\n");
				}
				cell.setCellValue(sb.toString());
			}else if(i==num-1){
				String ss1=ss[4];
	            StringBuilder sb = new StringBuilder();
				for (String s : ss1.split("")) {
					sb.append(s);
					sb.append("\r\n");
				}
				cell.setCellValue(sb.toString());
			}else if(i==2){
				cell.setCellValue(ss[2]);
			}else if(i==2+jiafennum+1+koufennum+1+1){
				cell.setCellValue(ss[3]);
			}
			cell.setCellStyle(cellStyle);
		}
		HSSFRow row2=sheet.createRow(2);
		row2.setHeight((short)300);
		String[] ss2=new String[]{"基本分","奖励原因及加分情况","扣分情况","技术技能","科技创新","组织管理分","特殊分"};
		for(int i=0;i<num;i++){
			HSSFCell cell=row2.createCell(i);
			if(i==2){  
				String ss1=ss2[0];
	            StringBuilder sb = new StringBuilder();
				for (String s:ss1.split("")) {
					sb.append(s);
					sb.append("\r\n");
				}
				cell.setCellValue(sb.toString());
			}else if(i==3){
				cell.setCellValue(ss2[1]);
			}else if(i==3+jiafennum+1){
				cell.setCellValue(ss2[2]);
			}else if(i==3+jiafennum+koufennum+2){
				cell.setCellValue(ss2[3]);
			}else if(i==3+jiafennum+koufennum+jishunum+3){
				String ss1=ss2[4];
	            StringBuilder sb = new StringBuilder();
				for (String s : ss1.split("")) {
					sb.append(s);
					sb.append("\r\n");
				}
				cell.setCellValue(sb.toString());
			}else if(i==3+jiafennum+koufennum+jishunum+4){
				String ss1=ss2[5];
	            StringBuilder sb = new StringBuilder();
				for (String s : ss1.split("")) {
					sb.append(s);
					sb.append("\r\n");
				}
				cell.setCellValue(sb.toString());
			}else if(i==3+jiafennum+koufennum+jishunum+5){
				String ss1=ss2[6];
	            StringBuilder sb = new StringBuilder();
				for (String s : ss1.split("")) {
					sb.append(s);
					sb.append("\r\n");
				}
				cell.setCellValue(sb.toString());
			}
			cell.setCellStyle(cellStyle);
		}
		
		HSSFRow row3=sheet.createRow(3);
		row3.setHeight((short)2500);
		ConductDataOutputDao dao=new ConductDataOutputDao();
		for(int i=0;i<num;i++){
			HSSFCell cell=row3.createCell(i);
			if(i>2&&i<=2+jiafennum){
				 String conductName=dao.queryConductItembyId(allConductitemMap.get(1).get(i-3)).getConduct_name();
				 StringBuilder sb = new StringBuilder();
				 for (String s : conductName.split("")) {
						sb.append(s);
						sb.append("\r\n");
				 }
				   cell.setCellValue(sb.toString()); 
				 
			}else if(i==2+jiafennum+1){
				String ss1="奖励分总分";
				StringBuilder sb = new StringBuilder();
				 for (String s : ss1.split("")) {
						sb.append(s);
						sb.append("\r\n");
				 }
				   cell.setCellValue(sb.toString()); 
			}else if(i>3+jiafennum&&i<=3+jiafennum+koufennum){
				 String conductName=dao.queryConductItembyId(allConductitemMap.get(2).get(i-4-jiafennum)).getConduct_name();
				 StringBuilder sb = new StringBuilder();
				 for (String s : conductName.split("")) {
						sb.append(s);
						sb.append("\r\n");
				 }
				  cell.setCellValue(sb.toString()); 
			}else if(i==3+jiafennum+koufennum+1){
				String ss1="扣除分总分";
				StringBuilder sb = new StringBuilder();
				 for (String s : ss1.split("")) {
						sb.append(s);
						sb.append("\r\n");
				 }
				 cell.setCellValue(sb.toString()); 
			}else if(i>3+jiafennum+koufennum+1&&i<=3+jiafennum+koufennum+1+jishunum){
				String conductName=dao.queryConductItembyId(allConductitemMap.get(3).get(i-5-jiafennum-koufennum)).getConduct_name();
				 StringBuilder sb = new StringBuilder();
				 for (String s : conductName.split("")) {
						sb.append(s);
						sb.append("\r\n");
				 }
				  cell.setCellValue(sb.toString()); 
			}else if(i==3+jiafennum+koufennum+1+jishunum+1){
				String ss1="技术技能总分";
				StringBuilder sb = new StringBuilder();
				 for (String s : ss1.split("")) {
						sb.append(s);
						sb.append("\r\n");
				 }
				 cell.setCellValue(sb.toString()); 
			}
			cell.setCellStyle(cellStyle);
		}
		
		int[] colnum=new int[]{0,1,num-1};
		for(int i=0;i<colnum.length;i++){
			sheet.addMergedRegion(new Region((short)1,(short)colnum[i],(short)3,(short)colnum[i]));
		}
		int[] colnum1=new int[]{2,num-2,num-3,num-4};
		for(int i=0;i<colnum1.length;i++){
			sheet.addMergedRegion(new Region((short)2,(short)colnum1[i],(short)3,(short)colnum1[i]));
		}
		
		sheet.addMergedRegion(new Region((short)1,(short)2,(short)1,(short)(2+jiafennum+koufennum+2)));
		sheet.addMergedRegion(new Region((short)1,(short)(2+jiafennum+koufennum+2+1),(short)1,(short)(2+jiafennum+koufennum+2+1+jishunum)));
		
		sheet.addMergedRegion(new Region((short)2,(short)3,(short)2,(short)(3+jiafennum)));
		sheet.addMergedRegion(new Region((short)2,(short)(3+jiafennum+1),(short)2,(short)(3+jiafennum+1+koufennum)));
		sheet.addMergedRegion(new Region((short)2,(short)(3+jiafennum+1+koufennum+1),(short)2,(short)(3+jiafennum+1+koufennum+1+jishunum)));
		
		for(int i=0;i<conductList.size();i++){
			HSSFRow row=sheet.createRow(i+4);
			row.setHeight((short)500);
			Conduct c=conductList.get(i);
			HSSFCell cell0=row.createCell(0);
			cell0.setCellValue(c.getStudent().getStudentNum());
			cell0.setCellStyle(cellStyle);
			
			HSSFCell cell1=row.createCell(1);
			cell1.setCellValue(c.getStudent().getStudentName());
			cell1.setCellStyle(cellStyle);
			
			HSSFCell cell2=row.createCell(2);
			cell2.setCellValue(11);
			cell2.setCellStyle(cellStyle);
			
			for(int j=3;j<3+jiafennum;j++){
				List<Integer> list=allConductitemMap.get(1);
				HSSFCell cell=row.createCell(j);
				Map<Integer,Double> map=c.getJiafengScoreMap();
				if(map.containsKey(list.get(j-3))){
					cell.setCellValue(map.get(list.get(j-3)));
				}else{
					cell.setCellValue(0);
				}
				cell.setCellStyle(cellStyle);
			}
			
			HSSFCell cell3=row.createCell(3+jiafennum);
			cell3.setCellValue(c.getJiafengAllScore());
			cell3.setCellStyle(cellStyle);
			
			for(int j=4+jiafennum;j<4+jiafennum+koufennum;j++){
				List<Integer> list=allConductitemMap.get(2);
				HSSFCell cell=row.createCell(j);
				Map<Integer,Double> map=c.getKoufengScoreMap();
				if(map.containsKey(list.get(j-4-jiafennum))){
					cell.setCellValue(map.get(list.get(j-4-jiafennum)));
				}else{
					cell.setCellValue(0);
				}
				cell.setCellStyle(cellStyle);
			}
			
			HSSFCell cell4=row.createCell(4+jiafennum+koufennum);
			cell4.setCellValue(c.getKoufengAllScore());
			cell4.setCellStyle(cellStyle);
			
			for(int j=5+jiafennum+koufennum;j<5+jiafennum+koufennum+jishunum;j++){
				List<Integer> list=allConductitemMap.get(3);
				HSSFCell cell=row.createCell(j);
				Map<Integer,Double> map=c.getJishuScoreMap();
				if(map.containsKey(list.get(j-5-jiafennum-koufennum))){
					cell.setCellValue(map.get(list.get(j-5-jiafennum-koufennum)));
				}else{
					cell.setCellValue(0);
				}
				cell.setCellStyle(cellStyle);
			}
			
			HSSFCell cell5=row.createCell(5+jiafennum+koufennum+jishunum);
			cell5.setCellValue(c.getJishuAllScore());
			cell5.setCellStyle(cellStyle);
			
			Map<Integer,Double> m=c.getNotnextScoreMap();
			HSSFCell cell6=row.createCell(6+jiafennum+koufennum+jishunum);
			cell6.setCellValue(m.get(1));
			cell6.setCellStyle(cellStyle);
			
			HSSFCell cell7=row.createCell(7+jiafennum+koufennum+jishunum);
			cell7.setCellValue(m.get(2));
			cell7.setCellStyle(cellStyle);
			
			HSSFCell cell8=row.createCell(8+jiafennum+koufennum+jishunum);
			cell8.setCellValue(m.get(3));
			cell8.setCellStyle(cellStyle);
			
			HSSFCell cell9=row.createCell(9+jiafennum+koufennum+jishunum);
			cell9.setCellValue(c.getAllScore());
			cell9.setCellStyle(cellStyle);
		}
		return wb;
	}
}
