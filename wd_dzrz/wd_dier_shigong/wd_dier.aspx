<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_dier.aspx.cs" Inherits="MarketInfo.wd_dzrz.wd_dier_shigong.wd_dier" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>高后果区统计</title>
    <meta name="description" content="Draggabble Widget Boxes with Persistent Position and State" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <!-- bootstrap & fontawesome -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../assets/font-awesome/4.5.0/css/font-awesome.min.css" />
    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="../assets/css/jquery-ui.custom.min.css" />
    <!-- text fonts -->
    <link rel="stylesheet" href="../assets/css/fonts.googleapis.com.css" />
    <!-- ace styles -->
    <link rel="stylesheet" href="../assets/css/ace.min.css" class="ace-main-stylesheet"
        id="main-ace-style" />
    <!--[if lte IE 9]>
			<link rel="stylesheet" href="/assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
    <link rel="stylesheet" href="../assets/css/ace-skins.min.css" />
    <link rel="stylesheet" href="../lib/assets/css/ace-rtl.min.css" />
    <link href="../css/mui.min.css" rel="stylesheet" type="text/css" />
    <script src="../assets/js/ace-extra.min.js" type="text/javascript"></script>
    <style type="text/css">
        ul li {
            list-style-type: none;
        }
    </style>
</head>
<body class="no-skin">
    <div class="main-container ace-save-state" id="main-container">
        <script type="text/javascript">
            try { ace.settings.loadState('main-container') } catch (e) { }
        </script>
        <div class="main-content">
            <div class="main-content-inner">
                <div class="page-content">
                    <div class="row">
                        <div class="col-xs-12">
                            <!-- PAGE CONTENT BEGINS -->
                            <div class="invisible" id="main-widget-container">
                                <div class="row">
                                    <h3 class="header smaller lighter blue"><a class="btn btn-info" href="../wd_ywsb.aspx"><i class="ace-icon fa fa-reply icon-only"></i>&nbsp;返回</a>
                                        <a class="btn btn-info" href="dier_hislist.aspx">&nbsp;历史记录</a>
                                    </h3>
                                    <form id="Form1" runat="server">
                                        <input type="hidden" id="hideFid" value="" runat="server" />

                                        <!--添加-->
                                        <div class="col-xs-12 col-sm-4 Is_HS">
                                            <div class="widget-box">
                                                <div class="widget-header">
                                                    <h4 class="widget-title">第二方施工</h4>
                                                    <span class="widget-toolbar">
                                                        <a href="#" data-action="collapse"><i class="ace-icon fa fa-chevron-up"></i></a>
                                                    </span>
                                                </div>
                                                <div class="widget-body">
                                                    <div class="widget-main">
                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">项目名称</span>
                                                                <input class="form-control input-mask-phone" type="text" id="txtsl" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;
                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">作业单位</span>
                                                                <input class="form-control input-mask-phone" type="text" id="txtxm" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;
                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">相关单位</span>
                                                                <input class="form-control input-mask-phone" type="text" id="txtwz" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;
                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">当日作业情况</span>
                                                                <input class="form-control input-mask-phone" type="text" id="txtjd" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;
                                                          </br>                                                        
                                                         <label for="form-field-mask-2">
                                                             发现问题
																<small class="text-warning">没有则填无</small>
                                                         </label>
                                                        <div>

                                                            <textarea class="form-control limited" maxlength="50" placeholder="若没有请输入无" runat="server" id="fxwt">无</textarea>
                                                        </div>
                                                        &nbsp;
                                                         <label for="form-field-mask-2">
                                                             问题整改跟踪
																<small class="text-warning">对于上次问题的跟踪</small>
                                                         </label>
                                                        <div>

                                                            <textarea class="form-control limited" maxlength="50" placeholder="若没有请输入无" runat="server" id="wtzggz">无</textarea>
                                                        </div>
                                                        &nbsp;
                                                         <label for="form-field-mask-2">
                                                             其他
																<small class="text-warning">没有填无</small>
                                                         </label>
                                                        <div>

                                                            <textarea class="form-control limited" maxlength="50" placeholder="若没有请输入无" runat="server" id="qt"></textarea>
                                                        </div>

                                                        &nbsp; 
                                                       
                                                    <div>
                                                        <ul>
                                                            <li>
                                                         
                                                                <button class="btn btn-info" type="button" onclick="er_submint('1');">
                                                                    <i class="ace-icon fa fa-check bigger-110"></i>提交
                                                                </button>
                                                                &nbsp;
                                                            <button class="btn btn-info" type="reset" onclick="er_submint('0');">
                                                                <i class="ace-icon fa fa-undo bigger-110"></i>暂存
                                                            </button>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                        <!--暂存的列表-->
                                        <div class="col-xs-12 col-sm-6 widget-container-col Is_HS" id="widget-container-col-2">
                                            <div class="widget-box widget-color-blue" id="widget-box-2">
                                                <div class="widget-header">
                                                    <h5 class="widget-title bigger lighter">
                                                        <span style="color: #FFFFFF; font-weight: bolder;"><i class="ace-icon fa fa-table"></i>&nbsp;暂存列表</span>
                                                    </h5>
                                                </div>
                                                <div class="widget-body">
                                                    <div class="widget-main no-padding">
                                                        <table class="table table-striped table-bordered table-hover">
                                                            <thead class="thin-border-bottom">
                                                                <tr>
                                                                    <th class="input-group-addon">序号</th>
                                                                    <th class="input-group-addon">项目名称  </th>
                                                                    <th class="input-group-addon">作业单位</th>
                                                                    <th class="input-group-addon hidden-480">相关单位</th>
                                                                    <th class="input-group-addon hidden-480">当日作业情况</th>
                                                                    <th class="input-group-addon">操作</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <% if (dt_1 != null)
                                                                    {
                                                                        for (int i = 0; i < dt_1.Rows.Count; i++)
                                                                        {  %>
                                                                <tr>
                                                                    <td class="input-group-addon">
                                                                        <% if (dt_1.Rows[i]["sp1"].ToString() == "-1" || dt_1.Rows[i]["sp2"].ToString() == "-1" || dt_1.Rows[i]["sp3"].ToString() == "-1")
                                                                            {  %>
                                                                        <i class="ace-icon fa fa-exclamation-triangle bigger-121" style="color: #D15B47;" title="审批未通过/被退回/修改后请重新提交" onclick="f_OpenDlg('<%=dt_1.Rows[i]["id"]%>')"></i>
                                                                        <% } %>
                                                                        <%=i+1 %></td>
                                                                  <td class="input-group-addon"><%=((dt_1.Rows[i]["er_xiangmu"].ToString().Length) > 3) ? (dt_1.Rows[i]["er_xiangmu"].ToString().Substring(0, 3) + "…") : (dt_1.Rows[i]["er_xiangmu"])%></td>
                                                                     <td class="input-group-addon"><%=((dt_1.Rows[i]["er_zydw"].ToString().Length) > 3) ? (dt_1.Rows[i]["er_zydw"].ToString().Substring(0, 3) + "…") : (dt_1.Rows[i]["er_zydw"])%></td>
                                                                    <td class="input-group-addon hidden-480">
                                                                     <%=((dt_1.Rows[i]["er_xgdw"].ToString().Length) > 8) ? (dt_1.Rows[i]["er_xgdw"].ToString().Substring(0, 8) + "…") : (dt_1.Rows[i]["er_xgdw"])%>
                                                                    </td>
                                                                    <td class="input-group-addon hidden-480">
                                                                    <%=((dt_1.Rows[i]["er_zyqk"].ToString().Length) > 8) ? (dt_1.Rows[i]["er_zyqk"].ToString().Substring(0, 8) + "…") : (dt_1.Rows[i]["er_zyqk"])%></td>
                                                                    <td class="input-group-addon">
                                                                         <a href="javascript:;"  title="提交" onclick="er_save('<%=dt_1.Rows[i]["id"]%>')"><i class="ace-icon glyphicon glyphicon-upload"></i></a>&nbsp;
       <a href="javascript:;" title="修改" onclick="er_update('0','<%=dt_1.Rows[i]["id"]%>','<%=dt_1.Rows[i]["er_xiangmu"]%>')">
                                                                   <i class="ace-icon fa fa-pencil-square-o"></i></a>&nbsp;                                                               
                                                                     <% if (dt_1.Rows[i]["sp1"].ToString() != "-1" && dt_1.Rows[i]["sp2"].ToString() != "-1" && dt_1.Rows[i]["sp3"].ToString() != "-1")
                                                                        {  %>
                                                                    <a href="javascript:;"  title="删除"><i class="ace-icon fa fa-times" onclick="er_del('<%=dt_1.Rows[i]["id"]%>')"></i></a><%} %>
                                                               
                                                                    </td>
                                                                </tr>
                                                                <% }
                                                                    }%>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                        <!--已保存的列表-->
                                        <div class="col-xs-12 col-sm-6 widget-container-col Is_HS">
                                            <div class="widget-box widget-color-blue" id="Div2">
                                                <div class="widget-header">
                                                    <h5 class="widget-title bigger lighter">
                                                        <span style="color: #FFFFFF; font-weight: bolder;"><i class="ace-icon fa fa-table"></i>&nbsp;提交列表</span>
                                                    </h5>
                                                </div>
                                                <div class="widget-body">
                                                    <div class="widget-main no-padding">
                                                        <table class="table table-striped table-bordered table-hover">
                                                            <thead class="thin-border-bottom">
                                                                <tr>
                                                                    <th class="input-group-addon">序号</th>
                                                                    <th class="input-group-addon">项目名称</th>
                                                                    <th class="input-group-addon">作业单位</th>
                                                                    <th class="input-group-addon hidden-480">相关单位</th>
                                                                    <th class="input-group-addon hidden-480">当日作业情况</th>
                                                                    <th class="input-group-addon">详情</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <% if (dt_2 != null)
                                                                    {
                                                                        for (int i = 0; i < dt_2.Rows.Count; i++)
                                                                        {  %>
                                                                <tr>
                                                                    <td class="input-group-addon" style="position: relative;">
                                                                        <%--   <% if (dt_2.Rows[i]["sp1"].ToString() == "-1" || dt_2.Rows[i]["sp2"].ToString() == "-1" || dt_2.Rows[i]["sp3"].ToString() == "-1") {  %>
                        <i class="ace-icon fa fa-exclamation-triangle bigger-121" style="cursor: pointer; position: absolute; left: 15px; top: 11px; color: #D15B47;" title="审批未通过/被退回/修改后请重新提交"></i>
                                                                    <% } %>--%>

                                                                        <% if (dt_2.Rows[i]["sp1"].ToString() == "-1" || dt_2.Rows[i]["sp2"].ToString() == "-1" || dt_2.Rows[i]["sp3"].ToString() == "-1")
                                                                            {  %>
                                                                        <i class="ace-icon fa fa-exclamation-triangle bigger-121" style="color: #D15B47;" title="审批未通过/被退回/修改后请重新提交" onclick="f_OpenDlg('<%=dt_2.Rows[i]["id"]%>')"></i>
                                                                        <% } %>
                                                                        <% if (dt_2.Rows[i]["sp1"].ToString() == "1" || dt_2.Rows[i]["sp2"].ToString() == "1" || dt_2.Rows[i]["sp3"].ToString() == "-1")
                                                                            {  %>
                                                                        <i class="ace-icon fa fa-exclamation-triangle bigger-121" style="color: #99FF99;" title="审批通过" onclick="f_OpenDlg('<%=dt_2.Rows[i]["id"]%>')"></i>
                                                                        <% } %>

                                                                        <%=i+1%>
                                                                    </td>
                                                                    <td class="input-group-addon"><%=((dt_2.Rows[i]["er_xiangmu"].ToString().Length) > 3) ? (dt_2.Rows[i]["er_xiangmu"].ToString().Substring(0, 3) + "…") : (dt_2.Rows[i]["er_xiangmu"])%></td>
                                                                     <td class="input-group-addon"><%=((dt_2.Rows[i]["er_zydw"].ToString().Length) > 3) ? (dt_2.Rows[i]["er_zydw"].ToString().Substring(0, 3) + "…") : (dt_2.Rows[i]["er_zydw"])%></td>
                                                                       <td class="input-group-addon hidden-480">
                                                                     <%=((dt_2.Rows[i]["er_xgdw"].ToString().Length) > 8) ? (dt_2.Rows[i]["er_xgdw"].ToString().Substring(0, 8) + "…") : (dt_2.Rows[i]["er_xgdw"])%>
                                                                    </td>
                                                                    <td class="input-group-addon hidden-480">
                                                                    <%=((dt_2.Rows[i]["er_zyqk"].ToString().Length) > 8) ? (dt_2.Rows[i]["er_zyqk"].ToString().Substring(0, 8) + "…") : (dt_2.Rows[i]["er_zyqk"])%></td>
                                                                    <td class="input-group-addon">
                                                                        <a href="#"><span onclick="er_update(2,'0',<%=dt_2.Rows[i]["id"]%>,0)">详情</span></a>
                                                                    </td>
                                                                </tr>
                                                                <% }
                                                                    }%>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>




                                        <!--修改-->
                                        <div class="col-xs-12 col-sm-4 Is_HS_Up" style="display: none;">
                                            <div class="widget-box">
                                                <div class="widget-header">
                                                    <h4 class="widget-title">
                                                        <span class="updateSpan ">修改</span>
                                                    </h4>
                                                    <span class="widget-toolbar">

                                                        <a href="#"><i class="ace-icon fa fa-times" onclick="er_cancel()"></i></a>
                                                    </span>
                                                </div>
                                                <div class="widget-body">
                                                    <div class="widget-main">
                                                        <input type="hidden" id="hide_id" value="" />
                                                        <input type="hidden" id="hide_fg" value="" />
                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">项目名称</span>
                                                                <input class="form-control input-mask-phone" type="text" id="txtslup" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;

                                                         <div>
                                                             <div class="input-group">
                                                                 <span class="input-group-addon">作业单位</span>
                                                                 <input class="form-control input-mask-phone" type="text" id="tzydw" placeholder="请输入" runat="server" />
                                                             </div>
                                                         </div>
                                                        &nbsp;
                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">相关单位</span>
                                                                <input class="form-control input-mask-phone" type="text" id="txgdw" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;
                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">当日作业情况</span>
                                                                <input class="form-control input-mask-phone" type="text" id="tzyqk" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;
                                                          </br>      

                                                                                                       
                                                         <label for="form-field-mask-2">
                                                             发现问题
																<small class="text-warning">没有则填无</small>
                                                         </label>
                                                        <div>

                                                            <textarea class="form-control limited" maxlength="50" placeholder="若没有请输入无" runat="server" id="faxianwenti">无</textarea>
                                                        </div>
                                                        &nbsp;
                                                         <label for="form-field-mask-2">
                                                             问题整改跟踪
																<small class="text-warning">对于上次问题的跟踪</small>
                                                         </label>
                                                        <div>

                                                            <textarea class="form-control limited" maxlength="50" placeholder="若没有请输入无" runat="server" id="wentigenzong">无</textarea>
                                                        </div>
                                                        &nbsp;
                                                         <label for="form-field-mask-2">
                                                             其他
																<small class="text-warning">没有填无</small>
                                                         </label>
                                                        <div>

                                                            <textarea class="form-control limited" maxlength="50" placeholder="若没有请输入无" runat="server" id="qita"></textarea>
                                                        </div>


                                                        <div class="updateBtn">
                                                            <ul>
                                                                <li>
                                                                    <button class="btn btn-info" type="button" onclick="er_saveup('1')">
                                                                        <i class="ace-icon fa fa-check bigger-110"></i>提交
                                                                    </button>
                                                                    &nbsp;
                                                            <button class="btn btn-info" type="button" onclick="er_saveup('0');">
                                                                <i class="ace-icon fa fa-undo bigger-110"></i>暂存
                                                            </button>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </form>
                                </div>
                                <!-- /.row -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse"><i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i></a>
    </div>

</body>
</html>
<script src="../assets/js/jquery-2.1.4.min.js" type="text/javascript"></script>
<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='../assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>
<!-- page specific plugin scripts -->
<script src="../assets/js/jquery-ui.custom.min.js" type="text/javascript"></script>
<script src="../assets/js/jquery.ui.touch-punch.min.js" type="text/javascript"></script>
<!-- ace scripts -->
<script src="../assets/js/ace-elements.min.js" type="text/javascript"></script>
<script src="../assets/js/ace.min.js" type="text/javascript"></script>
<script src="../js/mui.enterfocus.js" type="text/javascript"></script>
<script src="../js/mui.min.js" type="text/javascript"></script>
<script src="../../lib/assets/layer/layer.js" type="text/javascript"></script>
<!-- inline scripts related to this page -->
<script type="text/javascript">

    function er_saveup(fg) {

        var txttid = $('#hideFid').val();
        //   var txtfg = $('#hide_fg').val();
        var txtfg = fg;
        var txtid = $('#hide_id').val();
        var txtsl = $('#txtslup').val();//项目名称
        var txtxm = $('#tzydw').val(); //作业单位
        var txtwz = $('#txgdw').val(); //相关单位
        var txtjd = $('#tzyqk').val(); //当日作业情况
        var txtfaxianwenti = $('#faxianwenti').val();
        var txtwentigenzong = $('#wentigenzong').val();
        var txtqita = $('#qita').val();
        if (verification(txtsl, txtxm, txtwz, txtjd, txtfaxianwenti, txtwentigenzong, txtqita)) {
            $.post("../../it/DiReShiGongUpdate.ashx", { id: txtid, fg: txtfg, sl: txtsl, xm: txtxm, wz: txtwz, jd: txtjd, txtfaxianwenti: txtfaxianwenti, txtwentigenzong: txtwentigenzong, txtqita: txtqita, tid: txttid }, function (data) {
                if (data == "0") {
                    location.reload()
                    mui.toast("修改成功!");

                } else {
                    mui.toast(data);
                }
            });

        } else {
            mui.toast("请输入完整的信息~");
        }
    }
    //取消修改
    function er_cancel() {
        $('.Is_HS').show(500);
        $('.Is_HS_Up').hide(500);
    }
    //修改
    function er_update(type, isfg, id, txtsl) {
        $('.Is_HS').hide(500);
        $('.Is_HS_Up').show(500);
        if (type == 1) {
            $('.updateSpan').text("修改")
            $('.updateBtn').show();
        }
        else {
            $('.updateSpan').text("详情")
            $('.updateBtn').hide();
        }

        var txtfg = $('#hide_fg').val(isfg);
        var txtid = $('#hide_id').val(id);
        var txtsl = $('#txtslup').val(txtsl);
        $.post("dierBind.ashx", { id: id }, function (data) {
            JSons(data);
        });

    }
    function JSons(data) {
        if (data != null && data.length != 0) {
            $('#txtslup').val(data[0].er_xiangmu);
            $('#tzydw').val(data[0].er_zydw);
            $('#txgdw').val(data[0].er_xgdw);
            $('#tzyqk').val(data[0].er_zyqk);
            $('#faxianwenti').val(data[0].er_wt);
            $('#wentigenzong').val(data[0].er_gz);
            $('#qita').val(data[0].er_qt);

        }
    }
    function er_updatexx(id) {
        location.href = "dier.aspx?EDIT_GID=" + id;

    }
     //删除暂存列表中没有经过审批的数据
    function er_del(id){
     mui.confirm('是否确认删除？', '删除', function (e) {
            if (e.index == 1) {
                $.post("../../it/DiReShiGongdel.ashx", {id: id }, function (data) {
            if (data == "0") {
                mui.toast("删除成功!");
                location.reload();
            } else {
                mui.toast(data);
            }
        })
    
            } else {
                mui.toast('已取消');
            }
        })
    }

    //由暂存转为保存
    function er_save(id) {
        mui.confirm('提交之后不得修改，确认？', '提交', function (e) {
            if (e.index == 1) {
                _save(1, id);
            } else {
                mui.toast('已取消');
            }
        })

    }
    //由暂存转为保存
    function _save(fg, id) {
        $.post("../../it/DiReShiGongUpdateFg.ashx", { fg: fg, id: id }, function (data) {
            if (data == "0") {
                mui.toast("提交成功!");
                setTimeout(function () {
                    location.reload();
                }, 500)
            } else {
                mui.toast(data);
            }
        })
    }

    //提交，暂存提示弹窗
    function er_submint(fg) {
    var a=fg;
    if (a=='1')
    {
     mui.confirm('提交之后不得修改，确认？', '提交', function (e) {
            if (e.index == 1) {
                var txttid = $('#hideFid').val();
        var txtmc = $('#txtsl').val();//项目名称
        var txtzydw = $('#txtxm').val();//作业单位
        var txtxgdw = $('#txtwz').val();//相关单位
        var txtzyqk = $('#txtjd').val();//作业情况
        var txtfxwt = $('#fxwt').val();
        var txtwtzggz = $('#wtzggz').val();//问题整改跟踪
        var txtqt = $('#qt').val();//其他

        if (verification(txtmc, txtzydw, txtxgdw, txtzyqk, txtfxwt, txtwtzggz, txtqt)) {
            $.post("../../it/DiRrShiGongAdd.ashx", { fg: fg, txtmc: txtmc, txtzydw: txtzydw, txtxgdw: txtxgdw, txtzyqk: txtzyqk, txtfxwt: txtfxwt, txtwtzggz: txtwtzggz, txtqt: txtqt, tid: txttid }, function (data) {
                if (data == "0") {
                    location.reload()
                    mui.toast("提交成功!");

                } else {
                    mui.toast(data);
                }
            });
        } else {
            mui.toast("请输入完整的信息~");
        }
            } else {
                mui.toast('已取消');
            }
        })
     
      }
      else {
        var txttid = $('#hideFid').val();
        var txtmc = $('#txtsl').val();//项目名称
        var txtzydw = $('#txtxm').val();//作业单位
        var txtxgdw = $('#txtwz').val();//相关单位
        var txtzyqk = $('#txtjd').val();//作业情况
        var txtfxwt = $('#fxwt').val();
        var txtwtzggz = $('#wtzggz').val();//问题整改跟踪
        var txtqt = $('#qt').val();//其他

        if (verification(txtmc, txtzydw, txtxgdw, txtzyqk, txtfxwt, txtwtzggz, txtqt)) {
            $.post("../../it/DiRrShiGongAdd.ashx", { fg: fg, txtmc: txtmc, txtzydw: txtzydw, txtxgdw: txtxgdw, txtzyqk: txtzyqk, txtfxwt: txtfxwt, txtwtzggz: txtwtzggz, txtqt: txtqt, tid: txttid }, function (data) {
                if (data == "0") {
                    location.reload()
                    mui.toast("暂存成功!");

                } else {
                    mui.toast(data);
                }
            });
        } else {
            mui.toast("请输入完整的信息~");
        }
    
}
    


       


    }
    //验证)
    function verification(txtsl, txtxm, txtwz, txtjd, txtfxwt, txtwtzggz, txtqt) {
        var res = true;
        if (txtsl == null || txtsl == "") {
            res = false;
        }
        if (txtxm == null || txtxm == "") {
            res = false;
        }
        if (txtwz == null || txtwz == "") {
            res = false;
        }
        if (txtjd == null || txtjd == "") {
            res = false;
        }
        if (txtfxwt == null || txtfxwt == "") {
            res = false;
        }
        if (txtwtzggz == null || txtwtzggz == "") {
            res = false;
        }
        if (txtqt == null || txtqt == "") {
            res = false;
        }
        return res;
    }



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
<!--下方还有JS-->












































<script type="text/javascript">
    jQuery(function ($) {

        $('#simple-colorpicker-1').ace_colorpicker({ pull_right: true }).on('change', function () {
            var color_class = $(this).find('option:selected').data('class');
            var new_class = 'widget-box';
            if (color_class != 'default') new_class += ' widget-color-' + color_class;
            $(this).closest('.widget-box').attr('class', new_class);
        });


        // scrollables
        $('.scrollable').each(function () {
            var $this = $(this);
            $(this).ace_scroll({
                size: $this.attr('data-size') || 100,
                //styleClass: 'scroll-left scroll-margin scroll-thin scroll-dark scroll-light no-track scroll-visible'
            });
        });
        $('.scrollable-horizontal').each(function () {
            var $this = $(this);
            $(this).ace_scroll(
                {
                    horizontal: true,
                    styleClass: 'scroll-top',//show the scrollbars on top(default is bottom)
                    size: $this.attr('data-size') || 500,
                    mouseWheelLock: true
                }
            ).css({ 'padding-top': 12 });
        });

        $(window).on('resize.scroll_reset', function () {
            $('.scrollable-horizontal').ace_scroll('reset');
        });


        $('#id-checkbox-vertical').prop('checked', false).on('click', function () {
            $('#widget-toolbox-1').toggleClass('toolbox-vertical')
                .find('.btn-group').toggleClass('btn-group-vertical')
                .filter(':first').toggleClass('hidden')
                .parent().toggleClass('btn-toolbar')
        });
        // widget boxes
        // widget box drag & drop example
        $('.widget-container-col').sortable({
            connectWith: '.widget-container-col',
            items: '> .widget-box',
            handle: ace.vars['touch'] ? '.widget-title' : false,
            cancel: '.fullscreen',
            opacity: 0.8,
            revert: true,
            forceHelperSize: true,
            placeholder: 'widget-placeholder',
            forcePlaceholderSize: true,
            tolerance: 'pointer',
            start: function (event, ui) {
                //when an element is moved, it's parent becomes empty with almost zero height.
                //we set a min-height for it to be large enough so that later we can easily drop elements back onto it
                ui.item.parent().css({ 'min-height': ui.item.height() })
                //ui.sender.css({'min-height':ui.item.height() , 'background-color' : '#F5F5F5'})
            },
            update: function (event, ui) {
                ui.item.parent({ 'min-height': '' })
                //p.style.removeProperty('background-color');


                //save widget positions
                var widget_order = {}
                $('.widget-container-col').each(function () {
                    var container_id = $(this).attr('id');
                    widget_order[container_id] = []


                    $(this).find('> .widget-box').each(function () {
                        var widget_id = $(this).attr('id');
                        widget_order[container_id].push(widget_id);
                        //now we know each container contains which widgets
                    });
                });

                ace.data.set('demo', 'widget-order', widget_order, null, true);
            }
        });
        (function () {
            //restore widget order
            var container_list = ace.data.get('demo', 'widget-order', true);
            if (container_list) {
                for (var container_id in container_list) if (container_list.hasOwnProperty(container_id)) {

                    var widgets_inside_container = container_list[container_id];
                    if (widgets_inside_container.length == 0) continue;

                    for (var i = 0; i < widgets_inside_container.length; i++) {
                        var widget = widgets_inside_container[i];
                        $('#' + widget).appendTo('#' + container_id);
                    }

                }
            }


            //restore widget state
            var widgets = ace.data.get('demo', 'widget-state', true);
            if (widgets != null) {
                for (var id in widgets) if (widgets.hasOwnProperty(id)) {
                    var state = widgets[id];
                    var widget = $('#' + id);
                    if
                    (
                        (state == 'shown' && widget.hasClass('collapsed'))
                        ||
                        (state == 'hidden' && !widget.hasClass('collapsed'))
                    ) {
                        widget.widget_box('toggleFast');
                    }
                    else if (state == 'closed') {
                        widget.widget_box('closeFast');
                    }
                }
            }


            $('#main-widget-container').removeClass('invisible');


            //reset saved positions and states
            $('#reset-widgets').on('click', function () {
                ace.data.remove('demo', 'widget-state');
                ace.data.remove('demo', 'widget-order');
                document.location.reload();
            });
        })();
    });
</script>
