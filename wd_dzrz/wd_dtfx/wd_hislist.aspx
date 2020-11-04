<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_hislist.aspx.cs" Inherits="MarketInfo.wd_dzrz.wd_dtfx.wd_hislist" %>

<!DOCTYPE html>

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
										开挖类作业历史记录
										</div>

										<!-- div.table-responsive -->

										<!-- div.dataTables_borderWrap -->
										<div>
     <div class="article_sort_list Is_HS">
         <table class="table table-striped table-bordered table-hover" id="sample-table">
      <thead>
													<tr>
														<th class="center">
															<label class="pos-rel">																
																<span class="lbl">序号</span>
															</label>
														</th>
                                                         <th class="hidden-480">单位</th>
                                                        <th class="hidden-480">姓名</th>
                                                        <th>施工类型</th>
                                                        <th>工程名称</th>
														<th class="hidden-480">行政区域</th>
                                                        <th class="hidden-480">桩号</th>
														<th class="hidden-480">方案</th>
														
                                                        
                                                        <th>
															管道光缆情况
														</th>
														<th class="hidden-480">工程情况与管理位置关系</th>
														<th class="hidden-480">当日施工内容</th>
														<th class="hidden-480">次日施工内容</th>

														<th>现场监护人</th>
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
                                                         <td class="hidden-480">
															 <%=dt_1.Rows[i]["zname"]%>
														</td>
                                                         <td class="hidden-480">
															 <%=dt_1.Rows[i]["T_NAME"]%>
														</td>
                                                       
                                                        <td>
															 <%=dt_1.Rows[i]["fx_type"]%>
														</td>
														<td>
															 <a title="点击查看详情" onclick="fx_update('<%=dt_1.Rows[i]["id"]%>')"><%=dt_1.Rows[i]["fx_gcm"]%></a>
														</td>														
														<td class="hidden-480">   <%=dt_1.Rows[i]["fx_xzzh"]%></td>
														<td class="hidden-480"> <%=dt_1.Rows[i]["fx_zh"]%></td>
                                                        <td class="hidden-480"><a onclick="f_OpenDlg('<%=dt_1.Rows[i]["id"]%>')"> <%=dt_1.Rows[i]["file_title"]%></a></td>
														<td class="hidden-480">
															<%=dt_1.Rows[i]["fx_gdgl"]%>
														</td>
														<td>
															<%=dt_1.Rows[i]["fx_gcqk_and_gdgx"]%>
														</td>
                                                        <td class="hidden-480"><%=dt_1.Rows[i]["fx_jrsg"]%></td>
                                                        <td class="hidden-480"><%=dt_1.Rows[i]["fx_mrjh"]%></td>
                                                        <td ><a onclick="f_OpenDlgimg('<%=dt_1.Rows[i]["id"]%>')"><%=dt_1.Rows[i]["fx_name"]%></a></td>
                                                        <td class="hidden-480"><%=dt_1.Rows[i]["setTime"]%></td>
                                                        <td class="hidden-480"><%=dt_1.Rows[i]["fx_remark"]%></td>
													</tr>
                                                      <% }
                                                               }%>
        </tbody>
        </table>
     </div>
                                             </div>
 </div>
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


</div>
     </div>
 </div>
</form>
</body>
</html>
  <script type="text/javascript">
  //查看
      function fx_update(id) {

       layer.open({
            type: 2,
            title: '',
            skin: 'layui-layer-lan',
            closeBtn: 1, //不显示关闭按钮
            shade: [0],
            area: ['92%', '92%'],
            anim: 2,
            content: "wd_info.aspx?file_id=" + id ,
        });
//        $('.Is_HS').hide(500);<a href="wd_info.aspx">wd_info.aspx</a>
//        $('.Is_HS_Up').show(500);
//        $('#hide_id').val(id);
//        $.post("../../it/FengXianData.ashx", { id: id }, function (data) {
//            JSons(data);
//        });
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
    function er_cancel() {
        $('.Is_HS').show(500);
        $('.Is_HS_Up').hide(500);
    }
  </script>
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

