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
    <style>
        .navbar-brand{
            cursor:pointer;
        }
    </style>

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
                        <strong>部门列表</strong>
                        <button type="button" class="btn btn-success pull-right dept-add-btn" style="margin-top:-8px" data-href="dept/add">添加部门</button>
                    </h3>
                </div>
                <div class="panel-body">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>部门编号</th>
                                <th>部门名称</th>
                                <th>部门描述</th>
                                <th>所属公司</th>
                                <th>公司描述</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody class="dept-tbody">
                            <c:choose>
                                <c:when test="${depts.size()>0}">
                                    <c:forEach items="${depts}" var="dept">
                                        <tr>
                                            <td>${dept.deptno}</td>
                                            <td>${dept.dname}</td>
                                            <td>${dept.ddesc}</td>
                                            <td>${dept.cname}</td>
                                            <td>${dept.cdesc}</td>
                                            <td>
                                                <button type="button" class="btn btn-warning btn-sm dept-edit" data-deptno="${dept.deptno}">修改</button>
                                                <button type="button" class="btn btn-danger btn-sm dept-delete" data-deptno="${dept.deptno}">删除</button>
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
    $(".dept-add-btn").on("click",function(){
       location=$(this).data("href");
    });

    $(".dept-tbody").on("click",".dept-edit",function(){
        location="dept/update/"+$(this).data("deptno");
    });
    $(".dept-tbody").on("click",".dept-delete",function(){
        location="dept/delete/"+$(this).data("deptno");
    });
</script>
</html>
