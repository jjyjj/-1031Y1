<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fankui.aspx.cs" Inherits="OA_APP.fr_main.fankui.wd_fankui" %>

<html lang="en" class="feedback">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>问题反馈</title>
    <link href="css/mui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/feedback.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery1.42.min.js" type="text/javascript"></script>
</head>
<body>
    <header class="mui-bar mui-bar-nav">
	<%--		<button id="submit" class="mui-btn mui-btn-blue mui-btn-link mui-pull-right">发送</button>--%>
			<h1 class="mui-title">问题反馈</h1>
		</header>
    <div class="mui-content">
        <div class="mui-content-padded">
        </div>
        <div class="row mui-input-row">
            <textarea id='question' class="mui-input-clear question" placeholder="请详细描述你的问题和意见(最多300字)..."></textarea>
        </div>
    </div>
    <div class="mui-content-padded">
        <button id='submit' class="mui-btn mui-btn-block mui-btn-primary" onclick="submit();">
            提交</button>
    </div>
    <script src="js/mui.min.js" type="text/javascript"></script>
    <script src="js/feedback.js" type="text/javascript"></script>
    <script type="text/javascript">
        mui.init();
        mui('.mui-scroll-wrapper').scroll();
    </script>
    <script src="js/mui.enterfocus.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/app.js"></script>
    <script type="text/javascript" charset="utf-8">
        function submit() {
            var m_question = $("#question").val();
            var m_contact = $("#contact").val();
            if (m_question != "") {
                $.post("it_setfankui.aspx?m_question=" + m_question, {}, function (data) {
                    // alert(data);
                    if (data == "") {
                        return;
                    }
                    if (data == "YES") {
                        mui.toast("提交成功!");
						document.getElementById("question").value = "";

                    } else if (data == "LEN") {
                        mui.toast("提交字数超出300字，请重新输入!");
                    }
                    else {
                        mui.toast("提交失败!");
                    }
                });
            }
            else {
                mui.toast("输入问题为空或有误!");
                return;
            }
        }
    </script>
</body>
</html>
