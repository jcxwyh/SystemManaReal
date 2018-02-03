<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>左侧菜单</title>
		<base href="<%=basePath%>" >
		<link rel="stylesheet"  href="assets/css/bootstrap.css" />
		<link rel="stylesheet"  href="//at.alicdn.com/t/font_562947_adwokb7tn2vs4i.css" />
	</head>
	<body>
		<div class="panel panel-default">
		  <div class="panel-heading">
		    <h3 class="panel-title"><span class=" glyphicon glyphicon-th"></span> 菜单</h3>
		  </div>
		  <div class="list-group">
			  <a href="system" class="list-group-item">
			    <span class=" glyphicon glyphicon-home"></span> 首页
			  </a>
			  <a href="#" class="list-group-item">公司管理</a>
			  <a href="#" class="list-group-item">部门管理</a>
			  <a href="#" class="list-group-item">员工管理</a>
			  <a href="#" class="list-group-item">菜单管理</a>
			  <a href="#" class="list-group-item">角色管理</a>
			  <a href="#" class="list-group-item">权限管理</a>
		  </div>
		</div>
	</body>
	<script src="assets/js/jquery-1.12.3.js"></script>
	<script src="assets/js/bootstrap.js"></script>
</html>