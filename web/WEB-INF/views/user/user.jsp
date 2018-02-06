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
                                <th>所属部门</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody class="user-tbody">
                            <c:choose>
                                <c:when test="${users.size()>0}">
                                    <c:forEach items="${users}" var="user">
                                        <c:if test="${user.uname!='admin'}">
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
                                                <td>${user.dept==null?"无":user.dept.dname}</td>
                                                <td>
                                                    <button type="button" class="btn btn-info btn-xs user-role" data-userid="${user.userId}">分配角色</button>
                                                    <button type="button" class="btn btn-warning btn-xs user-edit" data-userid="${user.userId}">修改</button>
                                                    <button type="button" class="btn btn-danger btn-xs user-delete" data-userid="${user.userId}">删除</button>
                                                </td>
                                            </tr>
                                        </c:if>
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


<!-- 显示分配角色的模态框 -->
<div class="modal fade" id="assign-role" tabindex="-1" role="dialog" aria-labelledby="assign-role-modal">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="assign-role-modal">分配角色</h4>
            </div>
            <div class="modal-body">
                <!-- 填充角色列表 ztree实现-->
                <form>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary assign-role-btn">分配</button>
            </div>
        </div>
    </div>
</div>

<!-- 显示该用户所拥有菜单及权限的模态框 -->


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

    $(".user-tbody").on("click",".user-role",function(){
        //弹出角色列表共选择
        $("#assign-role").modal("toggle");
        //获取ID
        var userId = $(this).data("userid");
        //置空表单
        $("#assign-role").find("form").empty();
        //给分配按钮绑定id
        $(".assign-role-btn").data("userid",userId);
        $.ajax({
            url:"user/getRoles",
            dataType:"json",
            success:function(res){
                if($.type(res)!=="array"||res.length){
                    $.each(res,function(i,o){
                        var flag = false;
                        $.each(o.users,function(j,p){
                            if(p.userId===userId){
                                flag=true;
                            }
                        });
                        if(o.rname!=='admin'){
                            $("#assign-role").find("form").append("<div class=\"checkbox\"><label><input type=\"checkbox\" name='roleIds' value='"+o.roleId+"' "+(flag?"checked":"")+">" +
                                o.rname + "</label></div>");
                        }
                    });
                }else{
                    $("#assign-role").find("form").append("<span>暂无角色</span>");
                }
            }
        });
    });

    $(".assign-role-btn").on("click",function(){
        var userId = $(this).data("userid");
        //alert($("#assign-role").find("form").serialize());
        alert(userId);
        $.ajax({
            url:"user/assign/"+userId,
            type:"post",
            data:$("#assign-role").find("form").serialize(),
            dataType:"json",
            success:function(res){
                console.log(res)
                $("#assign-role").modal("toggle");
            }
        });
        alert("aaa");
    });
</script>
</html>
