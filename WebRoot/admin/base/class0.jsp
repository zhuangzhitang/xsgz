<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <base href="${adminPath}">
    <title>超级管理员班级信息维护</title>
    <link rel="stylesheet" type="text/css" href="../js/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../js/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../css/generic.css">
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../js/class0.js"></script>
    
    <script type="text/javascript">
	    var basePath = "${basePath}";
		var adminPath = "${adminPath}";
    </script>
</head>
<body>
     <!-- 工具栏 -->
	<div id="toolbar">
		 <label>1、先选学院：</label>
               <input  class="easyui-combobox" name="academyId"
                   editable="false" missingMessage='请选择学院！' required="true"
                   data-options="valueField: 'academyId', textField: 'academyName',   
			        url: 'base/academy_getAllAcademys.gdou',
			        onSelect: function(rec){   
			            var url = 'base/major_getMajorsByAcademyId.gdou?academyId='+rec.academyId;  
			            $('#cbx_major').combobox('clear');    
			            $('#cbx_major').combobox('reload', url);   
		        }" />
	          <label>2、再选专业：</label>
			<input id="cbx_major" class="easyui-combobox" editable="false"
			missingMessage='请选择专业！' name="majorId" required="true"
			data-options="valueField:'majorId',textField:'majorName'" />  
    	<br/>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addClass()">新增班级</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editClass()">编辑班级</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyClass()">移除班级</a>
    </div>
    
    
    <!-- 班级信息列表 -->
      <table id="dg_class" title="专业信息" class="easyui-datagrid" style="width:1150px;height:500px"
            url="base/class_getClasssByMajorId.gdou?majorId=1" 
            toolbar="#toolbar" pagination="false"
            rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
            <tr>
            	<th field="ck" checkbox="true"></th>
                <th field="classId" width="30" hidden="true">班级ID</th>
                <th field="majorId" width="30" hidden="true">专业ID</th>
               	<th field="className" width="30">班级名称</th>
                <th field="grade" width="30">年级</th>
                <th field="classTeacher" width="35">班主任</th>
                <th field="teacherTel" width="30">联系方式</th>
                <th field="monitor" width="30">班长</th>
                <th field="monitor_connection" width="30">联系方式</th>
            </tr>            
        </thead>           
    </table>
    
    
    <!-- 添加班级的弹出框 -->
     <div id="addclass_dlg" class="easyui-dialog" style="width:380px;height:380px;padding:10px 20px"
            closed="true" buttons="#addclass-dlg-buttons">
         <form id="addclass_fm" method="post" novalidate>
           <div class="ftitle">班级信息</div>
            <div class="fitem">
         	<label>1、先选学院：</label>
               <input  class="easyui-combobox" name="academyId"
                   editable="false" missingMessage='请选择学院！' required="true"
                   data-options="valueField: 'academyId', textField: 'academyName',   
			        url: 'base/academy_getAllAcademys.gdou',
			        onSelect: function(rec){   
			            var url = 'base/major_getMajorsByAcademyId.gdou?academyId='+rec.academyId;  
			            $('#cbx_major1').combobox('clear');    
			            $('#cbx_major1').combobox('reload', url);   
		        }" />
		      </div>
		      <div class="fitem">
		          <label>2、再选专业：</label>
				  <input id="cbx_major1" class="easyui-combobox" editable="false"
					missingMessage='请选择专业！' name="majorId" required="true"
					data-options="valueField:'majorId',textField:'majorName'" />  
			 </div>
			 <div class="fitem">
			    <label>班级名称:</label>
                <input name="className" class="easyui-validatebox" required="true">
			 </div>
			 <div class="fitem">
			    <label>年级(2015):</label>
                <input name="grade" class="easyui-validatebox" required="true">
			 </div>
			  <div class="fitem">
			    <label>班主任:</label>
                <input name="classTeacher" class="easyui-validatebox" required="true">
			 </div>
			  <div class="fitem">
			    <label>联系方式:</label>
                <input name="teacherTel" class="easyui-validatebox" required="true">
			 </div>
			  <div class="fitem">
			    <label>班长:</label>
                <input name="monitor" class="easyui-validatebox" required="true">
			 </div>
			 <div class="fitem">
			    <label>联系方式:</label>
                <input name="monitor_connection" class="easyui-validatebox" required="true">
			 </div>
         </form>
    </div>
    
    <!-- 添加班级的弹出框 的按钮-->
    <div id="addclass-dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveClass()">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#addclass_dlg').dialog('close')">取消</a>
    </div>
    
     <!-- 编辑班级的弹出框 -->
     <div id="editclass_dlg" class="easyui-dialog" style="width:380px;height:320px;padding:10px 20px"
            closed="true" buttons="#editclass-dlg-buttons">
         <form id="editclass_fm" method="post" novalidate>
           <div class="ftitle">班级信息</div>
			 <div class="fitem">
			    <label>班级名称:</label>
                <input name="className" class="easyui-validatebox" style="border:none;background:#fff;" required="true">
			 </div>
			 <div class="fitem">
			    <label>年级(2015):</label>
                <input name="grade" class="easyui-validatebox" required="true">
			 </div>
			  <div class="fitem">
			    <label>班主任:</label>
                <input name="classTeacher" class="easyui-validatebox" required="true">
			 </div>
			  <div class="fitem">
			    <label>联系方式:</label>
                <input name="teacherTel" class="easyui-validatebox" required="true">
			 </div>
			  <div class="fitem">
			    <label>班长:</label>
                <input name="monitor" class="easyui-validatebox" required="true">
			 </div>
			 <div class="fitem">
			    <label>联系方式:</label>
                <input name="monitor_connection" class="easyui-validatebox" required="true">
			 </div>
			  <input type="hidden" name="majorId"  hidden="true"/>     
			  <input type="hidden" name="classId"  hidden="true"/>     
         </form>
    </div>
    
    <!-- 编辑班级的弹出框 的按钮-->
    <div id="editclass-dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveClass1()">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#editclass_dlg').dialog('close')">取消</a>
    </div>
</body>
</html>