<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>导航栏</title>
		<base href="<%=basePath%>" >
		<link rel="stylesheet"  href="assets/css/bootstrap.css" />
		<link rel="stylesheet"  href="//at.alicdn.com/t/font_562947_adwokb7tn2vs4i.css" />
	</head>
	<body>
		<nav class="navbar navbar-default" style="border-radius:0">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="#">系统管理</a>
		    </div>
		
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		        <li class="active"><a href="system"><span class="glyphicon glyphicon-home"></span> 首页</a></li>
		        <li><a href="javascript:void(0)"><span class="glyphicon glyphicon-eye-open"></span> 关于我们</a></li>
		        <li class="dropdown">
		          <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-knight"></span> 更多 <span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li><a href="javascript:void(0)">公司风采</a></li>
		            <li><a href="javascript:void(0)">......</a></li>
		            <li role="separator" class="divider"></li>
		            <li><a href="javascript:void(0)">......</a></li>
		          </ul>
		        </li>
		      </ul>
		      
		      <ul class="nav navbar-nav navbar-right">
		        <li><a href="javascript:void(0)"><span class="glyphicon glyphicon-info-sign"></span> 帮助文档</a></li>
		        <li class="dropdown">
		          <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="iconfont icon-yonghutianchong"></span> ${loginUser.user.uname } <span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li><a href="javascript:void(0)"><button class="btn btn-link user-info" style="text-decoration: none"><span class="iconfont icon-yonghutianchong"></span> 个人信息</button></a></li>
		            <li><a href="javascript:void(0)"><button class="btn btn-link update-info-btn" data-login="${loginUser.user.userId }" style="text-decoration: none"><span class="iconfont icon-shurutianchong"></span> 信息修改</button></a></li>
		            <li><a href="javascript:void(0)"><button class="btn btn-link change-pwd-btn" data-login="${loginUser.user.userId }" style="text-decoration: none"><span class="iconfont icon-kaixintianchong"></span> 密码修改</button></a></li>
		            <%--<li><a href="javascript:void(0)"><button class="btn btn-link authority-get" style="text-decoration: none">权限申请</button></a></li>--%>
		            <li role="separator" class="divider"></li>
		            <li><a href="javascript:void(0)"><button class="btn btn-link security-exit" style="text-decoration: none"><span class="iconfont icon-cuowutishitianchong"></span> 安全退出</button></a></li>
		          </ul>
		        </li>
		      </ul>
		    </div>
		  </div>
		</nav>

		<!-- 密码修改模态框 -->


		<!-- 忘记密码获取验证码 -->
		<%--<div class="modal fade " id="forget-pwd" tabindex="-1" role="dialog" aria-labelledby="forget-pwd-modal">--%>
			<%--<div class="modal-dialog modal-sm" role="document">--%>
				<%--<div class="modal-content">--%>
					<%--<div class="modal-header">--%>
						<%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
						<%--<h4 class="modal-title" id="forget-pwd-modal">邮箱验证</h4>--%>
					<%--</div>--%>
					<%--<div class="modal-body">--%>
						<%--<form>--%>
							<%--<div class="form-group">--%>
								<%--<label for="repeat-forget-pwd" class="control-label">邮箱:</label>--%>
								<%--<input type="text" class="form-control" name='email' id="repeat-forget-pwd">--%>
							<%--</div>--%>
						<%--</form>--%>
					<%--</div>--%>
					<%--<div class="modal-footer">--%>
						<%--<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>--%>
						<%--<button type="button" class="btn btn-primary vali-confirm">获取验证码</button>--%>
					<%--</div>--%>

				<%--</div>--%>
			<%--</div>--%>
		<%--</div>--%>

		<!-- 修改密码模态框 -->
		<div class="modal fade " id="change-pwd" tabindex="-1" role="dialog" aria-labelledby="change-pwd-modal">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="change-pwd-modal">密码修改</h4>
					</div>
					<div class="modal-body">
						<form id="change-pwd-form">
							<div class="form-group change-pwd-form">
								<label for="src-change-pwd" class="control-label">原密码:</label>
								<input type="password" class="form-control" name="srcPwd" id="src-change-pwd">
								<span class="help-block src-pwd-vali" style="color:red"></span>
							</div>
							<div class="form-group">
								<label for="new-change-pwd" class="control-label">新密码:</label>
								<input type="password" class="form-control" name="password" id="new-change-pwd">
								<span class="help-block new-pwd-vali" style="color:red"></span>
							</div>
							<div class="form-group">
								<label for="repeat-change-pwd" class="control-label">重复密码:</label>
								<input type="password" class="form-control" id="repeat-change-pwd">
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary confirm-change">确认修改</button>
					</div>
				</div>
			</div>
		</div>

		<!-- 个人信息模态框 -->
		<div class="modal fade " id="user-info" tabindex="-1" role="dialog" aria-labelledby="user-info-modal">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="user-info-modal">个人信息</h4>
					</div>
					<div class="modal-body">
						<table class="table table-bordered tabled-hover">
							<tr>
								<th>编号</th>
								<td>${loginUser.user.userId}</td>
							</tr>
							<tr>
								<th>名称</th>
								<td>${loginUser.user.uname}</td>
							</tr>
							<tr>
								<th>性别</th>
								<td>${loginUser.user.gender==1?"男":"女"}</td>
							</tr>
							<tr>
								<th>邮箱</th>
								<td>${loginUser.user.email}</td>
							</tr>
							<tr>
								<th>描述</th>
								<td>${loginUser.user.description}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script src="assets/js/jquery-1.12.3.js"></script>
	<script src="assets/js/bootstrap.js"></script>

	<script>
		$(".security-exit").on("click",function(){
		   location="logout";
		});

		$(".user-info").on("click",function(){
			$("#user-info").modal("toggle");
		});

		$(".change-pwd-btn").on("click",function(){
           // $("#vali-info .modal-body form").empty();
		   // $("#vali-info").find("form").html("<div class=\"form-group\"><label for=\"src-pwd\" class=\"control-label\">原密码:</label><input type=\"password\" name='password' class=\"form-control\" id=\"src-pwd\"></div>");
		   // $("#vali-info").find("form").prop("action","user/valiPwd");
		   $("#change-pwd").modal("toggle");
		});

		$(".confirm-change").on("click",function(){
		    if($("#new-change-pwd").val()!==$("#repeat-change-pwd").val()){
                $(".new-pwd-vali").html("两次密码输入不一致！");
			}else if($("#new-change-pwd").val() === $("#src-change-pwd").val()){
                $(".src-pwd-vali").html("原密码与新密码相同，请重新输入！");
			}else{
				$.ajax({
					url:"user/changePwd/"+$(".change-pwd-btn").data("login"),
					data:$("#change-pwd").find("form").serialize(),
					success:function(res){
						if(res){
							$(".src-pwd-vali").html(res);
						}else{
							var resu = confirm("修改成功！按确认重新登录！");
							if(resu)
							    location="logout"
							$("#change-pwd").modal("toggle");
						}
					}
				});
            }
		});

		$("#src-change-pwd").on("focus",function(){
		   $(".src-pwd-vali").html("");
		});
		$("#new-change-pwd").on("focus",function(){
		   $(".new-pwd-vali").html("");
		});
        $("#repeat-change-pwd").on("focus",function(){
            $(".new-pwd-vali").html("");
        });

        $(".update-info-btn").on("click",function(){
           location="user/update/"+$(this).data("login");
		});
	</script>
</html>