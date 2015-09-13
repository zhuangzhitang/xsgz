<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>My JSP 'exporttable.jsp' starting page</title>
    <style>
    	a{
    		text-decoration:none;
    	}
    	a:hover{
    		text-decoration:underline
    	}
    	a:visited{
    		color:gray;
    	}
    </style>
  </head>  
  <body>
  请选择你要导出的表格
  
	<a href="admin_export.gdou?kind=1">贫困生认定表</a>&nbsp;|
	<a href="admin_export.gdou?kind=2">国家励志奖学金评审表</a>&nbsp;|
	<a href="admin_export.gdou?kind=3">助学金初审名单</a>&nbsp;|
	<a href="admin_export.gdou?kind=4">贫困生名单</a>
  </body>
</html>
