<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="xh_addphoto.aspx.cs" Inherits="MarketInfo.wd_dzrz._1xunhuaguanli.xh_addphoto" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>上传文件</title>

		<meta name="description" content="Common form elements and layouts" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="../../assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="../../assets/font-awesome/4.5.0/css/font-awesome.min.css" />

		<!-- page specific plugin styles -->
		<link rel="stylesheet" href="../../assets/css/jquery-ui.custom.min.css" />
		<link rel="stylesheet" href="../../assets/css/chosen.min.css" />
		<link rel="stylesheet" href="../../assets/css/bootstrap-datepicker3.min.css" />
		<link rel="stylesheet" href="../../assets/css/bootstrap-timepicker.min.css" />
		<link rel="stylesheet" href="../../assets/css/daterangepicker.min.css" />
		<link rel="stylesheet" href="../../assets/css/bootstrap-datetimepicker.min.css" />
		<link rel="stylesheet" href="../../assets/css/bootstrap-colorpicker.min.css" />

		<!-- text fonts -->
        <link href="../../assets/css/fonts.googleapis.com.css" rel="stylesheet" type="text/css" />
		<!-- ace styles -->
        <link href="../../assets/css/ace.min.css" rel="stylesheet" type="text/css" />
		<!--[if lte IE 9]>
			<link rel="stylesheet" href="../ace/assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
        <link href="../../assets/css/ace-skins.min.css" rel="stylesheet" type="text/css" />
        <link href="../../assets/css/ace-rtl.min.css" rel="stylesheet" type="text/css" />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="../ace/assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->
		
        <script src="../../assets/js/ace-extra.min.js" type="text/javascript"></script>

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="../ace/assets/js/html5shiv.min.js"></script>
		<script src="../ace/assets/js/respond.min.js"></script>
		<![endif]-->
        <script src="../../js/jquery1.42.min.js" type="text/javascript"></script>
		
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
									<div class="col-sm-12">
										<div class="widget-box">
											<div class="widget-header">
												<h4 class="widget-title">文档信息</h4>
											</div>

											<div class="widget-body">
												<div class="widget-main no-padding">
													<form id="Form1" runat="server">
														<!-- <legend>Form</legend> -->
														<fieldset>
															<label>上传文件</label>	 						
															<asp:FileUpload ID="m_files" AllowMultiple="true" runat="server" 
																CssClass="form-control" />
															<div class="space-4"></div>
															<div class="space-4"></div>	 
															<asp:Button ID="ButtonSV" runat="server" Text="保存信息" CssClass="btn btn-sm btn-success" onclientclick="return f_IsNoFile();" onclick="ButtonSV_Click" />
															 
														&nbsp;<a class="btn btn-sm btn-info" href="xh_xunxiangong.aspx">返回上级</a></fieldset>

														<div class="form-actions center">
															
															<asp:Label ID="m_path" runat="server" Text="Label" style="opacity:0; "></asp:Label>
															
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>

									
								</div>
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->

			

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script src="../ace/assets/js/jquery-2.1.4.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
        <script src="../ace/assets/js/jquery-1.11.3.min.js"></script>
        <![endif]-->
		<script type="text/javascript">
		    if ('ontouchstart' in document.documentElement) document.write("<script src='../ace/assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
		</script>
		<script src="../ace/assets/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->

		<!--[if lte IE 8]>
		  <script src="../ace/assets/js/excanvas.min.js"></script>
		<![endif]-->
		<script src="../ace/assets/js/jquery-ui.custom.min.js"></script>
		<script src="../ace/assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="../ace/assets/js/chosen.jquery.min.js"></script>
		<script src="../ace/assets/js/moment.min.js"></script>
		<script src="../ace/assets/js/jquery.knob.min.js"></script>
		<script src="../ace/assets/js/autosize.min.js"></script>	
		<script src="../ace/assets/js/bootstrap-tag.min.js"></script>

		<!-- ace scripts -->
		<script src="../ace/assets/js/ace-elements.min.js"></script>
		<script src="../ace/assets/js/ace.min.js"></script>

		<script src="../lib/assets/layer/layer.js" type="text/javascript"></script>
		<script src="js/doc.js" type="text/javascript"></script>
		
		
	</body>
</html>