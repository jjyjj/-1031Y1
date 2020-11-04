<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_zfxcuser.aspx.cs" Inherits="MarketInfo.wd_dzrz.wd_zfxc.wd_zfxcuser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title></title>
    <meta name="description" content="Draggabble Widget Boxes with Persistent Position and State" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" /> 
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../assets/font-awesome/4.5.0/css/font-awesome.min.css" /> 
    <link rel="stylesheet" href="../assets/css/jquery-ui.custom.min.css" /> 
    <link rel="stylesheet" href="../assets/css/fonts.googleapis.com.css" /> 
    <link rel="stylesheet" href="../assets/css/ace.min.css" class="ace-main-stylesheet"  /> 
    <link rel="stylesheet" href="../assets/css/ace-skins.min.css" />
    <link rel="stylesheet" href="../lib/assets/css/ace-rtl.min.css" />
    <link href="../css/mui.min.css" rel="stylesheet" type="text/css" />
    <script src="../assets/js/ace-extra.min.js" type="text/javascript"></script>
    <style type="text/css">
    ul li{ list-style-type:none;}
    .OverHideTd{   overflow:hidden; text-overflow:ellipsis;  white-space:nowrap; max-width:100px; font-size: 14px; color:#555;  text-align: center; background-color: #eee;font-weight: 400;} 
     @keyframes gywm_text{0%{ transform:translateX(-100%); opacity:0;} 100%{  transform:translateX(0); opacity:1;}}
    @media screen and (min-width: 480px){
    h3.centersa{text-align:center;}
    div.auto_list{margin: 1%  0 0 25%;}
    div.auto_add {margin: 1%  0 0 33.333%;}
    }
    div.row h3.header a.btn { margin-top:5px;}
    </style>
</head>
<body class="no-skin">
    <div class="main-content">
        <div class="main-content-inner">
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12"> 
                        <div > 
                            <form id="Form1">
                                <input type="hidden" id="hidexxqd" value="" /> 
                                <input type="hidden" id="hideuser" value="" /> 
                                <!-- 信息渠道 -->
                                <div class="row" style="min-height:666px; display:none;">
                                    <h3 class="header smaller lighter blue"><a class="btn btn-info" href="wd_zfxclist.aspx"><i class="ace-icon fa fa-reply icon-only"></i>&nbsp;返回上级</a>
                                        <a class="btn btn-info" href="javascript:;" onclick="xxqdadd()">增加</a>                    
                                        <a class="btn btn-info _UserList" href="javascript:;"><i class="ace-icon"></i>&nbsp;走访人员列表</a>   
                                    </h3> 
                                    <h3 class="centersa">走访人员类型</h3>
                                    <!--添加-->
                                    <!--已保存的列表-->
                                    <div class="col-xs-12 col-sm-6 widget-container-col Is_Hilist auto_list">
                                        <div class="widget-box widget-color-blue">
                                            <div class="widget-header">
                                                <h5 class="widget-title bigger lighter">
                                                    <span style="color: #FFFFFF; font-weight: bolder;"><i class="ace-icon fa fa-table"></i>走访人员类型</span>
                                                </h5>
                                            </div>
                                            <div class="widget-body">
                                                <div class="widget-main no-padding">
                                                    <table class="table table-striped table-bordered table-hover" id="tb1">
                                                        <thead class="thin-border-bottom">
                                                            <tr>
                                                                <th class="input-group-addon"><i class="ace-icon fa fa-flag"></i>序号</th>
                                                                <th class="input-group-addon">名称</th>
                                                                <th class="input-group-addon">操作</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 Is_HS auto_add" style="">
                                        <div class="widget-box">
                                            <div class="widget-header">
                                                <h4 class="widget-title">走访人员类型维护</h4>
                                                <span class="widget-toolbar"> 
                                                    <a href="#" onclick="closes()" title="关闭"><i class="ace-icon fa fa-close"></i></a>
                                                </span>
                                            </div>
                                            <div class="widget-body">
                                                <div class="widget-main">
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">名称</span>
                                                            <input class="form-control input-mask-phone" type="text" id="xxqdname" placeholder="请输入" runat="server" />
                                                        </div>
                                                    </div>
                                                    &nbsp; 
                                                    <div>
                                                        <ul>
                                                            <li style="text-align:center;">
                                                                <button class="btn btn-info update_s" type="button" onclick="update_xxqd()"><i class="ace-icon fa fa-check bigger-110"></i>保存</button>
                                                                <button class="btn btn-info add_s" type="button" onclick="add_xxqd()"><i class="ace-icon fa fa-check bigger-110"></i>保存</button>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                </div>
                                <!-- /信息渠道 --> 
                                <!-- 用户编辑-->
                                <div class="row" style="min-height:666px;">
                                    <h3 class="header smaller lighter blue"><a class="btn btn-info" href="wd_zfxclist.aspx"><i class="ace-icon fa fa-reply icon-only"></i>&nbsp;上级返回</a>
                                        <a class="btn btn-info " href="javascript:;" onclick="xxqdadd()">增加</a>                    
                                        <a class="btn btn-info _UserList" href="javascript:;"><i class="ace-icon"></i>&nbsp;走访类型维护</a>   
                                    </h3> 
                                    <h3 class="centersa">走访人员信息列表</h3>
                                    <!--添加-->
                                    <!--已保存的列表-->
                                    <div class="col-xs-12 col-sm-6 widget-container-col Is_Hilist auto_list">
                                        <div class="widget-box widget-color-blue">
                                            <div class="widget-header">
                                                <h5 class="widget-title bigger lighter">
                                                    <span style="color: #FFFFFF; font-weight: bolder;"><i class="ace-icon fa fa-table"></i>用户列表</span>
                                                </h5>
                                            </div>
                                            <div class="widget-body">
                                                <div class="widget-main no-padding">
                                                    <table class="table table-striped table-bordered table-hover" id="tb2">
                                                        <thead class="thin-border-bottom">
                                                            <tr>
                                                                <th class="input-group-addon"><i class="ace-icon fa fa-flag"></i>序号</th>
                                                                <%--<th class="input-group-addon hidden-480">站区</th>--%>
                                                                <th class="input-group-addon">姓名</th>
                                                                <th class="input-group-addon">类型</th>
                                                                <th class="input-group-addon hidden-480">联系方式</th>
                                                                <th class="input-group-addon">操作</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 Is_HS auto_add" style="">
                                        <div class="widget-box">
                                            <div class="widget-header">
                                                <h4 class="widget-title">走访人员信息编辑</h4>
                                                <span class="widget-toolbar"> 
                                                    <a href="#" onclick="closes()" title="关闭"><i class="ace-icon fa fa-close"></i></a>
                                                </span>
                                            </div>
                                            <div class="widget-body">
                                                <div class="widget-main user_verification">
                                                    <div>
                                                        <div class="input-group zq_user">
                                                            <span class="input-group-addon">站区</span> 
                                                        </div>
                                                    </div>&nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">姓名</span>
                                                            <input class="form-control input-mask-phone" type="text" id="txtname" placeholder="请输入" autocomplete="off" />
                                                        </div>
                                                    </div>&nbsp;
                                                    <div>
                                                        <div class="input-group xxqd_user">
                                                            <span class="input-group-addon">类型</span>                                                            
                                                        </div>
                                                    </div>
                                                    &nbsp; 
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">联系方式</span>
                                                            <textarea class="form-control input-mask-phone" rows="2" id="txtaphone" placeholder="请输入"></textarea>
                                                        </div>
                                                    </div>
                                                    &nbsp;
                                                    <div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">备注</span>
                                                            <textarea class="form-control input-mask-phone" rows="3" id="txtaremark"></textarea>
                                                        </div>
                                                    </div> 
                                                    &nbsp;
                                                    <div>
                                                        <ul style="text-align:center;">
                                                            <li>
                                                                <button class="btn btn-info update_s" type="button" onclick="update_user()"><i class="ace-icon fa fa-check bigger-110"></i>保存</button>
                                                                <button class="btn btn-info add_s" type="button" onclick="add_user()"><i class="ace-icon fa fa-check bigger-110"></i>保存</button>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                </div>
                                <!-- 用户编辑-->
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<script src="../assets/js/jquery-2.1.4.min.js" type="text/javascript"></script>
<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='../assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../assets/js/jquery-ui.custom.min.js" type="text/javascript"></script>
<script src="../assets/js/jquery.ui.touch-punch.min.js" type="text/javascript"></script>
<script src="../assets/js/ace-elements.min.js" type="text/javascript"></script>
<script src="../assets/js/ace.min.js" type="text/javascript"></script>
<script src="../js/mui.enterfocus.js" type="text/javascript"></script>
<script src="../js/mui.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        $('.Is_HS').hide();
        $('._UserList').click(function () {//上一个
            $(this).parent().parent('.row').hide();
            $(this).parent().parent('.row').siblings().show(500);
        }) 
        xxqdDaTa();
        ZQData();
        UserDaTa();
    }) 

</script>
<script src="user.js" type="text/javascript"></script>
