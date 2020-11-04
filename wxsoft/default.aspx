<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="wxsoft._default" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<meta charset="utf-8">
		<title>河南省高速公路收费站管制示意图</title>
        <link rel="icon" href="images/logo.ico" type="image/x-icon">
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<link rel="stylesheet" href="css/mui.min.css">
		<link rel="stylesheet" type="text/css" href="css/app.css" />
	</head>
	<body><form runat="server">       
		<div class="mui-content">
            <div class="mui-card">
				<div class="mui-card-header mui-card-media">
					<img src="images/login.png" />
					<div class="mui-media-body">
						河南省高速公路通行情况
				&nbsp;<p><asp:Label ID="Label_LKTIME" runat="server" Text=""></asp:Label></p>
					</div>
				</div>
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
                        <asp:Label ID="Label_LK" runat="server" Text="Label">全省通行正常！</asp:Label>
					</div>
				</div>
                <div class="mui-card-footer">信息来源：河南省高速公路路警指挥中心</div>
		    </div>

            <div class="mui-card">
				<div class="mui-card-header mui-card-media">
					<img src="images/lwgs.png" />
					<div class="mui-media-body">
						河南省高速公路收费站管制示意图
                        <p>
                            今日服务：<asp:Label
                            ID="m_today" runat="server"></asp:Label>
					&nbsp;累计：<asp:Label
                            ID="m_cnt" runat="server" Text=""></asp:Label>
					    </p>
					</div>                    
				</div>
				<div class="mui-card-content" onclick="location.href='mapX.aspx';">
                     <asp:Image ID="Image_Xiao" runat="server" Width="100%" />
				</div>
                <div class="mui-card-footer">提示：点击地图可以查看详细路况！</div>
			</div>
	
			<div class="mui-card">
				<div class="mui-card-header mui-card-media">
					<img src="images/msg.png" />
					<div class="mui-media-body">
						其他相关消息
                        <p>...</p>
					</div>                    
				</div>
				<div class="mui-card-content" >
                     <asp:Label ID="Label_ELSE" runat="server" Text="Label"></asp:Label>
				</div>
				<div class="mui-card-footer">技术支持：景观地理空间信息研究院</div>
			</div>
		</div>
		<script type="text/javascript" src="js/mui.min.js"></script>
        </form>
	</body>
</html>