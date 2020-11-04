<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zaiganglist.aspx.cs" Inherits="MarketInfo.wd_tongji.zaiganglist" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>首页统计</title>
		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="../assets/font-awesome/4.5.0/css/font-awesome.min.css" />

		<!-- page specific plugin styles -->

		<!-- text fonts -->
		<link rel="stylesheet" href="../assets/css/fonts.googleapis.com.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="../assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
		<link rel="stylesheet" href="../assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="../assets/css/ace-rtl.min.css" />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->
		<script src="../assets/js/ace-extra.min.js"></script>

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
                      <form id="Form1" runat="server">                                     				
									<h3 class="header smaller lighter blue">
                                        <a class="btn btn-info" href="../wd_dzrz/main.aspx"><i class="ace-icon fa fa-reply icon-only">
                                        </i>&nbsp;返回</a>
                                    </h3>		
						<div class="row">
							<div class="col-sm-6">
										<div class="widget-box transparent" id="recent-box">
											<div class="widget-header">
												<h4 class="widget-title lighter smaller">
													<i class="ace-icon fa fa-rss orange"></i>在岗统计
												</h4>
											</div>
											<div class="widget-body">
												<div class="widget-main padding-4">
													<div class="tab-content padding-8">
												
														<div id="comment-tab" class="tab-pane active">
															<div class="comments">
                                                                <%if (tb != null)
                                                                    {
                                                                      for (int i = 0; i < tb.Rows.Count; i++)
                                                               {  %>
                                                                	<div class="itemdiv commentdiv">
																	<div class="user">
																		<img alt="Bob Doe's Avatar" src="../assets/images/avatars/avatar2.png" />
																	</div>
																	<div class="body">
																		<div class="name">
																			<a href="#"><%=tb.Rows[i]["T_NAME"]%></a>
																		</div>
																		<div class="time">
																			<i class="ace-icon fa fa-clock-o"></i>
																			<span class="green"><%=tb.Rows[i]["trctime"] %></span>
																		</div>

																		<div class="text">
																		<%--	<i class="ace-icon fa fa-quote-left"></i>--%>
																			<%=tb.Rows[i]["dw"] %> 
																		</div>
																	</div>
																</div>
                                                                   <%}
                                                                       } %>															
																															
															</div>
														</div>
													</div>
												</div><!-- /.widget-main -->
                                                <div class="space-4"></div>

															<div class="center">
																
																<a href="../wd_dzrz/main.aspx" class="btn btn-sm btn-white btn-info">
																<i class="ace-icon fa fa-arrow-left"></i>	返回 &nbsp;
																	
																</a>
															</div>

															<div class="hr hr-double hr8"></div>
											</div><!-- /.widget-body -->
										</div><!-- /.widget-box -->
									</div><!-- /.col -->

								</div><!-- /.row -->
                        </form>
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

		<!-- <![endif]-->

		<!--[if IE]>
<script src="assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
		<script type="text/javascript">
		    if ('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
		</script>
		<script src="../assets/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->

		<!--[if lte IE 8]>
		  <script src="assets/js/excanvas.min.js"></script>
		<![endif]-->
		<script src="../assets/js/jquery-ui.custom.min.js"></script>
		<script src="../assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="../assets/js/jquery.easypiechart.min.js"></script>
		<script src="../assets/js/jquery.sparkline.index.min.js"></script>
		<script src="../assets/js/jquery.flot.min.js"></script>
		<script src="../assets/js/jquery.flot.pie.min.js"></script>
		<script src="../assets/js/jquery.flot.resize.min.js"></script>
       
		<!-- ace scripts -->
		<script src="../assets/js/ace-elements.min.js"></script>
		<script src="../assets/js/ace.min.js"></script> 	
        <script src="js/tongy.js"></script>
	</body>

</html>

