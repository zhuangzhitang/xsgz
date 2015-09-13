<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>My JSP 'unfinish.jsp' starting page</title>
  </head>  
  <body>
  	<c:forEach items="${student }" var="st">
  		${st.studentName }<br/>
  	
  	</c:forEach>
  
  </body>
</html>
