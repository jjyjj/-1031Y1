<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_rxinfo.aspx.cs" Inherits="MarketInfo.wd_msg.wd_rxinfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
 <link href="../lib/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="../lib/css/style.css"/>       
        <link href="../lib/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="../lib/assets/css/ace.min.css" />
        <link rel="stylesheet" href="../lib/font/css/font-awesome.min.css" />
		<script src="../lib/js/jquery-1.9.1.min.js"></script>
        <script src="../lib/assets/js/bootstrap.min.js"></script>
		<script src="../lib/assets/js/typeahead-bs2.min.js"></script> 
        <script type="text/javascript" src="../lib/js/H-ui.js"></script>      	
		<script src="../lib/assets/js/jquery.dataTables.min.js"></script>
		<script src="../lib/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="../lib/assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="../lib/assets/laydate/laydate.js" type="text/javascript"></script>
        <script src="../lib/assets/js/jquery.easy-pie-chart.min.js"></script>
        <script src="../lib/js/lrtk.js" type="text/javascript" ></script>
<title>通行信息编辑</title>
</head>

<body><form id="Form1" runat="server">
<div class="margin clearfix">
<div class="Order_Details_style">
<div class="Numbering">发布时间:<b><asp:Label ID="m_bt" runat="server" Text=""></asp:Label></b></div></div>
 <div class="detailed_style">
    <!--抬头部分-->
    <div class="Receiver_style">
        <div class="title_name" style="background-color: #006699; color: #FFFFFF;">
        <span class="l_f">            
           <span id="Span1">绕行信息维护</span>
       </span>
        <span class="r_f" style="cursor: pointer" onclick="location.href='wd_editrx.aspx';">            
           <span id="Label1">
               <img src="../images/t02.png" />修改
           </span>
       </span>
        </div>
         <div class="Info_style clearfix">
             <asp:Label ID="m_msg" runat="server" Text=""></asp:Label>
         </div>
    </div>
 </div>
</div></form>
</body>
</html>
<script type="text/javascript">
    function f_ShowMap2() {
        layer.open({
            type: 2,
            title: '高速公路管制地图',
            maxmin: true,
            shadeClose: true, //点击遮罩关闭层
            area: ['92%', '92%'],
            content: "../map.aspx?MAP=1",
            cancel: function (index, layero) {
                layer.close(index);
            }
        })
    }

    function f_EditDlg(url) {
        layer.open({
            type: 2,
            title: '高速公路管制地图',
            maxmin: true,
            shadeClose: true, //点击遮罩关闭层
            area: ['92%', '92%'],
            content: url,
            //		btn:['关闭'],
            yes: function (index, layero) {
                layer.close(index);
                location.reload();
            }
        })
    }

</script>