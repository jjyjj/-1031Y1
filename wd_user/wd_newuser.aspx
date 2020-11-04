<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_newuser.aspx.cs" Inherits="WeiXinGIS.wd_user.wd_newuser" %>

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
<script type="text/javascript" src="../lib/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../lib/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../lib/Widget/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript" src="../lib/assets/js/typeahead-bs2.min.js"></script>           	
<script type="text/javascript" src="../lib/assets/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../lib/assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="../lib/assets/layer/layer.js" type="text/javascript" ></script>          
<script src="../lib/js/lrtk.js" type="text/javascript" ></script>
<script src="../lib/assets/layer/layer.js" type="text/javascript"></script>	
<script src="../lib/assets/laydate/laydate.js" type="text/javascript"></script>
<script src="js/it.js" type="text/javascript"></script>
<title>一键下发指令</title>
<script type="text/javascript">
    function f_IsNull() {
        var m_name = document.getElementById("<%=m_T_UNAME.ClientID%>").value;
        var pwd = document.getElementById("<%=m_T_PWD.ClientID%>").value;
        var pwd2 = document.getElementById("<%=m_T_PWD2.ClientID%>").value;
        if (m_name == "" || pwd == "" || pwd2 == "") {
            alert("用户名或密码不能为空!");
            return false;
        }
        if (pwd != pwd2) {
            alert("两次密码输入不一致错误!");
            return false;
        }
        return true;
    }
    </script>
    </head>
<body><form id="Form1" runat="server">
<div class="margin clearfix">
 <div class="sort_style">
  <div class="border clearfix">
<span class="l_f">
    <a href="wd_listuser.aspx" title="返回上级" class="btn btn-warning Order_form"><i class="icon-plus"></i>返回上级</a>
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
            <td style="width: 100px">用户名称：</td>
          <td style="vertical-align: middle; text-align: left"><asp:TextBox ID="m_T_UNAME" runat="server" Width="160px"></asp:TextBox></td>
            </tr>
            <tr>
            <td style="width: 100px">用户密码：</td>
          <td style="vertical-align: middle; text-align: left"><asp:TextBox ID="m_T_PWD" runat="server" TextMode="Password" Width="160px"></asp:TextBox></td>
            </tr>
            <tr>
            <td style="width: 100px">确认密码：</td>
          <td style="vertical-align: middle; text-align: left"><asp:TextBox ID="m_T_PWD2" runat="server" TextMode="Password" Width="160px"></asp:TextBox></td>
            </tr>
         <tr>
            <td style="width: 100px">&nbsp;</td>
          <td style="vertical-align: middle; text-align: left"><asp:Button ID="Button_save" 
                  runat="server" Text="保  存" 
                        onclientclick="return f_IsNull();" onclick="Button_save_Click" 
                  CssClass="btn btn-success Order_form" />&nbsp;</td>
         </tr>
        </tbody>
        </table>
     </div>
 </div>
</div></form>
</body>
</html>
<script type="text/javascript">
    $(function () {
        var oTable1 = $('#sample-table').dataTable({
            "aaSorting": [[1, "desc"]], //默认第几个排序
            "bStateSave": true, //状态保存
            "aoColumnDefs": [
            //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
	{"orderable": false, "aTargets": [0, 1}// 制定列不参与排序
  ]
        });
    })

</script>

