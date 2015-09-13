package cn.gdou.xsgz.admin.base.dao;

import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.gdou.xsgz.domain.Academy;
import cn.gdou.xsgz.util.DatabaseUtil;
import cn.gdou.xsgz.util.MyQueryRunner;

/**
 * 学院DAO: Academy的一系列数据库操作
 * 
 * @author 李楚富
 * @version 2014-08-27
 */
public class AcademyDao {
    MyQueryRunner runner = new MyQueryRunner(DatabaseUtil.getDataSource());
    
    /**
     * 分页获取学院数据
     * @param startRow 开始行
     * @param pageRows 一页显示的数据量
     * @return Academy的List列表
     */
    public  List<Academy> getAcademyByPaging(int startRow, int pageRows){
        String sql = "SELECT * FROM academy LIMIT ?,?";
        List<Academy> list = runner.query(sql, 
                new BeanListHandler<Academy>(Academy.class), startRow, pageRows);
        return list;
    }
    
    /**
     * 查询学院总数
     * @return 整数
     */
    public  int getAcademyCount(){
        String sql = "SELECT COUNT(*) FROM academy";
        String result =  runner.query( sql, new ScalarHandler()).toString();
        return Integer.parseInt(result);
    }
    
    /**
     * 添加学院信息
     * @param academy 学院实体
     * @return 受影响行数
     */
    public int add(Academy academy){
        String sql = " INSERT INTO academy" +
        		     " (academyName, shortName, dean, tel, email, address)" +
        		     " VALUES(?, ?, ?, ?, ?, ?)";
        int result =  runner.update( sql, 
                academy.getAcademyName(), academy.getShortName(), academy.getDean(),
                academy.getTel(), academy.getEmail(), academy.getAddress());        
        
        return result;
    }
    
    /**
     * 更新学院信息
     * @param academy 学院实体
     * @return 受影响行数
     */
    public int update(Academy academy){
        String sql = " UPDATE academy SET " +
        		     " academyName=?, shortName=?, dean=?, tel=?," +
        		     " email=?, address=? WHERE academyID = ?";
        int result = runner.update(sql, 
                academy.getAcademyName(), academy.getShortName(), academy.getDean(), 
                academy.getTel(), academy.getEmail(), academy.getAddress(), academy.getAcademyId());   
        
        return result;
    }
    
    /**
     * 删除学院
     * @param academyID 学院Id
     * @return 受影响行数
     */
    public int delete(int academyId){
        String sql = "DELETE FROM academy WHERE academyId = ?";
        
        return runner.update(sql, academyId);
    }
    
	/**
	 * 查询所有学院（用于下拉框）
	 * @return List<Map<String, Object>>
	 */
	public List<Academy> queryAllAcademys( ) {	
		String sql = "SELECT academyId, academyName FROM academy";
        List<Academy> list = runner.query(sql, 
                new BeanListHandler<Academy>(Academy.class));
		
		return list;
	}
	public Academy queryAcademyById(Integer academyId){
		String sql = "SELECT * FROM academy WHERE academyId=?";
		return runner.query(sql, new BeanHandler<Academy>(Academy.class),academyId);
	}
	
	/**
	 * 判断学院名称是否存在数据库中
	 * 如果存在,返回1，不存在返回0；
	 */
	public int isExistacademyName(String academyName){
		String sql = "select academyName from academy Where academyName=? LIMIT 0,1";
		Object result = runner.query(sql,new ScalarHandler(), academyName);
		  if(result==null){
		    	return 0;
		    }
		return 1;
	}
}
