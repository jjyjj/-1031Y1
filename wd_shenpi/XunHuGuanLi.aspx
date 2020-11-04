<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XunHuGuanLi.aspx.cs" Inherits="MarketInfo.wd_shenpi.XunHuGuanLi" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>巡护管理</title>
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
                    巡护管理 
                </h4>
            </div>
            <h3 class="header smaller lighter blue"> <a class="btn btn-info" onclick="go_shenpi()"><i class="ace-icon fa fa-reply icon-only"></i>&nbsp;返回</a>
             <a class="btn btn-info" href="../wd_dzrz/1xunhuaguanli/xh_xunhu_his.aspx?UTID=<%=UTID%>">
                          &nbsp;历史记录</a>
            </h3>
            <form runat="server">
                <input type="hidden" id="hideFtid" value="" runat="server" />
                <input type="hidden" id="HideTid" value="" runat="server" />
                <input type="hidden" id="Hide_Sp" value="" runat="server" />
            <div class="row">
                <div class="col-xs-12">
                    <div class="row">
                    <!-- -->
                        <div class="col-xs-12"> <h4 style=" text-align:center; border-bottom:#efefef solid 1px; padding: 0 0 10px 0;"></h4>
                            <table id="tb1" class="table  table-bordered table-hover">
                                <thead>
                                    <tr>
                                   <th class="input-group-addon"><i class="ace-icon fa fa-flag"></i>序号</th>
                                   <th class="input-group-addon">巡线工姓名</th>  
                                    <th class="input-group-addon">管道里程</th>   
                                   <th class="input-group-addon Hide_types">审批</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%if (tb != null)
                                      {
                                          for (int i = 0; i < tb.Rows.Count; i++)
                                          {
                                              String strxxgid = tb.Rows[i]["xh_xunxiangong_id"].ToString();
                                              String sql = "select xx_name,xx_qdzh,xx_zdzh  from t_xunxiangong_info where xx_id='" + strxxgid + "'";
                                              System.Data.DataTable tb2 = WXDBUtility.SqlHelper.GetDataTable(sql);
                                              String name = "";
                                              String qd = "";
                                              String zd = "";
                                              if (tb2 != null)
                                              {
                                                  name = tb2.Rows[0]["xx_name"].ToString();
                                                  qd = tb2.Rows[0]["xx_qdzh"].ToString();
                                                  zd = tb2.Rows[0]["xx_zdzh"].ToString();

                                              }
                     
                                    %>
                                    <tr>
                                        <td class="input-group-addon">
                                            <%=i+1%>
                                        </td>
                                        <td class="input-group-addon">
                                            <%=name%>
                                        </td>
                                        <td class="input-group-addon">
                                            <span class="label label-warning">
                                                <%=tb.Rows[i]["xh_jiancha_licheng"]%></span>
                                        </td>
                                        <td class="input-group-addon Hide_types"> 
                                       <%-- <a class="btn btn-xs btn-danger" onclick="recede('<%=tb.Rows[i]["xh_id"]%>')"> <i class="ace-icon fa fa-flag bigger-120"></i> </a>--%>
                                        <a class="btn btn-xs btn-danger" onclick="f_shenpi('<%=tb.Rows[i]["xh_id"]%>','-1')"> <i class="ace-icon fa fa-flag bigger-120"></i> </a>
                                      
                                       
                                       
                                        </td>
                                        <%}   } %>
                                    </tr>
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
 <script src="../lib/assets/js/typeahead-bs2.min.js"></script>
<script src="../lib/assets/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        ShenPiByType();//如果是管理处进入，就去除审批按钮
    })
    function ShenPiByType() {
        var istype = $('#Hide_Sp').val();
        if (istype == '3') { $('.Hide_types').remove(); }
    }
    function go_shenpi() {
        var HideTid = $('#HideTid').val();
        location.href = "wd_shenpi.aspx?TID=" + HideTid;
    }





    function f_shenpi(sid, type) {
        var btnArray = ['通过', '退回', '取消'];
        mui.confirm('审批是否通过？', '审批', ['通过', '退回', '取消'], function (e) {
            if (e.index == 1) {
                f_set(sid, type);
                //info.innerText = '你刚确认MUI是个好框架';
            } else if (e.index == 2) {
                mui.toast('已取消')
            } else {
                f_set(sid, '1');
            }
        })
    }
    function f_set(id, type) {
        f_UpTitle(id, type);       
    }
    function f_UpTitle(id, type) {
        var title = "通过";
        if (type == '-1') var title = "退回";
        layer.open({
            type: 1,
            title: '审批建议',
            closeBtn: 0,
            shadeClose: true,
            shade: false,
            area: ['350px', '310px'],
            content: '<div id="mydiv" style="margin-left:10px;margin-top:10px;"><input id="txtReason" type="text" value="' + title + '" autocomplete="off" /><textarea rows="3" cols="0" class="form-control input-mask-phone" id="txtreson" placeholder="请输入审批建议" ></textarea></div>',
            // content: '<div id="mydiv" style="margin-left:10px;margin-top:10px;"><input id="txtReason" type="text" value="' + title + '" autocomplete="off" /><input rows="3" cols="0" class="form-control input-mask-phone" id="txtreson" placeholder="请输入审批建议" /></div>',

            btn: ['确定', '取消']
                    , yes: function (index, layero) {
                        var txtReason = $('#txtreson').val();
                        //alert(txtReason);
                        //if (txtReason == "") {
                        //    return false;
                        //}
                        var Hide_Sp = $('#Hide_Sp').val();
                        $.post("../it/it_shenpi.aspx", { cmd: 'xxg', id: id, sp: type, spa: Hide_Sp, Reason: txtReason }, function (data) {
                            if (data == "1") {
                                mui.toast("审批成功!");
                                location.reload();
                            }
                            if (data == "-1") {
                                mui.toast("审批失败，退出重试!");
                            }
                            layer.close(index);
                        });

                    }
        });
            }


    function recede(id) {
        var sp = "-1";
        var _sp = "1";
        var Hide_Sp = $('#Hide_Sp').val();
        mui.confirm('审批是否通过？', '审批', ['通过', '退回', '取消'], function (e) {
            if (e.index == 1) {
                $.post('../it/it_shenpi.aspx', { cmd: 'xxg', id: id, sp: sp, spa: Hide_Sp }, function (data) {
                    if (data == '0') {
                        mui.toast('退回成功');
                    }
                    else {
                        mui.toast(data);
                    }
                    location.reload();
                }); 
            } else if (e.index == 2) {
                mui.toast('已取消');
            } else {
                $.post('../it/it_shenpi.aspx', { cmd: 'xxg', id: id, sp: _sp, spa: Hide_Sp }, function (data) {
                    if (data == '0') {
                        mui.toast('审批成功');
                    }
                    else {
                        mui.toast(data);
                    }
                    location.reload();
                });
            }

        })
    }
</script>
