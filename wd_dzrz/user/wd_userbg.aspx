<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_userbg.aspx.cs" Inherits="MarketInfo.wd_dzrz.user.wd_userbg" %>

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
                                        <a class="btn btn-info" href="../wd_ywsb.aspx"><i class="ace-icon fa fa-reply icon-only">
                                        </i>&nbsp;返回首页</a>
                                        <a class="btn btn-info" href="../../wd_sp/sp_mybghis.aspx">&nbsp;历史记录</a>
                                    </h3>
                                    <form id="Form1" runat="server">
                                                                                     
                                    <input type="hidden" id="hideFid" value="" runat="server" />
                                    <!--添加-->
                                    <div class="col-xs-12 col-sm-4 Is_HS">
                                        <div class="widget-box">
                                            <div class="widget-header">
                                                <h4 class="widget-title">
                                                    变更信息填报</h4>
                                                <span class="widget-toolbar"><a href="#" data-action="settings"><i class="ace-icon fa fa-cog">
                                                </i></a><a href="#" data-action="reload"><i class="ace-icon fa fa-refresh"></i></a><a
                                                    href="#" data-action="collapse"><i class="ace-icon fa fa-chevron-up"></i></a>
                                                    <a href="#" data-action="close">
															<i class="ace-icon fa fa-times"></i>
														</a>
                                                </span>
                                            </div>
                                            <div class="widget-body">
                                                <div class="widget-main">
                                                   <div><div class="input-group ggqbh">
                                                            <span class="input-group-addon">变更单位</span>    
                                                        </div></div> &nbsp
                                                    <div>                                                     
                                                    </div> 
                                                    &nbsp;                                                    
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">变更原因</span>
                                                            
                                                        </div>
                                                        <textarea rows="3" cols="0" class="form-control input-mask-phone" id="reason"  placeholder="请输入" runat="server"></textarea>
                                                    </div> 
                                                    &nbsp;                                                   
                                                    <div >
                                                        <ul >
                                                            <li>  
                                                              
                                                              <button class="btn btn-info" type="button" onclick="f_submint();">
												    <i class="ace-icon fa fa-check bigger-110"></i>
												           提交
											               </button> &nbsp;
                                                          
                                                                  
                                                            </li>
                                                        </ul>
                                                    </div>
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
                                                        变更记录</span>
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
                                                                   变更单位
                                                                </th>
                                                                <th class="input-group-addon">
                                                                    提交时间
                                                                </th>
                                                                <th class="input-group-addon hidden-480">
                                                                    撤销
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

                                                                     <% if (dt_2.Rows[i]["sp1"].ToString() == "-1" || dt_2.Rows[i]["sp2"].ToString() == "-1" || dt_2.Rows[i]["sp3"].ToString() == "-1") {  %>
                        <i class="ace-icon fa fa-exclamation-triangle bigger-121" style=" color: #D15B47;" title="审批未通过/被退回/修改后请重新提交"  onclick="f_OpenDlg('<%=dt_2.Rows[i]["id"]%>')"></i>
                                                                    <% } %> 
                                                                     <% if (dt_2.Rows[i]["sp1"].ToString() == "1" || dt_2.Rows[i]["sp2"].ToString() == "1" || dt_2.Rows[i]["sp3"].ToString() == "-1") {  %>
                        <i class="ace-icon fa fa-exclamation-triangle bigger-121" style=" color: #99FF99;" title="审批通过" onclick="f_OpenDlg('<%=dt_2.Rows[i]["id"]%>')"></i>
                                                                    <% } %> 
                                                                    
                                                                   <%=i+1%>
                                                                    
                                                                </td>
                                                                <td class="input-group-addon">
                                                                    
                                                                    <%=dt_2.Rows[i]["zname"]%>
                                                                </td>
                                                                <td class="input-group-addon">
                                                                    <%=dt_2.Rows[i]["crtime"]%>
                                                                </td>
                                                                <td class="input-group-addon hidden-480">
                                                                 <% if (dt_2.Rows[i]["sp1"].ToString() == "0" && dt_2.Rows[i]["sp2"].ToString() == "0" && dt_2.Rows[i]["sp3"].ToString() == "0")
                                                                    {  %>
                        <i class="ace-icon fa fa-undo bigger-121" style=" color: #D15B47;" title="撤销申请"  onclick="fx_che('<%=dt_2.Rows[i]["id"]%>')"></i>
                         
                                                                    <% } %> 
                                                                  
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
<script src="../../lib/assets/layer/layer.js"></script>
<!-- inline scripts related to this page -->
<script type="text/javascript">


    $(function () {
        XXGData()//首次数据绑定
    })
    //巡线工绑定
    function XXGData() {
        var txttid = $('#hideFtid').val();
        $.post('getdw.ashx', {}, function (data) {
            if (data != "-1") {
                XXGBind(data);
            } else {
                mui.toast('数据读取失败');
            }
        })
    }
    //站区单位//遍历数据
    function XXGBind(data) {
        var op = '';
        for (var p in data) {
            op += '<option value="' + data[p].zid + '">' + data[p].zname + '</option>';
        }
        $('.ggqbh').append('<select id="dwid" class="form-control input-mask-phone" style="border:1px solid #D5D5D5 !important">' + op + '</select>');
    }
        
     function f_submint(type) {
         var id = $("#dwid").val();
        
         alert(id);
      //  mui.toast(id);
         var Reason = $("#reason").val();
         if (Reason == "") {
             mui.toast("请填原因!");
             return;
         }
         $.post("../../wd_user/Handler1.ashx", { id: id, Reason: Reason }, function (data) {
             if (data == "1") {
                 mui.toast("申请成功，等待审批结果!");
                 location.reload();
             }
             if (data == "-1") {
                 mui.toast("申请失败，退出重试!");
             }
             layer.close(index);
         });
     }
    function fx_saveup(fg) {
        var txtid = $('#hide_id').val(); //ID
        var txttid = $('#hideFid').val(); //用户ID 
        var txtxzzhup = $('#txtxzzhup').val();
        var txtzhup = $('#txtzhup').val();
        var txtgcmup = $('#txtgcmup').val();
        var txtgdglup = $('#txtgdglup').val();
        var txtagcqk_and_gdgxup = $('#txtagcqk_and_gdgxup').val();
        var txtgkup = $('#txtgkup').val();
        var txtjrsgup = $('#txtjrsgup').val();
        var txtmrjhup = $('#txtmrjhup').val();
        var txtxzjhup = $('#txtxzjhup').val();
        var txtnameup = $('#txtnameup').val();
        var txtaremarkup = $('#txtaremarkup').val();
        var txttypes = $('#txttypeup').val();
        var txtselect = $('#Select1').val();
        if (txtselect == '-1')
        {
            mui.toast('请选择是否完工！');
            return false;
        }
        var file_as = $('#file_as').val().length;
        mui.toast($('#file_as').val());
        if ( !file_as > 0) {
            mui.toast('请上传方案！');
            return false;
        }
        if (verification(txtxzzhup, txtgcmup, txtgdglup, txtagcqk_and_gdgxup, txtgkup, txtjrsgup, txtmrjhup, txtxzjhup, txtnameup)) {
            $.post("../../it/FengXianUpdate.ashx", {
                fg: fg, id: txtid, tid: txttid, xzzh: txtxzzhup, gcm: txtgcmup, gdgl: txtgdglup, isag: txtagcqk_and_gdgxup, gk: txtgkup,
                jrsg: txtjrsgup, mrjh: txtmrjhup, xzjh: txtxzjhup, name: txtnameup, remark: txtaremarkup, types: txttypes, txtzhup: txtzhup
            }, function (data) {
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
    function er_cancel() {
        $('.Is_HS').show(500);
        $('.Is_HS_Up').hide(500);
    }
    //修改
    function fx_update(id) {
        $('.Is_HS').hide(500);
        $('.Is_HS_Up').show(500);
        $('#hide_id').val(id);
        $.post("../../it/FengXianData.ashx", { id: id }, function (data) {
            JSons(data);
        });
    }
    function JSons(data) {
        if (data != null) {

            $('#txttypeup').val(data[0].fx_type);
            $('#txtxzzhup').val(data[0].fx_xzzh);//行政区域编号
            $('#txtzhup').val(data[0].fx_zh);//桩号
            $('#txtgcmup').val(data[0].fx_gcm);//工程名称
            $('#txtgdglup').val(data[0].fx_gdgl); //管道光缆情况
            $('#txtagcqk_and_gdgxup').val(data[0].fx_gcqk_and_gdgx);
            $('#txtgkup').val(data[0].fx_gk);//风险管控

            $('#txtjrsgup').val(data[0].fx_jrsg);
            $('#txtmrjhup').val(data[0].fx_mrjh);//明日施工计划
            $('#txtxzjhup').val(data[0].fx_xzjh);//下周计划
            $('#txtnameup').val(data[0].fx_name);
            $('#txtaremarkup').val(data[0].fx_remark);
            $('#Select1').val(data[0].fx_sfwg);
            $('#filefangan').val(data[0].file_title);
            $('#fileimg').val(data[0].img_title);

            
        }

    }
    function f_OpenDlg(id) {
        layer.open({
            type: 2,
            title: '',
            skin: 'layui-layer-lan',
            closeBtn: 1, //不显示关闭按钮
            shade: [0],
            area: ['35%', '60%'],
            anim: 2,
            content: "wd_reason.aspx?id=" + id,
        });
    }
    //由暂存转为保存
    function fx_che(id) {
        mui.confirm('是否确认撤销变更？', '保存', function (e) {
            if (e.index == 1) {
                _save(-1, id);
            } else {
                mui.toast('已撤销！');
            }
        })
    }
   
    //撤销
    function _save(fg, id) {
        $.post("chexiao.ashx", { fg: fg, id: id }, function (data) {
            if (data == "0") {
                mui.toast("撤销成功!");
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
        var txttype = $('#txttype').val();
        var txtxzzh = $('#txtxzzh').val();

        var txtzh = $('#txtzh').val();

        var txtgcm = $('#txtgcm').val();
         var txtgdgl = $('#txtgdgl').val();
         var txtagcqk_and_gdgx = $('#txtagcqk_and_gdgx').val();
         var txtgk = $('#txtgk').val();
         var txtjrsg = $('#txtjrsg').val();
         var txtmrjh = $('#txtmrjh').val();
         var txtxzjh = $('#txtxzjh').val();
         var txtname = $('#txtname').val();
         var txtaremark = $('#txtaremark').val();
         var txtselect = $('#Select2').val();
         if (txtselect == '-1') {
             mui.toast("请选择是否完工！");
             return false;
         }
         var file_as = $('#file_as').val().length;
         if (!file_as > 0) {
             mui.toast('请上传方案！');
             return false;
         }
        $('.Is_HS input[type=text],.Is_HS textarea').each(function (i, e) { if (e.value == null || e.value == '') { mui.toast('请输入完整的信息'); res = false; } })
        if (!res) { mui.toast('请输入完整的信息'); return false; }

        $.post("../../it/FengXianAdd.ashx", {
            fg: fg, tid: txttid, type: txttype, xzzh: txtxzzh, gcm: txtgcm, remark: txtaremark,
            gdgl: txtgdgl, isag: txtagcqk_and_gdgx, jrsg: txtjrsg, mrjh: txtmrjh, name: txtname, txtzh: txtzh
        }, function (data) {
                if (data == "0") {
                    location.reload()
                    mui.toast("提交成功!");
                } else {
                    mui.toast(data);
                }
            });
    
       
    }
    //验证
    function verification(a, b, c, d) {
        var res = true;
        if (a == null || a == "") {
            res = false;
        }
        if (b == null || b == "") {
            res = false;
        }
        if (c == null || c == "") {
            res = false;
        }
        if (d == null || d == "") {
            res = false;
        }

        return res;
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

