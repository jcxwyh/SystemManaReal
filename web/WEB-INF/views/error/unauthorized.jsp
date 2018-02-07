<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Unauthorized</title>
    <base href="<%=basePath%>">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.js"></script>
    <style>
        @keyframes gun1{
            from{font-size:10px}
            to{font-size:120px}
        }
        @keyframes gun2{
            from{font-size:120px}
            to{font-size:10px}
        }
        .biger{
            animation: gun1 1s;
        }
        .smaller{
            animation: gun2 1s;
        }
    </style>
</head>
<body style="width:100%;height:100%;overflow: hidden">
    <div style="position:absolute;width:100%;height:100%;">
        <div style="width:1em;margin:0 auto;padding-top:15%;padding-bottom:0.5em;font-size: 28px;font-family:'幼圆';" ><b style="cursor:pointer" id="info">无权到此一游</b></div>
        <div style="width:380px;margin:0 auto;font-size: 18px;font-family:'幼圆';" ><i>${exception}</i></div>
    </div>
</body>
<script>
    setInterval(function(){
        var newColor="rgba("+Math.floor(Math.random()*256)+","+Math.floor(Math.random()*256)+","+Math.floor(Math.random()*256)+","+Math.random()+")";
        $("#info").css("color",newColor);
    },500);

    $("#info").on("click",function(){
       history.go(-1);
    });
</script>
</html>