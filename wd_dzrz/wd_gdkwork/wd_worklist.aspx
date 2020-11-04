<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_worklist.aspx.cs" Inherits="MarketInfo.wd_dzrz.wd_gdkwork.wd_worklist" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
    <link href="../lib/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../lib/css/style.css" rel="stylesheet" />
<link href="../lib/assets/css/codemirror.css" rel="stylesheet">
<link rel="stylesheet" href="../lib/assets/css/ace.min.css" />
<link rel="stylesheet" href="../lib/font/css/font-awesome.min.css" />
    <script src="../lib/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../lib/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../lib/Widget/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript" src="../lib/assets/js/typeahead-bs2.min.js"></script>           	
<script type="text/javascript" src="../lib/assets/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../lib/assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="../lib/assets/layer/layer.js" type="text/javascript" ></script>          
<script src="../lib/js/lrtk.js" type="text/javascript" ></script>
<script src="../lib/assets/layer/layer.js" type="text/javascript"></script>	
<script src="../lib/assets/laydate/laydate.js" type="text/javascript"></script>
<script src="../lib/js/it.js" type="text/javascript"></script>
<title>管道科今日工作列表</title>
    </head>
<body><form id="Form1" runat="server">
<div class="margin clearfix">
 <div class="sort_style">
     <!--分类类表-->
     <div class="hr hr-18 dotted hr-double"></div>
								<div class="row">
                                    <h3 class="header smaller lighter blue">
                                        <a class="btn btn-info" href="../main.aspx"><i class="ace-icon fa fa-reply icon-only">
                                        </i>&nbsp;返回</a>
                                        </h3>                                   
									<div class="col-xs-12">
										<div class="clearfix">
											<div class="pull-right tableTools-container"></div>
										</div>
										<div class="table-header">
											<i class="ace-icon fa fa-hand-o-right icon-animated-hand-pointer red"></i>
										管道科今日工作列表
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
                                                        <th>姓名</th>
                                                        <th>地点</th>
														<th class="hidden-480">内容</th>
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
															 <%=dt_1.Rows[i]["name"]%>
														</td>
														<td>
															 <%=dt_1.Rows[i]["didian"]%>
														</td>														
														<td class="hidden-480">   <%=dt_1.Rows[i]["zhuyao_gongzuo"]%></td>
                                                        <td class="hidden-480">   <%=dt_1.Rows[i]["qita"]%></td>
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
    function f_ShowDlg(id){
        var url = "";
        layer.open({
            type: 2,
            title: '高速公路管制信息',
            maxmin: true,
            shadeClose: true, //点击遮罩关闭层
            area: ['92%', '92%'],
            content: "wd_gzinfo.aspx?KeyID=" + id,
            //		btn:['关闭'],
            yes: function (index, layero) {
                layer.close(index);
            }
        })
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
            content: "wd_file.aspx?file_id=" + id ,
        });
    }
</script>


