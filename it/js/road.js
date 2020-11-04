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
            layer.alert("选择指令错误,选择“禁止所有车辆通行”，将不能选择其它指令!");
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
        layer.alert("‘禁止七座(含七座)以上车辆通行’与‘禁止七座(不含七座)以上车辆通行’不能同时选择!");
        $("#m_j8").removeAttr("checked");
        return false;
    }

    var arrRoadData = document.getElementsByName("gs");
    var objLen = arrRoadData.length;
    var yes = false;
    for (var i = 0; i < objLen; i++) {
        if (arrRoadData[i].checked) {
            yes = true;
            break;
        }
    }
    if (!yes) {
        layer.alert("请选择一条线路!");
        return false;
    }

    var iSelRoad = "";
    var iN = 0;
    for (var i = 0; i < objLen; i++) {
        var objRow = arrRoadData[i];  //objRow.id//      
        if (arrRoadData[i].checked) {
            //现获取方向
            var fx_sl = f_GetSelOption("fx_" + objRow.id);
            //是否整线禁止
            var m_zxname = "#zx" + objRow.id;
            var zxchk = $(m_zxname).attr("checked");
            var isQX = "全段";
            if (zxchk) {
                isQX = "全段";
            }
            else {
                //获取起止收费站
                var fx_qs = f_GetSelOption("qs_" + objRow.id);
                var fx_zz = f_GetSelOption("zz_" + objRow.id);
                isQX = fx_qs + "," + fx_zz;
            }
            var strrow = objRow.id + "," + fx_sl + "," + isQX;
            if (iN == 0) {
                //var row=
                iSelRoad = strrow;
            }
            else {
                iSelRoad = iSelRoad + "$" + strrow; //
            }
            iN++;
        }
    }

    if (iSelRoad == "") {
        layer.alert("没有选择任何路段!");
        return false;
    }

    $("#m_data").val(iSelRoad);
    return true;
}

function f_GetSelOption(sid) {
    var fx_sl = "";
    try {
        var fx = document.getElementById(sid);
        var index = fx.selectedIndex;
        fx_sl = fx.options[index].value;
    }
    catch (e) { }
    return fx_sl;
}

function f_SelGS(gscode) {
    var m_name = "#" + gscode;
    var chk = $(m_name).attr("checked");
    if (chk) {
        //layer.alert(chk);
        var m_zxname = "#zx" + gscode;
        $(m_zxname).attr("checked", true);
    }
    else {
        var m_zxname = "#zx" + gscode;
        var zxchk = $(m_zxname).attr("checked");
        if (zxchk) {
            $(m_zxname).attr("checked", false);
        }
    }

}
function f_SelZX(gscode) {

    var m_zxname = "#zx" + gscode;
    var zxchk = $(m_zxname).attr("checked");
    if (zxchk) {
        var chk = $(m_name).attr("checked");
        var m_name = "#" + gscode;
        var ck = $(m_name).attr("checked",true);
    }

}
function f_SelAll() {
    var yes = false;
    var chk = $("#m_allsel").attr("checked");
    if (chk) {
        yes = true;
    }
    var objarraygs = document.getElementsByName("gs");
    var ilen = objarraygs.length;
    for (n = 0; n < ilen; n++) {
        objarraygs[n].checked = yes;
    }
}

function f_QSSel(gscode) {
    var m_zxname = "#zx" + gscode;
    $(m_zxname).removeAttr("checked");
}

function f_ZZSel(gscode) {
    var m_zxname = "#zx" + gscode;
    $(m_zxname).removeAttr("checked");
}

function f_updateInit() {
    var rows = $("#m_editdata").val();
    if (rows == "") return;
    var arrZL = rows.split("$");
    if (arrZL.length < 1) return;
    for (var i = 0; i < arrZL.length; i++) {
        var arrOne = arrZL[i].split(",");
        //G1511, 0, 205, 203
        f_SetGSCHK(arrOne[0]);
        //layer.alert(arrOne[1]);
        f_SetSel("fx_" + arrOne[0], arrOne[1]);
        if (arrOne.length == 3) //代表全段
        {
            f_SetGSCHK("zx" + arrOne[0]);
        }
        else { //代表分段
            f_SetSel("qs_" + arrOne[0], arrOne[2]);
            f_SetSel("zz_" + arrOne[0], arrOne[3]);
        }
    }
}

function f_SetSel(id,m_value) {
    try {
        var select = document.getElementById(id);
        for (var i = 0; i < select.options.length; i++) {
            if (select.options[i].value == m_value) {
                select.options[i].selected = true;
                break;
            } 
        }
    }
    catch (e) { }
//    var index = fx.selectedIndex;
//    fx_sl = fx.options[index].value;
}

function f_SetGSCHK(id) {
    try {
        $("#"+id).attr("checked", true);
    }
    catch (e) { }
    //    var index = fx.selectedIndex;
    //    fx_sl = fx.options[index].value;
}