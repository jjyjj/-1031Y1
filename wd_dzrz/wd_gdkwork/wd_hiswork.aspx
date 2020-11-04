<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_hiswork.aspx.cs" Inherits="MarketInfo.wd_dzrz.wd_gdkwork.wd_hiswork" %>

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
<title>开挖类作业历史数据</title>
    </head>
<body>
                    
<div class="margin clearfix">
 <div class="sort_style">
     <!--分类类表-->
     <div class="hr hr-18 dotted hr-double"></div>
								<div class="row">
                                    <h3 class="header smaller lighter blue">                                        
                                        <%if (Session["CRT_UTID"] != "")
                                          { %>
                                           <span class="btn btn-info" onclick="window.history.go(-1)"><i class="ace-icon fa fa-reply icon-only">
                                       </i>&nbsp;返回</span>
                                         <% }
                                          else { %>
                                          <a class="btn btn-info" href="wd_work.aspx"><i class="ace-icon fa fa-reply icon-only">
                                        </i>&nbsp;返回</a>
                                         <% }%>
                                        </h3>
                                        <form id="Form2" runat="server">  
									<div class="col-xs-12 Is_HS">
										<div class="clearfix">
											<div class="pull-right tableTools-container"></div>
										</div>
										<div class="table-header">
											<i class="ace-icon fa fa-hand-o-right icon-animated-hand-pointer red"></i>
										每日工作历史记录
										</div>
										<!-- div.table-responsive -->
										<!-- div.dataTables_borderWrap -->
										<div>
     <div class="article_sort_list">
         <table class="table table-striped table-bordered table-hover" id="sample-table">
      <thead>
													<tr>
														<th class="input-group-addon center">																														
																序号															
														</th>
                                                        <th class="input-group-addon">地点</th>
                                                        <th class="input-group-addon">
                                                        主要工作
                                                        </th>
														<th class="input-group-addon hidden-480">本周重点</th>
                                                        <th class="input-group-addon hidden-480">下周计划</th>
														 <th class="input-group-addon hidden-480">其他</th>
														<th class="input-group-addon hidden-480">提交时间</th>                                                      
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
                                                        <a href="javascript:;"  onclick="f_OpenDlg('<%=dt_1.Rows[i]["id"]%>')">
															 <%=dt_1.Rows[i]["didian"]%>
                                                             </a>
														</td>
														<td>
															<a href="javascript:;"  onclick="fx_update0('<%=dt_1.Rows[i]["id"]%>','0')">
                                                             <%=dt_1.Rows[i]["zhuyao_gongzuo"]%></a>
														</td>														
														<td class="input-group-addon hidden-480">  <span onclick="f_OpenDlg('<%=dt_1.Rows[i]["id"]%>')"> <%=dt_1.Rows[i]["benzhou_zhongdian"]%></span></td>
														<td class="input-group-addon hidden-480"> <%=dt_1.Rows[i]["xiahzou_jihua"]%></td>
                                                       
                                                        <td class="input-group-addon hidden-480"><%=dt_1.Rows[i]["qita"]%></td>
                                                        <td class="input-group-addon hidden-480"><%=dt_1.Rows[i]["crtime"]%></td>
                                                        
													</tr>
                                                      <% }
                                                               }%>
        </tbody>
        </table>
     </div>
                                             </div>
 </div>
                                   <div class="col-xs-12 col-sm-6 Is_HS_Up" style="display: none;">
                                        <div class="widget-box">
                                            <div class="widget-header">
                                                <h4 class="widget-title">工作详情</h4>
                                                <span class="widget-toolbar"><a href="#"><i class="ace-icon fa fa-times" onclick="er_cancel()"></i></a></span>
                                            </div>
                                            <input type="hidden" id="hide_id" value="" runat="server"/>
                                            <input type="hidden" id="hide_fg" value="" runat="server"/>
                                            <div class="widget-body">
                                                <div class="widget-main">
                                                   
                                                     <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">地点</span>
                                                            <input class="form-control input-mask-phone" type="text" placeholder="请输入" id="txtddup"
                                                                runat="server" />
                                                        </div>
                                                    </div>
                                                    
                                                    &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">工作内容</span>
                                                            
                                                        </div>
                                                        <textarea rows="3" cols="0" class="form-control input-mask-phone" id="txtworkup"
                                                                placeholder="请输入" runat="server"></textarea>
                                                    </div> 
                                                    &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">其他</span>
                                                        </div>
                                                        <textarea rows="3" cols="0" class="form-control input-mask-phone" id="txtqtup" runat="server"></textarea>
                                                    </div>
                                                    &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">本周重点工作</span>                                                            
                                                        </div>
                                                        <textarea rows="3" cols="0" class="form-control input-mask-phone" id="txtbzgzup"  placeholder="每周五上午10前提交" runat="server"></textarea>
                                                    </div> 
                                                    &nbsp;  
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">下周工作安排</span>
                                                            
                                                        </div>
                                                        <textarea rows="3" cols="0" class="form-control input-mask-phone" id="txtxzapup"  placeholder="每周五上午10前提交" runat="server"></textarea>
                                                    </div> 
                                                </div>
                                            </div>
                                        </div>
                                    </div>

</form>
  
</div>
     </div>
 </div>
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

     function fx_update0(id, lo) {
              $('.Is_HS').hide(500);
              $('.Is_HS_Up').show(600);
              $('#hide_id').val(id);
              $.post("WorkData.ashx", { id: id }, function (data) {
                  JSons(data);
              });
          }
          function JSons(data) {
              if (data != null) {
                  $('#txtddup').val(data[0].didian);
                  $('#txtworkup').val(data[0].zhuyao_gongzuo);
                  $('#txtqtup').val(data[0].qita);
                  $('#txtbzgzup').val(data[0].benzhou_zhongdian);
                  $('#txtxzapup').val(data[0].xiahzou_jihua);
              }

          }

          //取消修改
    function er_cancel() {
        $('.Is_HS').show(500);
        $('.Is_HS_Up').hide(500);
    }
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
    function f_OpenDlg(id) {
        layer.open({
            type: 2,
            title: '',
            skin: '工作详情',
            closeBtn: 1, //不显示关闭按钮
            shade: [0],
            area: ['65%', '92%'],
            anim: 2,
            content: "wd_workinfo.aspx?curt_id=" + id ,
        });
    }
</script>
