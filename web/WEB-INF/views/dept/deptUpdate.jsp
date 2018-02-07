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
    <title>管理首页</title>
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
                        <strong>修改部门</strong>
                        <button type="button" class="btn btn-danger dept-add-cancel pull-right btn-sm" style="margin-top: -6px">取消</button>
                    </h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <form action="dept/update" method="post" >
                                <div class="form-group">
                                    <label for="deptno">部门编号</label>
                                    <input type="text" class="form-control" name="deptno" id="deptno" value="${dept.deptno}" readonly placeholder="部门编号">
                                </div>
                                <div class="form-group">
                                    <label for="dname">部门名称</label>
                                    <input type="text" class="form-control" name="dname" id="dname" value="${dept.dname}" placeholder="部门名称">
                                </div>
                                <div class="form-group">
                                    <label for="ddesc">部门描述</label>
                                    <div>
                                        <textarea id="ddesc" name="ddesc" class="form-control" rows="2">${dept.ddesc}</textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cname">公司名称</label>
                                    <input type="text" class="form-control" name="cname" id="cname" value="${dept.cname}" placeholder="公司名称">
                                </div>
                                <div class="form-group">
                                    <label for="cdesc">公司描述</label>
                                    <div class="">
                                        <textarea id="cdesc" name="cdesc" class="form-control" rows="2">${dept.ddesc}</textarea>
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
        history.go(-1);
    });

    $(".dept-submit").on("click",function(){
       $("form").submit();
    });

    $(".dept-reset").on("click",function(){
        $("form").get(0).reset();
    });
</script>
</html>
