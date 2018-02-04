<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>导航栏</title>
		<base href="<%=basePath%>" >
		<link rel="stylesheet"  href="assets/css/bootstrap.css" />
		<link rel="stylesheet"  href="//at.alicdn.com/t/font_562947_adwokb7tn2vs4i.css" />
	</head>
	<body>
		<nav class="navbar navbar-default" style="border-radius:0">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="#">系统管理</a>
		    </div>
		
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		        <li class="active"><a href="#">首页</a></li>
		        <li><a href="#">关于我们</a></li>
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">更多 <span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li><a href="#">公司风采</a></li>
		            <li><a href="#">真难想</a></li>
		            <li role="separator" class="divider"></li>
		            <li><a href="#">不管了</a></li>
		          </ul>
		        </li>
		      </ul>
		      
		      <ul class="nav navbar-nav navbar-right">
		        <li><a href="#">帮助文档</a></li>
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="iconfont icon-yonghutianchong"></span> ${login-user.uname } <span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li><a href="#">个人信息</a></li>
		            <li><a href="#">密码修改</a></li>
		            <li><a href="#">权限申请</a></li>
		            <li role="separator" class="divider"></li>
		            <li><a href="#">安全退出</a></li>
		          </ul>
		        </li>
		      </ul>
		    </div>
		  </div>
		</nav>
	</body>
	<script src="assets/js/jquery-1.12.3.js"></script>
	<script src="assets/js/bootstrap.js"></script>
</html>