<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_login.aspx.cs" Inherits="MarketInfo.wd_login" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
<head>
    <meta content="" />
    <title>登录</title> 
    <link href="css/mui.min.css" rel="stylesheet" type="text/css" />
	
    <!-- Error CSS -->
    <link href="css/Styles/login.css" rel="stylesheet" type="text/css" />
    <!-- Animate CSS -->
    <link href="css/Styles/animate.css" rel="stylesheet" type="text/css" />
    <!-- Ion Icons -->
    <link href="css/Styles/icomoon.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        input[type=button]
        {
            color: #fff;
            font-size: 18px;
            background-color: #fff;
            background-color: #BF7A6A;
            border: 0;
            -webkit-border-radius: 2px;
            -moz-border-radius: 2px;
            border-radius: 2px;
            transition: all .2s ease;
            cursor: pointer;
            width: 270px;
            height: 48px;
            margin: 0 auto;
            display: block;
            margin-bottom: 10px;
            padding: 15px;
        }
        input[type=button]:hover
        {
            background-color: #D2A968;
            color: #fff;
        }
    </style>
</head>
<body>
    <form>
    <div id="box" class="animated bounceIn" style=" padding:0 20px 60px 20px;">
        <div id="top_header" style="overflow: auto;">
            <img src="style/log.png" alt="掌中管道" style="height: 100px; padding: 0 -2px 20px 30px; float: center;" />
            <h5 style="padding: 7px 0 0 20px; float: left; font-size: 25px; font-weight: 600; letter-spacing: 1.5px;">
              </h5>
        </div>
        <div id="inputs">
            <div class="form-block">
                <input type="text" placeholder="用户名" id="uname" />
            </div>
            <div class="form-block">
                <input type="password" placeholder="密码" id="upwd" />
            </div>
            <input type="button" value="登录" onclick="f_tz()" />
        </div>
    </div>
    </form>
</body>
</html>
<!--[if !IE]> -->
<script src="js/app.js" type="text/javascript"></script>
<script src="js/mui.enterfocus.js" type="text/javascript"></script>
<script src="js/mui.min.js" type="text/javascript"></script>
<script src="assets/js/jquery-2.1.4.min.js" type="text/javascript"></script>
<script src="js/jquery1.42.min.js" type="text/javascript"></script>
<!-- <![endif]-->
<!--[if IE]>
<script src="assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<!-- inline scripts related to this page -->
<script type="text/javascript">
    jQuery(function ($) {

    });

    function f_tz() {
        var strname = $("#uname").val();
        if (strname == "") {
            mui.toast("用户名不能为空!");
            return false;
        }
        var strpwd = $("#upwd").val();
        if (strpwd == "") {
            mui.toast("密码不能为空!");
            return false;
        }
        $.post("it/it_login.aspx?CMD=LOGIN&UNAME=" + strname + "&UP=" + strpwd, {}, function (data) {

            if (data == "1") {
                mui.toast("登录成功，即将跳转!");
                location.href = "index.aspx";
            }
            if (data == "-1") {
                mui.toast("登录失败，请重试!");

            }
        });
    }
</script>
