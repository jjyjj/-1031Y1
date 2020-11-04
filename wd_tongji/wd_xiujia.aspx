<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_xiujia.aspx.cs" Inherits="MarketInfo.wd_tongji.wd_xiujia" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
   当前用户名： <%=Session["U_LoginName"].ToString() %><br />
   单位名：<%=Session["CUR_DWNAME"].ToString()%><br />
   上级单位：<%=Session["CUR_PDWNAME"].ToString()%><br /> 
    </div>
    </form>
</body>
</html>
