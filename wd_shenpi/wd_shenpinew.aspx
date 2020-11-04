<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_shenpinew.aspx.cs" Inherits="MarketInfo.wd_shenpi.wd_shenpinew" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>审批</title>
		<meta name="description" content="frequently asked questions using tabs and accordions" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="../assets/font-awesome/4.5.0/css/font-awesome.min.css" />
		<link rel="stylesheet" href="../assets/css/fonts.googleapis.com.css" />
		<!-- ace styles -->
		<link rel="stylesheet" href="../assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
		<!--[if lte IE 9]>
			<link rel="stylesheet" href="../assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
		<link rel="stylesheet" href="../assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="../assets/css/ace-rtl.min.css" />
        <link href="../css/jquery.mobile-1.4.5.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/ace.min.css" rel="stylesheet" />
       <link href="../css/mui.min.css" rel="stylesheet" type="text/css" />
       <script src="../assets/js/ace-extra.min.js" type="text/javascript"></script>
    	
       <style type="text/css">
  .div_f{float:left; width:90px; font-size:13px; margin: 3px 0;}  
  .fa-chanzi{ background:url(../css/icon_chanzi.jpg) center -20px no-repeat; background-size:53%; display:block; height:50px;}
.fa-wajueji{ background:url(../css/icon_wjj.jpg) center -7px no-repeat; background-size:contain; display:block; height:50px;}
        </style>
	</head>
	<body class="no-skin">
    <form id="Form1" runat="server">
        <input type="hidden" id="hide_tid" value="" runat="server"/>
        <input type="hidden" id="Hidzid" value="" runat="server"/>
        <input type="hidden" id="Hidzpid" value="" runat="server"/>

		<div class="main-container ace-save-state" id="main-container">
			<script type="text/javascript">
			    try { ace.settings.loadState('main-container') } catch (e) { }
			</script>
			<div class="main-content">
				<div class="main-content-inner">
					<div class="page-content">						
						<div class="page-header">
							<h3>
								审批
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									
								</small>
							</h3>
						</div><!-- /.page-header -->

						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="tabbable">								
									<div class="tab-content no-border padding-24">
										<div id="faq-tab-3"  class="tab-pane fade in active">											
											<div class="space-8"></div>
											<div id="faq-list-3" class="panel-group accordion-style1 accordion-style2">
											
                                            	<div class="center">
                                                <div class="div_f" onclick="f_WJ();">
												<a class="btn btn-app btn-sm btn-grey no-hover"  style=" height:60px; ">
                                                    		
                                                <i class="ace-icon fa  fa-square   fa-hand-paper-o bigger-230"></i>		
                                                    <span class="badge badge-pink kaiwanum" id="kaiwanum"></span>																				
												</a>
                                                <span class="line-height-1 smaller-90">开挖作业 </span>
                                                  
                                                </div>

                                                <%--<div class="div_f" onclick="f_dierf()">
												<a class="btn btn-app btn-sm btn-light no-hover"  style=" height:60px; ">		
                                                <i class="ace-icon fa fa-wajueji bigger-230"></i>	
                                                     <span class="badge badge-pink DISAN" id="DISAN" ></span>																							
												</a>
                                                <span class="line-height-1 smaller-90">第三方施工 </span>
                                                </div>--%> 

                                                <div class="div_f" onclick="f_SG();">
												<a class="btn btn-app btn-sm btn-light no-hover"  style=" height:60px; ">		
                                                <i class="ace-icon fa  fa-chanzi bigger-230"></i>	
                                                     <span class="badge badge-pink diernum1" id="diernum1"></span>																							
												</a>
                                                <span class="line-height-1 smaller-90">第二方施工 </span>
                                                </div>

                                                <div class="div_f" onclick="f_GH();">
												<a class="btn btn-app btn-sm btn-info  no-hover"   style=" height:60px; ">		
                                                <i class="ace-icon glyphicon glyphicon-th bigger-230"></i>	
                                                     <span class="badge badge-pink GHGQ"  id="GHGQnum"></span>																							
												</a>
                                                <span class="line-height-1 smaller-90">高后果区管理 </span>
                                                </div>

                                                <div  class="div_f" onclick="f_xunhu()">
												<a class="btn btn-app btn-sm btn-yellow no-hover"  style=" height:60px; ">		
                                                <i class="ace-icon glyphicon glyphicon-align-left bigger-230"></i>	
                                                     <span class="badge badge-pink XUNHU" id="XUHUnum"></span>																							
												</a>
                                                <span class="line-height-1 smaller-90">巡护管理 </span>
                                                </div>

                                                <div class="div_f"onclick="f_XC();" >
												<a class="btn btn-app btn-sm btn-success no-hover"  style=" height:60px; ">		
                                                <i class="ace-icon fa fa-comments-o bigger-230"></i>
                                                     <span class="badge badge-pink zoufangnum" id="zoufangnum"></span>																								
												</a>
                                                <span class="line-height-1 smaller-90">宣传走访 </span>
                                                </div>
                                                 
                                                <div class="div_f" onclick="f_FS();">
												<a class="btn btn-app btn-sm btn-danger no-hover"  style=" height:60px; ">		
                                                <i class="ace-icon fa fa-bar-chart-o bigger-230"></i>	
                                                    <span class="badge badge-success fushinum" id="fushinum"></span>																							
												</a>
                                                <span class="line-height-1 smaller-90">腐蚀控制 </span>
                                                </div>

                                                <div class="div_f" onclick="f_tz();">
												<a class="btn btn-app btn-sm btn-warning no-hover"  style=" height:60px; ">		
                                                <i class="ace-icon fa  fa-book bigger-230"></i>	
                                                     <span class="badge badge-pink jieduannnum" id="jieduannnum"></span>																							
												</a>
                                                <span class="line-height-1 smaller-90">阶段性工作 </span>
                                                </div>

                                                <%--<div class="div_f" onclick="f_SP();">
												<a class="btn btn-app btn-sm btn-primary no-hover"   style=" height:60px; ">		
                                                <i class="ace-icon glyphicon glyphicon-facetime-video bigger-230"></i>	
                                                    <span class="badge badge-pink shipinnum" id="shipinnum"></span>																							
												</a>
                                                <span class="line-height-1 smaller-90">视频监控 </span>
                                                </div>--%>
                                                 
                                                <div class="div_f" onclick="f_QiTa()">
												<a class="btn btn-app btn-sm btn-yellow  no-hover"   style=" height:60px; ">		
                                                <i class="ace-icon fa  fa-folder-open bigger-230"></i>																							
												</a>
                                                <span class="line-height-1 smaller-90">其他工作 </span>
                                                </div> 

                                                <div class="div_f" onclick="f_shijian()">
												<a class="btn btn-app btn-sm btn-light no-hover"  style=" height:60px; ">		
                                                <i class="ace-icon fa fa-laptop bigger-230"></i>
                                                      <span class="badge badge-pink shijianxxnum" id="shijianxxnum"></span>																								
												</a>
                                                <span class="line-height-1 smaller-90">事件学习 </span>
                                                </div>

                                                <div class="div_f" onclick="f_tongzhiyg()">
												<a class="btn btn-app btn-sm btn-light no-hover"  style=" height:60px; ">		
                                                <i class="ace-icon fa fa-bullhorn bigger-230"></i>	
                                                    <span class="badge badge-pink tznum" id="tznum"></span>																						
												</a>
                                                <span class="line-height-1 smaller-90">有关通知 </span>
                                                </div>  
                                         <div class="div_f" onclick="f_bg();">
												<a class="btn btn-app btn-sm btn-primary no-hover"   style=" height:60px; ">		
                                                <i class="ace-icon fa fa-user bigger-230"></i>	
                                                    <span class="badge badge-pink bgnum" id="bgnum"></span>																							
												</a>
                                                <span class="line-height-1 smaller-90">单位变更</span>
                                                </div>
											</div>                                                
										</div>
									</div>
								</div>
							</div>
								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
             </div><!-- /.main-content -->
		</div><!-- /.main-container -->
		<!-- basic scripts --> </form>
</body>
   
		<!--[if !IE]> -->
<script src="../js/jquery.mobile-1.4.5.js" type="text/javascript"></script>
<script src="../js/jquery.mobile-1.4.5.min.js" type="text/javascript"></script>
<script src="../js/jquery1.42.min.js" type="text/javascript"></script>
    <script type="text/javascript" src ="js/count.js"></script>
<script src="js/sp_count.js" type="text/javascript"></script>
		<script type="text/javascript">
		    if ('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
		</script>
        <script type="text/javascript">
            function f_QiTa() {
                var tid = $("#hide_tid").val();
                location.href = "QiTa.aspx?TID=" + tid;
            }
            function f_dierf() {
                var tid = $("#hide_tid").val();
                location.href = "Disnf.aspx?TID=" + tid;

            }
            function f_xunhu() {
                var tid = $("#hide_tid").val();
                location.href = "XunHuGuanli.aspx?TID=" + tid;
            }

            function f_tz() {
                var tid = $("#hide_tid").val();
                //alert(tid);
                location.href = "wd_shenpi_jieduan.aspx?TID=" + tid;

            }
            function f_WJ() {
                location.href = "../wd_sp/sp_kwzy.aspx";

            }
            function f_SG() {

                location.href = "../wd_sp/sp_Dierfang_sg.aspx";

            }

            function f_SP() {
                var tid = $("#hide_tid").val();
                //alert(tid);
                location.href = "SPJK.aspx?TID=" + tid;

            }
            //单位变更
            function f_bg() {
                var zid = $("#Hidzid").val();
                var zpid = $("#Hidzpid").val();

               // alert(zpid);
                location.href = "../wd_sp/sp_bg.aspx?ZPID=" + zpid + "&ZID=" + zid; //<a href="../wd_sp/sp_bg.aspx">../wd_sp/sp_bg.aspx</a>
            }
            function f_FS() {
                var tid = $("#hide_tid").val();
                //alert(tid);
                location.href = "../wd_sp/sp_bg.aspx?TID=" + tid;

            }
            function f_GH() {
                var tid = $("#hide_tid").val();
                //alert(tid);
                location.href = "GHGQ.aspx?TID=" + tid;

            }
            function f_FC() {
                var tid = $("#hide_tid").val();
                //alert(tid);
                location.href = "GDGL.aspx?TID=" + tid;

            }
            function f_XC() {
                var tid = $("#hide_tid").val();
                //alert(tid);
                location.href = "XCZF.aspx?TID=" + tid;

            }
            function f_FX() {
                var tid = $("#hide_tid").val();
                //alert(tid);
                location.href = "FXGL.aspx?TID=" + tid;

            }

            function f_shijian() {
                var tid = $("#hide_tid").val();
                location.href = "../wd_dzrz/wd_file/wd_sjxx.aspx?TID=" + tid;
            }

            function f_tongzhiyg() {
                var tid = $("#hide_tid").val();
                location.href = "../wd_dzrz/wd_file/wd_ygtz.aspx?TID=" + tid;
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

</html>