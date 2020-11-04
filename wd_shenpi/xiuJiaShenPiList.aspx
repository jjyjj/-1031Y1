<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="xiuJiaShenPiList.aspx.cs" Inherits="MarketInfo.wd_shenpi.xiuJiaShenPiList" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>单位变更审批</title>
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
    <link rel="stylesheet" href="../assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

    <!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
    <link rel="stylesheet" href="../assets/css/ace-skins.min.css" />
    <link href="../wd_dzrz/lib/assets/css/ace-rtl.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/mui.min.css" rel="stylesheet" type="text/css" />
    <script src="../assets/js/ace-extra.min.js"></script>


</head>
<body class="no-skin">

    <div class="main-container ace-save-state" id="main-container">
        <script type="text/javascript">
            try { ace.settings.loadState('main-container') } catch (e) { }
        </script>
        <div class="main-content">
            <div class="main-content-inner">

                <div class="page-content">
                    <a class="btn btn-info btn-sm tooltip-info" data-rel="tooltip" data-placement="bottom" title="" data-original-title="Bottm Info" href="../wd_dzrz/main.aspx">返回首页</a>


                    <div class="row">
                        <div class="col-xs-12">
                            <!-- PAGE CONTENT BEGINS -->
                            <div class="invisible" id="main-widget-container">
                                <div class="row">
                                    <form id="Form1" runat="server">
                                        <div id="list">
                                            <div class="col-xs-12 col-sm-6 widget-container-col" id="widget-container-col-2">
                                                <div class="widget-box widget-color-blue" id="widget-box-2">
                                                    <div class="widget-header">
                                                        <h5 class="widget-title bigger lighter">
                                                            <span style="color: #FFFFFF; font-weight: bolder;"><i class="ace-icon fa fa-table"><a></a></i>
                                                                休假审批列表</span>
                                                        </h5>
                                                    </div>
                                                    <div class="widget-body">
                                                        <div class="widget-main no-padding">
                                                            <table class="table table-striped table-bordered table-hover">
                                                                <thead class="thin-border-bottom">

                                                                    <tr>
                                                                        <th class="input-group-addon">序号
                                                                        </th>
                                                                        <th class="input-group-addon ">
                                                                            <i class="ace-icon fa fa-flag"></i>
                                                                            姓名
                                                                        </th>
                                                                        <th class="input-group-addon">状态</th>

                                                                        <th class="input-group-addon hidden-480">提交时间</th>
                                                                        <th class="input-group-addon">操作</th>
                                                                    </tr>
                                                                </thead>

                                                                <tbody>
                                                                    <%if (tb != null)
                                                                        {

                                                                            for (int i = 0; i < tb.Rows.Count; i++)
                                                                            { %>
                                                                    <tr>
                                                                        <td class="input-group-addon"><%=i+1%></td>
                                                                        <td class="input-group-addon">
                                                                            <%=tb.Rows[i]["T_NAME"]%>                                                                   
                                                                        </td>
                                                                        <td class="input-group-addon ">
                                                                            <%=tb.Rows[i]["T_FLAG"].ToString()=="2"?"待审批":""%>                                                                   
                                                                        </td>
                                                                        <td class="input-group-addon hidden-480">
                                                                            <%=tb.Rows[i]["T_CRTIME"].ToString()%>                                                                   
                                                                        </td>
                                                                        <td class="input-group-addon" style="font-size: 12px">
                                                                            <a href="#" onclick="getInfo( <%=Int32.Parse(tb.Rows[i]["T_WID"].ToString())%>    )">查看</a>
                                                                            <a href="#" onclick="update( <%=Int32.Parse(tb.Rows[i]["T_WID"].ToString())%>    )">变更</a>
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
                                        <div class="widget-body" id="info" style="display: none">
                                            <div class="widget-main no-padding ">
                                                <div class="col-xs-12 col-sm-6 " style="">
                                                    <div class="widget-box">
                                                        <div class="widget-header">
                                                            <h4 class="widget-title">休假信息详情</h4>

                                                            <span class="widget-toolbar">
                                                                <a href="#" data-action="collapse"><i class="ace-icon fa fa-chevron-up"></i></a>
                                                                <a href="#" onclick="er_cancel()"><i class="ace-icon fa fa-times"></i></a></span>
                                                        </div>
                                                        <div class="widget-body">
                                                            <div class="widget-main">

                                                                <div>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon">姓名</span>
                                                                        <span id="name" class="form-control  input-mask-phone">2020-9-9</span>
                                                                    </div>
                                                                </div>
                                                                &nbsp;  
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">休假时间</span>
                                                            <span class="form-control input-mask-phone">开始: <span id="startTime" class=" input-mask-phone">2020-9-9</span></span>
                                                            <br />
                                                            <span class="form-control input-mask-phone">结束 : <span id="endTime" class=" input-mask-phone">2020-9-9</span></span>


                                                        </div>
                                                    </div>
                                                                &nbsp;
                                                   
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">原休假天数</span>
                                                            <span class="form-control input-mask-phone" id="days">3</span>
                                                        </div>
                                                    </div>
                                                                &nbsp; 
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">变更时间</span>
                                                            <span class="form-control input-mask-phone">开始: <span id="newStartTime" class=" input-mask-phone">2020-9-9</span></span>
                                                            <br />
                                                            <span class="form-control input-mask-phone">结束 : <span id="newEndTime" class=" input-mask-phone">2020-9-9</span></span>

                                                        </div>
                                                    </div>
                                                                &nbsp;
                                                                   <div>
                                                                       <div class="input-group">
                                                                           <span class="input-group-addon">现休假天数</span>
                                                                           <span class="form-control input-mask-phone" id="newsDays">3</span>
                                                                       </div>
                                                                   </div>
                                                                &nbsp; 
                                                <div>
                                                    <div class="input-group">
                                                        <span class="input-group-addon">文件</span>
                                                        <a href="#" id="file" target="_blank">
                                                            <span id="aSpanFile"></span>
                                                        </a>
                                                    </div>
                                                </div>
                                                                &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">变更原因</span>

                                                        </div>
                                                        <textarea rows="3" cols="0" class="form-control input-mask-phone" id="reason" placeholder="请输入"></textarea>
                                                    </div>


                                                            </div>
                                                            <div style="text-align: center">

                                                                <button class="btn btn-info" type="button" onclick="update();">
                                                                    <i class="ace-icon fa fa-check bigger-110"></i>确认审批
                                                                </button>
                                                            </div>
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
    <script src="../assets/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript">
        if ('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
    </script>
    <script src="../assets/js/bootstrap.min.js"></script>

    <!-- page specific plugin scripts -->
    <script src="../assets/js/jquery-ui.custom.min.js" type="text/javascript"></script>
    <script src="../assets/js/jquery.ui.touch-punch.min.js"></script>

    <!-- ace scripts -->
    <script src="../assets/js/ace-elements.min.js"></script>
    <script src="../assets/js/ace.min.js"></script>

    <script src="../wd_dzrz/js/mui.enterfocus.js" type="text/javascript"></script>
    <script src="../wd_dzrz/js/mui.min.js" type="text/javascript"></script>

    <!-- inline scripts related to this page -->

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



    </script>
    <%--jjy start--%>

    <script type="text/javascript">
        function getDaysBetween(dateString1, dateString2) {
            var startDate = Date.parse(dateString1);
            var endDate = Date.parse(dateString2);
            var days = (endDate - startDate) / (1 * 24 * 60 * 60 * 1000);
            // alert(days);
            return days;
        }
        var id = -1;
        //查看详情
        function getInfo(val) {
            id = val
            $('#info').show(500);
            $('#list').hide(500);
            $.ajax({
                url: '../it/jjy/getXiuJiaInfo.ashx',
                type: 'post',
                data: { T_WID: val },
                success: function (data) {
                    console.log(data)
                    $('#name').text(data[0].T_NAME)
                    $('#startTime').text(data[0].T_WSTART)
                    $('#endTime').text(data[0].T_WEND)
                    $('#newStartTime').text(data[0].T_NewStartTime)
                    $('#newEndTime').text(data[0].T_NewEndTime)
                    $('#file').attr('href', data[0].T_PATH)
                    $('#days').text(getDaysBetween(data[0].T_WSTART + "", data[0].T_WEND + "") + "天")
                    $('#newsDays').text(getDaysBetween(data[0].T_NewStartTime + "", data[0].T_NewEndTime + "") + "天")
                    var filePath = data[0].T_PATH;
                    var index = filePath.lastIndexOf("/")
                    filePath = filePath.substring(index + 1, filePath.length);
                    $('#aSpanFile').text(filePath);
                    $('#reason').val(data[0].T_WRENSON)
                }
            });
        }
        //同意变更
        function update(val) {
            if (id == -1) {
                id = val
            }
            mui.confirm('是否确认变更审批？', '', function (e) {
                if (e.index == 1) {
                    $.ajax({
                        url: '../it/jjy/update.ashx',
                        type: 'post',
                        data: { T_WID: id },
                        success: function (data) {
                            if (data == 0) {
                                //成功
                                mui.toast('审批成功');
                            }
                            else {
                                //error
                                mui.toast('审批失败');
                            }
                            setInterval(function () {
                                location.reload();
                            }, 500)
                        }
                    });

                } else {
                    mui.toast('已取消！');
                }
            })

        }
        //关闭
        function er_cancel() {
            $('#list').show(500);
            $('#info').hide(500);
        }
    </script>

    <%--jjyend--%>

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
</body>
</html>
