<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
	String basePath = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>提交申请成失败</title>

</head>

<body>
<br/><br/>
请检查失败原因：<font style="color:red">只允许上传文件后缀名为.doc或.docx的word文档，且文件大小不能大于10M。</font>
<br /><br />
点击<a href="<c:url value='/student/index.jsp' />"><strong>这里</strong></a>返回重新选择
</body>
</html>
