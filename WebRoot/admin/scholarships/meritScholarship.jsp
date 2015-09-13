<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <base href="${adminPath}">
    <title>优秀奖学金管理</title>
   <link rel="stylesheet" type="text/css" href="../js/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../js/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../css/generic.css">
    <link rel="stylesheet" type="text/css" href="../css/meritScholarship.css">
     <link rel="stylesheet" type="text/css" href="../css/reset.css"></link>
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../js/meritScholarship.js"></script>
    <script type="text/javascript">
	    var basePath = "${basePath}";
		var adminPath = "${adminPath}";
    </script>
    <style>
    	body{
    		padding-left:3%;
    	}
    	#main_table{
    		margin-left:-2%;
    		padding:0;
    	}
    </style>
</head>
<body>
	<div class="search_look">
	    <form id="form1" method="post">
			<ul>
			<li>
				<span class="information">学院:</span>
				<input class="info_s" id="academy"/>  
			</li>
			
			<li>
				<span class="information">专业:</span>
				<input class="info_s" id="major"/> 
			</li>
			
			<li class="info_class">
				<span class="information">班级:</span>
				<input class="info_s" id="cla" name="classId"/> 
			</li>
			<li class="info_class">
				<span class="information">学年:</span>
				<input class="info_s" id="schoolyear" name="year"/> 
			</li>
			<li class="info_class">
				<span><a id="btn" onclick="openDialog()">刷新奖学金名单</a></span>
			</li>
		</ul>
		</form>
		</div>
		<!--表格显示-->
		<br /><br />
		<div id="main_table">
		<div id="table">
		       <table id="dg_academy" style="width:1150px;height:380px"> </table>
       </div>
	   </div>
	   
	   
	    <div id="add1_dlg" class="easyui-dialog" style="width:400px;height:250px;padding:10px 20px"
            closed="true" buttons="#add1_dlg-buttons">
        <div class="ftitle">重新评定奖学金获得者</div>
        <form id="add1_fm" method="post" novalidate>
            <div class="fitem">
                <label>1、先选学院：</label>
               <input class="info_s" id="academy0" name="academy0"/>  
            </div>
            <div class="fitem">
                <label>2、再选专业：</label>
				<input class="info_s" id="major0" name="major0"/> 
            </div> 
             <div class="fitem">
                <label>3、再选学年：</label>
				<input class="info_s" id="year0" name="year0"/> 
            </div>                 
        </form>
    </div>
    <!-- 弹出框按钮-->
    <div id="add1_dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="shuaxin()">刷新</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#add1_dlg').dialog('close')">取消</a>
    </div>

</body>
</html>