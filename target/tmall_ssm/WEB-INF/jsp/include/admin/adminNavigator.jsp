<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<style>
	body{padding: 0;}
	.nva{ width: 100%; height: 40px; margin-top: 0px; background-color: #222; }
	.list{ width: 80%; height: 40px; margin: 0 auto; list-style-type: none; }
	.list li{ float: left; }
	.list li a{ padding: 0 30px; color: #aaa; line-height: 40px; display: block; }
	.list li a:hover{ background:#333; color:#fff; }
	.list li a.on{ background:#333; color:#fff; }
	h1{ margin: 20px auto; text-align: center; }
	.admin-logo {
		font-size: 30px;
		text-align: center;
		line-height: 10px;
		color: #fff;
	}
</style>
<%--<div class="navitagorDiv">
	<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
</nav>
</div>--%>
<header class="header">
	<div class="nva">
		<a class="navbar-brand admin-logo" href="${contextPage}/admin_category_list">毅买后台</a>
		<ul class="list">

			<li><a class="navbar-brand" href="admin_category_list">分类管理</a></li>
			<li><a class="navbar-brand" href="admin_user_list">用户管理</a></li>
			<li><a class="navbar-brand" href="admin_order_list">订单管理</a></li>
		</ul>
	</div>
</header>
<script>
	$(function(){
		var url = document.URL.toLowerCase(); //获取url地址，并全部小写化

		if (url.indexOf("admin_category_list")!=-1){ //检测是否包含“/Products/”字段
			$("li:nth-child(1) .navbar-brand").addClass("on");
		}
		else if (url.indexOf("admin_user_list")!=-1){ //检测是否包含“/Products/”字段
			$("li:nth-child(2) .navbar-brand").addClass("on");
		}
		else if (url.indexOf("admin_order_list")!=-1){ //检测是否包含“/Products/”字段
			$("li:nth-child(3) .navbar-brand").addClass("on");
		}
	});

</script>
