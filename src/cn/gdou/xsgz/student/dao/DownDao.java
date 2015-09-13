package cn.gdou.xsgz.student.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.gdou.xsgz.domain.DownFile;
import cn.gdou.xsgz.domain.UpFile;
import cn.gdou.xsgz.util.DatabaseUtil;
import cn.gdou.xsgz.util.MyQueryRunner;

/**
 * 下载DAO: Student关于下载文件的数据库操作
 * 
 * @author 潘木坚
 * @version 2014-10-05
 */
public class DownDao {
	
	MyQueryRunner runner = new MyQueryRunner(DatabaseUtil.getDataSource());
	
	@SuppressWarnings("unchecked")
	public List<DownFile> getDownfileList() {	
		List<DownFile> list = new ArrayList<DownFile>();
		String sql = " SELECT * FROM downFile ";
		list = (List<DownFile>)runner.query(sql, new BeanListHandler(DownFile.class));
		
		return list;
	}

	/**
	 * @方法：isExistApplyType()
	 * @功能：判断是否已存在申请信息
	 * @param studentNum
	 * @param parseInt
	 * @return boolean
	 */
	public boolean isExistApplyType(String studentNum, int parseInt) {
		UpFile upfile = null;
		String sql = " SELECT * FROM upFile " +
				 " WHERE uploadStaff = ? AND applyType = ?";
		upfile = runner.query(sql, new BeanHandler<UpFile>(UpFile.class),
				studentNum, parseInt);
		if(upfile!=null)
			return true;
		return false;
	}

	/**
	 * @方法：getExistFileName()
	 * @功能：获取已存在申请文档的文档路径
	 * @param studentNum
	 * @param parseInt
	 * @return String
	 */
	public String getExistFileName(String studentNum, int parseInt) {
		UpFile upfile = null;
		String sql = " SELECT * FROM upFile " +
				 " WHERE uploadStaff = ? AND applyType = ?";
		upfile = runner.query(sql, new BeanHandler<UpFile>(UpFile.class),
				studentNum, parseInt);
		
		if(upfile!=null)
			return upfile.getFileUrl();
		return null;
	}

	/**
	 * @方法：addApplyToDB()
	 * @功能：提交申请文档，记录申请信息
	 * @param id
	 * @param applyWordFileName
	 * @param date
	 * @param newFileName
	 * @param studentNum
	 * @param parseInt
	 * @return boolean
	 */
	public boolean addApplyToDB(String id, String applyWordFileName, Date date,
			String newFileName, String studentNum, int parseInt) {
		String sql = " insert into upFile " +
				 " values(?,?,?,?,?,?)";
		int count = runner.update(sql, 
				id,applyWordFileName,date,newFileName,studentNum,parseInt);
		if(count!=0)
			return true;
		return false;
	}

	public boolean updateApplyInfo(String applyWordFileName, Date date,String studentNum,int applyType) {
		String sql = " update upFile " +
				 " set fileName=?, upTime=?" +
				 " where uploadStaff='"+studentNum+"' and applyType="+applyType;
		int count = runner.update(sql, applyWordFileName,date);
		if(count!=0)
			return true;
		return false;
	}

}
