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
    <link rel="stylesheet" type="text/css" href="../css/scholarshipCut.css">
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../js/scholarshipCut.js"></script>
    <script type="text/javascript">
	    var basePath = "${basePath}";
		var adminPath = "${adminPath}";
    </script>
    <style>
       body{
    		margin-top:4%;
    	}
    	.info_1{
    		padding-left:32px;
    	}
    	#content{
    		width:600px;
    		height:230px;
    		text-align:center;
    		margin:0 auto;
    		position:absolute;  
   			left:50%;  
   			top:50%;  
   			margin:-110px 0 0 -300px ;
    	}
    	li{
    		height:37px;
    	}
    	#footbutton{
    		margin-top:-20px;
    	}
    </style>
    <script>
    	$(function(){
    		 $('.cc').combobox({    
				width:180,
				height:22
			});
			
    	})
    </script>
</head>
<body>
	 <div id="title"><h2>奖学金管理</h2></div>
	
	<div id="content">
		<div id="maintitle" style="text-align:left;">导出奖学金表格</div>
		<form id="form" method="post">
		<div id="main">
		<ul>
		   <li>
			<span class="info">数据格式:</span>
			 <input class="cc" id="data" name="dataId"/> 
			</li>
		  
			<li>
			<span class="info info_1">学院:</span>
			<input class="cc" id="academy" name="aca"/>  
			</li>
			
			<li>
			<span class="info info_1">专业:</span>
			<input class="cc" id="major" name="major"/> 
			</li>
		   	
			<li style="display:none" id="classli">
			 <span class="info info_1">班级:</span>
			 <input class="cc" id="cla" name="cla"/>
			</li>
			<li>
			<span class="info info_1">学年:</span>
			<input class="cc" id="schoolyear" name="year"/> 
			</li>
			
			
		</ul>
		</div>
		<div id="footbutton" ><span><a id="btn" style="margin-left:3px;">确定导出</a></span></div>
	</form>
	</div>
</body>
	
</html>