<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <base href="${adminPath}">
    <title>院级管理员专业信息维护</title>
    <link rel="stylesheet" type="text/css" href="../js/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../js/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../css/generic.css">
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
  	<script type="text/javascript" src="../js/major1.js"></script>
    <script type="text/javascript">
	    var basePath = "${basePath}";
		var adminPath = "${adminPath}";
    </script>
</head>
<body>
	<!-- 工具栏 -->
	<div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addMajor()">新增专业</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editMajor()">编辑专业</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyMajor()">移除专业</a>
    </div>
   
   <!-- 专业信息列表 -->
      <table id="dg_major" title="专业信息" class="easyui-datagrid" style="width:1150px;height:370px"
            url="base/major_role1GetMajorsByAcademyId.gdou" 
            toolbar="#toolbar" pagination="false"
            rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
            <tr>
            	<th field="ck" checkbox="true"></th>
                <th field="majorId" width="30" hidden="true">专业ID</th>
                <th field="academyId" width="30" hidden="true">学院ID</th>
                <th field="majorName" width="30">专业名称</th>
                <th field="shortName" width="35">专业简称</th>
                <th field="counselor" width="30">辅导员</th>
                <th field="tel" width="30">辅导员联系方式</th>
            </tr>            
        </thead>           
    </table>
    
    <!-- 添加专业的弹出框 -->
   <div id="addmajor_dlg" class="easyui-dialog" style="width:400px;height:300px;padding:10px 20px"
            closed="true" buttons="#addmajor-dlg-buttons">
        <div class="ftitle">专业信息</div> 
         <form id="addmajor_fm" method="post" novalidate>
            <div class="fitem">
                <label>专业名称:</label>
                <input name="majorName" class="easyui-validatebox" required="true">
            </div>
            <div class="fitem">
                <label>专业简称:</label>
                <input  name="shortName" class="easyui-validatebox" required="true"/>
            </div>                
            <div class="fitem">
                <label>辅导员:</label>
                <input name="counselor" required="true" class="easyui-validatebox" />
            </div>         
             <div class="fitem">
                <label>联系方式:</label>
                <input name="tel" required="true" class="easyui-validatebox"  />
            </div>             
        </form>
   </div>
   
    <!-- 添加专业的弹出框 的按钮-->
    <div id="addmajor-dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveMajor()">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#addmajor_dlg').dialog('close')">取消</a>
    </div>
    
    
    <!-- 编辑专业的弹出框 -->
   <div id="editmajor_dlg" class="easyui-dialog" style="width:400px;height:300px;padding:10px 20px"
            closed="true" buttons="#editmajor-dlg-buttons">
        <div class="ftitle">专业信息</div> 
         <form id="editmajor_fm" method="post" novalidate>
            <div class="fitem">
                <label>专业名称:</label>
                <input name="majorName" class="easyui-validatebox" required="true">
            </div>
            <div class="fitem">
                <label>专业简称:</label>
                <input  name="shortName" class="easyui-validatebox" required="true"/>
            </div>                
            <div class="fitem">
                <label>辅导员:</label>
                <input name="counselor" required="true" class="easyui-validatebox" />
            </div>         
             <div class="fitem">
                <label>联系方式:</label>
                <input name="tel" required="true" class="easyui-validatebox"  />
            </div>   
             
           <input type="hidden" name="academyId"  hidden="true"/>
           <input type="hidden" name="majorId"  hidden="true"/>     
        </form>
   </div>
   
    <!-- 编辑专业的弹出框 的按钮-->
    <div id="editmajor-dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveMajor1()">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#editmajor_dlg').dialog('close')">取消</a>
    </div>
</body>
</html>