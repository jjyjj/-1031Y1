<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="xh_xunhu_his.aspx.cs" Inherits="MarketInfo.wd_dzrz._1xunhuaguanli.xh_xunhu_his" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
    <link href="../../lib/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../lib/css/style.css" rel="stylesheet" />
<link href="../../lib/assets/css/codemirror.css" rel="stylesheet">
<link rel="stylesheet" href="../../lib/assets/css/ace.min.css" />
<link rel="stylesheet" href="../../lib/font/css/font-awesome.min.css" />
<script type="text/javascript" src="../../lib/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../lib/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../lib/Widget/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript" src="../../lib/assets/js/typeahead-bs2.min.js"></script>           	
<script type="text/javascript" src="../../lib/assets/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../../lib/assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="../../lib/assets/layer/layer.js" type="text/javascript" ></script>          
<script src="../../lib/js/lrtk.js" type="text/javascript" ></script>
<script src="../../lib/assets/layer/layer.js" type="text/javascript"></script>	
<script src="../../lib/assets/laydate/laydate.js" type="text/javascript"></script>
<script src="../../lib/js/it.js" type="text/javascript"></script>
<title>巡护管理历史数据</title>
    </head>
<body><form id="Form1" runat="server">
<input type="hidden" id="HideID" value="" runat="server" />
<div class="margin clearfix">
 <div class="sort_style">
     <!--分类类表-->
     <div class="hr hr-18 dotted hr-double"></div>
								<div class="row">
                                    <h3 class="header smaller lighter blue">
                                       <%-- <a class="btn btn-info" href="wd_dtfxlist.aspx">--%>
                                        <a class="btn btn-info" onclick=" window.history.go(-1)">
                                       <i class="ace-icon fa fa-reply icon-only">                                      
                                        
                                        </i>&nbsp;返回</a>
                                        </h3>
									<div class="col-xs-12">
										<div class="clearfix">
											<div class="pull-right tableTools-container"></div>
										</div>
										<div class="table-header">
											<i class="ace-icon fa fa-hand-o-right icon-animated-hand-pointer red"></i>
										巡护管理历史记录
										</div>

										<!-- div.table-responsive -->

										<!-- div.dataTables_borderWrap -->
										<div>
     <div class="article_sort_list">
         <table class="table table-striped table-bordered table-hover" id="sample-table">
      <thead>
													<tr>
														<th class="center">
															<label class="pos-rel">																
																<span class="lbl">序号</span>
															</label>
														</th>
                                                        <th>巡线工</th>
                                                        <th>检查区段</th>
														<th class="hidden-480">检查里程</th>
                                                        <th class="hidden-480">发现问题</th>
														<th class="hidden-480">问题跟踪</th>
														<th class="hidden-480">提交时间</th>
                                                        <th class="hidden-480">其他</th>
													</tr>
												</thead>
        <tbody>
            <% if (dt_1 != null)
                                                               {
                                                                   for (int i = 0; i < dt_1.Rows.Count; i++)
                                                                   {  %>
													<tr>
														<td class="center">
															<label class="pos-rel">
																
																<span class="lbl"><%=i+1 %></span>
															</label>
														</td>
                                                        <td>
															 <%=dt_1.Rows[i]["xx_name"]%>
														</td>
														<td>
															 <%=dt_1.Rows[i]["xh_jiancha_quduan"]%>
														</td>														
														<td class="hidden-480">   <%=dt_1.Rows[i]["xh_jiancha_licheng"]%></td>
														<td class="hidden-480"> <%=dt_1.Rows[i]["xh_faxian_wenti"]%></td>
                                                        <td class="hidden-480"><a onclick="f_OpenDlg('<%=dt_1.Rows[i]["xh_id"]%>','<%=dt_1.Rows[i]["xx_name"]%>')"> <%=dt_1.Rows[i]["xh_wenti_zhuizong"]%></a></td>
														<td class="hidden-480">
															<%=dt_1.Rows[i]["xh_time"]%>
														</td>
														
                                                        <td class="hidden-480"><%=dt_1.Rows[i]["xh_qita"]%></td>
													</tr>
                                                      <% }
                                                               }%>
        </tbody>
        </table>
     </div>
                                             </div>
 </div>
</div>
     </div>
 </div>
</form>
</body>
</html>
<script type="text/javascript">
    $(function () {
        var oTable1 = $('#sample-table').dataTable({
            "aaSorting": [[1, "desc"]], //默认第几个排序
            "bStateSave": true, //状态保存
            "aoColumnDefs": [
	            {"orderable": false, "aTargets": [5, 6, 2, 3, 4,7,8,9,12]}// 制定列不参与排序
                ]
        });
    })
    /**添加分类**/
     function f_OpenDlgimg(id) {
        var url = "";
        layer.open({
            type: 2,
            title: '现场图片',
            maxmin: true,
            shadeClose: true, //点击遮罩关闭层
            area: ['92%', '92%'],
            content: "wd_fileimg.aspx?file_id=" + id,
            //		btn:['关闭'],
            yes: function (index, layero) {
                layer.close(index);
            }
        })
    }
    function f_OpenDlg(id,name) {
        layer.open({
            type: 2,
            title: '',
            skin: 'layui-layer-lan',
            closeBtn: 1, //不显示关闭按钮
            shade: [0],
            area: ['92%', '92%'],
            anim: 2,
            content: "xh_info.aspx?name="+name+"&file_id=" + id ,
        });
    }
</script>
