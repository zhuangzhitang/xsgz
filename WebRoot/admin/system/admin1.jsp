<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
</style>
    <base href="${adminPath}">
    <title>【院级】管理员维护【专业级】管理员信息</title>
    <link rel="stylesheet" type="text/css" href="../js/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../js/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../css/generic.css">
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../js/admin1.js"></script>
    <script type="text/javascript">
    	var basePath = "${basePath}";
    	var adminPath = "${adminPath}";
    </script>
</head>

<body >
	<!-- 工具栏 -->
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addAdmin()">添加管理员</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="changePassword()">修改密码</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteAdmin()">删除管理员</a>
    </div>
    
    <!-- 该学院的所有专业级管理员列表 -->
	<table id="dg_role2" title="【${user.subjectName}】专业级管理员信息" class="easyui-datagrid" style="width:1150px;height:370px"
            url="system/admin_role1GetMajorAdmins.gdou" toolbar="#toolbar" pagination="false"
            rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
            <tr>
            	<th field="ck" checkbox="true"></th>
                <th field="adminId" width="30" hidden="hidden">管理员ID</th>
                <th field="username" width="35" >用户名</th>
                <th field="majorName" width="40">管辖专业</th>
                <th field="registerTime" width="50">注册时间</th>
                <th field="lastTime" width="50">上次登录时间</th> 
            </tr>            
        </thead>           
    </table>

    <!-- 添加管理员的弹出框-->
    <div id="add_dlg" class="easyui-dialog" style="width:400px;height:380px;padding:10px 20px"
            closed="true" buttons="#add_dlg-buttons">
        <div class="ftitle">管理员信息</div>
        <form id="add_fm" method="post" novalidate>
            <div class="fitem">
                <label>管辖的专业:</label>
                <input name="majorId" class="easyui-combobox" required="true" editable="false" missingMessage='请选择专业'
                	data-options="valueField:'majorId',textField:'majorName',url:'base/major_role1GetMajorsByAcademyId.gdou' "/>
            </div>
            <div class="fitem">
                <label>用户名:</label>
                <input name="username" class="easyui-validatebox" required="true">
            </div>
            <div class="fitem">
                <label>密码:</label>
                <input id="password" name="password" validType="length[8,16]"
                 type="password" class="easyui-validatebox" required="true"/>
            </div>                
            <div class="fitem">
                <label>确认密码:</label>
                <input name="repassword" type="password" required="true" class="easyui-validatebox" 
                validType="equalTo['#password']" invalidMessage="两次输入密码不一致！"/>
            </div>             
        </form>
    </div>
    <!-- 添加管理员的弹出框按钮-->
    <div id="add_dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveNewAdmin()">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#add_dlg').dialog('close')">取消</a>
    </div>
    
    <!-- 修改密码的弹出框-->
    <div id="cp_dlg" class="easyui-dialog" style="width:400px;height:380px;padding:10px 20px"
            closed="true" buttons="#cp_dlg-buttons">
        <div class="ftitle">管理员信息</div>
        <form id="cp_fm" method="post" novalidate>
            <div class="fitem" hidden="true">
                <label>管理员ID:</label>
                <input name="adminId" class="easyui-validatebox" style="border:none;background:#fff;">
            </div>
            <div class="fitem">
                <label>用户名:</label>
                <input name="username" style="border:none;background:#fff;" >
            </div>
            <div class="fitem">
                <label>管辖范围:</label>
                <input name="majorName" style="border:none;background:#fff;">
            </div>    
            <div class="fitem">
                <label>新密码:</label>
                <input id="newpassword" name="password" validType="length[8,16]"
                 type="password" class="easyui-validatebox" required="true"/>
            </div>                
            <div class="fitem">
                <label>确认新密码:</label>
                <input name="repassword" type="password" required="true" class="easyui-validatebox" 
                validType="equalTo['#newpassword']" invalidMessage="两次输入密码不一致！"/>
            </div>                      
        </form>
    </div>
    <!-- 修改密码的弹出框按钮-->
    <div id="cp_dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveChangedPwd()">修改</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#cp_dlg').dialog('close')">取消</a>
    </div>
    
</body>
</html>