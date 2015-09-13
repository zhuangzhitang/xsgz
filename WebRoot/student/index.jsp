<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String basePath = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学生工作系统首页</title>

<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/index.css" />
<link rel="stylesheet" href="../css/datatables.css" />
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/studentIndex.js"></script>
<script type="text/javascript" src="../js/jquery.dataTables.min.js"></script>

<script type="text/javascript">
		var studentNum = '${studentNum}';
		var basePath = "<%=basePath%>";
		var downfileUrl = '<c:url value='/' />';
</script>
</head>

<body scroll='no' style="overflow-x:hidden">
<div class="mian">
<div class="page">
    <div class="header">
     <div class="applying1" id="applying1" style="color:red;display:none;">
       		 正在提交申请信息，请稍后...
     </div>

    	<img src="../img/school_sign01.png" width="100"/>
        <h2 style="display:inline; margin-left:1em;color:#CCC;">广东海洋大学学生工作系统</h2>
        <ul class="menu">
        	<li class="menu_li"><a href="#" id="showMain">首页</a></li>
            <li class="menu_li"><a href="#" id="showAttention">通知公示</a></li>
            <li class="menu_li"><a href="#" id="showDownload">文件下载</a></li>
            <li class="menu_li"><a href="StudentAction.gdou">贫困生认定</a></li>
            <li class="menu_li"><a href="#">申请</a>
            	<ul id="navApply">
            		<li toggle="申请贫困生">申请贫困生</li>
                	<li toggle="申请勤工岗位">申请勤工岗位</li>
                    <li toggle="申请助学贷款">申请助学贷款</li>
                    <li toggle="申请国家助学金">申请国家助学金</li>
                    <li toggle="申请国家奖学金">申请国家奖学金</li>
                    <li toggle="申请国家励志奖学金">申请国家励志奖学金</li>
                </ul>
            </li>
            <li class="menu_li"><a href="#">帮助</a></li>
            <li class="menu_li"><a href="#">${user.studentName}</a>
            	<ul>
            		
                    <li><a href="<c:url value='/studentExit.gdou' />">退出系统</a></li>
                    <li><a href="#" id="alertPass">修改密码</a></li>
                </ul>
            </li>
            
        </ul>
    </div>
    <div class="content">
    	<!-- 首页模块-->
    	<div class="main" id="main">
        	<table class="table">
            	<tr>
                	<td>
                    	<div class="part part1"><h3>申请贫困生</h3>
                        	<div class="request">
                            	<p>前提：必须是贫困生，且相关文件已盖章</p>
        						<p>申请方式：提交“国家助学金申请表”<br />（Word文档）</p>
                                <br />
                            	<button class="btn btn-danger apply" toggle="申请贫困生">申请</button>
                            </div>
                        </div>
                        
                    </td>
                    <td>
                    	<div class="part part2"><h3>申请国家助学金</h3>
                        	<div class="request">
                            	<p>前提：必须是贫困生，且相关文件已盖章</p>
        						<p>申请方式：提交“国家助学金申请表”<br />（Word文档）</p>
                                <br />
                            	<button class="btn btn-danger apply" toggle="申请国家助学金">申请</button>
                            </div>
                        </div>
                    </td>
                    <td>
                    	<div class="part part3"><h3>申请国家奖学金</h3>
                        	<div class="request">
                            	<p>前提：成绩优秀，且从没有挂科</p>
        						<p>申请方式：提交“国家奖学金申请表”<br />（Word文档）</p>
                                <br />
                            	<button class="btn btn-danger apply"  toggle="申请国家奖学金">申请</button>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                	<td>
                    	<div class="part part4"><h3>申请勤工岗位</h3>
                        	<div class="request">
                            	<p> 前提：任何学生，但优先考虑贫困生</p>
        						<p>申请方式：提交“勤工岗位申请表”<br />（Word文档）</p>
                                <br />
                            	<button class="btn btn-danger apply" toggle="申请勤工岗位" >申请</button>
                            </div>
                        </div>
                    </td>
                    <td>
                    	<div class="part part5"><h3>申请助学贷款</h3>
                       	    <div class="request">
                            	<p>前提：必须是贫困生，且相关文件已盖章</p>
        						<p>申请方式：填写计划贷款数目，提交给辅导员<br />审批；审批通过后到国家制定网站登记贷款</p>
                                <br />
                            	<button class="btn btn-danger apply"toggle="申请助学贷款">申请</button>
                            </div>
                        </div>
                    </td>
                    <td>
                    	<div class="part part6"><h3>申请国家励志奖学金</h3>
                        	<div class="request">
                            	<p>前提：必须是贫困生，且上学年没有挂科</p>
        						<p>申请方式：提交“国家励志奖学金申请表”<br />（Word文档）</p>
                                <br />
                            	<button class="btn btn-danger apply"toggle="申请国家励志奖学金">申请</button>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
            
        	<div class="panel panel-primary" id="applyDiv">
              <button type="button" class="close"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
              <div class="panel-heading"></div>
              <div class="panel-body">
              <%-- <form id="addForm" action="<c:url value='/fillform.gdou' />" method="post">
              
                </form> --%>
              <form id="applyForm" action="<c:url value='/applySubmit.gdou' />" method="post" enctype="multipart/form-data" name="applyForm" >
                <label for="file">选择对应的文档上传：</label><br />
                <!-- 申请类型：:0：申请为贫困生。
                	 1：国家助学金
                	 2：国家奖学金
                	 3：勤工岗位
                	 4：助学贷款
                	 5：国家励志奖学金
                -->
                <input type="hidden" id="applyType" name="applyType" value="0"/>
                <input type="file" id="applyWord" name="applyWord"/>
                <%-- <s:file name="applyWord" label="选择文件" /> --%>
                <!-- 贫困生添加框 -->
                <div id="add_1">
                	家庭人口数<input type='text'  name="homenumber" ></input><br/>
                	家庭户口类型<input type='text' id='addText3' name="householdType" ></input><br/>
                	人均月收入<input type='text' id='addText4' name="perMonthlyIncome"></input><br />
                	家庭月收入<input type='text' id='addText2' name="everybodyGet"></input><br />
                	收入来源<input type='text' id='addText2' name="sourceIncome"></input><br/>
                	备注<input type='text' id='addText2' name="comment"></input><br/>
                </div>
                <!-- 勤工岗位添加框 -->
                <div id="add_2">
                	申请的工作地点<input type='text' name="aworkplace" ></input><br/>
                	工资要求<input type='text'  name="salary" ></input><br/>
                	是否服从安排<input type='text'  name="arrangement" ></input><br/>
                </div>
                <!-- 助学贷款 -->
                <div id="add_3">
                	贷款金额<input type="text" name="loansmoney"/>
                </div>
                <br />
                <div style="text-align:center;">
                	<button type="button" class="btn btn-info btn-sm" id="applySubmitBtn">提交</button>&nbsp;&nbsp;&nbsp;
                	<button type="button" class="btn btn-info btn-sm" id="cancel">取消</button>
                </div>
              </form>
              </div>
            </div>
            
        </div>
        <!-- 首页模块-->
        <!-- 通知告示模块-->
        <div class="attention" id="attention">
        	<h2 align="center">通知告示</h2>
            <br />
            <div style="background:white;" id="list"> 
            	<table class="table table-striped">
                	<tr>
                    	<th>标题</th><th>时间</th>
                        
                    </tr>
                    <tr>
                    	<td><a href="#" onclick="showDetail()">关于国庆放假的通知</a></td><td>2014-09-16</td>
                    </tr>
                    <tr>
                    	<td><a href="#" onclick="showDetail()">关于国庆放假的通知</a></td><td>2014-09-16</td>
                    </tr>
                    <tr>
                    	<td><a href="#" onclick="showDetail()">关于国庆放假的通知</a></td><td>2014-09-16</td>
                    </tr>
                    <tr>
                    	<td><a href="#" onclick="showDetail()">关于国庆放假的通知</a></td><td>2014-09-16</td>
                    </tr>
                </table>
            </div>
            
        </div>
        <!--内容-->
        <div id="detail">
            	<h3 align="center">关于国庆放假的通知</h3>
                <br />
                <p align="center">作者：<span>教务处</span><time>2014-09-18</time></p>
                <hr / style="margin:1em;">
                <p>
                	为任意 标签添加 .table 类可以为其赋予基本的样式 — 少量的内补（padding）和水平方向的分隔线。这种方式看起来很多余！？但是我们觉得，表格元素使用的很广泛，如果我们为其赋予默认样式可能会影响例如日历和日期选择之类的插件，所以我们选择将此样式独立出来。
                </p>
                <p>
                	为任意 标签添加 .table 类可以为其赋予基本的样式 — 少量的内补（padding）和水平方向的分隔线。这种方式看起来很多余！？但是我们觉得，表格元素使用的很广泛，如果我们为其赋予默认样式可能会影响例如日历和日期选择之类的插件，所以我们选择将此样式独立出来。
                </p>
                <p>
                	为任意 标签添加 .table 类可以为其赋予基本的样式 — 少量的内补（padding）和水平方向的分隔线。这种方式看起来很多余！？但是我们觉得，表格元素使用的很广泛，如果我们为其赋予默认样式可能会影响例如日历和日期选择之类的插件，所以我们选择将此样式独立出来。
                </p>
                <p>
                	为任意 标签添加 .table 类可以为其赋予基本的样式 — 少量的内补（padding）和水平方向的分隔线。这种方式看起来很多余！？但是我们觉得，表格元素使用的很广泛，如果我们为其赋予默认样式可能会影响例如日历和日期选择之类的插件，所以我们选择将此样式独立出来。
                </p>
                <p>
                	为任意 标签添加 .table 类可以为其赋予基本的样式 — 少量的内补（padding）和水平方向的分隔线。这种方式看起来很多余！？但是我们觉得，表格元素使用的很广泛，如果我们为其赋予默认样式可能会影响例如日历和日期选择之类的插件，所以我们选择将此样式独立出来。
                </p>
                <p>
                	为任意 标签添加 .table 类可以为其赋予基本的样式 — 少量的内补（padding）和水平方向的分隔线。这种方式看起来很多余！？但是我们觉得，表格元素使用的很广泛，如果我们为其赋予默认样式可能会影响例如日历和日期选择之类的插件，所以我们选择将此样式独立出来。
                </p>
                <p>
                	为任意 标签添加 .table 类可以为其赋予基本的样式 — 少量的内补（padding）和水平方向的分隔线。这种方式看起来很多余！？但是我们觉得，表格元素使用的很广泛，如果我们为其赋予默认样式可能会影响例如日历和日期选择之类的插件，所以我们选择将此样式独立出来。
                </p>
                <p>
                	为任意 标签添加 .table 类可以为其赋予基本的样式 — 少量的内补（padding）和水平方向的分隔线。这种方式看起来很多余！？但是我们觉得，表格元素使用的很广泛，如果我们为其赋予默认样式可能会影响例如日历和日期选择之类的插件，所以我们选择将此样式独立出来。
                </p>
                <p>
                	为任意 标签添加 .table 类可以为其赋予基本的样式 — 少量的内补（padding）和水平方向的分隔线。这种方式看起来很多余！？但是我们觉得，表格元素使用的很广泛，如果我们为其赋予默认样式可能会影响例如日历和日期选择之类的插件，所以我们选择将此样式独立出来。
                </p>
            </div>
        <!-- 通知告示模块-->
       <!-- 下载文档模块-->
        <div class="download" id="download">
        	<h2 align="center">下载文档</h2>
            <br />
            <div style="background:white;">
              	<table class="table table-striped" id="mytable">
            		<thead>
            		<tr>
            		<th>序号</th>
                	<th>文档名称</th>
                	<th>操作</th>
                    
                	</tr>
                	</thead>
                	<tbody>
                	</tbody>
            	</table>
<!--             <table class="table table-striped">
            	<tr>
                	<th>文档名称</th><th>操作</th>
                </tr>
                <tr>
                	<td>申请国家助学金文档</td><td><a href="#">下载</a></td>
                </tr>
                <tr>
                	<td>申请国家奖学金文档</td><td><a href="#">下载</a></td>
                </tr>
                <tr>
                	<td>申请国家励志奖学金文档</td><td><a href="#">下载</a></td>
                </tr>
                <tr>
                	<td>申请国家助学贷款文档</td><td><a href="#">下载</a></td>
                </tr>
                <tr>
                	<td>申请国家勤工助学文档</td><td><a href="#">下载</a></td>
                </tr>
                
            </table> -->
            </div>
        </div>
        <!-- 下载文档模块-->
    </div>
    <div class="footer">
    	<p>版权所有：广东省湛江市&nbsp;&nbsp;&nbsp;广东海洋大学</p>
    </div>
</div>
</div>
<!-- 修改密码 -->
<div id="panel1">
	<div class="panel1-heading"></div>
	<form>
		<span>旧密码:</span><input type="password" id="oldpass"/><br/>
		<span>新密码:</span><input type="password" id="newpass"/><br/>
		<span>新密码:</span><input type="password" id="newpass1"/>
	</form>
	 <div style="text-align:center;">
              <button type="button" class="btn btn-info btn-sm" id="panel1_sub">提交</button>&nbsp;&nbsp;&nbsp;
              <button type="button" class="btn btn-info btn-sm" id="panel1_cal" >取消</button>
     </div>
</div>
</body>
</html>
