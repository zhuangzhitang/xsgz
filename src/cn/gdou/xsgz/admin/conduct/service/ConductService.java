package cn.gdou.xsgz.admin.conduct.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import cn.gdou.xsgz.admin.base.dao.AcademyDao;
import cn.gdou.xsgz.admin.base.dao.ClassDao;
import cn.gdou.xsgz.admin.base.dao.MajorDao;
import cn.gdou.xsgz.admin.conduct.dao.ConductDao;
import cn.gdou.xsgz.domain.Academy;
import cn.gdou.xsgz.domain.Admin;
import cn.gdou.xsgz.domain.ComboBoxConduct;
import cn.gdou.xsgz.domain.ConductHaveNext;
import cn.gdou.xsgz.domain.Conductitem;
import cn.gdou.xsgz.domain.Conductnotnext;
import cn.gdou.xsgz.domain.Major;
import cn.gdou.xsgz.domain.SchoolYear;
import cn.gdou.xsgz.student.dao.StudentDao;

public class ConductService {
  private ConductDao dao=new ConductDao();
  private AcademyDao academyDao=new AcademyDao();
  private MajorDao majorDao=MajorDao.getMajorDaoInstance();
  private ClassDao classDao=ClassDao.getClassDaoInstance();
  private StudentDao studentDao=new StudentDao();
   public JSONArray getSecondConduct(int firstId){
	   List<ConductHaveNext> nextList=dao.getSecondConduct(firstId);
	   return JSONArray.fromObject(nextList);
   }
	public JSONArray getSchoolyear() {
		Calendar cal=Calendar.getInstance();
		int year=cal.get(Calendar.YEAR);
        if(!dao.ishaveYear(year)){
            dao.insertSchoolyear(year);
        }
        List<SchoolYear> allSchoolyear=dao.queryAllSchoolYear();
        return JSONArray.fromObject(allSchoolyear);
	}
	public JSONObject insertConduct(Conductitem conductitem) {
		boolean b=dao.isHaveConductItem(conductitem);
		JSONObject jsonObject=new JSONObject();
		if(!b){
			int i=dao.insertConduct(conductitem);
			if(i>0){
				jsonObject.put("message","添加操行分项成功");
			}else{
				jsonObject.put("message","添加操行分项失败");
			}
		}else{
			jsonObject.put("message","不能添加相同的操行分项");
		}
		return jsonObject;
	}
	/**
	 * 根据当前的用户，获取到该用户权限范围内的学院
	 * @param admin  当前用户
	 * @return
	 */
	public JSONArray getAcademy(Admin admin) {
		if(admin.getRoleId()==0){   //系统管理员
			List<Academy> academyList=academyDao.queryAllAcademys();
			return JSONArray.fromObject(academyList);
		}else if(admin.getRoleId()==1){  //院级管理员 
			Academy a=academyDao.queryAcademyById(admin.getSubjectId());
	System.out.println(a.getAcademyName());
			return JSONArray.fromObject(a);
		}else if(admin.getRoleId()==2){    //专业管理员
			Major major=majorDao.queryMajorById(admin.getSubjectId());
			Academy a=academyDao.queryAcademyById(major.getAcademyId());
			return JSONArray.fromObject(a);
		}else{                              //学生管理员
			Academy a=academyDao.queryAcademyById(admin.getSubjectId());
			return JSONArray.fromObject(a);
		}
	}
	/**
	 * 根据当前用户以及用户所选择的学院，获得其权限范围内的专业
	 * @param admin 当前用户
	 * @param academyId  学院id
	 * @return
	 */
	public JSONArray getMajor(Admin admin, Integer academyId) {
		if(admin.getRoleId()==2){   //专业管理员
			Major major=majorDao.queryMajorById(admin.getSubjectId());
			return JSONArray.fromObject(major);
		}else {                    //其他管理员 
			List<Major> majorList=majorDao.listMajorByAcademyId(academyId);
			return JSONArray.fromObject(majorList);
		}
	}
	/**
	 * 根据专业Id,获取该专业的所有班级
	 * @param majorId 专业Id
	 * @return
	 */
	public JSONArray getClassWithMajor(Integer majorId) {
		return JSONArray.fromObject(classDao.listClassByMajorId(majorId));
		
	}
	
	public JSONArray getStudent(Integer classId) {
		JsonConfig jsonfig=new JsonConfig();
		jsonfig.setExcludes(new String[]{"birth"});
		return JSONArray.fromObject(studentDao.getStudentsByClassId(classId),jsonfig);
	}
	
	public JSONArray getConductItem(String schoolyear) {
	    List<Conductnotnext> conductNotNextList=dao.queryConductNotNext();
	    List<Conductitem>   conductItemList=dao.queryConductItem(schoolyear);
	    List<ComboBoxConduct> comboBoxConductList=new ArrayList<ComboBoxConduct>();
	    for(Conductnotnext c:conductNotNextList){
	    	 ComboBoxConduct com=new ComboBoxConduct(c.getId(),c.getConduct_nothavenext().split("\\|")[1]);
	    	 comboBoxConductList.add(com);
	    }
	    for(Conductitem c:conductItemList){
	    	 ComboBoxConduct com=new ComboBoxConduct(0-c.getId(),c.getConduct_name());
	    	 comboBoxConductList.add(com);
	    }
	    return JSONArray.fromObject(comboBoxConductList);
	}
	
	public int insertConductNotNextScore(Integer item, String year,
			List<String> studentNumList, Double score) {
		
		return dao.insertConductNotNextScore(item,year,studentNumList,score);
	}
	
	public int insertConductItemScore(Integer item, String year,
			List<String> studentNumList, Double score) {
		return dao.insertConductItemScore(item,year,studentNumList,score);
	}
	 
	
}



