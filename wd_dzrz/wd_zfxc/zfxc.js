////点修改
//function er_update(isfg, id, txtxjbm, txtxzbm, txtcw, txtjxs, txtxxy, txtnthz, txtjr_num,jxsall,xxyall,nthzall) {
//    $('.Is_HS div.sel_check').hide();
//    $('.Is_HS div.sel_check ul li').removeClass('check');

//    $('.Is_HS').hide(500);
//    $('.Is_HS_Up').show(500);

//    $('#hide_id').val(id);
//    $('#txtxjbmup').val(txtxjbm);
//    $('#txtxzbmup').val(txtxzbm);
//    $('#txtcwup').val(txtcw);
//    $('#txtjxsup').val(txtjxs);
//    $('#txtxxyup').val(txtxxy);
//    $('#txtnthzup').val(txtnthz);
//    $('#txtjr_numup').val(txtjr_num);

//    $('#hidejxsup').val(jxsall);
//    $('#hidexxyup').val(xxyall);
//    $('#hidenthzup').val(nthzall);

//}

//取消修改
function er_cancel() {
    $('.Is_HS_Up div.sel_check').hide();
    $('.Is_HS_Up div.sel_check ul li').removeClass('check');
    //$('.Is_HS').show(500);
    //$('.Is_HS_Up').hide(500);
    location.reload();
}
//UPDATE
function er_saveup(fg) {
    var txtid = $('#hide_id').val();
    var txttid = $('#hideFid').val();
    var txtxjbm = $('#txtxjbmup').val();
    var txtxzbm = $('#txtxzbmup').val();
    var txtcw = $('#txtcwup').val();
    var txtjxs = $('#txtjxsup').val();
    var txtxxy = $('#txtxxyup').val();
    var txtnthz = $('#txtnthzup').val();
    var txtjr_num = $('#txtjr_numup').val();

    var hidejxs = $('#hidejxsup').val();
    var hidexxy = $('#hidexxyup').val();
    var hidenthz = $('#hidenthzup').val();

    if (verification(txtxjbm, txtxzbm, txtcw, txtjxs, txtxxy, txtnthz, txtjr_num)) {
        $.post("../../it/XuanChuanZouFangUpdate.ashx ", {
            id: txtid, tid: txttid, xjbm: txtxjbm, xzbm: txtxzbm, cw: txtcw, jxs: txtjxs, xxy: txtxxy, nthz: txtnthz, jrnum: txtjr_num, fg: fg,
            alljxs: hidejxs, allxxy: hidexxy, allnthz: hidenthz
        }, function (data) {
            if (data == "0") {
                location.reload()
                mui.toast("修改成功!");
            } else {
                mui.toast(data);
            }
        });
    } else {
        mui.toast("请输入完整的信息~");
    }
}
//由暂存转为保存
function er_save(id) {
    mui.confirm('是否确认保存？', '保存', function (e) {
        if (e.index == 1) {
            _save(1, id);
        } else {
            mui.toast('已取消');
        }
    })
}
//由暂存转为保存
function _save(fg, id) {
    $.post("../../it/XuanChuanZouFangUpdateFg.ashx", { fg: fg, id: id }, function (data) {
        if (data == "0") {
            mui.toast("提交成功!");
            setTimeout(function () {
                location.reload();
            }, 500)
        } else {
            mui.toast(data);
        }
    })
}
//保存
function er_submint(fg) {
    var txttid = $('#hideFid').val();
    var txtxjbm = $('#txtxjbm').val();
    var txtxzbm = $('#txtxzbm').val();
    var txtcw = $('#txtcw').val();
    var txtjxs = $('#txtjxs').val();
    var txtxxy = $('#txtxxy').val();
    var txtnthz = $('#txtnthz').val();
    var txtjr_num = $('#txtjr_num').val();
    var hidejxs = $('#hidejxs').val();
    var hidexxy = $('#hidexxy').val();
    var hidenthz = $('#hidenthz').val();


    if (verification(txtxjbm, txtxzbm, txtcw, txtjxs, txtxxy, txtnthz, txtjr_num)) {
        $.post("../../it/XuanChuanZouFangAdd.ashx", {
            tid: txttid, xjbm: txtxjbm, xzbm: txtxzbm, cw: txtcw, jxs: txtjxs, xxy: txtxxy, nthz: txtnthz, jrnum: txtjr_num, fg: fg,
            alljxs: hidejxs, allxxy: hidexxy, allnthz: hidenthz
        }, function (data) {
            if (data == "0") {
                location.reload()
                mui.toast("提交成功!");
            } else {
                mui.toast(data);
            }
        });
    } else {
        mui.toast("请输入完整的信息~");
    }
}
//验证
function verification(a, b, c, d, e, f, g) {
    var res = true;
    if (a == null || a == "") {
        res = false;
    }
    if (b == null || b == "") {
        res = false;
    }
    if (c == null || c == "") {
        res = false;
    }
    if (d == null || d == "") {
        res = false;
    }
    if (e == null || e == "") {
        res = false;
    }
    if (f == null || f == "") {
        res = false;
    }
    if (g == null || g == "") {
        res = false;
    }
    return res;
}


//下拉显示隐藏
//function AllSel() {
//绑定寻访人员数据
//GetUserName('机械手', '.User_jxs');
//GetUserName('信息员', '.User_xxy')
//GetUserName('农田户主', '.User_nthz')
//GetUserNameUp('机械手', '.User_jxs_up');
//GetUserNameUp('信息员', '.User_xxy_up')
//GetUserNameUp('农田户主', '.User_nthz_up')
//SelList('txtjxs');
//SelList('txtxxy');
//SelList('txtnthz');
//SelList('txtjxsup');
//SelList('txtxxyup');
//SelList('txtnthzup');
//}
////下拉显示隐藏
//function SelList(id) {
//    $('#' + id).click(function () {
//        if ($('#' + id + '~div.sel_check').is(':hidden')) {
//            $('div.sel_check').hide();
//            $('#' + id + '~div.sel_check').show();
//        } else {
//            $('#' + id + '~div.sel_check').hide();
//        }
//    })
//}
////Get人数
//function IsHidden(id) {
//    if ($('#' + id).attr('class') == 'check') {
//        $('#' + id).removeClass('check');
//    } else {
//        $('#' + id).addClass('check');
//    }
//}
//默认给Input获取值
//function GetInput(id) {
//    var _lenth = $('#' + id + '~div.sel_check ul li').length;
//    $('#' + id).val('0\\' + _lenth);
//}
//给Input获取选中的值
//function GetNum(id) {
//    $('#' + id + '~div.sel_check ul li').click(function () {
//        var _lenth = $('#' + id + '~div.sel_check ul li').length;
//        var _check = $('#' + id + '~div.sel_check ul li.check').length;
//        $('#' + id).val(_check + '\\' + _lenth);
//    })
//    total();
//}
////获取读取绑定数据ADD
//function GetUserName(type, _class) {
//    var li = '';
//    $.post('SelUserByType.ashx', { type: type }, function (data) {
//        if (data == '-1') { mui.toast('数据读取失败，请重试！') } else {
//            if (data != null) {
//                for (var i = 0; i < data.length; i++) {
//                    li += '<li id="a_' + data[i].id + '" onclick="IsHidden(\'a_' + data[i].id + '\')">' + data[i].name + '</li>';
//                }
//                $(_class).append('<div class="sel_check" ><ul>' + li + '</ul></div>');
//            } else {
//                $(_class).append('<div class="sel_check"><ul><h5>此类角色人员为空。<h5></ul></div>');
//            }
//        }
//        GetInput('txtjxs');
//        GetInput('txtxxy');
//        GetInput('txtnthz');
//    })
//}
//获取读取绑定数据UPDATE
//function GetUserNameUp(type, _class) {
//    var li = '';
//    $.post('SelUserByType.ashx', { type: type }, function (data) {
//        if (data == '-1') { mui.toast('数据读取失败，请重试！') } else {
//            if (data != null) {
//                for (var i = 0; i < data.length; i++) {
//                    li += '<li id="b_' + data[i].id + '" onclick="IsHidden(\'b_' + data[i].id + '\')">' + data[i].name + '</li>';
//                }
//                $(_class).append('<div class="sel_check" ><ul>' + li + '</ul></div>');
//            } else {
//                $(_class).append('<div class="sel_check"><ul><h5>此类角色人员为空。<h5></ul></div>');
//            }
//        }
//        GetInput('txtjxsup');
//        GetInput('txtxxyup');
//        GetInput('txtnthzup');
//    })
//}
//计算总数
//function total() {
//    var jxs = $('#txtjxs').val();
//    var xxy = $('#txtxxy').val();
//    var nthz = $('#txtnthz').val();

//    var jxs_lenth = jxs.indexOf('\\');
//    var xxy_lenth = xxy.indexOf('\\');
//    var nthz_lenth = nthz.indexOf('\\');

//    var jxs_num = jxs.substring(0, jxs_lenth);
//    var xxy_num = xxy.substring(0, xxy_lenth);
//    var nthz_num = nthz.substring(0, nthz_lenth);

//    var num = parseInt(jxs_num) + parseInt(xxy_num) + parseInt(nthz_num);

//    $('#txtjr_num').val(num);

//    var jxsup = $('#txtjxsup').val();
//    var xxyup = $('#txtxxyup').val();
//    var nthzup = $('#txtnthzup').val();

//    var jxs_num_up = jxsup.substring(0, jxsup.indexOf('\\'));
//    var xxy_num_up = xxyup.substring(0, xxyup.indexOf('\\'));
//    var nthz_num_up = nthzup.substring(0, nthzup.indexOf('\\'));

//    var num_up = parseInt(jxs_num_up) + parseInt(xxy_num_up) + parseInt(nthz_num_up);

//    $('#txtjr_numup').val(num_up);
//}