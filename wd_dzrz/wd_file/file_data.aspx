<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="file_data.aspx.cs" Inherits="MarketInfo.wd_dzrz.wd_file.file_data" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Chain Responsive Bootstrap3 Admin</title> 
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->
</head>
<body>
    <form id="form1" runat="server">
    <input type="hidden" id="HideType" value="" runat="server" />
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
        $.post('GetListBind.ashx', {hideid:HideID}, function (data) {
            if (data != "-1") {
                DataBind(data);
            } else {
                mui.toast('数据读取失败');
            }
        })
    }
    //信息渠道遍历数据
   // function DataBind(data) {
    //    var open = "window.location.href = 'http://view.xdocin.com/xdoc?_xdoc='"+"";
     //   var types = $('#HideType').val();        
     //   if (types == "A") { $('#iframe').attr("src", open+"../../file_data\\" + tid_(data[0].t_id) + data[0].file_title); }
     //   else { $('#iframe').attr("src", open + "../../file_data1\\" + tid_(data[0].t_id) + data[0].file_title); }

   // }

    function DataBind(data) {
        var tid = data[0].t_id;
        var title = data[0].file_title.toString();     //文件名称
        var hou = title.substr(title.lastIndexOf(".")); //截取后缀


        var types = $('#HideType').val();
        if (types == "A") //事件学习
        {
            if (hou == ".jpg" || hou == ".png" || hou == ".gif") {   //图片
                $('#iframe').attr("src", "../../file_data/" + tid + "/" + title);
            }
            else {
                if (hou == ".pdf") {                        //pdf
                    var tid = data[0].t_id;
                    var title = data[0].file_title;
                    var wurl = "http://dzrz.shuzihenan.com/file_data/" + tid + "/" + title;
                    var pdfurl = "新建 DOC 文档.pdf";
                    window.location.href = "pdfjs-2.5.207-es5-dist/web/viewer.html?file=" + wurl; //用pdf.js打开
                }
                else {                                       //Office
                    var tid = data[0].t_id;
                    var title = data[0].file_title;
                    var wurl = "http://dzrz.shuzihenan.com/file_data/" + tid + "/" + title;
                    window.location.href = 'http://view.officeapps.live.com/op/view.aspx?src=' + wurl; //用office官方链接打开
                }
            }

        }
        else {
            if (hou == ".jpg" || hou == ".png" || hou == ".gif") {   //图片
                $('#iframe').attr("src", "../../file_data1/" + tid + "/" + title);
            }
            else {
                if (hou == ".pdf") {                        //pdf
                    var tid = data[0].t_id;
                    var title = data[0].file_title;
                    var wurl = "http://dzrz.shuzihenan.com/file_data1/" + tid + "/" + title;
                    var pdfurl = "新建 DOC 文档.pdf";
                    window.location.href = '../../pdfjs-2.5.207-es5-dist/web/viewer.html?file=' + wurl; //用pdf.js打开
                }
                else {                                       //Office
                    var tid = data[0].t_id;
                    var title = data[0].file_title;
                    var wurl = "http://dzrz.shuzihenan.com/file_data1/" + tid + "/" + title;
                    var pdfurl = "新建 DOC 文档.pdf";
                    window.location.href = 'http://view.officeapps.live.com/op/view.aspx?src=' + wurl; //用office官方链接打开
                }
            }

        }



    }



    function tid_(tid) {
        if (tid == "") {
            return "";
        } else {
            return tid + "\\";
        }
    }
</script>
