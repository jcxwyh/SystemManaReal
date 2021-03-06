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
    <title>菜单修改</title>
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
                        <strong>修改菜单</strong>
                        <button type="button" class="btn btn-danger menu-edit-cancel pull-right" style="margin-top: -8px">取消</button>
                    </h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <form class="form-horizontal" action="menu/update" method="post">
                                <div class="form-group">
                                    <label for="resId" class="col-sm-2 control-label">菜单编号</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" value="${menu.resId}" name="resId" id="resId" placeholder="请输入菜单编号">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="rname" class="col-sm-2 control-label">菜单名</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control"value="${menu.rname}" name="rname" id="rname" placeholder="请输入菜单名">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="href" class="col-sm-2 control-label">菜单地址</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="href" id="href" value="${menu.href}" placeholder="请输入菜单地址">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="target" class="col-sm-2 control-label">菜单目的</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="target" id="target" value="${menu.href}" placeholder="请输入菜单目的">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="parent" class="col-sm-2 control-label">父级菜单</label>
                                    <div class="col-sm-10">
                                        <select name="parent" id="parent" class="form-control">
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">显示</label>
                                    <div class="col-sm-10">
                                        <label class="radio-inline">
                                            <input type="radio" name="shown" id="shown1" value="1" ${menu.shown==1?"checked":""}> 显示
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="shown" id="shown2" value="0" ${menu.shown==0?"checked":""}> 隐藏
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">启用</label>
                                    <div class="col-sm-10">
                                        <label class="radio-inline">
                                            <input type="radio" name="enabled" id="enabled1" value="1" ${menu.enabled==1?"checked":""}> 启用
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="enabled" id="enabled2" value="0" ${menu.enabled==0?"checked":""}> 禁用
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
                                    <button class="btn btn-warning btn-block menu-reset">重置</button>
                                </div>
                                <div class="col-md-6">
                                    <button class="btn btn-success btn-block menu-submit">修改</button>
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
    $(".menu-edit-cancel").on("click",function () {
       location="menu";
    });

    $(".menu-submit").on("click",function(){
       $("form").submit();
    });

    $(".menu-reset").on("click",function(){
        $("form").get(0).reset();
    });
</script>
</html>
