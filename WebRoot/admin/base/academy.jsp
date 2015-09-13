<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <base href="${adminPath}">
    <title>学院信息维护</title>
    <link rel="stylesheet" type="text/css" href="../js/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../js/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../css/generic.css">
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../js/academy.js"></script>
    
    <script type="text/javascript">
	    var basePath = "${basePath}";
		var adminPath = "${adminPath}";
    </script>
</head>
<body >
    <table id="dg_academy" title="学院信息" class="easyui-datagrid" style="width:1150px;height:370px"
            url="base/academy_queryByPage.gdou" 
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
            <tr>
            	<th field="ck" checkbox="true"></th>
                <th field="academyId" width="30" hidden="true">学院ID</th>
                <th field="academyName" width="30">学院名称</th>
                <th field="shortName" width="35">学院简称</th>
                <th field="dean" width="30">院长</th>
                <th field="tel" width="30">学院办公室电话</th>
                <th field="email" width="30">学院邮箱</th>
                <th field="address" width="50">学院地址</th> 
            </tr>            
        </thead>           
    </table>
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newAcademy()">新增学院</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editAcademy()">编辑学院</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyAcademy()">移除学院</a>
    </div>
    
    <div id="dlg" class="easyui-dialog" style="width:400px;height:380px;padding:10px 20px"
            closed="true" buttons="#dlg-buttons">
        <div class="ftitle">学院信息</div>
        <form id="fm" method="post" novalidate>
            <div class="fitem" hidden="true">
                <label>学院ID:</label>
                <input name="academyId" class="easyui-validatebox" >
            </div>
            <div class="fitem">
                <label>学院名称:</label>
                <input name="academyName" class="easyui-validatebox" required="true">
            </div>
            <div class="fitem">
                <label>学院简称:</label>
                <input name="shortName" class="easyui-validatebox" required="true">
            </div>
            <div class="fitem">
                <label>院长:</label>
                <input name="dean">
            </div>
            <div class="fitem">
                <label>办公室电话:</label>
                <input name="tel" class="easyui-validatebox" required="true">
            </div>
            <div class="fitem">
                <label>学院邮箱:</label>
                <input name="email" class="easyui-validatebox" validType="email">
            </div>
            <div class="fitem">
                <label>学院地址:</label>
                <input name="address" class="easyui-validatebox" required="true">
            </div>
        </form>
    </div>
    <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveAcademy()">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
    </div>

</body>
</html>