<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_fileimg.aspx.cs" Inherits="MarketInfo.wd_dzrz.wd_dtfx.wd_fileimg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>查看通知</title> 
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->
</head>
<body>
    <form id="form1" runat="server">  
    <input type="hidden" id="HideID" value="" runat="server" />
    <div style="top: 0px; right: 0px; bottom: 0px; left: 0px; position: fixed; z-index: 0;"
        id="file_A">
        <iframe id="iframe" name="iframe" frameborder="0" src="" height="100%" width="100%">
        </iframe>
    </div>
    </form>
</body>
</html>
<script src="../assets/js/ace-extra.min.js" type="text/javascript"></script>
<script src="../assets/js/jquery-2.1.4.min.js" type="text/javascript"></script>
<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='../assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>
<!-- page specific plugin scripts -->
<script src="../assets/js/jquery-ui.custom.min.js" type="text/javascript"></script>
<script src="../assets/js/jquery.ui.touch-punch.min.js" type="text/javascript"></script>
<!-- ace scripts -->
<script src="../assets/js/ace-elements.min.js" type="text/javascript"></script>
<script src="../assets/js/ace.min.js" type="text/javascript"></script>
<script src="../js/mui.enterfocus.js" type="text/javascript"></script>
<script src="../js/mui.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        DaTa();
    })

    //信息渠道数据绑定
    function DaTa() {
        var HideID = $('#HideID').val(); 
        $.post('GetListFangan.ashx', {hideid:HideID}, function (data) {
            if (data != "-1") {
                DataBind(data);
            } else {
                mui.toast('数据读取失败');
            }
        })
    }
    //信息渠道遍历数据
    function DataBind(data) {            
        $('#iframe').attr("src", "../../file_fangan\\" + tid_(data[0].t_id) + data[0].img_title);
      //  alert("../../file_fangan/" + tid_(data[0].t_id) + data[0].file_title);
    }

   
    function tid_(tid) {
        if (tid == "") {
            return "";
        } else {
            return tid + "\\";
        }
    }
</script>

