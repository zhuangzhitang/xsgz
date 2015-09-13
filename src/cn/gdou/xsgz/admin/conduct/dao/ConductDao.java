package cn.gdou.xsgz.admin.conduct.dao;

import java.util.List;

import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.sun.org.apache.bcel.internal.generic.NEW;

import cn.gdou.xsgz.domain.Academy;
import cn.gdou.xsgz.domain.ConductHaveNext;
import cn.gdou.xsgz.domain.ConductNextScore;
import cn.gdou.xsgz.domain.ConductNotNextScore;
import cn.gdou.xsgz.domain.Conductitem;
import cn.gdou.xsgz.domain.Conductnotnext;
import cn.gdou.xsgz.domain.SchoolYear;
import cn.gdou.xsgz.util.DatabaseUtil;
import cn.gdou.xsgz.util.MyQueryRunner;

public class ConductDao {
    private MyQueryRunner runner=new MyQueryRunner(DatabaseUtil.getDataSource());
    		
	public List<ConductHaveNext> getSecondConduct(int firstId) {
		String sql="SELECT * FROM conducthavenext WHERE conduct_havenext LIKE ?";
		String s=null;
		if(firstId==0){
			s="思想道德素质%";
		}else if(firstId==1){
			s="社会实践能力%";
		}else{
			return null;
		}
		List<ConductHaveNext> nextList=runner.query(sql,new BeanListHandler<ConductHaveNext>(ConductHaveNext.class),s);
		for(ConductHaveNext c:nextList){
			String next=c.getConduct_havenext();
			c.setConduct_havenext(next.split("\\|")[1]);
		}
		return nextList;
	}

	public boolean ishaveYear(int year) {
		String sql="SELECT * FROM schoolyear WHERE schoolYear=?";
		int nextyear=year+1;
		List<SchoolYear> list=runner.query(sql,new BeanListHandler<SchoolYear>(SchoolYear.class),year+"-"+nextyear);
		if(list.size()==1){
			return true;
		}
		return false;
	}

	public void insertSchoolyear(int year) {
		int nextyear=year+1;
		String sql="INSERT INTO schoolyear(schoolYear) VALUES (?)";
		runner.update(sql,year+"-"+nextyear);
	}

	public List<SchoolYear> queryAllSchoolYear() {
		String sql="SELECT * FROM schoolyear";
		return runner.query(sql,new BeanListHandler<SchoolYear>(SchoolYear.class));
	}

	public int insertConduct(Conductitem conductitem) {
		String sql="INSERT INTO conductitem(conduct_name,conduct_superitem,schoolyear) VALUES (?,?,?)";
		return runner.update(sql,conductitem.getConduct_name(),conductitem.getConduct_superitem(),conductitem.getSchoolyear());
	}

	public List<Conductnotnext> queryConductNotNext() {
		String sql="SELECT * FROM conductnotnext";
		return runner.query(sql,new BeanListHandler<Conductnotnext>(Conductnotnext.class));
	}

	public List<Conductitem> queryConductItem(String schoolyear){
		String sql="SELECT * FROM conductitem WHERE schoolyear=?";
		List<Conductitem> conductItem=runner.query(sql,new BeanListHandler<Conductitem>(Conductitem.class),schoolyear);
		for(Conductitem c:conductItem){
			Integer superItem=c.getConduct_superitem();
			sql="SELECT * FROM conducthavenext WHERE id=?";
			c.setConductHaveNext(runner.query(sql, new BeanHandler<ConductHaveNext>(ConductHaveNext.class),superItem));
		}
		return conductItem;
	}

	public int insertConductNotNextScore(Integer item, String year,
			List<String> studentNumList, Double score) {
		String sql="INSERT INTO conduct_notnext_score(sid,c_notnext,score,schoolyear) VALUES (?,?,?,?)";
		int i=0;
		for(String num:studentNumList){
			ConductNotNextScore cnn=ishaveConductNotNextScore(num, year, item);
			if(cnn==null){
			  i=i+runner.update(sql,num,item,score,year);
			}else{
			  i=i+updateConductNotNextScore(cnn, score);
			}
		}
		return i;
	}

	public ConductNotNextScore ishaveConductNotNextScore(String num,String year,Integer item){
		String sql="SELECT * FROM conduct_notnext_score WHERE sid=? AND c_notnext=? AND schoolyear=?";
		return runner.query(sql,new BeanHandler<ConductNotNextScore>(ConductNotNextScore.class),num,item,year);
	}
	
	public int updateConductNotNextScore(ConductNotNextScore cnn,Double score){
		String sql="UPDATE conduct_notnext_score SET score=? WHERE id=?";
		return runner.update(sql,cnn.getScore()+score,cnn.getId());
	}
	
	public int insertConductItemScore(Integer item, String year,
			List<String> studentNumList, Double score) {
		String sql="INSERT INTO conduct_next_score(sid,c_item,score) VALUES (?,?,?)";
		int i=0;
		for(String num:studentNumList){
			ConductNextScore cns=ishaveConductNextScore(num, item);
			if(cns==null){
			  i=i+runner.update(sql,num,item,score);
			}else{
				i=i+updateConductNextScore(cns, score);
			}
		}
		return i;
	}
	
	public ConductNextScore ishaveConductNextScore(String num,Integer item){
		String sql="SELECT * FROM conduct_next_score WHERE sid=? AND c_item=?";
		return runner.query(sql,new BeanHandler<ConductNextScore>(ConductNextScore.class),num,item);
	}
	
	public int updateConductNextScore(ConductNextScore cnn,Double score){
		String sql="UPDATE conduct_next_score SET score=? WHERE id=?";
		return runner.update(sql,cnn.getScore()+score,cnn.getId());
	}

	public boolean isHaveConductItem(Conductitem conductitem) {
		String sql="SELECT * FROM conductitem WHERE conduct_name=? AND conduct_superitem=? AND schoolyear=?";
		Object[] o=runner.query(sql,new ArrayHandler(),conductitem.getConduct_name(),conductitem.getConduct_superitem(),conductitem.getSchoolyear());
		if(o==null||o.length==0){
			return false;
		}
		return true;
	}
}
