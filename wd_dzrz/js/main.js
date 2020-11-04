function f_AddDlg(pid,type) {
    layer.open({
        type: 1,
        title: '添加信息',
        //skin: 'layui-layer-molv',
        closeBtn: 0,
        shadeClose: true,
        shade: false,
        area: ['400px', '200px'],
        content: '<div id="mydiv" style="margin-left:10px;margin-top:10px;"><input style="width: 96%" id="txtReason" type="text" value=""/></div>',
        btn: ['确定', '取消']
        , yes: function (index, layero) {
            var txtReason = $('#txtReason').val();
            if (txtReason == "") {
                return;
            }
            var url = "../it/it_adduser.aspx?CMD=ADDCLASS&PID=" + pid + "&TYPE=" + type + "&NAME=" + txtReason;
            $.post(url, null, function (data) {
                if (data == "") return;
                location.reload();
            });
            layer.close(index);
        }
    });
}
function f_EditDlg(did, dname) {
    var txtReason = $('#d_' + did).html();
    layer.open({
        type: 1,
        title: '修改信息',
        //skin: 'layui-layer-molv',
        closeBtn: 0,
        shadeClose: true,
        shade: false,
        area: ['400px', '200px'],
        content: '<div id="mydiv" style="margin-left:10px;margin-top:10px;"><input style="width: 96%" id="txtReason" type="text" value="' + txtReason + '"/></div>',
        btn: ['确定', '取消']
        , yes: function (index, layero) {
            var txtReason = $('#txtReason').val();
            if (txtReason == "") {

                return;
            }
            var url = "get.aspx?CMD=UPCLASS&PID=" + did + "&NAME=" + txtReason;
            $.post(url, null, function (data) {
                if (data == "") return;
                if (data != "1") {
                    alert("修改失败!");
                    return;
                }
                $('#d_' + did).html(txtReason);
                layer.close(index);
            });

        }
    });
}

function f_EditIdx(type,zid, zpid) {
    var txtReason = $('#i_' + zid).html();
    layer.open({
        type: 1,
        title: '信息',
        //skin: 'layui-layer-molv',
        closeBtn: 0,
        shadeClose: true,
        shade: false,
        area: ['400px', '280px'],
        content: '<div id="mydiv" style="margin-left:10px;margin-top:10px;">' + "用户名:" + '<input id="uname" type="text" value=""/>' + "</br></br>真实姓名:" + '<input id="truename" type="text" value=""/>' + "</br></br>密&nbsp;&nbsp;码:&nbsp;" + '<input id="pwd" type="text" value=""/></div>',
        btn: ['确定', '取消']
        , yes: function (index, layero) {
            var txtReason = $('#uname').val();
            var txtpwd = $('#pwd').val();
            var txttruename = $('#truename').val();
            if (txtReason == "") {

                return;
            }
            var url = "../it/it_adduser.aspx?CMD=ADDUSER&ZID=" + zid + "&ZPID=" + zpid + "&TYPE=" + type + "&PDW=" + txtpwd + "&TRUENAME=" + txttruename + "&UNAME=" + txtReason;
            $.post(url, null, function (data) {
                if (data == "") return;
                if (data != "1") {
                    alert("添加失败!");
                    return;
                }
                $('#i_' + zid).html(txtReason);
                layer.close(index);
            });
        }
    });
}

function f_IsDel(id) {
    if (!confirm("是否删除?")) {
        return;
    }
    var url = "get.aspx?CMD=DELOBJ&PID=" + id;
    $.post(url, null, function (data) {
        if (data == "") return;
        if (data == "-1") {
            layer.alert("存在子集，不可以删除!");
            return;
        }
        if (data == "1") {
            $("#r_" + id).remove();
        }
    });
}

function f_ShowFileS(id, name) {
    layer.open({
        type: 2,
        title: name,
        closeBtn: 1, //不显示关闭按钮
        shade: [0],
        area: ['98%', '98%'],
        anim: 2,
        content: "wd_listdoc.aspx?CUR_CID=" + id
    });
}

function f_DelTR(id) {
    layer.confirm('是否要删除选择记录？', {
        btn: ['确认', '取消'] //按钮
    }, function (index) {
        var url = "get.aspx?CMD=DELDOC&PID=" + id;
        $.post(url, null, function (data) {
            if (data == "") {
                layer.alert("删除失败!");
                layer.close(index);
                return;
            }
            $("#t_" + id).remove();
            layer.close(index);
        });
    }, function () {

    });
}