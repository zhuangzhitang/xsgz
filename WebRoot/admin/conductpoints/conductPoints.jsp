<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <base href="${adminPath}">
    <title>优秀奖学金管理</title>
    <link rel="stylesheet" type="text/css" href="../js/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../js/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../css/generic.css">
    <link rel="stylesheet" type="text/css" href="../css/conductPoint.css">
    <link rel="stylesheet" type="text/css" href="../css/reset.css"></link>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../js/conductPoints.js"></script>
    <script type="text/javascript">
	    var basePath = "${basePath}";
		var adminPath = "${adminPath}";
    </script>
    <style>
    	body{
    		padding-left:3%;
    	}
    	#main_table{
    		margin-left:-2%;
    		padding:0;
    	}
    </style>
</head>
<body>
	<div id="main">
		
		<div id="search">
			<ul>
			<li>
			<span class="information">学院:</span>
			<input class="info_s" id="academy"/>  
			</li>
			
			<li>
			<span class="information">专业:</span>
			<input class="info_s" id="major"/> 
			</li>
			
			<li class="info_class">
			<span class="information">班级:</span>
			<input class="info_s" id="cla"/> 
			</li>
			<li class="info_class">
				<a id="add">添加操行项</a>
			</li>
		</ul>
		</div> 
	</div>
	<!--表格显示-->
	<div id="main_table" style="display:none">
		<div id="table">
		       <table id="dg_academy" style="width:1150px;height:280px"> </table>
       </div>
	</div>
	
	<!--操行分显示显示-->
	<div id="point" style="display:none">
	    <form id="insertConduct" method="post">
		<ul>
		    <li>
			<span class="information">学年:</span>
			<input class="info_s" id="year" name="year"/> 
			</li>
			<li>
			<span class="information">操行分项:</span>
			<input class="info_s" id="conductitem" name="item"/> 
			</li>
			
			<li class="info_class">
			<span class="information">分数:</span>
			<input type="text" class="info_text" name="score"/> 
			<input type="hidden" id="selectStudent" name="allStudent"/>
			</li>
			
			<li id="info_sure1"><a id="sure_1">确定</a></li>
		</ul>
		</form>
	</div>
	
	<!--弹出小窗口-->
	<div id="littlewindow" >
		<form id="form1" method="post">
		<ul>
			<li>
			<span class="info">操行分一级栏目:</span>
			<input class="easyui-combobox" name="firstConduct"
                    editable="false" missingMessage='请选择操行分一级栏目' required="true"
                    data-options="valueField: 'firstId', textField: 'firstText',   
			        data:[{'firstId':-1,'firstText':'请选择一级栏目','selected':true},{'firstId':0,'firstText':'思想道德素质'},{'firstId':1,'firstText':'社会实践能力'}],
			         onSelect: function(rec){   
			            var url = 'conductpoints/conduct_getSecondConduct.gdou?firstId='+rec.firstId;  
			            $('#sec').combobox('clear');    
			            $('#sec').combobox('reload', url);   
			        }" 
			     />
			</li>
			
			<li>
			<span class="info">操行分二级栏目:</span>
			<input id="sec" class="easyui-combobox" editable="false" 
				missingMessage='请选择操行分二级栏目' name="conductitem.conduct_superitem" required="true"
				data-options="valueField:'id',textField:'conduct_havenext'" /> 
			</li>
			
			<li><span class="info">操行分项目名字:</span>&nbsp;<input type="text" class="info_text" name="conductitem.conduct_name"/></li>
			
			<li>
			<span class="info" id="year">学年:</span>
			<input  class="easyui-combobox" editable="false"
				missingMessage='请选择学年' name="conductitem.schoolyear" required="true"
				data-options="valueField:'schoolYear',textField:'schoolYear'"
				url="conductpoints/conduct_getSchooltyear.gdou" /> 
			</li>
		</ul>
		
		<div id="little_button">
			<a id="little_sure" onclick="saveConduct()">确定</a>
			&nbsp;
			<a id="little_no" onclick="quxiaoConduct()">取消</a>
		</div>
		</form>
	</div>
</body>
</html>