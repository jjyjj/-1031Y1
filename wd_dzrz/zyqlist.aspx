<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zyqlist.aspx.cs" Inherits="MarketInfo.wd_dzrz.zyqlist" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>分类管理</title>  
		<meta name="description" content="Static &amp; Dynamic Tables" />
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
		
    <link href="assets/css/ace-skins.min.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->
		<script src="assets/js/ace-extra.min.js"></script>

		<!--[if lte IE 8]>
		<script src="assets/js/html5shiv.min.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]-->
		
	</head>
<body class="no-skin">	
	<form id="Form1" runat="server">
	<asp:HiddenField ID="m_pid" runat="server" />		
		<div class="main-container ace-save-state" id="main-container">
			<div class="main-content">
				<div class="main-content-inner">		
					<div class="page-content">
						<!-- /.ace-settings-container -->		
						<div class="page-header">
							<h1>
								作业区管理\<%if (Session["PNAME"] != null) {
															Response.Write(Session["PNAME"].ToString());
														}%>
							</h1>
						</div><!-- /.page-header -->				
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="row">
									<div class="col-xs-12">
									<div class="clearfix">
										<div class="tableTools-container"><%
											if (m_pid.Value != "-1") {
												%>
												<a href="zyqlist.aspx?PID=-1" class='btn btn-primary btn-round'><i class="ace-icon glyphicon glyphicon-home"></i>返回首页</a>
											<%=_GetBack()%>
											<%} %>
											<a href="javascript:f_AddDlg('<%=Session["PID"].ToString()%>','<%=strtype %>');" class="btn btn-warning btn-round">
												<i class="ace-icon glyphicon glyphicon-plus bigger-120 blue"></i>
												添加
											</a>
										</div>
										</div>
										<table id="simple-table" class="table  table-bordered table-hover">
											<thead>
												<tr>
													<th class="detail-col">序号</th>
													<th width="600">名称</th>

													<th  width="120">新增用户</th>

													<th class="detail-col" width="80">编辑</th>

													<th class="detail-col" width="80">删除</th>
                                                    <th  width="100">用户列表</th>
													<th>&nbsp;</th>
												</tr>
											</thead>		
											<tbody>
											<%if (tb != null) {
														for (int i = 0; i < tb.Rows.Count; i++) {
															   
                                                         %>
												<tr id="r_<%=tb.Rows[i]["zid"]%>">		
													<td class="center">
														<div class="action-buttons">
															<%=i+1%>
														</div>
													</td>

													<td>
														  <a href="zyqlist.aspx?PID=<%=tb.Rows[i]["zid"]%>&PNAME=<%=tb.Rows[i]["zname"]%>&TYPE=<%=strtype %>"><span id="d_<%=tb.Rows[i]["zid"]%>"><%=tb.Rows[i]["zname"]%></span></a>
													</td>

													<td class="center" onclick="f_EditIdx('<%=tb.Rows[i]["ztype"]%>','<%=tb.Rows[i]["zid"]%>','<%=tb.Rows[i]["zpid"]%>');" style="cursor: pointer; color: #0000FF">
														<%--<span id="i_<%=tb.Rows[i]["zid"]%>"><%=tb.Rows[i]["zdex"]%></span>--%>
												          <i class="ace-icon glyphicon glyphicon-plus"></i>
                                                       </td>
													<td class="center">
														<div class="hidden-sm hidden-xs btn-group">
																<a class="btn btn-xs btn-info" href="javascript:f_EditDlg('<%=tb.Rows[i]["zid"]%>','<%=tb.Rows[i]["zname"]%>')">
																				<i class="ace-icon fa fa-pencil bigger-120"></i>
																</a>
																</div>
														</td>				
													<td class="center">
														<div class="hidden-sm hidden-xs btn-group">
															<a class="btn btn-xs btn-danger" href="javascript:f_IsDel('<%=tb.Rows[i]["zid"]%>');">
																<i class="ace-icon fa fa-trash-o bigger-120"></i>
															</a>
															</div>
															</td>	

                                                            <td class="center"  style="cursor: pointer;" >
														<span id="Span1"><%=tb.Rows[i]["zdex"]%></span> 
                                                        
                                                                                                             
												          <a href="../wd_user/wd_listuser.aspx?TYPE=<%=tb.Rows[i]["ztype"]%>&ZID=<%=tb.Rows[i]["zid"]%>"> <i class="ace-icon glyphicon glyphicon-th"></i></a>
                                                       </td>
													<td>																														
													</td>
												</tr>																											
												<%																																										
																}
													} %>
											</tbody>
										</table>
									</div><!-- /.span -->
								</div><!-- /.row -->	<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->			
			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->
		</form>	
		<script src="assets/js/jquery-2.1.4.min.js"></script>		
		<script type="text/javascript">
		    if ('ontouchstart' in document.documentElement) document.write("<script src='../ace/assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
		</script>
		<script src="assets/js/bootstrap.min.js"></script>		
		<!-- page specific plugin scripts -->
    <script src="../lib/assets/js/jquery.dataTables.min.js"></script>
    <script src="../lib/assets/js/jquery.dataTables.bootstrap.js"></script>
		<%--<script src="assets/js/jquery.dataTables.min.js"></script>--%>
		<%--<script src="assets/js/jquery.dataTables.bootstrap.min.js"></script>--%>

		<!-- ace scripts -->
		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js" ></script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
		    jQuery(function ($) {
		        //initiate dataTables plugin
		        var myTable =
				$('#simple-table').DataTable({
				    bAutoWidth: false,
				    "aoColumns": [
					  { "bSortable": false },
					  null, null, null, null, null,
					  { "bSortable": false }
					],
				    "aaSorting": [],
				});		 

		    })
		</script>
    <script src="lib/assets/layer/layer.js" type="text/javascript"></script>
		 <script src="lib/assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="js/main.js" type="text/javascript"></script>
	</body>
</html>
