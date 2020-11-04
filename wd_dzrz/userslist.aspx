<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userslist.aspx.cs" Inherits="MarketInfo.wd_dzrz.userslist" %>

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
<title>一键下发指令</title>
    <script type="text/javascript">
        function f_isDel(strname) {
            if (confirm("是否删除用户[" + strname + "]?")) {
                location.href = "wd_deluser.aspx?T_UNAME=" + strname;
            }
        }
    </script>
    </head>
<body><form id="Form1" runat="server">
<div class="margin clearfix">
 <div class="sort_style">
  <div class="border clearfix">
  <span class="l_f">&nbsp;&nbsp; <label>系统用户管理</label>
       </span>

<span class="r_f">
    <a href="wd_newuser.aspx" title="添加新用户" class="btn btn-warning Order_form"><i class="icon-plus"></i>添加新用户</a>
</span>

       </div>
     <!--分类类表-->
     <div class="article_sort_list">
         <table class="table table-striped table-bordered table-hover" id="sample-table">
       <thead>
		 <tr>
				<th width="80px">序号</th>
				<th width="150px">用户名称</th>
				<th>用户密码</th>
				<th>创建时间</th>
                <th width="80px">修改</th>
                <th width="80px">删除</th>
			</tr>
		</thead>
        <tbody>
            <%if (tb != null)
              {
                  for (int i = 0; i < tb.Rows.Count; i++)
                  {
                     
         %>
         <tr>
          <td><%=i+1%></td>
          <td onclick="f_ShowDlg('<%=tb.Rows[i]["T_ID"]%>');" nowrap="nowrap" 
                 
                 style=" width: 200px;"><%=tb.Rows[i]["T_UNAME"]%></td>
          <td onclick="f_ShowDlg('<%=tb.Rows[i]["T_ID"]%>');" width="1" height="24" 
                 style="width: 200px; overflow: hidden; word-break: keep-all; cursor: pointer; " 
                 title=""><%=tb.Rows[i]["T_PWD"]%>
              </td>
          <td width="1" height="24" 
                 style="width: 200px;" 
                 title=""><%=tb.Rows[i]["T_CRTTIME"]%>
              </td>
         <td><a href="wd_newuser.aspx?T_UNAME=<%=tb.Rows[i]["T_UNAME"]%>&T_PWD=<%=tb.Rows[i]["T_PWD"]%>">
                    <img alt="" class="style1" src="images/f03.png" 
                        style="border-width: 0px; cursor: pointer" /></a></td>
         <td><img alt="" onclick="f_isDel('<%=tb.Rows[i]["T_UNAME"]%>')" class="style2" src="images/close.png" 
                        style="cursor: pointer" /></td>
         </tr>
            <%
                      }
              }%>  
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
	{"orderable": false, "aTargets": [0, 1, 2, 3, 4, 5]}// 制定列不参与排序
  ]
        });
    })
    /**添加分类**/
    function f_ShowDlg(id) {
        var url = "";
        layer.open({
            type: 2,
            title: '高速公路管制信息',
            maxmin: true,
            shadeClose: true, //点击遮罩关闭层
            area: ['92%', '92%'],
            content: "wd_gzinfo.aspx?KeyID=" + id,
            //		btn:['关闭'],
            yes: function (index, layero) {
                layer.close(index);
            }
        })
    }

</script>
