<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>My JSP 'showStudent.jsp' starting page</title>
</head>
<body>
	<script>
	function openWin(url,width,height){
	var phxWin=window.open(url,'','width='+width+',height='+height+',left='+(screen.width-width)/2+',top='+(screen.height-height)/2+'');
	}
	</script>
	<a href="#"
		onClick="openWin('<c:url value='${lookpath }'/>',1000,1000)">弹出小窗口</a>
	<a href="<c:url value='${path }'/>">下载</a>
</body>


</html>
