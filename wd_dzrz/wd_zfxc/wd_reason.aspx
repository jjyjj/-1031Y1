<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_reason.aspx.cs" Inherits="MarketInfo.wd_dzrz.wd_zfxc.wd_reason" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>审批</title>
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../assets/font-awesome/4.5.0/css/font-awesome.min.css" />
    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="../assets/css/jquery-ui.custom.min.css" />
    <!-- text fonts -->
    <link rel="stylesheet" href="../assets/css/fonts.googleapis.com.css" />
    <!-- ace styles -->
    <link rel="stylesheet" href="../assets/css/ace.min.css" class="ace-main-stylesheet" />
    <!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
    <link rel="stylesheet" href="../assets/css/ace-skins.min.css" />
    <link rel="stylesheet" href="../assets/css/ace-rtl.min.css" />
</head>
<body>
    <div class="main-content">
        <div class="main-content-inner">

            <div class="row" style="width: 100%;">
                <div class="col-sm-6 widget-container-col">
                    <div class="widget-box transparent">
                        <div class="widget-header">
                            <h4 class="widget-title lighter">&nbsp;审批建议</h4>
                        </div>
                        <div class="widget-body">
                            <div class="widget-main padding-6 no-padding-left no-padding-right">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead class="thin-border-bottom">
                                        <tr>
                                            <th class="input-group-addon">序号</th>
                                            <th class="input-group-addon">审批人</th>
                                            <th class="input-group-addon">审批结果</th>
                                            <th class="input-group-addon">审批建议</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <%if (tb != null)
                                            {
                                                for (int i = 0; i < tb.Rows.Count; i++)
                                                {
                                                    int b = i + 1;

                                        %>
                                        <tr>
                                            <td class="input-group-addon">

                                                <%=i+1%>
                                            </td>
                                            <td class="input-group-addon">
                                                <%=tb.Rows[i]["t_name"]%>
                                            </td>
                                            <td class="input-group-addon">
                                                <% if (tb.Rows[i]["sp1"].ToString() == "-1" || tb.Rows[i]["sp2"].ToString() == "-1" || tb.Rows[i]["sp3"].ToString() == "-1")
                                                    {  %>
                                                <i class="ace-icon fa fa-exclamation-triangle bigger-121" style="color: #D15B47;" title="审批未通过/被退回/修改后请重新提交"></i>
                                                <% } %>
                                                <% if (tb.Rows[i]["sp1"].ToString() == "1" || tb.Rows[i]["sp2"].ToString() == "1" || tb.Rows[i]["sp3"].ToString() == "1")
                                                    {  %>
                                                <i class="ace-icon fa fa-exclamation-triangle bigger-121" style="color: #99FF99;" title="审批通过"></i>
                                                <% } %>
                                            </td>
                                            <td class="input-group-addon">
                                                <%=tb.Rows[i]["reason" + b + ""]%> 
                                            </td> 
                                        </tr>

                                        <%}
                                            } %>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<script src="../assets/js/ace-extra.min.js"></script>
<script src="../assets/js/jquery-2.1.4.min.js"></script>
<script src="../assets/js/bootstrap.min.js"></script>
<!-- page specific plugin scripts -->
<script src="../assets/js/jquery-ui.custom.min.js"></script>
<script src="../assets/js/jquery.ui.touch-punch.min.js"></script>
<!-- ace scripts -->
<script src="../assets/js/ace-elements.min.js"></script>
<script src="../assets/js/ace.min.js"></script>
