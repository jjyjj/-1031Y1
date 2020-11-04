function my_login() {
    var myname = document.getElementById("m_name").value;
    var mypwd = document.getElementById("m_pwd").value;
    if (myname != "" && mypwd != "") {
        $.post("it/denglu.aspx?UNAME=" + myname + "&UPWD=" + mypwd, {}, function (data) {
            // alert(data);
            if (data == "YES") {
                location.href = "fr_main/wd_desktop.aspx";
            } else {
                alert("用户名或密码错误！请重新输入！");
            }
        });
    }
}

function trim(s) {
    return trimRight(trimLeft(s));
}
function trimLeft(s) {
    if (s == null) {
        return "";
    }
    var whitespace = new String(" \t\n\r");
    var str = new String(s);
    if (whitespace.indexOf(str.charAt(0)) != -1) {
        var j = 0, i = str.length;
        while (j < i && whitespace.indexOf(str.charAt(j)) != -1) {
            j++;
        }
        str = str.substring(j, i);
    }
    return str;
}

//去掉右边的空白 www.2cto.com   
function trimRight(s) {
    if (s == null) return "";
    var whitespace = new String(" \t\n\r");
    var str = new String(s);
    if (whitespace.indexOf(str.charAt(str.length - 1)) != -1) {
        var i = str.length - 1;
        while (i >= 0 && whitespace.indexOf(str.charAt(i)) != -1) {
            i--;
        }
        str = str.substring(0, i + 1);
    }
    return str;
} 
