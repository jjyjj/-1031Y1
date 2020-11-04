<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheUser.aspx.cs" Inherits="MarketInfo.wd_dzrz.wd_zfxc.CheUser" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>选择人员</title>
    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../assets/font-awesome/4.5.0/css/font-awesome.min.css" />

    <!-- page specific plugin styles -->

    <!-- ace styles -->
    <link rel="stylesheet" href="../assets/css/ace.min.css" class="ace-main-stylesheet" />
    <style type="text/css">
    </style>
</head>
<body style="overflow-x: hidden;">
    <form runat="server">
        <div class="row">
            <div class="col-xs-12"> 
                <div style="height: auto; text-align: center; padding: 7px 0 0 0;">
                    <%--<h3 class="header smaller lighter blue">jQuery dataTables</h3>--%>
                    <a class="btn btn-info" style="" href="../../UpLoads/User_Role.xls"><i class="ace-icon fa fa-download bigger-110"></i>下载模板</a>
                    <a class="btn btn-info" style="position: relative; width: 500px; height: 42px;">
                        <span class="_SFile">点击选择文件</span>
                        <asp:FileUpload ID="FileUpload1" runat="server"
                            Style="display: initial; opacity: 0; position: absolute; width: 500px; height: 36px; left: 0; top: 0; cursor: pointer;" accept=".xls" />
                    </a>
                    <asp:Button ID="btnImport" Text="导入" OnClick="btnImport_Click" class="btn btn-info" runat="server" />
                    <div>
                        <label id="lblhint" runat="server" style="color: #ff0000;">先下载模板，根据模板填写要导入的人员。</label>
                    </div>
                </div>
                <div class="table-header"><%=title %></div>
                <div>
                    <table id="dynamic-table" class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace check_all" onclick="check()" />
                                        <span class="lbl"></span>
                                    </label>
                                </th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (dt != null)
                                {
                                    for (int i = 0; i < dt.Rows.Count; i++)
                                    {
                            %>
                            <tr>
                                <th class="center">
                                    <label class="pos-rel">
                                        <% string ids = dt.Rows[i]["id"].ToString();
                                            if (!listid.Contains(ids))
                                            {  %>
                                        <input type="checkbox" class="ace check_" value="<%=dt.Rows[i]["id"] %>" />
                                        <% }
                                            else
                                            {%>
                                        <input type="checkbox" class="ace check_" checked="checked" value="<%=dt.Rows[i]["id"] %>" />
                                        <% }%>
                                        <span class="lbl"></span>
                                    </label>
                                </th>
                                <td><%=dt.Rows[i]["name"] %></td>
                            </tr>
                            <% }
                                } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
<script src="../assets/js/jquery-2.1.4.min.js" type="text/javascript"></script>
<script src="../lib/assets/js/jquery.dataTables.min.js"></script>
<script src="../lib/assets/js/jquery.dataTables.bootstrap.js"></script>
<script type="text/javascript">
    jQuery(function ($) {
        $('#dynamic-table').DataTable({
            "aaSorting": false, //默认第几个排序
            "aoColumnDefs": [{ "orderable": false, "aTargets": [0, 1] }],//指定不排序列
            'iDisplayLength': 5, //每页初始显示10条记录 
            "aLengthMenu": [[5, 10, 15, 25, -1], [5, 10, 15, 25, "所有"]], //设置每页显示数据条数的下拉选项
        });
        check_();
    })
    //返回数量
    function res_() {
        return $('input[type=checkbox].check_:checked').length;
    }
    //返回人员ID
    function res_all() {
        var i = "";
        $('input[type=checkbox].check_:checked').each(function () {
            i += $(this).val() + ",";
        })
        return i.substring(0, i.length - 1);
    }
    //全选
    function check() {
        if ($('input[type=checkbox].check_all').is(':checked')) {
            $('input[type=checkbox].check_').prop('checked', true);
        } else {
            $('input[type=checkbox].check_').prop('checked', false);
        }
    }
    //选择项时/判断是否是全部选中
    function check_() {
        if ($('input[type=checkbox].check_').length > $('input[type=checkbox].check_:checked').length) {
            $('input[type=checkbox].check_all').prop('checked', false);
        } else {
            $('input[type=checkbox].check_all').prop('checked', true);
        } 
        $('input[type=checkbox].check_').change(function () {
            if ($('input[type=checkbox].check_').length > $('input[type=checkbox].check_:checked').length) {
                $('input[type=checkbox].check_all').prop('checked', false);
            } else {
                $('input[type=checkbox].check_all').prop('checked', true);
            }
        })
        //导入验证
        $('#btnImport').click(function () {
            if ($('#FileUpload1').val() == '' || $('#FileUpload1').val() == null) {
                $('#lblhint').html('请输选择Excel文件后，再进行导入！');
                return false;
            }
        })
        //FileUpload选择文件 
        $('#FileUpload1').change(function () {
            if ($('#FileUpload1').val() == '' || $('#FileUpload1').val() == null) {
                $('._SFile').html('点击选择文件');
            } else {
                $('._SFile').html($('#FileUpload1').val());
            }
        })
    }
    //$('#u_basicExample').dataTable({
    //    "bLengthChange": true, //开关，是否显示每页显示多少条数据的下拉框
    //    "aLengthMenu": [[5, 10, 15, 25, -1], [5, 10, 15, 25, "所有"]], //设置每页显示数据条数的下拉选项
    //    'iDisplayLength': 10, //每页初始显示5条记录
    //    'bFilter': true,  //是否使用内置的过滤功能（是否去掉搜索框）
    //    "bInfo": true, //开关，是否显示表格的一些信息(当前显示XX-XX条数据，共XX条)
    //    "bPaginate": true, //开关，是否显示分页器
    //    "bSort": true //是否可排序 				
    //})
</script>
