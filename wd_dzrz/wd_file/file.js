function _Bind() {
    $('.Is_HS').hide();
    $('.Is_Hilist').show();
    $('#tb tbody tr').remove();

    //判断添加权限
    var txttid = $('#HideTid').val();
    if (txttid != '0' && txttid != '1' && txttid != '2') {
        $('.xxwj_hide').hide();
//        if (txttid != '1') {
//            $('.xxwj_hide1').hide();
//        }
//        if (txttid != '2') {
//            $('.xxwj_hide1').hide();
//        }
    }
}
function add(istype) {
    if (istype == "1") {
        $('.Is_HS').show(500);
    }
    else {
        $('.Is_HS1').show(500); 
    }
    $('.Is_Hilist').hide(500);
}
//取消添加/修改
function closes() {
    $('.Is_HS').hide(500);
    $('.Is_Hilist').show(500);
}
function closes1() {
    $('.Is_HS1').hide(500);
    $('.Is_Hilist').show(500);
}
//DEL
function del(id) {
    mui.confirm('确定要删除吗', 'DELETE', function (e) {
        if (e.index == 1) {
            $.post('deldata.ashx', { id: id }, function (data) {
                if (data != "-1") {
                    mui.toast('删除成功');
                    _Bind();
                    DaTa();
                } else {
                    mui.toast(data);
                }
            })
        } else {
            mui.toast('已取消');
        }
    })
}
//DEL
function del1(id) {
    mui.confirm('确定要删除吗', 'DELETE', function (e) {
        if (e.index == 1) {
            $.post('deldata1.ashx', { id: id }, function (data) {
                if (data != "-1") {
                    mui.toast('删除成功');
                    _Bind();
                    DaTa_2();
                } else {
                    mui.toast(data);
                }
            })
        } else {
            mui.toast('已取消');
        }
    })
}


//事件学习
function DaTa() {
    $.post('GetListBind.ashx', {}, function (data) {
        if (data != "-1") {
            DataBind(data, 'tb');

        } else {
            mui.toast('数据读取失败');
        }
    })
}
//有关通知
function DaTa_2() {
    $.post('selFile.ashx', {}, function (data) {
        if (data != "-1") {
            DataBind1(data, 'tb2');

        } else {
            mui.toast('数据读取失败');
        }
    })
}

function DataBind(data, tb) {
    $('#' + tb + ' tbody tr').remove();
    var txttid = $('#HideTid').val();
    var xiangqing = '';
    var tr = '';
    var td1 = '';
    var td2 = '';
    var href = '';
    var title = '';
    var tid = '';
    for (var p in data) {
        title = data[p].file_title;
        tid = data[p].t_id;
        href = 'http://dzrz.shuzihenan.com/file_data/' + tid + "/" + title;
        tname = (data[p].title).substring(1, 7) + '...';
        xiangqing = '<a href="' + href + '" download="' + title + '" title="下载"><i class="ace-icon fa fa-floppy-o bigger-130"></i></a> &nbsp;';
        if (txttid == '0') {
            xiangqing += '<a href="javascript:;"  title="修改"  onclick="f_UpTitle(\'' + data[p].id + '\',\'' + data[p].title + '\')"><i class="ace-icon fa fa-pencil-square-o"></i></a> &nbsp;<a href="javascript:;"  title="删除" onclick="del(' + data[p].id + ')"><i class="ace-icon fa fa-trash-o bigger-130"></i></a>';
        }
        td1 = '<td class="input-group-addon">' + (parseInt(p) + 1) + '</td><td class="input-group-addon"><a onclick="f_OpenDlg(\'' + data[p].id + '\',\'A\')">' + tname + '</a></td><td class="input-group-addon">' + IS_type(data[p].file_type) + '</td>';
        tr += '<tr>' + td1 + td2 + '<td class="input-group-addon">' + xiangqing + '</td></tr>';
    }
    $('#' + tb + ' tbody').append(tr);
}
function DataBind1(data, tb) {
    $('#' + tb + ' tbody tr').remove();
    var txttid = $('#HideTid').val();
    var xiangqing = '';
    var tr = '';
    var td1 = '';
    var td2 = '';
    var href = '';
    var title = '';
    var tid = '';
    for (var p in data) {
        title = data[p].file_title;
        tid = data[p].t_id;
        href = 'http://dzrz.shuzihenan.com/file_data1/' + tid + "/" + title;
        tname = (data[p].title).substring(1, 7) + '...';
        xiangqing = '<a href="' + href + '" download="' + title + '" title="下载"><i class="ace-icon fa fa-floppy-o bigger-130"></i></a> &nbsp;';
        if (txttid == '0' || txttid == '1') {
            xiangqing += '<a href="javascript:;"  title="修改"  onclick="f_UpTitle1(\'' + data[p].id + '\',\'' + data[p].title + '\')"><i class="ace-icon fa fa-pencil-square-o"></i></a> &nbsp;<a href="javascript:;"  title="删除"  onclick="del1(' + data[p].id + ')" ><i class="ace-icon fa fa-trash-o bigger-130"></i></a>';
        }
        td1 = '<td class="input-group-addon">' + (parseInt(p) + 1) + '</td><td class="input-group-addon"><a onclick="f_OpenDlg(\'' + data[p].id + '\',\'B\')">' + tname + '</a></td>';
        tr += '<tr>' + td1 + td2 + '<td class="input-group-addon">' + xiangqing + '</td></tr>';
    }
    $('#' + tb + ' tbody').append(tr);
}

function tid_(tid) {
    if (tid == "") {
        return "";
    } else {
        return tid + "\\";
    }
}
function IS_type(file_type) {
    if (file_type == "0") {
        return "专业资料";
    } else if (file_type == "1") {
        return "事故事件";
    } else {
        return file_type;
    }
}



function f_OpenDlg(id, istype) {
    layer.open({
        type: 2,
        title: '',
        skin: 'layui-layer-lan',
        closeBtn: 1, //不显示关闭按钮
        shade: [0],
        area: ['92%', '92%'],
        anim: 2,
        content: "file_data.aspx?file_id=" + id + "&&Is_File=" + istype
    });
}


//修改用户排序编号
function f_UpTitle(id, title) {
    layer.open({
        type: 1,
        title: '修改',
        closeBtn: 0,
        shadeClose: true,
        shade: false,
        area: ['300px', '230px'],
        content: '<div id="mydiv" style="margin-left:10px;margin-top:10px;"><input id="txtReason" type="text" value="' + title + '" autocomplete="off" /><select id="txttypes" class="form-control input-mask-phone" name="txttype" style="border:1px solid #D5D5D5 !important"><option value="0">程序文件</option> <option value="1">事故文件</option> </select></div>',
        btn: ['确定', '取消']
        , yes: function (index, layero) {
            var txtReason = $('#txtReason').val();
            var types_ = $('#txttypes').val();
            if (txtReason == "") {
                return false;
            }
            var url = "updatedata.ashx";
            $.post(url, { id: id, title: txtReason, type: types_ }, function (data) {
                if (data == '0') {
                    mui.toast('修改成功');
                } else {
                    mui.toast(data)
                }
                _Bind();
                DaTa();
                layer.close(index);
            });

        }
    });
}



//修改用户排序编号
function f_UpTitle1(id, title) {
    layer.open({
        type: 1,
        title: '修改',
        closeBtn: 0,
        shadeClose: true,
        shade: false,
        area: ['300px', '190px'],
        content: '<div id="mydiv" style="margin-left:10px;margin-top:10px;"><input id="txtReason" type="text" value="' + title + '" autocomplete="off" /></div>',
        btn: ['确定', '取消']
        , yes: function (index, layero) {
            var txtReason = $('#txtReason').val();
            if (txtReason == "") {
                return false;
            }
            var url = "updatedata1.ashx";
            $.post(url, { id: id, title: txtReason }, function (data) {
                if (data == '0') {
                    mui.toast('修改成功');
                } else {
                    mui.toast(data)
                }
                _Bind();
                DaTa_2();
                layer.close(index);
            });

        }
    });
}














$('#id-input-file-1 , #id-input-file-2').ace_file_input({
    no_file: 'No File ...',
    btn_choose: 'Choose',
    btn_change: 'Change',
    droppable: false,
    onchange: null,
    thumbnail: false
});



$('#file_as,#file1').ace_file_input({
    style: 'well',
    btn_choose: '点击上传文件&nbsp;&nbsp;',
    btn_change: null,
    no_icon: 'ace-icon fa fa-cloud-upload',
    droppable: true,
    thumbnail: 'small'

					,
    preview_error: function (filename, error_code) {
    }

}).on('change', function () {
});



$('#modal-form input[type=file]').ace_file_input({
    style: 'well',
    btn_choose: 'Drop files here or click to choose',
    btn_change: null,
    no_icon: 'ace-icon fa fa-cloud-upload',
    droppable: true,
    thumbnail: 'large'
})