<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_work.aspx.cs" Inherits="MarketInfo.wd_dzrz.wd_gdkwork.wd_work" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>每日工作</title>
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
        ul li
        {
            list-style-type: none;
        }
         .OverHideTd{ word-break:break-all; font-size: 14px; color:#555; text-align: center; background-color: #eee;font-weight: 400;} 
   @keyframes gywm_text{0%{ transform:translateX(-100%); opacity:0;} 100%{  transform:translateX(0); opacity:1;}}
    @media screen and (min-width: 480px){
    h3.centersa{text-align:center;}
    div.auto_list{margin: 1%  0 0 25%;}
    div.auto_add {margin: 1%  0 0 33.333%;}
    }
    div.row h3.header a.btn { margin-top:5px;}
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
                                        <a class="btn btn-info" href="../main.aspx"><i class="ace-icon fa fa-reply icon-only">
                                        </i>&nbsp;返回</a>  
                                        <a class="btn btn-info" href="wd_hiswork.aspx"><i class="ace-icon fa fa-leaf icon-only">
                                        </i>&nbsp;历史记录</a>                                     
                                    </h3>
                                    <form id="Form1" runat="server">
                                                                                     
                                    <input type="hidden" id="hideFid" value="" runat="server" />
                                    <!--添加-->
                                    <div class="col-xs-12 col-sm-4 Is_HS">
                                        <div class="widget-box">
                                            <div class="widget-header">
                                                <h4 class="widget-title">
                                                    今日工作填报</h4>
                                                <span class="widget-toolbar"><a href="#" data-action="settings"><i class="ace-icon fa fa-cog">
                                                </i></a><a href="#" data-action="reload"><i class="ace-icon fa fa-refresh"></i></a><a
                                                    href="#" data-action="collapse"><i class="ace-icon fa fa-chevron-up"></i></a>
                                                </span>
                                            </div>
                                            <div class="widget-body">
                                                <div class="widget-main">                                                  
                                                   
                                                    &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">地点</span>
                                                            <input class="form-control input-mask-phone" type="text" id="txtdd" placeholder="请输入" runat="server" />
                                                        </div>
                                                    </div>&nbsp;                                                   
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">工作内容</span>
                                                            
                                                        </div>
                                                        <textarea rows="3" cols="0" class="form-control input-mask-phone" id="txtwork"  placeholder="请输入" runat="server"></textarea>
                                                    </div> 
                                                    &nbsp;    
                                                     <label for="form-field-mask-2">
																其他
																<small class="text-warning">没有则填无</small>
															</label>
                                                            <div>
															<textarea class="form-control limited"  maxlength="50" placeholder="若没有请输入无" runat="server" id="txtqt">无</textarea>
														</div>
                                                        &nbsp; 
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">本周重点工作</span>
                                                            
                                                        </div>
                                                        <textarea rows="3" cols="0" class="form-control input-mask-phone" id="txtbzgz"  placeholder="每周五上午10前提交" runat="server"></textarea>
                                                    </div> 
                                                    &nbsp;  
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">下周工作安排</span>
                                                            
                                                        </div>
                                                        <textarea rows="3" cols="0" class="form-control input-mask-phone" id="txtxzap"  placeholder="每周五上午10前提交" runat="server"></textarea>
                                                    </div> 
                                                    &nbsp;                                                    
                                                    &nbsp;
                                                    <div >
                                                        <ul >
                                                            <li>  
                                                                 <button class="btn btn-info" type="button" onclick="fx_submint('1');">
                                                                    <i class="ace-icon fa fa-check bigger-110"></i>提交
                                                                </button>                                                               
                                                                 &nbsp;
                                                                <button class="btn btn-info" type="button" onclick="fx_submint('0');">
                                                                    <i class="ace-icon fa fa-check bigger-110"></i>暂存
                                                                </button>
                                                            </li>
                                                        </ul>
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
                                                    <span style="color: #FFFFFF; font-weight: bolder;"><i class="ace-icon fa fa-table"></i>
                                                        暂存列表</span>
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
                                                                <%-- <th class="input-group-addon">场站</th>  --%>
                                                                <th class="input-group-addon">
                                                                    地点
                                                                </th>
                                                                <th class="input-group-addon">
                                                                   工作内容
                                                                </th>
                                                                <th class="input-group-addon hidden-480">
                                                                    其他
                                                                </th>
                                                                <th class="input-group-addon">
                                                                    操作
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <% if (dt_1 != null)
                                                               {
                                                                   for (int i = 0; i < dt_1.Rows.Count; i++)
                                                                   {  %>
                                                            <tr>
                                                                <td class="input-group-addon">
                                                                    <%=i+1%>
                                                                </td>
                                                                <td class="input-group-addon">
                                                                    <%=dt_1.Rows[i]["didian"]%>
                                                                </td>
                                                                <td class="input-group-addon">
                                                                    <%=dt_1.Rows[i]["zhuyao_gongzuo"]%>
                                                                </td>
                                                                <td class="input-group-addon hidden-480">
                                                                    <%=dt_1.Rows[i]["qita"]%>
                                                                </td>
                                                                <td class="input-group-addon">
                                                                    <a href="javascript:;" title="提交" onclick="fx_save('<%=dt_1.Rows[i]["id"]%>')">
                                                                        <i class="ace-icon glyphicon glyphicon-upload"></i>
                                                                    </a>&nbsp;&nbsp;<a href="javascript:;" onclick="fx_update('<%=dt_1.Rows[i]["id"]%>')" title="修改">
                                                                        <i class="ace-icon fa fa-pencil-square-o"></i>
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
                                    <!--已保存的列表-->
                                    <div class="col-xs-12 col-sm-6 widget-container-col Is_HS">
                                        <div class="widget-box widget-color-blue" id="Div2">
                                            <div class="widget-header">
                                                <h5 class="widget-title bigger lighter">
                                                    <span style="color: #FFFFFF; font-weight: bolder;"><i class="ace-icon fa fa-table"></i>
                                                        提交列表</span>
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
                                                                <th class="input-group-addon">
                                                                  地点
                                                                </th>
                                                                <th class="input-group-addon">
                                                                   工作内容
                                                                </th>
                                                                <th class="input-group-addon hidden-480">
                                                                    其他
                                                                </th>
                                                                   <th class="input-group-addon">
                                                                   详情
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <% if (dt_2 != null)
                                                               {
                                                                   for (int i = 0; i < dt_2.Rows.Count; i++)
                                                                   {  %>
                                                            <tr>
                                                                <td class="input-group-addon">
                                                                    <%=i+1%>
                                                                </td>
                                                                <td class="input-group-addon">
                                                                    <%=dt_2.Rows[i]["didian"]%>
                                                                </td>
                                                                <td class="input-group-addon">
                                                                    <%=dt_2.Rows[i]["zhuyao_gongzuo"]%>
                                                                </td>
                                                                <td class="input-group-addon hidden-480">
                                                                    <%=dt_2.Rows[i]["qita"]%>
                                                                </td>
                                                                   <td class="input-group-addon">    <a href="javascript:;" onclick="fx_update0('<%=dt_2.Rows[i]["id"]%>','0')" >详情
                                                                   </a></td>
                                                            </tr>
                                                            <% }
                                                               }%>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--修改-->
                                    <div class="col-xs-12 col-sm-4 Is_HS_Up" style="display: none;">
                                        <div class="widget-box">
                                            <div class="widget-header">
                                                <h4 class="widget-title">修改</h4>
                                                <span class="widget-toolbar"><a href="#"><i class="ace-icon fa fa-times" onclick="er_cancel()"></i></a></span>
                                            </div>
                                            <input type="hidden" id="hide_id" value="" runat="server"/>
                                            <input type="hidden" id="hide_fg" value="" runat="server"/>
                                            <div class="widget-body">
                                                <div class="widget-main">
                                                   
                                                     <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">地点</span>
                                                            <input class="form-control input-mask-phone" type="text" placeholder="请输入" id="txtddup"
                                                                runat="server" />
                                                        </div>
                                                    </div>
                                                    
                                                    &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">工作内容</span>
                                                            
                                                        </div>
                                                        <textarea rows="3" cols="0" class="form-control input-mask-phone" id="txtworkup"
                                                                placeholder="请输入" runat="server"></textarea>
                                                    </div>                                                    
                                                   
                                                    
                                                    &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">其他</span>
                                                        </div>
                                                        <textarea rows="3" cols="0" class="form-control input-mask-phone" id="txtqtup" runat="server"></textarea>
                                                    </div>
                                                    &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">本周重点工作</span>
                                                            
                                                        </div>
                                                        <textarea rows="3" cols="0" class="form-control input-mask-phone" id="txtbzgzup"  placeholder="每周五上午10前提交" runat="server"></textarea>
                                                    </div> 
                                                    &nbsp;  
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">下周工作安排</span>
                                                            
                                                        </div>
                                                        <textarea rows="3" cols="0" class="form-control input-mask-phone" id="txtxzapup"  placeholder="每周五上午10前提交" runat="server"></textarea>
                                                    </div> 
                                                    &nbsp;  
                                                    <div id="dis" style="display:none">
                                                        <ul>
                                                            <li>
                                                               <button class="btn btn-info" type="button" onclick="fx_saveup('1')">
                                                                    <i class="ace-icon fa fa-check bigger-110"></i>提交
                                                                </button>                                                               
                                                                &nbsp;
                                                               <button class="btn" type="button" onclick="fx_saveup('0')">
                                                                    <i class="ace-icon fa fa-undo bigger-110"></i>暂存
                                                                </button>                                                                 
                                                            </li>
                                                        </ul>
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
<!-- inline scripts related to this page -->
<script type="text/javascript">
    function fx_saveup(fg) {
        var txtid = $('#hide_id').val(); //ID
        var txttid = $('#hideFid').val(); //用户ID 
        var txtddup = $('#txtddup').val();
        var txtworkup = $('#txtworkup').val();
        var txtqtup = $('#txtqtup').val();
        var txtxzapup = $('#txtxzapup').val();
        var txtbzgzup = $('#txtbzgzup').val();
        var txtqtup = $('#txtqtup').val();

       
        if (txtddup == '')
        {
            mui.toast('请填写工作地点！');
            return false;
        }
        if (txtworkup == '') {
            mui.toast('请填写工作内容！');
            return false;
        }
        if (txtbzgzup == '') {
            mui.toast('请填写本周重点工作！');
            return false;
        }
        if (txtxzapup == '') {
            mui.toast('请填写下周工作安排！');
            return false;
        }
        
        $.post("Update.ashx", {
            fg: fg, id: txtid, txtddup: txtddup, txtworkup: txtworkup, txtqtup: txtqtup, txtbzgzup: txtbzgzup
        , txtxzapup: txtxzapup}, function (data) {
                if (data == "0") {
                    location.reload()
                    mui.toast("修改成功!");
                } else {
                    mui.toast(data);
                }
            });
       
    }
    //取消修改
    function er_cancel() {
        $('.Is_HS').show(500);
        $('.Is_HS_Up').hide(500);
    }
    //修改
    function fx_update(id) {
        $('.Is_HS').hide(500);
        $('.Is_HS_Up').show(500);
        $('#dis').show(500);
        $('#hide_id').val(id);
        $.post("WorkData.ashx", { id: id }, function (data) {
            JSons(data);
        });
    }
    function fx_update0(id,lo) {
        $('.Is_HS').hide(500);
        $('.Is_HS_Up').show(500);
        $('#hide_id').val(id);
        $.post("WorkData.ashx", { id: id }, function (data) {
            JSons(data);
        });
    }
    function JSons(data) {
        if (data != null) {
            $('#txtddup').val(data[0].didian);
            $('#txtworkup').val(data[0].zhuyao_gongzuo);
            $('#txtqtup').val(data[0].qita);
            $('#txtbzgzup').val(data[0].benzhou_zhongdian);
            $('#txtxzapup').val(data[0].xiahzou_jihua);
        }

    }
    //由暂存转为保存
    function fx_save(id) {
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
        $.post("UpdateFg.ashx", { fg: fg, id: id }, function (data) {
            if (data == "0") {
                mui.toast("提交成功!");
                location.reload();
            } else {
                mui.toast(data);
            }
        })
    }


   
    //保存
    function fx_submint(fg) {
        var txttid = $('#hideFid').val();

        //var txtzq = $('#txtzq').val();
        var txtdd = $('#txtdd').val();
        var txtwork = $('#txtwork').val();

        var txtqt = $('#txtqt').val();
        var txtbzgz = $('#txtbzgz').val();
        var txtxzap = $('#txtxzap').val();
        if (txtdd == '') {
             mui.toast("请填写工作地点！");
             return false;
         }
        
         if (txtwork =='') {
             mui.toast('请填写工作内容！');
             return false;
         }
         if (txtbzgz == '') {
             mui.toast("请填写本周重点工作！");
             return false;
         }
         if (txtxzap == '') {
             mui.toast("请填写下周安排！");
             return false;
         }
         $.post("Addwork.ashx", {
             fg: fg, txtdd: txtdd, txtwork: txtwork, txtqt: txtqt, txtbzgz: txtbzgz, txtxzap: txtxzap
         }, function (data) {
                if (data == "0") {
                    location.reload()
                    mui.toast("操作成功!");
                } else {
                    mui.toast(data);
                }
            });
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

