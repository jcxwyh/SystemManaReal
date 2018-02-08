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
    <title>权限管理</title>
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
                <jsp:param name="active" value="权限管理"></jsp:param>
            </jsp:include>
        </div>

        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <strong>权限列表</strong>
                        <%--<button type="button" class="btn btn-success pull-right authority-add-btn" style="margin-top:-8px" data-href="authority/add">添加权限</button>--%>
                    </h3>
                </div>
                <div class="panel-body">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>权限编号</th>
                                <th>权限名称</th>
                                <th>权限标题</th>
                                <th>权限目的</th>
                                <th>权限状态</th>
                            </tr>
                        </thead>
                        <tbody class="authority-tbody">
                            <c:choose>
                                <c:when test="${authorities.size()>0}">
                                    <c:forEach items="${authorities}" var="authority">
                                        <tr>
                                            <td>${authority.resId}</td>
                                            <td>${authority.rname}</td>
                                            <td>${authority.title}</td>
                                            <td>${authority.target}</td>
                                            <td>
                                                <span class="label ${authority.shown==1?'label-primary':'label-warning'}">${authority.shown==1?'显示':'隐藏'}</span>
                                                <span class="label ${authority.enabled==1?'label-success':'label-danger'}">${authority.enabled==1?'启用':'禁用'}</span>
                                            </td>
                                            <%--<td>--%>
                                                <%--<button type="button" class="btn btn-warning btn-xs authority-edit" data-resid="${authority.resId}">修改</button>--%>
                                                <%--<button type="button" class="btn btn-danger btn-xs authority-delete" data-resid="${authority.resId}">删除</button>--%>
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
            </div>
        </div>
    </div>
</div>
<jsp:include page="../component/footer.jsp"></jsp:include>
</body>
<script src="assets/js/jquery-1.12.3.js"></script>
<script src="assets/js/bootstrap.js"></script>
<script>
    $(".authority-add-btn").on("click",function(){
       location=$(this).data("href");
    });

    // $(".authority-tbody").on("click",".authority-edit",function(){
    //     location="authority/update/"+$(this).data("resid");
    // });
    // $(".authority-tbody").on("click",".authority-delete",function(){
    //     location="authority/delete/"+$(this).data("resid");
    // });
</script>
</html>
