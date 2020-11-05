<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="huiYiJlList.aspx.cs" Inherits="MarketInfo.wd_dzrz.user.huiYiJlList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>单位信息变更</title>
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
    <script type="text/javascript" charset="utf-8" src="../../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../../ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="../../ueditor/lang/zh-cn/zh-cn.js"></script>
    <style type="text/css">
        ul li {
            list-style-type: none;
        }

        .OverHideTd {
            word-break: break-all;
            font-size: 14px;
            color: #555;
            text-align: center;
            background-color: #eee;
            font-weight: 400;
        }

        @keyframes gywm_text {
            0% {
                transform: translateX(-100%);
                opacity: 0;
            }

            100% {
                transform: translateX(0);
                opacity: 1;
            }
        }

        @media screen and (min-width: 480px) {
            h3.centersa {
                text-align: center;
            }

            div.auto_list {
                margin: 1% 0 0 25%;
            }

            div.auto_add {
                margin: 1% 0 0 33.333%;
            }
        }

        div.row h3.header a.btn {
            margin-top: 5px;
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
                                    <h3 class="header smaller lighter blue">
                                        <a class="btn btn-info" href="../wd_ywsb.aspx"><i class="ace-icon fa fa-reply icon-only"></i>&nbsp;返回首页</a>

                                        <a class="btn btn-info" onclick="huiYiList()" id="afh">&nbsp;会议记录列表</a>
                                        <a class="btn btn-info" style="display: none" id="fh" onclick="fh()">&nbsp;会议记录填报</a>
                                    </h3>
                                    <form id="Form1" runat="server">

                                        <input type="hidden" id="hideFid" value="" runat="server" />


                                        <!--添加-->
                                        <div id="add" class="col-xs-12 col-sm-8 Is_HS">
                                            <div class="widget-box">
                                                <div class="widget-header">
                                                    <h4 class="widget-title">
                                                        <span class="updateSpan ">会议记录填报</span>
                                                    </h4>
                                                    <span class="widget-toolbar">

                                                        <a href="#" data-action="collapse"><i class="ace-icon fa fa-chevron-up"></i></a>

                                                    </span>
                                                </div>
                                                <div class="widget-body">
                                                    <div class="widget-main">
                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">标题</span>
                                                                <input class="form-control input-mask-phone" type="text" id="title" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp

                                                        <%--<div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">上传附件</span>
                                                                <input class="form-control input-mask-phone" type="file" id="Text1" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>--%>
                                                        &nbsp
                                                   <div>
                                                       <div class="input-group">
                                                           <span class="input-group-addon">内容</span>

                                                           <div>
                                                               <script id="editor" type="text/plain" style="width: 100%; height: 500px;"></script>
                                                           </div>
                                                       </div>
                                                   </div>
                                                        &nbsp&nbsp

                                                        <div id="tj" style="text-align: center">

                                                            <button class="btn btn-info" type="button" onclick="f_submint()">
                                                                <i class="ace-icon fa fa-check bigger-110"></i>
                                                                提交
                                                            </button>


                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <!--已保存的列表-->
                                        <div id="list" class="col-xs-12 col-sm-6 widget-container-col Is_HS" style="display: none">
                                            <div class="widget-box widget-color-blue" id="Div2">
                                                <div class="widget-header">
                                                    <h5 class="widget-title bigger lighter">
                                                        <span style="color: #FFFFFF; font-weight: bolder;"><i class="ace-icon fa fa-table"></i>
                                                            会议记录列表</span>
                                                    </h5>
                                                </div>
                                                <div class="widget-body">
                                                    <div class="widget-main no-padding">
                                                        <table class="table table-striped table-bordered table-hover">
                                                            <thead class="thin-border-bottom">
                                                                <tr>
                                                                    <th class="input-group-addon">
                                                                        <i class="ace-icon fa fa-flag"></i>序号
                                                                    </th>
                                                                    <th class="input-group-addon ">标题
                                                                    </th>
                                                                    <th class="input-group-addon  hidden-480">填写时间
                                                                    </th>
                                                                    <th class="input-group-addon">操作
                                                                    </th>

                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <% if (tb != null)
                                                                    {
                                                                        for (int i = 0; i < tb.Rows.Count; i++)
                                                                        {  %>
                                                                <tr>
                                                                    <td class="input-group-addon">
                                                                        <%=i+1%>
                                                                    </td>
                                                                    <td class="input-group-addon">
                                                                        <%=stringStr(tb.Rows[i]["Title"].ToString(),10)%>
                                                                    </td>
                                                                    <td class="input-group-addon hidden-480">
                                                                        <%=tb.Rows[i]["CreateTime"]%>
                                                                    </td>
                                                                    <td class="input-group-addon">
                                                                        <a href="javascript:;" title="详情" onclick="getHuiYiInfo(<%=tb.Rows[i]["id"]%>)">详情
                                                                        </a>
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
    <script type="text/javascript">

        //实例化编辑器
        //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
        var ue = window.UE.getEditor('editor');



    </script>
</body>
</html>
<script src="../assets/js/ace-extra.min.js" type="text/javascript"></script>
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
<script src="../js/layer/layer.js" type="text/javascript"></script>
<script src="../wd_disanf/JSS.js" type="text/javascript"></script>
<script type="text/javascript" src="addfile.js"></script>
<script src="data.js" type="text/javascript"></script>
<script src="../../lib/assets/layer/layer.js"></script>

<!-- inline scripts related to this page -->


<script type="text/javascript">
    //列表显示，添加隐藏
    function huiYiList() {

        $('#list').show(500);
        $('#add').hide(500)
        $('#fh').show();
        $('#afh').hide();

    }
    //添加显示，列表隐藏
    function fh() {
        $('#list').hide(500);
        $('#add').show(500)
        $('#fh').hide();
        $('#afh').show()
        $('#tj').show();
        $('.updateSpan').text("会议记录填报")
        UE.getEditor('editor').setEnabled();
        $('#title').val('')
        UE.getEditor('editor').setContent(' ');
    }
    //提交
    function f_submint() {

        var uId = '<%=Session["CUR_TID"]%>';
        var title = $('#title').val();
        var content = UE.getEditor('editor').getContent();
        var case1 = title.length <= 0 || content.length <= 0 ? false : true;

        if (case1) {
            $("#add").hide();
            mui.confirm('是否确认提交？', '', function (e) {
                if (e.index == 1) {
                    //进行提交
                    save(uId, title, content)
                    ////清空内容
                    $("#add").show();
                    $('#title').val('')
                    UE.getEditor('editor').setContent(' ');

                } else {
                    $("#add").show();
                    mui.toast('已取消！');
                }
            })
        }
        else {
            mui.toast('请检查信息是否填报完整！');
        }
    }
    function save(uId, title, content) {
        $.ajax({
            url: '../../it/jjy/addHuiYi.ashx',
            type: 'post',
            data: {
                uId: uId,
                title: title,
                content: content
            },
            success: function (data) {
                mui.toast(data);
                setInterval(function () {
                    location.reload()
                }, 500)
            }
        });
    }
    //查看详情
    function getHuiYiInfo(val) {
        $.ajax({
            url: '../../it/jjy/getHuiYiInfo.ashx',
            type: 'post',
            data: {
                id: val
            },
            success: function (data) {
                fh();
                $('#tj').hide();
                $('.updateSpan').text("会议记录详情")
                console.log(data)
                $('#title').val(data[0].Title)
                UE.getEditor('editor').setContent(data[0].Content);
                UE.getEditor('editor').setDisabled('fullscreen');


            }
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



