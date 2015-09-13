package cn.gdou.xsgz.admin.base;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import cn.gdou.xsgz.admin.base.service.AcademyService;
import cn.gdou.xsgz.domain.Academy;
import cn.gdou.xsgz.util.GenericUtil;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import flexjson.JSONSerializer;

/**
 * 学院Action: 处理关于Academy的请求
 * 
 * @author 李楚富
 * @version 2014-08-27
 */
@SuppressWarnings("serial")
public class AcademyAction extends ActionSupport  implements ModelDriven<Academy> {
    private AcademyService service = new AcademyService();

    private Academy academy = new Academy();
    public Academy getModel() {
        return academy;
    }
    
    /**
     * 分页提取学院信息（用于显示学院的整体信息）
     * @throws Exception 
     */
    public String queryByPage() throws Exception {
        HttpServletRequest req = ServletActionContext.getRequest();
        
        //得到当前页和每页显示的条数
        int page =Integer.parseInt(req.getParameter("page"));
        int rows = Integer.parseInt(req.getParameter("rows"));
        
        int startRow = (page-1) * rows;
        
        List<Academy> list = service.getAcademyByPaging(startRow, rows);  
        // 将结果集放到json中， 格式：
        // {"rows":[{"academyId":1,"academyName":"信息学院"},{"academyId":2,"academyName":"信息学院"}],"total":19}
        JSONObject json = new JSONObject();
        
        JSONSerializer jsonRows = new JSONSerializer();
        String  jsonStr =jsonRows.serialize(list);        
        json.put("rows",jsonStr); 
        json.put("total",service.getAcademyCount());
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        out.print(json);
        out.close();
        
        return null;
    }
    
    /**
     * 新增学院
     */
    public String add() throws Exception {        
        JSONObject json = new JSONObject();
        int i = service.isExistacademyName(academy.getAcademyName());
        if(i==1){//学院已经存在
		    json = GenericUtil.getOperateJSONObject("1", "学院已经存在");
			printJson(json);
			return null;
		}
        if(service.add(academy)){
            json.put("success", "新增成功！");
        }else{
            json.put("errorMsg", "新增失败！");
        }
        
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        out.print(json);
        out.close();
        
        return null;
    }   
    
    /**
     * 修改学院
     */
    public String update() throws Exception {        
        JSONObject json = new JSONObject();
        int i = service.isExistacademyName(academy.getAcademyName());
        if(i==1){//学院已经存在
		    json = GenericUtil.getOperateJSONObject("1", "学院名称已经存在");
			printJson(json);
			return null;
		}
        if(service.update(academy)){
            json.put("success", "修改成功！");
        }else{
            json.put("errorMsg", "修改失败！");
        }
        
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        out.print(json);
        out.close();
        
        return null;
    }
    
    /**
     * 删除学院
     */
    public String delete() throws Exception {        
        JSONObject json = new JSONObject();
        String id = ServletActionContext.getRequest().getParameter("academyId");
        int academyId = 0;
        if(null != id)
        	academyId = Integer.parseInt(id);
        
        if(service.delete(academyId)){
            json.put("success", "删除成功！");
        }else{
            json.put("errorMsg", "删除失败！");
        }
        
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        out.print(json);
        out.close();
        
        return null;
    }

	/**
	 * 查询所有学院（用于下拉框）
	 */
	public void getAllAcademys() throws IOException{
		List<Academy> list = service.queryAllAcademys();
		
		JSONSerializer jsonRows = new JSONSerializer();
        String  jsonStr =jsonRows.serialize(list);   
		
		PrintWriter out = ServletActionContext.getResponse().getWriter();
        out.print(jsonStr);
        out.close();
	}
	/**
	 * 输出json
	 * @param json
	 * @author 庄智堂
	 */
	private void printJson(JSONObject json) throws IOException{
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		out.print(json);
		out.close();
	}
}
