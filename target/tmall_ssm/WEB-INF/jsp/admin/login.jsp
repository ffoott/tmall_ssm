<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员登录入口</title>
    <script src="../../../js/jquery/2.0.0/jquery.min.js"></script>
    <link href="../../../css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="../../../js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <style>
        body {
            background-color: #f2f4f6;
        }
        .container {
            margin-top: 300px;
            width: 600px;
        }
        .usernameGly {
            border-bottom-left-radius: 0em !important;
        }
        .username {
            border-bottom-right-radius:0em!important;
        }
        .passwordGly {
            border-top-left-radius:0em!important;
        }
        .password {
            border-top-right-radius:0em!important;
        }
        .btn-group {
            margin-left: 50%;
            transform: translate(-50%);
        }
        .btn-group-lg .btn {
            width: 80px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="page-header">
            <h1>毅买 <small>后台管理系统登录</small></h1>
        </div>
        <p>${mess}</p>
        <form action="do_admin_login" method="post">
            <div class="input-group input-group-lg">
                <span class="input-group-addon usernameGly" id="sizing-addon1"><span class="glyphicon glyphicon-user"></span></span>
                <input type="text" class="form-control username" placeholder="账号" aria-describedby="sizing-addon1" name="userName">
            </div>
            <div class="input-group input-group-lg">
                <span class="input-group-addon passwordGly" id="sizing-addon1"><span class="glyphicon glyphicon-lock"></span></span>
                <input type="password" class="form-control password" placeholder="密码" aria-describedby="sizing-addon1" name="password">
            </div>
            <div class="btn-group-lg" role="group" aria-label="...">
                <button type="submit" class="btn btn-primary center-block btn">登录</button>
            </div>
        </form>

    </div>
</body>
</html>