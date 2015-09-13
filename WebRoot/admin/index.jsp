<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="${adminPath}">
<title>学生工作管理系统-后台管理</title>
<link rel="stylesheet"  type="text/css" href="../js/themes/default/easyui.css"></link>
<link rel="stylesheet"  type="text/css" href="../js/themes/icon.css"></link>
<link rel="stylesheet" type="text/css" href="../css/reset.css"></link>
<link rel="stylesheet" type="text/css" href="../css/admin_style.css"></link>
<link rel="stylesheet" type="text/css" href="../css/generic.css"></link>
<script type="text/javascript" src="../js/jquery-1.8.3.min.js" ></script>
<script type="text/javascript" src="../js/jquery.easyui.min.js" ></script>
<script type="text/javascript" src="../js/easyui-lang-zh_CN.js" ></script>
<script type="text/javascript" src="../js/mainFrame.js" ></script>
<script type="text/javascript" src="../js/adminIndex.js" ></script>
<script type="text/javascript">
	var basePath = "${basePath}";
	var adminPath = "${adminPath}";
</script>
</head>

<body class="easyui-layout">   
    <!-- 顶部部分 -->
    <div data-options="region:'north'" style="width:800px;height:132px;" class="header">
        <img alt="广东海洋大学" src="<c:url value='/img/header1.png'/>" style="width:1000px;height:100px;" />
        <div class="tip">
                      当前用户：<span style="color:blue;">${user.username}</span> &nbsp;&nbsp;&nbsp;&nbsp;
                      角色：
           <c:choose>
				<c:when test="${user.roleId == 0}">
					<span style="color:blue;">超级管理员</span>
				</c:when>
				<c:when test="${user.roleId == 1}">
					<span style="color:blue;">院级管理员</span>
				</c:when>
				<c:otherwise>
					<span style="color:blue;">专业级管理员</span>
				</c:otherwise>
			</c:choose>&nbsp;&nbsp;&nbsp;&nbsp;      
			管辖范围：<span style="color:blue;">${user.subjectName}</span>&nbsp;&nbsp;&nbsp;&nbsp;           
           <a href="<c:url value='/adminExit.gdou' />" class="easyui-linkbutton" iconCls="icon-remove" plain="true" style="float:right;">退出系统</a>
           <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editPassword()" style="float:right;">修改密码</a>
        </div>
    </div>    
    
    <!-- 左边部分 -->
    <div data-options="region:'west'" style="width:200px;">
        <!--分类面板内容 -->
        <div id="aa" class="easyui-accordion">   
        
            <c:forEach items="${menus}" var="m">
	            <c:if test="${m.key== 'system'}">
	                <div title="系统管理" style="overflow:auto;padding:10px;">   
	                    <ul class="menu_list">
	                        <c:forEach items="${m.value}" var="menu">
	                            <li><a target="mainFrame" href="${menu.menuUrl}">${menu.description}</a></li>
	                        </c:forEach>
	                    </ul>   
	                </div>   
	            </c:if>
	        </c:forEach>
	        
            <c:forEach items="${menus}" var="m">
	            <c:if test="${m.key== 'yard'}">
	                <div title="宿舍管理" style="overflow:auto;padding:10px;">   
	                    <ul class="menu_list">
	                        <c:forEach items="${m.value}" var="menu">
	                            <li><a target="mainFrame" href="${menu.menuUrl}">${menu.description}</a></li>
	                        </c:forEach>
	                    </ul>   
	                </div>   
	            </c:if>
	        </c:forEach>
	        
	        <c:forEach items="${menus}" var="m">
                <c:if test="${m.key== 'base'}">
                    <div title="综合管理" style="overflow:auto;padding:10px;">   
                        <ul class="menu_list">
                            <c:forEach items="${m.value}" var="menu">
                                <li><a target="mainFrame" href="${menu.menuUrl}">${menu.description}</a></li>
                            </c:forEach>
                        </ul>   
                    </div>   
                </c:if>
            </c:forEach>
            
            <c:forEach items="${menus}" var="m">
                <c:if test="${m.key== 'scholarships'}">
                    <div title="奖学金管理" style="overflow:auto;padding:10px;">   
                        <ul class="menu_list">
                            <c:forEach items="${m.value}" var="menu">
                                <li><a target="mainFrame" href="${menu.menuUrl}" >${menu.description}</a></li>
                            </c:forEach>
                        </ul>   
                    </div>   
                </c:if>
            </c:forEach>
            
            <c:forEach items="${menus}" var="m">
                <c:if test="${m.key== 'workstudy'}">
                    <div title="勤工助学管理" style="overflow:auto;padding:10px;" >   
                        <ul class="menu_list">
                            <c:forEach items="${m.value}" var="menu">
								<li ><a target="mainFrame" href="${menu.menuUrl}" >${menu.description}</a>
							</c:forEach>
                        </ul>   
                    </div>   
                </c:if>
            </c:forEach>
            <c:forEach items="${menus}" var="m">
                <c:if test="${m.key=='conductpoints'}">
                    <div title="操行分管理" style="overflow:auto;padding:10px;">   
                        <ul class="menu_list">
                            <c:forEach items="${m.value}" var="menu">
                                <li><a target="mainFrame" href="${menu.menuUrl}">${menu.description}</a></li>
                            </c:forEach>
                        </ul>   
                    </div>   
                </c:if>
            </c:forEach>
            
            <c:forEach items="${menus}" var="m">
                <c:if test="${m.key== 'party'}">
                    <div title="党务管理" style="overflow:auto;padding:10px;">   
                        <ul class="menu_list">
                            <c:forEach items="${m.value}" var="menu">
                                <li><a target="mainFrame" href="${menu.menuUrl}">${menu.description}</a></li>
                            </c:forEach>
                        </ul>   
                    </div>   
                </c:if>
            </c:forEach>
            
            <c:forEach items="${menus}" var="m">
                <c:if test="${m.key== 'other'}">
                    <div title="其他功能" style="overflow:auto;padding:10px;">   
                        <ul class="menu_list">
                            <c:forEach items="${m.value}" var="menu">
                                <li><a target="mainFrame" href="${menu.menuUrl}">${menu.description}</a></li>
                            </c:forEach>
                        </ul>   
                    </div>   
                </c:if>
            </c:forEach>
            
          
        </div>  

    </div> 
      
    <!-- 中间部分 -->
    <div region="center" id="mainPanle" style="background: #eee;overflow:hidden;">
        <div id="tabs" class="easyui-tabs" fit="true" border="false">
            <div title="主页" style="padding: 20px;" id="home">
                <h1>
                                        通知：从明天起，全校放假一星期
                </h1>
            </div>
        </div>
    </div>
    
    <!-- 底部部分 -->
    <div region="south" style="height: 20px; background: #D2E0F2;">
        <div style="text-align: center;">
            <center>&copy;广东海洋大学&nbsp;&nbsp;信息学院&nbsp;&nbsp;学生工作管理系统 2014</center>
        </div>
    </div> 
    
    <!-- 修改密码的弹出框-->
    <div id="dlg_editPwd" class="easyui-dialog" style="width:400px;height:380px;padding:10px 20px"
            closed="true" buttons="#ceditPwd_dlg-buttons">
        <div class="ftitle">管理员信息</div>
        <form id="editForm" method="post" novalidate>
            <div class="fitem">
                <label>原密码:</label>
                <input name="oldPassword" type="password" required="true" />
            </div>                
            <div class="fitem">
                <label>新密码:</label>
                <input id="newPassword" name="newPassword" validType="length[8,16]"
                 type="password" class="easyui-validatebox" required="true"/>
            </div>                
            <div class="fitem">
                <label>确认新密码:</label>
                <input name="repassword" type="password" required="true" class="easyui-validatebox" 
                validType="equalTo['#newPassword']" invalidMessage="两次输入密码不一致！"/>
            </div>                
        </form>
    </div>
    <!-- 弹出框按钮-->
    <div id="ceditPwd_dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveChangedPwd()">修改</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg_editPwd').dialog('close')">取消</a>
    </div>
</body> 
</html>
