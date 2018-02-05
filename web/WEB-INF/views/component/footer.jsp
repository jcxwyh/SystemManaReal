<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<base href="<%=basePath%>" >
		<link rel="stylesheet"  href="assets/css/bootstrap.css" />
		<link rel="stylesheet"  href="//at.alicdn.com/t/font_562947_adwokb7tn2vs4i.css" />
	</head>
	<body>
		<footer class="footer navbar-fixed-bottom text-center" >Power By <strong><a href="http://e.cd-sxt.com/">CDSXT</a></strong> <span class="iconfont icon-zuojiantou"></span><span class="show-date"></span><span class="iconfont icon-youjiantou"></span></footer>
		
	</body>
	<script src="assets/js/jquery-1.12.3.js"></script>
	
	<script src="assets/js/moment.js"></script>
	<script>
		$(".show-date").html(moment(new Date().getTime()).format("YYYY年MM月DD日 HH时mm分ss秒"));
		setInterval(function(){
			//alert(new Date().getTime());
			$(".show-date").html(moment(new Date().getTime()).format("YYYY年MM月DD日 HH时mm分ss秒"));
		},1000);
	</script>
</html>