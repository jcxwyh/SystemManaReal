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
    <title>角色管理</title>
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
                        <strong>角色列表</strong>
                        <button type="button" class="btn btn-success pull-right role-add-btn" style="margin-top:-8px" data-href="role/add">添加角色</button>
                    </h3>
                </div>
                <div class="panel-body">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>角色编号</th>
                                <th>角色名称</th>
                                <th>constant</th>
                                <th>状态</th>
                                <th>描述</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody class="role-tbody">
                            <c:choose>
                                <c:when test="${roles.size()>0}">
                                    <c:forEach items="${roles}" var="role">
                                        <tr>
                                            <td>${role.roleId}</td>
                                            <td><button class="btn btn-xs btn-link show-resource">${role.rname}</button></td>
                                            <td>${role.constant}</td>
                                            <td>
                                                <span class="label ${role.enabled==1?'label-success':'label-danger'}">${role.enabled==1?'启用':'禁用'}</span>
                                            </td>
                                            <td>${role.description}</td>
                                            <td>
                                                <button type="button" class="btn btn-info btn-xs role-menu" data-userid="${user.userId}">分配菜单</button>
                                                <button type="button" class="btn btn-primary btn-xs role-auth" data-userid="${user.userId}">分配权限</button>
                                                <button type="button" class="btn btn-warning btn-xs role-edit" data-roleid="${role.roleId}">修改</button>
                                                <button type="button" class="btn btn-danger btn-xs role-delete" data-roleid="${role.roleId}">删除</button>
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
    $(".role-add-btn").on("click",function(){
       location=$(this).data("href");
    });

    $(".role-tbody").on("click",".role-edit",function(){
        location="role/update/"+$(this).data("roleid");
    });
    $(".role-tbody").on("click",".role-delete",function(){
        location="role/delete/"+$(this).data("roleid");
    });
</script>
</html>
