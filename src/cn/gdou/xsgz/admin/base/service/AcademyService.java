package cn.gdou.xsgz.admin.base.service;

import java.util.List;

import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.sun.org.apache.regexp.internal.recompile;

import cn.gdou.xsgz.admin.base.dao.AcademyDao;
import cn.gdou.xsgz.domain.Academy;

/**
 * 学院Service: 处理Academy的逻辑业务
 * 
 * @author 李楚富
 * @version 2014-08-27
 */
public class AcademyService {
    private AcademyDao dao = new AcademyDao();
    
    /**
     * 分页获取学院数据
     * @param startRow 开始行
     * @param pageRows 一页显示的数据量
     * @return Academy的List列表
     */
    public  List<Academy> getAcademyByPaging(int startRow, int pageRows){
        return dao.getAcademyByPaging(startRow, pageRows);
    }
    /**
     * 查询学院总数
     * @return 整数
     */
    public  int getAcademyCount(){
        
        return dao.getAcademyCount();
    }
    
    /**
     * 添加学院信息
     * @param academy 学院实体
     * @return true or false
     */
    public boolean add(Academy academy){
        int result = dao.add(academy);
        
        return result==1 ? true : false;
    }
    
    /**
     * 更新学院信息
     * @param academy 学院实体
     * @return true or false
     */
    public boolean update(Academy academy){
        int result = dao.update(academy);
        
        return result==1 ? true : false;
    }
    
    /**
     * 删除学院
     * @param academy 学院实体
     * @return true or false
     */
    public boolean delete(int academyId){
        int result = dao.delete(academyId);     
        
        return result==1 ? true : false;
    }

	public List<Academy> queryAllAcademys( ) {	
		return dao.queryAllAcademys();
	}
	
	/**
	 * 判断学院名称是否存在数据库中
	 * 如果存在,返回1，不存在返回0；
	 */
	public int isExistacademyName(String academyName){
		
		return dao.isExistacademyName(academyName);
	}
}
