<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="${adminPath}">
    
    
    <title>学生成绩页面</title>
    
	<link rel="stylesheet" type="text/css" href="../js/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../js/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../css/generic.css">
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>    
    <link rel="stylesheet" type="text/css" href="../css/personScore.css">
    <script type="text/javascript" src="../js/personScore.js"></script>
   <script>
   var studentNum = "${studentNum}";
  var adminPath = "${adminPath}";
  </script>
  </head>
  
  <body>
    
   <!--成绩查询-->
   		 <table id="personScore" class="easyui-datagrid"></table> 
   <!-- 工具栏 -->
   		<div id="toolbar" >
   			 <span>学年:</span>&nbsp; <input id="schoolyear" class="easyui-combobox"    
                data-options=" valueField:'schoolYear', textField:'schoolYear',width:110,url: 'conductpoints/conduct_getSchooltyear.gdou'" />  
   			 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editScore()">修改成绩</a>
   		</div>
   	  <!-- 编辑成绩的弹出框 -->
   <div id="editScore_dlg" class="easyui-dialog" style="width:400px;height:300px;padding:10px 20px"
            closed="true" buttons="#editScore-dlg-buttons">
        <div class="ftitle">学生成绩</div> 
         <form id="editScore_fm" method="post" novalidate>
            <div class="fitem">
                <label>课程名:</label>
                <input name="courseName" class="easyui-validatebox" >
            </div>
            <div class="fitem">
                <label>成绩:</label>
                <input  name="grade" class="easyui-validatebox" required="true"/>
            </div>                
            <div class="fitem">
                <label>补考成绩:</label>
                <input name="bukao" class="easyui-validatebox" />
            </div>         
             <div class="fitem">
                <label>重考成绩:</label>
                <input name="chongkao"  class="easyui-validatebox"  />
            </div>
            
             <div class="fitem">
                <label>清考成绩:</label>
                <input name="qingkao"  class="easyui-validatebox"  />
            </div>      
           <input type="hidden" name="id"  hidden="true"/> 
        </form>
   </div>
   
    <!-- 编辑成绩的弹出框 的按钮-->
    <div id="editScore-dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveScore()">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#editScore_dlg').dialog('close')">取消</a>
    </div>
  </body>
</html>
