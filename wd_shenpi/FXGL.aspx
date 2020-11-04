<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FXGL.aspx.cs" Inherits="MarketInfo.wd_shenpi.FXGL" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">





<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>防汛管理审批</title>

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
		<link rel="stylesheet" href="../assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
		<link rel="stylesheet" href="../assets/css/ace-skins.min.css" />
    <link href="../wd_dzrz/lib/assets/css/ace-rtl.min.css" rel="stylesheet" type="text/css" />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->
    <link href="../assets/css/ace.min.css" rel="stylesheet" type="text/css" />
    <link href="../lib/assets/css/ace-skins.min.css" rel="stylesheet" type="text/css" />
		<script src="../assets/js/ace-extra.min.js"></script>
    <link href="../css/mui.min.css" rel="stylesheet" type="text/css" />
		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="../assets/js/html5shiv.min.js"></script>
		<script src="../assets/js/respond.min.js"></script>
		<![endif]-->
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
							<h4>
							防汛管理
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>								
								</small>
							</h4>
						</div><!-- /.page-header --><h3 class="header smaller lighter blue"> <a class="btn btn-info" onclick="go_shenpi()"><i class="ace-icon fa fa-reply icon-only"></i>&nbsp;返回</a>
                         <a class="btn btn-info" href="../wd_dzrz/wd_fangxungl_his.aspx?UTID=<%=UTID%>">
                          &nbsp;历史记录</a>
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
													<th class="input-group-addon">站名</th>
													<th class="input-group-addon">行政位置</th>												
													<th class="input-group-addon hidden-480">防汛重点部位名称</th>
													<th class="input-group-addon hidden-480">类型</th>
													<th class="input-group-addon hidden-480">本周巡线工是否每天巡检</th>
                                                    <th class="input-group-addon hidden-480">巡线工巡检结果</th>
													<th class="input-group-addon hidden-480">本周巡线管理人员登记</th>
                                                    <th class="input-group-addon hidden-480">巡线工未完成每日巡检/发现异常情况详细说明</th>
													<th class="input-group-addon hidden-480">明日施工内容</th> 
                                                     <th class="input-group-addon hidden-480">治早治小</th>
													<th class="input-group-addon hidden-480">设施维护</th>
                                                    <th class="input-group-addon hidden-480">其他</th>
													<th class="input-group-addon Hide_types"> 审批</th>
												</tr>
											</thead>

											<tbody>  
                                            <%if (tb != null)
                                                  {
                                                      for (int i = 0; i < tb.Rows.Count; i++)
                                                      { %>
												<tr>
                                              
                                                      
                                                    <td width="50" class="input-group-addon"><%=i+1 %></td>
													<td class="input-group-addon"><%=tb.Rows[i]["fx_zhanchang"]%></td>
													<td class="input-group-addon"><%=tb.Rows[i]["fx_xingzhengweizhi"]%></td>													
													<td class="input-group-addon hidden-480"><%=tb.Rows[i]["fx_zhongdianbuwei"]%></td>
                                                    <td class="input-group-addon hidden-480"><%=tb.Rows[i]["fx_leixing"]%></td>
                                                    <td class="input-group-addon hidden-480"><%=tb.Rows[i]["fx_bzxxgsfmtxj"]%></td>
                                                    <td class="input-group-addon hidden-480"><%=tb.Rows[i]["fx_xxgxxjg"]%></td>
                                                    <td class="input-group-addon hidden-480"><%=tb.Rows[i]["fx_bzxxglryxxdj"]%></td>
                                                    <td class="input-group-addon hidden-480"><%=tb.Rows[i]["fx_xxglryxxjg"]%></td>
                                                    <td class="input-group-addon hidden-480"><%=tb.Rows[i]["fx_qkxxsm"]%></td>
                                                    <td class="input-group-addon hidden-480"><%=tb.Rows[i]["fx_zzzx"]%></td>
                                                    <td class="input-group-addon hidden-480"><%=tb.Rows[i]["fx_sswh"]%></td>
                                                    <td class="input-group-addon hidden-480"><%=tb.Rows[i]["fx_qtbz"]%></td>
                                                    <td class="input-group-addon Hide_types">
														<div class="hidden-sm hidden-xs btn-group">															
															<button class="btn btn-xs btn-danger">
																<span onclick="f_shenpi('<%=tb.Rows[i]["fx_id"]%>','-1')"><i class="ace-icon fa fa-flag bigger-120"></i></span>
															</button>
														</div>
														<div class="hidden-md hidden-lg">
															<div class="inline pos-rel">
																<button class="btn btn-xs btn-danger">
																<span onclick="f_shenpi('<%=tb.Rows[i]["fx_id"]%>','-1')"><i class="ace-icon fa fa-flag bigger-120"></i></span>
															</button>
																<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
																	<li>
																		<a href="#" class="tooltip-info"  onclick="f_shenpi('<%=tb.Rows[i]["fx_id"]%>','-1')" data-rel="tooltip" title="View">
																			<button class="btn btn-xs btn-danger">
																<span onclick="f_shenpi('<%=tb.Rows[i]["fx_id"]%>','-1')"><i class="ace-icon fa fa-flag bigger-120"></i></span>
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
									</div><!-- /.span -->
								</div><!-- /.row -->
								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->
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

        <script src="../js/mui.enterfocus.js" type="text/javascript"></script>
    <script src="../js/mui.min.js" type="text/javascript"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
		<script type="text/javascript">
		    if ('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
		</script>
		<script src="../assets/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->
        <script src="../assets/js/jquery.dataTables.bootstrap.min.js" type="text/javascript"></script>
		<script src="../assets/js/jquery.dataTables.bootstrap.min.js"></script>
		<script src="../assets/js/dataTables.buttons.min.js"></script>
		<script src="../assets/js/buttons.flash.min.js"></script>
		<script src="../assets/js/buttons.html5.min.js"></script>
		<script src="../assets/js/buttons.print.min.js"></script>
		<script src="../assets/js/buttons.colVis.min.js"></script>
		<script src="../assets/js/dataTables.select.min.js"></script>

		<!-- ace scripts -->
		<script src="../assets/js/ace-elements.min.js"></script>
		<script src="../assets/js/ace.min.js"></script>
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
            function f_set(id, type) {
                f_UpTitle(id, type);
//                var Hide_Sp = $('#Hide_Sp').val();
//                $.post("../it/FXSP.ashx", { TYPE: type, ID: id, sp: Hide_Sp }, function (data) {
//                    if (data == "1") {
//                        mui.toast("审批成功!");
//                        location.reload();
//                    }
//                    if (data == "-1") {
//                        mui.toast("审批失败，退出重试!");
//                    }
//                });
            }
            function f_UpTitle(id, type) {
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
                    // content: '<div id="mydiv" style="margin-left:10px;margin-top:10px;"><input id="txtReason" type="text" value="' + title + '" autocomplete="off" /><input rows="3" cols="0" class="form-control input-mask-phone" id="txtreson" placeholder="请输入审批建议" /></div>',

                    btn: ['确定', '取消']
                    , yes: function (index, layero) {
                        var txtReason = $('#txtreson').val();
                        //alert(txtReason);
                        //if (txtReason == "") {
                        //    return false;
                        //}
                        var Hide_Sp = $('#Hide_Sp').val();
                        $.post("../it/FXSP.ashx", { TYPE: type, ID: id, sp: Hide_Sp, Reason: txtReason }, function (data) {
                            if (data == "1") {
                                mui.toast("审批成功!");
                                location.reload();
                            }
                            if (data == "-1") {
                                mui.toast("审批失败，退出重试!");
                            }
                            layer.close(index);
                        });

                    }
                });
            }
        </script>












	<!-- inline scripts related to this page -->
		<script type="text/javascript">    function go_shenpi() {
        var HideTid = $('#HideTid').val();
        location.href = "wd_shenpi_jieduan.aspx?TID=" + HideTid;
    }
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
	</body>
</html>
