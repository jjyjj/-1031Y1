<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_zfxc_hislist.aspx.cs" Inherits="MarketInfo.wd_dzrz.wd_zfxc.wd_zfxc_hislist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../../lib/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../lib/css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="../../lib/assets/css/ace.min.css" />
    <link rel="stylesheet" href="../../lib/font/css/font-awesome.min.css" />
    <style type="text/css">
        .dataTable th[class*=sort]:hover {
            color: #307ecc;
        }
    </style>
</head>
<body>
    <form id="Form1" runat="server">
        <input type="hidden" id="HideID" value="" runat="server" />
        <div class="margin clearfix">
<div class="row">
                    <h3 class="header smaller lighter blue">
                        <a class="btn btn-info" onclick=" window.history.go(-1)"><i class="ace-icon fa fa-reply icon-only"></i>&nbsp;返回</a>
                    </h3>
                    <div class="col-xs-12">
                        <div class="table-header">
                            <i class="ace-icon fa fa-hand-o-right icon-animated-hand-pointer red"></i>
                            宣传走访历史记录
                        </div>
                        <div>
                            <div class="article_sort_list">
                                <table class="table table-striped table-bordered table-hover" id="sample-table">
                                    <thead>
                                        <tr>
                                            <th class="input-group-addon"><i class="ace-icon fa fa-flag"></i>序号</th>
                                            <th class="input-group-addon">区县级重点部门</th>
                                            <th class="input-group-addon">村委</th>
                                            <th class="input-group-addon">机械手</th>
                                            <th class="input-group-addon">信息员</th>
                                            <th class="input-group-addon">农田户主</th>
                                            <th class="input-group-addon">今日走访数量</th>
                                            <th class="input-group-addon">时间</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% if (dt_1 != null)
                                            {
                                                for (int i = 0; i < dt_1.Rows.Count; i++)
                                                {  %>
                                        <tr>
                                            <td class="input-group-addon"> 
                                                <%=i+1 %>
                                            </td>
                                            <td class="input-group-addon"><%=dt_1.Rows[i]["zf_xjbm"]%></td>
                                            <td class="input-group-addon"><%=dt_1.Rows[i]["zf_cw"]%></td>
                                            <td class="input-group-addon"><%=dt_1.Rows[i]["zf_jxs"]%></td>
                                            <td class="input-group-addon"><%=dt_1.Rows[i]["zf_xxy"]%></td>
                                            <td class="input-group-addon"><%=dt_1.Rows[i]["zf_nthz"]%></td>
                                            <td class="input-group-addon"><%=dt_1.Rows[i]["zf_jr_num"]%></td> 
                                            <td class="input-group-addon"><%=dt_1.Rows[i]["setTime"]%></td> 
                                        </tr>
                                        <% }
                                            }%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </form>
</body>
</html>
<script src="../assets/js/jquery-2.1.4.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../../lib/assets/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../../lib/assets/js/jquery.dataTables.bootstrap.js"></script>
<script type="text/javascript">
    $(function () {
        var oTable1 = $('#sample-table').dataTable({
            "bLengthChange": true, //开关，是否显示每页显示多少条数据的下拉框
            "aLengthMenu": [[5, 10, 15, 25, -1], [5, 10, 15, 25, "所有"]], //设置每页显示数据条数的下拉选项
            'iDisplayLength': 10, //每页初始显示5条记录
            'bFilter': true,  //是否使用内置的过滤功能（是否去掉搜索框）
            "bInfo": true, //开关，是否显示表格的一些信息(当前显示XX-XX条数据，共XX条)
            "bPaginate": true, //开关，是否显示分页器
            "bSort": false //是否可排序 	
        });
    })
    function f_OpenDlg(id) {
        layer.open({
            type: 2,
            title: '',
            skin: 'layui-layer-lan',
            closeBtn: 1, //不显示关闭按钮
            shade: [0],
            area: ['35%', '60%'],
            anim: 2,
            content: "wd_reason.aspx?id=" + id,
        });
    }

</script>
