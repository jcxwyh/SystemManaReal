<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>404</title>
    <base href="<%=basePath%>">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.js"></script>
</head>
<body style="width:100%;height:100%;overflow: hidden">
<div style="position:absolute;width:100%;height:100%;">
    <div style="width:1em;margin:0 auto;padding-top:15%;padding-bottom:0.5em;font-size: 100px;font-family:'幼圆';" ><b style="cursor:pointer" id="info">404</b></div>
</div>
</body>
<script>
    $("#info").on("click",function(){
        history.go(-1);
    });
</script>
</html>