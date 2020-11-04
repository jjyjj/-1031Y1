<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_list.aspx.cs" Inherits="MarketInfo.wd_msg.wd_list" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../../css/newversion.css" rel="stylesheet" type="text/css" />
    <link href="../../InfoInput/css/ui.css" rel="stylesheet" type="text/css" />
    <link href="css/msg.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #gvList
        {
            border: none;
        }
        .btn_Yuan
        {
            border: 1px solid #FFFFFF;
            background-color: #41B35C;
            font-family: 微软雅黑;
            font-size: small;
            color: #FFFFFF;
            cursor: pointer;
        }
        .auto-style2
        {
            width: 49px;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".tab tr").mouseover(function () { //如果鼠标移到class为stripe_tb的表格的tr上时，执行函数
                $(this).addClass("over");
            }).mouseout(function () { //给这行添加class值为over，并且当鼠标一出该行时执行函数
                $(this).removeClass("over");
            }) //移除该行的class
            $(".tab tr:even").addClass("alt"); //给class为stripe_tb的表格的偶数行添加class值为alt
        });
       
    </script>
    <script type="text/javascript">
        function f_delgs(HW_ID) {
            if (confirm("是否删除这条记录?")) {
                location.href = "gs_del.aspx?HW_ID=" + HW_ID;
            }
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="DIV_MYTOP" class="DIV_MYTOP">
        <table style="width: 100%; border-collapse: collapse;">
            <tr>
                <td height="30" colspan="1" width="170" >
                    &nbsp;                   
                  
                    <asp:RadioButton ID="rb_dangri" runat="server" Text="当前指令" AutoPostBack="True" 
                        Checked="True" CssClass="MOUSE" GroupName="ZL" 
                        oncheckedchanged="rb_dangri_CheckedChanged" />
                  
                    &nbsp;
                  
                    <asp:RadioButton ID="rb_all" runat="server" Text="全部指令" AutoPostBack="True" 
                        CssClass="MOUSE" GroupName="ZL" oncheckedchanged="rb_all_CheckedChanged" />
                  
                </td>
                <td>&nbsp;</td>
                
               <td height="30" style="vertical-align: bottom; text-align: center" width="100">
                    <asp:Button ID="bnt_xs" style="width: 80px" runat="server" Text="显示地图" 
                        onclick="bnt_xs_Click"  class="btn_Yuan"/>
               </td>
                <td height="30" style="vertical-align: bottom; text-align: center" width="100">
                    <asp:Button ID="bnt_yc" style="width: 80px" runat="server" Text="隐藏地图" 
                        onclick="bnt_yc_Click"  class="btn_Yuan"/>
               </td>
                <td height="30" style="vertical-align: bottom; text-align: center" width="100">
                   
                    <input id="Button_fresh0" onclick="location.reload();"; class="btn_Yuan" 
                        style="width: 60px" type="button" 
                        value="刷 新"  /></td>
            </tr>             
        </table>                    
    </div>
    <div id="DIV_Main" class="DIV_MYDOWN" style="font-size: small;">
    <table class=""             
            style="width: 100%; border-collapse: collapse;overflow:auto; font-size: small; background-color: #C0C0C0;">
            <tr bgcolor="#999999">
                <td height="32" style="vertical-align: middle; text-align: center" width="50">
                    <span style="font-size:small; color: #FFFFFF;">序号</span></td>
                <td height="32" style="vertical-align: middle; text-align: left" >
                    <span style="font-size:small; color: #FFFFFF;">指令内容</span></td>
                <td height="32" style="vertical-align: middle; text-align: left" width="180">
                    <span style="font-size:small; color: #FFFFFF;">下发者</span></td>
                <td height="32" style="vertical-align: middle; text-align: left" width="180">
                    <span style="font-size:small; color: #FFFFFF;">下发时间</span></td>
                     <td height="32" style="vertical-align: middle; text-align: left" width="60">
                    <span style="font-size:small; color: #FFFFFF;">路况</span></td>
                   <td height="32" style="vertical-align: middle; text-align: left" width="60">
                    <span style="font-size:small; color: #FFFFFF;">其他</span></td>
               
            </tr>
      </table>
    <asp:DataList ID="DataList1" runat="server" Width="100%">
        <ItemTemplate>
            <table 
            style="width: 100%; border-collapse: collapse;">
                 <tr style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #CCCCCC" class="TR">
                <td height="28" style="vertical-align: middle; text-align: center" width="50">
                    <%# Container.ItemIndex+1 %></td>
                <td height="28"  style="vertical-align: middle; text-align: left" >
                 <%-- <%#WXDBUtility.SqlHelper.GetLenStrdate(Eval("LK").ToString(),50)%>--%>
                  
                  一、路况信息
                  </td>
                <td height="28" style="vertical-align: middle; text-align: left" width="180">
                    <%#Eval("Edit_user")%></td>
                <td height="28" style="vertical-align: middle; text-align: left" width="180">
                    <%#Eval("LK_TIME")%></td>
                <td height="28" style="vertical-align: middle; text-align: left" width="60">
                     <span onclick="parent.f_ShowEdit('1');"  style="text-decoration: underline; color: #0000FF; font-size: small"><img src="../images/t02.png" /></span>
                   </td>
                    <td height="28" style="vertical-align: middle; text-align: left" width="60">
                     <span onclick="parent.f_Edit_sg('1');"  style="text-decoration: underline; color: #0000FF; font-size: small"><img src="../images/t02.png" /></span>
                   </td>
            </tr>
        </table>  
        </ItemTemplate>
    </asp:DataList>
    </div>
        <div id="DIV_BOT"         
        
        
        style="position: fixed; z-index: 1; right: 5px; bottom: 0px; left: 5px; height: 30px; border-top-style: solid; border-top-width: 1px; border-top-color: #808080; background-color: #FFFFFF;">
       <webdiyer:AspNetPager ID="AspNetPager1" CssClass="paipai" runat="server" 
                CustomInfoHTML="共%PageCount%页，每页%PageSize%条，结果共%RecordCount%条" FirstPageText="首页" LastPageText="尾页" 
                NextPageText="下一页" PageIndexBoxType="DropDownList" PageSize="20" 
                PrevPageText="上一页" ShowCustomInfoSection="Left" ShowPageIndexBox="Always" 
                SubmitButtonText="Go" TextAfterPageIndexBox="页" TextBeforePageIndexBox="转到" 
                OnPageChanged="AspNetPager1_PageChanged" CustomInfoSectionWidth="35%" AlwaysShow="True">
        </webdiyer:AspNetPager>
        </div>
    
    </form>
</body>
</html>
