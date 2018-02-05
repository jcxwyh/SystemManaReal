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
                                            <td><button class="btn btn-xs btn-link show-emp">${dept.dname}</button></td>
                                            <td>${dept.ddesc}</td>
                                            <td>${dept.cname}</td>
                                            <td>${dept.cdesc}</td>
                                            <td>
                                                <button type="button" class="btn btn-warning btn-xs dept-edit" data-deptno="${dept.deptno}">修改</button>
                                                <button type="button" class="btn btn-danger btn-xs dept-delete" data-deptno="${dept.deptno}">删除</button>
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

<!-- 删除选择方式 -->
<div class="modal fade" id="del-dept-model" tabindex="-1" role="dialog" aria-labelledby="model1">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="model1">删除确认</h4>
            </div>
            <div class="modal-body">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary del-confirm" >确认删除</button>
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
        var deptno = $(this).data("deptno");
        $.ajax({
            url:"dept/valiUser",
            data:"deptno="+deptno,
            type:"post",
            async:false,
            success:function(res){
                console.log(res);
                $("#del-dept-model").modal("toggle");
                $("#del-dept-model .modal-body").empty();
                $(".del-confirm").data("deptno",deptno);
                if(res){
                    $("#del-dept-model .modal-body").append("<h4>此部门中还有员工数据！请选择删除模式：</h4><input type='radio' value='1' name='mode' checked>级联删除&nbsp;<input type='radio' name='mode' value='2'>外键置空");
                }else{
                    $("#del-dept-model .modal-body").append("<h4>此部门中没有员工，是否直接删除?</h4><input type='radio' value='0' checked style='display:none'>");
                }
            }
        });
    });
    $(".del-confirm").on("click",function(){
        //alert("dept/delete/"+$(this).data("deptno")+"/"+$("#del-dept-model .modal-body input[type=radio]:checked").val());
        location="dept/delete/"+$(this).data("deptno")+"/"+$("#del-dept-model .modal-body input[type=radio]:checked").val();
    });
</script>
</html>
