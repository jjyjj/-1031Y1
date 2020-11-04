function f_SetOK() {
    var m_ck = $("#m_isok").is(':checked');
    var m_ok = "0";
    if (m_ck) {
        m_ok = "1";
    }
    var url = "api.aspx?CMD=OPENCLOSE&TYPE=" + m_ok;
    $.post(url, function (data) {
        if (data == "") return;
        f_Msg("操作完成!")
    });
}

function f_Msg(msg) {
    layer.msg(msg);
}

function f_MsgDlg(msg) {
    layer.alert(msg);
}

//指令下达
function f_addZL() {
    var url = "wd_sel_zl.aspx";
    layer.open({
        type: 2,
        title: '高速公路管制信息',
        maxmin: true,
        shadeClose: true, //点击遮罩关闭层
        area: ['92%', '92%'],
        content: url,
        btn: ['添加任务', '关闭窗口'],
        yes: function (index, layero) {
            //layer.close(index);
            f_SendCMD();
            layer.close(index);
        }, btn2: function (index, layero) {
            
        }
        , cancel: function () {
            //右上角关闭回调
        }
    })
}

function f_SendCMD() {
    var url = "api.aspx?CMD=SENDCMD";
    $.post(url, function (data) {
        if (data == "") return;
        if (data == "1") {
            layer.alert("指令已经下达!");
            location.reload();
        }
        else if (data == "-1") {
            layer.alert("没有包含任何指令，操作无法进行!");
        }
        else {
            layer.alert("指令下达，失败!");
        }
    });
}

function f_SendOK() {
    layer.confirm('是否需要继续执行该指令？', { btn: ['确定', '取消'], title: "提示" }, function (index) {
        var url = "api.aspx?CMD=SENDOK";
        $.post(url, function (data) {
            if (data == "") return;
            if (data == "1") {
                layer.alert("指令已经下达!");
                location.reload();
            }
            else if (data == "-1") {
                layer.alert("没有包含任何指令，操作无法进行!");
            }
            else {
                layer.alert("指令下达，失败!");
            }
        });
        layer.close(index);
    });
}

function f_OutputMap(zlid) {
    layer.confirm('是否发布管制地图？', { btn: ['确定', '取消'], title: "提示" }, function (index) {
        layer.close(index);
        var url = "api.aspx?CMD=OUTPUTMAP&ZL_ID=" + zlid;
        $.post(url, function (data) {
            if (data == "") return;
            if (data == "1") {
                f_ShowCrtMapDlg();
            }            
        });
    });
    
}


function f_ShowCrtMapDlg() {
    var url = "";
    layer.open({
        type: 2,
        title: '地图发布结果',
        maxmin: true,
        shadeClose: true, //点击遮罩关闭层
        area: ['92%', '92%'],
        content: "../crtmap.aspx",
        //		btn:['关闭'],
        cancel: function (index, layero) {
            layer.close(index);
        }
    })
}

function f_ShowZL(id) {
    var url = "wd_see_zl.aspx?ZL_ID=" + id;
    layer.open({
        type: 2,
        title: '指令信息查看!',
        maxmin: true,
        shadeClose: true, //点击遮罩关闭层
        area: ['92%', '92%'],
        content: url,
        //		btn:['关闭'],
        yes: function (index, layero) {
            layer.close(index);
        }
    })
}

function f_QianRu(id) {
    layer.confirm('是否依次为模板，签入管制指令？', { btn: ['确定', '取消'], title: "提示" }, function (index) {
        layer.close(index);
        var url = "api.aspx?CMD=QIANRU&ZL_ID=" + id;
        $.post(url, function (data) {
            if (data == "") return;
            if (data == "1") {
                f_addZL();
            }
            else {
                layer.alert("指令嵌入失败!");
            }
        });
    });
}

function f_FaBu(gid) {
    //f_MsgDlg(gid);
    layer.confirm('是否继续？', { btn: ['确定', '取消'], title: "提示" }, function (index) {
        layer.close(index);
        var url = "api.aspx?CMD=FABU&GID=" + gid;
        $.post(url, function (data) {
            if (data == ""){
                f_MsgDlg("指令下达，失败!");
                return;
            }
            if (data == "1") {
                f_MsgDlg("指令成功下达!");
            }
            else {
                f_MsgDlg("指令下达，失败!");
            }
        });
    });

}

function f_SeeIT() {
    var url = "get.aspx?CMD=SEEIT";
    layer.open({
        type: 2,
        title: '指令信息查看!',
        maxmin: true,
        shadeClose: true, //点击遮罩关闭层
        area: ['92%', '92%'],
        content: url,
        //		btn:['关闭'],
        yes: function (index, layero) {
            layer.close(index);
        }
    })
}