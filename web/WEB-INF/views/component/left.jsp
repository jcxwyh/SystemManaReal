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
		<title>左侧菜单</title>
		<base href="<%=basePath%>" >
		<link rel="stylesheet"  href="assets/css/bootstrap.css" />
		<link rel="stylesheet"  href="//at.alicdn.com/t/font_562947_adwokb7tn2vs4i.css" />
		<style>
			.to-right{
				margin-left:2em;
			}
		</style>
	</head>
	<body>
		<div class="panel panel-default">
		  <div class="panel-heading">
		    <h3 class="panel-title"><span class=" glyphicon glyphicon-th"></span> 菜单</h3>
		  </div>
		  <div class="list-group">
			  <a href="system" class="list-group-item">
			    <span class=" glyphicon glyphicon-home"></span> 首页
			  </a>
			  <%--<a href="system/company" class="list-group-item">公司管理</a>--%>
			  <%--<a href="dept" class="list-group-item">部门管理</a>--%>
			  <%--<a href="user" class="list-group-item">用户管理</a>--%>
			  <%--<a href="menu" class="list-group-item">菜单管理</a>--%>
			  <%--<a href="role" class="list-group-item">角色管理</a>--%>
			  <%--<a href="authority" class="list-group-item">权限管理</a>--%>
			  <!-- 首先遍历用户的角色 -->
			  <!--
			  	1.遍历menus
			  	2.如果menu.resource==null则为父菜单，遍历menus寻找其子菜单，找到加加号按钮并显示子菜单
			  <%--<c:forEach items="${loginUser.menus}" var="childMenu">--%>
							<%----%>
						<%--</c:forEach>--%>
			  -->
			  <c:forEach items="${loginUser.menus}" var="menu">
				  <c:if test="${menu.resource==null}">
			  			<a href="${menu.href==null?'javascript:void(0)':menu.href}"  class="list-group-item ${menu.rname==param.active?'active':''}">
							<span class="glyphicon glyphicon-th-large"></span> ${menu.rname}
						</a>

					  	<c:set var="haha" value="0"></c:set>
					    <c:forEach items="${loginUser.menus}" var="childMenu">
							<!-- 判断跳出循环 -->
							<%--成功${menu.rname}-${childMenu.resource.rname}--%>
							<c:if test="${menu.resources.contains(childMenu)}">
								<c:set var="haha" value="1"></c:set>
							</c:if>
					    </c:forEach>
					    <c:if test="${haha==1}">
							<span class="glyphicon glyphicon-plus-sign pull-right" data-parent="${menu.rname}" style="margin:-2em 1em 0 0;z-index: 100"></span>
						</c:if>

						<%--<c:if test="${menu.hasChild==1}">--%>
							<%--<span class="glyphicon glyphicon-plus-sign pull-right" data-parent="${menu.rname}" style="margin:-2em 1em 0 0;z-index: 100"></span>--%>
						<%--</c:if>--%>
							<%--<c:forEach items="${loginUser.menus}" var="temp">--%>
								<%--<c:if test="${menu.resId==temp.resource.resId}">--%>
									<%--<span class="glyphicon glyphicon-plus-sign"></span>--%>
								<%--</c:if>--%>
							<%--</c:forEach>--%>

					  <c:forEach items="${loginUser.menus}" var="childs">
						  <!--${childs.resource.resId}==${menu.resId}-->
						  <c:if test="${childs.resource.resId==menu.resId}">
			  					<a href="${childs.href==null?'javascript:void(0)':childs.href}" data-child="${menu.rname}" class="list-group-item hide ${param.active==childs.rname?'active':''}">
									<span class="to-right"><span class="glyphicon glyphicon-th-large"></span> ${childs.rname}</span>
								</a>
						  </c:if>
					  </c:forEach>

				  </c:if>
			  </c:forEach>


			  <%--<c:forEach items="${loginUser.roles}" var="role">--%>
				  <%--<c:forEach items="${role.resources}" var="reso">--%>
					  <%--<c:if test="${reso.type==1}">--%>
						 <%--<c:if test="${reso.resource==null}">--%>
							 <%--<a href="${reso.href==null?'javascript:void(0)':reso.href}" class="list-group-item">--%>
									 <%--${reso.rname}--%>
								 <%--<span>--%>
								 	<%--<c:if test="${reso.resources.size()>0}">--%>
										 <%--<c:forEach items="${reso.resources}" var="res">--%>
											 <%--<c:choose>--%>
												 <%--<c:when test="">--%>

												 <%--</c:when>--%>
											 <%--</c:choose>--%>
										 <%--</c:forEach>--%>
								 	<%--</c:if>--%>
								 <%--</span>--%>
							 <%--</a>--%>
							 <%--<c:forEach items="${reso.resources}" var="res">--%>
			  					<%--<c:if test="${res.type==1}">--%>
									<%--<a href="${res.href==null?'javascript:void(0)':res.href}" class="list-group-item">--%>
										<%--<span class="to-right">${res.rname}</span>--%>
									<%--</a>--%>
								<%--</c:if>--%>
							 <%--</c:forEach>--%>
						 <%--</c:if>--%>
					  <%--</c:if>--%>
				  <%--</c:forEach>--%>
			  <%--</c:forEach>--%>
		  </div>
		</div>
	</body>
	<script src="assets/js/jquery-1.12.3.js"></script>
	<script src="assets/js/bootstrap.js"></script>

	<script>
		$(".list-group").on("click",".glyphicon",function(){
            $(this).toggleClass("glyphicon-plus-sign")
            $(this).toggleClass("glyphicon-minus-sign")
			var ele = $(this).data("parent");
			$("a").each(function(){
				if($(this).data("child")==ele){
				    $(this).toggleClass("hide");
				}
			})
		});
		$(function(){
		    var user = "${param.user}";
            var res = "${param.res}";
            if(user){
                $("span").each(function(){
					if($(this).data("parent")==="部门管理"){
                        $(this).removeClass("glyphicon-plus-sign")
                        $(this).addClass("glyphicon-minus-sign")
					}
				})
				$("a").each(function(){
                    if($(this).data("child")===user){
                        $(this).removeClass("hide");
                    }
				})
            }

            if(res){
                $("span").each(function(){
                    if($(this).data("parent")==="资源管理"){
                        $(this).removeClass("glyphicon-plus-sign")
                        $(this).addClass("glyphicon-minus-sign")
                    }
                })
                $("a").each(function(){
                    if($(this).data("child")===res){
                        $(this).removeClass("hide");
                    }
                })
            }
		});
		$(".list-group").on("click","a",function(){

		    $(".list-group").find("a").each(function(){
		       $(this).removeClass("active");
			});
            $(this).addClass("active");
		});
	</script>
</html>