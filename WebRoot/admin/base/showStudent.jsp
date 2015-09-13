<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学生详细信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">

	-->
  </head>
  	  <frameset rows="14%,*" cols="*" frameborder="no" border="0" framespacing="0" scrolling="no" >
		<frame src="<c:url value='/admin/base/studentInfo_forwardStudentInfopage.gdou?studentNum=${studentNum}'/>" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" />
		<frame src="<c:url value='/admin/base/null.jsp'/>" name="contentFrame" id="contentFrame" title="contentFrame" /> 
	</frameset>
 <noframes>
<body>
	你的浏览器不支持frameset框架
</body>
 </noframes> 
  
</html>
