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
    <title>菜单管理</title>
    <base href="<%=basePath%>" >
    <link rel="stylesheet"  href="assets/css/bootstrap.css" />
    <link rel="stylesheet"  href="//at.alicdn.com/t/font_562947_adwokb7tn2vs4i.css" />
</head>
<body>

<jsp:include page="../component/nav.jsp"></jsp:include>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
            <jsp:include page="../component/left.jsp">
                <jsp:param name="res" value="资源管理"/>
                <jsp:param name="active" value="菜单管理"></jsp:param>
            </jsp:include>
        </div>

        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <strong>菜单列表</strong>
                        <%--<button type="button" class="btn btn-success pull-right menu-add-btn" style="margin-top:-8px" data-href="menu/add">添加菜单</button>--%>
                    </h3>
                </div>
                <div class="panel-body">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>菜单编号</th>
                                <th>菜单名称</th>
                                <th>菜单标题</th>
                                <th>菜单目的</th>
                                <th>状态</th>
                                <%--<th>操作</th>--%>
                            </tr>
                        </thead>
                        <tbody class="menu-tbody">
                            <c:choose>
                                <c:when test="${menus.size()>0}">
                                    <c:forEach items="${menus}" var="menu">
                                        <tr>
                                            <td>${menu.resId}</td>
                                            <td>${menu.rname}</td>
                                            <td>${menu.title}</td>
                                            <td>${menu.target}</td>
                                            <td>
                                                <span class="label ${menu.shown==1?'label-primary':'label-warning'}">${menu.shown==1?'解锁':'锁定'}</span>
                                                <span class="label ${menu.enabled==1?'label-success':'label-danger'}">${menu.enabled==1?'启用':'禁用'}</span>
                                            </td>
                                            <%--<td>--%>
                                                <%--<button type="button" class="btn btn-warning btn-xs menu-edit" data-resid="${menu.resId}">修改</button>--%>
                                                <%--<button type="button" class="btn btn-danger btn-xs menu-delete" data-resid="${menu.resId}">删除</button>--%>
                                            <%--</td>--%>
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
                <%--<div class="panel-footer">--%>
                    <%--<nav aria-label="Page navigation">--%>
                        <%--<ul class="pagination">--%>
                            <%--<li>--%>
                                <%--<a href="#" aria-label="Previous">--%>
                                    <%--<span aria-hidden="true">&laquo;</span>--%>
                                <%--</a>--%>
                            <%--</li>--%>
                            <%--<li><a href="#">1</a></li>--%>
                            <%--<li><a href="#">2</a></li>--%>
                            <%--<li><a href="#">3</a></li>--%>
                            <%--<li><a href="#">4</a></li>--%>
                            <%--<li><a href="#">5</a></li>--%>
                            <%--<li>--%>
                                <%--<a href="#" aria-label="Next">--%>
                                    <%--<span aria-hidden="true">&raquo;</span>--%>
                                <%--</a>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</nav>--%>
                <%--</div>--%>
            <%--</div>--%>
        </div>
    </div>
</div>
<jsp:include page="../component/footer.jsp"></jsp:include>
</body>
<script src="assets/js/jquery-1.12.3.js"></script>
<script src="assets/js/bootstrap.js"></script>
<script>
    $(".menu-add-btn").on("click",function(){
       location=$(this).data("href");
    });

    // $(".menu-tbody").on("click",".menu-edit",function(){
    //     location="menu/update/"+$(this).data("resid");
    // });
    // $(".menu-tbody").on("click",".menu-delete",function(){
    //     location="menu/delete/"+$(this).data("resid");
    // });
</script>
</html>
