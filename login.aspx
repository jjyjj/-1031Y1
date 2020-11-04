<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="MarketInfo.login" %>

<!DOCTYPE html>

<html lang="en">
	<head>
		<meta charset="UTF-8" />
		 <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
   <title><%=System.Configuration.ConfigurationManager.ConnectionStrings["TitleString"].ConnectionString%></title> 
     <link href="login/css/mui.min.css" rel="stylesheet" type="text/css" />
        <link href="login/css/style.css" rel="stylesheet" type="text/css" />
    <script src="jquery/js/jquery.js" type="text/javascript"></script>
    <script src="jquery/js/jquery.min.js" type="text/javascript"></script>
    <link href="jquery/css/jquery.mobile-1.4.5.min.css" rel="stylesheet" type="text/css" />
        <script src="login/login.js" type="text/javascript"></script>
    <style type="text/css">
			.area {
				margin: 20px auto 0px auto;
			}
			.mui-input-group {
				margin-top: 10px;
			}
			
			.mui-input-group:first-child {
				margin-top: 20px;
			}
			
			.mui-input-group label {
				width: 22%;
			}
			
			.mui-input-row label~input,
			.mui-input-row label~select,
			.mui-input-row label~textarea {
				width: 78%;
			}
			
			.mui-checkbox input[type=checkbox],
			.mui-radio input[type=radio] {
				top: 6px;
			}
			
			.mui-content-padded {
				margin-top: 25px;
			}
			
			.mui-btn {
				padding: 10px;
			}
			
			.link-area {
				display: block;
				margin-top: 25px;
				text-align: center;
			}
			
			.spliter {
				color: #bbb;
				padding: 0px 8px;
			}
			
			.oauth-area {
				position: absolute;
				bottom: 20px;
				left: 0px;
				text-align: center;
				width: 100%;
				padding: 0px;
				margin: 0px;
			}
			
			.oauth-area .oauth-btn {
				display: inline-block;
				width: 50px;
				height: 50px;
				background-size: 30px 30px;
				background-position: center center;
				background-repeat: no-repeat;
				margin: 0px 20px;
				/*-webkit-filter: grayscale(100%); */
				border: solid 1px #ddd;
				border-radius: 25px;
			}
			
			.oauth-area .oauth-btn:active {
				border: solid 1px #aaa;
			}
			
			.oauth-area .oauth-btn.disabled {
				background-color: #ddd;
			}
			.mui-btn {
				display: block;
				width: 100%;
				margin: 10px auto;
			}
			
			#info {
				padding: 20px 10px;
			}
		</style> 
		<!-- Ion Icons -->
	</head>
	<body>
   	<div class="mui-content">
        <div id="div_uid" class="mui-content-padded">
			<ul class="mui-table-view mui-table-view-chevron" style="vertical-align: middle; text-align: center">
				<img src="login/images/login.png" width="128" height="128" />	
			</ul>
            <form id='login-form' class="mui-input-group">
				    <div class="mui-input-row">
					    <label>账号</label>
					    <input id='m_name' type="text" class="mui-input-clear mui-input" 
                            placeholder="请输入账号" value="" />
				    </div>
				    <div class="mui-input-row">
					    <label>密码</label>
					    <input id='m_pwd' type="password" class="mui-input-clear mui-input" 
                            placeholder="请输入密码" value="" />
				    </div>
                    <div id="info"></div>
			</form>         
			<form class="mui-input-group" 
            style="height: 40px; text-align: center;">
            <table style="width: 100%;">
                <tr>
                    <td height="40" style="text-align: right" width="50%">
                        <input id="m_savepwd" type="checkbox"  /> 记住密码&nbsp;&nbsp;
                    </td>
                    <td style="text-align: left" width="50%">
                       &nbsp; <%--<a href="ForgetPassword.aspx" >忘记密码?</a>--%>
                    </td>
                </tr>
            </table>
            </form>
        </div><%--div_uid--%>
			<div class="mui-content-padded">
				<button id='login' class="mui-btn mui-btn-block mui-btn-primary" onclick="login();">登录</button>
			</div>

            <div class="mui-card" style="margin-bottom: 35px;">
				<ul class="mui-table-view">
					<li class="mui-table-view-cell mui-media">
						 <table style="width: 100%; border-collapse: collapse; font-family: 微软雅黑;">
                    <tr><td style="font-size: small; text-align: center; vertical-align: middle;" 
                            height="28" ></td></tr>
                           <tr> <td style="font-size: small; text-align: center; vertical-align: middle;" 
                            height="28" ></td></tr>
                    <tr>
                        <td style="font-size: small; text-align: center; vertical-align: middle;" 
                            height="28" >
                            版权所有：中石油管道有限公司西气东输分公司
                        </td>
                    </tr>
                    <tr>
                        <td style="font-size: small; text-align: center; vertical-align: middle;" 
                            height="28">
                        设计开发：郑州景观地理空间信息研究院&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>

                </table>
					</li>
				</ul>
			</div>

			<div class="mui-content-padded" 
            style="vertical-align: middle; text-align: center;">
               
			</div>
		</div>
        <script src="login/js/mui.min.js" type="text/javascript"></script>
        <script src="login/js/mui.enterfocus.js" type="text/javascript"></script>
        <script src="login/js/app.js" type="text/javascript"></script>
        <script type="text/javascript" charset="utf-8">
            function login() {
               // mui.toast("12212121");
                //首先判定是否为空m_name,m_pwd
                //var strname = document.getElementById("m_name").value;
                var strname = $("#m_name").val();               
                //去掉空格
                strname = trim(strname);
                var strpwd = $("#m_pwd").val().trim();               
                if (strname == "" || strpwd == "") {
                    mui.toast("用户账号和密码不能为空!");
                    return false;
                }
                //只有登录成功之后才能记录密码
                $.post("it/denglu.aspx?UNAME=" + strname + "&UPWD=" + strpwd, {}, function (data) {
                    // mui.toast("12211!");
                   // alert(data);
                    if (data == "YES") {
                        mui.toast("登录成功!");
                        f_LoginDesk();

                    } else {
                        mui.toast("登录失败，请重新输入账号密码!");
                    }
                });
            }

            function f_LoginDesk() {

                //判定记住密码是否打开?
                //var strval = document.getElementById("m_savepwd").checked;
                try {
                    var strChk = $("#m_savepwd").is(":checked");
                    if (strChk) {
                        //记住密码
                        var strname = $("#m_name").val();
                        //去掉空格
                        strname = trim(strname);
                        var strpwd = $("#m_pwd").val();
                        strpwd = trim(strpwd);
                        localStorage.setItem("M_NAME", strname);
                        localStorage.setItem("M_PWD", strpwd);
                    }
                    else {
                        localStorage.removeItem("M_NAME");
                        localStorage.removeItem("M_PWD");
                    }
                }
                catch (e) {
                }
                var url = "index.aspx";
                setTimeout(function () {
                    mui.openWindow({
                        url: url,
                        id: 'info'
                    });
                }, 1500);
            }

            //写一个初始化程序

            function f_InitPage() {
                //先检查
                var user = localStorage.getItem("M_NAME");
                var pwd = localStorage.getItem("M_PWD");
                if (user != null && pwd != null) //如果缓存中有数据，则加载出来 B5教程网  
                {
                    //mui.toast(Id);
                    $("#m_savepwd").prop("checked", true);
                    $("#m_name").val(user);
                    $("#m_pwd").val(pwd);
                }
            }
            f_InitPage();
        </script>
   
        

	</body>
</html>