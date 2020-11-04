//ADD
function add_user() {
    var res = false;
    $('.user_verification input[type=text],.user_verification textarea').each(function (i, e) { if (e.value == null || e.value == '') { res = true; } });
    if (res) { mui.toast('请输入完整的信息！'); return false; }
    var name = $('#txtname').val();
    var type = $('#xxqd_user').val();
    var zq = $('#zq_user').val();
    var phone = $('#txtaphone').val();
    var remark = $('#txtaremark').val();
    $.post('adduser.ashx', { name: name, type: type, zq: zq, phone: phone, remark}, function (data) {
        if (data == '0') {
            mui.toast('保存成功');
        } else {
            mui.toast(data);
        }
        UserDaTa();
        closes();
    });
}
//update
function UserUpdate(id) {
    $('._UserList').hide(500);
    $('.Is_HS').show(500);
    $('.update_s').show(500);
    $('.add_s').hide(500);
    $('.Is_Hilist').hide(500);
    $('#hideuser').val(id);
    $.post('seluser.ashx', { id: id }, function (data) {
        if (data != "-1") {
            $('#zq_user').val(data[0].z_id);
            $('#txtname').val(data[0].name);
            $('#xxqd_user').val(data[0].type);
            $('#txtaphone').val(data[0].phone);
            $('#txtaremark').val(data[0].remark);
        } else {
            mui.toast('数据读取失败');
        }
    })
}
//UPDATE
function update_user() {
    var res = false;
    $('.user_verification input[type=text],.user_verification textarea').each(function (i, e) { if (e.value == null || e.value == '') { res = true; } });
    if (res) { mui.toast('请输入完整的信息！'); return false; }
    var id = $('#hideuser').val();
    var name = $('#txtname').val();
    var type = $('#xxqd_user').val();
    var zq = $('#zq_user').val();
    var phone = $('#txtaphone').val();
    var remark = $('#txtaremark').val();
    $.post('upuser.ashx', { id: id, name: name, type: type, zq: zq, phone: phone, remark}, function (data) {
        if (data == '0') {
            mui.toast('保存成功');
        } else {
            mui.toast(data);
        }
        UserDaTa();
        closes();
    });
}

//USER数据绑定
function UserDaTa() {
    $.post('seluser.ashx', {}, function (data) {
        if (data != "-1") {
            UserBind(data);
        } else {
            mui.toast('数据读取失败');
        }
    })
}
//USER遍历数据
function UserBind(data) {
    $('#tb2 tbody tr').remove();
    var op = '';
    var td1 = '';
    var td2 = '';
    var td3 = '';
    for (var p in data) {
        td1 = '<td class="input-group-addon">' + (parseInt(p) + 1) + '</td>';//<td class="input-group-addon hidden-480">' + data[p].z_id + '</td>\\
        td2 = '<td class="input-group-addon">' + data[p].name + '</td><td class="input-group-addon">' + data[p].type + '</td><td class="OverHideTd hidden-480" title="' + data[p].phone + '">' + data[p].phone + '</td>';
        td3 = '<td class="input-group-addon"><a href="javascript:;"  title="修改" onclick="UserUpdate(' + data[p].id + ')"><i class="ace-icon fa fa-pencil-square-o"></i></a></td>';
        $('#tb2 tbody').append('<tr>' + td1 + td2 + td3 + '</tr>');
    }
}


    


//取消添加/修改
function closes() {
    $('.Is_HS').hide(500);
    $('.Is_Hs_XXTJ').hide(500);
    $('.Is_Hilist,._UserList').show(500);
    $('textarea,input').val('');
    $('.xyx_show,.xyx_hide,.save_hide').show();
}
//点添加
function xxqdadd() {
    $('.Is_HS').show(500);
    $('.update_s,._UserList').hide(500);
    $('.add_s').show(500);
    $('.Is_Hilist').hide(500);
}
//信息渠道添加
function add_xxqd() {
    var txtname = $('#xxqdname').val();
    if (!txtname) { mui.toast('请输入完整信息！'); return false; }
    $.post('addxczftype.ashx', { name: txtname }, function (data) {
        if (data == '0') {
            mui.toast('添加成功');
        } else {
            mui.toast(data);
        }
        xxqdDaTa();
        closes();
    })
}
//信息渠道点修改
function xxqdupdate(id) {
    $('._UserList').hide(500);
    $('.Is_HS').show(500);
    $('.update_s').show(500);
    $('.add_s').hide(500);
    $('.Is_Hilist').hide(500);
    $('#hidexxqd').val(id);
    $.post('selxczftype.ashx', { id: id }, function (data) {
        if (data != "-1") {
            $('#xxqdname').val(data[0].Name);
        }
        else {
            mui.toast('数据读取失败');
        }
    })
}
//信息渠道修改
function update_xxqd() {
    //upxczftype.ashx
    var txtid = $('#hidexxqd').val();
    var txtname = $('#xxqdname').val();
    if (!txtname) { mui.toast('请输入完整信息！'); return false; }
    $.post('upxczftype.ashx', { name: txtname, id: txtid }, function (data) {
        if (data == '0') {
            mui.toast('修改成功');
        } else {
            mui.toast(data);
        }
        xxqdDaTa();
        closes();
    })
}
//信息渠道数据绑定
function xxqdDaTa() {
    //改t_xczf_type     selxczftype.ashx
    $.post('selxczftype.ashx', {}, function (data) {
        if (data != "-1") {
          //  alert(data);
            xxqdBind(data);
        } else {
            mui.toast('数据读取失败');
        }
    })
}
//信息渠道遍历数据
function xxqdBind(data) {
    $('#tb1 tbody tr').remove();
    $('.xxqd_user #xxqd_user').remove();
    var op = '';
    for (var p in data) {
        $('#tb1 tbody').append('<tr><td class="input-group-addon">' + (parseInt(p) + 1) + '</td><td class="input-group-addon">' + data[p].Name + '</td><td class="input-group-addon"><a href="javascript:;"  title="修改" onclick="xxqdupdate(' + data[p].id + ')"><i class="ace-icon fa fa-pencil-square-o"></i></a></td></tr>');
        op += '<option  value="' + data[p].Name + '">' + data[p].Name + '</option>';
    }
    $('.xxqd_user').append('<select id="xxqd_user" class="form-control input-mask-phone" style="border:1px solid #D5D5D5 !important">' + op + '</select>');
}





//站区单位//数据绑定
function ZQData() {
    $.post('../wd_disanf/selZYQINFO.ashx', {}, function (data) {
        if (data != "-1") {
            ZQBind(data);
        } else {
            mui.toast('数据读取失败');
        }

    })
}
//站区单位//遍历数据
function ZQBind(data) {
    var op = '';
    for (var p in data) {
        op += '<option value="' + data[p].zid + '">' + data[p].zname + '</option>';
    }
    $('.zq_user').append('<select id="zq_user" class="form-control input-mask-phone" style="border:1px solid #D5D5D5 !important">' + op + '</select>');
}

