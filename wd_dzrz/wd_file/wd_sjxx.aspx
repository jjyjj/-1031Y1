<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_sjxx.aspx.cs" Inherits="MarketInfo.wd_dzrz.wd_file.wd_sjxx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title></title>
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
    <link rel="stylesheet" href="../assets/css/ace.min.css" class="ace-main-stylesheet"  />
    <!--[if lte IE 9]>
			<link rel="stylesheet" href="/assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
    <link rel="stylesheet" href="../assets/css/ace-skins.min.css" />
    <link rel="stylesheet" href="../lib/assets/css/ace-rtl.min.css" />
    <link href="../css/mui.min.css" rel="stylesheet" type="text/css" />
        <style type="text/css">
    ul li{ list-style-type:none;}
    .OverHideTd{ word-break:break-all; font-size: 14px; color:#555; text-align: center; background-color: #eee;font-weight: 400;} 
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
                            <div class="invisible" id="main-widget-container">
                                

                                <div class="row">
                                <h3 class="header smaller lighter blue"> <a class="btn btn-info" href="../wd_tzxx.aspx"><i class="ace-icon fa fa-reply icon-only"></i>&nbsp;返回首页</a>&nbsp;&nbsp;&nbsp;
                                   <a class="btn btn-info" onclick="go_shenpi()"><i class="ace-icon fa fa-reply icon-only"></i>&nbsp;返回</a></h3>
						
                                <a class="btn btn-info xxwj_hide" href="javascript:;" onclick="add('1')"><i class="ace-icon"></i>&nbsp;新增资料学习</a>  
                                 </h3>                                   
                                    
                                     <!--已保存的列表-->
                                     <div class="col-xs-12 col-sm-6 widget-container-col Is_Hilist auto_list" >
                                        <div class="widget-box widget-color-blue" id="Div2">
                                            <div class="widget-header">
                                                <h5 class="widget-title bigger lighter">
                                                    <span style="color: #FFFFFF; font-weight: bolder;"><i class="ace-icon fa fa-table"></i>资料学习</span>
                                                </h5>
                                            </div>
                                            <div class="widget-body">
                                                <div class="widget-main no-padding">
                                                    <table class="table table-striped table-bordered table-hover" id="tb">
                                                        <thead class="thin-border-bottom">
                                                            <tr>
                                                            <th class="input-group-addon"><i class="ace-icon fa fa-flag"></i>序号</th>
                                                                <th class="input-group-addon">名称</th> 
                                                                <th class="input-group-addon">类型</th>  
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
                                    <form id="form1" runat="server">
                                    <input type="hidden" id="HideTid" value="" runat="server" />
                                         <input type="hidden" id="hid_tid" value="" runat="server" />
                                    <div class="col-xs-12 col-sm-4 Is_HS auto_add" >
                                        <div class="widget-box">
                                            <div class="widget-header">
                                                <h4 class="widget-title"> </h4>
                                                <span class="widget-toolbar">
                                                <a href="#" data-action="settings"><i class="ace-icon fa fa-cog"></i></a>
                                                <a href="#" data-action="reload"><i class="ace-icon fa fa-refresh"></i></a>
                                                <a href="#" data-action="collapse"><i class="ace-icon fa fa-chevron-up"></i></a>
                                                <a href="#"  onclick="closes()" title="关闭"><i class="ace-icon fa fa-close"></i></a>
                                                </span>
                                            </div>
                                            <div class="widget-body">
                                                <div class="widget-main">
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">标题</span> 
                                                            <input type="text" class="form-control input-mask-phone" name="txtTitle" id="txtTitle" placeholder="请输入" autocomplete="off"  runat="server"/>
                                                        </div></div> &nbsp; 
                                                        <div><div class="input-group file_types">
                                                            <span class="input-group-addon">类型</span> 
                                                            <select id="txttype" class="form-control input-mask-phone" name="txttype" style="border:1px solid #D5D5D5 !important" runat="server">
                                                            <option value="-1">【请选择】</option>
                                                            <option value="0">专业资料</option>
                                                            <option value="1">事故事件</option>
                                                            </select>
                                                        </div></div> &nbsp; 
                                                    <div class="col-sm-12">
                                                        <div class="form-group">
                                                            <div class="col-xs-12">
                                                                <label class="ace-file-input ace-file-multiple" >
                                                                <input type="file" id="file_as" name="file" accept="image/*,.pdf,.zip,.7z,.doc,.mp4,.mpg"   runat="server"/>
                                                                <span class="ace-file-container" data-title="Drop files here or click to choose"  style=" display:none;">
                                                                <span class="ace-file-name" data-title="No File ..."><i class=" ace-icon ace-icon fa fa-cloud-upload"></i>
                                                                </span></span><a class="remove" href="#"><i class=" ace-icon fa fa-times"></i></a>
                                                                </label>
                                                            </div>
                                                        </div>
                                                  </div>
                                                    <div style=" text-align:center;"> 
                                                    <asp:Button ID="btn_save" Text="保存" runat="server" onclick="btn_save_Click" />                                                     
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>  
                                     
                                    </form>
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse"><i class="ace-icon fa fa-angle-double-up icon-only bigger-110">
        </i></a>
    </div>

</body>
</html>
    <script src="../assets/js/ace-extra.min.js" type="text/javascript"></script>
<script src="../assets/js/jquery-2.1.4.min.js" type="text/javascript"></script>
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
<script src="../js/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        _Bind();
        DaTa();
        $('#btn_save').click(function () {
            var txtTitle = $('#txtTitle').val();
            var txttype = $('#txttype').val();
            var file_as = $('#file_as').val().length;
            if (!txtTitle || txttype == '-1' || !file_as > 0) {
                mui.toast('请输入完整的信息');
                return false;
            }
        })
    })

    function go_shenpi() {
        var HideTid = $('#hid_tid').val();
        location.href = "../../wd_shenpi/wd_shenpi.aspx?TID=" + HideTid;
    }
</script>
<script src="file.js" type="text/javascript"></script>
<script src="../wd_disanf/JSS.js" type="text/javascript"></script>
