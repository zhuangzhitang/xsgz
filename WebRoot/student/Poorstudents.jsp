<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>无标题文档</title>
<script type="text/javascript" src="../js/JQuerey/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="../js/Poorstudents.js"></script>
<link rel="stylesheet" type="text/css" href="../css/Poorstudents.css"></link>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/datatables.css" />
</head>

<script type="text/javascript">
	var myName="<%=session.getAttribute("msg")%>";
   	alert(myName); 
   	var basePath = "${basePath}";
</script>

<body  scroll='no' style="overflow-x:hidden">
	<div class="header">
    	<img src="../img/school_sign01.png" width="100"/>
        <h2 style="display:inline; margin-left:1em;color:#CCC;">广东海洋大学学生工作系统</h2>
			<div id="z_index">评定贫困生分数必须要有先后顺序，最高分为本班级申请人数的值，分数不能重复，且不能为空</div>
	</div>
		
		<!-- 主体部分 -->
		<div id="title_main">
			<span name="" class="class_name">${classID}班贫困生评定</span>
				<p >你所填入的分数必须在1~${size }之间</p>
		</div>

		<div id="main">
			<form action="GetResultAction.gdou" method="post">
				<ul>
					<c:forEach items="${users}" var="user" varStatus="status">
						<li><span class="main_img"> 
								<a href="#" onclick="opene(${user.studentNum })" id="a">
								<img src="<c:url value='../file/image/${user.photo_path }'/>"
									style="width:140px;height:150px;" class="img"></img>
									</a>
						</span><span class="img_name">
						${user.studentName }
						<input type="hidden" id="studentNum" name="studentNum" 
						value="${user.studentNum }"/>${user.studentNum} 
						<br>
						<input onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" type="text" size="5" class="input_info" name="number"/>
						</span>
						</li>
					</c:forEach>
				</ul>
				<div id="footbutton">
					<span><input type="submit" value="提&nbsp;交" id="save"></input>
					</span>
				</div>
			</form>
		</div>
</body>
</html>
