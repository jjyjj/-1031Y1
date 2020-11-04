﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dier_hislist.aspx.cs" Inherits="MarketInfo.wd_dzrz.wd_dier_shigong.dier_hislist" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>第二方施工</title>
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
                                <h3 class="header smaller lighter blue"> <%--<a class="btn btn-info" href="wd_dier.aspx">--%>
                               <a class="btn btn-info"  onclick=" window.history.go(-1)">                               
                                <i class="ace-icon fa fa-reply icon-only"></i>&nbsp;返回</a> </h3>
                                    <form id="Form1" runat="server">
                                    <input type="hidden" id="HideID" value="" runat="server" />  
                                    <input type="hidden" id="hideFid" value="" runat="server" />                         
	                  	        <div class="row">
									<div class="col-xs-12">	
										<div class="table-header">
											第二方施工历史记录
										</div>
										<!-- div.table-responsive -->
										<!-- div.dataTables_borderWrap -->
										<div>
											<table id="dynamic-table" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th class=" input-group-addon center">
															序号
														</th>
														<th  class="input-group-addon ">项目名称</th>
														<th class="input-group-addon ">作业单位</th>
														<th class="input-group-addon hidden-480">相关单位</th>

														<th class="input-group-addon ">
															当日作业情况
														</th>
														<th class="input-group-addon hidden-480">发现问题</th>

														<th class="input-group-addon hidden-480">问题整改</th>
                                                        <th class="input-group-addon hidden-480">其他</th>
													</tr>
												</thead>                                                
												<tbody>
                                                 <% if (dt_2 != null) { for (int i = 0; i < dt_2.Rows.Count; i++) {  %>
                                                           
													<tr>
														<td class="input-group-addon center">
															<%=i+1 %>
														</td>

														<td class="input-group-addon">
															 <a title="点击查看详情" onclick="fx_update('<%=dt_2.Rows[i]["id"]%>')">
                                                             <%=dt_2.Rows[i]["er_xiangmu"]%></a>
														</td>
														<td class="input-group-addon"><%=dt_2.Rows[i]["er_zydw"]%></td>
														<td class="input-group-addon hidden-480"><%=dt_2.Rows[i]["er_xgdw"]%></td>
														<td class="input-group-addon"><%=dt_2.Rows[i]["er_zyqk"]%></td>

														<td class="input-group-addon hidden-480">
															<%=dt_2.Rows[i]["er_wt"]%>
														</td>

														<td class="input-group-addon hidden-480">
															<%=dt_2.Rows[i]["er_gz"]%></td>
                                                             <td class="input-group-addon hidden-480"><%=dt_2.Rows[i]["er_qt"]%></td>
													</tr>
											  <% } }%>
												</tbody>
											</table>
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
    <script src="../lib/assets/layer/layer.js" type="text/javascript"></script>
    <!-- inline scripts related to this page -->
<script type="text/javascript">
  function fx_update(id) {

       layer.open({
            type: 2,
            title: '',
            skin: 'layui-layer-lan',
            closeBtn: 1, //不显示关闭按钮
            shade: [0],
            area: ['92%', '92%'],
            anim: 2,
            content: "wd_dierinfo.aspx?file_id=" + id ,
        });
        }
    function er_saveup(fg) {

        var txttid = $('#hideFid').val();
        //   var txtfg = $('#hide_fg').val();
        var txtfg = fg;
        var txtid = $('#hide_id').val();
        var txtsl = $('#txtslup').val();
        var txtxm = $('#txtxmup').val();
        var txtwz = $('#txtwzup').val();
        var txtjd = $('#txtjdup').val();
        if (verification(txtsl, txtxm, txtwz, txtjd)) {
            $.post("../../it/DiReShiGongUpdate.ashx", { id: txtid, fg: txtfg, sl: txtsl, xm: txtxm, wz: txtwz, jd: txtjd, tid: txttid }, function (data) {
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
    function er_update(isfg, id, txtsl, txtxm, txtwz, txtjd) {
        $('.Is_HS').hide(500);
        $('.Is_HS_Up').show(500);
        var txtfg = $('#hide_fg').val(isfg);
        var txtid = $('#hide_id').val(id);
        var txtsl = $('#txtslup').val(txtsl);
        var txtxm = $('#txtxmup').val(txtxm);
        var txtwz = $('#txtwzup').val(txtwz);
        var txtjd = $('#txtjdup').val(txtjd);

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
        var txtsl = $('#txtsl').val();
        var txtxm = $('#txtxm').val();
        var txtwz = $('#txtwz').val();
        var txtjd = $('#txtjd').val();
        if (verification(txtsl, txtxm, txtwz, txtjd)) {
            $.post("../../it/DiRrShiGongAdd.ashx", { fg: fg, sl: txtsl, xm: txtxm, wz: txtwz, jd: txtjd, tid: txttid }, function (data) {
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
    //验证
    function verification(txtzs, txtqj, txtjc, txtname) {
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



    	<script type="text/javascript">
    	    jQuery(function ($) {
    	        //initiate dataTables plugin
    	        var myTable =
				$('#dynamic-table')
    	        //.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
				.DataTable({
				    bAutoWidth: false,
				    "aoColumns": [
					  { "bSortable": false },
					  null, null, null, null, null,
					  { "bSortable": false }
					],
				    "aaSorting": [],


				    //"bProcessing": true,
				    //"bServerSide": true,
				    //"sAjaxSource": "http://127.0.0.1/table.php"	,

				    //,
				    //"sScrollY": "200px",
				    //"bPaginate": false,

				    //"sScrollX": "100%",
				    //"sScrollXInner": "120%",
				    //"bScrollCollapse": true,
				    //Note: if you are applying horizontal scrolling (sScrollX) on a ".table-bordered"
				    //you may want to wrap the table inside a "div.dataTables_borderWrap" element

				    //"iDisplayLength": 50


				    select: {
				        style: 'multi'
				    }
				});



    	        $.fn.dataTable.Buttons.defaults.dom.container.className = 'dt-buttons btn-overlap btn-group btn-overlap';

    	        new $.fn.dataTable.Buttons(myTable, {
    	            buttons: [
					  {
					      "extend": "colvis",
					      "text": "<i class='fa fa-search bigger-110 blue'></i> <span class='hidden'>Show/hide columns</span>",
					      "className": "btn btn-white btn-primary btn-bold",
					      columns: ':not(:first):not(:last)'
					  },
					  {
					      "extend": "copy",
					      "text": "<i class='fa fa-copy bigger-110 pink'></i> <span class='hidden'>Copy to clipboard</span>",
					      "className": "btn btn-white btn-primary btn-bold"
					  },
					  {
					      "extend": "csv",
					      "text": "<i class='fa fa-database bigger-110 orange'></i> <span class='hidden'>Export to CSV</span>",
					      "className": "btn btn-white btn-primary btn-bold"
					  },
					  {
					      "extend": "excel",
					      "text": "<i class='fa fa-file-excel-o bigger-110 green'></i> <span class='hidden'>Export to Excel</span>",
					      "className": "btn btn-white btn-primary btn-bold"
					  },
					  {
					      "extend": "pdf",
					      "text": "<i class='fa fa-file-pdf-o bigger-110 red'></i> <span class='hidden'>Export to PDF</span>",
					      "className": "btn btn-white btn-primary btn-bold"
					  },
					  {
					      "extend": "print",
					      "text": "<i class='fa fa-print bigger-110 grey'></i> <span class='hidden'>Print</span>",
					      "className": "btn btn-white btn-primary btn-bold",
					      autoPrint: false,
					      message: 'This print was produced using the Print button for DataTables'
					  }
					]
    	        });
    	        myTable.buttons().container().appendTo($('.tableTools-container'));

    	        //style the message box
    	        var defaultCopyAction = myTable.button(1).action();
    	        myTable.button(1).action(function (e, dt, button, config) {
    	            defaultCopyAction(e, dt, button, config);
    	            $('.dt-button-info').addClass('gritter-item-wrapper gritter-info gritter-center white');
    	        });


    	        var defaultColvisAction = myTable.button(0).action();
    	        myTable.button(0).action(function (e, dt, button, config) {

    	            defaultColvisAction(e, dt, button, config);


    	            if ($('.dt-button-collection > .dropdown-menu').length == 0) {
    	                $('.dt-button-collection')
						.wrapInner('<ul class="dropdown-menu dropdown-light dropdown-caret dropdown-caret" />')
						.find('a').attr('href', '#').wrap("<li />")
    	            }
    	            $('.dt-button-collection').appendTo('.tableTools-container .dt-buttons')
    	        });

    	        ////

    	        setTimeout(function () {
    	            $($('.tableTools-container')).find('a.dt-button').each(function () {
    	                var div = $(this).find(' > div').first();
    	                if (div.length == 1) div.tooltip({ container: 'body', title: div.parent().text() });
    	                else $(this).tooltip({ container: 'body', title: $(this).text() });
    	            });
    	        }, 500);





    	        myTable.on('select', function (e, dt, type, index) {
    	            if (type === 'row') {
    	                $(myTable.row(index).node()).find('input:checkbox').prop('checked', true);
    	            }
    	        });
    	        myTable.on('deselect', function (e, dt, type, index) {
    	            if (type === 'row') {
    	                $(myTable.row(index).node()).find('input:checkbox').prop('checked', false);
    	            }
    	        });




    	        /////////////////////////////////
    	        //table checkboxes
    	        $('th input[type=checkbox], td input[type=checkbox]').prop('checked', false);

    	        //select/deselect all rows according to table header checkbox
    	        $('#dynamic-table > thead > tr > th input[type=checkbox], #dynamic-table_wrapper input[type=checkbox]').eq(0).on('click', function () {
    	            var th_checked = this.checked; //checkbox inside "TH" table header

    	            $('#dynamic-table').find('tbody > tr').each(function () {
    	                var row = this;
    	                if (th_checked) myTable.row(row).select();
    	                else myTable.row(row).deselect();
    	            });
    	        });

    	        //select/deselect a row when the checkbox is checked/unchecked
    	        $('#dynamic-table').on('click', 'td input[type=checkbox]', function () {
    	            var row = $(this).closest('tr').get(0);
    	            if (this.checked) myTable.row(row).deselect();
    	            else myTable.row(row).select();
    	        });



    	        $(document).on('click', '#dynamic-table .dropdown-toggle', function (e) {
    	            e.stopImmediatePropagation();
    	            e.stopPropagation();
    	            e.preventDefault();
    	        });



    	        //And for the first simple table, which doesn't have TableTools or dataTables
    	        //select/deselect all rows according to table header checkbox
    	        var active_class = 'active';
    	        $('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function () {
    	            var th_checked = this.checked; //checkbox inside "TH" table header

    	            $(this).closest('table').find('tbody > tr').each(function () {
    	                var row = this;
    	                if (th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
    	                else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
    	            });
    	        });

    	        //select/deselect a row when the checkbox is checked/unchecked
    	        $('#simple-table').on('click', 'td input[type=checkbox]', function () {
    	            var $row = $(this).closest('tr');
    	            if ($row.is('.detail-row ')) return;
    	            if (this.checked) $row.addClass(active_class);
    	            else $row.removeClass(active_class);
    	        });



    	        /********************************/
    	        //add tooltip for small view action buttons in dropdown menu
    	        $('[data-rel="tooltip"]').tooltip({ placement: tooltip_placement });

    	        //tooltip placement on right or left
    	        function tooltip_placement(context, source) {
    	            var $source = $(source);
    	            var $parent = $source.closest('table')
    	            var off1 = $parent.offset();
    	            var w1 = $parent.width();

    	            var off2 = $source.offset();
    	            //var w2 = $source.width();

    	            if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2)) return 'right';
    	            return 'left';
    	        }




    	        /***************/
    	        $('.show-details-btn').on('click', function (e) {
    	            e.preventDefault();
    	            $(this).closest('tr').next().toggleClass('open');
    	            $(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
    	        });
    	        /***************/





    	        /**
    	        //add horizontal scrollbars to a simple table
    	        $('#simple-table').css({'width':'2000px', 'max-width': 'none'}).wrap('<div style="width: 1000px;" />').parent().ace_scroll(
    	        {
    	        horizontal: true,
    	        styleClass: 'scroll-top scroll-dark scroll-visible',//show the scrollbars on top(default is bottom)
    	        size: 2000,
    	        mouseWheelLock: true
    	        }
    	        ).css('padding-top', '12px');
    	        */


    	    })
		</script>