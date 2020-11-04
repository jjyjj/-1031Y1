<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sp_bghis.aspx.cs" Inherits="MarketInfo.wd_sp.sp_bghis" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>人员单位变更审批</title>

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
    <script src="../wd_dzrz/lib/assets/layer/layer.js"></script>
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
							历史记录
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>								
								</small>
							</h4>
						</div><!-- /.page-header -->
                        <h3 class="header smaller lighter blue"> <a class="btn btn-info" href="javascript:history.back(-1)"><i class="ace-icon fa fa-reply icon-only"></i>&nbsp;返回</a>
                        
                        </h3>
						<div class="row">                        
							<div class="col-xs-12 Is_HS">
								<!-- PAGE CONTENT BEGINS -->
								<div class="row">
                                    <input type="hidden" id="HideTid" value="" runat="server" />
                                    <input type="hidden" id="Hide_Sp" value="" runat="server" />
										<div class="col-xs-12">
										<table id="simple-table" class="table  table-bordered table-hover">
											<thead>
												<tr>
													
												    <th class="input-group-addon"><i class="ace-icon fa fa-flag"></i>序号</th>
													<th class="input-group-addon">申请人</th>
													<th class="input-group-addon hidden-480">原单位</th>  
                                                    <th class="input-group-addon">申请原因</th>  
													<th class="input-group-addon Hide_types"> 审批结果</th>
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
														
                                                        <%=tb.Rows[i]["T_NAME"]%></a>
													</td>
                                                   
													<td class="input-group-addon hidden-480"><%=tb.Rows[i]["zname"]%></td>
													  <td class="input-group-addon">
														<span style="color:blue"  title="<%=tb.Rows[i]["reason"].ToString() %>">
                                                             <%if (tb.Rows[i]["reason"].ToString() != "" && tb.Rows[i]["reason"] != null)
                                                               {
%>  <%=tb.Rows[i]["reason"].ToString()%>

                                                                <%} %>
                                                           
                                                           </span>
                                                           
                                                           
													</td>
													<td class="input-group-addon Hide_types">

                                                     <% if (tb.Rows[i]["sp1"].ToString() == "-1")
                                                        {  %>
                        <i class="ace-icon fa fa-exclamation-triangle bigger-121" style=" color: #D15B47;" title="审批未通过/被退回/修改后请重新提交"  ></i>
                                                                    <% } %> 
                                                                     <% if (tb.Rows[i]["sp1"].ToString() == "1" )
                                                                        {  %>
                        <i class="ace-icon fa fa-exclamation-triangle bigger-121" style=" color: #99FF99;" title="审批通过" ></i>
                                                                    <% } %> 
														
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
        <script src="../wd_dzrz/lib/js/jquery-1.9.1.min.js"></script>
        <script src="../lib/Widget/Validform/5.3.2/Validform.min.js"></script>
        <script src="../lib/assets/js/typeahead-bs2.min.js"></script>
        <script src="../lib/assets/layer/layer.js"></script>
		<!-- ace scripts -->
		<script src="../assets/js/ace-elements.min.js"></script>
		<script src="../assets/js/ace.min.js"></script>








	<!-- inline scripts related to this page -->
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
                function go_shenpi() {
        var HideTid = $('#HideTid').val();
        location.href = "wd_shenpi.aspx?TID=" + HideTid;
    }
		</script>
	</body>
</html>

