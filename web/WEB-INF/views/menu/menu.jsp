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
    <title>用户管理</title>
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
                        <strong>用户列表</strong>
                        <button type="button" class="btn btn-success pull-right user-add-btn" style="margin-top:-8px" data-href="user/add">添加用户</button>
                    </h3>
                </div>
                <div class="panel-body">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>用户编号</th>
                                <th>用户姓名</th>
                                <th>性别</th>
                                <th>邮箱</th>
                                <th>状态</th>
                                <th>描述</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody class="user-tbody">
                            <c:choose>
                                <c:when test="${users.size()>0}">
                                    <c:forEach items="${users}" var="user">
                                        <tr>
                                            <td>${user.userId}</td>
                                            <td>${user.uname}</td>
                                            <td>${user.gender==1?"男":"女"}</td>
                                            <td>${user.email}</td>
                                            <td>
                                                <span class="label ${user.locked==1?'label-primary':'label-warning'}">${user.locked==1?'解锁':'锁定'}</span>
                                                <span class="label ${user.enabled==1?'label-success':'label-danger'}">${user.enabled==1?'启用':'禁用'}</span>
                                            </td>
                                            <td>${user.description}</td>
                                            <td>
                                                <button type="button" class="btn btn-warning btn-xs user-edit" data-userid="${user.userId}">修改</button>
                                                <button type="button" class="btn btn-danger btn-xs user-delete" data-userid="${user.userId}">删除</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="6" class="text-center">暂无数据</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
                <div class="panel-footer">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li>
                                <a href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li>
                                <a href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
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
    $(".user-add-btn").on("click",function(){
       location=$(this).data("href");
    });

    $(".user-tbody").on("click",".user-edit",function(){
        location="user/update/"+$(this).data("userid");
    });
    $(".user-tbody").on("click",".user-delete",function(){
        location="user/delete/"+$(this).data("userid");
    });
</script>
</html>
