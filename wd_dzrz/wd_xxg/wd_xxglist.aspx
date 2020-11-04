<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_xxglist.aspx.cs" Inherits="MarketInfo.wd_xxg.xxglist" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title></title>
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
    ul li{ list-style-type:none;}
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
                                <div class="row"><!--wd_dzrz/wd_ywsb.aspx-->
                                 <h3 class="header smaller lighter blue"> <a class="btn btn-info" href="../wd_ywsb.aspx"><i class="ace-icon fa fa-reply icon-only"></i>&nbsp;返回首页</a> </h3>
                                    <form id="Form1" runat="server">
                                     <input type="hidden" id="hideFid" value="" runat="server" />
                                    <!--添加-->
                                    <div class="col-xs-12 col-sm-4 Is_HS">
                                        <div class="widget-box">
                                            <div class="widget-header">
                                                <h4 class="widget-title">工作填报</h4>
                                                <span class="widget-toolbar">
                                                <a href="#" data-action="settings"><i class="ace-icon fa fa-cog"></i></a>
                                                <a href="#" data-action="reload"><i class="ace-icon fa fa-refresh"></i></a>
                                                <a href="#" data-action="collapse"><i class="ace-icon fa fa-chevron-up"></i></a> </span>
                                            </div>
                                            <div class="widget-body">
                                                <div class="widget-main">
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">辖区巡线工总数 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="txtzs" placeholder="请输入"  runat="server" />
                                                        </div></div>
                                                    &nbsp;
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">今日请假情况 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="txtqj" placeholder="请输入"  runat="server" />
                                                        </div></div>
                                                    &nbsp;
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">今日检查数量 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="txtjc" placeholder="请输入"  runat="server" />
                                                        </div></div>
                                                    &nbsp;
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">人员名称 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="txtname" placeholder="请输入"  runat="server" />
                                                        </div></div>
                                                    &nbsp;
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">发现问题 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="txtwt" placeholder="请输入"  runat="server" />
                                                        </div></div>
                                                    &nbsp;
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">今日奖罚 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="txtjf" placeholder="请输入"  runat="server" />
                                                        </div></div>
                                                    &nbsp;
                                                    <div>
                                                    <ul>
                                                        <li>
                                                            <button class="btn btn-info" type="button" onclick="x_submint('1');">
                                                                <i class="ace-icon fa fa-check bigger-110"></i>提交
                                                            </button>
                                                            &nbsp;
                                                            <button class="btn" type="reset" onclick="x_submint('0');">
                                                                <i class="ace-icon fa fa-undo bigger-110"></i>暂存
                                                            </button>
                                                        </li></ul>
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
                                                    <span style="color: #FFFFFF; font-weight: bolder;"><i class="ace-icon fa fa-table"></i>暂存列表</span>
                                                </h5>
                                            </div>
                                            <div class="widget-body">
                                                <div class="widget-main no-padding">
                                                    <table class="table table-striped table-bordered table-hover">
                                                        <thead class="thin-border-bottom">
                                                            <tr>
                                                            <th class="input-group-addon"><i class="ace-icon fa fa-flag"></i>序号</th>
                                                                <th class="input-group-addon">辖区巡线工总数  </th> 
                                                                <th class="input-group-addon">今日请假情况</th> 
                                                                <th class="input-group-addon">今日检查数量</th> 
                                                                <th class="input-group-addon">人员名称</th> 
                                                                <th class="input-group-addon">发现问题</th> 
                                                                <th class="input-group-addon">今日奖罚</th> 
                                                                <th class="input-group-addon">操作</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        <% if (dt_1 != null) { for (int i = 0; i < dt_1.Rows.Count; i++) {  %>
                                                            <tr>    
                                                                <td class="input-group-addon"><%=i+1 %></td>
                                                                <td class="input-group-addon"><%=dt_1.Rows[i]["x_zongshu"]%></td> 
                                                                <td class="input-group-addon"><%=dt_1.Rows[i]["x_jrqingjia"]%></td> 
                                                                <td class="input-group-addon"><%=dt_1.Rows[i]["x_jrjiancha"]%></td> 
                                                                <td class="input-group-addon"><%=dt_1.Rows[i]["x_name"]%></td>
                                                                <td class="input-group-addon"><%=dt_1.Rows[i]["x_jiangli"]%></td>
                                                                <td class="input-group-addon"><%=dt_1.Rows[i]["x_wenti"]%></td>
                                                                <td class="input-group-addon">
                                                                    <a href="javascript:;"  title="保存" onclick="x_save('<%=dt_1.Rows[i]["id"]%>')"><i class="ace-icon glyphicon glyphicon-upload"></i></a>
       <a href="javascript:;" title="修改" onclick="x_update('0','<%=dt_1.Rows[i]["id"]%>','<%=dt_1.Rows[i]["x_zongshu"]%>','<%=dt_1.Rows[i]["x_jrqingjia"]%>','<%=dt_1.Rows[i]["x_jrjiancha"]%>','<%=dt_1.Rows[i]["x_name"]%>','<%=dt_1.Rows[i]["x_jiangli"]%>','<%=dt_1.Rows[i]["x_wenti"]%>')">
                                                                   <i class="ace-icon fa fa-pencil-square-o"></i></a>                                                                
                                                                </td>
                                                            </tr>
                                                            <% } }%>
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
                                                    <span style="color: #FFFFFF; font-weight: bolder;"><i class="ace-icon fa fa-table"></i>保存列表</span>
                                                </h5>
                                            </div>
                                            <div class="widget-body">
                                                <div class="widget-main no-padding">
                                                    <table class="table table-striped table-bordered table-hover">
                                                        <thead class="thin-border-bottom">
                                                            <tr>
                                                            <th class="input-group-addon"><i class="ace-icon fa fa-flag"></i>序号</th>
                                                                <th class="input-group-addon">辖区巡线工总数</th> 
                                                                <th class="input-group-addon">今日请假情况</th> 
                                                                <th class="input-group-addon">今日检查数量</th> 
                                                                <th class="input-group-addon">人员名称</th> 
                                                                <th class="input-group-addon">发现问题</th> 
                                                                <th class="input-group-addon">今日奖罚</th>  
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        <% if (dt_2 != null) { for (int i = 0; i < dt_2.Rows.Count; i++) {  %>
                                                            <tr>    
                                                                <td class="input-group-addon"><%=i+1%></td>
                                                                <td class="input-group-addon"><%=dt_2.Rows[i]["x_zongshu"]%></td>
                                                                <td class="input-group-addon"><%=dt_2.Rows[i]["x_jrqingjia"]%></td> 
                                                                <td class="input-group-addon"><%=dt_2.Rows[i]["x_jrjiancha"]%></td> 
                                                                <td class="input-group-addon"><%=dt_2.Rows[i]["x_name"]%></td>
                                                                <td class="input-group-addon"><%=dt_2.Rows[i]["x_jiangli"]%></td>
                                                                <td class="input-group-addon"><%=dt_2.Rows[i]["x_wenti"]%></td> 
                                                            </tr>
                                                            <% } }%>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>




                                    <!--修改--> 
                                    <div class="col-xs-12 col-sm-4 Is_HS_Up" style="display:none;">
                                        <div class="widget-box">
                                            <div class="widget-header">
                                                <h4 class="widget-title">修改</h4>
                                                <span class="widget-toolbar">
                                                <a href="#" data-action="settings"><i class="ace-icon fa fa-cog"></i></a>
                                                <a href="#" data-action="reload"><i class="ace-icon fa fa-refresh"></i></a>
                                                <a href="#" data-action="collapse"><i class="ace-icon fa fa-chevron-up"></i></a>
                                                <a href="#"  onclick="x_cancel()" ><i class="ace-icon fa fa-times"></i></a></span>
                                            </div>
                                            <div class="widget-body">
                                                <div class="widget-main">
                                                <input type="hidden" id="hide_id" value="" />
                                                <input type="hidden" id="hide_fg" value="" />
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">辖区巡线工总数 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="txtzsup" placeholder="请输入"  runat="server" />
                                                        </div></div>
                                                    &nbsp;
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">今日请假情况 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="txtqjup" placeholder="请输入"  runat="server" />
                                                        </div></div>
                                                    &nbsp;
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">今日检查数量 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="txtjcup" placeholder="请输入"  runat="server" />
                                                        </div></div>
                                                    &nbsp;
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">人员名称 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="txtnameup" placeholder="请输入"  runat="server" />
                                                        </div></div>
                                                    &nbsp;
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">发现问题 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="txtwtup" placeholder="请输入"  runat="server" />
                                                        </div></div>
                                                    &nbsp;
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">今日奖罚 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="txtjfup" placeholder="请输入"  runat="server" />
                                                        </div></div>
                                                    &nbsp;
                                                    <div>
                                                    <ul>
                                                        <li>
                                                            <button class="btn btn-info" type="button" onclick="x_saveup('1')"><i class="ace-icon fa fa-check bigger-110"></i>提交</button> 
                                                             &nbsp;
                                                            <button class="btn" type="reset" onclick="x_saveup('0');"><i class="ace-icon fa fa-undo bigger-110"></i>暂存</button>
                                                        </li></ul>
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
        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse"><i class="ace-icon fa fa-angle-double-up icon-only bigger-110">
        </i></a>
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
    <!-- inline scripts related to this page -->
<script type="text/javascript">
    //修改
    function x_saveup(fg) {
        var txttid = $('#hideFid').val();
        var txtfg = fg;
        var txtid = $('#hide_id').val();
        var txtzs = $('#txtzsup').val();
        var txtqj = $('#txtqjup').val();
        var txtjc = $('#txtjcup').val();
        var txtname = $('#txtnameup').val();
        var txtwt = $('#txtwtup').val();
        var txtjf = $('#txtjfup').val();
        if (verification(txtzs, txtqj, txtjc, txtname, txtwt, txtjf)) {
            $.post("../../it/XunXianGongUpdate.ashx", { fg: txtfg, id: txtid, zs: txtzs, qj: txtqj, jc: txtjc, name: txtname, wt: txtwt, jf: txtjf, tid: txttid }, function (data) {
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
    function x_cancel() { 
        $('.Is_HS').show(500);
        $('.Is_HS_Up').hide(500);
    } 
    //修改
    function x_update(isfg,id,zs, qj, jc, name, wt, jf) {
        $('.Is_HS').hide(500);
        $('.Is_HS_Up').show(500);
        var txtfg = $('#hide_fg').val(isfg);
        var txtid = $('#hide_id').val(id);
        var txtzs = $('#txtzsup').val(zs);
        var txtqj = $('#txtqjup').val(qj);
        var txtjc = $('#txtjcup').val(jc);
        var txtname = $('#txtnameup').val(name);
        var txtwt = $('#txtwtup').val(wt);
        var txtjf = $('#txtjfup').val(jf); 
    } 
    //由暂存转为保存
    function x_save(id) {
        mui.confirm('是否确认保存？', '保存', function (e) {
            if (e.index == 1) {
                save(1,id   );
            } else {
                mui.toast('已取消');
            }
        })

    }
    //由暂存转为保存
    function save(fg,id) {
        $.post("../../it/XunXianGongUpdateFg.ashx", { fg: fg,id:id }, function (data) {
            if (data == "0") {
                mui.toast("提交成功!");
                location.reload();
            } else {
                mui.toast(data);
            }
        })
    } 
    //保存/暂存
    function x_submint(fg) {
        var txttid = $('#hideFid').val();
        var txtzs = $('#txtzs').val();
        var txtqj = $('#txtqj').val();
        var txtjc = $('#txtjc').val();
        var txtname = $('#txtname').val();
        var txtwt = $('#txtwt').val();
        var txtjf = $('#txtjf').val();
        if (verification(txtzs, txtqj, txtjc, txtname, txtwt, txtjf)) {
            $.post("../../it/XunXianGongAdd.ashx", { fg: fg, zs: txtzs, qj: txtqj, jc: txtjc, name: txtname, wt: txtwt, jf: txtjf, tid: txttid }, function (data) {
                if (data == "0") {
                    location.reload()
                    mui.toast("提交成功!");

                } else {
                    mui.toast(data);
                }

            })
        } else {
            mui.toast("请输入完整的信息~");
        }

    }
    //验证
    function verification(txtzs, txtqj, txtjc, txtname, txtwt, txtjf) {
        var res = true;
        if (txtzs == null || txtzs == "") {
            res = false;
        }
        if (txtqj == null || txtqj == "") {
            res = false;
        }
        if (txtjc == null || txtjc == "") {
            res = false;
        }
        if (txtname == null || txtname == "") {
            res = false;
        }
        if (txtwt == null || txtwt == "") {
            res = false;
        }
        if (txtjf == null || txtjf == "") {
            res = false;
        }
        return res;
    }
</script>


    <script type="text/javascript">
			jQuery(function($) {
			
				$('#simple-colorpicker-1').ace_colorpicker({pull_right:true}).on('change', function(){
					var color_class = $(this).find('option:selected').data('class');
					var new_class = 'widget-box';
					if(color_class != 'default')  new_class += ' widget-color-'+color_class;
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
					).css({'padding-top': 12});
				});
				
				$(window).on('resize.scroll_reset', function() {
					$('.scrollable-horizontal').ace_scroll('reset');
				});
			
				
				$('#id-checkbox-vertical').prop('checked', false).on('click', function() {
					$('#widget-toolbox-1').toggleClass('toolbox-vertical')
					.find('.btn-group').toggleClass('btn-group-vertical')
					.filter(':first').toggleClass('hidden')
					.parent().toggleClass('btn-toolbar')
				});
				// widget boxes
				// widget box drag & drop example
			    $('.widget-container-col').sortable({
			        connectWith: '.widget-container-col',
					items:'> .widget-box',
					handle: ace.vars['touch'] ? '.widget-title' : false,
					cancel: '.fullscreen',
					opacity:0.8,
					revert:true,
					forceHelperSize:true,
					placeholder: 'widget-placeholder',
					forcePlaceholderSize:true,
					tolerance:'pointer',
					start: function(event, ui) {
						//when an element is moved, it's parent becomes empty with almost zero height.
						//we set a min-height for it to be large enough so that later we can easily drop elements back onto it
						ui.item.parent().css({'min-height':ui.item.height()})
						//ui.sender.css({'min-height':ui.item.height() , 'background-color' : '#F5F5F5'})
					},
					update: function(event, ui) {
						ui.item.parent({'min-height':''})
						//p.style.removeProperty('background-color');
			
						
						//save widget positions
						var widget_order = {}
						$('.widget-container-col').each(function() {
							var container_id = $(this).attr('id');
							widget_order[container_id] = []
							
							
							$(this).find('> .widget-box').each(function() {
								var widget_id = $(this).attr('id');
								widget_order[container_id].push(widget_id);
								//now we know each container contains which widgets
							});
						});
						
						ace.data.set('demo', 'widget-order', widget_order, null, true);
					}
			    });
				(function() {
					//restore widget order
					var container_list = ace.data.get('demo', 'widget-order', true);
					if(container_list) {
						for(var container_id in container_list) if(container_list.hasOwnProperty(container_id)) {
			
							var widgets_inside_container = container_list[container_id];
							if(widgets_inside_container.length == 0) continue;
							
							for(var i = 0; i < widgets_inside_container.length; i++) {
								var widget = widgets_inside_container[i];
								$('#'+widget).appendTo('#'+container_id);
							}
			
						}
					}
					
					
					//restore widget state
					var widgets = ace.data.get('demo', 'widget-state', true);
					if(widgets != null) {
						for(var id in widgets) if(widgets.hasOwnProperty(id)) {
							var state = widgets[id];
							var widget = $('#'+id);
							if
							(
								(state == 'shown' && widget.hasClass('collapsed'))
								||
								(state == 'hidden' && !widget.hasClass('collapsed'))
							) 
							{
								widget.widget_box('toggleFast');
							}
							else if(state == 'closed') {
								widget.widget_box('closeFast');
							}
						}
					}
					
					
					$('#main-widget-container').removeClass('invisible');
					
					
					//reset saved positions and states
					$('#reset-widgets').on('click', function() {
						ace.data.remove('demo', 'widget-state');
						ace.data.remove('demo', 'widget-order');
						document.location.reload();
					});				
				})();			
			});
    </script>
     