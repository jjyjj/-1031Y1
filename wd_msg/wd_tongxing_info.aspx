<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_tongxing_info.aspx.cs" Inherits="MarketInfo.wd_msg.wd_tongxing_info" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>河南高速通行信息</title>
    <link href="css/mui.min.css" rel="stylesheet" type="text/css" />
    <style>
    .con_iframe{
    width:100%;
    height:300px;
    }
    .panel-body img{
    	width:100%;
    	height:100%;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="mui-content" style="background-color: #FFFFFF">
    <div style=" padding-left: 20px;" >
            <div class="panel-body" >            <br/>                <p style=" color: #000000"><%=strtime%></p>
                <%=strlk%>
<%if (isok == "1")
  { %>
<p>
    <a href="../gsmap.aspx" style="font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);"><img data-fmt="png" src="../map.aspx?MAP=0" data-lazyload="1" style="border-style: none; vertical-align: top; max-width: 100%; max-height: 100%; width: 1198.02px;"/></a></p>
                <p>
                    <span style="font-family: 宋体;color: rgb(85, 85, 85);letter-spacing: 0;font-size: 14px"><br/></span>
</p> <% }
  else { %>
  
  <%}%>
<%=strconten%>
    </div>
   </div>
   </div>
    </form>
</body>
</html>
