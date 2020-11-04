<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_bg.aspx.cs" Inherits="MarketInfo.wd_user.wd_bg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="../lib/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="../lib/css/style.css"/>       
<link href="../lib/assets/css/codemirror.css" rel="stylesheet">
<link rel="stylesheet" href="../lib/assets/css/ace.min.css" />
<link rel="stylesheet" href="../lib/font/css/font-awesome.min.css" />
<script type="text/javascript" src="../lib/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../lib/Widget/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript" src="../lib/assets/js/typeahead-bs2.min.js"></script>           	
<script type="text/javascript" src="../lib/assets/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../lib/assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="../lib/assets/layer/layer.js" type="text/javascript" ></script>          
<script src="../lib/js/lrtk.js" type="text/javascript" ></script>
<script src="../lib/assets/layer/layer.js" type="text/javascript"></script>	
<script src="../lib/assets/laydate/laydate.js" type="text/javascript"></script>
<script src="../lib/assets/layer/layer.js" type="text/javascript"></script>
    <script src="../js/jquery1.42.min.js" type="text/javascript"></script>
    <script src="../jquery/js/jquery.mobile-1.4.5.js" type="text/javascript"></script>
<title></title>
    </head>
<body><form id="Form1" runat="server">
<div class="margin clearfix">
 <div class="sort_style">
  <div class="border clearfix">
<span class="l_f">
    单位变更
&nbsp;&nbsp;&nbsp;
 
                  <a class="btn btn-info"  href="wd_upinfo.aspx" 
                  >返回</a>
</span>
       </div>
     <!--分类类表-->
     <div class="article_sort_list">
         <table class="table table-striped table-bordered table-hover" id="sample-table">
       <thead>
		 <tr>
				<th>&nbsp;</th>
				<th>&nbsp;</th>
			</tr>
		</thead>
        <tbody>            
            <tr>
            <td style="width: 100px">选择单位：</td>
          <td style="vertical-align: middle; text-align: left">
          <asp:DropDownList ID="C_COUNTRY" runat="server" 
                           Width="160px"></asp:DropDownList>
                           
                           </td>
            </tr>
            <tr>
            <td style="width: 100px">变更原因：</td>
          <td style="vertical-align: middle; text-align: left">
              <asp:TextBox ID="reason" runat="server" Columns="4" TextMode="MultiLine" style="word-wrap:break-word;height:80px;word-break:break-all;" Wrap="true"  Width="260px" Height="190px"></asp:TextBox>
         </td>
            </tr>
           
         <tr>
            <td style="width: 100px">&nbsp;</td>
          <td style="vertical-align: middle; text-align: left"><button class="btn btn-info" type="button" onclick="f_submint();">
												    <i class="ace-icon fa fa-check bigger-110"></i>
												           提交
											               </button> &nbsp;
                                                           <button class="btn btn-info" type="reset" onclick="f_fanhui();">
												  <i class="ace-icon fa fa-undo bigger-110"></i>
												           返回
											                </button></td>
         </tr>
        </tbody>
        </table>
     </div>
 </div>
</div></form>
</body>
</html>
		<script type="text/javascript">
		    if ('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
		</script>
		<script src="../assets/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->
        <script src="../assets/js/jquery-ui.custom.min.js" type="text/javascript"></script>
		<script src="../assets/js/jquery.ui.touch-punch.min.js"></script>

		<!-- ace scripts -->
		<script src="../assets/js/ace-elements.min.js"></script>
		<script src="../assets/js/ace.min.js"></script>

        <script src="../js/mui.enterfocus.js" type="text/javascript"></script>
    <script src="../js/mui.min.js" type="text/javascript"></script>
 <script type="text/javascript">
     function f_submint(type) {
         var id = $("#C_COUNTRY").val();
        
         alert(id);
        // mui.toast(pid);
         var Reason = $("#reason").val();
         if (Reason == "") {
             mui.toast("请填原因!");
             return;
         }
         $.post("Handler1.ashx", { id: id, Reason: Reason }, function (data) {
             // alert(data);<a href="../it/it_submint.aspx">../it/it_submint.aspx</a>
             if (data == "1") {
                 mui.toast("申请成功，等待审批结果!");
                 location.reload();
             }
             if (data == "-1") {
                 mui.toast("申请失败，退出重试!");
             }
             layer.close(index);
         });
     }
     function f_fanhui() {
        window.location.href = "wd_upinfo.aspx";
     
     }
        </script>
