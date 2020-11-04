<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_info.aspx.cs" Inherits="MarketInfo.wd_dzrz.wd_dtfx.wd_info" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>开挖作业</title>
    <meta name="description" content="Draggabble Widget Boxes with Persistent Position and State" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
     <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
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
		<link rel="stylesheet" href="../assets/css/ace-rtl.min.css" />
        <script src="../assets/js/ace-extra.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
     <input type="hidden" id="HideID" value="" runat="server" />
        <div class="main-container ace-save-state" id="main-container">
			<script type="text/javascript">
			    try { ace.settings.loadState('main-container') } catch (e) { }
			</script>

			<div class="main-content">
				<div class="main-content-inner">

        	                   <div class="row">
									
											<div class="widget-box transparent" id="widget-box-4">
												<div class="widget-header">
													<h4 class="widget-title lighter">&nbsp;&nbsp;&nbsp;&nbsp;
                                                    详情</h4>                                                    
												</div>
												
													<div class="widget-main padding-6 no-padding-left no-padding-right">
                                                       
													
                                          
                                            <input type="hidden" id="hide_id" value="" runat="server"/>
                                            <input type="hidden" id="hide_fg" value="" runat="server"/>
                                            <div class="widget-body">
                                                <div class="widget-main">
                                                    <div>
                                                        <div class="input-group">
                                                            &nbsp; <span class="input-group-addon">施工类型</span>
                                                            <select class="form-control input-mask-phone" style="border:1px solid #D5D5D5 !important" id="txttypeup"  runat="server">
                                                                <option value="第一方">第一方</option>
                                                                <option value="第二方">第二方</option>
                                                                <option value="第三方">第三方</option>                                                              
                                                            </select>
                                                        </div>
                                                    </div> 
                                                    &nbsp;
                                                     <div>
                                                        <div class="input-group">
                                                           &nbsp; <span class="input-group-addon">现场监护人</span>
                                                            <input class="form-control input-mask-phone" type="text" placeholder="请输入" id="txtnameup"
                                                                runat="server" />
                                                        </div>
                                                    </div>
                                                    &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            &nbsp;<span class="input-group-addon">行政区域</span>
                                                            <input class="form-control input-mask-phone" type="text" id="txtxzzhup" placeholder="请输入"
                                                                runat="server" />
                                                        </div>
                                                    </div>
                                                    &nbsp;
                                                     <div>
                                                        <div class="input-group">
                                                           &nbsp; <span class="input-group-addon">桩号</span>
                                                            <input class="form-control input-mask-phone" type="text" id="txtzhup" placeholder="请输入"
                                                                runat="server" />
                                                        </div>
                                                    </div>
                                                    &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            &nbsp;<span class="input-group-addon">工程名称</span>
                                                            <input class="form-control input-mask-phone" type="text" id="txtgcmup" placeholder="请输入"
                                                                runat="server" />
                                                        </div>
                                                    </div> 
                                                    &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                          &nbsp;  <span class="input-group-addon">管道光缆情况</span>
                                                            <input class="form-control input-mask-phone" type="text" id="txtgdglup" placeholder="请输入"
                                                                runat="server" />
                                                        </div>
                                                    </div>
                                                    &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                           <span class="input-group-addon">工程情况与管道位置关系</span>
                                                            
                                                        </div>
                                                        <textarea rows="3" cols="0" class="form-control input-mask-phone" id="txtagcqk_and_gdgxup"
                                                                placeholder="请输入" runat="server"></textarea>
                                                    </div>                                                    
                                                    &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">今日施工内容</span>
                                                        </div>
                                                        <textarea rows="3" cols="0" class="form-control input-mask-phone" id="txtjrsgup" placeholder="请输入" runat="server"></textarea>
                                                    </div>
                                                    &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">明日施工计划</span>
                                                        </div>
                                                        <textarea rows="3" cols="0" class="form-control input-mask-phone" id="txtmrjhup" placeholder="请输入" runat="server"></textarea>
                                                    </div>
                                                    &nbsp;
                                                   
                                                        <div><div class="input-group ">
                                                            &nbsp;<span class="input-group-addon">今日是否完工</span> 
                                                            <select id="Select1" class="form-control input-mask-phone" name="txttype" style="border:1px solid #D5D5D5 !important" runat="server">
                                                            <option value="-1">【请选择】</option>
                                                            <option value="否">否</option>
                                                            <option value="是">是</option>
                                                            </select>
                                                        </div></div> &nbsp; 
                                                    
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">其他</span>
                                                        </div>
                                                        &nbsp;<textarea rows="3" cols="0" class="form-control input-mask-phone" id="txtaremarkup" runat="server"></textarea>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                       
                               


                                                    
                                                    </div>
												
											</div>
									
                                  </div>
                    </div>
                </div>
            </div>

    
                                                  
                                         
                                   

    </form>
</body>
</html>

<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
		</script>
<script src="../assets/js/jquery-2.1.4.min.js"></script>
		<script src="../assets/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->
		<script src="../assets/js/jquery-ui.custom.min.js"></script>
		<script src="../assets/js/jquery.ui.touch-punch.min.js"></script>

		<!-- ace scripts -->
		<script src="../assets/js/ace-elements.min.js"></script>
		<script src="../assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->

        <script type="text/javascript">
            $(function () {
                var id = $('#HideID').val();
                $.post("../../it/FengXianData.ashx", { id: id }, function (data) {
                    JSons(data);
                });
            })
            function JSons(data) {
                if (data != null) {

                    $('#txttypeup').val(data[0].fx_type);
                    $('#txtxzzhup').val(data[0].fx_xzzh); //行政区域编号
                    $('#txtzhup').val(data[0].fx_zh); //桩号
                    $('#txtgcmup').val(data[0].fx_gcm); //工程名称
                    $('#txtgdglup').val(data[0].fx_gdgl); //管道光缆情况
                    $('#txtagcqk_and_gdgxup').val(data[0].fx_gcqk_and_gdgx);
                    $('#txtgkup').val(data[0].fx_gk); //风险管控

                    $('#txtjrsgup').val(data[0].fx_jrsg);
                    $('#txtmrjhup').val(data[0].fx_mrjh); //明日施工计划
                    $('#txtxzjhup').val(data[0].fx_xzjh); //下周计划
                    $('#txtnameup').val(data[0].fx_name);
                    $('#txtaremarkup').val(data[0].fx_remark);
                    $('#Select1').val(data[0].fx_sfwg);
                    $('#filefangan').val(data[0].file_title);
                    $('#fileimg').val(data[0].img_title);
                }
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
			
				/**
				//or use slimScroll plugin
				$('.slim-scrollable').each(function () {
					var $this = $(this);
					$this.slimScroll({
						height: $this.data('height') || 100,
						railVisible:true
					});
				});
				*/
				
			
				/**$('.widget-box').on('setting.ace.widget' , function(e) {
					e.preventDefault();
				});*/
			
				/**
				$('.widget-box').on('show.ace.widget', function(e) {
					//e.preventDefault();
					//this = the widget-box
				});
				$('.widget-box').on('reload.ace.widget', function(e) {
					//this = the widget-box
				});
				*/
			
				//$('#my-widget-box').widget_box('hide');
			
				
			
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
				
				
				///////////////////////
			
				//when a widget is shown/hidden/closed, we save its state for later retrieval
				$(document).on('shown.ace.widget hidden.ace.widget closed.ace.widget', '.widget-box', function(event) {
					var widgets = ace.data.get('demo', 'widget-state', true);
					if(widgets == null) widgets = {}
			
					var id = $(this).attr('id');
					widgets[id] = event.type;
					ace.data.set('demo', 'widget-state', widgets, null, true);
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

