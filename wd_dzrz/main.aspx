<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="MarketInfo.wd_dzrz.main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>首页统计</title>
		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css" />
		<!-- page specific plugin styles -->

		<!-- text fonts -->
		<link rel="stylesheet" href="assets/css/fonts.googleapis.com.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->
		<script src="assets/js/ace-extra.min.js"></script>

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="assets/js/html5shiv.min.js"></script>
		<script src="assets/js/respond.min.js"></script>
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
                    <div class="hr hr8 hr-dotted"></div>
                      <form id="Form1" runat="server">
                                     <input type="hidden" id="hideFtid" value="" runat="server" />
                                      <input type="hidden" id="hidtype" value="" runat="server" />
                                     <input type="hidden" id="Hidzid" value="" runat="server" />
                                     <input type="hidden" id="Hidzpid" value="" runat="server" />
						<div class="row">
									<div class="space-6"></div>

									<div class="col-sm-7 infobox-container">
                                        
										<div class="infobox infobox-pink">
											<div class="infobox-icon">
												<i class="ace-icon fa fa-flag bigger-130"></i>
                                                
											</div>

											<div class="infobox-data ">
												<span class="infobox-data-number infobox-text" onclick="f_zaigang()">在岗</span>
												<div class="infobox-content infobox-red" id="yingnum"></div>
											</div>
											<div class="badge badge-success  infobox-text" id="shijinum" >0</div>
										</div>
										<div class="infobox infobox-red">
											<div class="infobox-icon">
												<i class="ace-icon fa fa-flask"></i>
											</div>
                                            
											<div class="infobox-data">
												<span class="infobox-data-number infobox-text" onclick="f_lunxiu()">休假</span>
												<div class="infobox-content" id="XiujiaS"></div>
											</div>b
                                             <input type="hidden" id="Qingjiayes" value="" runat="server" />
                                            <div class="stat stat-success Qingjia" id="today" ></div>
                                           <%-- <div class="stat stat-important Qingjia" id="yesterday" style="display:none;"></div>--%>
										</div>
										<div class="infobox infobox-blue">
											<div class="infobox-icon">
												<i class="ace-icon fa fa-twitter"></i>
											</div>

											<div class="infobox-data">
												<span class="infobox-data-number infobox-text" onclick="f_waichu()">外出</span>
												<div class="infobox-content XXPX" id="XXPX"></div><%--学习培训--%>
											</div>

											<div class="badge badge-success CGJL" id="CGJL">												
												<i class="ace-icon fa fa-arrow-up"></i><%--参观交流--%>
											</div>
										</div>
                                        <div class="infobox infobox-orange2">
											<div class="infobox-chart">
												<span class="sparkline" data-values="196,128,202,177,154,94,100,170,224"></span>
											</div>

											
                                                <div class="infobox-data">
												<span class="infobox-data-number infobox-text" >审批</span>
												<div class="infobox-content" id="count1"></div>
											</div>

											<div class="badge badge-success" id="count">												
												<i class="ace-icon fa fa-arrow-down"></i>
											</div>
										</div>
                                        <div class="infobox infobox-green">
											<div class="infobox-icon">
												<i class="ace-icon fa fa-comments"></i>
											</div>

											<div class="infobox-data">
												<span class="infobox-data-number infobox-text" onclick="f_tongzhi1();">通知</span>
												<div class="infobox-content DIVTONGZHI"></div>
											</div>

											<div class="badge badge-success" id="tongzhi"></div>
										</div>
										<div class="infobox infobox-blue2">
											<%--<div class="infobox-progress">
												<div class="easy-pie-chart percentage" data-percent="42" data-size="46">
													<span class="percent">42</span>%
												</div>
                                                
											</div>--%>
                                            <div class="infobox-icon">
												<i class="ace-icon fa fa-download"></i>
											</div>
											<div class="infobox-data">
												<span class="infobox-text" onclick="f_ziliao()">资料</span>

												<div class="infobox-content">
													<span class="bigger-110 File1"></span>个
													
												</div>
											</div>
										</div>
                                        

										<div class="space-6"></div>
                                        <%if (Session["CUR_T_ID"].ToString() == "0" || Session["CUR_T_ID"].ToString() == "1") {%>

                                        	<div class="infobox infobox-green infobox-small infobox-dark" onclick="f_tianxie()">
											<div class="infobox-progress">
												<div class="easy-pie-chart percentage" data-percent="100" data-size="39">
													<span class="percent" onclick="f_tianxie()">必填</span>
												</div>
											</div>

											<div class="infobox-data">
												<div class="infobox-content">每日工作</div>
												
											</div>
										</div>

                                          <%  } %>
									  <%if (Session["U_LoginName"].ToString() == "管理处")
                                          {%>
									<div class="infobox infobox-blue infobox-small infobox-dark" onclick="f_worklist()">
											<div class="infobox-chart">
												<span class="sparkline" data-values="3,4,2,3,4,4,2,2" > </span>
											</div>

											<div class="infobox-data" onclick="f_worklist()">
												<div class="infobox-content">管道科</div>
												<div class="infobox-content">今日工作</div>
											</div>
										</div><%} %>
									<%--		<div class="infobox infobox-grey infobox-small infobox-dark">
											<div class="infobox-icon">
												<i class="ace-icon fa fa-download"></i>
											</div>
											<div class="infobox-data">
												<div class="infobox-content">Downloads</div>
												<div class="infobox-content">1,205</div>
											</div>--%>
										</div>
									</div>
								<%--	<div class="vspace-12-sm"></div>--%>
							<!-- /.col -->
								</div><!-- /.row -->
								<div class="hr hr8 hr-dotted"></div>						
						<div class="row">
							<div class="col-sm-6">
										<div class="widget-box transparent" id="recent-box">
											<div class="widget-header">
												<h4 class="widget-title lighter smaller">
													<i class="ace-icon fa fa-rss orange"></i>统计
												</h4>

												<div class="widget-toolbar no-border">
													<ul class="nav nav-tabs" id="recent-tab">
														<li class="active">
															<a data-toggle="tab" href="#task-tab">审批统计</a>
														</li>
                                                        <li >
															<a data-toggle="tab" href="#task-tab1">休假审批</a>
														</li>														
													</ul>
												</div>
											</div>
											<div class="widget-body">
												<div class="widget-main padding-4">
													<div class="tab-content padding-8">
														<div id="task-tab" class="tab-pane active">
															<h4 class="smaller lighter green">
																<i class="ace-icon fa fa-list"></i>
																1.待审批
															</h4>

															<ul id="tasks" class="item-list">
																<li class="item-orange clearfix ">
																	<label class="inline">
																		<%--<input type="checkbox" class="ace" />
																		<i class="ace-icon fa fa-comment blue"></i>--%>
                                                                        <i class="ace-icon fa  fa-square fa-hand-paper-o bigger-80 blue"></i>
                                                                        <span class="lbl"> 开挖作业</span>
																	</label>
                                                                  
																	<div class="pull-right easy-pie-chart percentage DIVkaiwa" data-size="30" data-color="#ECCB71" data-percent="100">
																		<div class="percent" id="kaiwa"></div>
																	</div>
																</li>

																<li class="item-red clearfix">
																	<label class="inline">
																		<i class="ace-icon fa fa-signal green"></i>
																		<span class="lbl"> 第三方施工</span>
																	</label>

																	<div class="pull-right easy-pie-chart percentage DIVdisan" data-size="30" data-color="#99FF99" data-percent="90">
																		<div class="percent" id="disan"></div>
																	</div>
																</li>

																<li class="item-default clearfix">
																	<label class="inline">
																		<i class="ace-icon fa fa-wrench  bigger-110 icon-only"></i>
																		<span class="lbl"> 第二方施工</span>
																	</label>

																	<div class="pull-right easy-pie-chart percentage DIVdierfang" data-size="30" data-color="#CC99FF" data-percent="80">
																		<div class="percent" id="dierfang"></div>
																	</div>
																</li>

																<li class="item-blue clearfix">
																	<label class="inline">
																		<i class="ace-icon fa fa-rss red"></i>
																		<span class="lbl">高后果区</span>
																	</label>
                                                                    <div class="pull-right easy-pie-chart percentage DIVgaohoug" data-size="30" data-color="#FF3333" data-percent="70">
																		<div class="percent" id="gaohoug"></div>
																	</div>
																</li>

																<li class="item-grey clearfix">
																	<label class="inline">
																		<i class="ace-icon fa fa-star orange"></i>
																		<span class="lbl">巡护管理</span>
																	</label>
                                                                    <div class="pull-right easy-pie-chart percentage DIVxunhu" data-size="30" data-color="#99CC00" data-percent="70">
																		<div class="percent" id="xunhu"></div>
																	</div>
																</li>

																<li class="item-green clearfix">
																	<label class="inline">
																		<i class="ace-icon fa fa-comment blue"></i>
																		<span class="lbl"> 宣传走访</span>
																	</label>
                                                                     <div class="pull-right easy-pie-chart percentage DIVxuanchuan" data-size="30" data-color="#3399FF" data-percent="70">
																		<div class="percent" id="xuanchuan"></div>
																	</div>
																</li>

																
															</ul>
														</div>
                                                        <div id="task-tab1" class="tab-pane">
															<h4 class="smaller lighter green">
																<i class="ace-icon fa fa-list"></i>
																2.休假待审批
															</h4>

															<ul id="Ul1" class="item-list">
																<li class="item-orange clearfix">
																	<label class="inline">
																		<span class="badge">1</span>
																		<span class="lbl"> 休假</span>
																	</label>

																	<div class="pull-right easy-pie-chart percentage" data-size="30" data-color="#ECCB71" data-percent="100">
																		<span class="percent">2</span>
																	</div>
																</li>

																<li class="item-red clearfix">
																	<label class="inline">
																		<span class="badge badge-success">2</span>
																		<span class="lbl"> 三桩费发放</span>
																	</label>

																	<div class="pull-right action-buttons">
																		<a href="#" class="blue">
																			<i class="ace-icon fa fa-pencil bigger-130"></i>
																		</a>

																		<span class="vbar"></span>

																		<a href="#" class="red">
																			<i class="ace-icon fa fa-trash-o bigger-130"></i>
																		</a>

																		<span class="vbar"></span>

																		<a href="#" class="green">
																			<i class="ace-icon fa fa-flag bigger-130"></i>
																		</a>
																	</div>
																</li>

																<li class="item-default clearfix">
																	<label class="inline">
																		<span class="badge badge-warning">3</span>
																		<span class="lbl"> 管道光缆复测</span>
																	</label>

																	<div class="pull-right pos-rel dropdown-hover">
																		<button class="btn btn-minier bigger btn-primary">
																			<i class="ace-icon fa fa-cog icon-only bigger-120"></i>
																		</button>

																		<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-caret dropdown-close dropdown-menu-right">
																			<li>
																				<a href="#" class="tooltip-success" data-rel="tooltip" title="Mark&nbsp;as&nbsp;done">
																					<span class="green">
																						<i class="ace-icon fa fa-check bigger-110"></i>
																					</span>
																				</a>
																			</li>

																			<li>
																				<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
																					<span class="red">
																						<i class="ace-icon fa fa-trash-o bigger-110"></i>
																					</span>
																				</a>
																			</li>
																		</ul>
																	</div>
																</li>

																<li class="item-blue clearfix">
																	<label class="inline">
																		<span class="badge badge-danger">4</span>
																		<span class="lbl">防汛管理</span>
																	</label>
																</li>

																<li class="item-grey clearfix">
																	<label class="inline">
																		<span class="badge badge-purple">5</span>
																		<span class="lbl">视频监控</span>
																	</label>
																</li>

																<li class="item-green clearfix">
																	<label class="inline">
																		<span class="badge badge-pink">6</span>
																		<span class="lbl"> 资料</span>
																	</label>
																</li>																
															</ul>
														</div>														
													</div>
												</div><!-- /.widget-main -->
											</div><!-- /.widget-body -->
										</div><!-- /.widget-box -->
									</div><!-- /.col -->

								</div><!-- /.row -->
                        </form>
								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
			
			<!-- /.main-content -->

			

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script src="assets/js/jquery-2.1.4.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
		<script type="text/javascript">
		    if ('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
		</script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->

		<!--[if lte IE 8]>
		  <script src="assets/js/excanvas.min.js"></script>
		<![endif]-->
		<script src="assets/js/jquery-ui.custom.min.js"></script>
		<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="assets/js/jquery.easypiechart.min.js"></script>
		<script src="assets/js/jquery.sparkline.index.min.js"></script>
		<script src="assets/js/jquery.flot.min.js"></script>
		<script src="assets/js/jquery.flot.pie.min.js"></script>
		<script src="assets/js/jquery.flot.resize.min.js"></script>
        <script src="../wd_tongji/js/tongji.js"></script>
        <script src="../wd_tongji/js/tj.js"></script>
		<!-- ace scripts -->
		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script> 
        <script src="../wd_tongji/js/tongy.js"></script>
        <script type="text/javascript">
            function f_zaigang() {
                location.href = "../wd_tongji/zaiganglist.aspx";                 
            }
            function f_lunxiu()
            {
                location.href = "../wd_tongji/lunxiulist.aspx";
            }
            function f_waichu() {
                location.href = "../wd_tongji/waichulist.aspx";
            }
            function f_tongzhi1() {
                location.href = "wd_tzxx.aspx";

            }
            function f_ziliao() {

                location.href = "wd_file/wd_sjxx.aspx";

            }
            function f_tianxie() {
                location.href = "wd_gdkwork/wd_work.aspx";

            }
            function f_worklist() {
                location.href = "wd_gdkwork/wd_worklist.aspx";

            }
        </script>
        
        
        
        
              
		
	</body>
</html>
