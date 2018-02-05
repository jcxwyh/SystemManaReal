<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>权限添加</title>
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
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <strong>添加权限</strong>
                        <button type="button" class="btn btn-danger authority-add-cancel pull-right" style="margin-top: -8px">取消</button>
                    </h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <form action="authority/add" method="post" >
                                <div class="form-group">
                                    <label for="rname">部门名称</label>
                                    <input type="text" class="form-control" name="rname" id="rname" placeholder="权限名称">
                                </div>
                                <div class="form-group">
                                    <label for="title">部门标题</label>
                                    <input type="text" class="form-control" name="title" id="title" placeholder="权限标题">
                                </div>
                                <div class="form-group">
                                    <label for="href">权限路径</label>
                                    <input type="text" class="form-control" name="href" id="href" placeholder="路径">
                                </div>
                                <div class="form-group">
                                    <label for="target">权限目的</label>
                                    <input type="text" class="form-control" name="target" id="target" placeholder="路径">
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">显示</label>
                                    <div class="col-sm-10">
                                        <label class="radio-inline">
                                            <input type="radio" name="shown" id="shown1" value="1" checked> 显示
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="shown" id="shown2" value="0"> 隐藏
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">启用</label>
                                    <div class="col-sm-10">
                                        <label class="radio-inline">
                                            <input type="radio" name="enabled" id="enabled1" value="1" checked> 启用
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="enabled" id="enabled2" value="0"> 禁用
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="target">权限目的</label>
                                    <div class="">
                                        <textarea id="cdesc" name="target" class="form-control" rows="2"></textarea>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <div class="row">
                                <div class="col-md-6">
                                    <button class="btn btn-warning btn-block authority-reset">重置</button>
                                </div>
                                <div class="col-md-6">
                                    <button class="btn btn-success btn-block authority-submit">添加</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../component/footer.jsp"></jsp:include>
</body>
<script src="assets/js/jquery-1.12.3.js"></script>
<script src="assets/js/bootstrap.js"></script>
<script>
    $(".authority-add-cancel").on("click",function () {
       location="authority";
    });

    $(".authority-submit").on("click",function(){
       $("form").submit();
    });

    $(".authority-reset").on("click",function(){
        $("form").get(0).reset();
    });
</script>
</html>
