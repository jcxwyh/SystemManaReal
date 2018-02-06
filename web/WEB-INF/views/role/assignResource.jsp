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
            <jsp:include page="../component/left.jsp"></jsp:include>
        </div>

        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <strong>资源分配</strong>
                        <button type="button" class="btn btn-danger assign-resource-cancel pull-right" style="margin-top: -8px">取消</button>
                    </h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                            <form class="form-horizontal" action="role/assignResource/${role.roleId}" method="post">
                                <div class="col-md-4 col-md-offset-2" >
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">分配菜单</h3>
                                        </div>
                                        <div class="panel-body">
                                            <div id="menu-list">

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">分配权限</h3>
                                        </div>
                                        <div class="panel-body">
                                            <div id="auth-list">

                                            </div>
                                        </div>
                                    </div>
                                </div>
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
       location="role";
    });

    $(".assign-resource-submit").on("click",function(){
       $("form").submit();
    });

    $(".assign-resource-reset").on("click",function(){
        $("form").get(0).reset();
    });

    //获取ztree节点数据填充
    $.ajax({
        url:"menu/getMenus",
        type:"get",
        success:function(res){
            console.log(res)
            //console.log($.type(res))
            // var setting = {
            //     data:{
            //         simpleData:{
            //             enable:true,
            //             id:'resource.resId',
            //             pid:'resId'
            //         },
            //         key:{
            //             checked:false,
            //             children:"rname",
            //             name:"resource.rname"
            //         }
            //     },
            //     check:{
            //         enable:true,
            //         chkStyle:'checkbox',
            //         chkboxType: { "Y": "p", "N": "s" }
            //     }
            // }
            //
            // $.fn.zTree.init($("#menu-list"),setting,res);

            $("#menu-list").empty();
            if($.type(res) ==="array" && res.length){
                $.each(res,function(i,o){
                    var flag = false;
                    $.each(o.roles,function(j,p){
                        if(p.roleId===${role.roleId}){
                            flag=true;
                        }
                    });
                    $("#menu-list").append("<div class='checkbox'><label><input type='checkbox' name='menuIds' value='"+o.resId+"' "+(flag?"checked":"")+">"+
                                            o.rname + "</label></div>");
                });
            }
        }
    });
    //填充权限
    (function(){
        $.ajax({
            url:"authority/getAuths",
            dataType:"json",
            type:"get",
            success:function(res){
                //console.log($.type(res))
                // var setting = {
                //     data:{
                //         simpleData:{
                //             enable:true,
                //             id:'resId',
                //             pId:'parent',
                //             rootPid:null
                //         }
                //     },
                //     check:{
                //         enable:true,
                //         chkStyle:'checkbox',
                //         chkboxType: { "Y": "p", "N": "s" }
                //     }
                // }
                //
                // $.fn.zTree.init($("#auth-list"),setting,res);

                $("#auth-list").empty();
                if($.type(res) ==="array" && res.length){
                    $.each(res,function(i,o){
                        var flag = false;
                        $.each(o.roles,function(j,p){
                            if(p.roleId===${role.roleId}){
                                flag=true;
                            }
                        });
                        $("#auth-list").append("<div class='checkbox'><label><input type='checkbox' name='authIds' value='"+o.resId+"' "+(flag?"checked":"")+">"+
                            o.rname + "</label></div>");
                    });
                }
            }
        });
    })()

    function iteratorList(){

    }
</script>
</html>
