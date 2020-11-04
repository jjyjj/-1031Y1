<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="xunhu.aspx.cs" Inherits="MarketInfo.wd_dzrz.xunhu" %>

<!DOCTYPE html
    PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>巡护情况</title>

    <meta name="description" content="Draggabble Widget Boxes with Persistent Position and State" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <!-- bootstrap & fontawesome -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css" />

    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="assets/css/jquery-ui.custom.min.css" />

    <!-- text fonts -->
    <link rel="stylesheet" href="assets/css/fonts.googleapis.com.css" />

    <!-- ace styles -->
    <link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

    <!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
    <link rel="stylesheet" href="assets/css/ace-skins.min.css" />
    <link rel="stylesheet" href="../lib/assets/css/ace-rtl.min.css" />
    <link href="../css/mui.min.css" rel="stylesheet" type="text/css" />
    <script src="assets/js/ace-extra.min.js"></script>


</head>

<body class="no-skin">

    <div class="main-container ace-save-state" id="main-container">
        <script type="text/javascript">
            try { ace.settings.loadState('main-container') } catch (e) { }
        </script>
        <div class="main-content">
            <div class="main-content-inner">

                <div class="page-content">
                    <a class="btn btn-info btn-sm tooltip-info" data-rel="tooltip" data-placement="bottom" title=""
                        data-original-title="Bottm Info" href="wd_ywsb.aspx">返回</a>
                    <a class="btn btn-info btn-sm tooltip-info" data-rel="tooltip" data-placement="bottom" title=""
                        data-original-title="Bottm Info" href="1xunhuaguanli/xh_xunxiangong.aspx">巡线工管理</a>
                    <a class="btn btn-info btn-sm tooltip-info" data-rel="tooltip" data-placement="bottom" title=""
                        data-original-title="Bottm Info" href="1xunhuaguanli/xh_xunhu_his.aspx">历史记录</a>
                    <div class="row">
                        <div class="col-xs-12">
                            <!-- PAGE CONTENT BEGINS -->
                            <div class="invisible" id="main-widget-container">
                                <div class="row">
                                    <form id="Form1" runat="server">
                                        <input type="hidden" id="hideFtid" value="" runat="server" />
                                        <input type="hidden" id="hidtype" value="" runat="server" />
                                        <input type="hidden" id="Hidzid" value="" runat="server" />
                                        <input type="hidden" id="Hidzpid" value="" runat="server" />
                                        <!-- 工作填报 -->
                                        <div class="col-xs-12 col-sm-4 Is_HS">
                                            <div class="widget-box">
                                                <div class="widget-header">
                                                    <h4 class="widget-title">工作填报</h4>
                                                    <span class="widget-toolbar">


                                                        <a href="#" data-action="collapse">
                                                            <i class="ace-icon fa fa-chevron-up"></i>
                                                        </a>


                                                    </span>
                                                </div>
                                                <div class="widget-body">
                                                    <div class="widget-main">
                                                        <div>
                                                            <div class="input-group xxgname">
                                                                <span class="input-group-addon">承包巡线工</span>
                                                            </div>
                                                        </div>
                                                        &nbsp
                                                        &nbsp;
                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">检查区段
                                                                </span>
                                                                <input class="form-control input-mask-phone" type="text"
                                                                    id="jiancha_quduan" placeholder="请输入"
                                                                    runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;
                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">检查里程
                                                                </span>
                                                                <input class="form-control input-mask-phone" type="text"
                                                                    id="jiancha_licheng" placeholder="请输入"
                                                                    runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;

                                                        <br />
                                                        <label for="form-field-mask-2">
                                                            发现问题
                                                            <small class="text-warning">没有则填无</small>
                                                        </label>
                                                        <div>

                                                            <textarea class="form-control limited" maxlength="50"
                                                                placeholder="若没有请输入无" runat="server"
                                                                id="faxian_wenti">无</textarea>
                                                        </div>
                                                        <label for="form-field-mask-2">
                                                            问题跟踪
                                                            <small class="text-warning">对于上次问题的跟踪</small>
                                                        </label>
                                                        <div>

                                                            <textarea class="form-control limited" maxlength="50"
                                                                placeholder="若没有请输入无" runat="server"
                                                                id="wenti_genzong">无</textarea>
                                                        </div>

                                                        <label for="form-field-mask-2">
                                                            其他
                                                            <small class="text-warning">没有则填无</small>
                                                        </label>
                                                        <div>

                                                            <textarea class="form-control limited" maxlength="50"
                                                                placeholder="若没有请输入无" runat="server"
                                                                id="qita">无</textarea>
                                                        </div>
                                                        &nbsp;
                                                        <div>


                                                            <button class="btn btn-info" type="button"
                                                                onclick="f_xhsubmint('1');">
                                                                <i class="ace-icon fa fa-check bigger-110"></i>
                                                                提交
                                                            </button>
                                                            &nbsp;
                                                            <button class="btn  btn-info" type="reset"
                                                                onclick="f_xhsubmint('0');">
                                                                <i class="ace-icon fa fa-undo bigger-110"></i>
                                                                暂存
                                                            </button>

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                        <!-- 暂存列表 -->
                                        <div class="col-xs-12 col-sm-6 widget-container-col Is_HS" id="Div1">
                                            <div class="widget-box widget-color-blue" id="Div2">
                                                <div class="widget-header">
                                                    <h5 class="widget-title bigger lighter">
                                                        <span style="color: #FFFFFF; font-weight: bolder;"><i
                                                            class="ace-icon fa fa-table"></i>
                                                            暂存列表</span>
                                                    </h5>
                                                </div>

                                                <div class="widget-body">
                                                    <div class="widget-main no-padding">
                                                        <table class="table table-striped table-bordered table-hover">
                                                            <thead class="thin-border-bottom">
                                                                <tr>
                                                                    <th class="input-group-addon">序号
                                                                    </th>
                                                                    <th class="input-group-addon">巡线工姓名
                                                                    </th>
                                                                    <th class="input-group-addon">起点
                                                                    </th>
                                                                    <th class="input-group-addon">终点</th>
                                                                    <th class="input-group-addon hidden-480">检查区段</th>
                                                                    <th class="input-group-addon hidden-480">检查里程</th>
                                                                    <th class="input-group-addon">操作</th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                                <%if (tbzc != null)
                                                                    {
                                                                        for (int i = 0; i < tbzc.Rows.Count; i++)
                                                                        {
                                                                            String strxxgid = tbzc.Rows[i]["xh_xunxiangong_id"].ToString();
                                                                            String sql = "select xx_name,xx_qdzh,xx_zdzh  from t_xunxiangong_info where xx_id='" + strxxgid + "'";
                                                                            System.Data.DataTable tb2 = WXDBUtility.SqlHelper.GetDataTable(sql);
                                                                            String name = "";
                                                                            String qd = "";
                                                                            String zd = "";
                                                                            if (tb2 != null)
                                                                            {
                                                                                name = tb2.Rows[0]["xx_name"].ToString();
                                                                                qd = tb2.Rows[0]["xx_qdzh"].ToString();
                                                                                zd = tb2.Rows[0]["xx_zdzh"].ToString();

                                                                            } %>
                                                                <tr>
                                                                    <td class="input-group-addon">
                                                                        <% if (tbzc.Rows[i]["sp1"].ToString() == "-1" || tbzc.Rows[i]["sp2"].ToString() == "-1" || tbzc.Rows[i]["sp3"].ToString() == "-1")
                                                                            {  %>
                                                                        <i class="ace-icon fa fa-exclamation-triangle bigger-121"
                                                                            style="cursor: pointer; position: absolute; left: 15px; top: 11px; color: #D15B47;"
                                                                            title="审批未通过/被退回/修改后请重新提交"
                                                                            onclick="f_OpenDlg('<%=tbzc.Rows[i]["xh_id"]%>')"></i>
                                                                        <% } %>
                                                                        <%=i+1%></td>
                                                                    <td class="input-group-addon"><%=name%></td>
                                                                    <td class="input-group-addon"><%=qd%></td>
                                                                    <td class="input-group-addon">
                                                                        <%=zd%>
                                                                    </td>

                                                                    <td class="input-group-addon hidden-480">
                                                                        <span
                                                                            class="label label-warning"><%=tbzc.Rows[i]["xh_jiancha_quduan"]%></span>
                                                                    </td>
                                                                    <td class="input-group-addon hidden-480">
                                                                        <span
                                                                            class="label label-warning"><%=tbzc.Rows[i]["xh_jiancha_licheng"]%>公里</span>
                                                                    </td>
                                                                    <td class="input-group-addon">
                                                                        <a href="javascript:;" title="提交"
                                                                            onclick="f_post('','<%=tbzc.Rows[i]["xh_id"]%>');"><i
                                                                                class="ace-icon glyphicon glyphicon-upload"></i></a>&nbsp;&nbsp;
                                                                        <a href="javascript:;" title="修改"
                                                                            onclick="fx_update(1,'<%=name%>','<%=tbzc.Rows[i]["xh_id"]%>');"><i
                                                                                class="ace-icon fa fa-pencil-square-o"></i></a>&nbsp;&nbsp;
                                                                        <a href="javascript:;" title="删除"
                                                                            onclick="er_del('<%=tbzc.Rows[i]["xh_id"]%>')"><i
                                                                                class="ace-icon fa fa-times"></i></a>
                                                                    </td>
                                                                    <%}
                                                                        } %>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 提交列表 -->
                                        <div class="col-xs-12 col-sm-6 widget-container-col Is_HS"
                                            id="widget-container-col-2">
                                            <div class="widget-box widget-color-blue" id="widget-box-2">
                                                <div class="widget-header">
                                                    <h5 class="widget-title bigger lighter">
                                                        <span style="color: #FFFFFF; font-weight: bolder;"><i
                                                            class="ace-icon fa fa-table"></i>
                                                            提交列表</span>
                                                    </h5>
                                                </div>
                                                <div class="widget-body">
                                                    <div class="widget-main no-padding">
                                                        <table class="table table-striped table-bordered table-hover">
                                                            <thead class="thin-border-bottom">
                                                                <tr>
                                                                    <th class="input-group-addon">序号
                                                                    </th>
                                                                    <th class="input-group-addon">巡线工姓名
                                                                    </th>
                                                                    <th class="input-group-addon">起点
                                                                    </th>
                                                                    <th class="input-group-addon">终点</th>
                                                                    <th class="input-group-addon hidden-480">检查区段</th>
                                                                    <th class="input-group-addon hidden-480">检查里程</th>
                                                                    <th class="input-group-addon">详情</th>

                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <%if (tb != null)
                                                                    {
                                                                        for (int i = 0; i < tb.Rows.Count; i++)
                                                                        {
                                                                            String strxxgid = tb.Rows[i]["xh_xunxiangong_id"].ToString();
                                                                            String sql = "select xx_name,xx_qdzh,xx_zdzh  from t_xunxiangong_info where xx_id='" + strxxgid + "'";
                                                                            System.Data.DataTable tb2 = WXDBUtility.SqlHelper.GetDataTable(sql);
                                                                            String name = "";
                                                                            String qd = "";
                                                                            String zd = "";
                                                                            if (tb2 != null)
                                                                            {
                                                                                name = tb2.Rows[0]["xx_name"].ToString();
                                                                                qd = tb2.Rows[0]["xx_qdzh"].ToString();
                                                                                zd = tb2.Rows[0]["xx_zdzh"].ToString();

                                                                            }

                                                                %>
                                                                <tr>
                                                                    <td class="input-group-addon"
                                                                        style="position: relative;">
                                                                        <%--   <% if (tb.Rows[i]["sp1"].ToString() == "-1" || tb.Rows[i]["sp2"].ToString() == "-1" || tb.Rows[i]["sp3"].ToString() == "-1")
                                                                            {  %>
                                                                        <i class="ace-icon fa fa-exclamation-triangle bigger-121"
                                                                            style="cursor: pointer; position: absolute; left: 15px; top: 11px; color: #D15B47;"
                                                                            title="审批未通过/被退回/修改后请重新提交"></i>
                                                                        <% } %>--%>

                                                                        <% if (tb.Rows[i]["sp1"].ToString() == "-1" || tb.Rows[i]["sp2"].ToString() == "-1" || tb.Rows[i]["sp3"].ToString() == "-1")
                                                                            {  %>
                                                                        <i class="ace-icon fa fa-exclamation-triangle bigger-121"
                                                                            style="color: #D15B47;"
                                                                            title="审批未通过/被退回/修改后请重新提交"
                                                                            onclick="f_OpenDlg('<%=tb.Rows[i]["xh_id"]%>')"></i>
                                                                        <% } %>
                                                                        <% if (tb.Rows[i]["sp1"].ToString() == "1" || tb.Rows[i]["sp2"].ToString() == "1" || tb.Rows[i]["sp3"].ToString() == "-1")
                                                                            {  %>
                                                                        <i class="ace-icon fa fa-exclamation-triangle bigger-121"
                                                                            style="color: #99FF99;" title="审批通过"
                                                                            onclick="f_OpenDlg('<%=tb.Rows[i]["xh_id"]%>')"></i>
                                                                        <% } %>


                                                                        <%=i+1%>
                                                                    </td>
                                                                    <td class="input-group-addon"><%=name%></td>
                                                                    <td class="input-group-addon"><%=qd%></td>

                                                                    <td class="input-group-addon">
                                                                        <%=zd%>
                                                                    </td>

                                                                    <td class="input-group-addon hidden-480">
                                                                        <span
                                                                            class="label label-warning"><%=tb.Rows[i]["xh_jiancha_quduan"]%></span>
                                                                    </td>
                                                                    <td class="input-group-addon hidden-480">
                                                                        <span
                                                                            class="label label-warning"><%=tb.Rows[i]["xh_jiancha_licheng"]%>公里</span>
                                                                    </td>

                                                                    <td class="input-group-addon">

                                                                        <%-- <span onclick="f_submint(<%=tb.Rows[i]["g_id"]%>);"><i
                                                                            class="ace-icon fa fa-pencil-square-o"></i></span>--%>
                                                                        <a href="# "
                                                                            onclick="fx_update(2,'<%=name%>','<%=tb.Rows[i]["xh_id"]%>')">详情</a>


                                                                    </td>
                                                                    <%}
                                                                        } %>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 修改 -->
                                        <div class="col-xs-12 col-sm-4 Is_HS_Up" style="display: none;">
                                            <div class="widget-box">
                                                <div class="widget-header">
                                                    <h4 class="widget-title">
                                                        <span class="updateSpan ">修改</span>
                                                    </h4>
                                                    <input type="hidden" id="upxhid" value="" runat="server" />
                                                    <span class="widget-toolbar"><a href="#"><i class="ace-icon fa fa-times" onclick="er_cancel()"></i></a></span>
                                                </div>

                                                <div class="widget-body">
                                                    <div class="widget-main">
                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">承包巡线工</span>
                                                                <input class="form-control input-mask-phone" type="text"
                                                                    id="txtxxgname" readonly="readonly"
                                                                    runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp
                                                        &nbsp;
                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">检查区段
                                                                </span>
                                                                <input class="form-control input-mask-phone" type="text"
                                                                    id="txtjcqd" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;
                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">检查里程
                                                                </span>
                                                                <input class="form-control input-mask-phone" type="text"
                                                                    id="txtjclc" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;

                                                        <br />
                                                        <label for="form-field-mask-2">
                                                            发现问题
                                                            <small class="text-warning">没有则填无</small>
                                                        </label>
                                                        <div>

                                                            <textarea class="form-control limited" maxlength="50"
                                                                placeholder="若没有请输入无" runat="server"
                                                                id="txtfxwt">无</textarea>
                                                        </div>
                                                        <label for="form-field-mask-2">
                                                            问题跟踪
                                                            <small class="text-warning">对于上次问题的跟踪</small>
                                                        </label>
                                                        <div>

                                                            <textarea class="form-control limited" maxlength="50"
                                                                placeholder="若没有请输入无" runat="server"
                                                                id="txtwtgz">无</textarea>
                                                        </div>

                                                        <label for="form-field-mask-2">
                                                            其他
                                                            <small class="text-warning">没有则填无</small>
                                                        </label>
                                                        <div>

                                                            <textarea class="form-control limited" maxlength="50"
                                                                placeholder="若没有请输入无" runat="server"
                                                                id="txtqt">无</textarea>
                                                        </div>
                                                        &nbsp;
                                                        <div class="updateBtn">


                                                            <button class="btn btn-info" type="button"
                                                                onclick="f_xhsubmint1('1');">
                                                                <i class="ace-icon fa fa-check bigger-110"></i>
                                                                提交
                                                            </button>
                                                            &nbsp;
                                                            <button class="btn btn-info" type="button"
                                                                onclick="f_xhsubmint1('0');">
                                                                <i class="ace-icon fa fa-undo bigger-110"></i>
                                                                暂存
                                                            </button>

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.span -->
                                    </form>
                                </div>
                                <!-- /.row -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div>
    <script src="assets/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript">
        if ('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
    </script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!-- page specific plugin scripts -->
    <script src="assets/js/jquery-ui.custom.min.js" type="text/javascript"></script>
    <script src="assets/js/jquery.ui.touch-punch.min.js"></script>

    <!-- ace scripts -->
    <script src="assets/js/ace-elements.min.js"></script>
    <script src="assets/js/ace.min.js"></script>

    <script src="js/mui.enterfocus.js" type="text/javascript"></script>
    <script src="js/mui.min.js" type="text/javascript"></script>
    <script src="../lib/assets/layer/layer.js" type="text/javascript"></script>
    <!-- inline scripts related to this page -->

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
    <script type="text/javascript">
        $(function () {
            XXGData()//首次数据绑定
        })
        //巡线工绑定
        function XXGData() {
            var txttid = $('#hideFtid').val();
            //var txttype = $('#hidtype').val();

            $.post('1xunhuaguanli/itxunxiangong.ashx?TID=' + txttid, {}, function (data) {
                if (data != "-1") {
                    XXGBind(data);
                } else {
                    mui.toast('数据读取失败');
                }

            })
        }
        //站区单位//遍历数据
        function XXGBind(data) {
            var op = '';
            for (var p in data) {
                op += '<option value="' + data[p].xx_id + '">' + data[p].xx_name + '</option>';
            }
            $('.xxgname').append('<select id="xx_idzz" class="form-control input-mask-phone" style="border:1px solid #D5D5D5 !important">' + op + '</select>');
        }
    </script>
    <script type="text/javascript" charset="utf-8">
        lay('#version').html('-v' + laydate.v);

        //执行一个laydate实例
        laydate.render({
            elem: '#startlx', //指定元素
            format: 'yyyy-MM-dd',
            trigger: 'click'

        });

        laydate.render({
            elem: '#endlx', //指定元素
            format: 'yyyy-MM-dd',
            trigger: 'click'
        });
        laydate.render({
            elem: '#startqj', //指定元素
            format: 'yyyy-MM-dd',
            trigger: 'click'
        });
        laydate.render({
            elem: '#endqj', //指定元素
            format: 'yyyy-MM-dd',
            trigger: 'click'
        });
        laydate.render({
            elem: '#startxx', //指定元素
            format: 'yyyy-MM-dd',
            trigger: 'click'
        });
        laydate.render({
            elem: '#endxx', //指定元素
            format: 'yyyy-MM-dd',
            trigger: 'click'
        });
        laydate.render({
            elem: '#startcg', //指定元素
            format: 'yyyy-MM-dd',
            trigger: 'click'
        });
        laydate.render({
            elem: '#endcg', //指定元素
            format: 'yyyy-MM-dd',
            trigger: 'click'
        });
        function f_OpenDlg(id) {
            layer.open({
                type: 2,
                title: '',
                skin: 'layui-layer-lan',
                closeBtn: 1, //不显示关闭按钮
                shade: [0],
                area: ['35%', '60%'],
                anim: 2,
                content: "1xunhuaguanli/wd_reasonxunhu.aspx?id=" + id,
            });
        }
        //取消修改
        function er_cancel() {
            $('.Is_HS').show(500);
            $('.Is_HS_Up').hide(500);
        }



        //巡护情况
        function f_xhsubmint(type) {
            //alert("111");
            // mui.toast(type);
            var jiancha_quduan = $("#jiancha_quduan").val();
            if (jiancha_quduan == "") {
                mui.toast("请填检查区段!");
                return;
            }
            var jiancha_licheng = $("#jiancha_licheng").val();
            if (jiancha_licheng == "") {
                mui.toast("请填写检查里程!");
                return;
            }
            var faxian_wenti = $("#faxian_wenti").val();
            if (faxian_wenti == "") {
                mui.toast("请填写发现问题!");
                return;
            }
            var wenti_genzong = $("#wenti_genzong").val();
            if (wenti_genzong == "") {
                mui.toast("请填写问题跟踪!");
                return;
            }
            var qita = $("#qita").val();
            if (qita == "") {
                mui.toast("请填写其他!");
                return;
            }
            ///下边要改
            var xx_id = $("#xx_idzz").val();
            if (xx_id == "") {
                mui.toast("请选择巡线工!");
                return;
            }
            //  alert(xx_id);<a href="../it/it_xunhuguanli.aspx">../it/it_xunhuguanli.aspx</a>
            $.post("../it/it_xunhuguanli.aspx?CMD=CURTXH&FLAG=" + type + "&JCQD=" +
                jiancha_quduan + "&JCLC=" + jiancha_licheng + "&FXWT=" + faxian_wenti + "&WTGZ=" +
                wenti_genzong + "&XXGID=" + xx_id + "&QT=" + qita, {}, function (data) {
                    // alert(data);<a href="../it/it_submint.aspx">../it/it_submint.aspx</a>
                    if (data == "1") {
                        mui.toast("提交成功!");
                        location.reload();
                        //f_LoginDesk();
                    }
                    if (data == "11") {
                        mui.toast("操作成功!");
                        location.reload();
                        //f_LoginDesk();
                    }
                    if (data == "111") {
                        mui.toast("修改成功!");
                        location.reload();
                        //f_LoginDesk();
                    }
                    if (data == "-111") {
                        mui.toast("修改失败!");
                        location.reload();
                        //f_LoginDesk();
                    }
                    if (data == "-1") {
                        mui.toast("提交操作失败，退出重试!");
                        //f_LoginDesk();

                    }
                    if (data == "-11") {
                        mui.toast("暂存操作失败，退出重试!");
                        //f_LoginDesk();

                    } if (data == "0") {
                        mui.toast("已提交,不能修改!");
                    }
                });
        }
        //巡护情况
        function f_xhsubmint1(type) {
            //alert("111");
            // mui.toast(type);
            var txtjcqd = $("#txtjcqd").val();
            if (txtjcqd == "") {
                mui.toast("请填检查区段!");
                return;
            }
            var txtjclc = $("#txtjclc").val();
            if (txtjclc == "") {
                mui.toast("请填写检查里程!");
                return;
            }
            var txtfxwt = $("#txtfxwt").val();
            if (txtfxwt == "") {
                mui.toast("请填写发现问题!");
                return;
            }
            var txtwtgz = $("#txtwtgz").val();
            if (txtwtgz == "") {
                mui.toast("请填写问题跟踪!");
                return;
            }
            var txtqt = $("#txtqt").val();
            if (txtqt == "") {
                mui.toast("请填写其他!");
                return;
            }
            //              //下边要改
            //              var xx_id = $("#xx_idzz").val();
            //              if (xx_id == "") {
            //                  mui.toast("请选择巡线工!");
            //                  return;
            //              }
            var id = $('#upxhid').val();
            //  alert(xx_id);<a href="../it/it_xunhuguanli.aspx">../it/it_xunhuguanli.aspx</a>
            $.post("../it/it_xunhuguanli.aspx?CMD=CURTUPXH&XHID=" + id + "&FLAG=" + type + "&JCQD=" +
                txtjcqd + "&JCLC=" + txtjclc + "&FXWT=" + txtfxwt + "&WTGZ=" +
                txtwtgz + "&QT=" + txtqt, {}, function (data) {
                    // alert(data);<a href="../it/it_submint.aspx">../it/it_submint.aspx</a>
                    if (data == "1") {
                        mui.toast("提交成功!");
                        location.reload();
                        //f_LoginDesk();
                    }
                    if (data == "11") {
                        mui.toast("操作成功!");
                        location.reload();
                        //f_LoginDesk();
                    }
                    if (data == "111") {
                        mui.toast("修改成功!");
                        location.reload();
                        //f_LoginDesk();
                    }
                    if (data == "-111") {
                        mui.toast("修改失败!");
                        location.reload();
                        //f_LoginDesk();
                    }
                    if (data == "-1") {
                        mui.toast("提交操作失败，退出重试!");
                        //f_LoginDesk();

                    }
                    if (data == "-11") {
                        mui.toast("暂存操作失败，退出重试!");
                        //f_LoginDesk();

                    } if (data == "0") {
                        mui.toast("已提交,不能修改!");
                    }
                });
        }

        function f_post(strbh, gid) {
            var btnArray = ['否', '是'];
            mui.confirm('提交之后不得修改，确认？', '', btnArray, function (e) {
                if (e.index == 1) {
                    f_set(gid);
                    //info.innerText = '你刚确认MUI是个好框架';
                } else {
                    //info.innerText = 'MUI没有得到你的认可，继续加油'
                }
            })
        }
        function f_set(gid) {
            var url = "../it/it_xunhuguanli.aspx?CMD=XHPOST&CURTID=" + gid;
            $.post(url, {}, function (data) {
                if (data == "1") {
                    mui.toast("提交成功!");
                    setTimeout(function () {
                        location.reload();
                    }, 500)
                }
                if (data == "-1") {
                    mui.toast("提交失败，退出重试!");

                } if (data == "0") {
                    mui.toast("已提交，请勿重复操作!");
                }
            });
        }
         //删除暂存列表中没有经过审批的数据
    function er_del(id){
     mui.confirm('是否确认删除？', '删除', function (e) {
            if (e.index == 1) {
                $.post("../../it/xunhudel.ashx", {id: id }, function (data) {
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
        //修改
        function fx_update(type, name, id) {
            $('.Is_HS').hide(500);
            $('.Is_HS_Up').show(500); if (type == 1) {
                $('.updateSpan').text("修改")
                $('.updateBtn').show();
            }
            else {
                $('.updateSpan').text("详情")
                $('.updateBtn').hide();
            }
            $('#upxhid').val(id);
            $('#txtxxgname').val(name);
            $.post("../../it/xunhudata.ashx", { id: id }, function (data) {
                JSons(data);
                console.log(data)
            });

        }
        function JSons(data) {
            if (data != null && data.length != 0) {
                $('#xx_id').val(data[0].xh_xunxiangong_id);
                $('#txtjcqd').val(data[0].xh_jiancha_quduan);
                $('#txtjclc').val(data[0].xh_jiancha_licheng);
                $('#txtfxwt').val(data[0].xh_faxian_wenti);
                $('#txtwtgz').val(data[0].xh_wenti_zhuizong);
                //   $('#txtagcqk_and_gdgxup').val(data[0].fx_gcqk_and_gdgx);
                $('#txtqt').val(data[0].xh_qita);

            }
        }
        function f_edit(xid) {
            location.href = "xunhu.aspx?EDIT_XHID=" + xid;


        }
    </script>

</body>

</html>
