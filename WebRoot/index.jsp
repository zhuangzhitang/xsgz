<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<title>GDOU 学生工作管理系统</title>
<base href="<%=basePath%>">
<link href="css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" src="js/utils.js"></script>

</head>

<body onkeydown="keyLogin();">
	<form id="loginForm" method="post">
		<div class="login">
			<div class="box png">
				<div class="logo png"></div>
				<div class="input">
					<div class="log">
						<div class="name">
							<label for="username">账&nbsp;号：</label>
							<input type="text" class="text" id="username" placeholder="账号" name="username" tabindex="1" value="${username}">
						</div>
						<div class="pwd">
							<label for="password">密&nbsp;码：</label>
							<input type="password" class="text" id="password" placeholder="密码" name="password" tabindex="2">
						</div>
						<div class="code">
							<label for="checkCode">验证码：</label>
							<input type="text" class="text" id="checkCode" placeholder="输入验证码" name="checkCode" tabindex="3">
							<img id="imgCode" src="checkCode" style="vertical:middle" onclick="reloadCode();"/>
							<a href="javascript:void(0)" onclick="reloadCode();">换一个</a>
						</div>
						<div class="identify">
							&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;
							<input type="radio" id="student" name="user" value="1" checked="checked" />学生
							&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;
							<input type="radio" name="user" value="0" />&nbsp;&nbsp;&nbsp;管理员
						</div>
						<div class="tip">
							${error}
						</div>
					</div>
					<div class="btn_div">
						<input id="btnLogin" type="button" class="submit" tabindex="4" value="登    录" onclick="frmSubmit()">
						<input type="reset" class="reset" tabindex="5" value="重    置">
					</div>
				</div>
			</div>
			
			<div class="footer"><div align="center"> 
				</div><div style="text-align:center; font:normal 14px/24px 'MicroSoft YaHei';"><div align="center"> 
					</div><p align="center">Copyright © Guangdong Ocean University 2014 All Rights Reserved</p>
					<p>版权所有：广东海洋大学&nbsp;&nbsp;&nbsp;&nbsp;技术支持：信息学院计算机系</p>
				</div>
			</div>
			
		</div>
	</form>
</body>
</html>