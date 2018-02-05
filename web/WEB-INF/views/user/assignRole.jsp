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
    <title>角色分配</title>
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
                        <strong>角色分配</strong>
                        <button type="button" class="btn btn-danger assign-role-cancel pull-right" style="margin-top: -8px">取消</button>
                    </h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <form class="form-horizontal" action="user/add" method="post">
                                <div class="form-group">
                                    <label for="uname" class="col-sm-2 control-label">用户名</label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" name="uname" id="uname" placeholder="请输入用户名">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-sm-2 control-label">密码</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" name="password" id="password" placeholder="请输入密码">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">邮箱</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="email" id="email" placeholder="请输入邮箱">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">性别</label>
                                    <div class="col-sm-10">
                                        <label class="radio-inline">
                                            <input type="radio" name="gender" id="gender1" value="1" checked> 男
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="gender" id="gender2" value="0"> 女
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">锁定</label>
                                    <div class="col-sm-10">
                                        <label class="radio-inline">
                                            <input type="radio" name="locked" id="locked1" value="1" checked> 解锁
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="locked" id="locked2" value="0"> 锁定
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
                                    <label for="description" class="col-sm-2 control-label">描述</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" name="description" id="description" rows="2"></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="dept" class="col-sm-2 control-label">部门</label>
                                    <div class="col-sm-10">
                                        <select name="dept.deptno" id="dept" class="form-control">
                                            <option value="0">-请选择部门-</option>
                                        </select>
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
                                    <button class="btn btn-warning btn-block user-reset">重置</button>
                                </div>
                                <div class="col-md-6">
                                    <button class="btn btn-success btn-block user-submit">添加</button>
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
    $(".assign-role-cancel").on("click",function () {
       location="user";
    });

    $(".user-submit").on("click",function(){
       $("form").submit();
    });

    $(".user-reset").on("click",function(){
        $("form").get(0).reset();
    });
    $.ajax({
        url:"dept/deptList",
        dataType:"json",
        type:"get",
        success:function(res){
            $.each(res,function(i,o){
                $("#dept").append("<option value='"+o.deptno+"'>"+o.dname+"</option>");
            });
        }
    });
</script>
</html>
