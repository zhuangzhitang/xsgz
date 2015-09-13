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
    <link rel="stylesheet" type="text/css" href="../css/conductCut.css">
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../js/conductCut.js"></script>
    <script type="text/javascript">
	    var basePath = "${basePath}";
		var adminPath = "${adminPath}";
    </script>
     
</head>
<body>
	<div id="title"><h2>操行分管理</h2></div>
	<div>
		<div id="maintitle">导出操行分</div>
		<form id="form" method="post">
		<div id="main">
		<ul>
			<li>
			<span class="info">学院:</span>
			<input class="cc" id="academy" name="aca"/>  
			</li>
			
			<li>
			<span class="info">专业:</span>
			<input class="cc" id="major" name="major"/> 
			</li>
			
			<li>
			<span class="info">班级:</span>
			<input class="cc" id="cla" name="cla"/> 
			</li>
			
			<li>
			<span class="info">学年:</span>
			<input class="cc" id="schoolyear" name="year"/> 
			</li>
		</ul>
		</div>
		
		<div id="footbutton" ><span><a id="btn">确定导出</a></span></div>
		</form>
	</div>
</body>
</html>