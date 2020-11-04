<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Disnf.aspx.cs" Inherits="MarketInfo.wd_shenpi.Disnf" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>第三方施工审批</title>
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../assets/font-awesome/4.5.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../assets/css/jquery-ui.custom.min.css" />
    <link rel="stylesheet" href="../assets/css/fonts.googleapis.com.css" />
    <link rel="stylesheet" href="../assets/css/ace-skins.min.css" />
    <link href="../wd_dzrz/lib/assets/css/ace-rtl.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/ace.min.css" rel="stylesheet" type="text/css" />
    <link href="../lib/assets/css/ace-skins.min.css" rel="stylesheet" type="text/css" />
    <script src="../assets/js/ace-extra.min.js"></script>
    <link href="../css/mui.min.css" rel="stylesheet" type="text/css" />
    <style type="text/css">    
     .OverHideTd{ word-break:break-all; font-size: 14px; color:#555; text-align: center; background-color: #eee;font-weight: 400;}     
    </style>
</head>
<body class="no-skin">
    <div class="main-container ace-save-state" id="main-container">
        <div class="page-content">
            <div class="page-header">
                <h4>
                    第三方施工审批<small> <i class="ace-icon fa fa-angle-double-right"></i></small>
                </h4>
            </div>
            <h3 class="header smaller lighter blue"> <a class="btn btn-info" onclick="go_shenpi()"><i class="ace-icon fa fa-reply icon-only"></i>&nbsp;返回</a>
             <a class="btn btn-info" onclick="f_his()">
                          &nbsp;历史记录</a>
            
            </h3>
            <form>
            <input type="hidden" id="HideTid" value="" runat="server" /> 
            <input type="hidden" id="Hide_Sp" value="" runat="server" /> 
            <div class="row">
                <div class="col-xs-12">
                    <div class="row">
                    <!--新增施工-->
                        <div class="col-xs-12"> <h4 style=" text-align:center; border-bottom:#efefef solid 1px; padding: 0 0 10px 0;">新增施工</h4>
                            <table id="tb1" class="table  table-bordered table-hover">
                                <thead>
                                    <tr>
                                   <th class="input-group-addon"><i class="ace-icon fa fa-flag"></i>序号</th>
                                   <th class="input-group-addon">信息渠道</th>  
                                    <th class="input-group-addon">第三方姓名</th>  
                                    <th class="input-group-addon">施工类型</th>
                                   <th class="input-group-addon">审批</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <!--第三方施工-->
                        <div class="col-xs-12"><h4 style=" text-align:center; border-bottom:#efefef solid 1px; padding: 0 0 10px 0;">第三方施工</h4>
                            <table id="tb2" class="table  table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th class="input-group-addon"><i class="ace-icon fa fa-flag"></i>序号</th>
                                        <th class="input-group-addon">项目名称</th>  
                                        <th class="input-group-addon">开始时间</th>  
                                        <th class="input-group-addon">进度</th>
                                        <th class="input-group-addon">审批</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <!--各站监护点统计表-->
                        <div class="col-xs-12"> <h4  style=" text-align:center; border-bottom:#efefef solid 1px; padding: 0 0 10px 0;">各站监护点统计</h4>
                            <table id="tb3" class="table  table-bordered table-hover">
                                <thead>
                                    <tr>
                                    <th class="input-group-addon"><i class="ace-icon fa fa-flag"></i>序号</th>
                                    <th class="input-group-addon">监护点</th>  
                                    <th class="input-group-addon">监护人</th>  
                                    <th class="input-group-addon">监护形式</th>
                                    <th class="input-group-addon">进度</th>
                                    <th class="input-group-addon">审批</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <!--今日检查项目-->
                        <div class="col-xs-12"> 
                        <h4  style=" text-align:center; border-bottom:#efefef solid 1px; padding: 0 0 10px 0;">今日检查项目</h4>
                            <table id="tb5" class="table  table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th class="input-group-addon"><i class="ace-icon fa fa-flag"></i>序号</th>
                                        <th class="input-group-addon">检查</th>
                                        <th class="input-group-addon">问题</th>
                                        <th class="input-group-addon">整改</th>
                                        <th class="input-group-addon">其他</th>
                                        <th class="input-group-addon">审批</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>                    
                </div>
            </div>
            </form>
        </div>
        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse"><i class="ace-icon fa fa-angle-double-up icon-only bigger-110">
        </i></a>
    </div>
</body>
</html>
<script src="../assets/js/jquery-2.1.4.min.js" type="text/javascript"></script>
<script src="../js/mui.enterfocus.js" type="text/javascript"></script>
<script src="../js/mui.min.js" type="text/javascript"></script>
<script src="../assets/js/ace-elements.min.js" type="text/javascript"></script>
<script src="../assets/js/ace.min.js" type="text/javascript"></script> 
 <script src="../lib/assets/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        DaTa_A('dbo.T_Dsan_xinzengshigong', 'setTime');
        DaTa_B('dbo.T_Dsan_shigong', 'setTime');
        DaTa_C('dbo.T_Dsan_jindu', 'setTime');
        DaTa_D('dbo.T_Dsan_jiancha', 'settime');
    })
    function go_shenpi(){
        var HideTid = $('#HideTid').val();
        location.href = "wd_shenpi.aspx?TID=" + HideTid;
    }
    function f_his() { 
     var HideTid = $('#HideTid').val();
     location.href = " ../wd_dzrz/wd_disanf/Disanf_histroy.aspx?UTID=" + HideTid;
    
    }
    //AAA
    function DaTa_A(tables,time) {
        var HideTid = $('#HideTid').val();

        $.post('../it/selDisanf.ashx', { table: tables, tid: HideTid, time: time }, function (data) {
            if (data != "-1") {
                Bind_A(data);
            } else {
                mui.toast('数据读取失败');
            }
        });
    }
    //AAA                              
    function Bind_A(data) {
        var Hide_Sp = $('#Hide_Sp').val();
        var d_tr = '';
        var d_td_1 = '';
        var d_td_2 = '';
        var d_recede = '';
        for (var p in data) {
            if (Hide_Sp != "3") {
                d_recede = '<a class="btn btn-xs btn-danger" onclick="recede_A(' + data[p].id + ')"> <i class="ace-icon fa fa-flag bigger-120"></i> </a>';
            }
            d_td_1 = '<td class="input-group-addon">' + (parseInt(p) + 1) + '</td><td class="input-group-addon">' + data[p].xinxiqudao + '</td>';
            d_td_2 = '<td class="input-group-addon">' + data[p].sname + '</td><td class="input-group-addon">' + texttype(data[p].type) + '</td>';
            d_tr += '<tr>' + d_td_1 + d_td_2 + '<td class="input-group-addon">' + d_recede + '</td></tr>';
        }
        $('#tb1 tbody tr').remove();
        $('#tb1 tbody').append(d_tr);
    }
    //施工类型文字转换
    function texttype(type) {
        var res = '';
        if (type == "0") {
            res = '双快一保'
        } else if (type == "1") {
            res = "大型施工";
        }
        return res;
    }
    //AAA
    function recede_A(id) {
        var tables = "dbo.T_Dsan_xinzengshigong";
        var sp = "-1";
        var _sp = "1";
        var Hide_Sp = $('#Hide_Sp').val();
        mui.confirm('审批是否通过？', '审批', ['通过', '退回', '取消'], function (e) {
            if (e.index == 1) {
 
                f_UpTitle_A(id, tables, sp, Hide_Sp)

            } else if (e.index == 2) {
                mui.toast('已取消');
            } else {
 
                f_UpTitle_A(id, tables, _sp, Hide_Sp);
            }

        })
    }
    //弹出框AAA
    function f_UpTitle_A(id, tables, _sp, Hide_Sp) {
        var title = "通过";
        if (_sp == '-1') var title = "退回";
        layer.open({
            type: 1,
            title: '审批建议',
            closeBtn: 0,
            shadeClose: true,
            shade: false,
            area: ['350px', '310px'],
            content: '<div id="mydiv" style="margin-left:10px;margin-top:10px;"><input id="txtReason" type="text" value="' + title + '" autocomplete="off" /><textarea rows="3" cols="0" class="form-control input-mask-phone" id="txtreson" placeholder="请输入审批建议" ></textarea></div>',
            btn: ['确定', '取消']
            , yes: function (index, layero) {
                var txtReason = $('#txtreson').val();
                $.post('../it/UpdateDisanfSpr.ashx', { id: id, table: tables, sp: _sp, types: Hide_Sp, Name: txtReason }, function (data) {
                    if (data == '0') {
                        mui.toast(title + '成功');
                    }
                    else {
                        DaTa_A('dbo.T_Dsan_xinzengshigong', 'setTime');
                        mui.toast(data);
                    }                    
                    DaTa_A('dbo.T_Dsan_xinzengshigong', 'setTime');
                    layer.close(index);
                });
            }
        });
    }
    //BBB
    function DaTa_B(tables, time) { 
        var HideTid = $('#HideTid').val();
        $.post('../it/selDisanf.ashx', { table: tables, tid: HideTid, time: time }, function (data) {
            if (data != "-1") {
                Bind_B(data);
            } else {
                mui.toast('数据读取失败');
            }
        });
    }
    //BBB
    function Bind_B(data) {
        var Hide_Sp = $('#Hide_Sp').val();
        var tr = '';
        var td1 = '';
        var td2 = '';
        var caozuo = ''
        for (var p in data) {
            if (Hide_Sp != "3") {
                caozuo = '<a class="btn btn-xs btn-danger" onclick="recede_B(' + data[p].id + ')"> <i class="ace-icon fa fa-flag bigger-120"></i> </a>';
            }
            td1 = '<td class="input-group-addon">' + (parseInt(p) + 1) + '</td><td class="input-group-addon">' + data[p].gcmc + '</td>';
            td2 = '<td class="input-group-addon">' + data[p].startime + '</td><td class="input-group-addon">' + sgjd_text(data[p].sgjd) + '</td>';
            tr += '<tr>' + td1 + td2 + '<td class="input-group-addon">' + caozuo + '</td></tr>';
        }
        $('#tb2 tbody tr').remove();
        $('#tb2 tbody').append(tr);
    }
    //BBB
    function recede_B(id) {
        var tables = "dbo.T_Dsan_shigong";
        var sp = "-1";
        var _sp = "1";
        var Hide_Sp = $('#Hide_Sp').val();
       // alert();
        mui.confirm('审批是否通过？', '审批', ['通过', '退回', '取消'], function (e) {
            if (e.index == 1) { 
                f_UpTitle_B(id, tables, sp, Hide_Sp);
            } else if (e.index == 2) {
                mui.toast('已取消');
            } else { 
                f_UpTitle_B(id, tables, _sp, Hide_Sp);
            } 
        })
    }
    //弹出框BBB
    function f_UpTitle_B(id, tables, _sp, Hide_Sp) {
        var title = "通过";
        if (_sp == '-1') var title = "退回";
        layer.open({
            type: 1,
            title: '审批建议',
            closeBtn: 0,
            shadeClose: true,
            shade: false,
            area: ['350px', '310px'],
            content: '<div id="mydiv" style="margin-left:10px;margin-top:10px;"><input id="txtReason" type="text" value="' + title + '" autocomplete="off" /><textarea rows="3" cols="0" class="form-control input-mask-phone" id="txtreson" placeholder="请输入审批建议" ></textarea></div>',
            btn: ['确定', '取消']
            , yes: function (index, layero) {
                var txtReason = $('#txtreson').val();
                $.post('../it/UpdateDisanfSpr.ashx', { id: id, table: tables, sp: _sp, types: Hide_Sp, Name: txtReason }, function (data) {
                    if (data == '0') {
                        mui.toast(title + '成功');
                    }
                    else {
                        DaTa_B('dbo.T_Dsan_shigong', 'setTime');
                        mui.toast(data);
                    }
                    DaTa_B('dbo.T_Dsan_shigong', 'setTime');
                    layer.close(index);
                });
            }
        });
    }
    //施工进度转换文字
    function sgjd_text(sgjd) {
        switch (sgjd) {
            case '6':
                return "联合验收";
                break;
            case '5':
                return "全程监护";
                break;
            case '4':
                return "签订协议";
                break;
            case '3':
                return "方案审查";
                break;
            case '2':
                return "开挖验证";
                break;
            case '1':
                return "安全告知";
                break;
            case '0':
                return "预控阶段";
                break;
            default:
                return "";
                break;
        }
    }
    //CCC
    function DaTa_C(tables,  time ) { 
        var HideTid = $('#HideTid').val();
        $.post('../it/selDisanf.ashx', { table: tables, tid: HideTid, time: time }, function (data) {
            if (data != "-1") {
                Bind_C(data);
            } else {
                mui.toast('数据读取失败');
            }
        });
    }
    //CCC
    function Bind_C(data) {
        var Hide_Sp = $('#Hide_Sp').val();
        var tr = '';
        var td1 = '';
        var td2 = '';
        var caozuo = ''
        for (var p in data) {
            if (Hide_Sp != "3") {
                caozuo = '<a class="btn btn-xs btn-danger" onclick="recede_C(' + data[p].id + ')"> <i class="ace-icon fa fa-flag bigger-120"></i> </a>';
            }
            td1 = '<td class="input-group-addon">' + (parseInt(p) + 1) + '</td><td class="input-group-addon">' + data[p].jhd + '</td><td class="input-group-addon">' + data[p].jhname + '</td>';
            td2 = '<td class="input-group-addon">' + data[p].jhtype + '</td><td class="input-group-addon">' + data[p].jd + '</td>';
            tr += '<tr>' + td1 + td2 + '<td class="input-group-addon">' + caozuo + '</td></tr>';
        }
        $('#tb3 tbody tr').remove();
        $('#tb3 tbody').append(tr);
    }
    //CCC
    function recede_C(id) {
        var tables = "dbo.T_Dsan_jindu";
        var sp = "-1";
        var _sp = "1";
        var Hide_Sp = $('#Hide_Sp').val();
        mui.confirm('审批是否通过？', '审批', ['通过', '退回', '取消'], function (e) {
            if (e.index == 1) {
                //$.post('../it/UpdateDisanfSpr.ashx', { id: id, table: tables, sp: sp, types: Hide_Sp }, function (data) {
                //    if (data == '0') {
                //        mui.toast('退回成功');
                //    }
                //    else {
                //        mui.toast(data);
                //    }
                //    DaTa_C('dbo.T_Dsan_jindu', 'setTime');
                //});
                f_UpTitle_C(id, tables, sp, Hide_Sp, Hide_Sp);
            } else if (e.index == 2) {
                mui.toast('已取消');
            } else {
                //$.post('../it/UpdateDisanfSpr.ashx', { id: id, table: tables, sp: _sp, types: Hide_Sp }, function (data) {
                //    if (data == '0') {
                //        mui.toast('审批成功');
                //    }
                //    else {
                //        mui.toast(data);
                //    }
                //    DaTa_C('dbo.T_Dsan_jindu', 'setTime');
                //});
                f_UpTitle_C(id, tables, _sp, Hide_Sp, Hide_Sp);
            }
        })
    }
    //弹出框CCC
    function f_UpTitle_C(id, tables, _sp, Hide_Sp) {
        var title = "通过";
        if (_sp == '-1') var title = "退回";
        layer.open({
            type: 1,
            title: '审批建议',
            closeBtn: 0,
            shadeClose: true,
            shade: false,
            area: ['350px', '310px'],
            content: '<div id="mydiv" style="margin-left:10px;margin-top:10px;"><input id="txtReason" type="text" value="' + title + '" autocomplete="off" /><textarea rows="3" cols="0" class="form-control input-mask-phone" id="txtreson" placeholder="请输入审批建议" ></textarea></div>',
            btn: ['确定', '取消']
            , yes: function (index, layero) {
                var txtReason = $('#txtreson').val();
                $.post('../it/UpdateDisanfSpr.ashx', { id: id, table: tables, sp: _sp, types: Hide_Sp, Name: txtReason }, function (data) {
                    if (data == '0') {
                        mui.toast(title + '成功');
                    }
                    else {
                        DaTa_C('dbo.T_Dsan_jindu', 'setTime');
                        mui.toast(data);
                    }
                    DaTa_C('dbo.T_Dsan_jindu', 'setTime');
                    layer.close(index);
                });
            }
        });
    }
    //DDD
    function DaTa_D(tables,  time ) { 
        var HideTid = $('#HideTid').val();
        $.post('../it/selDisanf.ashx', { table: tables, tid: HideTid, time: time }, function (data) {
            if (data != "-1") {
                Bind_D(data);
            } else {
                mui.toast('数据读取失败');
            }
        });
    }
    //DDD
    function Bind_D(data) {
        var Hide_Sp = $('#Hide_Sp').val();
        var tr = '';
        var td1 = '';
        var td2 = '';
        var caozuo = ''
        for (var p in data) {
            if (Hide_Sp != "3") {
                caozuo = '<a class="btn btn-xs btn-danger" onclick="recede_D(' + data[p].id + ')"> <i class="ace-icon fa fa-flag bigger-120"></i></a>';
            }
            td1 = '<td class="OverHideTd">' + (parseInt(p) + 1) + '</td><td class="OverHideTd">' + data[p].jrjcxm + '</td><td class="OverHideTd">' + data[p].fxwt + '</td>';
            td2 = '<td class="OverHideTd">' + data[p].wtzg + '</td><td class="OverHideTd">' + data[p].qt + '</td>';
            tr += '<tr>' + td1 + td2 + '<td class="OverHideTd">' + caozuo + '</td></tr>';
        }
        $('#tb5 tbody tr').remove();
        $('#tb5 tbody').append(tr);
    }
    //DDD
    function recede_D(id) {
        var tables = "dbo.T_Dsan_jiancha";
        var sp = "-1";
        var _sp = "1";
        var Hide_Sp = $('#Hide_Sp').val();
        mui.confirm('审批是否通过？', '审批', ['通过', '退回', '取消'], function (e) {
            if (e.index == 1) {
                //$.post('../it/UpdateDisanfSpr.ashx', { id: id, table: tables, sp: sp, types: Hide_Sp }, function (data) {
                //    if (data == '0') {
                //        mui.toast('退回成功');
                //    }
                //    else {
                //        mui.toast(data);
                //    }
                //    DaTa_D('dbo.T_Dsan_jiancha', 'settime');
                //});
                f_UpTitle_D(id, tables, sp, Hide_Sp);

            } else if (e.index == 2) {
                mui.toast('已取消');
            } else {
                //$.post('../it/UpdateDisanfSpr.ashx', { id: id, table: tables, sp: _sp, types: Hide_Sp }, function (data) {
                //    if (data == '0') {
                //        mui.toast('通过成功');
                //    }
                //    else {
                //        mui.toast(data);
                //    }
                //    DaTa_D('dbo.T_Dsan_jiancha', 'settime');
                //});
                f_UpTitle_D(id, tables, _sp, Hide_Sp);
            }

        })
    }
    //弹出框DDD
    function f_UpTitle_D(id, tables, _sp, Hide_Sp) {
        var title = "通过";
        if (_sp == '-1') var title = "退回";
        layer.open({
            type: 1,
            title: '审批建议',
            closeBtn: 0,
            shadeClose: true,
            shade: false,
            area: ['350px', '310px'],
            content: '<div id="mydiv" style="margin-left:10px;margin-top:10px;"><input id="txtReason" type="text" value="' + title + '" autocomplete="off" /><textarea rows="3" cols="0" class="form-control input-mask-phone" id="txtreson" placeholder="请输入审批建议" ></textarea></div>',
            btn: ['确定', '取消']
            , yes: function (index, layero) {
                var txtReason = $('#txtreson').val(); 
                $.post('../it/UpdateDisanfSpr.ashx', { id: id, table: tables, sp: _sp, types: Hide_Sp, Name: txtReason }, function (data) {
                    if (data == '0') {
                        mui.toast(title + '成功');
                    }
                    else {
                        DaTa_D('dbo.T_Dsan_jiancha', 'settime');
                        mui.toast(data);
                    }                    
                    DaTa_D('dbo.T_Dsan_jiancha', 'settime');
                    layer.close(index);
                });
            }
        });
    }
</script>