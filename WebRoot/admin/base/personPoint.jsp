<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>学生操勤分界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="../../js/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../../js/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../../css/generic.css">
    <script type="text/javascript" src="../../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../js/easyui-lang-zh_CN.js"></script>
     <script type="text/javascript" src="../../js/studentPoint.js"></script>
  </head>
   <script>
   var studentNum = "${studentNum}";
   var adminPath = "${adminPath}";
  </script>
  <body>
        <table id="dg_studentPoint" title="学生操勤分" class="easyui-datagrid" 
            toolbar="#toolbar" pagination="false"
            rownumbers="true" fitColumns="true" singleSelect="true">
	        <thead>
	            <tr>
	            	<th field="ck" checkbox="true"></th>
	                <th field="id" width="30" hidden="true">操勤分id</th>
	                <th field="conductName" width="30">名称</th>
	                <th field="conductScore" width="35">分数</th>
	            </tr>            
	        </thead>           
       </table>
    <div id="toolbar">
                   学年： <input id="schoolyear" class="easyui-combobox"    
                data-options=" valueField:'schoolYear', textField:'schoolYear',width:110,url: '../conductpoints/conduct_getSchooltyear.gdou'" />  
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editPoint()">编辑信息</a>
    </div>
    
    <!-- 编辑操勤分 -->
    <div id="editPoint_dlg" class="easyui-dialog" style="width:400px;height:250px;padding:10px 20px"
            closed="true" buttons="#editPoint-dlg-buttons">
        <div class="ftitle">编辑操勤分</div> 
         <form id="editPoint_fm" method="post" novalidate>
            <div class="fitem" >
                <label>名称:</label>
                <input name="conductName" class="easyui-validatebox" style="border:none;background:#fff;" required="true">
            </div>
            <div class="fitem">
                <label>分数:</label>
                <input  name="conductScore" class="easyui-validatebox" required="true"/>
            </div>                
           <input type="hidden" name="id"  hidden="true"/>
        </form>
   </div>
   
    <!-- 编辑专业的弹出框 的按钮-->
    <div id="editPoint-dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="savePoint()">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#editPoint_dlg').dialog('close')">取消</a>
    </div>
  </body>
</html>
