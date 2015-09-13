<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>学生详细信息</title>
   
   <link rel="stylesheet" type="text/css" href="../../js/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../../js/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../../css/generic.css">
    
    <link rel="stylesheet" type="text/css" href="../../css/tableInfo.css">
	<link rel="stylesheet" type="text/css" href="../../css/table.css">
	<link rel="stylesheet" type="text/css" href="../../css/tableScore.css">
	<link rel="stylesheet" type="text/css" href="../../css/tablePoint.css">
    
    
    <script type="text/javascript" src="../../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../js/easyui-lang-zh_CN.js"></script>
    <script  type="text/javascript" src="../../js/tableInfo.js"></script>
	<script  type="text/javascript" src="../../js/table.js"></script>
	<script  type="text/javascript" src="../../js/tableScore.js"></script>
	<script  type="text/javascript" src="../../js/tablePoint.js"></script>
	
	
    <script type="text/javascript">
	    var basePath = "${basePath}";
		var adminPath = "${adminPath}";
    </script>
</head>
<body>

       <!-- 工具栏 -->

	 <div id="main_button">
		<ul>
			<li>
				<a id="basic_info" href="<c:url value='studentInfo_getAllInfosByNum.gdou?studentNum=${studentNum }'/>" target="contentFrame" >
				<span class="info">基本信息</span> </a>
			</li>
			<li>
				<a id="score_info" href="<c:url value='studentInfo_forwardStudentScorepage.gdou?studentNum=${studentNum }'/>" target="contentFrame"> <span
					class="info">成绩</span> </a>
			</li>
			<li>
				<a id="conduct_info" href="<c:url value='studentInfo_forwardStudentPointpage.gdou?studentNum=${studentNum }'/>" target="contentFrame">
				<span class="info">操行分</span>
				</a>
			</li>
		</ul>
	</div>

	<br/>
	
</body>
</html>