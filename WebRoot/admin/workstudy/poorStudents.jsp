<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script type="text/javascript" src="../../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../../js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../js/poorTable.js"></script>
<script type="text/javascript">
	var basePath = "${basePath}";
	var adminPath = "${adminPath}";
</script>
<link rel="stylesheet" type="text/css"
	href="../../js/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../js/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="../../css/poorTable.css" />
</head>
<body>

	<form id="button_name">
		<ul>
			<li><a href="javascript:void(0);" id="search_student"
				class="easyui-linkbutton" data-options="iconCls:'icon-search'">查看申请学生</a>
			</li>
			<li><a href="javascript:void(0);" id="search_allot"
				class="easyui-linkbutton" data-options="iconCls:'icon-search'">分配评定权限</a>
			</li>
			<li><a href="javascript:void(0);" id="search_result"
				class="easyui-linkbutton" data-options="iconCls:'icon-search'">查看评定结果</a>
			</li>
		</ul>
	</form>
	<br />
	<div>
		<!-- 下拉列表 -->
		<!-- 第一个 -->
		<div id="list_1">
			<input id="cc_1" class="easyui-combobox" name="dept"
				data-options="valueField:'classId',textField:'className'" />
		</div>
		<div id="list_2">
			<input id="cc_2" class="easyui-combobox" name="dept"
				data-options="valueField:'classId',textField:'className'" />
		</div>
		<div id="list_3">
			<input id="cc_3" class="easyui-combobox" name="dept"
				data-options="valueField:'classId',textField:'className'" />
		</div>
		<!-- 第一个表格 -->
		<div id="applytable">
			<table id="table" pagination="true" pageList=[2,3,4,5]></table>
		</div>
	</div>
	<!-- 第二个表格 -->
	<div id="allottable">
		<table id="table2">
		</table>
		<div id="s_button" style="margin-top:1em;">
			<a href="javascript:void(0);" id="search_student_button"
				onclick="getSelections()"></a>
		</div>
	</div>
	<!-- 第三个表格 -->
	<div id="result">
		<table id="table3">
		</table>
	</div>

</body>
</html>
