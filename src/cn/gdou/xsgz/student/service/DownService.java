package cn.gdou.xsgz.student.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import cn.gdou.xsgz.domain.DownFile;
import cn.gdou.xsgz.student.dao.DownDao;

/**
 * 下载Service: 处理Student的下载业务
 * 
 * @author 潘木坚
 * @version 2014-10-05
 */
public class DownService {
	private DownDao dao = new DownDao();
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> getDownfileList(Integer start, Integer limit) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> listTemp = new ArrayList<Map<String, Object>>();
		
		getDownfileList(list,start);
		
		Map<String, Object> map = new HashMap<String, Object>();
		int size = list.size();
		size -= 1; //list最后一条数据的下标
		limit = start + limit - 1; //前台要显示的最后一条数据的下标
		if (!(start > size)) { //要选出的数据没有全部超界
			if (start == size) { //要选出的第一条数据刚好是list中的最后一条
				limit = start;
			} else if ((start < size) && (limit > size)) { //要选出的数据和list发生交叉
				limit = size;
			}
			limit += 1; //因为subList是选出start下标到limit-1下标，而上面的limit是真实的下标，所以这里要-1
			listTemp = list.subList(start, limit);
		}
		map.put("rows", JSONArray.fromObject(listTemp));
		map.put("total", list.size());
		//dataTable用来生成的信息
		//实际行数
		map.put("iTotalRecords", list.size());
		//过滤后的行数
		map.put("iTotalDisplayRecords", list.size());
		map.put("aaData", JSONArray.fromObject(listTemp));
		return JSONObject.fromObject(map);
	}

	public void getDownfileList(
			List<Map<String, Object>> list,Integer start){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<DownFile> listFile = new ArrayList<DownFile>();
		try {
			listFile = dao.getDownfileList();
		} catch (Exception e) {
			e.printStackTrace();
			map.put("status", -1);
			map.put("error", "获取文档列表信息出错！");
			return ;
		}
		for(DownFile f:listFile){
			list.add(map_Downfile(f,++start));
		}
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> map_Downfile(
			DownFile f, Integer start) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("number", start);
		map.put("wordName", f.getFileName());
		map.put("wordDownUrl", f.getFileUrl());
			
		return JSONObject.fromObject(map);
	}
//	public boolean addApplyToDB(String applyWordFileName,
//			Date date,String newFileName, String studentNum, int parseInt) {
//		return dao.addApplyToDB(IDGenerate.getId(),applyWordFileName,
//				date,newFileName,studentNum,parseInt);
//	}
//
//	public boolean updateApplyInfo(String applyWordFileName, Date date,String studentNum,int applyType) {
//		return dao.updateApplyInfo(applyWordFileName,date,studentNum,applyType);
//	}

}
