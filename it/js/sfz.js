var m_FreshTimeNum = parent.m_SelectTimeSpan;
var m_deptID = "0";
var m_is_Sender = "0";
var m_loginUserSFZH = "";
//获取上级有关信息
var timer1 = null;
function f_SetSpanTimeNum() {
    var obj = document.getElementById("m_timespan");
    if (obj == null) return;
    if (obj.selectedIndex == null) {
        m_FreshTimeNum = parent.m_SelectTimeSpan;
    }
    else {
        var index = obj.selectedIndex; // 选中索引
        var valueSec = obj.options[index].value; // 选中值
        parent.m_SelectTimeSpan = m_FreshTimeNum;
        m_FreshTimeNum = parseInt(valueSec);   
    }      
     
    f_SetTimer();
    m_deptID = parent.f_GetDeptID();
    m_is_Sender = parent.f_getIsSender();
    m_loginUserSFZH = parent.f_getSFZID();
    //alert(m_loginUserSFZH);
}

//建立一个js的定时器
function f_SetTimer()
{
    if (timer1 != null) {
        clearInterval(timer1);
    }
    timer1 = setInterval(f_FreshTable, m_FreshTimeNum * 1000);
    //刷新页面
}

function f_FreshTable() {
    // alert("test");
    var obj = document.getElementById("DIV_CUR_TIME");
    obj.innerHTML = "当前: " + getNowFormatDate();
    var div_msg_main = document.getElementById("div_msg_main");
    //div_msg_main.innerHTML = obj.innerHTML;
    //var url = "wd_msgmain.aspx?T_DEPT_ID=" + m_deptID + "&T_DUTY_ID=" + m_loginUserSFZH;
    //this.location.href = url;
    //这一段使用jquery去刷新
}

function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + date.getHours() + seperator2 + date.getMinutes()
            + seperator2 + date.getSeconds();
    return currentdate;
}

function JsListChangeItem() {
    f_ShowDiv("div_map"); 
}

function f_CloseDiv(strName) {
    var obj = document.getElementById(strName);
    obj.style.display = "none";
}

function f_ShowDiv(strName) {
    var obj = document.getElementById(strName);
    obj.style.display = "block";
}

function f_LoadCmd(cmd) {
    if (cmd == "1") {
        f_ShowDiv("divluduan");
        f_CloseDiv("div_sfz");
        f_CloseDiv("divquansheng");
        f_CloseDiv("divqxluduan");
    }
    if (cmd == "2") {
        f_ShowDiv("div_sfz");
        f_CloseDiv("divluduan");
        f_CloseDiv("divquansheng");
        f_CloseDiv("divqxluduan");
    }
    if (cmd == "3") {
        f_ShowDiv("divquansheng");
        f_CloseDiv("divluduan");
        f_CloseDiv("div_sfz");
        f_CloseDiv("divqxluduan");
    }
    if (cmd == "4") {
        f_ShowDiv("divqxluduan");
        f_CloseDiv("divluduan");
        f_CloseDiv("div_sfz");
        f_CloseDiv("divquansheng");
    }
    //alert(cmd);
    //var obj = document.getElementById(strName);
    //obj.style.display = "block";



}

function f_sel() {
    //
    var obj = document.getElementById("Checkbox_all");
    var yes = obj.checked;
    var str = document.getElementsByName("sfz");
    var objarray = str.length;
    var chestr = "";
    for (i = 0; i < objarray; i++) {
        str[i].checked = yes;
    }

//    var strgs = document.getElementsByName("gs");
//    var objarraygs = strgs.length;
//    var chegsstr = "";
//    for (n = 0; n < objarraygs; n++) {
//        chegsstr[n].checked = yes;
//    }
}

function f_selgs(gsid) {
    //
    var obj = document.getElementById(gsid);
    var yes = obj.checked;
    var str = document.getElementsByName("sfz");
    var objarray = str.length;
    var chestr = "";
    for (i = 0; i < objarray; i++) {
        if (str[i].title == gsid) {
            str[i].checked = yes;
        }
    }
}

function f_Sendjcsfz() {
    
    var str = document.getElementsByName("sfz");
    var objarray = str.length;
    var chestr = "";
    if(!confirm("是否操作?")) {
            return;
    }

    for (i = 0; i < objarray; i++) {
        if (str[i].checked)
        {
            if (chestr == "") 
            {
                chestr = str[i].value;
            }
            else 
            {
                chestr = chestr+"$"+str[i].value;
            }            
        }
    }

    if (chestr=="") {
        alert("没有选择站点!");
        return;
    }

    
}

function f_Sendgzsfz() {
    var str = document.getElementsByName("sfz");
    var objarray = str.length;
    var chestr = "";
    if(!confirm("是否操作?")) {
            return;
    }

    for (i = 0; i < objarray; i++) {
        if (str[i].checked)
        {
            if (chestr == "") 
            {
                chestr = str[i].value;
            }
            else 
            {
                chestr = chestr+"$"+str[i].value;
            }            
        }
    }

    if (chestr=="") {
        alert("没有选择站点!");
        return;
    }


}


function f_Sendgzsfz7() {
    var str = document.getElementsByName("sfz");
    var objarray = str.length;
    var chestr = "";
    if (!confirm("是否操作?")) {
        return;
    }

    for (i = 0; i < objarray; i++) {
        if (str[i].checked) {
            if (chestr == "") {
                chestr = str[i].value;
            }
            else {
                chestr = chestr + "$" + str[i].value;
            }
        }
    }

    if (chestr == "") {
        alert("没有选择站点!");
        return;
    }

    //alert(chestr);
    $.post("wd_gzcmd.aspx?SFZID=" + chestr + "&type=7", {}, function (datas) {
        if (datas == "OK") {
            //生成地图
            f_crtmap();
        }
    });
}


function f_osall(cmd) {
    if (!confirm("是否操作?")) {
        return;
    }
    $.post("wd_gzcmd.aspx?SFZID=ALL&CMD=" + cmd, {}, function (datas) {
        //alert(datas);
        if (datas == "OK") {
            //生成地图
            f_crtmap();
        }
    });
}

function f_gzroad(cmd) {
    //ROAD&CMD
    var url = "wd_gzcmd.aspx?ROAD=ALL&CMD=" + cmd;
    //alert(this.location.href);        
    $.post(url, {}, function (datas) {
        if (datas == "OK") {
            //生成地图
            f_crtmap();
        }
    });
}

function f_crtmap() {
    $.post("http://wxmap.henangis.com/mapwms.aspx?MAP=HENANMKT&S=800000&W=4500&H=4300&L=12279152.5&B=3677471.2&R=12990346.8&T=4356757.5", {}, function (datas) {
        alert("操作成功!");
    });
}

function f_Next() {
    //layer.alert("测试!");
    var m_sy = $("#m_sy").attr("checked");
    var m_j7 = $("#m_j7").attr("checked");
    var m_j8 = $("#m_j8").attr("checked");
    var m_qt = $("#m_qt").attr("checked");
    var m_jh = $("#m_jh").attr("checked");
    if (m_sy) {
        if (m_j7 || m_j8 || m_qt || m_jh) {
            $("#m_j7").removeAttr("checked");
            $("#m_j8").removeAttr("checked");
            $("#m_qt").removeAttr("checked");
            $("#m_jh").removeAttr("checked");
            layer.alert("选择指令错误,选择“禁止所有车辆上站”，将不能选择其它指令!");
            return false;
        }
    }


    if (m_sy || m_j7 || m_j8 || m_qt || m_jh) {

    }
    else {
        layer.alert("请选择一个操作指令!");
        return false;
    }

    if (m_j7 && m_j8) {
        layer.alert("‘禁止七座(含七座)以上车辆上站’与‘禁止七座(不含七座)以上车辆上站’不能同时选择!");
        $("#m_j8").removeAttr("checked");
        return false;
    }


    var str = document.getElementsByName("sfz");
    var objarray = str.length;
    var chestr = "";
    for (i = 0; i < objarray; i++) {
        if (str[i].checked) {
            if (chestr == "") {
                chestr = str[i].value;
            }
            else {
                chestr = chestr + "$" + str[i].value;
            }
        }
    }

    if (chestr == "") {
        layer.alert("没有选择任何收费站!");
        return false;
    }

    $("#m_data").val(chestr);
    //var str = $("#m_data").val();



    return true;
}

