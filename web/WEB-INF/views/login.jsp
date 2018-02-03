<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>系统管理登录</title>
		<base href="<%=basePath%>" >
		<link  rel="stylesheet"  href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
		<link rel="stylesheet"  href="//at.alicdn.com/t/font_562947_adwokb7tn2vs4i.css" />
		<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<style>
			.login-body{
				background-image:url("assets/img/login-bg.jpg");
				background-size:cover;
			}
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
	<body class="login-body">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-2 col-md-offset-10 "  style="font-size:16px;font-family:'幼圆''; ">
					<div class="pull-right" style="margin-top:0.5em;margin-right:0.2em">
						<strong><a>中文</a></strong> | <strong><a>English</a></strong>
					</div>
				</div>
			</div>
		</div>
		
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3" >
					<div class="row"  style="margin-top:27%">
						<div class="col-md-8 col-md-offset-2"  style="overflow:visible">
							 
								<div class="panel panel-default" >
								  <div class="panel-heading text-center"><span style="font-size:20px;font-weight:bold">系统管理登录</span></div>
								  <div class="panel-body">
							  		<!-- 登录表单FORM -->
									<div class="row login-bg-fill">
										<div class="col-md-10 col-md-offset-1">
											<form action="login"  method="post">
											  <div class="form-group has-feedback">
													<span class="iconfont icon-yonghu form-control-feedback"  style="font-size:16px;"></span>						    	
											        <input type="text" class="form-control"  name="uname" id="uname" placeholder="请输入用户名"  style="font-size:16px;line-height:1.8em;border-radius:1em;">
											  </div>
											  <div class="form-group has-feedback">
											    	<span class="iconfont icon-suo form-control-feedback"  style="font-size:16px;"></span>
											        <input type="password" class="form-control"  name="password" id="password" placeholder="请输入密码"  style="font-size:16px;line-height:1.8em;border-radius:1em;">
											  </div>
											  <div class="form-group">
											    <div>
											      <button type="submit"  class="btn btn-success btn-block" style="font-size:18px;line-height:1.4em;border-radius:1.2em;">登录</button>
											    </div>
											  </div>
											</form>
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
	
</html>