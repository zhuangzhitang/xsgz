<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <base href="${adminPath}">
    <title>【专业级管理员】学生信息维护</title>
    <link rel="stylesheet" type="text/css" href="../js/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../js/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../css/generic.css">
    <link rel="stylesheet" type="text/css" href="../css/studentInfo.css"/>
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
    <script  type="text/javascript" src="../js/studentInfo.js"></script>
    <script type="text/javascript">
	    var basePath = "${basePath}";
		var adminPath = "${adminPath}";
    </script>
</head>
<body>
  
	  <!-- 工具栏 -->
	
	 <div id="toolbar">
	 
	 	<span>
			<select class="easyui-combobox" name="dept" data-options="panelHeight:30" style="width:150px;">  
    			<option value="学生信息">学生信息</option>   
    		</select>
			 <a id="add_out" href="javascript:void(0)"  onclick="exportData()">导出</a>
		 </span>
		 
		 </br>
		  </br>
	     <span>
		    <form action="" id="myform" method="post" enctype="multipart/form-data">
				<select  class="easyui-combobox" name="uploadtype" data-options="panelHeight:50" style="width:150px;" required="true">    
	    			<option value="1">学生信息</option>   
	    			<option value="2">学生照片</option>   
				</select>
				<input id="file_in" type="file" name="uploadFile"  />
				<a href="javascript:void(0)"  id="add_in" onclick="upload()">导入</a>
			</form>
		 </span>  
		
       </br>     
        
    
             班级
         <input id="cbx_class" class="easyui-combobox" editable="false"
			missingMessage='请选择班级！' name="className" required="true"
			data-options="valueField:'className',textField:'className',
			url : 'base/class_getClasssByMajorId.gdou?majorId=1'
		" />  
   
   	   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	  
   	   （只针对姓名和学号） <input id="ss"class="easyui-searchbox"    data-options="prompt:'请填入信息'" >
    </div>
    
    
  
      <table id="dg_studentInfo" title="学生信息列表" class="easyui-datagrid" style="width:1150px;height:500px"
            toolbar="#toolbar" pagination="false"
            rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
            <tr>
            	<th field="ck" checkbox="true"></th>
                <th field="studentNum" width="30" >学号</th>
                <th field="studentName" width="30" >姓名</th>
               	<th field="className" width="30">班级名称</th>
                <th field="sex" width="30">性别</th>
                <th field="phoneNum" width="30">联系方式</th>
                <th field="dormitory" width="30">宿舍</th>
                <th field="qqNum" width="30">qq号</th>
                <th field="email" width="30">邮箱</th>
            </tr>            
        </thead>           
    </table>  
    
    
    
     <!-- 添加班级的弹出框 -->
     <div id="exportData_dlg" class="easyui-dialog" style="width:380px;height:200px;padding:10px 20px"
            closed="true" buttons="#exportData-dlg-buttons">
         <form id="exportData_fm" method="post" novalidate>
           <div class="ftitle">学生信息</div>
            
		    
			 <div class="fitem">
			    <label>选择班级：</label>
                <input id="cbx_class1" class="easyui-combobox" editable="false"
					missingMessage='请选择班级！' name="className" required="true"
					data-options="valueField:'className',textField:'className',
					url : 'base/class_getClasssByMajorId.gdou?majorId=1'
				" />  
			 </div>
         </form>
    </div>
    
    <!-- 导出学生信息的弹出框 的按钮-->
    <div id="exportData-dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="sureToexportData()">确定</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#exportData_dlg').dialog('close')">取消</a>
    </div>
</body>
</html>