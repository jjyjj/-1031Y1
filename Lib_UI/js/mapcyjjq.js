var objMap = null;
var dlg_hist=null;
function f_Msg(msg) {
    layer.alert(msg);
}

var m_first = 0;

function f_LoadDataByGuid(guid) 
{
    var url = "get.aspx?CUR_JJQCODE=" + guid;
    $.post(url, null, function (data) {
        if (data == "") return;
        f_LoadAllMap(data);
        //layer.close(dlg_hist);        
    });
}

function f_Reload() {
    objMap.map_OjbClear(objMap.vector_Building_Mian);
    var html = "";
    $("#m_xqobj").html(html);
    var strData = $("#m_guid").val();
    f_LoadDataByGuid(strData);
}

function f_DrawXQMapRect(strGeom) {
    objMap.map_AddVector(objMap.vector_bj_mian, "-1", "test", strGeom);
    f_GoTo2(strGeom);
    objMap.map_SetTool(1);
}

function f_LoadAllMap(json) {
    objMap.map_OjbClear(objMap.vector_Building_Mian);
    var html = "";
    $("#m_xqobj").html(html);
    if (json.length < 1) return;
    var objectdata = eval(json);
    //gid,name,code,guid,ST_ASTEXT(geom) as xy
    
    if (objectdata.length != 0) {
        var tempWKT = "";
        
        for (var i = 0; i < objectdata.length; i++) {
            var gid = objectdata[i].gid;
            var guid = objectdata[i].guid;
            var code = objectdata[i].code;
            var name = objectdata[i].name;
            var geom = objectdata[i].xy;
            html = html + f_Get1Row(i+1,gid, guid, name, geom, code);
            objMap.map_AddVector(objMap.vector_Building_Mian, gid, name, geom);
        }
        $("#m_xqobj").html(html);      
    }
}

function f_FreshList(guid) {
    var url = "get.aspx?CUR_JJQCODE=" + guid;
    $("#m_xqobj").html("");
    $.post(url, null, function (data) {
        if (data == "") return;
        var objectdata = eval(data);
        //gid,name,code,guid,ST_ASTEXT(geom) as xy
        if (objectdata.length != 0) {
            var tempWKT = "";
            var html = "";
            for (var i = 0; i < objectdata.length; i++) {
                var gid = objectdata[i].gid;
                var guid = objectdata[i].guid;
                var code = objectdata[i].code;
                var name = objectdata[i].name;
                var geom = objectdata[i].xy;
                html = html + f_Get1Row(i+1,gid,guid,name,geom,code);
            }
            $("#m_xqobj").html(html);
        }

    });
}

function f_Get1Row(i,gid,guid,name,geom,code) {
    strcode = "(" + code + ")";
    var strOne = "<li><table style='width: 100%;'><tr>";
    strOne += "<td style='vertical-align: middle; text-align: center' width='24px'>";
    strOne += i + "</td>";
    strOne += "<td style='vertical-align: middle; text-align: center' width='24px'><i class='blue fa fa-list' style='cursor: pointer;text-decoration: underline;' title='修改属性'></i></td>";
    strOne += "<td class='blue' style='vertical-align: middle; text-align: left;'><a style=\"cursor: pointer\" href='javascript:f_GoTo2(\"" + geom + "\");'>" + name + strcode + "</a></td></tr></table></li>";
    return strOne;
}

function f_GoTo2(geom) {
    objMap.map_ZoomToWKT_NOANIMATE(geom);
    //同时需要打开一个统计窗口 
}

function f_GoTo(geom) {
    objMap.map_ZoomToWKT(geom);
    //同时需要打开一个统计窗口 
}

function f_DeleteBuilding() {
    var selectedFeatures = objMap.select.getFeatures();
    var cnt = selectedFeatures.getLength();
    if (cnt < 1) {
        f_Msg("没有选择对象!");
        return;
    }
    if (cnt > 1) {
        f_Msg("只能选择一个对象!");
        return;
    }
    var objFT = selectedFeatures.item(0);
    var gid = objFT.getId();
    var url = "get.aspx?DELGID=" + gid;
    var idex = layer.confirm('删除选中要素？', {
        btn: ['确定', '取消'] //按钮
    }, function (index) {
        layer.close(index);
        $.post(url, null, function (data) {
            if (data == "1") {
                try { objMap.select.getFeatures().clear(); } catch (e) { }
                f_Reload();
            }
            else {
                layer.alert("删除失败!");
                f_Reload();
            }

        });

    });
}

function f_EidtGeom(objFt) {
    var wkt = objMap.map_GetFeatureWKT(objFt);
    var gid = objFt.getId();
    var url = "get.aspx?UPGEOMGID=" + gid;
    var formData = new FormData();
    formData.append("geom", wkt);
    $.ajax({
        type: 'POST',
        url: url,
        data: formData,
        datatype: "text",
        contentType: false, //必须false才会自动加上正确的Content-Type
        processData: false, //必须false才会避开jQuery对 formdata 的默认处理，XMLHttpRequest会对 formdata 进行正确的处理
        success: function (data) {
            if (data == "") return;
            var strData = $("#m_guid").val();
            f_FreshList(strData);
        }
    });
}

function f_AddBuilding2DB(objFt) {
    var wkt = objMap.map_GetFeatureWKT(objFt);
    var url = "get.aspx?ADDBLD=" + wkt;
    $.post(url, null, function (data) {
        if (data == "") return;
        //删除图层要素并刷新页面
        f_Reload();
    });
}

var dlg_hist;
function f_EditSX() {
    var selectedFeatures = objMap.select.getFeatures();
    var cnt = selectedFeatures.getLength();
    if (cnt < 1) {
        f_Msg("没有选择对象!");
        return;
    }
    if (cnt > 1) {
        f_Msg("只能选择一个对象!");
        return;
    }
    var objFT = selectedFeatures.item(0);
    var gid = objFT.getId();
    var url = "wd_editsx.aspx?gid=" + gid;
    dlg_hist = layer.open({
        type: 2,
        title: '查看详细信息',
        shadeClose: true,
        shade: false,
        maxmin: false, //开启最大化最小化按钮
        area: ['600px', '400px'],
        anim: 3,
        content: url
    });
}

function f_SaveSX(gid, code, name) {
    var url = "get.aspx?UPGID=" + gid + "&CODE=" + code+"&NAME="+name;
    $.post(url, null, function (data) {
        if (data == "") {
            alert("修改失败!");
            return;
        }
        var strData = $("#m_guid").val();
        f_FreshList(strData);
        layer.close(dlg_hist);
    });
    
}

function f_SetToolS(i) {
    ///设置工具
    objMap.map_SetTool(i);
}

function f_MapFull() {
    var x = 12670926; //12670926.799, 4023424.989
    var y = 4023424;
    var z = 7;
    objMap.map_CenterZ(x, y, z, true);
}

function f_Print(code) {
    alert(code);
}

