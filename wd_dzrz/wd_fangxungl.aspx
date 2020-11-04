<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_fangxungl.aspx.cs" Inherits="MarketInfo.wd_dzrz.wd_fangxungl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>防汛管理</title>
    <meta name="description" content="Draggabble Widget Boxes with Persistent Position and State" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <!-- bootstrap & fontawesome -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css" />

    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="assets/css/jquery-ui.custom.min.css" />

    <!-- text fonts -->
    <link rel="stylesheet" href="assets/css/fonts.googleapis.com.css" />

    <!-- ace styles -->
    <link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

    <!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
    <link rel="stylesheet" href="assets/css/ace-skins.min.css" />
    <link rel="stylesheet" href="../lib/assets/css/ace-rtl.min.css" />
    <link href="../css/mui.min.css" rel="stylesheet" type="text/css" />
    <script src="assets/js/ace-extra.min.js" type="text/javascript"></script>
</head>
<body class="no-skin">
    <div class="main-container ace-save-state" id="main-container">
        <script type="text/javascript">
            try { ace.settings.loadState('main-container') } catch (e) { }
        </script>
        <div class="main-content">
            <div class="main-content-inner">

                <div class="page-content">
                    <a class="btn btn-info btn-sm tooltip-info" data-rel="tooltip" data-placement="bottom" title="" data-original-title="Bottm Info" href="wd_ywsb.aspx">返回</a>

                    <a class="btn btn-info btn-sm tooltip-info" data-rel="tooltip" data-placement="bottom" href="wd_fangxungl_his.aspx"><i class="ace-icon fa fa-leaf icon-only"></i>&nbsp;历史记录</a>

                    <div class="row">
                        <div class="col-xs-12">
                            <!-- PAGE CONTENT BEGINS -->
                            <div class="invisible" id="main-widget-container">

                                <div class="row">
                                    <form id="Form1" runat="server">
                                        <input type="hidden" id="HideID" value="" />
                                        <div class="col-xs-12 col-sm-4 _UP" style="display: none;">
                                            <div class="widget-box">
                                                <div class="widget-header">
                                                    <h4 class="widget-title">
                                                        <span class="updateSpan ">修改</span>
                                                    </h4>

                                                    <span class="widget-toolbar">
                                                        <a href="#" onclick="Close()">
                                                            <i class="ace-icon fa fa-times"></i>
                                                        </a>
                                                    </span>
                                                </div>

                                                <div class="widget-body">
                                                    <div class="widget-main">
                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">站场
                                                                </span>
                                                                <input class="form-control input-mask-phone" type="text" id="Text1" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;
														<div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">行政位置
                                                                </span>

                                                                <input class="form-control input-mask-phone" type="text" id="Text2" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;
														<div>
                                                            <label for="form-field-mask-2">
                                                                防汛重点部位名称
                                                            </label>
                                                            <div>
                                                                <input class="form-control input-mask-phone" type="text" id="Text3" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">类型
                                                                </span>

                                                                <input class="form-control input-mask-phone" type="text" id="Text4" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;
														<div>
                                                            <label for="form-field-mask-2">
                                                                本周巡线工是否每天巡检
																<small class="text-warning">不是巡线工则填无</small>
                                                            </label>
                                                            <div>
                                                                <input class="form-control input-mask-phone" type="text" id="Text5" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <label for="form-field-mask-2">
                                                                巡线工巡检结果
																<small class="text-warning">不是巡线工则填无</small>
                                                            </label>
                                                            <div>

                                                                <input class="form-control input-mask-phone" type="text" id="Text6" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>

                                                        <div>
                                                            <label for="form-field-mask-2">
                                                                本周巡线管理人员巡检登记
																<small class="text-warning">不是管理员则填无</small>
                                                            </label>
                                                            <div>

                                                                <input class="form-control input-mask-phone" type="text" id="Text7" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>

                                                        <div>
                                                            <label for="form-field-mask-2">
                                                                巡线管理人员巡检结果
																<small class="text-warning">不是管理员则填无</small>
                                                            </label>
                                                            <div>
                                                                <input type="text" id="Text8" class="form-control input-mask-phone" runat="server" placeholder="请输入" />
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <label for="form-field-mask-2">
                                                                巡线工未完成每日巡检/发现异常情况详细说明
																<small class="text-warning">没有则填无</small>
                                                            </label>
                                                            <div>
                                                                <textarea class="form-control limited" maxlength="50" placeholder="若没有请输入无" runat="server" id="Textarea1"></textarea>
                                                            </div>

                                                        </div>

                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">治早治小
                                                                </span>
                                                                <input class="form-control input-mask-phone" type="text" id="Text9" placeholder="若没有请输入无" runat="server" />


                                                            </div>
                                                        </div>
                                                        &nbsp;
                                                         <div>
                                                             <div class="input-group">
                                                                 <span class="input-group-addon">设施维护
                                                                 </span>
                                                                 <input class="form-control input-mask-phone" type="text" id="Text10" placeholder="若没有请输入无" runat="server" />
                                                             </div>
                                                         </div>
                                                        &nbsp;
                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">其他
                                                                </span>
                                                                <input class="form-control input-mask-phone" type="text" id="Text11" placeholder="若没有请输入无" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;
                                                        <div class="updateBtn">


                                                            <button class="btn btn-info" type="button" onclick="f_update('1');">
                                                                <i class="ace-icon fa fa-check bigger-110"></i>
                                                                提交
                                                            </button>
                                                            &nbsp;
															<button class="btn btn-info" type="button" onclick="f_update('0');">
                                                                <i class="ace-icon fa fa-undo bigger-110"></i>
                                                                暂存
                                                            </button>

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>



                                        <div class="_AD">

                                            <div class="col-xs-12 col-sm-4">
                                                <div class="widget-box">
                                                    <div class="widget-header">
                                                        <h4 class="widget-title">工作填报</h4>

                                                        <span class="widget-toolbar">
                                                           <a href="#" data-action="collapse"><i class="ace-icon fa fa-chevron-up"></i></a>
                                                        </span>
                                                    </div>

                                                    <div class="widget-body">
                                                        <div class="widget-main">
                                                            <div>
                                                                <div class="input-group">
                                                                    <span class="input-group-addon">站场
                                                                    </span>
                                                                    <input class="form-control input-mask-phone" type="text" id="fzhanchang" placeholder="请输入" runat="server" />
                                                                </div>
                                                            </div>
                                                            &nbsp;
														<div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">行政位置
                                                                </span>

                                                                <input class="form-control input-mask-phone" type="text" id="fweizhi" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>
                                                            &nbsp;
														<div>
                                                            <label for="form-field-mask-2">
                                                                防汛重点部位名称
                                                            </label>
                                                            <div>
                                                                <input class="form-control input-mask-phone" type="text" id="fbuwei" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>
                                                            <div>
                                                                <div class="input-group">
                                                                    <span class="input-group-addon">类型
                                                                    </span>

                                                                    <input class="form-control input-mask-phone" type="text" id="fleixing" placeholder="请输入" runat="server" />
                                                                </div>
                                                            </div>
                                                            &nbsp;
														<div>
                                                            <label for="form-field-mask-2">
                                                                本周巡线工是否每天巡检
																<small class="text-warning">不是巡线工则填无</small>
                                                            </label>
                                                            <div>
                                                                <input class="form-control input-mask-phone" type="text" id="fsfxunxian" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>
                                                            <div>
                                                                <label for="form-field-mask-2">
                                                                    巡线工巡检结果
																<small class="text-warning">不是巡线工则填无</small>
                                                                </label>
                                                                <div>

                                                                    <input class="form-control input-mask-phone" type="text" id="fxunxianjg" placeholder="请输入" runat="server" />
                                                                </div>
                                                            </div>

                                                            <div>
                                                                <label for="form-field-mask-2">
                                                                    本周巡线管理人员巡检登记
																<small class="text-warning">不是管理员则填无</small>
                                                                </label>
                                                                <div>

                                                                    <input class="form-control input-mask-phone" type="text" id="fbenzhou" placeholder="请输入" runat="server" />
                                                                </div>
                                                            </div>

                                                            <div>
                                                                <label for="form-field-mask-2">
                                                                    巡线管理人员巡检结果
																<small class="text-warning">不是管理员则填无</small>
                                                                </label>
                                                                <div>
                                                                    <input type="text" id="fglyjieguo" class="form-control input-mask-phone" runat="server" placeholder="请输入" />
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <label for="form-field-mask-2">
                                                                    巡线工未完成每日巡检/发现异常情况详细说明
																<small class="text-warning">没有则填无</small>
                                                                </label>
                                                                <div>
                                                                    <textarea class="form-control limited" maxlength="50" placeholder="若没有请输入无" runat="server" id="fshuoming"></textarea>
                                                                </div>

                                                            </div>

                                                            <div>
                                                                <div class="input-group">
                                                                    <span class="input-group-addon">治早治小
                                                                    </span>
                                                                    <input class="form-control input-mask-phone" type="text" id="fzhizao" placeholder="若没有请输入无" runat="server" />


                                                                </div>
                                                            </div>
                                                            &nbsp;
                                                         <div>
                                                             <div class="input-group">
                                                                 <span class="input-group-addon">设施维护
                                                                 </span>
                                                                 <input class="form-control input-mask-phone" type="text" id="fweihu" placeholder="若没有请输入无" runat="server" />
                                                             </div>
                                                         </div>
                                                            &nbsp;
                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">其他
                                                                </span>
                                                                <input class="form-control input-mask-phone" type="text" id="fqt" placeholder="若没有请输入无" runat="server" />
                                                            </div>
                                                        </div>
                                                            &nbsp;
                                                        <div>


                                                            <button class="btn btn-info" type="button" onclick="f_fsubmint('1');">
                                                                <i class="ace-icon fa fa-check bigger-110"></i>
                                                                提交
                                                            </button>
                                                            &nbsp;
															<button class="btn btn-info" type="button" onclick="f_fsubmint('0');">
                                                                <i class="ace-icon fa fa-undo bigger-110"></i>
                                                                暂存
                                                            </button>

                                                        </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                              <div class="col-xs-12 col-sm-6 widget-container-col" id="Div1">
                                                <div class="widget-box widget-color-blue" id="Div2">
                                                    <div class="widget-header">
                                                        <h5 class="widget-title bigger lighter">
                                                            <span style="color: #FFFFFF; font-weight: bolder;"><i class="ace-icon fa fa-table"></i>
                                                                暂存列表</span>
                                                        </h5>
                                                    </div>

                                                    <div class="widget-body">
                                                        <div class="widget-main no-padding">
                                                            <table class="table table-striped table-bordered table-hover">
                                                                <thead class="thin-border-bottom">
                                                                    <tr>
                                                                        <th width="50" class="input-group-addon">序号
                                                                        </th>
                                                                        <th class="input-group-addon">
                                                                            <i class="ace-icon fa fa-flag"></i>
                                                                            站场
                                                                        </th>

                                                                        <th class="input-group-addon">防汛重点部位
                                                                        </th>

                                                                        <th class="input-group-addon">行政区域</th>
                                                                        <th class="input-group-addon">操作</th>
                                                                    </tr>
                                                                </thead>

                                                                <tbody>
                                                                    <%if (tbzc != null)
                                                                        {
                                                                            for (int i = 0; i < tbzc.Rows.Count; i++)
                                                                            {

                                                                    %>
                                                                    <tr>
                                                                        <td width="50" class="input-group-addon">
                                                                            <% if (tbzc.Rows[i]["sp1"].ToString() == "-1" || tbzc.Rows[i]["sp2"].ToString() == "-1" || tbzc.Rows[i]["sp3"].ToString() == "-1")
                                                                                {  %>
                                                                            <i class="ace-icon fa fa-exclamation-triangle bigger-121" style="color: #D15B47;" title="审批未通过/被退回/修改后请重新提交" onclick="f_OpenDlg('<%=tbzc.Rows[i]["fx_id"]%>')"></i>
                                                                            <% } %>
                                                                            <%=i+1%></td>
                                                                        <td class="input-group-addon"><%=tbzc.Rows[i]["fx_zhanchang"]%></td>

                                                                        <td class="input-group-addon">
                                                                            <a href="#"><%=tbzc.Rows[i]["fx_zhongdianbuwei"]%></a>
                                                                        </td>

                                                                        <td class="input-group-addon">
                                                                            <span class="label label-success arrowed-in arrowed-in-right"><%=tbzc.Rows[i]["fx_xingzhengweizhi"]%></span>
                                                                        </td>
                                                                        <td class="input-group-addon">
                                                                          <a href="javascript:;" title="提交" onclick="f_post('<%=tbzc.Rows[i]["fx_zhanchang"]%>','<%=tbzc.Rows[i]["fx_id"]%>');"><i class="ace-icon glyphicon glyphicon-upload"></i></a>&nbsp;&nbsp;
                                                                    <a href="javascript:;" title="修改" onclick="f_edit(<%=tbzc.Rows[i]["fx_id"]%>);"><i class="ace-icon fa fa-pencil-square-o"></i></a>&nbsp;&nbsp;
                                                                    <a href="javascript:;" title="删除"  onclick="er_del('<%=tbzc.Rows[i]["fx_id"]%>')"><i class="ace-icon fa fa-times"></i></a>
                                                                    </td>
                                                                        <%}
                                                                            } %>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 widget-container-col" id="widget-container-col-2">
                                                <div class="widget-box widget-color-blue" id="widget-box-2">
                                                    <div class="widget-header">
                                                        <h5 class="widget-title bigger lighter">
                                                            <span style="color: #FFFFFF; font-weight: bolder;"><i class="ace-icon fa fa-table"></i>
                                                                提交列表</span>
                                                        </h5>
                                                    </div>

                                                    <div class="widget-body">
                                                        <div class="widget-main no-padding">
                                                            <table class="table table-striped table-bordered table-hover">
                                                                <thead class="thin-border-bottom">
                                                                    <tr>
                                                                        <th width="50" class="input-group-addon">序号</th>
                                                                        <th class="input-group-addon">
                                                                            <%--	<i class="ace-icon fa fa-user"></i>--%>
                                                                            <i class="ace-icon fa fa-flag"></i>
                                                                            站场
                                                                        </th>

                                                                        <th class="input-group-addon">防汛重点部位
                                                                        </th>

                                                                        <th class="input-group-addon">行政区域</th>
                                                                        <%-- <th class="hidden-480">操作</th>--%>
                                                                        <th class="input-group-addon">详情</th>
                                                                    </tr>
                                                                </thead>

                                                                <tbody>
                                                                    <%if (tb != null)
                                                                        {
                                                                            for (int i = 0; i < tb.Rows.Count; i++)
                                                                            {

                                                                    %>
                                                                    <tr>
                                                                        <td class="input-group-addon" style="position: relative;">
                                                                            <%--<% if (tb.Rows[i]["sp1"].ToString() == "-1" || tb.Rows[i]["sp2"].ToString() == "-1" || tb.Rows[i]["sp3"].ToString() == "-1")
                                                                            {  %>
                                                                        <i class="ace-icon fa fa-exclamation-triangle bigger-121" style="cursor: pointer; position: absolute; left: 15px; top: 11px; color: #D15B47;" title="审批未通过/被退回/修改后请重新提交"></i>
                                                                        <% } %>--%>

                                                                            <% if (tb.Rows[i]["sp1"].ToString() == "-1" || tb.Rows[i]["sp2"].ToString() == "-1" || tb.Rows[i]["sp3"].ToString() == "-1")
                                                                                {  %>
                                                                            <i class="ace-icon fa fa-exclamation-triangle bigger-121" style="color: #D15B47;" title="审批未通过/被退回/修改后请重新提交" onclick="f_OpenDlg('<%=tb.Rows[i]["fx_id"]%>')"></i>
                                                                            <% } %>
                                                                            <% if (tb.Rows[i]["sp1"].ToString() == "1" || tb.Rows[i]["sp2"].ToString() == "1" || tb.Rows[i]["sp3"].ToString() == "-1")
                                                                                {  %>
                                                                            <i class="ace-icon fa fa-exclamation-triangle bigger-121" style="color: #99FF99;" title="审批通过" onclick="f_OpenDlg('<%=tb.Rows[i]["fx_id"]%>')"></i>
                                                                            <% } %>
                                                                            <%=i+1%>
                                                                        </td>
                                                                        <td class="input-group-addon"><%=tb.Rows[i]["fx_zhanchang"]%></td>



                                                                        <td class="input-group-addon">
                                                                            <%=tb.Rows[i]["fx_zhongdianbuwei"]%>
                                                                        </td>
                                                                        <td class="input-group-addon">
                                                                          <span class="label label-success arrowed-in arrowed-in-right"><%=tb.Rows[i]["fx_xingzhengweizhi"]%></span>
                                                                        </td>
                                                                        <td class="input-group-addon">
                                                                            <a href="#" onclick="f_edit(2,<%=tb.Rows[i]["fx_id"]%>);">详情</a>
                                                                        </td>
                                                                        <%--  <td>
																		<span onclick="f_edit(<%=tb.Rows[i]["fx_id"]%>);"><i class="ace-icon fa fa-pencil-square-o"></i></span>
																	</td>--%>
                                                                        <%}
                                                                            } %>
                                                                    </tr>


                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                          
                                        </div>
                                    </form>

                                </div>
                                <!-- /.row -->

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div>
    <script src="assets/js/jquery-2.1.4.min.js"></script>

    <script type="text/javascript">
        if ('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
    </script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!-- page specific plugin scripts -->
    <script src="assets/js/jquery-ui.custom.min.js" type="text/javascript"></script>
    <script src="assets/js/jquery.ui.touch-punch.min.js"></script>

    <!-- ace scripts -->
    <script src="assets/js/ace-elements.min.js"></script>
    <script src="assets/js/ace.min.js"></script>

    <script src="js/mui.enterfocus.js" type="text/javascript"></script>
    <script src="js/mui.min.js" type="text/javascript"></script>

    <!-- inline scripts related to this page -->
    <script src="../lib/assets/layer/layer.js" type="text/javascript"></script>
    <script type="text/javascript">
        function f_OpenDlg(id) {
            layer.open({
                type: 2,
                title: '',
                skin: 'layui-layer-lan',
                closeBtn: 1, //不显示关闭按钮
                shade: [0],
                area: ['35%', '60%'],
                anim: 2,
                content: "wd_reasonfangxun.aspx?id=" + id,
            });
        }
    </script>
    <script type="text/javascript" charset="utf-8">
        //lay('#version').html('-v' + laydate.v);

        ////执行一个laydate实例
        //laydate.render({
        //    elem: '#startlx', //指定元素
        //    format: 'yyyy-MM-dd',
        //    trigger: 'click'

        //});

        //laydate.render({
        //    elem: '#endlx', //指定元素
        //    format: 'yyyy-MM-dd',
        //    trigger: 'click'
        //});
        //laydate.render({
        //    elem: '#startqj', //指定元素
        //    format: 'yyyy-MM-dd',
        //    trigger: 'click'
        //});
        //laydate.render({
        //    elem: '#endqj', //指定元素
        //    format: 'yyyy-MM-dd',
        //    trigger: 'click'
        //});
        //laydate.render({
        //    elem: '#startxx', //指定元素
        //    format: 'yyyy-MM-dd',
        //    trigger: 'click'
        //});
        //laydate.render({
        //    elem: '#endxx', //指定元素
        //    format: 'yyyy-MM-dd',
        //    trigger: 'click'
        //});
        //laydate.render({
        //    elem: '#startcg', //指定元素
        //    format: 'yyyy-MM-dd',
        //    trigger: 'click'
        //});
        //laydate.render({
        //    elem: '#endcg', //指定元素
        //    format: 'yyyy-MM-dd',
        //    trigger: 'click'
        //});

        //删除暂存列表中没有经过审批的数据
        function er_del(id) {
            mui.confirm('是否确认删除？', '删除', function (e) {
                if (e.index == 1) {
                    $.post("../../it/fangxungldel.ashx", { id: id }, function (data) {
                        if (data == "0") {
                            mui.toast("删除成功!");
                            location.reload();
                        } else {
                            mui.toast(data);
                        }
                    })

                } else {
                    mui.toast('已取消');
                }
            })
        }
        //防汛
        function f_fsubmint(type) {
            // mui.toast(type);
            var strzhan = $("#fzhanchang").val();
            if (strzhan == "") {
                mui.toast("请填写站场!");
                return;
            }
            var strweizhi = $("#fweizhi").val();
            if (strweizhi == "") {
                mui.toast("请填写行政位置!");
                return;
            }

            var strbuwei = $("#fbuwei").val();
            if (strbuwei == "") {
                mui.toast("请填写防汛重点部位名称!");
                return;
            }

            var strleixing = $("#fleixing").val();
            if (strleixing == "") {
                mui.toast("请填写防汛类型!");
                return;
            }

            var strsfxunxian = $("#fsfxunxian").val();
            if (strsfxunxian == "") {
                mui.toast("请填写本周巡线工是否每天巡检!是？否？");
                return;
            }

            var strxunxianjg = $("#fxunxianjg").val();
            if (strleixing == "") {
                mui.toast("请填写巡线工巡线结果!");
                return;
            }

            var strglydengji = $("#fbenzhou").val();
            if (strglydengji == "") {
                mui.toast("本周巡线管理人员请填写巡检登记，若不是管理人员请填写无!");
                return;
            }

            var strglyjieguo = $("#fglyjieguo").val();
            if (strglyjieguo == "") {
                mui.toast("巡线管理人员请填写巡检结果，若不是管理人员请填写无!");
                return;
            }


            var strshuoming = $("#fshuoming").val();
            if (strshuoming == "") {
                mui.toast("巡线管理人员请填写发现异常情况详细说明，若不是管理人员请填写无!");
                return;
            }

            var strzzzx = $("#fzhizao").val();
            if (strzzzx == "") {
                mui.toast("请填写治早治小信息!");
                return;
            }

            var strweihu = $("#fweihu").val();
            if (strweihu == "") {
                mui.toast("请填写设施维护信息!");
                return;
            }
            var strqt = $("#fqt").val();
            //              if (strweihu == "") {
            //                  mui.toast("请填写设施维护信息!");
            //                  return;
            //              }
            $.post("../it/it_submint.aspx?CMD=CURTFXGL&FLAG=" + type + "&FZC=" +
                strzhan + "&FXZWZ=" + strweizhi + "&FZDBW=" + strbuwei + "&FLX=" +
                strleixing + "&FBZSF=" + strsfxunxian + "&FJG=" + strxunxianjg + "&FDJ=" +
                strglydengji + "&FGLJG=" + strglyjieguo + "&FSM=" + strshuoming + "&FSS=" + strweihu + "&FQT=" + strqt + "&FZZZX=" + strzzzx, {}, function (data) {
                    // alert(data);<a href="../it/it_submint.aspx">../it/it_submint.aspx</a>
                    if (data == "1") {
                        mui.toast("操作成功!");
                        location.reload();
                        //f_LoginDesk();
                    }
                    if (data == "111") {
                        mui.toast("修改成功!");
                        location.reload();
                        //f_LoginDesk();
                    }
                    if (data == "11") {
                        mui.toast("暂存成功!");
                        //f_LoginDesk();
                    }
                    if (data == "-1") {
                        mui.toast("操作失败，退出重试!");
                        //f_LoginDesk();
                    }
                    if (data == "-11") {
                        mui.toast("暂存操作失败，退出重试!");
                        //f_LoginDesk();

                    } if (data == "0") {
                        mui.toast("已提交,不能修改!");
                    }
                });

        }
        function f_post(strbh, gid) {
            var btnArray = ['否', '是'];
            mui.confirm('提交之后不得修改，确认？', '', btnArray, function (e) {
                if (e.index == 1) {
                    f_set(gid);
                    //info.innerText = '你刚确认MUI是个好框架';
                } else {
                    //info.innerText = 'MUI没有得到你的认可，继续加油'
                }
            })
        }
        function f_set(gid) {
            var url = "../it/it_submint.aspx?CMD=FXGLPOST&CURTID=" + gid;
            $.post(url, {}, function (data) {
                if (data == "1") {
                    mui.toast("提交成功!");
                    setTimeout(function () {
                        location.reload();
                    }, 500)

                }
                if (data == "-1") {
                    mui.toast("提交失败，退出重试!");

                } if (data == "0") {
                    mui.toast("已提交，请勿重复操作!");
                }
            });
        }
        function f_edit(type, fxid) {
            ///location.href = "wd_fangxungl.aspx?EDIT_ID=" + fxid;
            $('._UP').show(500);
            $('._AD').hide(500); if (type == 1) {
                $('.updateSpan').text("修改")
                $('.updateBtn').show(500);
            }
            else {
                $('.updateSpan').text("详情")
                $('.updateBtn').hide(500);
            }
            $.post('ashx/selfx.ashx', { id: fxid }, function (data) {
                if (data != '-1') {
                    $('#HideID').val(data[0].fx_id);
                    $('#Text1').val(data[0].fx_zhanchang);
                    $('#Text2').val(data[0].fx_xingzhengweizhi);
                    $('#Text3').val(data[0].fx_zhongdianbuwei);
                    $('#Text4').val(data[0].fx_leixing);
                    $('#Text5').val(data[0].fx_bzxxgsfmtxj);
                    $('#Text6').val(data[0].fx_xxgxxjg);
                    $('#Text7').val(data[0].fx_bzxxglryxxdj);
                    $('#Text8').val(data[0].fx_xxglryxxjg);
                    $('#Textarea1').val(data[0].fx_qkxxsm);
                    $('#Text9').val(data[0].fx_zzzx);
                    $('#Text10').val(data[0].fx_sswh);
                    $('#Text11').val(data[0].fx_qtbz);
                } else {
                    mui.toast('读取数据失败！请退出重试');
                }
            })
        }
        function Close() {
            $('._AD').show(500);
            $('._UP').hide(500);
        }
        function f_update(fg) {
            var hideid = $('#HideID').val();
            var txt1 = $('#Text1').val();
            var txt2 = $('#Text2').val();
            var txt3 = $('#Text3').val();
            var txt4 = $('#Text4').val();
            var txt5 = $('#Text5').val();
            var txt6 = $('#Text6').val();
            var txt7 = $('#Text7').val();
            var txt8 = $('#Text8').val();
            var txta1 = $('#Textarea1').val();
            var txt9 = $('#Text9').val();
            var txt10 = $('#Text10').val();
            var txt11 = $('#Text11').val();
            $.post('ashx/upfx.ashx', { id: hideid, fg: fg, txt1: txt1, txt2: txt2, txt3: txt3, txt4: txt4, txt5: txt5, txt6: txt6, txt7: txt7, txt8: txt8, txt9: txt9, txt10: txt10, txt11: txt11, txta1: txta1 }, function (data) {
                if (data == 0) {
                    mui.toast('修改成功');
                } else {
                    mui.toast(data);
                }
                location.reload();
            })
        }
    </script>
    <script type="text/javascript">
        jQuery(function ($) {

            $('#simple-colorpicker-1').ace_colorpicker({ pull_right: true }).on('change', function () {
                var color_class = $(this).find('option:selected').data('class');
                var new_class = 'widget-box';
                if (color_class != 'default') new_class += ' widget-color-' + color_class;
                $(this).closest('.widget-box').attr('class', new_class);
            });


            // scrollables
            $('.scrollable').each(function () {
                var $this = $(this);
                $(this).ace_scroll({
                    size: $this.attr('data-size') || 100,
                    //styleClass: 'scroll-left scroll-margin scroll-thin scroll-dark scroll-light no-track scroll-visible'
                });
            });
            $('.scrollable-horizontal').each(function () {
                var $this = $(this);
                $(this).ace_scroll(
                    {
                        horizontal: true,
                        styleClass: 'scroll-top',//show the scrollbars on top(default is bottom)
                        size: $this.attr('data-size') || 500,
                        mouseWheelLock: true
                    }
                ).css({ 'padding-top': 12 });
            });

            $(window).on('resize.scroll_reset', function () {
                $('.scrollable-horizontal').ace_scroll('reset');
            });


            $('#id-checkbox-vertical').prop('checked', false).on('click', function () {
                $('#widget-toolbox-1').toggleClass('toolbox-vertical')
                    .find('.btn-group').toggleClass('btn-group-vertical')
                    .filter(':first').toggleClass('hidden')
                    .parent().toggleClass('btn-toolbar')
            });
            // widget boxes
            // widget box drag & drop example
            $('.widget-container-col').sortable({
                connectWith: '.widget-container-col',
                items: '> .widget-box',
                handle: ace.vars['touch'] ? '.widget-title' : false,
                cancel: '.fullscreen',
                opacity: 0.8,
                revert: true,
                forceHelperSize: true,
                placeholder: 'widget-placeholder',
                forcePlaceholderSize: true,
                tolerance: 'pointer',
                start: function (event, ui) {
                    //when an element is moved, it's parent becomes empty with almost zero height.
                    //we set a min-height for it to be large enough so that later we can easily drop elements back onto it
                    ui.item.parent().css({ 'min-height': ui.item.height() })
                    //ui.sender.css({'min-height':ui.item.height() , 'background-color' : '#F5F5F5'})
                },
                update: function (event, ui) {
                    ui.item.parent({ 'min-height': '' })
                    //p.style.removeProperty('background-color');


                    //save widget positions
                    var widget_order = {}
                    $('.widget-container-col').each(function () {
                        var container_id = $(this).attr('id');
                        widget_order[container_id] = []


                        $(this).find('> .widget-box').each(function () {
                            var widget_id = $(this).attr('id');
                            widget_order[container_id].push(widget_id);
                            //now we know each container contains which widgets
                        });
                    });

                    ace.data.set('demo', 'widget-order', widget_order, null, true);
                }
            });
            (function () {
                //restore widget order
                var container_list = ace.data.get('demo', 'widget-order', true);
                if (container_list) {
                    for (var container_id in container_list) if (container_list.hasOwnProperty(container_id)) {

                        var widgets_inside_container = container_list[container_id];
                        if (widgets_inside_container.length == 0) continue;

                        for (var i = 0; i < widgets_inside_container.length; i++) {
                            var widget = widgets_inside_container[i];
                            $('#' + widget).appendTo('#' + container_id);
                        }

                    }
                }


                //restore widget state
                var widgets = ace.data.get('demo', 'widget-state', true);
                if (widgets != null) {
                    for (var id in widgets) if (widgets.hasOwnProperty(id)) {
                        var state = widgets[id];
                        var widget = $('#' + id);
                        if
                        (
                            (state == 'shown' && widget.hasClass('collapsed'))
                            ||
                            (state == 'hidden' && !widget.hasClass('collapsed'))
                        ) {
                            widget.widget_box('toggleFast');
                        }
                        else if (state == 'closed') {
                            widget.widget_box('closeFast');
                        }
                    }
                }


                $('#main-widget-container').removeClass('invisible');


                //reset saved positions and states
                $('#reset-widgets').on('click', function () {
                    ace.data.remove('demo', 'widget-state');
                    ace.data.remove('demo', 'widget-order');
                    document.location.reload();
                });
            })();
        });
    </script>
</body>
</html>
