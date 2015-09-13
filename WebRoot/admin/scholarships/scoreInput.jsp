<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <base href="${adminPath}">
    <title>成绩导入</title>
    <link rel="stylesheet" type="text/css" href="../js/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../js/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../css/generic.css">
    <link rel="stylesheet" type="text/css" href="../css/scoreInput.css">
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../js/scoreInput.js"></script>
    <script type="text/javascript">
	    var basePath = "${basePath}";
		var adminPath = "${adminPath}";
		$(function(){
			 $('.cc').combobox({    
				width:180,
				height:22
			});
		})
		
    </script>
    <style>
    body{
    	margin-top:4%;
    }
    	#main{
    		width:600px;
    		height:230px;
    		text-align:center;
    		margin:0 auto;
    		position:absolute;  
   			left:50%;  
   			top:50%;  
   			margin:-110px 0 0 -300px;
    	}
    	
    	#maintitle{
			width:480px;
			border-bottom:1px dashed #000;
			margin:0 auto;
			text-align:left;
			}
		#title{
			width:160px;
			margin:0 auto;
		}
		.title{
			margin-top:17px;	
			}
    </style>
</head>
<body>
      <input type="hidden" value="${sessionScope.user.adminId}" name="user"/>
      
      <div id="title"><h2>奖学金管理</h2></div>
     <div id="main">
     	<div id="maintitle" style="text-align:left;">班级成绩导入</div>
	<form method="post" enctype="multipart/form-data" action="scholarships/scoreInput_fileupload.gdou">
		<div id="title1" class="title">
		<span>学院</span>
			<input id="academyScore" name="academy" class="cc"/>  
		</div>
			
		<div id="title2" class="title">
			<span>专业</span>
			<input id="majorScore" name="major" class="cc"/> 
		</div>
			
		<div id="title3" class="title">
			<span>班级</span>
			<input id="claScore" name="banji" class="cc"/> 
		</div>
		
		<div id="title4" class="title" style="margin-left:12px;">
			<span>上传文件</span>
			<input type="file" name="scoreExcel"/>
			<input id="hiddenmessage" type="hidden" value="${message}"/>
    	</div>
		
		<div id="title5" class="title">
		   <button id="btn" type="submit">确定导入</button>
		</div>
	</form>
	</div>
	<c:if test="${allsubject!=null}">
 	<div id="addtable" style="display:block">
 	 <form id="fm" action="scholarships/scoreInput_scoreInput.gdou" method="post" enctype="application/x-www-form-urlencoded">
		<table border="1" cellpadding="1" cellspacing="0" width="400px">
		  <c:forEach var="everyTerm" items="${allsubject}">
		     
		    <tr>
		      <td colspan="3" align="center">第${everyTerm.key}学期</td>
			<tr>
				<th>课程名</th>
				<th>课程性质</th>
				<th>学分</th>
			</tr>
			 <c:set var="asd" value="${everyTerm.key+0}" scope="page"></c:set>   
		<c:forEach var="subject" items="${everyTerm.value}" varStatus="sta">
			<tr>
				<td style="width:100%">
				   <input type="hidden" value="${everyTerm.key}" name="course[${subjectnum[asd]+sta.index}].termnum"/>
		           <input type="hidden" value="${grade}" name="course[${subjectnum[asd]+sta.index}].grade"/>
		           <input type="hidden" value="${majorID}" name="course[${subjectnum[asd]+sta.index}].majorID"/>
				   <input type="text" name="course[${subjectnum[asd]+sta.index}].cno" class="tableText" value="${subject}">
				 </td>
				<td style="width:80px;">
				    <select  class="easyui-combobox" style="width:100%;height:30px" name="course[${subjectnum[asd]+sta.index}].coursestatus">   
			   		    <option value="0">必修课</option>   
			        	<option value="1" selected="selected">选修课</option>   
			    		<option value="2">体育课</option>     
			        </select>
				</td>
				<td style="width:40px;"><input type="text" name="course[${subjectnum[asd]+sta.index}].credit" class="tableText" size="5"></td>	
			</tr>
			</c:forEach>
			</c:forEach>
		</table>
		<div id="foot-button">
			 <input type="button" value="选择完毕" id="bn" />
		</div>
	   
	  </form>
	</div>
	</c:if>
</body>
</html>