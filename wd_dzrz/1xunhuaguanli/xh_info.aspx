<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="xh_info.aspx.cs" Inherits="MarketInfo.wd_dzrz._1xunhuaguanli.xh_info" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>统计</title>
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
                                <div class="row">                               
                                    <form id="Form1" runat="server">
                                    <input type="hidden" id="hideFid" value="" runat="server" />
                                    <!--修改--> 
                                         <div class="col-xs-12 col-sm-4 Is_HS_Up">                                        
											<div class="widget-box">
												<div class="widget-header">
													<h4 class="widget-title">详细信息</h4>
                                                     <input type="hidden" id="hide_id" value="" runat="server" />
													
												</div>

												<div class="widget-body">
													<div class="widget-main">
														<div><div class="input-group">
                                                            <span class="input-group-addon">承包巡线工</span> 
                                                            <input class="form-control input-mask-phone" type="text"  id="txtxxgname" readonly="readonly" runat="server"/>   
                                                        </div></div> &nbsp
                                                        &nbsp;
														<div>															
															<div class="input-group">
																<span class="input-group-addon">
																	检查区段
																</span>
																<input class="form-control input-mask-phone" type="text"  id="txtjcqd" placeholder="请输入" runat="server"/>
															</div>
														</div>
                                                        &nbsp;
														<div>															
															<div class="input-group">
																<span class="input-group-addon">
																	检查里程
																</span>
																<input class="form-control input-mask-phone" type="text" id="txtjclc" placeholder="请输入" runat="server"/>
															</div>
														</div>
                                                          &nbsp;
                                                         
                                                            <br />
                                                         <label for="form-field-mask-2">
																发现问题
																<small class="text-warning">没有则填无</small>
															</label>
                                                            <div>
														
															<textarea class="form-control limited"  maxlength="50" placeholder="若没有请输入无" runat="server" id="txtfxwt">无</textarea>
														</div>
                                                         <label for="form-field-mask-2">
																问题跟踪
																<small class="text-warning">对于上次问题的跟踪</small>
															</label>
                                                            <div>
														
															<textarea class="form-control limited"  maxlength="50" placeholder="若没有请输入无" runat="server" id="txtwtgz">无</textarea>
														</div>
														
                                                         <label for="form-field-mask-2">
																其他
																<small class="text-warning">没有则填无</small>
															</label>
                                                            <div>
													
															<textarea class="form-control limited"  maxlength="50" placeholder="若没有请输入无" runat="server" id="txtqt">无</textarea>
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
<script src="../../lib/assets/layer/layer.js" type="text/javascript"></script>
    <!-- inline scripts related to this page -->
<script type="text/javascript">
    $(function () {
        var id = $('#hide_id').val();
        $.post("../../it/xunhudata.ashx", { id: id }, function (data) {
            JSons(data);
        });
    })
    function JSons(data) {
        if (data != null && data.length != 0) {
            $('#xx_id').val(data[0].xh_xunxiangong_id);
            $('#txtjcqd').val(data[0].xh_jiancha_quduan);
            $('#txtjclc').val(data[0].xh_jiancha_licheng);
            $('#txtfxwt').val(data[0].xh_faxian_wenti);
            $('#txtwtgz').val(data[0].xh_wenti_zhuizong);
            //   $('#txtagcqk_and_gdgxup').val(data[0].fx_gcqk_and_gdgx);
            $('#txtqt').val(data[0].xh_qita);

        }
    }
    function er_updatexx(id) {
        location.href = "dier.aspx?EDIT_GID=" + id;

    }


    //由暂存转为保存
    function er_save(id) {
        mui.confirm('是否确认保存？', '保存', function (e) {
            if (e.index == 1) {
                _save(1, id);
            } else {
                mui.toast('已取消');
            }
        })

    }
    //由暂存转为保存
    function _save(fg, id) {
        $.post("../../it/DiReShiGongUpdateFg.ashx", { fg: fg, id: id }, function (data) {
            if (data == "0") {
                mui.toast("提交成功!");
                location.reload();
            } else {
                mui.toast(data);
            }
        })
    }
    function er_submint(fg) {
        var txttid = $('#hideFid').val();
        var txtmc = $('#txtsl').val(); //项目名称
        var txtzydw = $('#txtxm').val(); //作业单位
        var txtxgdw = $('#txtwz').val(); //相关单位
        var txtzyqk = $('#txtjd').val(); //作业情况
        var txtfxwt = $('#fxwt').val();
        var txtwtzggz = $('#wtzggz').val(); //问题整改跟踪
        var txtqt = $('#qt').val(); //其他

        if (verification(txtmc, txtzydw, txtxgdw, txtzyqk, txtfxwt, txtwtzggz, txtqt)) {
            $.post("../../it/DiRrShiGongAdd.ashx", { fg: fg, txtmc: txtmc, txtzydw: txtzydw, txtxgdw: txtxgdw, txtzyqk: txtzyqk, txtfxwt: txtfxwt, txtwtzggz: txtwtzggz, txtqt: txtqt, tid: txttid }, function (data) {
                if (data == "0") {
                    location.reload()
                    mui.toast("提交成功!");

                } else {
                    mui.toast(data);
                }
            });
        } else {
            mui.toast("请输入完整的信息~");
        }
    }
   


   
</script>
<!--下方还有JS-->












































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
