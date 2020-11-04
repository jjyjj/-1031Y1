<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sp_kwzy.aspx.cs" Inherits="MarketInfo.wd_sp.sp_kwzy" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>开挖类方案审批</title>

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
							开挖作业
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>								
								</small>
							</h4>
						</div><!-- /.page-header -->
                        <h3 class="header smaller lighter blue"> <a class="btn btn-info" onclick="go_shenpi()"><i class="ace-icon fa fa-reply icon-only"></i>&nbsp;返回</a>
                         <a class="btn btn-info" href="../wd_dzrz/wd_dtfx/wd_hislist.aspx?UTID=<%=UTID%>">
                          &nbsp;历史记录</a>
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
													
												    <th class="input-group-addon">序号</th>
                                                       <th class="input-group-addon hidden-480"">站区</th>
                                                       <th class="input-group-addon hidden-480"">姓名</th>

													<th class="input-group-addon">工程名称</th>
													<th class="input-group-addon hidden-480">施工类型</th>  
                                                    <th class="input-group-addon">方案</th>  
													<th class="input-group-addon Hide_types"> 审批</th>
												</tr>
											</thead>

											<tbody>  
                                            <%if (tb != null)
                                                  {
                                                      for (int i = 0; i < tb.Rows.Count; i++)
                                                      { %>
												<tr>
                                              
                                                      <td class="input-group-addon"><%=i+1%></td>
                                                   <td class="input-group-addon hidden-480"><%=tb.Rows[i]["zname"]%></td>
                                                   <td class="input-group-addon hidden-480"><%=tb.Rows[i]["T_NAME"]%></td>
													<td class="input-group-addon">
														<a href="javascript:;" onclick="fx_update('<%=tb.Rows[i]["id"]%>')" title="查看详情">
                                                        <%=tb.Rows[i]["fx_gcm"]%></a>
													</td>
                                                   
													<td class="input-group-addon hidden-480"><%=tb.Rows[i]["fx_type"]%></td>
													  <td class="input-group-addon">
														<span style="color:blue" onclick="f_OpenDlg('<%=tb.Rows[i]["id"]%>')" title="点击查看方案">
                                                             <%if (tb.Rows[i]["file_title"].ToString() != "" && tb.Rows[i]["file_title"] != null) {
%>  <%=tb.Rows[i]["file_title"].ToString().Substring(0,5)%>

                                                                <%} %>
                                                           
                                                           </span>
                                                           <span style="color:red" onclick="f_OpenDlgimg('<%=tb.Rows[i]["id"]%>')" title="点击查看现场照片">
                                                             <%if (tb.Rows[i]["img_title"].ToString() != "" && tb.Rows[i]["img_title"] != null)
                                                               {
%>  <%=tb.Rows[i]["file_title"].ToString().Substring(0,5)%>

                                                                <%} %>
                                                           
                                                           </span>
                                                           
													</td>
													<td class="input-group-addon Hide_types">
														<div class="hidden-sm hidden-xs btn-group">															
															<button class="btn btn-xs btn-danger">
																<span onclick="f_shenpi('<%=tb.Rows[i]["id"]%>','-1')"><i class="ace-icon fa fa-flag bigger-120"></i></span>
															</button>
														</div>
														<div class="hidden-md hidden-lg">
															<div class="inline pos-rel">
																<button class="btn btn-xs btn-danger">
																<span onclick="f_shenpi('<%=tb.Rows[i]["id"]%>','-1')"><i class="ace-icon fa fa-flag bigger-120"></i></span>
															</button>
																<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
																	<li>
																		<a href="#" class="tooltip-info"  onclick="f_shenpi('<%=tb.Rows[i]["id"]%>','-1')" data-rel="tooltip" title="View">
																			<button class="btn btn-xs btn-danger">
																<span onclick="f_shenpi('<%=tb.Rows[i]["id"]%>','-1')"><i class="ace-icon fa fa-flag bigger-120"></i></span>
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



                               <div class="col-xs-12 col-sm-4 Is_HS_Up" style="display: none;">
                                        <div class="widget-box">
                                            <div class="widget-header">
                                                <h4 class="widget-title">详情</h4>
                                                <span class="widget-toolbar"><a href="#"><i class="ace-icon fa fa-times" onclick="er_cancel()"></i></a></span>
                                            </div>
                                            <input type="hidden" id="hide_id" value="" runat="server"/>
                                            <input type="hidden" id="hide_fg" value="" runat="server"/>
                                            <div class="widget-body">
                                                <div class="widget-main">
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">施工类型</span>
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
                                                            <span class="input-group-addon">现场监护人</span>
                                                            <input class="form-control input-mask-phone" type="text" placeholder="请输入" id="txtnameup"
                                                                runat="server" />
                                                        </div>
                                                    </div>
                                                    &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">行政区域</span>
                                                            <input class="form-control input-mask-phone" type="text" id="txtxzzhup" placeholder="请输入"
                                                                runat="server" />
                                                        </div>
                                                    </div>
                                                    &nbsp;
                                                     <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">桩号</span>
                                                            <input class="form-control input-mask-phone" type="text" id="txtzhup" placeholder="请输入"
                                                                runat="server" />
                                                        </div>
                                                    </div>
                                                    &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">工程名称</span>
                                                            <input class="form-control input-mask-phone" type="text" id="txtgcmup" placeholder="请输入"
                                                                runat="server" />
                                                        </div>
                                                    </div> 
                                                    &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">管道光缆情况</span>
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
                                                            <span class="input-group-addon">今日是否完工</span> 
                                                            <select id="Select1" class="form-control input-mask-phone" name="txttype" style="border:1px solid #D5D5D5 !important" runat="server">
                                                            <option value="-1">【请选择】</option>
                                                            <option value="否">否</option>
                                                            <option value="是">是</option>
                                                            </select>
                                                        </div></div> &nbsp; 
                                                     <div>
                                                        <div class="input-group">
                                                            <%-- <input class="form-control input-mask-phone" type="text" id="fileup" 
                                                                runat="server" />--%>
                                                              <input type="hidden" id="filefangan" value="" runat="server"/>
                                                                <input type="hidden" id="fileimg" value="" runat="server"/>
                                                            <label class="ace-file-input ace-file-multiple" >
                                                                <input type="file" id="file_as" name="file" accept="image/*,.pdf,.zip,.7z,.doc"   runat="server"/>
                                                                <span class="ace-file-container" data-title="Drop files here or click to choose"  style=" display:none;">
                                                                <span class="ace-file-name" data-title="No File ..."><i class=" ace-icon ace-icon fa fa-cloud-upload"></i>
                                                                </span></span><a class="remove" href="#"><i class=" ace-icon fa fa-times"></i></a>
                                                                </label>
                                                               
                                                             <label class="ace-file-input ace-file-multiple" >
                                                                <input type="file" id="file_as1" name="file" accept="image/*,.pdf,.zip,.7z,.doc"   runat="server"/>
                                                                <span class="ace-file-container" data-title="Drop files here or click to choose"  style=" display:none;">
                                                                <span class="ace-file-name" data-title="No File ..."><i class=" ace-icon ace-icon fa fa-cloud-upload"></i>
                                                                </span></span><a class="remove" href="#"><i class=" ace-icon fa fa-times"></i></a>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">其他</span>
                                                        </div>
                                                        <textarea rows="3" cols="0" class="form-control input-mask-phone" id="txtaremarkup" runat="server"></textarea>
                                                    </div>
                                                    &nbsp;
                                                    <div>
                                                        
                                                            
                                                               <button class="btn btn-info" type="button" onclick="er_cancel()">
                                                                    <i class="ace-icon fa fa-check bigger-110"></i>返回
                                                                </button>
                                                       
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
                   // alert(e.index);
                    if (e.index == 1) {
                        f_set(sid, type);
                    }
                    else if (e.index == 2)
                    {
                    }
                    else {
                        f_set(sid, '1');
                    }
                })
            }
            function f_set(id, type) {               
                    f_UpTitle(id, type);
              
               // alert(type);
               
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
                        $.post("../it/SPkwzy.ashx", { TYPE: type, ID: id, sp: Hide_Sp, Reason: txtReason }, function (data) {
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


            function f_OpenDlg(id) {
                layer.open({
                    type: 2,
                    title: '',
                    skin: 'layui-layer-lan',
                    closeBtn: 1, //不显示关闭按钮
                    shade: [0],
                    area: ['92%', '92%'],
                    anim: 2,
                    content: "../wd_dzrz/wd_dtfx/wd_file.aspx?file_id=" + id,
                });
            }
            //查看现场照片
            function f_OpenDlgimg(id) {
       // alert("1221");<a href="../wd_dzrz/wd_dtfx/wd_fileimg.aspx">../wd_dzrz/wd_dtfx/wd_fileimg.aspx</a>
        layer.open({
            type: 2,
            title: '',
            skin: 'layui-layer-lan',
            closeBtn: 1, //不显示关闭按钮
            shade: [0],
            area: ['80%', '80%'],
            anim: 2,
            content: "../wd_dzrz/wd_dtfx/wd_fileimg.aspx?file_id=" + id,
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
        </script>












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

