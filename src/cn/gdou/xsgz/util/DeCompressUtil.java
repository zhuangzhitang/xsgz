package cn.gdou.xsgz.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.Expand;

import de.innosystec.unrar.Archive;
import de.innosystec.unrar.rarfile.FileHeader;

public class DeCompressUtil {
	/**
	 * 解压zip格式压缩包
	 * 对应的是ant.jar
	 */
	private static void unzip(File file ,String destDir){
		Project p = new Project();
		Expand expand = new Expand();
		expand.setProject(p);
		expand.setSrc(file);
		expand.setOverwrite(false);
		expand.setDest(new File(destDir));
		/*
		 * ant 下的zip工具默认压缩编码为utf-8
		 * 而 winRaR软件压缩是用的window默认的GBK或者GBK2313
		 * 所以解压时要制定编码格式
		 */
		expand.setEncoding("gbk");
		expand.execute();
		
	}
	/**
	 * 解压rar格式压缩包
	 * 对应的是java-unrar-0.3.jar但是java-unrar0.3.jar又会
	 * 用到commons-logining-1.11.jar
	 * @throws Exception 
	 * 
	 */
	private static void unrar(String sourceRar,String destDir) throws Exception{
		Archive a = null;
		FileOutputStream fos = null;
		try{
			a = new Archive(new File(sourceRar));
			FileHeader fh = a.nextFileHeader();
			List<String> path = new ArrayList<String>();//存放路径
			while(fh !=null){
				if(!fh.isDirectory()){
					//1.根据不同的操作系统拿到相应的destDireName和destFileName
					String compressFileName = fh.getFileNameString().trim();
					String destFileName = "";
					String destDirName = "";
					//非window系统
					if(File.separator.equals("/")){
					      destFileName = destDir + compressFileName.replaceAll("\\\\", "/");   
	                       destDirName = destFileName.substring(0, destFileName.lastIndexOf("/"));   
					}
					   //windows系统    
		             else{   
		            	destFileName = destDir + compressFileName.replaceAll("/", "\\\\");   
		                destDirName = destFileName.substring(0, destFileName.lastIndexOf("\\"));   
		            }   
					
					//2创建文件夹   
		            File dir = new File(destFileName);   
		            if(!dir.exists()||!dir.isDirectory()){   
		                dir.mkdirs();   
		            }   
		            path.add(destFileName);//添加路径
		            //3解压缩文件   
		            fos = new FileOutputStream(new File(destFileName));   
		            a.extractFile(fh, fos);   
		            fos.close();   
		            fos = null;   
				}
				 fh = a.nextFileHeader();   
			}
		
			 a.close();   
			    a = null; 
		}catch(Exception e){   
		    throw e;   
		}finally{   
		    if(fos!=null){   
		        try{fos.close();fos=null;}catch(Exception e){e.printStackTrace();}   
		    }   
		    if(a!=null){   
		        try{a.close();a=null;}catch(Exception e){e.printStackTrace();}   
		    }   
		}   
       
    }   
     
	  /**  
	    * 解压缩  
	    */  
	   public static void deCompress(String path,File file,String destDir) throws Exception{   
		   System.out.println("-------decompresss----------");
		  
		   
	       //保证文件夹路径最后是"/"或者"\"   
	       char lastChar = destDir.charAt(destDir.length()-1);   
	       if(lastChar!='/'&&lastChar!='\\'){   
	           destDir += File.separator;   
	       }   
	       //根据类型，进行相应的解压缩   
	       String type = path.substring(path.lastIndexOf(".")+1);   
	      
	       if(type.equals("zip")){   
	           DeCompressUtil.unzip(file, destDir);   
	        }else if(type.equals("rar")){   
	            DeCompressUtil.unrar(path, destDir);   
	        }else{   
	            throw new Exception("只支持zip和rar格式的压缩包！");   
	        }   
	    }  
	   
	public static List<String> getNames(File file) throws Exception{
		 ZipInputStream zin = new ZipInputStream(new FileInputStream(file));
		 ZipEntry entry ;
		 List<String> names = new ArrayList<String>();
		 while ((entry = zin.getNextEntry())!=null){
			 String name = entry.getName();
			 names.add(name);
			 zin.closeEntry();
		 }
		 zin.close();
		 return names;
	}
	public static void main(String[] args) throws Exception {
		File  file = new File("c://123.zip");
		//DeCompressUtil.deCompress(file, "c://abc");
		//DeCompressUtil.deCompress("c://123.zip", "c://abc");
	
	}
}
 

