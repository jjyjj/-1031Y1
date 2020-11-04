function f_CloseDiv(strName) {
    var obj = document.getElementById(strName);
    obj.style.display = "none";
}

function f_ShowDiv(strName) {
    var obj = document.getElementById(strName);
    obj.style.display = "block";
}

function f_loadUrl(strName, ifrmID, strURL) {
    var obj = document.getElementById(strName);
    obj.style.display = "block";
    document.getElementById(ifrmID).src = strURL;
}

function F_ReceiveZLinfo(zID, zlReceiveDept) {
    $.webox({
        height: ($(window).height()) * 9 / 10,
        width: ($(window).width()) * 3 / 5,
        left: ($(window).width()) / 5,
        top: ($(window).height()) / 20,
        bgvisible: true,
        title: "指令接收情况",
        iframe: "./wd_msgReceiveList.aspx?ZL_ID=" + zID + "&ZL_RECEIVE_DEPT=" + zlReceiveDept
    });
}

// 截取空格
var clearSpace = function (str) {
    var strRes = str.replace(/\s+/g, "");
    return strRes;
}

// 截取字符串
var cutString = function (str, iLen) {
    //alert(str);
    if (str.length < iLen)
        return str;
    else
        return str.substring(0, iLen) + "...";
}

//服务器当前日期:年、月、日
function ServerCurrentTime() {
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth();
    var date = now.getDate();
    var day = now.getDay();
    var hour = now.getHours();
    var minu = now.getMinutes();
    var sec = now.getSeconds();
    var week;
    month = month + 1;
    if (month < 10) month = "0" + month;
    if (date < 10) date = "0" + date;
    if (hour < 10) hour = "0" + hour;
    if (minu < 10) minu = "0" + minu;
    if (sec < 10) sec = "0" + sec;
    var arr_week = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
    week = arr_week[day];
    var time = "";
    //time = year + "年" + month + "月" + date + "日" + " " + hour + ":" + minu + ":" + sec;
    time = year + "-" + month + "-" + date;
    return time;
    //$("#CurrentTime").text(time);
    //var timer = setTimeout("ServerCurrentTime()", 1000);
}

function ServerBeforeTime() {
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth();
    var date = now.getDate() + 1;
    var day = now.getDay();
    var hour = now.getHours();
    var minu = now.getMinutes();
    var sec = now.getSeconds();
    var week;
    month = month + 1;
    if (month < 10) month = "0" + month;
    if (date < 10) date = "0" + date;
    if (hour < 10) hour = "0" + hour;
    if (minu < 10) minu = "0" + minu;
    if (sec < 10) sec = "0" + sec;
    var arr_week = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
    week = arr_week[day];
    var time = "";
    //time = year + "年" + month + "月" + date + "日" + " " + hour + ":" + minu + ":" + sec;
    time = year + "-" + month + "-" + date;
    return time;
}

function ServerAfterTime() {
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth();
    var date = now.getDate() + 1;
    var day = now.getDay();
    var hour = now.getHours();
    var minu = now.getMinutes();
    var sec = now.getSeconds();
    var week;
    month = month + 1;
    if (month < 10) month = "0" + month;
    if (date < 10) date = "0" + date;
    if (hour < 10) hour = "0" + hour;
    if (minu < 10) minu = "0" + minu;
    if (sec < 10) sec = "0" + sec;
    var arr_week = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
    week = arr_week[day];
    var time = "";
    //time = year + "年" + month + "月" + date + "日" + " " + hour + ":" + minu + ":" + sec;
    time = year + "-" + month + "-" + date;
    return time;
}

//服务器当前日期:年、月、日，时、分
function SerCurrentTime0() {
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth();
    var date = now.getDate() - 1;
    var day = now.getDay();
    var hour = now.getHours();
    var minu = now.getMinutes();
    var sec = now.getSeconds();
    var week;
    month = month + 1;
    if (month < 10) month = "0" + month;
    if (date < 10) date = "0" + date;
    if (hour < 10) hour = "0" + hour;
    if (minu < 10) minu = "0" + minu;
    if (sec < 10) sec = "0" + sec;
    var arr_week = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
    week = arr_week[day];
    var time = "";
    //time = year + "年" + month + "月" + date + "日" + " " + hour + ":" + minu + ":" + sec;
    time = year + "-" + month + "-" + date + " 08:00";
    return time;
    //$("#CurrentTime").text(time);
    //var timer = setTimeout("ServerCurrentTime()", 1000);
}

function SerCurrentTime1() {
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth();
    var date = now.getDate();
    var day = now.getDay();
    var hour = now.getHours();
    var minu = now.getMinutes();
    var sec = now.getSeconds();
    var week;
    month = month + 1;
    if (month < 10) month = "0" + month;
    if (date < 10) date = "0" + date;
    if (hour < 10) hour = "0" + hour;
    if (minu < 10) minu = "0" + minu;
    if (sec < 10) sec = "0" + sec;
    var arr_week = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
    week = arr_week[day];
    var time = "";
    //time = year + "年" + month + "月" + date + "日" + " " + hour + ":" + minu + ":" + sec;
    time = year + "-" + month + "-" + date + " 08:00";
    return time;
    //$("#CurrentTime").text(time);
    //var timer = setTimeout("ServerCurrentTime()", 1000);
}

// 定时操作
// 下面是定时器的一些操作
function f_GetNowTimeInfo() {
    var objTime = document.getElementById("DIV_TIMER");
    var myDate = new Date();
    objTime.innerHTML = myDate.toLocaleString();
}

function f_GetZlInfo() {
    //必须启动后台访问服务
    $.post("../handler/wd_GetReadMsg.aspx?CMD=ISHASZL&T_DEPT_ID=" + f_GetDeptID(), f_GetData);
}

function f_PlayMsg() {
    $('#DIV_WARM').html('<audio autoplay="autoplay"><source src="../media/msg.mp3" type="audio/mpeg"/></audio>');
    //f_setImg(2);
}

function f_PlayWarm() {
    $('#DIV_WARM').html('<audio autoplay="autoplay" loop="loop"><source src="../media/5051.MP3" type="audio/mpeg"/></audio>');
    //f_setImg(1);
}

function f_StopPlay() {
    $('#DIV_WARM').html('');
    //f_setImg(0);
}

var m_OldMsgNum = 0;
var iSMsg = false;
// 获取
function f_GetData(data) {
    f_StopPlay();
    if (data.length < 1) {
        f_CloseDiv("div_msg");
        return;
    }
    var str = data;
    var arr = new Array();
    arr = str.split(",");
    var result = parseInt(arr[1]);
    if (data.indexOf("ZY") >= 0) {//重要通知
        f_PlayWarm();
        f_SetMsgInfo(1, result);
    }
    else {//一般通知，获取数量，只要变量就播放一次   
        if (arr.length > 1) {
            if (m_OldMsgNum != result) {
                m_OldMsgNum = result;
                iSMsg = true;
            }
            if (iSMsg) {
                f_SetMsgInfo(3, result);
                f_PlayMsg();
                iSMsg = false;
            }
        }
    }
}

function f_SetMsgInfo(iType, iNum) {
    f_ShowDiv("div_msg");
    //刷新指令界面IFR_MSG
    var file = "";
    var msg = "";
    if (iType == 1) {
        file = "../media/img/warm.jpg";
        msg = "管制或紧急通知指令:" + iNum + "条";
    }
    if (iType == 3) {
        file = "../media/img/msg.gif";
        msg = "一般通知指令:" + iNum + "条";
    }
    var objImg = document.getElementById("IMG_ALERM");
    objImg.src = file;
    var objmsgdiv = document.getElementById("DIV_ZLINFO");
    objmsgdiv.innerHTML = msg;
}

//function f_GetQxInfo() {
//    //必须启动后台访问服务
//    //$.post("../wd_qx/wd_getqx.aspx" + f_GetDeptID(), f_GetQxData);
//    $.post("../wd_qx/wd_getqx.aspx", f_GetQxData);
//}
//var m_QxNum = "0";
//function f_GetQxData(data) {
//    if (data.length < 1) {
//        f_CloseDiv("DIV_QXMSG");
//        return;
//    }
//    f_ShowDiv("DIV_QXMSG");
//    var str = data;
//    var arr = new Array();
//    arr = str.split("$");
//    if (m_QxNum == arr[0]) {
//        return;
//    }
//    else {
//        m_QxNum = arr[0];
//    }
//    var objmsgtime = document.getElementById("DIV_QXTIME");
//    objmsgtime.innerHTML = "发布日期：" + arr[1];
//    var objmsgmsg = document.getElementById("DIV_QXMSG_INFO");
//    objmsgmsg.innerHTML = arr[2];
//    console.log(arr[2]);
//    //alert(arr[2]);
//    //f_ShowDiv("DIV_QXMSG");
//}