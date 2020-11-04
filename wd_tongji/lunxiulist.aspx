<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lunxiulist.aspx.cs" Inherits="MarketInfo.wd_tongji.lunxiulist" %>

<!DOCTYPE html>

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
    <link href="../ace/assets/css/colorbox.min.css" rel="stylesheet" type="text/css" />
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
        <style>
        
    
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
                      <form id="Form1" runat="server">
                                     <input type="hidden" id="hideFtid" value="" runat="server" />
                                      <input type="hidden" id="hidtype" value="" runat="server" />
                                     <input type="hidden" id="Hidzid" value="" runat="server" />
                                     <input type="hidden" id="Hidzpid" value="" runat="server" />					
									<h3 class="header smaller lighter blue">
                                        <a class="btn btn-info" href="../wd_dzrz/main.aspx"><i class="ace-icon fa fa-reply icon-only">
                                        </i>&nbsp;返回</a>
                                    </h3>		
						<div class="row">
							<div class="col-sm-6">
										<div class="widget-box transparent" id="recent-box">
											<div class="widget-header">
												<h4 class="widget-title lighter smaller">
													<i class="ace-icon fa fa-rss orange"></i>休假统计
												</h4>
											</div>
												<div id="member-tab" class="tab-pane">
															<div class="clearfix">
                                                                  <%if (tb != null)
                                                                    {
                                                                      for (int i = 0; i < tb.Rows.Count; i++)
                                                               {
                                                          //1:zid=zid
                                                          String QU = "select * from T_ZYQ_INFO WHERE ZID="+tb.Rows[i]["ZID"]+"";  
                                                          System.Data.DataTable tbQU=WXDBUtility.SqlHelper.GetDataTable(QU);
                                                          string ZPID = "";
                                                          string QUNAME = "";
                                                          if (tbQU != null)
                                                          {
                                                               ZPID = tbQU.Rows[0]["ZPID"].ToString();
                                                               QUNAME = tbQU.Rows[0]["ZNAME"].ToString();
                                                          }
                                                          //2:zid=zpid
                                                          string ZNAME = "";
                                                          String QU1 = "SELECT * FROM T_ZYQ_INFO WHERE ZID=" + ZPID + "";
                                                          System.Data.DataTable tbQU1 = WXDBUtility.SqlHelper.GetDataTable(QU1);
                                                        
                                                          if (tbQU1 != null)
                                                          {
                                                              //判断是否查询到类别为1（区）的列，不为1就再查一次，给zname重新赋值。
                                                              if (tbQU1.Rows[0]["ztype"].ToString() != "1")
                                                              {
                                                                  String QU2 = "SELECT * FROM T_ZYQ_INFO WHERE ZID=" + tbQU1.Rows[0]["zpid"].ToString() + "";
                                                                  System.Data.DataTable tbQU2 = WXDBUtility.SqlHelper.GetDataTable(QU2);
                                                                  ZNAME = tbQU2.Rows[0]["ZNAME"].ToString();
                                                                  QUNAME = tbQU1.Rows[0]["ZNAME"].ToString(); 
                                                              }
                                                              else
                                                              {
                                                                  ZNAME = tbQU1.Rows[0]["ZNAME"].ToString();   
                                                              }
                                                              
                                                          }              
                                                                                  
                                                                           %>
																<div class="itemdiv memberdiv">
																	<div class="user">
																		<img alt="Joe Doe's avatar" src="../assets/images/avatars/avatar2.png" />
																	</div>
																	<div class="body">
																		<div style="line-height: 18px;margin-bottom: 0;display: block;color: #999;">
																		<%=ZNAME%>-<%=QUNAME%>-<%=tb.Rows[i]["T_NAME"]%>
																		</div>
																		<div class="time">																		
                                                                           
                                                                            <%String sel = "select datediff(day,'"+tb.Rows[i]["T_WSTART"]+"','"+tb.Rows[i]["T_WEND"]+"') as c from T_WORK_INFO1";
                                                                                String sel2 = "select datediff(day,'"+DateTime.Now.ToShortDateString().ToString()+"','"+tb.Rows[i]["T_WEND"]+"') as c from T_WORK_INFO1";

                                                                                int t = 0;
                                                                                int m = 0;

                                                                                System.Data.DataTable tb1=WXDBUtility.SqlHelper.GetDataTable(sel);
                                                                                System.Data.DataTable tb2=WXDBUtility.SqlHelper.GetDataTable(sel2);

                                                                                if (tb1 != null || tb2!=null)
                                                                                {
                                                                                    t = Convert.ToInt16(tb1.Rows[0]["c"].ToString()) + 1;
                                                                                    m = Convert.ToInt16(tb2.Rows[0]["c"].ToString()) + 1;
                                                                                }
                                                                                %>                                                                            
																			<span class="green">共:<%=t%>天</span>
                                                                            &nbsp;<i class="ace-icon fa fa-clock-o"></i><span class="green">余:<%=m%>天</span>
                                                                            
																		</div>
																	
                                                  <%
                                                      string namec = ""; 
                                                      if (tb.Rows[i]["T_PATH"].ToString() != "")
                                                      {
                                                          namec = "工作交接单";
                                                      }
                                                   if (tb.Rows[i]["T_TYPEID"].ToString() == "1") 
                                                   {
                                                     string path = tb.Rows[i]["T_PATH"].ToString().Replace("../QJfile/", "");
                                                  %>
                                       <div style="overflow: hidden;text-overflow:ellipsis;white-space:nowrap;">
                                       <span class="label label-danger label-m">请假</span>
                                       <a href="<%=tb.Rows[i]["T_PATH"]%>"><%=namec%></a>
                                       </div>
                                       <br />
                                       [<%=tb.Rows[i]["T_WSTART"]%>至<%=tb.Rows[i]["T_WEND"]%>]
                                                  <% }
                                                   string named = "";
                                                   if (tb.Rows[i]["T_PATH"].ToString() != "")
                                                   {
                                                       named = "工作交接单";
                                                   }                                  
                                                  if (tb.Rows[i]["T_TYPEID"].ToString() == "2") 
                                                  {
                                                      string path = tb.Rows[i]["T_PATH"].ToString().Replace("../QJfile/", ""); 
                                                  %>
                                     
                                       <div style="overflow: hidden;text-overflow:ellipsis;white-space:nowrap;">
                                        <span class="label label-success label-m arrowed-in">轮休 </span> 
                                       <a href="<%=tb.Rows[i]["T_PATH"]%>"><%=namec%></a>
                                       </div>
                                       <br />
                                       [<%=tb.Rows[i]["T_WSTART"]%>至<%=tb.Rows[i]["T_WEND"]%>]
                                                                                  <% }%>
																		</div>
																	</div>
																</div>
                                                       <%}
                                                    } %>																
															</div>

															<div class="space-4"></div>

															<div class="center">
																
																<a href="../wd_dzrz/main.aspx" class="btn btn-sm btn-white btn-info">
																<i class="ace-icon fa fa-arrow-left"></i>	返回 &nbsp;
																	
																</a>
															</div>

															<div class="hr hr-double hr4"></div>
														</div><!-- /.#member-tab -->
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

			<div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none; visibility: visible; top: 147px; left: 0px; position: absolute; width: 414px; height: 442px; overflow: hidden; opacity: 0;"><div id="cboxWrapper" style="height: 442px; width: 414px;"><div><div id="cboxTopLeft" style="float: left;"></div><div id="cboxTopCenter" style="float: left; width: 334px;"></div><div id="cboxTopRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxMiddleLeft" style="float: left; height: 362px;"></div><div id="cboxContent" style="float: left; width: 334px; height: 362px;"><div id="cboxTitle" style="float: left; display: block;"></div><div id="cboxCurrent" style="float: left; display: block;">6 of 8</div><button type="button" id="cboxPrevious" style="display: block;"><i class="ace-icon fa fa-arrow-left"></i></button><button type="button" id="cboxNext" style="display: block;"><i class="ace-icon fa fa-arrow-right"></i></button><button id="cboxSlideshow" style="display: none;"></button><div id="cboxLoadingOverlay" style="float: left; display: none;"></div><div id="cboxLoadingGraphic" style="float: left; display: none;"><i class="ace-icon fa fa-spinner orange fa-spin"></i></div><button type="button" id="cboxClose">×</button></div><div id="cboxMiddleRight" style="float: left; height: 362px;"></div></div><div style="clear: left;"><div id="cboxBottomLeft" style="float: left;"></div><div id="cboxBottomCenter" style="float: left; width: 334px;"></div><div id="cboxBottomRight" style="float: left;"></div></div></div><div style="position: absolute; width: 9999px; visibility: hidden; max-width: none; display: none;"></div></div>

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>wwwww
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
        <script src="../ace/assets/js/jquery.colorbox.min.js" type="text/javascript"></script>
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
        <script type="text/javascript">
       
            jQuery(function ($) {
                var $overflow = '';
                var colorbox_params = {
                    rel: 'colorbox',
                    reposition: true,
                    scalePhotos: true,
                    scrolling: false,
                    previous: '<i class="ace-icon fa fa-arrow-left"></i>',
                    next: '<i class="ace-icon fa fa-arrow-right"></i>',
                    close: '&times;',
                    current: '{current} of {total}',
                    maxWidth: '100%',
                    maxHeight: '100%',
                    onOpen: function () {
                        $overflow = document.body.style.overflow;
                        document.body.style.overflow = 'hidden';
                    },
                    onClosed: function () {
                        document.body.style.overflow = $overflow;
                    },
                    onComplete: function () {
                        $.colorbox.resize();
                    }
                };

                $('.ace-thumbnails [data-rel="colorbox"]').colorbox(colorbox_params);
                $("#cboxLoadingGraphic").html("<i class='ace-icon fa fa-spinner orange fa-spin'></i>"); //let's add a custom loading icon


                $(document).one('ajaxloadstart.page', function (e) {
                    $('#colorbox, #cboxOverlay').remove();
                });
            })
        
        </script>
	</body>

</html>

