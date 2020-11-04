<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_spjk.aspx.cs" Inherits="MarketInfo.wd_dzrz.wd_spjk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>视频监控</title>
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
    <link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet"
        id="main-ace-style" />
    <!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
    <link rel="stylesheet" href="assets/css/ace-skins.min.css" />
    <link rel="stylesheet" href="../lib/assets/css/ace-rtl.min.css" />
    <link href="../css/mui.min.css" rel="stylesheet" type="text/css" />
    <script src="assets/js/ace-extra.min.js"></script>
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
                        <h3 class="header smaller lighter blue">
                            <a class="btn btn-info" href="wd_ywsb.aspx"><i class="ace-icon fa fa-reply icon-only"></i>&nbsp;返回</a>
                            <a class="btn btn-info" href="Hislist/spjk.aspx">&nbsp;历史记录</a>
                        </h3>
                        <div class="col-xs-12">
                            <!-- PAGE CONTENT BEGINS -->
                            <div class="invisible" id="main-widget-container">
                                <div class="row">
                                    <form id="Form2" runat="server">
                                        <div class="col-xs-12 col-sm-4 Is_HS">
                                            <div class="widget-box">
                                                <div class="widget-header">
                                                    <h4 class="widget-title">工作填报</h4>
                                                    <span class="widget-toolbar"><a href="#" data-action="close"><i class="ace-icon fa fa-times"></i></a></span>
                                                </div>
                                                <div class="widget-body">
                                                    <div class="widget-main">
                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">站名 </span>
                                                                <input class="form-control input-mask-phone" type="text" id="zhanming" readonly="readonly" placeholder="请输入"
                                                                    runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">安装位置 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="anzhuangweizhi" placeholder="请输入"
                                                                runat="server" />
                                                        </div>
                                                    </div>
                                                        &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">项目工程全称 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="xmgcqc" placeholder="请输入"
                                                                runat="server" />
                                                        </div>
                                                    </div>
                                                        &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">是否正常使用 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="sfzcsy" placeholder="请输入"
                                                                runat="server" />
                                                        </div>
                                                    </div>
                                                        &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">uid码 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="uid" placeholder="请输入"
                                                                runat="server" />
                                                        </div>
                                                    </div>
                                                        &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">配置单位 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="pzdw" placeholder="请输入"
                                                                runat="server" />
                                                        </div>
                                                    </div>
                                                        &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">维护情况 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="whqk" placeholder="请输入"
                                                                runat="server" />
                                                        </div>
                                                    </div>
                                                        &nbsp; 
                                                      <div>
                                                          <div class="input-group">
                                                              <span class="input-group-addon">备注 </span>

                                                              <textarea class="form-control input-mask-phone" id="beizhu" rows="3" cols="20" runat="server">  
                                                                              </textarea>
                                                          </div>
                                                      </div>
                                                        &nbsp;
                                                    <div>
                                                        <li>
                                                            <button class="btn btn-info" type="button" onclick="s_submint('1','0');">
                                                                <i class="ace-icon fa fa-check bigger-110"></i>提交
                                                            </button>
                                                            &nbsp;
                                                            <button class="btn " type="button" onclick="s_submint('0','0');">
                                                                <i class="ace-icon fa fa-undo bigger-110"></i>暂存
                                                            </button>
                                                        </li>
                                                    </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-4 Is_HS_Up" style="display: none;">
                                            <div class="widget-box">
                                                <div class="widget-header">
                                                    <h4 class="widget-title">信息修改</h4>
                                                    <input type="hidden" id="hide_id" value="" />
                                                    <input type="hidden" id="zm" value="" runat="server" />
                                                    <span class="widget-toolbar"><a href="#"><i class="ace-icon fa fa-times" onclick="er_cancel()"></i></a></span>
                                                </div>
                                                <div class="widget-body">
                                                    <div class="widget-main">
                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">站名 </span>
                                                                <input class="form-control input-mask-phone" type="text" id="tzm" readonly="readonly" placeholder="请输入"
                                                                    runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">安装位置 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="tanwz" placeholder="请输入"
                                                                runat="server" />
                                                        </div>
                                                    </div>
                                                        &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">项目工程全称 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="txmqc" placeholder="请输入"
                                                                runat="server" />
                                                        </div>
                                                    </div>
                                                        &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">是否正常使用 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="tsf" placeholder="请输入"
                                                                runat="server" />
                                                        </div>
                                                    </div>
                                                        &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">uid码 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="tuid" placeholder="请输入"
                                                                runat="server" />
                                                        </div>
                                                    </div>
                                                        &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">配置单位 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="tpzdw" placeholder="请输入"
                                                                runat="server" />
                                                        </div>
                                                    </div>
                                                        &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">维护情况 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="twhqk" placeholder="请输入"
                                                                runat="server" />
                                                        </div>
                                                    </div>
                                                        &nbsp; 
                                                      <div>
                                                          <div class="input-group">
                                                              <span class="input-group-addon">备注 </span>

                                                              <textarea class="form-control input-mask-phone" id="tbz" rows="3" cols="20" runat="server">  
                                                                              </textarea>
                                                          </div>
                                                      </div>
                                                        &nbsp;
                                                    <div>
                                                        <li>
                                                            <button class="btn btn-info" type="button" onclick="s_submintxg('1');">
                                                                <i class="ace-icon fa fa-check bigger-110"></i>提交
                                                            </button>
                                                            &nbsp;
                                                            <button class="btn " type="button" onclick="s_submintxg('0');">
                                                                <i class="ace-icon fa fa-undo bigger-110"></i>暂存
                                                            </button>
                                                        </li>
                                                    </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 widget-container-col Is_HS">
                                            <div class="widget-box widget-color-blue" id="widget-box-2">
                                                <div class="widget-header">
                                                    <h5 class="widget-title bigger lighter">
                                                        <span style="color: #FFFFFF; font-weight: bolder;"><i class="ace-icon fa fa-table"></i>
                                                            暂存列表</span>
                                                    </h5>
                                                </div>
                                                <div class="widget-body table-responsive">
                                                    <div class="widget-main no-padding">
                                                        <table class="table table-striped table-bordered table-hover">
                                                            <thead class="thin-border-bottom">
                                                                <tr>
                                                                    <th class="input-group-addon">序号
                                                                    </th>

                                                                    <th class="input-group-addon">安装位置
                                                                    </th>


                                                                    <th class="input-group-addon">是否正常使用
                                                                    </th>
                                                                    <th class="input-group-addon">uid码
                                                                    </th>


                                                                    <th class="input-group-addon">修改
                                                                    </th>
                                                                </tr>
                                                            </thead>
                                                            <%if (tbzc != null)
                                                                {
                                                                    for (int i = 0; i < tbzc.Rows.Count; i++)
                                                                    {

                                                            %>
                                                            <tr>
                                                                <td class="input-group-addon">
                                                                    <% if (tbzc.Rows[i]["sp1"].ToString() == "-1" || tbzc.Rows[i]["sp2"].ToString() == "-1" || tbzc.Rows[i]["sp3"].ToString() == "-1")
                                                                        {  %>
                                                                    <i class="ace-icon fa fa-exclamation-triangle bigger-121" style="color: #D15B47;" title="审批未通过/被退回/修改后请重新提交" onclick="f_OpenDlg('<%=tbzc.Rows[i]["s_id"]%>')"></i>
                                                                    <% } %>
                                                                    <%=i+1%>
                                                                </td>

                                                                <td class="input-group-addon">
                                                                    <%=tbzc.Rows[i]["s_anzhuangwz"]%>
                                                                </td>

                                                                <td class="input-group-addon">
                                                                    <%=tbzc.Rows[i]["s_shifouzc"]%>
                                                                </td>
                                                                <td class="input-group-addon">
                                                                    <%=tbzc.Rows[i]["s_uid"]%>
                                                                </td>

                                                                <td class="input-group-addon">
                                                                    <a href="javascript:;" title="提交" onclick="f_post('<%=tbzc.Rows[i]["s_id"]%>')"><i
                                                                        class="ace-icon glyphicon glyphicon-upload"></i></a>&nbsp;&nbsp;<a href="javascript:;" onclick="f_edit('<%=tbzc.Rows[i]["s_id"]%>')"
                                                                            title="修改"><i class="ace-icon fa fa-pencil-square-o"></i></a>
                                                                </td>
                                                            </tr>
                                                            <%}
                                                                } %>
                                                            <tbody>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 widget-container-col Is_HS">
                                            <div class="widget-box widget-color-blue" id="Div2">
                                                <div class="widget-header">
                                                    <h5 class="widget-title bigger lighter">
                                                        <span style="color: #FFFFFF; font-weight: bolder;"><i class="ace-icon fa fa-table"></i>
                                                            提交列表</span>
                                                    </h5>
                                                </div>
                                                <div class="widget-body table-responsive">
                                                    <div class="widget-main no-padding">
                                                        <table class="table table-striped table-bordered table-hover">
                                                            <thead class="thin-border-bottom">
                                                                <tr>
                                                                    <th class="input-group-addon">序号
                                                                    </th>
                                                                    <%--  <th>
                                                                    站名
                                                                </th>--%>
                                                                    <th class="input-group-addon">安装位置
                                                                    </th>
                                                                    <%--<th class="hidden-480">
                                                                    项目工程全称
                                                                </th>--%>
                                                                    <th class="input-group-addon">是否正常使用
                                                                    </th>
                                                                    <th class="input-group-addon hidden-480">uid码
                                                                    </th>

                                                                    <th class="input-group-addon">详细
                                                                    </th>

                                                                </tr>
                                                            </thead>
                                                            <%if (tbyc != null)
                                                                {
                                                                    for (int i = 0; i < tbyc.Rows.Count; i++)
                                                                    {

                                                            %>
                                                            <tr>
                                                                <td class="input-group-addon" style="position: relative;">
                                                                        <% if (tbyc.Rows[i]["sp1"].ToString() == "-1" || tbyc.Rows[i]["sp2"].ToString() == "-1" || tbyc.Rows[i]["sp3"].ToString() == "-1")
                                                                            {  %>
                                                                        <i class="ace-icon fa fa-exclamation-triangle bigger-121" style="color: #D15B47;" title="审批未通过/被退回/修改后请重新提交" onclick="f_OpenDlg('<%=tbyc.Rows[i]["s_id"]%>')"></i>
                                                                        <% } %>
                                                                        <% if (tbyc.Rows[i]["sp1"].ToString() == "1" || tbyc.Rows[i]["sp2"].ToString() == "1" || tbyc.Rows[i]["sp3"].ToString() == "-1")
                                                                            {  %>
                                                                        <i class="ace-icon fa fa-exclamation-triangle bigger-121" style="color: #99FF99;" title="审批通过" onclick="f_OpenDlg('<%=tbyc.Rows[i]["s_id"]%>')"></i>
                                                                        <% } %>
                                                                    <%=i+1%>
                                                                </td>
                                                                <%-- <td class="">
                                                                <%=tbyc.Rows[i]["s_zhanming"]%>
                                                            </td>--%>
                                                                <td class="input-group-addon">
                                                                    <%=tbyc.Rows[i]["s_anzhuangwz"]%>
                                                                </td>
                                                                <%--    <td class="">
                                                                <%=tbyc.Rows[i]["s_xmgcqc"]%>
                                                            </td>--%>
                                                                <td class="input-group-addon">
                                                                    <%=tbyc.Rows[i]["s_shifouzc"]%>
                                                                </td>
                                                                <td class="input-group-addon hidden-480">
                                                                    <%=tbyc.Rows[i]["s_uid"]%>
                                                                </td>

                                                                <td class="input-group-addon">
                                                                    <a href="spjkxx.aspx?EDIT_GID=<%=tbyc.Rows[i]["s_id"]%>">详情
                                                                    </a>
                                                                </td>



                                                            </tr>
                                                            <%--		<td>
																		<a href="#"><%=tbzc.Rows[i]["anzhuangweizhi"]%></a>
																	</td>

																	<td class="hidden-480">
                                                                    <span class="label label-success arrowed-in arrowed-in-right"><%=tbzc.Rows[i]["xmgcqc"]%></span>
																	</td>--%>
                                                            <%--   <td>
																		<a href="#"><%=tbzc.Rows[i]["sfzcsy"]%></a>
																	</td>--%>
                                                            <%-- <td>
                                                                     
                                                                      
												                          <span onclick="f_post('<%=tbzc.Rows[i]["g_ggqbh"]%>','<%=tbzc.Rows[i]["g_id"]%>');"> <i class="ace-icon glyphicon glyphicon-upload"></i>
												                          </span>
											                         
																		<span onclick="f_edit(<%=tbzc.Rows[i]["g_id"]%>);"><i class="ace-icon fa fa-pencil-square-o"></i></span>
																	</td>--%>
                                                            <%}
                                                                } %>
                                                            <tbody>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.span -->
                                    </form>
                                </div>
                                <!-- /.row -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse"><i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i></a>
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

        function f_OpenDlg(id) {
            layer.open({
                type: 2,
                title: '',
                skin: 'layui-layer-lan',
                closeBtn: 1, //不显示关闭按钮
                shade: [0],
                area: ['35%', '60%'],
                anim: 2,
                content: "Reason/spjk.aspx?id=" + id,
            });
        }


        //修改
        function s_xiugai(type, type1, type2, type3, type4, type5, type6) {

            alert(type, type1, type2, type3, type4, type5, type6);
            //              $.post("../it/it_submint.aspx?CMD=SPJK&GZC=" +
            //         strzhan + "&GBH=" + strweizhi + "&GXZQY=" + strbuwei + "&GSL=" +
            //        strleixing + "&GJRJCSL=" + strsfxunxian + "&GXCZF=" + strpzdw + "&GZFRC=" +
            //         strbeizhu, {}, function (data) {
            //             // alert(data);<a href="../it/it_submint.aspx">../it/it_submint.aspx</a>
            //             if (data == "1") {
            //                 mui.toast("提交成功!");
            //                 //f_LoginDesk();
            //             }

            //             if (data == "-1") {
            //                 mui.toast("提交操作失败，退出重试!");
            //                 //f_LoginDesk();

            //             }
            //             if (data == "0") {
            //                 mui.toast("已提交,不能修改!");
            //             }
            //   });
        }

        //视频监控   提交
        function s_submint(type, type1) {
            // mui.toast(type);
            var strzhan = $("#zhanming").val();
            if (strzhan == "") {
                mui.toast("请填写站名!");
                return;
            }
            var strweizhi = $("#anzhuangweizhi").val();
            if (strweizhi == "") {
                mui.toast("请填写安装位置!");
                return;
            }
            var strbuwei = $("#xmgcqc").val();
            if (strbuwei == "") {
                mui.toast("请填写项目工程名称!");
                return;
            }
            var strleixing = $("#sfzcsy").val();
            if (strleixing == "") {
                mui.toast("请填写是否正常使用!是？否？");
                return;
            }
            var strsfxunxian = $("#uid").val();
            if (strsfxunxian == "") {
                mui.toast("请填写uid码!");
                return;
            }

            var strpzdw = $("#pzdw").val();
            if (strpzdw == "") {
                mui.toast("请填写配置单位!");
                return;
            }
            var strwhqk = $("#whqk").val();
            if (strwhqk == "") {
                mui.toast("请填写维护情况!");
                return;
            }
            var strbeizhu = $("#beizhu").val();
            if (strbeizhu == "") {
                mui.toast("请填写备注!");
                return;
            }
            $.post("../it/spjk.aspx?CMD=SPJK&GZC=" +
       strzhan + "&GBH=" + strweizhi + "&GXZQY=" + strbuwei + "&GSL=" +
      strleixing + "&GJRJCSL=" + strsfxunxian + "&GXCZF=" + strpzdw + "&GZFRC=" +
       strbeizhu + "&flag=" +
       type + "&whqk=" +
       strwhqk, {}, function (data) {
           // alert(data);<a href="../it/it_submint.aspx">../it/it_submint.aspx</a>
           if (data == "1") {
               mui.toast("提交成功!");
               //f_LoginDesk();
               location.href = "wd_spjk.aspx";
           }

           if (data == "-1") {
               mui.toast("提交操作失败，退出重试!");
               //f_LoginDesk();

           }
           if (data == "0") {
               mui.toast("已提交,不能修改!");
           }
       });
        }
        function s_submintxg(type) {
            var id = $("#hide_id").val();
            var strzhan = $("#tzm").val();
            if (strzhan == "") {
                mui.toast("请填写站名!");
                return;
            }
            var strweizhi = $("#tanwz").val();
            if (strweizhi == "") {
                mui.toast("请填写安装位置!");
                return;
            }
            var strxmqc = $("#txmqc").val();
            if (strxmqc == "") {
                mui.toast("请填写项目工程名称!");
                return;
            }
            var strsfzc = $("#tsf").val();
            if (strsfzc == "") {
                mui.toast("请填写是否正常使用？");
                return;
            }
            var struid = $("#tuid").val();
            if (struid == "") {
                mui.toast("请填写uid码!");
                return;
            }

            var strpzdw = $("#tpzdw").val();
            if (strpzdw == "") {
                mui.toast("请填写配置单位!");
                return;
            }
            var strwhqk = $("#twhqk").val();
            if (strwhqk == "") {
                mui.toast("请填写维护情况!");
                return;
            }
            var strbeizhu = $("#tbz").val();
            if (strbeizhu == "") {
                mui.toast("请填写备注!");
                return;
            }
            $.post("../it/spjk.aspx?CMD=UPDATESPJK&AZWZ=" + strweizhi + "&XMQC=" + strxmqc + "&SFZC=" + strsfzc + "&UID=" +
      struid + "&PZDW=" + strpzdw + "&WHQK=" + strwhqk + "&BZ=" +
       strbeizhu + "&flag=" +
       type + "&ID=" +
       id, {}, function (data) {
           // alert(data);<a href="../it/it_submint.aspx">../it/it_submint.aspx</a>
           if (data == "1") {
               mui.toast("提交成功!");
               //f_LoginDesk();
               location.href = "wd_spjk.aspx";
           }

           if (data == "-1") {
               mui.toast("提交操作失败，退出重试!");
               //f_LoginDesk();

           }
           if (data == "0") {
               mui.toast("已提交,不能修改!");
           }
       });



        }

        //视频监控    暂存
        function s_submintzc(type, type1) {
            // mui.toast(type);
            var strzhan1 = $("#zhanming").val();
            if (strzhan1 == "") {
                mui.toast("请填写站名!");
                return;
            }
            var strweizhi1 = $("#anzhuangweizhi").val();
            if (strweizhi1 == "") {
                mui.toast("请填写安装位置!");
                return;
            }

            var strbuwei1 = $("#xmgcqc").val();
            if (strbuwei1 == "") {
                mui.toast("请填写项目工程名称!");
                return;
            }

            var strleixing1 = $("#sfzcsy").val();
            if (strleixing1 == "") {
                mui.toast("请填写是否正常使用!是？否？");
                return;
            }

            var strsfxunxian1 = $("#uid").val();
            if (strsfxunxian1 == "") {
                mui.toast("请填写uid码!");
                return;
            }

            var strpzdw1 = $("#pzdw").val();
            if (strpzdw1 == "") {
                mui.toast("请填写配置单位!");
                return;
            }
            var strwhqk = $("#whqk").val();
            if (strwhqk == "") {
                mui.toast("请填写维护情况!");
                return;
            }
            var strbeizhu1 = $("#beizhu").val();
            if (strbeizhu1 == "") {
                mui.toast("请填写备注!");
                return;
            }


            $.post("../it/spjk.aspx?CMD=SPJKZC&GZC=" +
       strzhan1 + "&GBH=" + strweizhi1 + "&GXZQY=" + strbuwei1 + "&GSL=" +
      strleixing1 + "&GJRJCSL=" + strsfxunxian1 + "&flag=" + type + "&GZFRC=" +
       strbeizhu1 + "&GXCZF=" +
       strpzdw1 + "&whqk=" +
       strwhqk, {}, function (data) {

           if (data == "1") {
               mui.toast("暂存成功!");
               //f_LoginDesk();
               location.href = "wd_spjk.aspx?EDIT_GID=" + type1;

           }

           if (data == "-1") {
               mui.toast("暂存操作失败，数据已存在!");
               //f_LoginDesk();
           }

       });
        }
        var strid = $("#id").val();

        function f_post(sid) {
            var btnArray = ['否', '是'];
            mui.confirm('提交之后不得修改，确认？', '', btnArray, function (e) {
                if (e.index == 1) {
                    f_set(sid);

                }


            })
        }

        function f_set(gid) {
            var url = "../it/spjk.aspx?CMD=SPJKTJ&GZC=" + gid + "&s_id=" + gid;
            $.post(url, {}, function (data) {
                if (data == "1") {
                    mui.toast("提交成功!");
                    location.reload();
                }
                if (data == "-1") {
                    mui.toast("提交失败，退出重试!");

                } if (data == "0") {
                    mui.toast("已提交，请勿重复操作!");
                }
            });
        }
        //function f_edit(gid) {
        //    location.href = "wd_spjk.aspx?EDIT_GID=" + gid;


        //}

        //取消修改
        function er_cancel() {
            $('.Is_HS').show(500);
            $('.Is_HS_Up').hide(500);
        }

        //修改
        function f_edit(id) {
            $('.Is_HS').hide(500);
            $('.Is_HS_Up').show(500);
            $('#hide_id').val(id);

            $.post("../../it/SPJKData.ashx", { id: id }, function (data) {
                JSons(data);
            });
        }
        function JSons(data) {
            if (data != null && data.length != 0) {
                $('#tzm').val(data[0].s_zhanming);

                $('#tanwz').val(data[0].s_anzhuangwz);
                $('#txmqc').val(data[0].s_xmgcqc); //项目工程全称

                $('#tsf').val(data[0].s_shifouzc); //风险管控

                $('#tuid').val(data[0].s_uid);
                $('#tpzdw').val(data[0].s_pzdw);

                $('#twhqk').val(data[0].s_whqk);

                $('#tbz').val(data[0].s_beizhu); //

            }

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
