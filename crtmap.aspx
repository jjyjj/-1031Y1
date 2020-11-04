<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="crtmap.aspx.cs" Inherits="MarketInfo.crtmap" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
 <link href="lib/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="lib/css/style.css"/>       
        <link href="lib/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="lib/assets/css/ace.min.css" />
        <link rel="stylesheet" href="lib/font/css/font-awesome.min.css" />
		<script src="lib/js/jquery-1.9.1.min.js" type="text/javascript"></script>
        <script src="lib/assets/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="lib/assets/js/typeahead-bs2.min.js" type="text/javascript"></script> 
        <script type="text/javascript" src="lib/js/H-ui.js" ></script>      	
		<script src="lib/assets/js/jquery.dataTables.min.js" type="text/javascript"></script>
		<script src="lib/assets/js/jquery.dataTables.bootstrap.js"type="text/javascript"></script>
        <script src="lib/assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="lib/assets/laydate/laydate.js" type="text/javascript"></script>
        <script src="lib/assets/js/jquery.easy-pie-chart.min.js" type="text/javascript"></script>
        <script src="lib/js/lrtk.js" type="text/javascript" ></script>
<title>生成地图</title>
</head>

<body>
<div class="margin clearfix">
 <div class="detailed_style">
 <!--收件人信息-->
    <div class="Receiver_style">
     <div class="title_name" style="background-color: #006699; color: #FFFFFF;">
         <asp:Label ID="LabelS" runat="server" Text="微信小图"></asp:Label></div>
         <div class="Info_style clearfix">
             <asp:Image ID="ImageS" runat="server" />
         </div>
    </div>
    <!--订单信息-->
    <div class="product_style">
    <div class="title_name" style="background-color: #006699; color: #FFFFFF;">微信大图</div>
    <div class="Info_style clearfix" style="overflow: auto">
        <a href="map.aspx?MAP=1" target="_blank"><asp:Image ID="ImageB" runat="server" Width="100%" /></a>
    </div>
    </div>
<div class="Button_operation">
	 <button onclick="f_Load();" class="btn btn-primary radius" type="submit"><i class="icon-save "></i>重新生成地图</button>
</div>
            
            
 </div>
</div>
</body>
</html>

<script type="text/javascript">

    var dlg=null;
    function f_Load() {
        location.reload();
    }

    $().ready(function () {
        f_init();
    })
    function f_init() {
        layer.msg('地图正在生成过程中...，请等待!', {
            icon: 16
            , shade: 0.01
            , time: 5000
        });
    }
    
</script>