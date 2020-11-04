<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="szff.aspx.cs" Inherits="MarketInfo.wd_dzrz.szff" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>三庄费发放</title>
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
    <link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet"
        id="main-ace-style" />
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
                    <div class="row">
                        <div class="col-xs-12">
                            <!-- PAGE CONTENT BEGINS -->
                            <div class="invisible" id="main-widget-container">
                                <div class="row">
                                    <h3 class="header smaller lighter blue">
                                        <a class="btn btn-info" href="wd_ywsb.aspx"><i class="ace-icon fa fa-reply icon-only"></i>&nbsp;返回</a>
                                        <a class="btn btn-info" href="szff_his.aspx"><i class="ace-icon fa fa-leaf icon-only"></i>&nbsp;历史记录</a>
                                    </h3>
                                    <form id="Form2" runat="server">
                                        <div class="col-xs-12 col-sm-4 Is_HS">
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
                                                                <span class="input-group-addon">应发金额</span>
                                                                <input class="form-control input-mask-phone" type="text" id="anzhuangweizhi" placeholder="请输入"
                                                                    runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">实际发放金额 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="zhanming" placeholder="请输入"
                                                                runat="server" />
                                                        </div>
                                                    </div>


                                                        &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">进度 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="xmgcqc" value="" onclick="f_jd();" placeholder="请输入"
                                                                runat="server" />
                                                        </div>
                                                    </div>
                                                        &nbsp;

                                                       <div>
                                                           <div class="input-group">
                                                               <span class="input-group-addon">其他</span>

                                                           </div>
                                                           <textarea rows="3" cols="0" class="form-control input-mask-phone" id="sfzcsy" placeholder="请输入"
                                                               runat="server"></textarea>

                                                       </div>
                                                        &nbsp;
                                                
                                                   
                                                    &nbsp;
                                                 
                                                    &nbsp;
                                                  
                                                    &nbsp; 
                                                     
                                                    &nbsp;
                                                    <div>

                                                        <button class="btn btn-info" type="button" onclick="s_submint('0','0');">
                                                            <i class="ace-icon fa fa-check bigger-110"></i>提交
                                                        </button>
                                                        &nbsp;
                                                            <button class="btn btn-info" type="button" onclick="s_submintzc('0','0');">
                                                                <i class="ace-icon fa fa-undo bigger-110"></i>暂存
                                                            </button>

                                                    </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-4 Is_HS_Up" style="display: none;">
                                            <div class="widget-box">
                                                <div class="widget-header">

                                                    <input type="hidden" id="Hidid" value="" />

                                                    <h4 class="widget-title">
                                                        <span class="updateSpan ">修改</span>
                                                    </h4>
                                                    <span class="widget-toolbar"><a href="#"><i class="ace-icon fa fa-times" onclick="er_cancel()"></i></a></span>



                                                </div>
                                                <div class="widget-body">
                                                    <div class="widget-main">
                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">应发金额</span>
                                                                <input class="form-control input-mask-phone" type="text" id="yf" placeholder="请输入"
                                                                    runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">实际发放金额 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="sf" placeholder="请输入"
                                                                runat="server" />
                                                        </div>
                                                    </div>


                                                        &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">进度 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="jd" value="" onclick="f_jd1();" placeholder="请输入"
                                                                runat="server" />
                                                        </div>
                                                    </div>
                                                        &nbsp;

                                                       <div>
                                                           <div class="input-group">
                                                               <span class="input-group-addon">其他</span>

                                                           </div>
                                                           <textarea rows="3" cols="0" class="form-control input-mask-phone" id="qt1" placeholder="请输入"
                                                               runat="server"></textarea>

                                                       </div>
                                                        &nbsp; 
                                                    &nbsp;
                                                    <div class="updateBtn">

                                                        <button class="btn btn-info" type="button" onclick="s_upsubmint('1');">
                                                            <i class="ace-icon fa fa-check bigger-110"></i>提交
                                                        </button>
                                                        &nbsp;
                                                            <button class="btn  btn-info " type="button" onclick="s_upsubmint('0');">
                                                                <i class="ace-icon fa fa-undo bigger-110"></i>暂存
                                                            </button>

                                                    </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-6 widget-container-col Is_HS" id="widget-container-col-2">
                                            <div class="widget-box widget-color-blue" id="widget-box-2">
                                                <div class="widget-header">
                                                    <h5 class="widget-title bigger lighter">
                                                        <span style="color: #FFFFFF; font-weight: bolder;">
                                                            <i class="ace-icon fa fa-table"></i>暂存列表</span>
                                                    </h5>
                                                </div>
                                                <div class="widget-body table-responsive">
                                                    <div class="widget-main no-padding">
                                                        <table class="table table-striped table-bordered table-hover">
                                                            <thead class="thin-border-bottom">
                                                                <tr>
                                                                    <th class="input-group-addon">序号
                                                                    </th>
                                                                    <th class="input-group-addon">实际发放金额
                                                                    </th>
                                                                    <th class="input-group-addon">应发金额
                                                                    </th>
                                                                    <th class="input-group-addon">进度
                                                                    </th>
                                                                    <th class="input-group-addon hidden-480">其他
                                                                    </th>
                                                                    <th class="input-group-addon">操作
                                                                    </th>



                                                                </tr>
                                                            </thead>
                                                            <%if (tbzc != null)
                                                                {
                                                                    for (int i = 0; i < tbzc.Rows.Count; i++)
                                                                    {

                                                            %>
                                                            <tr>
                                                                <td class="input-group-addon">
                                                                    <% if (tbzc.Rows[i]["sp1"].ToString() == "-1" || tbzc.Rows[i]["sp2"].ToString() == "-1" || tbzc.Rows[i]["sp3"].ToString() == "-1")
                                                                        {  %>
                                                                    <i class="ace-icon fa fa-exclamation-triangle bigger-121" style="color: #D15B47;" title="审批未通过/被退回/修改后请重新提交" onclick="f_OpenDlg('<%=tbzc.Rows[i]["s_id"]%>')"></i>
                                                                    <% } %>
                                                                    <%=i+1%>
                                                                </td>
                                                                <td class="input-group-addon">
                                                                    <%=tbzc.Rows[i]["s_jinri_ff"]%>
                                                                </td>
                                                                <td class="input-group-addon">
                                                                    <%=tbzc.Rows[i]["s_xiaqu_yf"]%>
                                                                </td>
                                                                <td class="input-group-addon">
                                                                    <%=tbzc.Rows[i]["s_jd"]%>
                                                                </td>
                                                                <td class="input-group-addon hidden-480">
                                                                    <%=tbzc.Rows[i]["s_bz"]%>
                                                                </td>


                                                                <td class="input-group-addon">

                                                                    <a href="javascript:;" title="提交" onclick="f_post('<%=tbzc.Rows[i]["s_id"]%>');"><i class="ace-icon glyphicon glyphicon-upload"></i></a>&nbsp;&nbsp;
                                                                    <a href="javascript:;" title="修改" onclick="f_edit('<%=tbzc.Rows[i]["s_id"]%>');"><i class="ace-icon fa fa-pencil-square-o"></i></a>&nbsp;&nbsp;
                                                                    <a href="javascript:;" title="删除" onclick="er_del('<%=tbzc.Rows[i]["s_id"]%>')"><i class="ace-icon fa fa-times"></i></a>

                                                                </td>
                                                            </tr>

                                                            <%}
                                                                } %>
                                                            <tbody>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 widget-container-col Is_HS" id="Div1">
                                            <div class="widget-box widget-color-blue" id="Div2">
                                                <div class="widget-header">
                                                    <h5 class="widget-title bigger lighter">
                                                        <span style="color: #FFFFFF; font-weight: bolder;">
                                                            <i class="ace-icon fa fa-table"></i>提交列表</span>
                                                    </h5>
                                                </div>
                                                <div class="widget-body table-responsive">
                                                    <div class="widget-main no-padding">
                                                        <table class="table table-striped table-bordered table-hover">
                                                            <thead class="thin-border-bottom">
                                                                <tr>
                                                                    <th class="input-group-addon">序号
                                                                    </th>
                                                                    <th class="input-group-addon">实际发放金额
                                                                    </th>
                                                                    <th class="input-group-addon">应发金额
                                                                    </th>
                                                                    <th class="input-group-addon">进度
                                                                    </th>
                                                                    <th class="input-group-addon hidden-480">其他
                                                                    </th>
                                                                    <th class="input-group-addon">详情
                                                                    </th>



                                                                </tr>
                                                            </thead>
                                                            <%if (tbyc != null)
                                                                {
                                                                    for (int i = 0; i < tbyc.Rows.Count; i++)
                                                                    {

                                                            %>
                                                            <tr>
                                                                <td class="input-group-addon" style="position: relative;">
                                                                    <%-- <% if (tbyc.Rows[i]["sp1"].ToString() == "-1" || tbyc.Rows[i]["sp2"].ToString() == "-1" || tbyc.Rows[i]["sp3"].ToString() == "-1")
                                                                    {  %>
                                                                <i class="ace-icon fa fa-exclamation-triangle bigger-121" style="cursor: pointer; position: absolute; left: 15px; top: 11px; color: #D15B47;" title="审批未通过/被退回/修改后请重新提交"></i>
                                                                <% } %>--%>

                                                                    <% if (tbyc.Rows[i]["sp1"].ToString() == "-1" || tbyc.Rows[i]["sp2"].ToString() == "-1" || tbyc.Rows[i]["sp3"].ToString() == "-1")
                                                                        {  %>
                                                                    <i class="ace-icon fa fa-exclamation-triangle bigger-121" style="color: #D15B47;" title="审批未通过/被退回/修改后请重新提交" onclick="f_OpenDlg('<%=tbyc.Rows[i]["s_id"]%>')"></i>
                                                                    <% } %>
                                                                    <% if (tbyc.Rows[i]["sp1"].ToString() == "1" || tbyc.Rows[i]["sp2"].ToString() == "1" || tbyc.Rows[i]["sp3"].ToString() == "-1")
                                                                        {  %>
                                                                    <i class="ace-icon fa fa-exclamation-triangle bigger-121" style="color: #99FF99;" title="审批通过" onclick="f_OpenDlg('<%=tbyc.Rows[i]["s_id"]%>')"></i>
                                                                    <% } %>
                                                                    <%=i+1%>
                                                                </td>
                                                                <td class="input-group-addon">
                                                                    <%=tbyc.Rows[i]["s_jinri_ff"]%>
                                                                </td>
                                                                <td class="input-group-addon">
                                                                    <%=tbyc.Rows[i]["s_xiaqu_yf"]%>
                                                                </td>
                                                                <td class="input-group-addon">
                                                                    <%=tbyc.Rows[i]["s_jd"]%>
                                                                </td>
                                                                <td class="input-group-addon hidden-480">
                                                                    <%=tbyc.Rows[i]["s_bz"]%>
                                                                </td>
                                                                <td class="input-group-addon">
                                                                    <a href="#" onclick="f_edit(2,'<%=tbyc.Rows[i]["s_id"]%>');">详情</a>
                                                                </td>

                                                            </tr>
                                                            <%}
                                                                } %>
                                                            <tbody>
                                                            </tbody>
                                                        </table>
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
        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse"><i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i></a>
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
                content: "wd_reasonszf.aspx?id=" + id,
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



        //删除暂存列表中没有经过审批的数据
        function er_del(id) {
            mui.confirm('是否确认删除？', '删除', function (e) {
                if (e.index == 1) {
                    $.post("../../it/szffdel.ashx", { id: id }, function (data) {
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
        function s_xiugai(type, type1, type2, type3, type4, type5, type6) {

            alert(type, type1, type2, type3, type4, type5, type6);
            //              $.post("../it/it_submint.aspx?CMD=SPJK&GZC=" +
            //         strzhan + "&GBH=" + strweizhi + "&GXZQY=" + strbuwei + "&GSL=" +
            //        strleixing + "&GJRJCSL=" + strsfxunxian + "&GXCZF=" + strpzdw + "&GZFRC=" +
            //         strbeizhu, {}, function (data) {
            //             // alert(data);<a href="../it/it_submint.aspx">../it/it_submint.aspx</a>
            //             if (data == "1") {
            //                 mui.toast("提交成功!");
            //                 //f_LoginDesk();
            //             }

            //             if (data == "-1") {
            //                 mui.toast("提交操作失败，退出重试!");
            //                 //f_LoginDesk();

            //             }
            //             if (data == "0") {
            //                 mui.toast("已提交,不能修改!");
            //             }
            //   });
        }






        //视频监控   提交
        function s_submint(type, type1) {
            // mui.toast(type);
            var strzhan = $("#zhanming").val();
            if (strzhan == "") {
                mui.toast("请填写实际发放金额!");
                return;
            }
            var strweizhi = $("#anzhuangweizhi").val();
            if (strweizhi == "") {
                mui.toast("请填写应发金额!");
                return;
            }

            var strbuwei = $("#xmgcqc").val();
            if (strbuwei == "") {
                mui.toast("请填写进度!");
                return;
            }

            var strleixing = $("#sfzcsy").val();
            if (strleixing == "") {
                mui.toast("请填写其他！");
                return;
            }



            $.post("../it/it_szff.aspx?CMD=SPJK&GZC=" +
                strzhan + "&GBH=" + strweizhi + "&GXZQY=" + strbuwei + "&GSL=" +
                strleixing + "&flag=" +
                type, {}, function (data) {
                    // alert(data);<a href="../it/it_submint.aspx">../it/it_submint.aspx</a>
                    if (data == "1") {
                        mui.toast("提交成功!");
                        //f_LoginDesk();
                        location.href = "szff.aspx?EDIT_GID=" + type1;
                    }

                    if (data == "-1") {
                        mui.toast("提交操作失败，退出重试!");
                        //f_LoginDesk();

                    }
                    if (data == "0") {
                        mui.toast("已提交,不能修改!");
                    }
                });
        }


        //暂存
        function s_submintzc(type, type1) {
            // mui.toast(type);
            var strzhan1 = $("#zhanming").val();
            if (strzhan1 == "") {
                mui.toast("请填写实际发放金额!");
                return;
            }
            var strweizhi1 = $("#anzhuangweizhi").val();
            if (strweizhi1 == "") {
                mui.toast("请填写应发金额!");
                return;
            }

            var strbuwei1 = $("#xmgcqc").val();
            if (strbuwei1 == "") {
                mui.toast("请填写进度!");
                return;
            }

            var strleixing1 = $("#sfzcsy").val();
            if (strleixing1 == "") {
                mui.toast("请填写其他！");
                return;
            }

            $.post("../it/it_szff.aspx?CMD=SPJKZC&GZC=" +
                strzhan1 + "&GBH=" + strweizhi1 + "&GXZQY=" + strbuwei1 + "&GSL=" +
                strleixing1 + "&flag=" + type, {}, function (data) {

                    if (data == "1") {
                        mui.toast("暂存成功!");
                        //f_LoginDesk();
                        location.href = "szff.aspx?EDIT_GID=" + type1;

                    }

                    if (data == "-1") {
                        mui.toast("暂存操作失败，数据已存在!");
                        //f_LoginDesk();
                    }

                });
        }
        var strid = $("#id").val();

        function f_post(sid) {
            var btnArray = ['否', '是'];
            mui.confirm('提交之后不得修改，确认？', '', btnArray, function (e) {
                if (e.index == 1) {
                    f_set(sid);

                }


            })
        }

        function f_set(gid) {
            var url = "../it/it_szff.aspx?CMD=SPJKTJ&GZC=" + gid + "&s_id=" + gid;
            $.post(url, {}, function (data) {
                if (data == "1") {
                    mui.toast("提交成功!");
                    location.reload();
                }
                if (data == "-1") {
                    mui.toast("提交失败，退出重试!");

                } if (data == "0") {
                    mui.toast("已提交，请勿重复操作!");
                }
            });
        }
        //取消修改
        function er_cancel() {
            $('.Is_HS').show(500);
            $('.Is_HS_Up').hide(500);
        }
        //修改
        function f_edit(type, id) {
            $('.Is_HS').hide(500);
            $('.Is_HS_Up').show(500); if (type == 1) {
                $('.updateSpan').text("修改")
                $('.updateBtn').show(500);
            }
            else {
                $('.updateSpan').text("详情")
                $('.updateBtn').hide(500);
            }
            $('#Hidid').val(id);
            $.post("../it/getszf.ashx", { id: id }, function (data) {
                JSons(data);
            });

        }
        function JSons(data) {
            if (data != null && data.length != 0) {
                $('#yf').val(data[0].s_xiaqu_yf);
                $('#sf').val(data[0].s_jinri_ff);
                $('#jd').val(data[0].s_jd);
                $('#qt1').val(data[0].s_bz);


            }
        }
        function s_upsubmint(fg) {

            var id = $('#Hidid').val();;
            var yf = $("#yf").val();

            if (yf == "") {
                mui.toast("请填写应发金额!");
                return;
            }
            var sf = $("#sf").val();
            if (sf == "") {
                mui.toast("请填写实发金额!");
                return;
            }
            var jd = $("#jd").val();
            if (jd == "") {
                mui.toast("请填写进度!");
                return;
            }
            var qt1 = $("#qt1").val();
            if (qt1 == "") {
                mui.toast("请填写其他，若没有填无!");
                return;
            }
            alert(qt1);
            $.post("../it/upszf.ashx", { fg: fg, id: id, yf: yf, sf: sf, jd: jd, qt1: qt1 }, function (data) {
                if (data == "0") {
                    mui.toast("提交成功!");
                    setTimeout(function () {
                        location.reload();
                    }, 500)
                } else {
                    mui.toast(data);
                }
            });
        }


        function f_jd() {
            var aa = $('#zhanming').val();
            var bb = $('#anzhuangweizhi').val();
            var tt = Number(aa) / Number(bb);
            var ff = tt.toFixed(3);
            var cc = Number(ff) * 10000 / 100.00 + "%";
            $('#xmgcqc').attr("value", cc);

        }
        function f_jd1() {
            var aa = $('#sf').val();
            var bb = $('#yf').val();
            var tt = Number(aa) / Number(bb);
            // mui.toast(tt);
            var ff = tt.toFixed(3);
            var cc = Number(ff) * 10000 / 100.00 + "%";
            $('#jd').val(cc);

        }
    </script>
</body>
</html>
