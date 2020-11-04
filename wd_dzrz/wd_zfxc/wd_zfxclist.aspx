<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_zfxclist.aspx.cs" Inherits="MarketInfo.wd_dzrz.wd_zfxc.wd_zfxclist" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>宣传走访</title>
    <meta name="description" content="Draggabble Widget Boxes with Persistent Position and State" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <!-- bootstrap & fontawesome -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../assets/font-awesome/4.5.0/css/font-awesome.min.css" />
    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="../assets/css/jquery-ui.custom.min.css" />
    <!-- text fonts -->
    <link rel="stylesheet" href="../assets/css/fonts.googleapis.com.css" />
    <!-- ace styles -->
    <link rel="stylesheet" href="../assets/css/ace.min.css" class="ace-main-stylesheet" />
    <!--[if lte IE 9]>
			<link rel="stylesheet" href="/assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
    <link rel="stylesheet" href="../assets/css/ace-skins.min.css" />
    <link rel="stylesheet" href="../lib/assets/css/ace-rtl.min.css" />
    <link href="../css/mui.min.css" rel="stylesheet" type="text/css" />
    <script src="../assets/js/ace-extra.min.js" type="text/javascript"></script>
    <style type="text/css">
        ul li {
            list-style-type: none
        }

        div.sel_check {
            position: absolute;
            z-index: 777;
            top: 39px;
            left: 60px;
            text-align: center;
            width: 77%;
            display: none
        }

            div.sel_check ul {
                width: 77%;
                height: 170px;
                border: 1px #a2cbcf solid;
                border-top: 0;
                background-color: #fff;
                color: #222;
                font-size: 14px;
                overflow: auto
            }

                div.sel_check ul li {
                    width: 100%;
                    height: 27px;
                    margin: 3px 0 0 0;
                    line-height: 27px
                }

                    div.sel_check ul li.check {
                        background-color: #efefef
                    }

                    div.sel_check ul li:hover {
                        background-color: #efefef;
                        cursor: pointer
                    }

        input[type=text] {
            background-color: #fff !important
        }
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
                    <div class="row">
                        <div class="col-xs-12">
                            <!-- PAGE CONTENT BEGINS -->
                            <div>
                                <div class="row">
                                    <h3 class="header smaller lighter blue">
                                        <a class="btn btn-info" href="../wd_ywsb.aspx"><i class="ace-icon fa fa-reply icon-only"></i>&nbsp;返回</a>
                                        <a class="btn btn-info" href="wd_zfxcuser.aspx"><i class="ace-icon glyphicon glyphicon-th"></i>走访人员信息编辑</a>
                                        <a class="btn btn-info" href="wd_zfxc_hislist.aspx">历史信息</a>
                                    </h3>
                                    <form id="Form1" runat="server">
                                        <input type="hidden" id="hideFid" value="" runat="server" />
                                        <!--添加-->
                                        <div class="col-xs-12 col-sm-4 Is_HS">
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
                                                                <span class="input-group-addon">区县级重点部门</span>
                                                                <input class="form-control input-mask-phone" type="text" id="txtxjbm" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;
                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">乡镇政府级部门派出机构</span>
                                                                <input class="form-control input-mask-phone" type="text" id="txtxzbm" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;
                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">村委</span>
                                                                <input class="form-control input-mask-phone" type="text" id="txtcw" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;
                                                        <div>
                                                            <div class="input-group User_jxs" style="position: relative;">
                                                                <span class="input-group-addon">机械手</span>
                                                                <input class="form-control" type="text" id="txtjxs" title="点击选择" style="cursor: pointer;" onclick="open_jjs(1)" placeholder="请选择" readonly="readonly" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;  
                                                        <div>
                                                            <div class="input-group User_xxy">
                                                                <span class="input-group-addon">信息员</span>
                                                                <input class="form-control input-mask-phone" type="text" id="txtxxy" style="cursor: pointer;" onclick="open_jjs(2)" placeholder="请选择" readonly="readonly" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;
                                                        <div>
                                                            <div class="input-group User_nthz">
                                                                <span class="input-group-addon">农田户主</span>
                                                                <input class="form-control input-mask-phone" type="text" id="txtnthz" style="cursor: pointer;" onclick="open_jjs(3)" placeholder="请选择" readonly="readonly" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp; 
                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">今日走访数量</span>
                                                                <input class="form-control input-mask-phone" type="text" id="txtjr_num" readonly="readonly" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp; 
                                                    <div>
                                                        <ul>
                                                            <li>
                                                                <button class="btn btn-info" type="button" onclick="er_submint('1');">
                                                                    <i class="ace-icon fa fa-check bigger-110"></i>提交
                                                                </button>
                                                                &nbsp;
                                                            <button class="btn btn-info" type="button" onclick="er_submint('0');">
                                                                <i class="ace-icon fa fa-undo bigger-110"></i>暂存
                                                            </button>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--暂存的列表-->
                                        <div class="col-xs-12 col-sm-6 widget-container-col Is_HS" id="widget-container-col-2">
                                            <div class="widget-box widget-color-blue" id="widget-box-2">
                                                <div class="widget-header">
                                                    <h5 class="widget-title bigger lighter">
                                                        <span style="color: #FFFFFF; font-weight: bolder;"><i class="ace-icon fa fa-table"></i>暂存列表</span>
                                                    </h5>
                                                </div>
                                                <div class="widget-body">
                                                    <div class="widget-main no-padding">
                                                        <table class="table table-striped table-bordered table-hover">
                                                            <thead class="thin-border-bottom">
                                                                <tr>
                                                                    <th class="input-group-addon"><i class="ace-icon fa fa-flag"></i>序号</th>
                                                                    <th class="input-group-addon hidden-480">区县级部门</th>
                                                                    <th class="input-group-addon hidden-480">村委</th>
                                                                    <th class="input-group-addon hidden-480">机械手</th>
                                                                    <th class="input-group-addon">信息员</th>
                                                                    <th class="input-group-addon">农田户主</th>
                                                                    <th class="input-group-addon hidden-480">走访数量</th>
                                                                    <th style="display: none;" class="input-group-addon"></th>
                                                                    <th style="display: none;" class="input-group-addon"></th>
                                                                    <th class="input-group-addon">操作</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <% if (dt_1 != null)
                                                                    {
                                                                        for (int i = 0; i < dt_1.Rows.Count; i++)
                                                                        {  %>
                                                                <tr>
                                                                    <td class="input-group-addon">
                                                                        <% if (dt_1.Rows[i]["sp1"].ToString() == "-1" || dt_1.Rows[i]["sp2"].ToString() == "-1" || dt_1.Rows[i]["sp3"].ToString() == "-1")
                                                                            {  %>
                                                                        <i class="ace-icon fa fa-exclamation-triangle bigger-121" style="color: #D15B47;" title="审批未通过/被退回/修改后请重新提交" onclick="f_OpenDlg('<%=dt_1.Rows[i]["id"]%>')"></i>
                                                                        <% } %>
                                                                        <%=i+1 %>
                                                                    </td>
                                                                    <td class="input-group-addon hidden-480"><%=dt_1.Rows[i]["zf_xjbm"]%></td>
                                                                    <td class="input-group-addon hidden-480"><%=dt_1.Rows[i]["zf_cw"]%></td>
                                                                    <td class="input-group-addon hidden-480"><%=dt_1.Rows[i]["zf_jxs"]%></td>
                                                                    <td class="input-group-addon"><%=dt_1.Rows[i]["zf_xxy"]%></td>
                                                                    <td class="input-group-addon"><%=dt_1.Rows[i]["zf_nthz"]%></td>
                                                                    <td class="input-group-addon hidden-480"><%=dt_1.Rows[i]["zf_jr_num"]%></td>
                                                                    <td class="input-group-addon" style="display: none;"><%=dt_1.Rows[i]["zf_lj_num"]%></td>
                                                                    <td class="input-group-addon" style="display: none;"><%=dt_1.Rows[i]["zf_jd"]%></td>
                                                                    <td class="input-group-addon">
                                                                        <a href="javascript:;" title="提交" onclick="er_save('<%=dt_1.Rows[i]["id"]%>')"><i class="ace-icon glyphicon glyphicon-upload"></i></a>&nbsp;
                                                                        <a href="javascript:;" title="修改" onclick="ss(1,'0','<%=dt_1.Rows[i]["id"]%>','<%=dt_1.Rows[i]["zf_xjbm"]%>','<%=dt_1.Rows[i]["zf_xzbm"]%>','<%=dt_1.Rows[i]["zf_cw"]%>','<%=dt_1.Rows[i]["zf_jxs"]%>','<%=dt_1.Rows[i]["zf_xxy"]%>','<%=dt_1.Rows[i]["zf_nthz"]%>','<%=dt_1.Rows[i]["zf_jr_num"]%>','<%=dt_1.Rows[i]["zf_jxs_all"]%>','<%=dt_1.Rows[i]["zf_xxy_all"]%>','<%=dt_1.Rows[i]["zf_nthz_all"]%>')">
                                                                            <i class="ace-icon fa fa-pencil-square-o"></i></a>&nbsp;
  <a href="javascript:;"  title="删除"><i class="ace-icon fa fa-times" onclick="er_del('<%=dt_1.Rows[i]["id"]%>')"></i></a>
                                                                    </td>
                                                                </tr>
                                                                <% }
                                                                    }%>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--已保存的列表-->
                                        <div class="col-xs-12 col-sm-6 widget-container-col Is_HS">
                                            <div class="widget-box widget-color-blue" id="Div2">
                                                <div class="widget-header">
                                                    <h5 class="widget-title bigger lighter">
                                                        <span style="color: #FFFFFF; font-weight: bolder;"><i class="ace-icon fa fa-table"></i>提交列表</span>
                                                    </h5>
                                                </div>
                                                <div class="widget-body">
                                                    <div class="widget-main no-padding">
                                                        <table class="table table-striped table-bordered table-hover">
                                                            <thead class="thin-border-bottom">
                                                                <tr>
                                                                    <th class="input-group-addon"><i class="ace-icon fa fa-flag"></i>序号</th>
                                                                    <th class="input-group-addon hidden-480">区县级部门</th>

                                                                    <th class="input-group-addon hidden-480">村委</th>
                                                                    <th class="input-group-addon hidden-480">机械手</th>
                                                                    <th class="input-group-addon">信息员</th>
                                                                    <th class="input-group-addon">农田户主</th>
                                                                    <th class="input-group-addon hidden-480">走访数量</th>
                                                                    <th class="input-group-addon" style="display: none;"></th>
                                                                    <th class="input-group-addon" style="display: none;"></th>
                                                                    <th class="input-group-addon">详情</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <% if (dt_2 != null)
                                                                    {
                                                                        for (int i = 0; i < dt_2.Rows.Count; i++)
                                                                        {  %>
                                                                <tr>
                                                                    <td class="input-group-addon" style="position: relative;">
                                                                        <% if (dt_2.Rows[i]["sp1"].ToString() == "-1" || dt_2.Rows[i]["sp2"].ToString() == "-1" || dt_2.Rows[i]["sp3"].ToString() == "-1")
                                                                            {  %>
                                                                        <i class="ace-icon fa fa-exclamation-triangle bigger-121" style="color: #D15B47;" title="审批未通过/被退回/修改后请重新提交" onclick="f_OpenDlg('<%=dt_2.Rows[i]["id"]%>')"></i>
                                                                        <% } %>
                                                                        <% if (dt_2.Rows[i]["sp1"].ToString() == "1" || dt_2.Rows[i]["sp2"].ToString() == "1" || dt_2.Rows[i]["sp3"].ToString() == "-1")
                                                                            {  %>
                                                                        <i class="ace-icon fa fa-exclamation-triangle bigger-121" style="color: #99FF99;" title="审批通过" onclick="f_OpenDlg('<%=dt_2.Rows[i]["id"]%>')"></i>
                                                                        <% } %>
                                                                        <%=i+1%>
                                                                    </td>
                                                                    <td class="input-group-addon hidden-480"><%=dt_2.Rows[i]["zf_xjbm"]%></td>
                                                                    <td class="input-group-addon hidden-480"><%=dt_2.Rows[i]["zf_cw"]%></td>
                                                                    <td class="input-group-addon hidden-480"><%=dt_2.Rows[i]["zf_jxs"]%></td>
                                                                    <td class="input-group-addon"><%=dt_2.Rows[i]["zf_xxy"]%></td>
                                                                    <td class="input-group-addon"><%=dt_2.Rows[i]["zf_nthz"]%></td>
                                                                    <td class="input-group-addon hidden-480"><%=dt_2.Rows[i]["zf_jr_num"]%></td>
                                                                    <td class="input-group-addon" style="display: none;"><%=dt_2.Rows[i]["zf_lj_num"]%></td>
                                                                    <td class="input-group-addon" style="display: none;"><%=dt_2.Rows[i]["zf_jd"]%></td>
                                                                    <td class="input-group-addon">
                                                                        <a href="#"
                                                                            onclick="ss(2,'0','<%=dt_2.Rows[i]["id"]%>','<%=dt_2.Rows[i]["zf_xjbm"]%>','<%=dt_2.Rows[i]["zf_xzbm"]%>','<%=dt_2.Rows[i]["zf_cw"]%>','<%=dt_2.Rows[i]["zf_jxs"]%>','<%=dt_2.Rows[i]["zf_xxy"]%>','<%=dt_2.Rows[i]["zf_nthz"]%>','<%=dt_2.Rows[i]["zf_jr_num"]%>','<%=dt_2.Rows[i]["zf_jxs_all"]%>','<%=dt_2.Rows[i]["zf_xxy_all"]%>','<%=dt_2.Rows[i]["zf_nthz_all"]%>')">详情</a>
                                                                    </td>
                                                                </tr>
                                                                <% }
                                                                    }%>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--修改-->
                                        <div class="col-xs-12 col-sm-4 Is_HS_Up" style="display: none;">
                                            <div class="widget-box">
                                                <div class="widget-header">

                                                    <h4 class="widget-title">
                                                        <span class="updateSpan ">修改</span>
                                                    </h4>
                                                    <span class="widget-toolbar">
                                                        <a href="#" onclick="er_cancel()"><i class="ace-icon fa fa-times"></i></a></span>
                                                </div>
                                                <input type="hidden" id="hide_id" value="" />
                                                <div class="widget-body">
                                                    <div class="widget-main">
                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">区县级重点部门</span>
                                                                <input class="form-control input-mask-phone" type="text" id="txtxjbmup" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;
                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">乡镇政府级部门派出机构</span>
                                                                <input class="form-control input-mask-phone" type="text" id="txtxzbmup" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;
                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">村委</span>
                                                                <input class="form-control input-mask-phone" type="text" id="txtcwup" placeholder="请输入" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;  
                                                        <div>
                                                            <div class="input-group User_jxs_up" style="position: relative;">
                                                                <span class="input-group-addon">机械手</span>
                                                                <input class="form-control input-mask-phone" type="text" id="txtjxsup" style="cursor: pointer;" placeholder="请选择" onclick="open_jjs_up(1)" readonly="readonly" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;  
                                                        <div>
                                                            <div class="input-group User_xxy_up">
                                                                <span class="input-group-addon">信息员</span>
                                                                <input class="form-control input-mask-phone" type="text" id="txtxxyup" style="cursor: pointer;" placeholder="请选择" onclick="open_jjs_up(2)" readonly="readonly" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp;
                                                        <div>
                                                            <div class="input-group User_nthz_up">
                                                                <span class="input-group-addon">农田户主</span>
                                                                <input class="form-control input-mask-phone" type="text" id="txtnthzup" style="cursor: pointer;" placeholder="请选择" onclick="open_jjs_up(3)" readonly="readonly" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp; 
                                                        <div>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">今日走访数量</span>
                                                                <input class="form-control input-mask-phone" type="text" id="txtjr_numup" readonly="readonly" runat="server" />
                                                            </div>
                                                        </div>
                                                        &nbsp; 
                                                    <div class="updateBtn">
                                                        <ul>
                                                            <li>
                                                                <button class="btn btn-info" type="button" onclick="er_saveup('1')"><i class="ace-icon fa fa-check bigger-110"></i>提交</button>
                                                                &nbsp; 
                                                                <button class="btn btn-info" type="button" onclick="er_saveup('0')"><i class="ace-icon fa fa-undo bigger-110"></i>暂存</button>
                                                            </li>
                                                        </ul>
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
        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse"><i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i></a>
    </div>
    <!--机械手-->
    <input type="hidden" id="hidejxs" value="0" runat="server" />
    <!--信息员-->
    <input type="hidden" id="hidexxy" value="0" runat="server" />
    <!--农田户主-->
    <input type="hidden" id="hidenthz" value="0" runat="server" />

    <!--机械手-->
    <input type="hidden" id="hidejxsup" value="0" runat="server" />
    <!--信息员-->
    <input type="hidden" id="hidexxyup" value="0" runat="server" />
    <!--农田户主-->
    <input type="hidden" id="hidenthzup" value="0" runat="server" />

</body>
</html>
<script src="../assets/js/jquery-2.1.4.min.js" type="text/javascript"></script>
<script src="../js/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='../assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>
<!-- page specific plugin scripts -->
<script src="../assets/js/jquery-ui.custom.min.js" type="text/javascript"></script>
<script src="../assets/js/jquery.ui.touch-punch.min.js" type="text/javascript"></script>
<!-- ace scripts -->
<script src="../assets/js/ace-elements.min.js" type="text/javascript"></script>
<script src="../assets/js/ace.min.js" type="text/javascript"></script>
<script src="../js/mui.enterfocus.js" type="text/javascript"></script>
<script src="../js/mui.min.js" type="text/javascript"></script>
<!-- inline scripts related to this page -->
<script src="../assets/js/bootstrap-multiselect.min.js" charset="utf-8" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
    })
    //保存时选择人员
    function open_jjs(typeid) {
        var user_all = null;
        switch (typeid) {
            case 1:
                user_all = $('#hidejxs').val();
                break;
            case 2:
                user_all = $('#hidexxy').val();
                break;
            case 3:
                user_all = $('#hidenthz').val();
                break;
            default:
        }
        layer.open({
            type: 2,
            title: '选择人员',
            btn: ['确认', '取消'],
            area: ['70%', '70%'],
            content: 'CheUser.aspx?TYPEID=' + typeid + '&&ROLE=' + user_all,
            btn1: function (index, key) {
                //获取子页面方法/选择数量                
                var res = $(key).find('iframe')[0].contentWindow.res_();
                //所有ID
                var res_all = $(key).find('iframe')[0].contentWindow.res_all();
                switch (typeid) {
                    case 1:
                        $('#txtjxs').val(res);
                        $('#hidejxs').val(res_all);
                        break;
                    case 2:
                        $('#txtxxy').val(res);
                        $('#hidexxy').val(res_all);
                        break;
                    case 3:
                        $('#txtnthz').val(res);
                        $('#hidenthz').val(res_all);
                        break;
                    default:
                }
                $('#txtjr_num').val(Number($('#txtjxs').val()) + Number($('#txtxxy').val()) + Number($('#txtnthz').val()));
                if (isNaN($('#txtjr_num').val())) {
                    $('#txtjr_num').val(0);
                }
            }
        })
    }

     //删除暂存列表中没有经过审批的数据
    function er_del(id){
     mui.confirm('是否确认删除？', '删除', function (e) {
            if (e.index == 1) {
                $.post("../../it/zfxcdel.ashx", {id: id }, function (data) {
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

    //修改时选择人员
    function open_jjs_up(typeid) {
        var user_all = '';
        switch (typeid) {
            case 1:
                user_all = $('#hidejxsup').val();
                break;
            case 2:
                user_all = $('#hidexxyup').val();
                break;
            case 3:
                user_all = $('#hidenthzup').val();
                break;
            default:
        }
        layer.open({
            type: 2,
            title: '选择人员',
            btn: ['确认', '取消'],
            area: ['70%', '70%'],
            content: 'CheUser.aspx?TYPEID=' + typeid + '&&ROLE=' + user_all,
            btn1: function (index, key) {
                //获取子页面方法/选择数量                
                var res = $(key).find('iframe')[0].contentWindow.res_();
                //所有ID
                var res_all = $(key).find('iframe')[0].contentWindow.res_all();
                switch (typeid) {
                    case 1:
                        $('#txtjxsup').val(res);
                        $('#hidejxsup').val(res_all);
                        break;
                    case 2:
                        $('#txtxxyup').val(res);
                        $('#hidexxyup').val(res_all);
                        break;
                    case 3:
                        $('#txtnthzup').val(res);
                        $('#hidenthzup').val(res_all);
                        break;
                    default:
                }
                $('#txtjr_numup').val(Number($('#txtjxsup').val()) + Number($('#txtxxyup').val()) + Number($('#txtnthzup').val()));
                if (isNaN($('#txtjr_numup').val())) {
                    $('#txtjr_numup').val(0);
                }

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
            area: ['35%', '60%'],
            anim: 2,
            content: "wd_reason.aspx?id=" + id,
        });
    }

    //function qbb_index() {
    //    layer.open({
    //        type: 2,
    //        title: '情报板',
    //        skin: 'layui-layer-lan',
    //        closeBtn: 1,
    //        shade: [0],
    //        area: ['537px', '350px'],
    //        anim: 0,
    //        content: 'wd_qbb_model.aspx'
    //    })
    //}
    function ss(type, isfg, id, txtxjbm, txtxzbm, txtcw, txtjxs, txtxxy, txtnthz, txtjr_num, jxsall, xxyall, nthzalls) {
        $('.Is_HS div.sel_check').hide();
        $('.Is_HS div.sel_check ul li').removeClass('check');

        $('.Is_HS').hide(500);
        $('.Is_HS_Up').show(500);
        if (type == 1) {
            $('.updateSpan').text("修改")
            $('.updateBtn').show(500);
        }
        else {
            $('.updateSpan').text("详情")
            $('.updateBtn').hide(500);
        }

        $('#hide_id').val(id);
        $('#txtxjbmup').val(txtxjbm);
        $('#txtxzbmup').val(txtxzbm);
        $('#txtcwup').val(txtcw);
        $('#txtjxsup').val(txtjxs);
        $('#txtxxyup').val(txtxxy);
        $('#txtnthzup').val(txtnthz);
        $('#txtjr_numup').val(txtjr_num);

        $('#hidejxsup').val(jxsall);
        $('#hidexxyup').val(xxyall);
        $('#hidenthzup').val(nthzall);


    }
</script>
<script src="zfxc.js" type="text/javascript"></script>
