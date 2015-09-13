package cn.gdou.xsgz.admin.conduct.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.gdou.xsgz.domain.Conductitem;
import cn.gdou.xsgz.util.DatabaseUtil;
import cn.gdou.xsgz.util.MyQueryRunner;

public class ConductDataOutputDao {
	private MyQueryRunner runner=new MyQueryRunner(DatabaseUtil.getDataSource());
	/**
	 * 1代表奖励加分项，2为减分项，3代表技术技能
	 * @param classId
	 * @param schoolyear
	 * @return
	 */
    public Map<Integer,List<Integer>> queryConductItemByClassIdAndYear(Integer classId,String schoolyear){
    	String sql="SELECT * FROM conductitem WHERE schoolyear=?";
    	List<Conductitem> conductitem=runner.query(sql,new BeanListHandler<Conductitem>(Conductitem.class),schoolyear);
    	List<Conductitem> deleteList=new ArrayList<Conductitem>();
    	for(Conductitem c:conductitem){
    		sql="SELECT COUNT(cns.id) FROM conduct_next_score cns LEFT JOIN student s ON cns.sid=s.studentNum WHERE cns.c_item=? AND s.classId=?";
    		Object[] o=runner.query(sql,new ArrayHandler(),c.getId(),classId);
    		if((Long)o[0]==0){
    			deleteList.add(c);
    		}
    	}
    	conductitem.removeAll(deleteList);
    	List<Integer> firstList=new ArrayList<Integer>();
    	List<Integer> secondList=new ArrayList<Integer>();
    	List<Integer> thirdList=new ArrayList<Integer>();
    	
    	for(Conductitem c:conductitem){
    		if(c.getConduct_superitem()==1){
    			firstList.add(c.getId());
    		}else if(c.getConduct_superitem()==2){
    			secondList.add(c.getId());
    		}else if(c.getConduct_superitem()==3){
    			thirdList.add(c.getId());
    		}
    	}
    	
    	Map<Integer,List<Integer>> map=new HashMap<Integer, List<Integer>>();
    	map.put(1,firstList);
    	map.put(2,secondList);
    	map.put(3,thirdList);
    	return map;
    }
    
	public Map<Integer, Double> queryNotNextScore(String studentNum,String schoolyear) {
	    /**
	     * key为1代表科技创新，2代表组织管理分，3特殊分
	     */
	    Map<Integer,Double> map=new HashMap<Integer, Double>();
	    map.put(1,queryNotNextScoreById(studentNum, schoolyear,1));
	    map.put(2,queryNotNextScoreById(studentNum, schoolyear,2));
	    map.put(3,queryNotNextScoreById(studentNum, schoolyear,3));
	    return map;
	}
	
	/**
	 * 专门为显示操行分和修改操行分量身打造的
	 * @param studentNum  学号
	 * @param schoolyear  学年
	 * @return    key为id值，value为成绩
	 */
	public Map<Integer, Double> queryNotNextScoreForShowConduct(String studentNum,String schoolyear) {
	     Map<Integer,Double> map=new HashMap<Integer, Double>();
	     map=queryNotNextScoreByIdForShowConduct(studentNum, schoolyear,1,map);
	     map=queryNotNextScoreByIdForShowConduct(studentNum, schoolyear,2,map);
	     map=queryNotNextScoreByIdForShowConduct(studentNum, schoolyear,3,map);
	     return map;
	}
	/**
	 * 专门为显示操行分和修改操行分量身打造的
	 * @param studentNum 
	 * @param schoolyear
	 * @param id
	 * @param map
	 * @return
	 */
	public Map<Integer, Double> queryNotNextScoreByIdForShowConduct(String studentNum,String schoolyear,int id,Map<Integer, Double> map){
		String sql="SELECT id,score FROM conduct_notnext_score WHERE sid=? AND schoolyear=? AND c_notnext=?";
		Object[] o=runner.query(sql,new ArrayHandler(),studentNum,schoolyear,id);
		if(o==null){
			return map;
		}
		map.put(0-(Integer)o[0],(Double)o[1]);
		return map;
	}
	
	public Double queryNotNextScoreById(String studentNum,String schoolyear,int id){
		String sql="SELECT score FROM conduct_notnext_score WHERE sid=? AND schoolyear=? AND c_notnext=?";
		Object[] o=runner.query(sql,new ArrayHandler(),studentNum,schoolyear,id);
		if(o==null){
			return 0.0;
		}
		return (Double)o[0];
	}
	public Map<Integer, Double> queryjiafengScore(String studentNum,
			String schoolyear) {
		return queryNextScoreById(studentNum, schoolyear,1);
	}
	
	public Map<Integer, Double> queryjiafengScoreForShowConduct(String studentNum,
			String schoolyear) {
		return queryNextScoreByIdForShowConduct(studentNum, schoolyear,1);
	}
	public Map<Integer, Double> querykoufengScore(String studentNum,
			String schoolyear) {
		return queryNextScoreById(studentNum, schoolyear,2);
	}
	
	public Map<Integer, Double> querykoufengScoreForShowConduct(String studentNum,
			String schoolyear) {
		return queryNextScoreByIdForShowConduct(studentNum, schoolyear,2);
	}
	
	public Map<Integer, Double> queryjishuScore(String studentNum,
			String schoolyear) {
		return queryNextScoreById(studentNum, schoolyear,3);
	}
    
	public Map<Integer, Double> queryjishuScoreForShowConduct(String studentNum,
			String schoolyear) {
		return queryNextScoreByIdForShowConduct(studentNum, schoolyear,3);
	}
	
	public Map<Integer, Double> queryNextScoreById(String studentNum,
			String schoolyear,Integer id){
		String sql="SELECT cns.c_item,cns.score FROM conduct_next_score cns LEFT JOIN conductitem c ON cns.c_item=c.id WHERE cns.sid=? AND c.schoolyear=? AND conduct_superitem=?";
		List<Object[]> list=runner.query(sql,new ArrayListHandler(),studentNum,schoolyear,id);
		Map<Integer,Double> map=new HashMap<Integer, Double>();
		for(Object[] o:list){
			Integer key=(Integer)o[0];
			Double value=(Double)o[1];
			map.put(key, value);
		}
		return map;
	}
	
	public Map<Integer, Double> queryNextScoreByIdForShowConduct(String studentNum,
			String schoolyear,Integer id){
		String sql="SELECT cns.id,cns.score FROM conduct_next_score cns LEFT JOIN conductitem c ON cns.c_item=c.id WHERE cns.sid=? AND c.schoolyear=? AND conduct_superitem=?";
		List<Object[]> list=runner.query(sql,new ArrayListHandler(),studentNum,schoolyear,id);
		Map<Integer,Double> map=new HashMap<Integer, Double>();
		for(Object[] o:list){
			Integer key=(Integer)o[0];
			Double value=(Double)o[1];
			map.put(key, value);
		}
		return map;
	}
	
	public Conductitem queryConductItembyId(Integer id){
		String sql="SELECT * FROM conductitem WHERE id=?";
		return runner.query(sql,new BeanHandler<Conductitem>(Conductitem.class),id);
	}
	
	public String queryConductNameById(Integer id){
		if(id<0){
			String sql="select c.conduct_nothavenext from conduct_notnext_score cns,conductnotnext c where cns.c_notnext=c.id and cns.id=?";
			return (String)runner.query(sql,new ArrayHandler(),0-id)[0];
		}else{
			String sql="SELECT c.conduct_name FROM conduct_next_score cns,conductitem c WHERE cns.c_item=c.id AND cns.id=?";
			return (String)runner.query(sql,new ArrayHandler(),id)[0];
			
		}
	}
	
	/**
	 * 更新操行分学分
	 * @param id
	 * @param score
	 * @return
	 */
	public int updateConductScoreById(Integer id,String score){
		String sql = null;
		if(id < 0){
			sql = "UPDATE conduct_notnext_score SET score=? WHERE id = ?; ";
			id = 0 -id;
		}else{
			sql = "UPDATE conduct_next_score SET score=? WHERE id = ?; ";
		}
		
		return runner.update(sql, score,id);
	}
	
}
