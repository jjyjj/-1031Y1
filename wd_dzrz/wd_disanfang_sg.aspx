<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_disanfang_sg.aspx.cs" Inherits="MarketInfo.wd_dzrz.wd_disanfang_sg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>自主维护作业</title>
		<meta name="description" content="Draggabble Widget Boxes with Persistent Position and State" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css" />

		<!-- page specific plugin styles -->
		<link rel="stylesheet" href="assets/css/jquery-ui.custom.min.css" />

		<!-- text fonts -->
		<link rel="stylesheet" href="assets/css/fonts.googleapis.com.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="../lib/assets/css/ace-rtl.min.css" />
    <link href="../css/mui.min.css" rel="stylesheet" type="text/css" />
		<script src="assets/js/ace-extra.min.js" type="text/javascript"></script>
	</head>
	<body class="no-skin">
		<div class="main-container ace-save-state" id="main-container">
			<script type="text/javascript">
			    try { ace.settings.loadState('main-container') } catch (e) { }
			</script>
			<div class="main-content">
				<div class="main-content-inner">			

					<div class="page-content">	
                    <a class="btn btn-info btn-sm tooltip-info" data-rel="tooltip" data-placement="bottom" title="" data-original-title="Bottm Info" href="wd_ywsb.aspx">返回主页</a>
                                  					
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="invisible" id="main-widget-container">
                                     
								<div class="row"> 
                                    <form id="Form1" runat="server">
                                    <input type="hidden" id="hideFid" value="" runat="server" />
										<div class="col-xs-12 col-sm-4 Is_HS">
											<div class="widget-box">
												<div class="widget-header">
													<h4 class="widget-title">第三方施工</h4>

													<span class="widget-toolbar">
														<a href="#" data-action="settings">
															<i class="ace-icon fa fa-cog"></i>
														</a>

														<a href="#" data-action="reload">
															<i class="ace-icon fa fa-refresh"></i>
														</a>

														<a href="#" data-action="collapse">
															<i class="ace-icon fa fa-chevron-up"></i>
														</a>

														<a href="#" data-action="close">
															<i class="ace-icon fa fa-times"></i>
														</a>
													</span>
												</div>

												<div class="widget-body">
													<div class="widget-main">
                                                    
                                                                                                        
                                                        <div>															
															<div class="input-group">
																<span class="input-group-addon">
																	第三方施工数量
																</span>
																<input class="form-control input-mask-phone" type="text" id="shigong_sl"  placeholder="请输入" runat="server"/>
															</div>
														</div>
                                                         &nbsp;
                                                         <div>	
                                                        <label for="form-field-mask-2">
																项目名称
																
															</label>
                                                            <div>
																<input class="form-control input-mask-phone" type="text" id="xiangmu_mc"  placeholder="请输入" runat="server"/>
															
														</div>							
															
														</div>
                                                        <div>	
                                                        <label for="form-field-mask-2">
																作业位置																
															</label>
                                                            <div>
																<input class="form-control input-mask-phone" type="text" id="zuoye_wz"  placeholder="请输入" runat="server"/>
															
														</div>							
															
														</div>
														<div>															
															<div class="input-group">
																<span class="input-group-addon">
																	今日新增数量
																</span>

																<input class="form-control input-mask-phone" type="text" id="jinri_xzsl" placeholder="请输入" runat="server"/>
															</div>
														</div>
                                                        &nbsp;                                        
                                                        <div>	
                                                        <label for="form-field-mask-2">
																今日检查现场情况
																<small class="text-warning">没有则填无</small>
															</label>
                                                            <div>
															<textarea class="form-control limited"  maxlength="50" placeholder="若没有请输入无" runat="server" id="jinri_jcxcqk"></textarea>
														</div>							
															
														</div>
                                                                                              
                                                        <div>	
                                                        <label for="form-field-mask-2">
																其他备注
																<small class="text-warning">没有则填无</small>
															</label>
                                                            <div>
															<textarea class="form-control limited"  maxlength="50" placeholder="若没有请输入无" runat="server" id="qtbz"></textarea>
														</div>							
															
														</div>
                                                        &nbsp;
                                                        <div>
                                                           <li>
															
												  			<button class="btn btn-info" type="button" onclick="f_fsubmint('1');">
												    <i class="ace-icon fa fa-check bigger-110"></i>
												           提交
											               </button>                               
                                                            &nbsp;
															<button class="btn" type="reset" onclick="f_fsubmint('0');">
												  <i class="ace-icon fa fa-undo bigger-110"></i>
												           暂存
											                </button>
														</li>
                                                        </div>
														
													</div>
												</div>
											</div>
										</div>
										<div class="col-xs-12 col-sm-6 widget-container-col  Is_HS" id="widget-container-col-2">
											<div class="widget-box widget-color-blue" id="widget-box-2">
												<div class="widget-header">
													<h5 class="widget-title bigger lighter">
													<span style="color: #FFFFFF; font-weight: bolder;">	<i class="ace-icon fa fa-table"></i>
													自主维护作业</span>
													</h5>
												</div>

												<div class="widget-body">
													<div class="widget-main no-padding">
														<table class="table table-striped table-bordered table-hover">
															<thead class="thin-border-bottom">
																<tr>
                                                                    <th width="50" class="input-group-addon">序号</th>
                                                                    <th  class="input-group-addon">第三方施工数量</th>
                                                                    <th class="input-group-addon">项目名称</th>
                                                                     <th class="input-group-addon">作业位置</th>
																</tr>
															</thead>

															<tbody>
                                                             <%if (tb != null)
                                                               {
                                                                   for (int i = 0; i < tb.Rows.Count; i++)
                                                                   {
                     
         %>
																<tr>
                                                                <td width="50" class="input-group-addon"><%=i+1 %></td>
																	<td class="input-group-addon"><%=tb.Rows[i]["d_shigong_sl"]%></td>
																    <td class="input-group-addon">
																		<%=tb.Rows[i]["d_xiangmu_mc"]%>
																	</td> 
                                                                    <td class="input-group-addon">
																		<%=tb.Rows[i]["d_zuoye_wz"]%>
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
                                        
                                        <div class="col-xs-12 col-sm-6 widget-container-col Is_HS" id="Div1">
											<div class="widget-box widget-color-blue" id="Div2">
												<div class="widget-header">
													<h5 class="widget-title bigger lighter">
													<span style="color: #FFFFFF; font-weight: bolder;">	<i class="ace-icon fa fa-table"></i>
														暂存信息列表</span>
													</h5>
												</div>

												<div class="widget-body">
													<div class="widget-main no-padding">
														<table class="table table-striped table-bordered table-hover">
															<thead class="thin-border-bottom">
																<tr>
                                                                <th width="50" class="input-group-addon">序号</th>
                                                                    <th  class="input-group-addon">第三方施工数量</th>
                                                                    <th class="input-group-addon">项目名称</th>
                                                                     <th class="input-group-addon">作业位置</th>
                                                                      <th class="input-group-addon">操作</th>
																</tr>
															</thead>

															<tbody>
																 <%if (tbzc != null)
                                                               {
                                                                   for (int i = 0; i < tbzc.Rows.Count; i++)
                                                                   {
                     
         %>
																<tr>
                                                                <td width="50" class="input-group-addon"><%=i+1%></td>
																	<td class="input-group-addon"><%=tbzc.Rows[i]["d_shigong_sl"]%></td>

																	<td class="input-group-addon">
																		<%=tbzc.Rows[i]["d_xiangmu_mc"]%>
																	</td>  
                                                                    <td class="input-group-addon">
																		<%=tbzc.Rows[i]["d_zuoye_wz"]%>
																	</td>                                                     
                                                                     <td class="input-group-addon"> 
												                          <span onclick="f_post('','<%=tbzc.Rows[i]["d_id"]%>');"> <i class="ace-icon glyphicon glyphicon-upload"></i>
												                          </span>											                         
																		
                                                                      <span onclick="f_update('<%=tbzc.Rows[i]["d_id"]%>','<%=tbzc.Rows[i]["d_shigong_sl"]%>','<%=tbzc.Rows[i]["d_xiangmu_mc"]%>','<%=tbzc.Rows[i]["d_zuoye_wz"]%>','<%=tbzc.Rows[i]["d_jinri_xzsl"]%>','<%=tbzc.Rows[i]["d_jinri_jcxcqk"]%>','<%=tbzc.Rows[i]["d_qtbz"]%>')">
                                                                   <i class="ace-icon fa fa-pencil-square-o"></i></span> 
                                                                    
                                                                    </td>
                                                                    <%}
                                                               } %>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>

                                        <div class="col-xs-12 col-sm-4 Is_HS_Up" style="display:none;">
											<div class="widget-box">
												<div class="widget-header">
													<h4 class="widget-title">自主维护作业</h4>

													<span class="widget-toolbar">
														<a href="#" data-action="settings">
															<i class="ace-icon fa fa-cog"></i>
														</a>

														<a href="#" data-action="reload">
															<i class="ace-icon fa fa-refresh"></i>
														</a>

														<a href="#" data-action="collapse">
															<i class="ace-icon fa fa-chevron-up"></i>
														</a>

														  <span  onclick="cancel();" data-action="close"><i class="ace-icon fa fa-times"></i></span>
													</span>
												</div>

												<div class="widget-body">
													<div class="widget-main">
                                                    
                                                            <input type="hidden" id="hide_id" value="" />                                             
                                                                                              
                                                        <div>															
															<div class="input-group">
																<span class="input-group-addon">
																	第三方施工数量
																</span>
																<input class="form-control input-mask-phone" type="text" id="d_shigong_sl"  placeholder="请输入" runat="server"/>
															</div>
														</div>
                                                         &nbsp;
                                                         <div>	
                                                        <label for="form-field-mask-2">
																项目名称
																
															</label>
                                                            <div>
																<input class="form-control input-mask-phone" type="text" id="d_xiangmu_mc"  placeholder="请输入" runat="server"/>
															
														</div>							
															
														</div>
                                                        <div>	
                                                        <label for="form-field-mask-2">
																作业位置																
															</label>
                                                            <div>
																<input class="form-control input-mask-phone" type="text" id="d_zuoye_wz"  placeholder="请输入" runat="server"/>
															
														</div>							
															
														</div>
														<div>															
															<div class="input-group">
																<span class="input-group-addon">
																	今日新增数量
																</span>

																<input class="form-control input-mask-phone" type="text" id="d_jinri_xzsl" placeholder="请输入" runat="server"/>
															</div>
														</div>
                                                        &nbsp;                                        
                                                        <div>	
                                                        <label for="form-field-mask-2">
																今日检查现场情况
																<small class="text-warning">没有则填无</small>
															</label>
                                                            <div>
															<textarea class="form-control limited"  maxlength="50" placeholder="若没有请输入无" runat="server" id="d_jinri_jcxcqk"></textarea>
														</div>							
															
														</div>
                                                                                              
                                                        <div>	
                                                        <label for="form-field-mask-2">
																其他备注
																<small class="text-warning">没有则填无</small>
															</label>
                                                            <div>
															<textarea class="form-control limited"  maxlength="50" placeholder="若没有请输入无" runat="server" id="d_qtbz"></textarea>
														</div>							
															
														</div>
                                                        &nbsp;
                                                        <div>
                                                           <li>
															
												  			<button class="btn btn-info" type="button" onclick="f_upsubmint('1');">
												    <i class="ace-icon fa fa-check bigger-110"></i>
												           提交
											               </button>                               
                                                            &nbsp;
															<button class="btn" type="reset" onclick="f_upsubmint('0');">
												  <i class="ace-icon fa fa-undo bigger-110"></i>
												           暂存
											                </button>
														</li>
                                                        </div>
														
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
       	<script src="assets/js/jquery-2.1.4.min.js"></script>

		<script type="text/javascript">
		    if ('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
		</script>
		<script src="assets/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->
        <script src="assets/js/jquery-ui.custom.min.js" type="text/javascript"></script>
		<script src="assets/js/jquery.ui.touch-punch.min.js"></script>

		<!-- ace scripts -->
		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>

        <script src="js/mui.enterfocus.js" type="text/javascript"></script>
    <script src="js/mui.min.js" type="text/javascript"></script>

		<!-- inline scripts related to this page -->
	
      <script type="text/javascript" charset="utf-8">

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

          //取消修改
          function cancel() {
              $('.Is_HS').show(500);
              $('.Is_HS_Up').hide(500);
          }

          //修改
          function f_update(id, shigong_sl, xiangmu_mc, zuoye_wz, jinri_xzsl, jinri_jcxcqk, qtbz) {
              //  alert("1221");
              $('.Is_HS').hide(500);
              $('.Is_HS_Up').show(500);
              var txtid = $('#hide_id').val(id);
              $('#d_shigong_sl').val(shigong_sl);
              $('#d_xiangmu_mc').val(xiangmu_mc);

              $('#d_zuoye_wz').val(zuoye_wz);
              $('#d_jinri_xzsl').val(jinri_xzsl);
              $('#d_jinri_jcxcqk').val(jinri_jcxcqk);
              $('#d_qtbz').val(qtbz);

              
          }

          //第三方施工
          function f_fsubmint(type) {
              // mui.toast(type);
              var shigong_sl = $("#shigong_sl").val();
              if (shigong_sl == "") {
                  mui.toast("请填写第三方施工数量!");
                  return;
              }
              var xiangmu_mc = $("#xiangmu_mc").val();
              if (xiangmu_mc == "") {
                  mui.toast("请填写项目名称!");
                  return;
              }
              var zuoye_wz = $("#zuoye_wz").val();
              if (zuoye_wz == "") {
                  mui.toast("请填写作业位置!");
                  return;
              }
              var jinri_xzsl = $("#jinri_xzsl").val();
              if (jinri_xzsl == "") {
                  mui.toast("请填写今日新增数量!");
                  return;
              }
              var jinri_jcxcqk = $("#jinri_jcxcqk").val();
              if (jinri_jcxcqk == "") {
                  mui.toast("请填写今日检查施工现场情况!");
                  return;
              }
              var qtbz = $("#qtbz").val();
              if (qtbz == "") {
                  mui.toast("请填写其他备注!");
                  return;
              }
              $.post("../it/it_disan.aspx?CMD=CURTDSFSG&FLAG=" + type + "&SGSL=" +
         shigong_sl + "&XMMC=" + xiangmu_mc + "&ZYWZ=" + zuoye_wz + "&JRXZSL=" + jinri_xzsl + "&XCQK=" + jinri_jcxcqk + "&QTBZ=" + qtbz, {}, function (data) {
             
             if (data == "1") {
                 mui.toast("操作成功!");
                 location.reload();
                 //f_LoginDesk();
             }
             if (data == "111") {
                 mui.toast("修改成功!");
                 location.reload();
                 //f_LoginDesk();
             }
             if (data == "11") {
                 mui.toast("暂存成功!");
                 //f_LoginDesk();
             }
             if (data == "-1") {
                 mui.toast("操作失败，退出重试!");
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

          function f_upsubmint(type) {
              var id = $('#hide_id').val();
              var shigong_sl = $("#d_shigong_sl").val();
              if (shigong_sl == "") {
                  mui.toast("请填写第三方施工数量!");
                  return;
              }
              var xiangmu_mc = $("#d_xiangmu_mc").val();
              if (xiangmu_mc == "") {
                  mui.toast("请填写项目名称!");
                  return;
              }
              var zuoye_wz = $("#d_zuoye_wz").val();
              if (zuoye_wz == "") {
                  mui.toast("请填写作业位置!");
                  return;
              }
              var jinri_xzsl = $("#d_jinri_xzsl").val();
              if (jinri_xzsl == "") {
                  mui.toast("请填写今日新增数量!");
                  return;
              }
              var jinri_jcxcqk = $("#d_jinri_jcxcqk").val();
              if (jinri_jcxcqk == "") {
                  mui.toast("请填写今日检查施工现场情况!");
                  return;
              }
              var qtbz = $("#d_qtbz").val();
              if (qtbz == "") {
                  mui.toast("请填写其他备注!");
                  return;
              }
              $.post("../it/it_disan.aspx?CMD=XGDSFSG&FLAG=" + type + "&DID=" + id + "&SGSL=" +
         shigong_sl + "&XMMC=" + xiangmu_mc + "&ZYWZ=" + zuoye_wz + "&JRXZSL=" + jinri_xzsl + "&XCQK=" + jinri_jcxcqk + "&QTBZ=" + qtbz, {}, function (data) {
             
             // alert(data);<a href="../it/it_submint.aspx">../it/it_submint.aspx</a>
             if (data == "1") {
                 mui.toast("操作成功!");
                 location.reload();
                 //f_LoginDesk();
             }
             if (data == "-1") {
                 mui.toast("操作失败，退出重试!");
                 //f_LoginDesk();
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
              var url = "../it/it_disan.aspx?CMD=DSFPOST&EDIT_DID=" + gid;
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
          function f_edit(fxid) {
              location.href = "wd_ziliao.aspx?EDIT_ZLID=" + fxid;

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
	</body>
</html>
