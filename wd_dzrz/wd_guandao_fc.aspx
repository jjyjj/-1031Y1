﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_guandao_fc.aspx.cs" Inherits="MarketInfo.wd_dzrz.wd_guandao_fc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>管道光缆复测</title>
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
    <script src="assets/js/ace-extra.min.js" type="text/javascript"></script>
</head>
<body class="no-skin">
    <div class="main-container ace-save-state" id="main-container">
        <script type="text/javascript">
            try { ace.settings.loadState('main-container') } catch (e) { }
        </script>
        <div class="main-content">
            <div class="main-content-inner">

                <div class="page-content">
                    <a class="btn btn-info btn-sm tooltip-info" data-rel="tooltip" data-placement="bottom" title="" data-original-title="Bottm Info" href="wd_ywsb.aspx">返回</a>

                    <a class="btn btn-info btn-sm tooltip-info" data-rel="tooltip" data-placement="bottom" href="wd_guandao_fc_his.aspx"><i class="ace-icon fa fa-leaf icon-only"></i>&nbsp;历史记录</a>

                    <div class="row">
                        <div class="col-xs-12">
                            <!-- PAGE CONTENT BEGINS -->
                            <div class="invisible" id="main-widget-container">

                                <div class="row">
                                    <form id="Form1" runat="server">
                                        <input type="hidden" id="HideID" value="" />


                                        <div class="col-xs-12 col-sm-4 _UP" style="display: none;">
                                            <div class="widget-box">
                                                <div class="widget-header">
                                                    <h4 class="widget-title">
                                                        <span class="updateSpan ">修改</span>
                                                    </h4>
                                                    <span class="widget-toolbar"><a href="#"><i class="ace-icon fa fa-times" onclick="Close()"></i></a></span>

                                                </div>

                                                <div class="widget-body">
                                                    <div class="widget-main">
                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">辖区管道里程</span>
                                                                <input class="form-control input-mask-phone" type="text" id="Text1" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;
														<div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">辖区光缆里程
                                                                </span>

                                                                <input class="form-control input-mask-phone" type="text" id="Text2" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;
														<div>
                                                            <label for="form-field-mask-2">
                                                                今日复测管道里程
                                                            </label>
                                                            <div>
                                                                <input class="form-control input-mask-phone" type="text" id="Text3" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>


                                                        <div>
                                                            <label for="form-field-mask-2">
                                                                今日复测光缆里程
																
                                                            </label>
                                                            <div>
                                                                <input class="form-control input-mask-phone" type="text" id="Text4" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <label for="form-field-mask-2">
                                                                发现问题
																<small class="text-warning">没有则填无</small>
                                                            </label>
                                                            <div>
                                                                <textarea class="form-control limited" maxlength="50" placeholder="若没有请输入无" runat="server" id="Textarea1"></textarea>
                                                            </div>

                                                        </div>

                                                        <div>
                                                            <label for="form-field-mask-2">
                                                                问题整改
																
                                                            </label>
                                                            <div>
                                                                <input class="form-control input-mask-phone" type="text" id="Text5" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <label for="form-field-mask-2">
                                                                防护措施
																
                                                            </label>
                                                            <div>
                                                                <input class="form-control input-mask-phone" type="text" id="Text6" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>


                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">累积复测里程
                                                                </span>
                                                                <input class="form-control input-mask-phone" type="text" id="Text7" placeholder="" runat="server" />


                                                            </div>
                                                        </div>
                                                        &nbsp;
                                                         <div>
                                                             <div class="input-group">
                                                                 <span class="input-group-addon">复测进度
                                                                 </span>
                                                                 <input class="form-control input-mask-phone" type="text" id="Text8" placeholder="" runat="server" />
                                                             </div>
                                                         </div>

                                                        &nbsp;
                                                        <div class="updateBtn">


                                                            <button class="btn btn-info" type="button" onclick="f_update('1');">
                                                                <i class="ace-icon fa fa-check bigger-110"></i>
                                                                提交
                                                            </button>
                                                            &nbsp;
															<button class="btn  btn-info" type="button" onclick="f_update('0');">
                                                                <i class="ace-icon fa fa-undo bigger-110"></i>
                                                                暂存
                                                            </button>

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="_AD">
                                            <div class="col-xs-12 col-sm-4">
                                                <div class="widget-box">
                                                    <div class="widget-header">
                                                        <h4 class="widget-title">工作填报</h4>

                                                        <span class="widget-toolbar">

                                                            <a href="#" data-action="collapse"><i class="ace-icon fa fa-chevron-up"></i></a>
                                                        </span>
                                                    </div>

                                                    <div class="widget-body">
                                                        <div class="widget-main">
                                                            <div>
                                                                <div class="input-group">
                                                                    <span class="input-group-addon">辖区管道里程
                                                                    </span>
                                                                    <input class="form-control input-mask-phone" type="text" id="xiaqu_gdlc" placeholder="请输入" runat="server" />
                                                                </div>
                                                            </div>
                                                            &nbsp;
														<div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">辖区光缆里程
                                                                </span>

                                                                <input class="form-control input-mask-phone" type="text" id="xiaqu_gllc" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>
                                                            &nbsp;
														<div>
                                                            <label for="form-field-mask-2">
                                                                今日复测管道里程
                                                            </label>
                                                            <div>
                                                                <input class="form-control input-mask-phone" type="text" id="jinri_fcgdlc" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>


                                                            <div>
                                                                <label for="form-field-mask-2">
                                                                    今日复测光缆里程
																
                                                                </label>
                                                                <div>
                                                                    <input class="form-control input-mask-phone" type="text" id="jinri_fcgllc" placeholder="请输入" runat="server" />
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <label for="form-field-mask-2">
                                                                    发现问题
																<small class="text-warning">没有则填无</small>
                                                                </label>
                                                                <div>
                                                                    <%--	<label for="form-field-9">With Character Limit</label>
                                                                    --%>
                                                                    <textarea class="form-control limited" maxlength="50" placeholder="若没有请输入无" runat="server" id="faxian_wt"></textarea>
                                                                </div>

                                                            </div>

                                                            <div>
                                                                <label for="form-field-mask-2">
                                                                    问题整改
																
                                                                </label>
                                                                <div>
                                                                    <input class="form-control input-mask-phone" type="text" id="wt" placeholder="请输入" runat="server" />
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <label for="form-field-mask-2">
                                                                    防护措施
																
                                                                </label>
                                                                <div>
                                                                    <input class="form-control input-mask-phone" type="text" id="fh" placeholder="请输入" runat="server" />
                                                                </div>
                                                            </div>


                                                            <div>
                                                                <div class="input-group">
                                                                    <span class="input-group-addon">累积复测里程
                                                                    </span>
                                                                    <input class="form-control input-mask-phone" type="text" id="fuce_lc" placeholder="" runat="server" />


                                                                </div>
                                                            </div>
                                                            &nbsp;
                                                         <div>
                                                             <div class="input-group">
                                                                 <span class="input-group-addon">复测进度
                                                                 </span>
                                                                 <input class="form-control input-mask-phone" type="text" id="fuce_jd" placeholder="" runat="server" />
                                                             </div>
                                                         </div>

                                                            &nbsp;
                                                        <div id="BUT_AD">


                                                            <button class="btn btn-info" type="button" onclick="f_fsubmint('1');">
                                                                <i class="ace-icon fa fa-check bigger-110"></i>
                                                                提交
                                                            </button>
                                                            &nbsp;
															<button class="btn  btn-info" type="button" onclick="f_fsubmint('0');">
                                                                <i class="ace-icon fa fa-undo bigger-110"></i>
                                                                暂存
                                                            </button>

                                                        </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-6 widget-container-col" id="Div1">
                                                <div class="widget-box widget-color-blue" id="Div2">
                                                    <div class="widget-header">
                                                        <h5 class="widget-title bigger lighter">
                                                            <span style="color: #FFFFFF; font-weight: bolder;"><i class="ace-icon fa fa-table"></i>
                                                                暂存列表</span>
                                                        </h5>
                                                    </div>

                                                    <div class="widget-body">
                                                        <div class="widget-main no-padding">
                                                            <table class="table table-striped table-bordered table-hover">
                                                                <thead class="thin-border-bottom">
                                                                    <tr>
                                                                        <th width="50" class="input-group-addon">序号
                                                                        </th>
                                                                        <%--<th>
																		<i class="ace-icon fa fa-flag"></i>
																		辖区管道里程
																	</th>
																	<th>																		
																		辖区光缆里程
																	</th>--%>
                                                                        <th class="input-group-addon">今日复测管道里程
                                                                        </th>
                                                                        <th class="input-group-addon">今日复测光缆里程
                                                                        </th>
                                                                        <th class="input-group-addon">累积里程</th>
                                                                        <th class="input-group-addon">复测进度</th>
                                                                        <th class="input-group-addon">操作</th>
                                                                    </tr>
                                                                </thead>

                                                                <tbody>
                                                                    <%if (tbzc != null)
                                                                        {
                                                                            for (int i = 0; i < tbzc.Rows.Count; i++)
                                                                            {

                                                                    %>
                                                                    <tr>
                                                                        <td width="50" class="input-group-addon">
                                                                            <% if (tbzc.Rows[i]["sp1"].ToString() == "-1" || tbzc.Rows[i]["sp2"].ToString() == "-1" || tbzc.Rows[i]["sp3"].ToString() == "-1")
                                                                                {  %>
                                                                            <i class="ace-icon fa fa-exclamation-triangle bigger-121" style="color: #D15B47;" title="审批未通过/被退回/修改后请重新提交" onclick="f_OpenDlg('<%=tbzc.Rows[i]["gd_id"]%>')"></i>
                                                                            <% } %>

                                                                            <%=i+1%></td>
                                                                        <td class="input-group-addon"><%=tbzc.Rows[i]["gd_jinri_fcgdlc"]%></td>

                                                                        <td class="input-group-addon">
                                                                            <a href="#"><%=tbzc.Rows[i]["gd_jinri_fcgllc"]%></a>
                                                                        </td>

                                                                        <td class="input-group-addon">
                                                                            <span class="label label-success arrowed-in arrowed-in-right"><%=tbzc.Rows[i]["gd_fuce_lc"]%></span>
                                                                        </td>
                                                                        <td class="input-group-addon">
                                                                            <span class="label label-success arrowed-in arrowed-in-right"><%=tbzc.Rows[i]["gd_fuce_jd"]%></span>
                                                                        </td>
                                                                        <td class="input-group-addon">

                                                                            <a href="javascript:;" title="提交" onclick="f_post('','<%=tbzc.Rows[i]["gd_id"]%>');"><i class="ace-icon glyphicon glyphicon-upload"></i></a>&nbsp;&nbsp;
                                                                    <a href="javascript:;" title="修改" onclick="f_edit(1,<%=tbzc.Rows[i]["gd_id"]%>);"><i class="ace-icon fa fa-pencil-square-o"></i></a>&nbsp;&nbsp;
                                                                    <a href="javascript:;" title="删除" onclick="er_del('<%=tbzc.Rows[i]["gd_id"]%>')"><i class="ace-icon fa fa-times"></i></a>

                                                                        </td>
                                                                        <%}
                                                                            } %>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 widget-container-col" id="widget-container-col-2">
                                                <div class="widget-box widget-color-blue" id="widget-box-2">
                                                    <div class="widget-header">
                                                        <h5 class="widget-title bigger lighter">
                                                            <span style="color: #FFFFFF; font-weight: bolder;"><i class="ace-icon fa fa-table"></i>
                                                                提交列表</span>
                                                        </h5>
                                                    </div>

                                                    <div class="widget-body">
                                                        <div class="widget-main no-padding">
                                                            <table class="table table-striped table-bordered table-hover">
                                                                <thead class="thin-border-bottom">
                                                                    <tr>
                                                                        <th width="50" class="input-group-addon">序号</th>
                                                                        <th class="input-group-addon">

                                                                            <%--	<i class="ace-icon fa fa-user"></i>
                                                                    <i class="ace-icon fa fa-flag"></i>--%>
																		辖区管道里程
                                                                        </th>

                                                                        <th class="input-group-addon">辖区光缆里程
                                                                        </th>

                                                                        <th class="input-group-addon">今日复测管道里程</th>
                                                                        <th class="input-group-addon">今日复测光缆里程</th>
                                                                        <th class="input-group-addon">详情</th>
                                                                        <%-- <th class="hidden-480">操作</th>--%>
                                                                    </tr>
                                                                </thead>

                                                                <tbody>
                                                                    <%if (tb != null)
                                                                        {
                                                                            for (int i = 0; i < tb.Rows.Count; i++)
                                                                            {

                                                                    %>
                                                                    <tr>
                                                                        <td class="input-group-addon" style="position: relative;">
                                                                            <%-- <% if (tb.Rows[i]["sp1"].ToString() == "-1" || tb.Rows[i]["sp2"].ToString() == "-1" || tb.Rows[i]["sp3"].ToString() == "-1")
                                                                            {  %>
                                                                        <i class="ace-icon fa fa-exclamation-triangle bigger-121" style="cursor: pointer; position: absolute; left: 15px; top: 11px; color: #D15B47;" title="审批未通过/被退回/修改后请重新提交"></i>
                                                                        <% } %>--%>

                                                                            <% if (tb.Rows[i]["sp1"].ToString() == "-1" || tb.Rows[i]["sp2"].ToString() == "-1" || tb.Rows[i]["sp3"].ToString() == "-1")
                                                                                {  %>
                                                                            <i class="ace-icon fa fa-exclamation-triangle bigger-121" style="color: #D15B47;" title="审批未通过/被退回/修改后请重新提交" onclick="f_OpenDlg('<%=tb.Rows[i]["gd_id"]%>')"></i>
                                                                            <% } %>
                                                                            <% if (tb.Rows[i]["sp1"].ToString() == "1" || tb.Rows[i]["sp2"].ToString() == "1" || tb.Rows[i]["sp3"].ToString() == "-1")
                                                                                {  %>
                                                                            <i class="ace-icon fa fa-exclamation-triangle bigger-121" style="color: #99FF99;" title="审批通过" onclick="f_OpenDlg('<%=tb.Rows[i]["gd_id"]%>')"></i>
                                                                            <% } %>
                                                                            <%=i+1%>
                                                                        </td>
                                                                        <td class="input-group-addon"><%=tb.Rows[i]["gd_xiaqu_gdlc"]%></td>



                                                                        <td class="input-group-addon">
                                                                            <%=tb.Rows[i]["gd_xiaqu_gllc"]%>
                                                                        </td>
                                                                        <td class="input-group-addon">
                                                                            <a onclick="f_edit1(<%=tb.Rows[i]["gd_id"]%>);"><%=tb.Rows[i]["gd_jinri_fcgdlc"]%></a>
                                                                        </td>
                                                                        <td class="input-group-addon">
                                                                            <%=tb.Rows[i]["gd_jinri_fcgllc"]%>
                                                                        </td>
                                                                        <td class="input-group-addon">
                                                                            <a href="#" onclick="f_edit(2,<%=tb.Rows[i]["gd_id"]%>);">详情</a>
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
    <script type="text/javascript">
        function f_OpenDlg(id) {
            layer.open({
                type: 2,
                title: '',
                skin: 'layui-layer-lan',
                closeBtn: 1, //不显示关闭按钮
                shade: [0],
                area: ['35%', '60%'],
                anim: 2,
                content: "wd_reasonguandao.aspx?id=" + id,
            });
        }
    </script>
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
    <script type="text/javascript" charset="utf-8">
        //删除暂存列表中没有经过审批的数据
        function er_del(id) {
            mui.confirm('是否确认删除？', '删除', function (e) {
                if (e.index == 1) {
                    $.post("../../it/guandaofcdel.ashx", { id: id }, function (data) {
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
        //取消修改
        function er_cancel() {
            $('.Is_HS').show(500);
            $('.Is_HS_Up').hide(500);
        }
        //防汛
        function f_fsubmint(type) {
            // mui.toast(type);
            var xiaqu_gdlc = $("#xiaqu_gdlc").val();
            if (xiaqu_gdlc == "") {
                mui.toast("请填写辖区管道里程!");
                return;
            }
            var xiaqu_gllc = $("#xiaqu_gllc").val();
            if (xiaqu_gllc == "") {
                mui.toast("请填写辖区光缆里程!");
                return;
            }

            var jinri_fcgdlc = $("#jinri_fcgdlc").val();
            if (jinri_fcgdlc == "") {
                mui.toast("请填写今日复测管道里程!");
                return;
            }

            var jinri_fcgllc = $("#jinri_fcgllc").val();
            //  mui.toast(jinri_fcgllc);
            if (jinri_fcgllc == "") {
                mui.toast("请填写今日复测光缆里程!");
                return;
            }

            var faxian_wt = $("#faxian_wt").val();
            if (faxian_wt == "") {
                mui.toast("请填写发现问题！");
                return;
            }
            var wt = $("#wt").val();
            if (wt == "") {
                mui.toast("请填写问题整改！");
                return;
            }
            var fh = $("#fh").val();
            if (fh == "") {
                mui.toast("请填写防护措施！");
                return;
            }


            var fuce_lc = $("#fuce_lc").val();
            var fuce_jd = $("#fuce_jd").val();
            $.post("../it/it_postdata.aspx?CMD=CURTGDFC&FLAG=" + type + "&XQGDLC=" +
                xiaqu_gdlc + "&XQGLLC=" + xiaqu_gllc + "&JRFCGDLC=" + jinri_fcgdlc + "&JRFCGLLC=" +
                jinri_fcgllc + "&FXWT=" + faxian_wt + "&FCLC=" + fuce_lc + "&FCJD=" +
                fuce_jd + "&WT=" + wt + "&FH=" + fh, {}, function (data) {
                    // alert(data);<a href="../it/it_submint.aspx">../it/it_submint.aspx</a>
                    if (data == "1") {
                        mui.toast("操作成功!");
                        location.reload();
                        //f_LoginDesk();
                    }
                    if (data == "111") {
                        mui.toast("修改成功!");
                        location.reload();
                        //f_LoginDesk();
                    }
                    if (data == "11") {
                        mui.toast("暂存成功!");
                        //f_LoginDesk();
                    }
                    if (data == "-1") {
                        mui.toast("操作失败，退出重试!");
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
                } else {
                }
            })
        }
        function f_set(gid) {
            var url = "../it/it_postdata.aspx?CMD=GDFCPOST&CURTID=" + gid;
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
        function f_edit(type, fxid) {
            //location.href = "wd_guandao_fc.aspx?EDIT_GDID=" + fxid;
            $('._UP').show(500);
            $('._AD').hide(500);
            if (type == 1) {
                $('.updateSpan').text("修改")
                $('.updateBtn').show(500);
            }
            else {
                $('.updateSpan').text("详情")
                $('.updateBtn').hide(500);
            }

            $.post('ashx/selgdglfc.ashx', { id: fxid }, function (data) {
                if (data != '-1') {
                    $('#HideID').val(data[0].gd_id);
                    $('#Text1').val(data[0].gd_xiaqu_gdlc);
                    $('#Text2').val(data[0].gd_xiaqu_gllc);
                    $('#Text3').val(data[0].gd_jinri_fcgdlc);
                    $('#Text4').val(data[0].gd_jinri_fcgllc);
                    $('#Textarea1').val(data[0].gd_faxian_wt);
                    $('#Text5').val(data[0].gd_fuce_lc);
                    $('#Text6').val(data[0].gd_fh);
                    $('#Text7').val(data[0].gd_wt);
                    $('#Text8').val(data[0].gd_fuce_jd);
                } else {
                    mui.toast('读取数据失败！请退出重试');
                }
            })
        }
        function f_edit1(fxid) {
            // alert("111");
            //location.href = "wd_guandao_fc.aspx?EDIT_GDID=" + fxid;
            $('._UP').show(500);
            $('._AD').hide(500);
            var div1 = document.getElementById("BUT_AD");
            div1.style.display = "none";
            $("#BUT_AD").css('display', 'none');
            $('#BUT_AD').hide(500);
            $.post('ashx/selgdglfc.ashx', { id: fxid }, function (data) {
                if (data != '-1') {
                    $('#HideID').val(data[0].gd_id);
                    $('#Text1').val(data[0].gd_xiaqu_gdlc);
                    $('#Text2').val(data[0].gd_xiaqu_gllc);
                    $('#Text3').val(data[0].gd_jinri_fcgdlc);
                    $('#Text4').val(data[0].gd_jinri_fcgllc);
                    $('#Textarea1').val(data[0].gd_faxian_wt);
                    $('#Text5').val(data[0].gd_fuce_lc);
                    $('#Text6').val(data[0].gd_fh);
                    $('#Text7').val(data[0].gd_wt);
                    $('#Text8').val(data[0].gd_fuce_jd);
                } else {
                    mui.toast('读取数据失败！请退出重试');
                }
            })
        }
        function Close() {
            $('._AD').show(500);
            $('._UP').hide(500);
        }

        function f_update(fg) {
            var hideid = $('#HideID').val();
            var a = $('#Text1').val();
            var b = $('#Text2').val();
            var c = $('#Text3').val();
            var d = $('#Text4').val();
            var e = $('#Textarea1').val();
            var f = $('#Text5').val();
            var g = $('#Text6').val();
            var h = $('#Text7').val();
            var i = $('#Text8').val();
            var res = true;
            $('._UP input[type=text]').each(function (i, e) {
                if (e.value == "" || e.value == "") {
                    res = false;
                }
            })
            if (!e) { res = false; }
            if (!res) { mui.toast('请输入完整信息'); return false; }

            $.post('ashx/upgdglfc.ashx', { id: hideid, fg: fg, a: a, b: b, c: c, d: d, e: e, f: f, g: g, h: h, i: i }, function (data) {
                if (data == 0) {
                    mui.toast('修改成功');
                } else {
                    mui.toast(data);
                }
                location.reload();
            });
        }

    </script>
</body>
</html>
