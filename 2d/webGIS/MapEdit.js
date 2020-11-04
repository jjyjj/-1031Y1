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

$('document').ready(function () {
    $("body").css('visibility', 'visible');
    map_SetTool(6);
    var wkt = $("#m_val").val();
    if (wkt != "") {
        map_AddMarkerByWKT("001", "name", wkt, "webGIS/imges/online.png", "0");
        map_ZoomToWKT(wkt);
    }
})