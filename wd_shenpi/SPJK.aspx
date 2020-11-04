<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SPJK.aspx.cs" Inherits="MarketInfo.wd_shenpi.SPJK" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">




<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>视频监控审批</title>

    <meta name="description" content="Static &amp; Dynamic Tables" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../assets/font-awesome/4.5.0/css/font-awesome.min.css" />
    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="../assets/css/jquery-ui.custom.min.css" />

    <!-- page specific plugin styles -->

    <!-- text fonts -->
    <link rel="stylesheet" href="../assets/css/fonts.googleapis.com.css" />

    <!-- ace styles -->
    <link rel="stylesheet" href="../assets/css/ace.min.css" class="ace-main-stylesheet" />

    <link href="../css/mui.min.css" rel="stylesheet" type="text/css" />
</head>

<body class="no-skin">

    <div class="main-container ace-save-state" id="main-container">
        <script type="text/javascript">
            try { ace.settings.loadState('main-container') } catch (e) { }
        </script>

        <div class="main-content">
            <div class="main-content-inner">

                <div class="page-content">
                    <!-- /.ace-settings-container -->

                    <div class="page-header">
                        <h4>视频监控
								<small>
                                    <i class="ace-icon fa fa-angle-double-right"></i>
                                </small>
                        </h4>
                    </div>
                    <!-- /.page-header -->
                    <h3 class="header smaller lighter blue">
                        <a class="btn btn-info" onclick="go_shenpi()"><i class="ace-icon fa fa-reply icon-only"></i>&nbsp;返回</a>
                        <a class="btn btn-info" href="../wd_dzrz/Hislist/spjk.aspx?UTID=<%=UTID%>">&nbsp;历史记录</a>
                    </h3>
                    <div class="row">
                        <div class="col-xs-12">
                            <!-- PAGE CONTENT BEGINS -->
                            <div class="row">
                                <input type="hidden" id="HideTid" value="" runat="server" />
                                <input type="hidden" id="Hide_Sp" value="" runat="server" />
                                <div class="col-xs-12">
                                    <table id="simple-table" class="table  table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th class="input-group-addon"><i class="ace-icon fa fa-flag"></i>序号</th>
                                                <th class="input-group-addon">项目全称</th>

                                                <th class="input-group-addon">是否正常
                                                </th>
                                                <th class="input-group-addon">uid码</th>
                                                <th class="input-group-addon Hide_types">审批</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <%if (tb != null)
                                                {
                                                    for (int i = 0; i < tb.Rows.Count; i++)
                                                    { %>
                                            <tr>
                                                <td class="input-group-addon"><%=i+1%></td>
                                                <td class="input-group-addon"><%=tb.Rows[i]["s_xmgcqc"]%></td>
                                                <td class="input-group-addon"><%=tb.Rows[i]["s_shifouzc"]%> </td>
                                                <td class="input-group-addon"><span class="label label-sm label-warning"><%=tb.Rows[i]["s_uid"]%></span> </td>




                                                <td class="input-group-addon Hide_types">
                                                    <div class="hidden-sm hidden-xs btn-group">
                                                        <button class="btn btn-xs btn-danger">
                                                            <span onclick="f_shenpi('<%=tb.Rows[i]["s_id"]%>','-1')"><i class="ace-icon fa fa-flag bigger-120"></i></span>
                                                        </button>
                                                    </div>
                                                    <div class="hidden-md hidden-lg">
                                                        <div class="inline pos-rel">
                                                            <button class="btn btn-xs btn-danger">
                                                                <span onclick="f_shenpi('<%=tb.Rows[i]["s_id"]%>','-1')"><i class="ace-icon fa fa-flag bigger-120"></i></span>
                                                            </button>
                                                            <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                                                                <li>
                                                                    <a href="#" class="tooltip-info" onclick="f_shenpi('<%=tb.Rows[i]["s_id"]%>','-1')" data-rel="tooltip" title="View">
                                                                        <button class="btn btn-xs btn-danger">
                                                                            <span onclick="f_shenpi('<%=tb.Rows[i]["s_id"]%>','-1')"><i class="ace-icon fa fa-flag bigger-120"></i></span>
                                                                        </button>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </td>
                                                <%  }
                                                    } %>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.span -->
                            </div>
                            <!-- /.row -->
                            <!-- PAGE CONTENT ENDS -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.page-content -->
            </div>
        </div>
        <!-- /.main-content -->

        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div>
    <script src="../assets/js/jquery-2.1.4.min.js" type="text/javascript"></script> 
    <script src="../js/mui.min.js" type="text/javascript"></script>
    <script src="../lib/assets/layer/layer.js" type="text/javascript"></script> 
    <script type="text/javascript">
        $(function () {
            ShenPiByType();//如果是管理处进入，就去除审批按钮
        })
        function ShenPiByType() {
            var istype = $('#Hide_Sp').val();
            if (istype == '3') { $('.Hide_types').remove(); }
        }
        function f_shenpi(sid, type) {
            mui.confirm('审批是否通过？', '审批', ['通过', '退回', '取消'], function (e) {
                if (e.index == 1) {
                    f_set(sid, type);
                } else if (e.index == 2) {
                } else {
                    f_set(sid, '1');
                }
            })
        }
        //function f_set(id, type) {
        //    var Hide_Sp = $('#Hide_Sp').val();
        //    $.post("../it/SPJKSP.ashx", { TYPE: type, ID: id, sp: Hide_Sp }, function (data) {
        //        if (data == "1") {
        //            mui.toast("审批成功!");
        //            location.reload();
        //        }
        //        if (data == "-1") {
        //            mui.toast("审批失败，退出重试!");

        //        }
        //    });
        //}

        function f_set(id, type) {
            var title = "通过";
            if (type == '-1') var title = "退回";
            layer.open({
                type: 1,
                title: '审批建议',
                closeBtn: 0,
                shadeClose: true,
                shade: false,
                area: ['350px', '310px'],
                content: '<div id="mydiv" style="margin-left:10px;margin-top:10px;"><input id="txtReason" type="text" value="' + title + '" autocomplete="off" /><textarea rows="3" cols="0" class="form-control input-mask-phone" id="txtreson" placeholder="请输入审批建议" ></textarea></div>',
                btn: ['确定', '取消']
                , yes: function (index, layero) {
                    var Hide_Sp = $('#Hide_Sp').val();
                    var txtReason = $('#txtreson').val();
                    $.post("../it/SPJKSP.ashx", { TYPE: type, ID: id, sp: Hide_Sp, Name: txtReason }, function (data) {
                        if (data == "0") {
                            mui.toast(title + "成功!");
                            location.reload();
                        } else {
                            mui.toast(title);
                        }
                        layer.close(index);
                    });

                }
            });
        }
        function go_shenpi() {
            var HideTid = $('#HideTid').val();
            location.href = "wd_shenpi.aspx?TID=" + HideTid;
        }

    </script>

 
</body>
</html>
