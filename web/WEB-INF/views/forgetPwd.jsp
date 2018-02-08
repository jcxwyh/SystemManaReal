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
		<title>忘记密码</title>
		<base href="<%=basePath%>" >
		<link  rel="stylesheet"  href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
		<link rel="stylesheet"  href="//at.alicdn.com/t/font_562947_adwokb7tn2vs4i.css" />
		<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<style>
			.panel-body{
				padding:0;
				margin-top:4%;
				
			}
			.panel,.panel-body{
				border-radius:20px;
			}
			.panel-heading{
				border-radius:20px 20px 0 0;
			}
			#uname{
				background-color:rgba(255,255,255,0.3);
			}
			.has-feedback .form-control{
				padding-left:38px;
			}
			.form-control-feedback{
				left:5px;
			}
			a{
				color:rgba(255,255,255,0.7);
				cursor:pointer;
			}
		</style>
	</head>
	<body>
		<%--<div class="container-fluid">--%>
			<%--<div class="row">--%>
				<%--<div class="col-md-2 col-md-offset-10 "  style="font-size:16px;font-family:'幼圆''; ">--%>
					<%--<div class="pull-right" style="margin-top:0.5em;margin-right:0.2em">--%>
						<%--<strong><a>中文</a></strong> | <strong><a>English</a></strong>--%>
					<%--</div>--%>
				<%--</div>--%>
			<%--</div>--%>
		<%--</div>--%>
		
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3" >
					<div class="row"  style="margin-top:27%">
						<div class="col-md-10 col-md-offset-1"  style="overflow:visible">
							 
								<div class="panel panel-default" >
								  <div class="panel-heading text-center"><span style="font-size:20px;font-weight:bold">忘记密码</span></div>
								  <div class="panel-body">
							  		<!-- 修改密码 -->
									<div class="row login-bg-fill">
										<div class="col-md-10 col-md-offset-1">
											<form action="user/forgetPwd" method="post">
											  <div class="form-group">
												  <div class="input-group">
													  <input type="text" class="form-control"  value="${valiMail }" name="email"  id="email" placeholder="请输入邮箱">
													  <span class="input-group-btn">
														<button class="btn btn-default get-vali-code" type="button">获取验证码</button>
														
													  </span>
												  </div>
													<span class="help-block vali-mail" style="color:red;margin-left:0.4em"></span>
											  </div>
											  <div class="form-group">
											        <input type="text" class="form-control"  name="valiCode" id="valiCode" placeholder="请输入验证码" >
												    <span class="help-block vali-code" style="color:red;margin-left:0.4em"></span>
											  </div>
												<div class="form-group">
													<input type="password" class="form-control"  name="password" id="password" placeholder="请输入密码" >
													<span class="help-block vali-pwd " style="color:red ;margin-left:0.4em"></span>
												</div>
												<div class="form-group">
													<input type="password" class="form-control" id="vali-password" placeholder="请重复输入密码" >
												</div>

												<c:if test="${message != null}">
													<div class="alert alert-danger alert-dismissible" role="alert" style="border-radius:3em;padding:0.5em 1em">
														<button type="button" class="close" data-dismiss="alert" aria-label="Close" style="margin-right:0.8em"><span aria-hidden="true">&times;</span></button>
															${message}
													</div>
												</c:if>
											</form>
											<div class="form-group">
												<div>
													<button type="button"  class="btn btn-success btn-block update-btn" >修改</button>
												</div>
											</div>
										</div>
									</div>
							 	 </div>
							  </div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<jsp:include page="component/footer.jsp"></jsp:include>
		
	</body>
	<script>

		var emailReg = /^.{1,50}@[a-z0-9]{2,8}\.[a-z]{2,3}$/i;

		$(".update-btn").on("click",function(){
		   if(!$("#valiCode").val()){
               $(".vali-code").html("请获取验证后重试！")
		   }else if(!$("#vali-password").val()||!$("#password").val()){
		       $(".vali-pwd").html("密码不能为空！");
		   }else if($("#password").val() !== $("#vali-password").val()){
               $(".vali-pwd").html("两次密码输入不一致！");
		   }else{
		    	$("form").submit();
		   }
		});

		$("#valiCode").on("focus",function(){
            $(".vali-code").html("");
		});

		$("#password").on("focus",function(){
            $(".vali-pwd").html("");
		})

        $("#vali-password").on("focus",function(){
            $(".vali-pwd").html("");
        });

		$(".get-vali-code").on("click",function(){
		   if(!$("#email").val()){
		       $(".vali-mail").html("请输入邮箱！");
		   }else if(!emailReg.test($("#email").val())){
               $(".vali-mail").html("邮箱格式不正确！");
		   }else{
			   
			   $.ajax({
				   url:"system/getEmailCode",
				   data:"email="+$("#email").val(),
				   type:"post",
				   success:function(res){
				       console.log(res);
				   }
				});
			   
		       //alert("获取成功！请输入验证码！");
			   $(".get-vali-code").prop("disabled",true);
			   getTime(30);
		   }
		});
		
		//循环改变html
		function getTime(i){
			$(".get-vali-code").html(i+"秒后重试");
			 setTimeout(function(){
				   //i=--i;
				   if(i>1){
					   getTime(--i);
				   }else{
					   $(".get-vali-code").html("获取验证码");
					   $(".get-vali-code").prop("disabled",false);
					   return;
				   }
			 },1000);
		}
		
		$("#email").on("focus",function(){
			$(".vali-mail").html("");
		});
	</script>
</html>