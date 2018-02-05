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
    <title>权限修改</title>
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
                        <strong>修改权限</strong>
                        <button type="button" class="btn btn-danger authority-add-cancel pull-right" style="margin-top: -8px">取消</button>
                    </h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <form action="authority/update" method="post" >
                                <div class="form-group">
                                    <label for="resId">权限编号</label>
                                    <input type="text" class="form-control" name="resId" id="resId" value="${authority.resId}" readonly placeholder="权限编号">
                                </div>
                                <div class="form-group">
                                    <label for="rname">权限名称</label>
                                    <input type="text" class="form-control" name="rname" id="rname" value="${authority.rname}" placeholder="权限名称">
                                </div>
                                <div class="form-group">
                                    <label for="href">权限路径</label>
                                    <input type="text" class="form-control" name="href" id="href" value="${authority.href}" placeholder="权限路径">
                                </div>
                                <div class="form-group">
                                    <label for="title">权限标题</label>
                                    <input type="text" class="form-control" name="title" id="title" value="${authority.title}" placeholder="权限标题">
                                </div>
                                <div class="form-group">
                                    <label for="target">权限目的</label>
                                    <input type="text" class="form-control" name="target" id="target" value="${authority.rname}" placeholder="权限目的">
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">显示</label>
                                    <div class="col-sm-10">
                                        <label class="radio-inline">
                                            <input type="radio" name="shown" id="shown1" value="1" ${authority.shown==1?"checked":""}> 显示
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="shown" id="shown2" value="0" ${authority.shown==0?"checked":""}> 隐藏
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">启用</label>
                                    <div class="col-sm-10">
                                        <label class="radio-inline">
                                            <input type="radio" name="enabled" id="enabled1" value="1" ${authority.enabled==1?"checked":""}> 启用
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="enabled" id="enabled2" value="0" ${authority.enabled==0?"checked":""}> 禁用
                                        </label>
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
                                    <button class="btn btn-warning btn-block dept-reset">重置</button>
                                </div>
                                <div class="col-md-6">
                                    <button class="btn btn-success btn-block dept-submit">修改</button>
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
    $(".dept-add-cancel").on("click",function () {
       location="dept";
    });

    $(".dept-submit").on("click",function(){
       $("form").submit();
    });

    $(".dept-reset").on("click",function(){
        $("form").get(0).reset();
    });
</script>
</html>
