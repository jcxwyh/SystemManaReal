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
    <title>资源分配</title>
    <base href="<%=basePath%>" >
    <link rel="stylesheet"  href="assets/css/bootstrap.css" />
    <link rel="stylesheet"  href="//at.alicdn.com/t/font_562947_adwokb7tn2vs4i.css" />
    <link rel="stylesheet" href="assets/css/zTreeStyle/zTreeStyle.css"/>
</head>
<body>

<jsp:include page="../component/nav.jsp"></jsp:include>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
            <jsp:include page="../component/left.jsp">
                <jsp:param name="active" value="角色管理"></jsp:param>
            </jsp:include>
        </div>

        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <strong>资源分配</strong>
                        <button type="button" class="btn btn-danger btn-sm assign-resource-cancel pull-right" style="margin-top: -6px">取消</button>
                    </h3>
                </div>
                <div class="panel-body">
                    <div class="row" style="word-wrap:break-word;">
                        <form id="assign-form" action="role/assignResource/${role.roleId}" method="post">
                            <c:forEach items="${menus}" var="menu">
                                <div class="col-md-2">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" value="${menu.resId}" name="resList" ${role.resources.contains(menu)?"checked":""}/> ${menu.rname}
                                                </label>
                                            </div>
                                        </div>
                                        <div class="panel-body">
                                            <c:if test="${menu.resources.size()>0}">
                                                <c:forEach items="${menu.resources}" var="auth">
                                                    <c:if test="${auth.type==0}">
                                                        <div class="checkbox">
                                                            <label>
                                                                <input type="checkbox" value="${auth.resId}" name="resList" ${role.resources.contains(auth)?"checked":""}/> ${auth.rname}
                                                            </label>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </form>
                    </div>
                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <div class="row">
                                <div class="col-md-6">
                                    <button class="btn btn-warning btn-block assign-resource-reset">重置</button>
                                </div>
                                <div class="col-md-6">
                                    <button class="btn btn-success btn-block assign-resource-submit">分配</button>
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
<script src="assets/js/jquery.ztree.all.min.js"></script>
<script>
    $(".assign-resource-cancel").on("click",function () {
        history.go(-1);
    });

    $(".assign-resource-submit").on("click",function(){
       $("form").submit();
    });

    $(".assign-resource-reset").on("click",function(){
        $("form").get(0).reset();
    });
    //给菜单复选框绑定change事件
    //类似全选功能
    $("#assign-form .panel-heading").on("change","input[type=checkbox]",function(){
        $(this).parent().parent().parent().parent().find(".panel-body").find("input[type=checkbox]").prop("checked",$(this).prop("checked"));
    });
    //权限选择则菜单选中
    $("#assign-form .panel-body").on("change","input[type=checkbox]",function(){
        var flag=false;
        $(this).parent().parent().parent().find("input[type=checkbox]").each(function(){
            //alert($(this).prop("checked"));
            if($(this).prop("checked")){
                //有选中就是false
                flag=true;
            }
        })
        if(true){
            $(this).parent().parent().parent().parent().find(".panel-heading").find("input[type=checkbox]").prop("checked",flag);
        }
    });




    <%--//获取ztree节点数据填充--%>
    <%--$.ajax({--%>
        <%--url:"menu/getMenus",--%>
        <%--type:"get",--%>
        <%--success:function(res){--%>
            <%--console.log(res)--%>
            <%--//console.log($.type(res))--%>
            <%--// var setting = {--%>
            <%--//     data:{--%>
            <%--//         simpleData:{--%>
            <%--//             enable:true,--%>
            <%--//             id:'resource.resId',--%>
            <%--//             pid:'resId'--%>
            <%--//         },--%>
            <%--//         key:{--%>
            <%--//             checked:false,--%>
            <%--//             children:"rname",--%>
            <%--//             name:"resource.rname"--%>
            <%--//         }--%>
            <%--//     },--%>
            <%--//     check:{--%>
            <%--//         enable:true,--%>
            <%--//         chkStyle:'checkbox',--%>
            <%--//         chkboxType: { "Y": "p", "N": "s" }--%>
            <%--//     }--%>
            <%--// }--%>
            <%--//--%>
            <%--// $.fn.zTree.init($("#menu-list"),setting,res);--%>

            <%--$("#menu-list").empty();--%>
            <%--if($.type(res) ==="array" && res.length){--%>
                <%--$.each(res,function(i,o){--%>
                    <%--var flag = false;--%>
                    <%--$.each(o.roles,function(j,p){--%>
                        <%--if(p.roleId===${role.roleId}){--%>
                            <%--flag=true;--%>
                        <%--}--%>
                    <%--});--%>
                    <%--$("#menu-list").append("<div class='checkbox'><label><input type='checkbox' name='menuIds' value='"+o.resId+"' "+(flag?"checked":"")+">"+--%>
                                            <%--o.rname + "</label></div>");--%>
                <%--});--%>
            <%--}--%>
        <%--}--%>
    <%--});--%>
    <%--//填充权限--%>
    <%--(function(){--%>
        <%--$.ajax({--%>
            <%--url:"authority/getAuths",--%>
            <%--dataType:"json",--%>
            <%--type:"get",--%>
            <%--success:function(res){--%>
                <%--//console.log($.type(res))--%>
                <%--// var setting = {--%>
                <%--//     data:{--%>
                <%--//         simpleData:{--%>
                <%--//             enable:true,--%>
                <%--//             id:'resId',--%>
                <%--//             pId:'parent',--%>
                <%--//             rootPid:null--%>
                <%--//         }--%>
                <%--//     },--%>
                <%--//     check:{--%>
                <%--//         enable:true,--%>
                <%--//         chkStyle:'checkbox',--%>
                <%--//         chkboxType: { "Y": "p", "N": "s" }--%>
                <%--//     }--%>
                <%--// }--%>
                <%--//--%>
                <%--// $.fn.zTree.init($("#auth-list"),setting,res);--%>

                <%--$("#auth-list").empty();--%>
                <%--if($.type(res) ==="array" && res.length){--%>
                    <%--$.each(res,function(i,o){--%>
                        <%--var flag = false;--%>
                        <%--$.each(o.roles,function(j,p){--%>
                            <%--if(p.roleId===${role.roleId}){--%>
                                <%--flag=true;--%>
                            <%--}--%>
                        <%--});--%>
                        <%--$("#auth-list").append("<div class='checkbox'><label><input type='checkbox' name='authIds' value='"+o.resId+"' "+(flag?"checked":"")+">"+--%>
                            <%--o.rname + "</label></div>");--%>
                    <%--});--%>
                <%--}--%>
            <%--}--%>
        <%--});--%>
    <%--})()--%>

    <%--function iteratorList(){--%>

    <%--}--%>
</script>
</html>
