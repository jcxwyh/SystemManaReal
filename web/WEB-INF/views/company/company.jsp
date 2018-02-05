<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>公司管理</title>
		<base href="<%=basePath%>" >
		<link rel="stylesheet"  href="assets/css/bootstrap.css" />
		<link rel="stylesheet"  href="//at.alicdn.com/t/font_562947_adwokb7tn2vs4i.css" />
	</head>
	<body>
		
		<jsp:include page="../component/nav.jsp"></jsp:include>
		
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-2">
					<jsp:include page="../component/left.jsp"></jsp:include>
				</div>
				
				<div class="col-md-10">
					<div class="jumbotron text-center"  style="background-color:white">
					  <h1>公司管理</h1>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../component/footer.jsp"></jsp:include>
	</body>
	<script src="assets/js/jquery-1.12.3.js"></script>
	<script src="assets/js/bootstrap.js"></script>
	
</html>