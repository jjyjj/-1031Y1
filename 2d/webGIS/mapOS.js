var curTime = "";
var iSelectType = 1;
function f_initData() {
    f_MapFull();
    f_NoRightClick();
}

$("document").ready(function () {
    f_initData();
});

//地图的定位
function f_mapCenter() {
    var x = 113.6192979265;
    var y = 34.7483837758;
    var z = 7;
    map_CenterZ(x, y, z, true);
}

function f_MoveCenterWKT(wkt) {
    map_ZoomToWKT(wkt);
}

function f_mapzoomin() {
    map_ZoomIn();
}

function f_mapzoomout() {
    map_ZoomOut();
}

function f_MapFull() {
    var wkt = "POLYGON((12284598.1751455 3682981.62126301,12284598.1751455 4350530.57256579,12984786.3063277 4350530.57256579,12984786.3063277 3682981.62126301,12284598.1751455 3682981.62126301))";
    map_Center_WKT(wkt, true, f_GetZoomMinLev(), 2000);
}

function f_GetZoomMinLev() {
    var ilev = 7;
    var hei = $(window).height();
    var wid = $(document).width();
    //alert(hei);
    if (hei > 1600) {
        ilev = 8.5;
    }
    else if (hei > 1200 && hei <= 1600) {
        ilev = 8.2;
    }
    else if (hei > 1000 && hei <= 1200) {
        ilev = 7.9;
    }
    else if (hei > 900 && hei <= 1000) {
        ilev = 7.7;
    }
    else if (hei >= 800 && hei <= 900) {
        ilev = 7.5;
    }
    else if (hei >= 700 && hei < 800) {
        ilev = 7.2;
    }
    else {
        ilev = 7;
    }
    return ilev;
}

function f_GetDistance(itype) {
    if (itype == 0) {
        map_SetTool(3);
    }
    else {
        map_SetTool(4);
    }
}

function f_Clear() {
    map_Clear();
}

function f_NoRightClick() {
    $(function () {
        $(document).bind("contextmenu", function (e) {
            return false;
        });
    })
}

function f_LoadAllXM() {
    var strURL = "gis/getMap.aspx?CMD=GETALLTZS";
    $.post(strURL, null, function (data) {
        if (data == "") {
            return;
        }
        var objectdata = eval("(" + data + ")");
        try {
            map_OjbClear(markerLayer_XM);
        }
        catch (e) { }
        if (objectdata.length != 0) {
            for (var i = 0; i < objectdata.length; i++) {
                //XID,XNAME,TYPE,GEOM
                var gid = objectdata[i].XID;
                var name = objectdata[i].XNAME;
                var TYPE = objectdata[i].TYPE;
                var mktxy = objectdata[i].GEOM; //返回的是MKT格式坐标
                if (mktxy == null || mktxy == "") continue;
                var m_img = "images/tuan/tuanhui20.png";
                var mycolor = "rgba(255,0,0,1)";
                if (TYPE == 0) {
                    m_img = "images/tuan/dayan24.png";
                    mycolor = "rgba(255,255,255,1.0)";
                }
                f_AddFeatureByOBJLyrIMG(gid, name, mktxy, m_img, "2", markerLayer_XM, mycolor, "rgba(255,255,255, 0.0)", 1, "12", "center", 0, 18);
                if (TYPE == 1) {
                    //绘制一条红线
                    f_DrawLink(objectdata, gid, mktxy);
                }
            }
        }
    });
}

function f_ShowXMByXID(xid,xname) {
    f_ShowInfo(xid, xname);
}

function f_DrawLink(objectdata, xid, geom) {
    var format = new ol.format.WKT();
    var geom1 = geom.replace("POINT(", "");
    geom1 = geom1.replace(")", "");
    for (var i = 0; i < objectdata.length; i++) {
        //XID,XNAME,TYPE,GEOM
        var gid = objectdata[i].XID;
        var name = objectdata[i].name;
        var TZS_UID = objectdata[i].TZS_UID;
        var mktxy = objectdata[i].GEOM;
        if (mktxy == null || mktxy == "") continue;
        if (TZS_UID != xid) continue;
        var geom2 = mktxy.replace("POINT(", "");
        geom2 = geom2.replace(")", "");
        var strLine = "MULTILINESTRING((" + geom1 + "," + geom2 + "))";
        var m_aniColor = "rgba(0,255,0,0.6)";
        map_AddVectorByClass_AndSet(vector_Lin_GHG, gid, name, strLine, "10", 2, m_aniColor);
    }
}

var arrDS_Data = null;
function f_LoadDS() {
    var strURL = "gis/getMap.aspx?CMD=GETDS";
    $.post(strURL, null, function (data) {
        if (data == "") {
            return;
        }
        arrDS_Data = data;
        f_LoadDSMian();
    });
}

var arrXian_Data = null;
function f_LoadXian() {
    var strURL = "gis/getMap.aspx?CMD=GETXIAN";
    $.post(strURL, null, function (data) {
        if (data == "") {
            return;
        }
        arrXian_Data = data;
        f_LoadXianData();
    });
}

var arrXian_XmData = null;
function f_LoadXianData() {
    var strURL = "gis/getMap.aspx?CMD=GETXIANDATACNT";
    $.post(strURL, null, function (data) {
        if (data == "") {
            return;
        }
        arrXian_XmData = data;
    });
}

function f_GetXianXMCnt(code, type) { 
    var icnt=0;
    var objectdata = eval("(" + arrXian_XmData + ")");
    if (objectdata.length != 0 && objectdata != null) {
        for (var i = 0; i < objectdata.length; i++) {
            //XID,XNAME,TYPE,DQ_CODE
            var XID = objectdata[i].XID;
            var m_TYPE = objectdata[i].TYPE;
            var DQ_CODE = objectdata[i].DQ_CODE;
            if (code == DQ_CODE && type == m_TYPE) {
                icnt++;
            }
        }
    }
    return icnt;
}

var arrDS_MianData = null;
function f_LoadDSMian() {
    var strURL = "gis/getMap.aspx?CMD=GETDSMIAN";
    $.post(strURL, null, function (data) {
        if (data == "") {
            return;
        }
        arrDS_MianData = data;
        f_SetMenu();
    });
}

//添加地市的菜单
function f_SetMenu() {
    if (arrDS_MianData == null) return;
    var DivPop_Menuhtml = "";
    var objectdata = eval("(" + arrDS_MianData + ")");
    if (objectdata.length != 0) {        
        for (var i = 0; i < objectdata.length; i++) {
            var gid = objectdata[i].gid;
            var name = objectdata[i].name;
            var code = objectdata[i].code;
            var wkt = objectdata[i].geom;
            var temphtml = "";
            if (objectdata.length == 1) {
                temphtml = "<input onclick='f_ShowDSMap(\"" + wkt + "\");' id=\"Button4\" type=\"button\" value=\"" + name + "\" class=\"Button_Menu_ONLYONE\" />";
                DivPop_Menuhtml = DivPop_Menuhtml + temphtml;
                break;
            }

            if (i == 0) {
                temphtml = "<input onclick='f_ShowDSMap(\"" + code + "\",\"" + wkt + "\");' id=\"Button4\" type=\"button\" value=\"" + name + "\" class=\"Button_Menu_1\" />";
            }
            else {
                if (i == objectdata.length - 1) {
                    temphtml = "<input onclick='f_ShowDSMap(\"" + code + "\",\"" + wkt + "\");' id=\"Button4\" type=\"button\" value=\"" + name + "\" class=\"Button_Menu_3\" />";
                }
                else {
                    temphtml = "<input onclick='f_ShowDSMap(\"" + code + "\",\"" + wkt + "\");' id=\"Button4\" type=\"button\" value=\"" + name + "\" class=\"Button_Menu_2\" />";
                }
            }
            DivPop_Menuhtml = DivPop_Menuhtml + temphtml;
        }
        if (objectdata.length > 15) {
            $("#DivPop_Menu").attr("class", "UI_POP_MENU2");
        }
        else {
            $("#DivPop_Menu").attr("class", "UI_POP_MENU");
        }
    }
    $("#DivPop_Menu").html(DivPop_Menuhtml);
}

function f_ShowDSMap(code, wkt) {
    map_ZoomToWKT_NOANIMATE(wkt);
    if (arrXian_Data == null) return;
    var objectdata = eval("(" + arrXian_Data + ")");
    var strHtml = "";
    var iLen = 1;
    if (objectdata.length != 0) {
        var tb = "<table style=\"width: 100%;\" class=\"table1\"><tr><td style='70px;'>序号</td><td>县市区</td><td style='70px;'>数量</td></tr>";
        for (var i = 0; i < objectdata.length; i++) {
            var gid = objectdata[i].gid;
            var name = objectdata[i].name;
            var m_code = objectdata[i].code;
            var mktxy = objectdata[i].geom; //返回的是MKT格式坐标
            if (m_code.substring(0, 4) == code.substring(0, 4)) {
                var row = "<tr title='" + objectdata[i].name + "' onclick='f_ShowXianMap(\"" + m_code + "\",\"" + mktxy + "\");' class='RowButt'><td style='70px;'>" + iLen + "</td><td>" + objectdata[i].name
                + "</td><td style='70px;'>" + f_GetXianXMCnt(m_code,iSelectType)
                + "</td></tr>";
                tb = tb + row;
                iLen++;
            }
        }
        tb = tb + "</table>";
        $("#d_ghglist").html(tb);

    }
    else {
        $("#d_ghglist").html("");
    }
    $("#m_ghgqu").attr('style', 'visibility: visible');
    var strCurname = "第一团支书";
    if (iSelectType == 0) { 
        strCurname = "人员&项目情况";
    }
    $("#m_curzhan").html(strCurname);
    
}

//查找县区的信息
function f_ShowXianMap(code, wkt) {
    map_ZoomToWKT_NOANIMATE(wkt);
}

//添加团的市级组织
function f_AddTuan2map() {
    if (arrDS_Data == null) return;
    var objectdata = eval("(" + arrDS_Data + ")");
    try {
        map_OjbClear(markerLayer_Data);
    }
    catch (e) { }
    if (objectdata.length != 0) {
        for (var i = 0; i < objectdata.length; i++) {
            var gid = objectdata[i].gid;
            var name = objectdata[i].name;
            var code = objectdata[i].code;
            var mktxy = objectdata[i].geom; //返回的是MKT格式坐标
            var m_img = "/images/tuan/tuanhui32.png";
            map_AddMarkerByWKT_OBJLYR_XY(gid, name, mktxy, m_img, "3", markerLayer_Data);
            //f_AddFeatureByOBJLyr(gid, name, mktxy, "1", markerLayer_map, "rgba(0,255,0, 1)", "rgba(0,0,0,0.8)", 4, "14", "left", 15, 0);
        }
    }
}

//添加团的县级组织
function f_AddTuanXian2map() {
    if (arrXian_Data == null) return;
    var objectdata = eval("(" + arrXian_Data + ")");
    try {
        map_OjbClear(markerLayer_XIAN);
    }
    catch (e) { }
    if (objectdata.length != 0) {
        for (var i = 0; i < objectdata.length; i++) {
            var gid = objectdata[i].gid;
            var name = objectdata[i].name;
            var code = objectdata[i].code;
            var mktxy = objectdata[i].geom; //返回的是MKT格式坐标
            var m_img = "/images/tuan/tuanhui24.png";
            map_AddMarkerByWKT_OBJLYR_XY(gid, name, mktxy, m_img, "3", markerLayer_XIAN);
            //f_AddFeatureByOBJLyr(gid, name, mktxy, "1", markerLayer_map, "rgba(0,255,0, 1)", "rgba(0,0,0,0.8)", 4, "14", "left", 15, 0);
        }
    }
}

//获取统计信息
function f_LoadCntInfo() {
    var strURL = "gis/getMap.aspx?CMD=GETCNT";
    $.post(strURL, null, function (data) {
        if (data == "") return;
        var objectdata = eval("(" + data + ")");
        if (objectdata == null || objectdata.length != 2) return;
        var num0 = 0;
        var cntTxt = "";
        for (var i = 0; i < objectdata.length; i++) {
            var itype = objectdata[i].type;
            var inum = objectdata[i].num;
            if (iSelectType == itype) {
                num0 = inum;
                break;
            }
        }
        var m_title = "第一团支书";
        if (iSelectType == 1) {
            cntTxt = "共" + num0 + "名";
        }
        else {
            cntTxt = "共" + num0 + "个";
            m_title = "人员&项目";
        }

        $("#cnt_num").html(cntTxt);
        $("#cur_sel_title").val(m_title);
    });
}

function f_SelectMenu(itype) {
    iSelectType = itype;
    f_LoadCntInfo();
}

function f_MsgDlg(msg) {
    layer.msg("<span style='color:white'>" + msg + "</span>");
}

function f_DaoHang() {
    f_GetDaoHang(113.6743423034, 34.8059411500, 113.4690604898, 34.7677305003);
}

function f_ShowInfo(gid, name) {
    $("#m_dlgtitle").html(name);
    $("#m_info1").attr('style', 'visibility: visible');
    $("#FRM_INFO").attr("src", "wd_info/wd_xminfo.aspx?XID=" + gid);
    $("#m_cont").attr('style', 'visibility: visible');
}

function f_CloseDlg() {
    $("#m_cont").attr('style', 'visibility: hidden');
    $("#m_info1").attr('style', 'visibility: hidden');
}

function f_CloasGGQDlg() {
    $("#m_ghgqu").attr('style', 'visibility: hidden');
}

function f_Clear() {
    try {
        map_OjbClear(vector_CutMian);
        map_OjbClear(vector_Lin_GHG);
    }
    catch (e) { }
    map_SetTool(2);
}

