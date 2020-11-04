<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mapX.aspx.cs" Inherits="wxsoft.mapX" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<meta charset="utf-8">
		<title>河南省高速公路收费站管制示意图</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=10,user-scalable=yes">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<!--标准mui.css-->
		<link rel="stylesheet" href="css/mui.min.css">
		<!--App自定义的css-->
		<link rel="stylesheet" type="text/css" href="css/app.css" />
	</head>
	<body>
		<div class="mui-content">
        <div class="mui-card">
				<div class="mui-card-header mui-card-media  mui-action-back mui-icon">
					<img src="../images/fanhui.png" />
					<div class="mui-media-body">
						高速公路收费站管制地图
                        <p>
                            <asp:Label ID="Label_MapTime" runat="server" Text=""></asp:Label></p>
					</div>                    
				</div>
				<div class="mui-card-content">
                     <form id="Form1" runat="server">
                            <asp:Image ID="Image_Da" runat="server" CssClass="mui-zoom" Width="100%" 
								ImageUrl="http://wxcx.henangis.com/map/800000/800000.PNG" />
                            </form>
				</div>
                <div class="mui-card-footer">提示：支持手势缩放<asp:Label ID="Label1" runat="server" Text="来源：省高速路警指挥中心"></asp:Label></div>
			</div>            
		</div>
	</body>
</html>
<script type="text/javascript" src="js/mui.min.js">
</script>
