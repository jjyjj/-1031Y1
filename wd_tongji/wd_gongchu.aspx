<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_gongchu.aspx.cs" Inherits="MarketInfo.wd_tongji.wd_gingchu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <%=Session["U_LoginName"].ToString() %>:公出统计
    </div>
    </form>
</body>
</html>
