<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_bg_list.aspx.cs" Inherits="MarketInfo.wd_shenpi.wd_bg_list" %>

<!DOCTYPE html
  PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
          <a class="btn btn-info btn-sm tooltip-info" data-rel="tooltip" data-placement="bottom" title=""
            data-original-title="Bottm Info" href="../wd_dzrz/main.aspx">返回首页</a>
            <a class="btn btn-info btn-sm tooltip-info" data-rel="tooltip" data-placement="bottom" title=""
            data-original-title="Bottm Info" href="xiuJiaShenPiList.aspx">休假变更审批</a>
          <div class="row">
            <div class="col-xs-12">
              <!-- PAGE CONTENT BEGINS -->
              <div class="invisible" id="main-widget-container">
                <div class="row">
                  <form id="Form1" runat="server">
                    <div class="col-xs-12 col-sm-6 widget-container-col" id="widget-container-col-2">
                      <div class="widget-box widget-color-blue" id="widget-box-2">
                        <div class="widget-header">
                          <h5 class="widget-title bigger lighter">
                            <span style="color: #FFFFFF; font-weight: bolder;"> <i
                                class="ace-icon fa fa-table"><a></a></i>
                              人员变更待审批列表</span>
                          </h5>
                        </div>
                        <div class="widget-body">
                          <div class="widget-main no-padding">
                            <table class="table table-striped table-bordered table-hover">
                              <thead class="thin-border-bottom">
                                <tr>
                                  <th class="input-group-addon">
                                    序号
                                  </th>
                                  <th class="input-group-addon hidden-480">
                                    <i class="ace-icon fa fa-flag"></i>
                                    姓名
                                  </th>

                                  <th class="input-group-addon">原单位</th>
                                  <%-- <th  class="input-group-addon">负责人</th>--%>

                                  <th class="input-group-addon">工作日志</th>
                                </tr>
                              </thead>

                              <tbody>
                                <%if (tb != null)
                                                               {
                                                                   string strzhiwu="管理处";
                                                                   for (int i = 0; i < tb.Rows.Count; i++)
                                                                   {
                                                                       if (tb.Rows[i]["type"].ToString() == "1") {

                                                                           strzhiwu = "区主任";
                                                                       } 
                                                                       if (tb.Rows[i]["type"].ToString() == "2")
                                                                       {

                                                                           strzhiwu = "站长";
                                                                       }
                                                                       if (tb.Rows[i]["type"].ToString() == "3")
                                                                       {

                                                                           strzhiwu = "线路管理人员";
                                                                       } %>
                                <tr>
                                  <td class="input-group-addon"><%=i+1%></td>
                                  <td class="input-group-addon"><%=tb.Rows[i]["T_NAME"]%></td>
                                  <td class="input-group-addon hidden-480">
                                    <%=tb.Rows[i]["ydwname"]%>
                                  </td>

                                  <td class="input-group-addon hidden-480">
                                    <%=strzhiwu%>
                                  </td>
                                  <td class="input-group-addon">

                                    <a href="wd_shenpi.aspx?TID=<%=tb.Rows[i]["id"]%>" alt="<%=tb.Rows[i]["id"]%>"> <i
                                        class="ace-icon glyphicon glyphicon-th"></i>
                                    </a>

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


                    <!-- /.span -->
                  </form>
               
                </div><!-- /.row -->
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

    //巡护情况
    function f_xhsubmint(type) {
      //alert("111");
      // mui.toast(type);
      var changzhan = $("#changzhan").val();
      if (changzhan == "") {
        mui.toast("请填写场站!");
        return;
      }
      var zhuguan_zz = $("#zhuguan_zz").val();
      if (zhuguan_zz == "") {
        mui.toast("请填写主管站长!");
        return;
      }
      var xianlu_gl = $("#xianlu_gl").val();
      if (xianlu_gl == "") {
        mui.toast("请填写线路管理员!");
        return;
      }
      var bianhao = $("#bianhao").val();
      if (bianhao == "") {
        mui.toast("请填写编号!");
        return;
      }
      var chengbao_xxg = $("#chengbao_xxg").val();
      if (chengbao_xxg == "") {
        mui.toast("请填写承包巡线工!");
        return;
      }
      var qidian_xzqy = $("#qidian_xzqy").val();
      if (qidian_xzqy == "") {
        mui.toast("请填写起点行政区域!");
        return;
      }
      var zhuanghao = $("#zhuanghao").val();
      //mui.toast(strzfshu);
      if (zhuanghao == "") {
        mui.toast("请填写桩号!");
        return;
      }
      var zhongdian_xzqy = $("#zhongdian_xzqy").val();
      if (zhongdian_xzqy == "") {
        mui.toast("请填写终点行政区域!");
        return;
      }
      var licheng = $("#licheng").val();
      if (licheng == "") {
        mui.toast("请填写里程!");
        return;
      }
      var xunhu_xzqy = $("#xunhu_xzqy").val();
      if (xunhu_xzqy == "") {
        mui.toast("请填写巡护行政区域!");
        return;
      }
      var xunhu_lc = $("#xunhu_lc").val();
      if (xunhu_lc == "") {
        mui.toast("请填写巡护里程!");
        return;
      }
      var beizhu = $("#beizhu").val();
      if (beizhu == "") {
        mui.toast("请填写备注，若没有请填写无!");
        return;
      }
      $.post("../it/it_post.aspx?CMD=CURTXH&FLAG=" + type + "&XCZ=" +
        changzhan + "&XZGZZ=" + zhuguan_zz + "&XLXGLY=" + xianlu_gl + "&XBH=" +
        bianhao + "&XCBXXG=" + chengbao_xxg + "&XQDXZQY=" + qidian_xzqy + "&XZH=" +
        zhuanghao + "&XZDXZQY=" + zhongdian_xzqy + "&XLC=" + licheng + "&XXHXZQY=" + xunhu_xzqy + "&XXHLC=" + xunhu_lc + "&XBZ=" + beizhu, {}, function (data) {
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
      var url = "../it/it_post.aspx?CMD=XHPOST&CURTID=" + gid;
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
    function f_edit(xid) {
      location.href = "xunhu.aspx?EDIT_XHID=" + xid;


    }
  </script>






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