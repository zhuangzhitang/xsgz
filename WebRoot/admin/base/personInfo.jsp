<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <base href="${adminPath}">
    <title>学生详细信息</title>
   
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../js/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../js/themes/icon.css">
    <script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
    
    <script  type="text/javascript" src="../js/tableInfo.js"></script>
	<script  type="text/javascript" src="../js/table.js"></script>
	<script  type="text/javascript" src="../js/tableScore.js"></script>
	<script  type="text/javascript" src="../js/tablePoint.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/tableInfo.css"/>
	<link rel="stylesheet" type="text/css" href="../css/table.css"/>
	<link rel="stylesheet" type="text/css" href="../css/tableScore.css"/>
	<link rel="stylesheet" type="text/css" href="../css/tablePoint.css"/>
	
    <script type="text/javascript">
	    var basePath = "${basePath}";
		var adminPath = "${adminPath}";
    </script>
</head>
<body>
	   <form id="infos_fm" action="" method="post" enctype="multipart/form-data">
			<div id="base_main" >
				<table cellspacing="1" cellpadding="0" >
			<tr>
				<td  class="trbg1"><span class="tr1">学号:</span></td>
				<td><span class="table_info"><input type="text" class="table_text1" id="studentNum" name="infos.studentNum" value="${infos.studentNum}"/></span></td>
				<td  class="trbg1"><span class="tr1">家庭出身:</span></td>
				<td><span class="table_info"><input type="text" class="table_text1" name="infos.familybackground" value="${infos.familybackground}"/></span></td>
				<td  class="trbg1"><span class="tr1">手机号码:</span></td>
				<td><span class="table_info"><input type="text" class="table_text1" name="infos.phoneNum" value="${infos.phoneNum}"/></span></td>
				<td  colspan="2"  rowspan="5"><span class="table_info"><img id="imgShow" src="${basePath}file/image/${infos.photo_path}" style="width:120px;height:180px;margin:5px;"/>
				<input type ="hidden" name="infos.photo_path" value="${infos.photo_path }"/></span></td>
				
			</tr>
			
			<tr>
				<td  class="trbg1"><span class="tr1">姓名:</span></td>
				<td><span class="table_info"><input type="text" class="table_text1" name="infos.studentName" value="${infos.studentName }"/></span></td>
				<td  class="trbg1"><span class="tr1">教育程度:</span></td>
				<td><span class="table_info"><input type="text" class="table_text1" name="infos.education" value="${infos.education }"/></span></td>
				<td  class="trbg1"><span class="tr1">QQ号码:</span></td>
				<td><span class="table_info"><input type="text"class="table_text1" name="infos.qqNum" value="${infos.qqNum }"/></span></td>
				
			</tr>
			
			<tr>
				<td  class="trbg1"><span class="tr1">班级:</span></td>
				<td><span class="table_info"><input type="text" class="table_text1" name="infos.className" value="${infos.className }"/></span></td>
				<td  class="trbg1"><span class="tr1">身份证号:</span></td>
				<td><span class="table_info"><input type="text" class="table_text1" name="infos.identityNum" value="${infos.identityNum }"/></span></td>
				<td class="trbg1"><span class="tr1">Email:</span></td>
				<td><span class="table_info"><input type="text" class="table_text1" name="infos.email" value="${infos.email }"/></span></td>
				
			</tr>
			
			<tr>
				<td  class="trbg1"><span class="tr1">性别:</span></td>
				<td><span class="table_info"><input type="text" class="table_text1" name="infos.sex" value="${infos.sex }"/></span></td>
				<td  class="trbg1"><span class="tr1">银行卡号:</span></td>
				<td><span class="table_info"><input type="text"class="table_text1" name="infos.bankCardNum" value="${infos.bankCardNum }"/></span></td>
				<td  class="trbg1"><span class="tr1">籍贯:</span></td>
				<td><span class="table_info"><input type="text" class="table_text1" name="infos.nativePlace" value="${infos.nativePlace }"/></span></td>
				
			</tr>
			
			<tr>
				<td  class="trbg1"><span class="tr1">入学年份:</span></td>
				<td><span class="table_info"><input type="text" class="table_text1" name="infos.timeofstart" value="${infos.timeofstart }"/></span></td>
				<td  class="trbg1"><span class="tr1">出生年月:</span></td>
				<td><span class="table_info"><input type="text" class="table_text1" name="infos.birth" value="${infos.birth }"/></span></td>
				<td  class="trbg1"><span class="tr1">政治面貌:</span></td>
				<td><span class="table_info"><input type="text" class="table_text1" name="infos.politicsStatus" value="${infos.politicsStatus }"/></span></td>
				
			</tr>
			
			<tr>
				<td  class="trbg1"><span class="tr1">民族:</span></td>
				<td><span class="table_info"><input type="text" class="table_text1" name="infos.nation" value="${infos.nation }"/></span></td>
				<td  class="trbg1"><span class="tr1">宿舍号:</span></td>
				<td><span class="table_info"><input type="text" class="table_text1" name="infos.dormitory" value="${infos.dormitory }"/></span></td>
				<td  class="trbg1"><span class="tr1">密码:</span></td>
				<td><span class="table_info"><input type="text" class="table_text1" name="infos.password" value="${infos.password }"/></span></td>
				<td colspan="2" class="file_info"><span class="table_info"><input id="cImage" type="file" style="width:98%;" name="uploadFile" onchange="showPicture()"/></span></td>
			
			</tr>
			
			<tr>
				<td  class="trbg1"><span class="tr1">邮政编码:</span></td>
				<td><span class="table_info"><input type="text" class="table_text1" name="infos.postcode" value="${infos.postcode }"/></span></td>
				<td  class="trbg1"><span class="tr1">家庭电话:</span></td>
				<td><span class="table_info"><input type="text" class="table_text1" name="infos.familyPhone" value="${infos.familyPhone }"/></span></td>
				<td  class="trbg1" rowspan="2" ><span class="tr1">家庭地址:</span></td>
				<td rowspan="2" colspan="2"><span class="table_info"><textarea style="width:99%" name="infos.address" value="${infos.address }">${infos.address }</textarea></span></td>
			
			</tr>
			
			<tr>
				<td  class="trbg1"><span class="tr1">健康状况:</span></td>
				<td><span class="table_info"><input type="text" class="table_text1" name="infos.healthStatus" value="${infos.healthStatus }"/></span></td>
				<td  class="trbg1"><span class="tr1">短号:</span></td>
				<td><span class="table_info"><input type="text" class="table_text1" name="infos.shortNum"  value="${infos.shortNum }"/></span></td>
				
				
			</tr>
			
			<!-- <tr>
				<td  rowspan="2" class="trbg1" style="height:60px" ><span class="tr1">备注:</span></td>
				<td rowspan="2" colspan="6"><span class="table_info"><textarea style="width:99%"></textarea></span></td>
				
			</tr> -->
			
			
			
		</table>
		<br />
		<div id="table_button">
			<a id="save" href="javascript:void(0)"><span class="info">保存</span></a>
			<a id="edit" href="javascript:void(0)"><span class="info">修改</span></a>
		</div>
		</div>
	
	</form>
	<!--成绩查询-->
	<div id="main_score">
		<input id="schoolyear" class="easyui-combobox"    
             data-options=" valueField:'schoolYear', textField:'schoolYear',width:110,url: 'conductpoints/conduct_getSchooltyear.gdou'" />  
	<a href="javascript:void(0)"  id="search" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>  

	<br /><br />
	<div id="main">
	<table cellspacing="1" cellpadding="0" id="table_main">
		<tr>
			<td  class="trbg1 trbg11"><span class="tr1">高等数学</span></td>
			<td><span class="table_info "><input type="text" class="table_text1 table_text2" value="8"/></span></td>
			<td  class="trbg1 trbg11"><span class="tr1">离散数学</span></td>
			<td><span class="table_info"><input type="text"  class="table_text1 table_text2" value="77"/></span></td>
			<td  class="trbg1 trbg11"><span class="tr1">大学英语1</span></td>
			<td><span class="table_info"><input type="text" class="table_text1 table_text2" value="100"/></span></td>
		</tr>
	</table>
	</div>
	</div>
	
	
	
	
			
		
</body>
</html>