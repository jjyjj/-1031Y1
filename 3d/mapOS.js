var objMap = null;
function f_Init() {
    objMap = $("#m_3dGIS")[0].contentWindow;
}

function f_ZoomIn() {
    objMap.f_ZoomIn();
}


function f_ZoomOut() {
    objMap.f_ZoomOut();
}

