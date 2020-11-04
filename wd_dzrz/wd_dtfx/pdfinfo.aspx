<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pdfinfo.aspx.cs" Inherits="MarketInfo.wd_dzrz.wd_dtfx.pdfinfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
 <script src="../../js/jquery-3.3.1.min.js" type="text/javascript"></script>
 <script type="text/javascript">

    function getCharFromUtf8(str) {
		var cstr = "";
		var nOffset = 0;
		if (str == "")
			return "";
		str = str.toLowerCase();
		nOffset = str.indexOf("%e");
		if (nOffset == -1)
			return str;
		while (nOffset != -1) {
			cstr += str.substr(0, nOffset);
			str = str.substr(nOffset, str.length - nOffset);
			if (str == "" || str.length < 9)
				return cstr;
			cstr += utf8ToChar(str.substr(0, 9));
			str = str.substr(9, str.length - 9);
			nOffset = str.indexOf("%e");
		}
		return cstr + str;
	}
 
	//将编码转换成字符
	function utf8ToChar(str) {
		var iCode, iCode1, iCode2;
		iCode = parseInt("0x" + str.substr(1, 2));
		iCode1 = parseInt("0x" + str.substr(4, 2));
		iCode2 = parseInt("0x" + str.substr(7, 2));
		return String.fromCharCode(((iCode & 0x0F) << 12) | ((iCode1 & 0x3F) << 6) | (iCode2 & 0x3F));
	}


        function GetQueryString(name) {
             // 获取参数
         var str = window.location.search;
         var a= getCharFromUtf8(str);
         return a;
        }
        var wurl = GetQueryString("wurl");
        var url= wurl.slice("6");//移除前6位?wurl=
        //alert(url);
        //地址必须为域名，不可为ip，否则无法提取。
        let obj = document.getElementById("obj");
        obj.data = url; 
        //信息渠道遍历数据
        let ifr =document.getElementById("ifr");
        ifr.src = url; 
    </script>
</body>
</html>
