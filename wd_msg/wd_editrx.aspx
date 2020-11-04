<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_editrx.aspx.cs" Inherits="MarketInfo.wd_msg.wd_editrx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>河南高速</title>
    <script src="../js/jquery1.42.min.js" type="text/javascript"></script>
    <script src="../ueditor/ueditor.config.js" type="text/javascript"></script>
    <script src="../ueditor/ueditor.all.min.js" type="text/javascript"></script>
    <script src="../ueditor/lang/zh-cn/zh-cn.js" type="text/javascript"></script>
    <style type="text/css">
        div{
            width:100%;
        }
        .NULLSIZE
        {
            width: 0px;
            height: 0px;
            display: none;
        }
    </style>
    <script type="text/javascript">

        //实例化编辑器
        //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
        var objue = UE.getEditor('editor');
        function isFocus(e) {
            alert(UE.getEditor('editor').isFocus());
            UE.dom.domUtils.preventDefault(e)
        }
        function setblur(e) {
            UE.getEditor('editor').blur();
            UE.dom.domUtils.preventDefault(e)
        }
        function insertHtml() {
            var value = prompt('插入html代码', '');
            UE.getEditor('editor').execCommand('insertHtml', value)
        }
        function createEditor() {
            enableBtn();
            UE.getEditor('editor');
        }
        function getAllHtml() {
            //getContent();
            //alert(UE.getEditor('editor').getAllHtml())
            var ct = UE.getEditor('editor').getContent();
            if (ct == "" || ct == null) {
                alert("没有输入信息！");
                return false;
            }
            document.getElementById("<%=m_data.ClientID %>").value = UE.getEditor('editor').getContent();


            //alert
            return true;

        }
        function getContent() {
            var arr = [];
            arr.push("使用editor.getContent()方法可以获得编辑器的内容");
            arr.push("内容为：");
            arr.push(UE.getEditor('editor').getContent());
            alert(arr.join("\n"));
        }
        function getPlainTxt() {
            var arr = [];
            arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
            arr.push("内容为：");
            arr.push(UE.getEditor('editor').getPlainTxt());
            alert(arr.join('\n'))
        }
        function setContent(isAppendTo) {
            var arr = [];
            arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
            UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
            alert(arr.join("\n"));
        }
        function setDisabled() {
            UE.getEditor('editor').setDisabled('fullscreen');
            disableBtn("enable");
        }

        function setEnabled() {
            UE.getEditor('editor').setEnabled();
            enableBtn();
        }

        function getText() {
            //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
            var range = UE.getEditor('editor').selection.getRange();
            range.select();
            var txt = UE.getEditor('editor').selection.getText();
            alert(txt)
        }

        function getContentTxt() {
            var arr = [];
            arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
            arr.push("编辑器的纯文本内容为：");
            arr.push(UE.getEditor('editor').getContentTxt());
            alert(arr.join("\n"));
        }
        function hasContent() {
            var arr = [];
            arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
            arr.push("判断结果为：");
            arr.push(UE.getEditor('editor').hasContents());
            alert(arr.join("\n"));
        }
        function setFocus() {
            UE.getEditor('editor').focus();
        }
        function deleteEditor() {
            disableBtn();
            UE.getEditor('editor').destroy();
        }
        function disableBtn(str) {
            var div = document.getElementById('btns');
            var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
            for (var i = 0, btn; btn = btns[i++]; ) {
                if (btn.id == str) {
                    UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
                } else {
                    btn.setAttribute("disabled", "true");
                }
            }
        }
        function enableBtn() {
            var div = document.getElementById('btns');
            var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
            for (var i = 0, btn; btn = btns[i++]; ) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            }
        }
        function getLocalData() {
            alert(UE.getEditor('editor').execCommand("getlocaldata"));
        }

        function clearLocalData() {
            UE.getEditor('editor').execCommand("clearlocaldata");
            alert("已清空草稿箱")
        }

        //初始化
        function f_init() {
            var vals = $("#m_data").val();
            setFocus();
            UE.getEditor('editor').setContent(vals);
            //setContent(true);
        }
        objue.ready(function () {
            //设置编辑器的内容"
            f_init();

        });
        function f_Close(msg) {
            alert(msg);
        } 
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2>
             <asp:Button ID="ButtonSV" runat="server" Height="32px" onclientclick="return getAllHtml();"  
                    Text="保存数据" Width="100px" onclick="ButtonSV_Click" />
            &nbsp;<asp:Button ID="ButtonFH" runat="server" Height="32px"  
                    Text="返回上级" Width="100px" onclick="ButtonFH_Click" />
            </h2>
    </div>
   <asp:HiddenField ID="m_data" runat="server" />
                <asp:TextBox ID="m_info" runat="server" AutoPostBack="True" width="0.1px" CssClass="NULLSIZE"></asp:TextBox>
        <div>
    <script id="editor" type="text/plain" style="width:100%;height:400px;"></script>
</div>

    </form>
        </body>
</html>
<script type="text/javascript">
    f_init();
    //    var objue = UE.getEditor('editor');
    //    objue.setContent("testdsdf");
</script>