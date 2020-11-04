<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_tzxx.aspx.cs" Inherits="MarketInfo.wd_dzrz.wd_tzxx" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>通知</title>
		<meta name="description" content="frequently asked questions using tabs and accordions" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css" />
		<link rel="stylesheet" href="assets/css/fonts.googleapis.com.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />


    <link href="css/jquery.mobile-1.4.5.min.css" rel="stylesheet" type="text/css" />
    <link href="css/mui.min.css" rel="stylesheet" type="text/css" />
		
		<script src="assets/js/ace-extra.min.js"></script>

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="assets/js/html5shiv.min.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]-->
<style type="text/css">
.div_f{float:left; width:90px; font-size:13px; margin: 3px 0;}
.fa-chanzi{ background:url(../css/icon_chanzi.jpg) center -20px no-repeat; background-size:53%; display:block; height:50px;}
.fa-wajueji{ background:url(../css/icon_wjj.jpg) center -7px no-repeat; background-size:contain; display:block; height:50px;}
</style>
	</head> 
	<body class="no-skin">
    <form id="Form1" runat="server">
		<div class="main-container ace-save-state" id="main-container">
			<script type="text/javascript">
			    try { ace.settings.loadState('main-container') } catch (e) { }
			</script>
			<div class="main-content">
				<div class="main-content-inner">
					<div class="page-content">						
						<div class="page-header">
							<h4>
								文件上传
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									资料学习、有关通知
								</small>
							</h4>
						</div><!-- /.page-header -->
<h3 class="header smaller lighter blue">
                                        <a class="btn btn-info" href="main.aspx"><i class="ace-icon fa fa-reply icon-only">
                                        </i>&nbsp;返回首页</a>
                                    </h3>
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="tabbable">
									

									<div class="tab-content no-border padding-24">
								
									
										<div id="faq-tab-3"  class="tab-pane fade in active">
											
										
											<div id="faq-list-3" class="panel-group accordion-style1 accordion-style2">
											
                                            	<div class="center" style=" overflow:inherit;">
                                                <div class="div_f">
												<a class="btn btn-app btn-sm btn-green no-hover" href="wd_file/wd_sjxx.aspx" style=" height:60px; ">		
                                                <i class="ace-icon fa fa-upload bigger-230"></i>	
                                                   																						
												</a>
                                                <span class="line-height-1 smaller-90">资料学习 </span>
                                                </div>

                                                <div class="div_f">
												<a class="btn btn-app btn-sm btn-light no-hover" href="wd_file/wd_ygtz.aspx" style=" height:60px; ">		
                                                <i class="ace-icon fa fa-bullhorn bigger-230"></i>																							
												</a>
                                                <span class="line-height-1 smaller-90">有关通知 </span>
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

			<div class="footer">
				<div class="footer-inner">
					<div class="footer-content">
						<span class="bigger-120">
							<span class="blue bolder">中石油管道有限责任公司西气东输分公司</span>
							版权所有 &copy; 2020

                            <span class="blue bolder">郑州景观地理空间信息研究院</span>设计开发
						</span>
					</div>
				</div>
			</div>

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

		<!-- basic scripts -->
</body>
    </form>
		<!--[if !IE]> -->
		<script src="assets/js/jquery-2.1.4.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
		<script type="text/javascript">
		    if ('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
		</script>
		<script src="assets/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->

		<!-- ace scripts -->
		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->

        <script src="laydate/laydate.js"></script> 
        <script src="js/app.js" type="text/javascript"></script>
        <script src="js/mui.enterfocus.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/mui.min.js"></script>
        <script src="../js/jquery1.42.min.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8">
    lay('#version').html('-v' + laydate.v);
       
</script>
	
</html>

