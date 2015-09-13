package cn.gdou.xsgz.admin.base.service;


import java.util.List;

import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.gdou.xsgz.admin.base.dao.MajorDao;
import cn.gdou.xsgz.domain.Major;

/**
 * @描述:处理major的逻辑业务
 * @author 刘楚燮
 * @modify 李楚富 2014-12-12 15:59:52
 * @modify 庄智堂 2015-04-27 19:28
 * @version:2014-9-19
 */
public class MajorService {
	private MajorDao dao = MajorDao.getMajorDaoInstance();
	private static ThreadLocal<MajorService> map = new ThreadLocal<MajorService>();
	
	private MajorService(){}
	public static MajorService getNajorServiceInstance(){
		MajorService instance = map.get();
		if(instance==null){
			instance = new MajorService();
			map.set(instance);
		}
		return instance;
	}
	
	public List<Major> listMajorByAcademyId(Integer academyId){
		return dao.listMajorByAcademyId(academyId);
	}
	
	public String add(Major major){
		int result = dao.add(major);
		if(result == 1)
			return "success";
		else
			return "添加专业信息失败！请稍后重试！";
	
	}
	
	public String update(Major major){
		int result = dao.update(major);
		if(result == 1)
			return "success";
		else
			return "更新专业信息失败！请稍后重试！";
	}
	
	public String delete(int major){
		int result = dao.delete(major);
		if(result == 1)
			return "success";
		else
			return "删除专业信息失败！请稍后重试！";
	}
	
	public Major queryMajorById(int majorId){
		return dao.queryMajorById(majorId);
	}
	
	/**
	 * 判断专业名称是否存在数据库中
	 * 如果存在,返回1，不存在返回0；
	 */
	public int isExistMajorName(String majorName){
		
		return dao.isExistMajorName(majorName);
	}
}
