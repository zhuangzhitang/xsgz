package cn.gdou.xsgz.util;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.util.CellRangeAddress;

import cn.gdou.xsgz.domain.Student;
import cn.gdou.xsgz.domain.StudentGradeExcel;


public class ScoreInputUtil {
	public static HSSFSheet getSheet(File file){
		HSSFSheet st=null;
		try {
			BufferedInputStream in=new BufferedInputStream(new FileInputStream(file));
			POIFSFileSystem fs=new POIFSFileSystem(in);
			HSSFWorkbook wb=new HSSFWorkbook(fs);
			st=wb.getSheetAt(0);	
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return st;
	}
	/**
	 * 
	 * @param sheet
	 * @return  成绩表格的标题
	 */
	public static String getTitle(HSSFSheet sheet){
		HSSFRow row=sheet.getRow(0);
		if(row!=null){
		   return row.getCell(0).getStringCellValue().trim();
		}
		return null;
	}
	/**
	 * 
	 * @param map
	 * @param sheet
	 * @param termNumList 
	 * @return  每个学期的科目列表
	 */
	public static Map<Integer,List<String>> getSubjectNameEveryTerm(HSSFSheet sheet, List<Object> termNumList){
		Map<Integer,String> map=ScoreInputUtil.getsubject(sheet);
		HSSFRow row=sheet.getRow(2);
		Map<Integer,List<String>> subMap=new TreeMap<Integer, List<String>>();
		for(Integer key:map.keySet()){
			String value=map.get(key);
			String[] ss=value.split("\\-");
			subMap.put(key,ScoreInputUtil.getsubjectName(Integer.parseInt(ss[0]),Integer.parseInt(ss[1]),row));
		}
		for(Object o:termNumList){
			o=(Integer)o;
			if(subMap.containsKey(o)){
				subMap.remove(o);
			}
		}
		return subMap;
	}
	public static List<String> getsubjectName(int first,int last,HSSFRow row){
		List<String> listString=new ArrayList<String>();
		for(int i=first;i<=last;i++){
			listString.add(row.getCell(i).getStringCellValue());
		}
		return listString;
	}

   public static Map<Integer,String> getsubject(HSSFSheet sheet){
            Map<Integer,String> map=new TreeMap<Integer,String>();
    		int sheetmergerCount=sheet.getNumMergedRegions();
			for(int j=0;j<sheetmergerCount;j++){
				CellRangeAddress ca=(CellRangeAddress)sheet.getMergedRegion(j);
			    if(ca.getFirstRow()==1&&ca.getLastRow()==1){
					 int firstColumn=ca.getFirstColumn();
					 int lastColumn=ca.getLastColumn();
					 Pattern p=Pattern.compile("[0-9]{1}");
					 Matcher m=p.matcher(sheet.getRow(1).getCell(firstColumn).getStringCellValue());
					 while(m.find()){
						 map.put(Integer.parseInt(m.group()),firstColumn+"-"+lastColumn);
					 }
				}
			}
			return map;
      } 
   /**
    * 获取excel表格所有人的成绩以及对应的科目。
    * @param sheet
 * @param termNumList 
    * @return
    */
   public static List<StudentGradeExcel> getAllStudentGrade(HSSFSheet sheet, List<Object> termNumList){
	   List<StudentGradeExcel> studentGradeExcelList=new ArrayList<StudentGradeExcel>();
	   //暂时按照表格的格式，这么设定扫描的规则   Map<Integer,Map<String,String>>
	   for(int rowIndex=3;rowIndex<=sheet.getLastRowNum()-1;rowIndex++){
		   StudentGradeExcel studentGradeExcel=new StudentGradeExcel();
		   Map<Integer,Map<String,String>> grademap=new HashMap<Integer, Map<String,String>>();
		   HSSFRow row=sheet.getRow(rowIndex);
		   if(row==null){
			   continue;
		   }
		   String xuehao=row.getCell(1).getStringCellValue();
		   String name=row.getCell(2).getStringCellValue();
		   Student student=new Student();
		   student.setStudentNum(xuehao);
		   student.setStudentName(name);
		   studentGradeExcel.setStudent(student);
		   Map<Integer,String> fromto=ScoreInputUtil.getsubject(sheet);
		   Map<Integer,List<String>> subject=ScoreInputUtil.getSubjectNameEveryTerm(sheet,termNumList);
		   Map<Integer,List<String>> grade=new HashMap<Integer, List<String>>();
		   for(Integer from:fromto.keySet()){
			   String value=fromto.get(from);
			   String[] ss=value.split("\\-");
			   List<String> gradeList=new ArrayList<String>();
			   for(int fromColumn=Integer.parseInt(ss[0]);fromColumn<=Integer.parseInt(ss[1]);fromColumn++){
				    gradeList.add(row.getCell(fromColumn).getStringCellValue());
			   }
			   grade.put(from,gradeList);
		   }
		    for(Integer xueqi:subject.keySet()){
		    	List<String> listSubject=subject.get(xueqi);
		    	List<String> listgrade=grade.get(xueqi);
		    	Map<String,String> subjectgrade=new HashMap<String, String>();
		    	for(int j=0;j<=listSubject.size()-1;j++){
		    		if(!listgrade.get(j).equals("")){
		    		  subjectgrade.put(listSubject.get(j),listgrade.get(j));
		    		}
		    	}
		    	grademap.put(xueqi,subjectgrade);
		    }
		    studentGradeExcel.setGrade(grademap);
		    studentGradeExcelList.add(studentGradeExcel);
	   }
	   return studentGradeExcelList;
   }
   
   /*
   public static void main(String[] args) throws Exception{
		File file=new File("D://计科1122.xls");
		BufferedInputStream in=new BufferedInputStream(new FileInputStream(file));
		POIFSFileSystem fs=new POIFSFileSystem(in);
		HSSFWorkbook wb=new HSSFWorkbook(fs);
		int num=wb.getNumberOfSheets();
		System.out.println(num);
			HSSFSheet st=wb.getSheetAt(1);
			System.out.println(st);
			if(st!=null){
				System.out.println(ScoreInputUtil.getTitle(st));
				System.out.println(ScoreInputUtil.getSubjectNameEveryTerm(st));
				 for(StudentGradeExcel s:ScoreInputUtil.getAllStudentGrade(st)){
					 System.out.println(s.getStudent().getStudentName()+s.getGrade());
				 }
			}
			
		}
		*/
	}
	

