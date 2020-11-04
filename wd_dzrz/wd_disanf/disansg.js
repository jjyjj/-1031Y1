function DefaultBind() {
    xxqdDaTa(); //绑定数据//信息渠道
    xzsgData(); //绑定数据//新增施工
    dsfsgData(); //绑定数据//第三方施工
    jhpDaTa(); //数据绑定//各站监护点统计表
    jcxmDaTa(); //数据绑定//写入检查项目
    ZQData();
    NumData();
}
//+++++Text
function Add_jcxm_textarea() {
    var txta = '<textarea class="form-control add_jrjcxms" rows="2"  placeholder="请输入" style=" margin:0;"></textarea> ';
    $('.add_jrjcxm').append(txta);
}
//-----Text
function Del_jcxm_textarea() {
    if ($('.add_jrjcxm textarea').length > 1) {
        $('.add_jrjcxm textarea:last').remove();
    } else {
        mui.toast('至少有一个');
    }

}


//取消添加/修改
function closes() {
    $('.Is_HS').hide(500);
    $('.Is_Hs_XXTJ').hide(500);
    $('.Is_Hilist').show(500);
    $('textarea,input').val('');

    $('textarea,input,select').removeAttr('readonly');
    $('select').removeAttr('disabled');
    $('.xyx_show,.xyx_hide,.save_hide').show();
}
//点添加
function xxqdadd() {
    $('.xyx_show,.xyx_hide').hide();
    $('.Is_HS').show(500);
    $('.update_s').hide(500);
    $('.add_s').show(500);
    $('.Is_Hilist').hide(500);
}
//信息渠道添加
function add_xxqd() {
    var txtname = $('#xxqdname').val();
    if (!txtname) { mui.toast('请输入完整信息！'); return false; }
    $.post('addxxqd.ashx', { name: txtname }, function (data) {
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
    $('.xyx_show,.xyx_hide').hide();

    $('.Is_HS').show(500);
    $('.update_s').show(500);
    $('.add_s').hide(500);
    $('.Is_Hilist').hide(500);
    $('#hidexxqd').val(id);
    $.post('selxxqd.ashx', { id: id }, function (data) {
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
    var txtid = $('#hidexxqd').val();
    var txtname = $('#xxqdname').val();
    if (!txtname) { mui.toast('请输入完整信息！'); return false; }
    $.post('upxxqd.ashx', { name: txtname, id: txtid }, function (data) {
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
    $.post('selxxqd.ashx', {}, function (data) {
        if (data != "-1") {
            xxqdBind(data);
        } else {
            mui.toast('数据读取失败');
        }

    })
}
//信息渠道遍历数据
function xxqdBind(data) {
    $('#tb1 tbody tr').remove();
    $('.xxqdxlk #xzsgxxqd').remove();
    var op = '';

    for (var p in data) {
        $('#tb1 tbody').append('<tr><td class="input-group-addon">' + (parseInt(p) + 1) + '</td><td class="input-group-addon">' + data[p].Name + '</td><td class="input-group-addon"><a href="javascript:;"  title="修改" onclick="xxqdupdate(' + data[p].id + ')"><i class="ace-icon fa fa-pencil-square-o"></i></a></td></tr>');
        op += '<option  value="' + data[p].Name + '">' + data[p].Name + '</option>';
    }
    $('.xxqdxlk').append('<select id="xzsgxxqd" class="form-control input-mask-phone" style="border:1px solid #D5D5D5 !important">' + op + '</select>');
}





//新增施工ADD
function add_xzsg() {
    var zid = $('#xzsg_zq_dw').val()
    var xzsgcontent = $('#xzsgcontent').val();
    var xzsgxxqd = $('#xzsgxxqd').val();
    var xzsgclgc = $('#xzsgclgc').val();
    var xzsgsname = $('#xzsgsname').val();
    var xzsgsphone = $('#xzsgsphone').val();
    var xzsgtype = $('#xzsgtype').val();
    if (!xzsgcontent || !xzsgxxqd || !xzsgclgc || !xzsgsname || !xzsgsphone || !xzsgtype) {
        mui.toast('请输入完整的信息');
        return false;
    }
    $.post('addxzsg.ashx', { zid: zid, content: xzsgcontent, xxqd: xzsgxxqd, clgc: xzsgclgc, sname: xzsgsname, sphone: xzsgsphone, type: xzsgtype }, function (data) {
        if (data == '0') {
            mui.toast('添加成功');
        } else {
            mui.toast(data);
        }
        xzsgData();
        closes();
    })
}
//新增施工点修改
function xzsgupdate(id) {
    $('.Is_HS').show(500);
    $('.update_s').show(500);
    $('.add_s').hide(500);
    $('.Is_Hilist').hide(500);
    $('.xyx_show,.xyx_hide').hide();

    $('#hidexzsg').val(id);

    $.post('selxzsg.ashx', { id: id }, function (data) {
        if (data != "-1") {
            $('#xzsg_zq_dw').val(data[0].z_id)
            $('#xzsgcontent').val(data[0]._content);
            $('#xzsgxxqd').val(data[0].xinxiqudao);
            $('#xzsgclgc').val(data[0].clgc);
            $('#xzsgsname').val(data[0].sname);
            $('#xzsgsphone').val(data[0].sphone);
            $('#xzsgtype').val(data[0].type);
        }
        else {
            mui.toast('数据读取失败');
        }
    })
}
//新增施工修改
function update_xzsg() {
    var zid = $('#xzsg_zq_dw').val()
    var txtid = $('#hidexzsg').val();
    var xzsgcontent = $('#xzsgcontent').val();
    var xzsgxxqd = $('#xzsgxxqd').val();
    var xzsgclgc = $('#xzsgclgc').val();
    var xzsgsname = $('#xzsgsname').val();
    var xzsgsphone = $('#xzsgsphone').val();
    var xzsgtype = $('#xzsgtype').val();
    if (!xzsgcontent || !xzsgxxqd || !xzsgclgc || !xzsgsname || !xzsgsphone || !xzsgtype) {
        mui.toast('请输入完整的信息');
        return false;
    }
    $.post('upxzsg.ashx', { zid: zid, id: txtid, content: xzsgcontent, xxqd: xzsgxxqd, clgc: xzsgclgc, sname: xzsgsname, sphone: xzsgsphone, type: xzsgtype }, function (data) {
        if (data == '0') {
            mui.toast('修改成功');
        } else {
            mui.toast(data);
        }
        xzsgData();
        closes();
    })

}


//新增施工详情
function xzsgdata(id) {     //readonly ="readonly "
    $('textarea,input,select').attr('readonly', 'readonly');
    $('select').attr('disabled', 'fales');
    $('#input_xxqd').show();
    $('#input_xxqd').show();

    $('.xyx_show,.xyx_hide,.save_hide').hide();

    $('.Is_HS').show(500);
    $('.update_s').show(500);
    $('.add_s').hide(500);
    $('.Is_Hilist').hide(500);
    $('#hidexzsg').val(id);

    $.post('selxzsg.ashx', { id: id }, function (data) {
        if (data != "-1") {

            $('#xzsg_zq_dw').val(data[0].z_id);
            $('#xzsgcontent').val(data[0]._content);
            $('#xzsgxxqd').val(data[0].xinxiqudao);
            $('#xzsgclgc').val(data[0].clgc);
            $('#xzsgsname').val(data[0].sname);
            $('#xzsgsphone').val(data[0].sphone);
            $('#xzsgtype').val(data[0].type);
        }
        else {
            mui.toast('数据读取失败');
        }
    })
}

//新增施工获取数据
function xzsgData() {
    $.post('selxzsg.ashx', {}, function (data) {
        if (data != "-1") {
            xzsgBind(data);
        } else {
            mui.toast('数据读取失败');
        }
    })
}
//新增施工遍历数据
function xzsgBind(data) {
    $('#tb2 tbody tr').remove();
    var xiangqing = '';
    var tr = '';
    var td1 = '';
    var td2 = '';
    var shenpi = '<i class="ace-icon fa fa-exclamation-triangle bigger-121" style="  cursor:pointer; position:absolute; left:15px; top:11px; color: #D15B47; " onclick="f_Open_View(\'T_Dsan_xinzengshigong\',\'';
    var shenpi_ = '\')"  title="审批未通过/被退回/修改后可再次审批"></i> ';
    var shenpi_yes = '<i class="ace-icon fa fa-exclamation-triangle bigger-121" style="  cursor:pointer; position:absolute; left:15px; top:11px; color: #99FF99; " onclick="f_Open_View(\'T_Dsan_xinzengshigong\',\'';
    var shenpi_yes_ = '\')"  title="审批通过"></i> ';
    for (var p in data) {
        xiangqing = '<a href="javascript:;"  title="详情" onclick="xzsgdata(' + data[p].id + ')"><i class="ace-icon glyphicon glyphicon-file"></i></a><a href="javascript:;"  title="修改" onclick="xzsgupdate(' + data[p].id + ')"><i class="ace-icon fa fa-pencil-square-o"></i></a>';
        if (data[p].sp1 == '-1' || data[p].sp2 == '-1' || data[p].sp3 == '-1') {
            td1 = '<td class="input-group-addon" style="position:relative;">' + shenpi + data[p].id + shenpi_ + (parseInt(p) + 1) + ' </td><td class="input-group-addon">' + data[p].xinxiqudao + '</td>';
        } else if (data[p].sp1 == '1' || data[p].sp2 == '1' || data[p].sp3 == '1') {
            td1 = '<td class="input-group-addon" style="position:relative;">' + shenpi_yes + data[p].id + shenpi_yes_ + (parseInt(p) + 1) + ' </td><td class="input-group-addon">' + data[p].xinxiqudao + '</td>';
        } else {
            td1 = '<td class="input-group-addon">' + (parseInt(p) + 1) + ' </td><td class="input-group-addon">' + data[p].xinxiqudao + '</td>';
        }
        td2 = '<td class="input-group-addon">' + data[p].sname + '</td><td class="input-group-addon">' + texttype(data[p].type) + '</td>';
        tr += '<tr>' + td1 + td2 + '<td class="input-group-addon">' + xiangqing + '</td></tr>';
    }
    $('#tb2 tbody').append(tr);
}
//审批详情
function f_Open_View(tables,id) {
    layer.open({
        type: 2,
        title: '',
        skin: 'layui-layer-lan',
        closeBtn: 1, //不显示关闭按钮
        shade: [0],
        area: ['35%', '60%'],
        anim: 2,
        content: 'Reason.aspx?id=' + id + '&&TABLE_S=' + tables
    });
}
//施工类型文字转换
function texttype(type) {
    var res = '';
    if (type == "0") {
        res = '双快一保'
    } else if (type == "1") {
        res = "大型施工";
    }
    return res;
} 
//第三方施工//ADD
function add_dsfsg() {
    var zczyq = $('#dsf_zczyq').val();
    var xzqyzh = $('#dsf_xzqyzh').val();

    var zh = $('#dsf_zh').val();

    var gcmc = $('#dsf_gcmc').val();
    var ms = $('#dsf_ms').val();
    var lxfs = $('#dsf_lxfs').val();
    var gdglsm = $('#dsf_gdglsm').val();
    var startime = $('#dsf_startime').val();
    var sgjd = $('#dsf_sgjd').val();
    var is_hfff_jc = '否';
    if ($('#dsf_is_hfff_jc').is(":checked")) { is_hfff_jc = '是'; }

    var gdms = $('#dsf_gdms').val();
    var sg_isns = '否';
    if ($('#dsf_sg_isns').is(':checked')) { sg_isns = '是'; }

    var pshjl = $('#dsf_pshjl').val();
    var is_jd = '否';
    if ($('#dsf_is_jd').is(':checked')) { is_jd = '是'; }

    var bzsg = $('#dsf_bzsg').val();
    var xzsg = $('#dsf_xzsg').val();
    var zcfzr = $('#dsf_zcfzr').val();
    var remark = $('#dsf_remark').val();
    if (!zczyq || !xzqyzh || !gcmc || !ms || !lxfs || !gdglsm || !startime || !gdms || !pshjl || !bzsg || !xzsg || !zcfzr) {
        mui.toast('请输入完整信息');
        return false;
    }

    $.post('adddsfsg.ashx', {
        zh: zh, zczyq: zczyq, xzqyzh: xzqyzh, gcmc: gcmc, ms: ms, lxfs: lxfs, gdglsm: gdglsm, startime: startime, sgjd: sgjd,
        is_hfff_jc: is_hfff_jc, gdms: gdms, sg_isns: sg_isns, pshjl: pshjl, is_jd: is_jd, bzsg: bzsg, xzsg: xzsg, zcfzr: zcfzr, remark: remark
    }, function (data) {
        if (data == '0') {
            mui.toast('添加成功');
        } else {
            mui.toast(data);
        }
        dsfsgData();
        closes();
    })

}

//第三施工/点修改
function dsfsgupdate(id) {
    $('#input_xxqd').show();
    $('#input_xxqd').show();

    $('.xyx_show,.xyx_hide').hide(); //上个下个/隐藏

    $('.Is_HS').show(500);
    $('.add_s').hide(500);
    $('.update_s').show(500);
    $('.Is_Hilist').hide(500);
    $('#hidedsfsg').val(id);

    $.post('seldsfsg.ashx', { id: id }, function (data) {
        if (data != "-1") {
            $('#dsf_zczyq').val(data[0].z_id);
            $('#dsf_xzqyzh').val(data[0].xzqyzh);
            $('#dsf_gcmc').val(data[0].gcmc);
            $('#dsf_ms').val(data[0].ms);
            $('#dsf_lxfs').val(data[0].lxfs);
            $('#dsf_gdglsm').val(data[0].gdglsm);
            $('#dsf_startime').val(data[0].startime);
            $('#dsf_sgjd').val(data[0].sgjd);

            if (data[0].is_hfff_jc == '是') { $('#dsf_is_hfff_jc').attr('checked', 'true'); } else { $('#dsf_is_hfff_jc').removeAttr('checked'); }

            $('#dsf_gdms').val(data[0].gdms);

            if (data[0].sg_isns == '是') { $('#dsf_sg_isns').attr('checked', 'true'); } else { $('#dsf_sg_isns').removeAttr('checked'); }

            $('#dsf_pshjl').val(data[0].pshjl);

            if (data[0].is_jd == '是') { $('#dsf_is_jd').attr('checked', 'true'); } else { $('#dsf_is_jd').removeAttr('checked'); }

            $('#dsf_bzsg').val(data[0].bzsg);
            $('#dsf_xzsg').val(data[0].xzsg);
            $('#dsf_zcfzr').val(data[0].zcfzr);
            $('#dsf_remark').val(data[0].remark);
        }
        else {
            mui.toast('数据读取失败');
        }
    })

}
//第三施工/修改
function update_dsfsg(id) {
    var id = $('#hidedsfsg').val();
    var zczyq = $('#dsf_zczyq').val();
    var xzqyzh = $('#dsf_xzqyzh').val();
    var zh = $('#dsf_zh').val();



    var gcmc = $('#dsf_gcmc').val();
    var ms = $('#dsf_ms').val();
    var lxfs = $('#dsf_lxfs').val();
    var gdglsm = $('#dsf_gdglsm').val();
    var startime = $('#dsf_startime').val();
    var sgjd = $('#dsf_sgjd').val();
    var is_hfff_jc = '否';
    if ($('#dsf_is_hfff_jc').is(":checked")) { is_hfff_jc = '是'; }

    var gdms = $('#dsf_gdms').val();
    var sg_isns = '否';
    if ($('#dsf_sg_isns').is(':checked')) { sg_isns = '是'; }

    var pshjl = $('#dsf_pshjl').val();
    var is_jd = '否';
    if ($('#dsf_is_jd').is(':checked')) { is_jd = '是'; }

    var bzsg = $('#dsf_bzsg').val();
    var xzsg = $('#dsf_xzsg').val();
    var zcfzr = $('#dsf_zcfzr').val();
    var remark = $('#dsf_remark').val();
    if (!zczyq || !xzqyzh || !gcmc || !ms || !lxfs || !gdglsm || !startime || !gdms || !pshjl || !bzsg || !xzsg || !zcfzr) {
        mui.toast('请输入完整信息');
        return false;
    }

    $.post('updsfsg.ashx', {
        zczyq: zczyq, zh: zh, xzqyzh: xzqyzh, gcmc: gcmc, ms: ms, lxfs: lxfs, gdglsm: gdglsm, startime: startime, sgjd: sgjd, id: id,
        is_hfff_jc: is_hfff_jc, gdms: gdms, sg_isns: sg_isns, pshjl: pshjl, is_jd: is_jd, bzsg: bzsg, xzsg: xzsg, zcfzr: zcfzr, remark: remark
    }, function (data) {
        if (data == '0') {
            mui.toast('修改成功');
        } else {
            mui.toast(data);
        }
        dsfsgData();
        closes();
    })
}
//第三施工/详情
function dsfsgdata(id) {
    $('textarea,input,select').attr('readonly', 'readonly');
    $('select,input[checkbox]').attr('disabled', 'fales');
    $('#input_xxqd').show();
    $('#input_xxqd').show();

    $('.xyx_show,.xyx_hide,.save_hide').hide();

    $('.Is_HS').show(500);
    $('.update_s').show(500);
    $('.add_s').hide(500);
    $('.Is_Hilist').hide(500);

    $.post('seldsfsg.ashx', { id: id }, function (data) {
        if (data != "-1") {
            $('#dsf_zczyq').val(data[0].z_id);
            $('#dsf_xzqyzh').val(data[0].xzqyzh);
            $('#dsf_zh').val(data[0].zh);
            $('#dsf_gcmc').val(data[0].gcmc);
            $('#dsf_ms').val(data[0].ms);
            $('#dsf_lxfs').val(data[0].lxfs);
            $('#dsf_gdglsm').val(data[0].gdglsm);
            $('#dsf_startime').val(data[0].startime);
            $('#dsf_sgjd').val(data[0].sgjd);

            if (data[0].is_hfff_jc == '是') { $('#dsf_is_hfff_jc').attr('checked', 'true'); } else { $('#dsf_is_hfff_jc').removeAttr('checked'); }

            $('#dsf_gdms').val(data[0].gdms);

            if (data[0].sg_isns == '是') { $('#dsf_sg_isns').attr('checked', 'true'); } else { $('#dsf_sg_isns').removeAttr('checked'); }

            $('#dsf_pshjl').val(data[0].pshjl);

            if (data[0].is_jd == '是') { $('#dsf_is_jd').attr('checked', 'true'); } else { $('#dsf_is_jd').removeAttr('checked'); }

            $('#dsf_bzsg').val(data[0].bzsg);
            $('#dsf_xzsg').val(data[0].xzsg);
            $('#dsf_zcfzr').val(data[0].zcfzr);
            $('#dsf_remark').val(data[0].remark);
        }
        else {
            mui.toast('数据读取失败');
        }
    })
}
//第三施工/数据绑定
function dsfsgData() {
    $.post('seldsfsg.ashx', {}, function (data) {
        if (data != "-1") {
            dsfsgBind(data);
        } else {
            mui.toast('数据读取失败');
        }
    })
}
//第三方施工/解析便利数据
function dsfsgBind(data) {
    $('#tb3 tbody tr').remove();
    var tr = '';
    var td1 = '';
    var td2 = '';
    var caozuo = '';
    var shenpi = '<i class="ace-icon fa fa-exclamation-triangle bigger-121" style="  cursor:pointer; position:absolute; left:15px; top:11px; color: #D15B47; " onclick="f_Open_View(\'T_Dsan_shigong\',\'';
    var shenpi_ = '\')"  title="审批未通过/被退回/修改后可再次审批"></i> ';
    var shenpi_yes = '<i class="ace-icon fa fa-exclamation-triangle bigger-121" style="  cursor:pointer; position:absolute; left:15px; top:11px; color: #99FF99; " onclick="f_Open_View(\'T_Dsan_shigong\',\'';
    var shenpi_yes_ = '\')"  title="审批通过"></i> ';
    for (var p in data) {
        caozuo = '<a href="javascript:;"  title="详情" onclick="dsfsgdata(' + data[p].id + ')"><i class="ace-icon glyphicon glyphicon-file"></i></a>&nbsp;<a href="javascript:;"  title="修改" onclick="dsfsgupdate(' + data[p].id + ')"><i class="ace-icon fa fa-pencil-square-o"></i></a>';
        if (data[p].sp1 == '-1' || data[p].sp2 == '-1' || data[p].sp3 == '-1') {
            td1 = '<td class="input-group-addon" style="position:relative;">' + shenpi + data[p].id + shenpi_ + (parseInt(p) + 1) + '</td><td class="input-group-addon">' + data[p].gcmc + '</td>';
        } else if (data[p].sp1 == '1' || data[p].sp2 == '1' || data[p].sp3 == '1') {
            td1 = '<td class="input-group-addon" style="position:relative;">' + shenpi_yes + data[p].id + shenpi_yes_ + (parseInt(p) + 1) + '</td><td class="input-group-addon">' + data[p].gcmc + '</td>';
        } else {
            td1 = '<td class="input-group-addon">' + (parseInt(p) + 1) + '</td><td class="input-group-addon">' + data[p].gcmc + '</td>';
        }

        td2 = '<td class="input-group-addon hidden-480">' + data[p].startime + '</td><td class="input-group-addon">' + sgjd_text(data[p].sgjd) + '</td>';
        tr += '<tr>' + td1 + td2 + '<td class="input-group-addon">' + caozuo + '</td></tr>';
    }
    $('#tb3 tbody').append(tr);
}
//施工进度转换文字
function sgjd_text(sgjd) {
    switch (sgjd) {
        case '6':
            return "联合验收";
            break;
        case '5':
            return "全程监护";
            break;
        case '4':
            return "签订协议";
            break;
        case '3':
            return "方案审查";
            break;
        case '2':
            return "开挖验证";
            break;
        case '1':
            return "安全告知";
            break;
        case '0':
            return "预控阶段";
            break;
        default:
            return "";
            break;
    }
} 
//监护点//ADD
function add_jhd() {
    var zid = $('#jhd_zq_dw').val();
    var txtjhd = $('#txtjhd').val();
    var txtjhname = $('#txtjhname').val();
    var txtjhphone = $('#txtjhphone').val();
    var txtjhtype = $('#txtjhtype').val();
    var txtjd = $('#txtjd').val();
    if (!txtjhd || !txtjhname || !txtjhphone || !txtjhtype || !txtjd) {
        mui.toast('请输入完整信息');
        return false;
    }

    $.post('addjhd.ashx', { zid: zid, jhd: txtjhd, jhname: txtjhname, jhphone: txtjhphone, jhtype: txtjhtype, jd: txtjd }, function (data) {
        if (data == '0') {
            mui.toast('添加成功');
        } else {
            mui.toast(data);
        }
        jhpDaTa();
        closes();
    })

}
//监护点//点修改
function jhdupdate(id) {
    $('.Is_HS').show(500);
    $('.update_s').show(500);
    $('.add_s').hide(500);
    $('.Is_Hilist').hide(500);
    $('.xyx_show,.xyx_hide').hide();

    $('#hidejhd').val(id);

    $.post('seljhd.ashx', { id: id }, function (data) {
        if (data != "-1") {
            $('#jhd_zq_dw').val(data[0].z_id);
            $('#txtjhd').val(data[0].jhd);
            $('#txtjhname').val(data[0].jhname);
            $('#txtjhphone').val(data[0].jhphone);
            $('#txtjhtype').val(data[0].jhtype);
            $('#txtjd').val(data[0].jd);
        }
        else {
            mui.toast('数据读取失败');
        }
    })
}
//监护点//修改数据
function update_jhd() {
    var zid = $('#jhd_zq_dw').val();
    var txtid = $('#hidejhd').val();
    var txtjhd = $('#txtjhd').val();
    var txtjhname = $('#txtjhname').val();
    var txtjhphone = $('#txtjhphone').val();
    var txtjhtype = $('#txtjhtype').val();
    var txtjd = $('#txtjd').val();
    if (!txtjhd || !txtjhname || !txtjhphone || !txtjhtype || !txtjd) {
        mui.toast('请输入完整信息');
        return false;
    }

    $.post('upjhd.ashx', { zid: zid, jhd: txtjhd, jhname: txtjhname, jhphone: txtjhphone, jhtype: txtjhtype, jd: txtjd, id: txtid }, function (data) {
        if (data == '0') {
            mui.toast('修改成功');
        } else {
            mui.toast(data);
        }
        jhpDaTa();
        closes();
    })
}
//监护点//数据绑定
function jhpDaTa() {
    $.post('seljhd.ashx', {}, function (data) {
        if (data != "-1") {
            jhpBind(data);
        } else {
            mui.toast('数据读取失败');
        }

    })
}
//监护点//遍历数据
function jhpBind(data) {
    $('#tb5 tbody tr').remove();
    var tr = '';
    var td1 = '';
    var td2 = '';
    var caozuo = '';
    var shenpi = '<i class="ace-icon fa fa-exclamation-triangle bigger-121" style="  cursor:pointer; position:absolute; left:15px; top:11px; color: #D15B47; " onclick="f_Open_View(\'T_Dsan_jindu\',\'';
    var shenpi_ = '\')"  title="审批未通过/被退回/修改后可再次审批"></i> ';
    var shenpi_yes = '<i class="ace-icon fa fa-exclamation-triangle bigger-121" style="  cursor:pointer; position:absolute; left:15px; top:11px; color: #99FF99; " onclick="f_Open_View(\'T_Dsan_jindu\',\'';
    var shenpi_yes_ = '\')"  title="审批通过"></i> ';
    for (var p in data) {
        caozuo = '<a href="javascript:;"  title="修改" onclick="jhdupdate(' + data[p].id + ')"><i class="ace-icon fa fa-pencil-square-o"></i></a>';
        if (data[p].sp1 == '-1' || data[p].sp2 == '-1' || data[p].sp3 == '-1') {
            td1 = '<td class="input-group-addon" style="position:relative;">' + shenpi + data[p].id + shenpi_ + (parseInt(p) + 1) + '</td><td class="input-group-addon">' + data[p].jhd + '</td><td class="input-group-addon">' + data[p].jhname + '</td>';
        } else if (data[p].sp1 == '1' || data[p].sp2 == '1' || data[p].sp3 == '1') {
            td1 = '<td class="input-group-addon" style="position:relative;">' + shenpi_yes + data[p].id + shenpi_yes_ + (parseInt(p) + 1) + '</td><td class="input-group-addon">' + data[p].jhd + '</td><td class="input-group-addon">' + data[p].jhname + '</td>';
        } else {
            td1 = '<td class="input-group-addon">' + (parseInt(p) + 1) + '</td><td class="input-group-addon">' + data[p].jhd + '</td><td class="input-group-addon">' + data[p].jhname + '</td>';
        }
        td2 = '<td class="input-group-addon hidden-480">' + data[p].jhphone + '</td><td class="input-group-addon hidden-480">' + data[p].jhtype + '</td><td class="input-group-addon">' + data[p].jd + '</td>';
        tr += '<tr>' + td1 + td2 + '<td class="input-group-addon">' + caozuo + '</td></tr>';
    }
    $('#tb5 tbody').append(tr);
} 
//写入检查项目//ADD
function add_jcxm() {
    var txtnum = $('#txtNums').val();
    var add_jrjcxms = $('#txtjrjcxm').val();
    var zid = $('#xrjcxm_zq_dw').val();
    var txtjrjcxm = $('#txtjrjcxm').val();
    var txtfxwt = $('#txtfxwt').val();
    var txtwtzg = $('#txtwtzg').val();
    var txtqt_xr = $('#txtqt_xr').val();
    if (!txtjrjcxm || !txtfxwt || !txtwtzg || !xzsgsname || !txtqt_xr) {
        mui.toast('请输入完整的信息');
        return false;
    }
    $.post('addjc.ashx', { zid: zid, jrjcxm: txtjrjcxm, fxwt: txtfxwt, wtzg: txtwtzg, qt: txtwtzg, num: txtnum }, function (data) {
        if (data == '0') {
            mui.toast('添加成功');
        } else {
            mui.toast(data);
        }
        jcxmDaTa();
        closes();
    })
}
//写入检查//点修改
function jcxmupdate(id) {
    $('.xyx_show,.xyx_hide').hide();

    $('.Is_HS').show(500);
    $('.update_s').show(500);
    $('.add_s').hide(500);
    $('.Is_Hilist').hide(500);
    $('#hidejrjc').val(id);
    $.post('seljc.ashx', { id: id }, function (data) {
        if (data != "-1") {
            $('#txtNums').val(data[0].jrjc_num)
            $('#xrjcxm_zq_dw').val(data[0].z_id);
            $('#txtjrjcxm').val(data[0].jrjcxm);
            $('#txtfxwt').val(data[0].fxwt);
            $('#txtwtzg').val(data[0].wtzg);
            $('#txtqt_xr').val(data[0].qt);
        }
        else {
            mui.toast('数据读取失败');
        }
    })
}
//写入检测//修改
function update_jcxm() {
    var txtnum = $('#txtNums').val();
    var zid = $('#xrjcxm_zq_dw').val();
    var txtid = $('#hidejrjc').val();
    var txtjrjcxm = $('#txtjrjcxm').val();
    var txtfxwt = $('#txtfxwt').val();
    var txtwtzg = $('#txtwtzg').val();
    var txtqt_xr = $('#txtqt_xr').val();
    if (!txtjrjcxm || !txtfxwt || !txtwtzg || !xzsgsname || !txtqt_xr) {
        mui.toast('请输入完整的信息');
        return false;
    }
    $.post('upjc.ashx', { zid: zid, jrjcxm: txtjrjcxm, fxwt: txtfxwt, wtzg: txtwtzg, qt: txtwtzg, id: txtid, num: txtnum }, function (data) {
        if (data == '0') {
            mui.toast('修改成功');
        } else {
            mui.toast(data);
        }
        jcxmDaTa();
        closes();
    });
} 
//写入检查项目//数据绑定
function jcxmDaTa() {
    $.post('seljc.ashx', {}, function (data) {
        if (data != "-1") {
            jcxmBind(data);
        } else {
            mui.toast('数据读取失败');
        }
    })
}
//写入检查项目//遍历数据
function jcxmBind(data) {
    $('#tb6 tbody tr').remove();
    var tr = '';
    var td1 = '';
    var td2 = '';
    var caozuo = '';
    var shenpi = '<i class="ace-icon fa fa-exclamation-triangle bigger-121" style="  cursor:pointer; position:absolute; left:15px; top:11px; color: #D15B47; " onclick="f_Open_View(\'T_Dsan_jiancha\',\'';
    var shenpi_ = '\')"  title="审批未通过/被退回/修改后可再次审批"></i> ';
    var shenpi_yes = '<i class="ace-icon fa fa-exclamation-triangle bigger-121" style="  cursor:pointer; position:absolute; left:15px; top:11px; color: #99FF99; " onclick="f_Open_View(\'T_Dsan_jiancha\',\'';
    var shenpi_yes_ = '\')"  title="审批通过"></i> ';
    for (var p in data) {
        if (data[p].sp1 == '-1' || data[p].sp2 == '-1' || data[p].sp3 == '-1') {
            td1 = '<td class="OverHideTd" style="position:relative;">' + shenpi + data[p].id + shenpi_ + (parseInt(p) + 1) + '</td><td class="OverHideTd">' + data[p].jrjcxm + '</td><td class="OverHideTd">' + data[p].fxwt + '</td>';
        } else if (data[p].sp1 == '1' || data[p].sp2 == '1' || data[p].sp3 == '1') {
            td1 = '<td class="OverHideTd" style="position:relative;">' + shenpi_yes + data[p].id + shenpi_yes_ + (parseInt(p) + 1) + '</td><td class="OverHideTd">' + data[p].jrjcxm + '</td><td class="OverHideTd">' + data[p].fxwt + '</td>';
        } else {
            td1 = '<td class="OverHideTd">' + (parseInt(p) + 1) + '</td><td class="OverHideTd">' + data[p].jrjcxm + '</td><td class="OverHideTd">' + data[p].fxwt + '</td>';
        }
        caozuo = '<a href="javascript:;"  title="修改" onclick="jcxmupdate(' + data[p].id + ')"><i class="ace-icon fa fa-pencil-square-o"></i></a>';

        td2 = '<td class="OverHideTd">' + data[p].wtzg + '</td><td class="OverHideTd">' + data[p].qt + '</td>';
        tr += '<tr>' + td1 + td2 + '<td class="OverHideTd">' + caozuo + '</td></tr>';
    }
    $('#tb6 tbody').append(tr);
} 
//更新数据
function refresh() {
    $.post('GetNumList.ashx', {}, function (data) {
        if (data == '0') {
            mui.toast('数据已更新');
        } else {
            mui.toast(data);
        }
        NumData();
        closes();
    })
}
//信息统计//ADD
function add_xxtj() {
    var zid = $('#num_zq_dw').val();
    var txtywg = $('#txtywg').val();
    var txtzzsg = $('#txtzzsg').val();
    var txtywg_dx = $('#txtywg_dx').val();
    if (!txtywg || !txtzzsg || !txtywg_dx) { mui.toast('请输入完整信息！'); return false; }
    $.post('addxxtj.ashx', { zid: zid, ywg: txtywg, zzsg: txtzzsg, ljdc: 0, ywg_dx: txtywg_dx }, function (data) {
        if (data == '0') {
            mui.toast('添加成功');
        } else {
            mui.toast(data);
        }
        NumData();
        closes();
    })
}
//信息统计//详细
function xxtjdetail(id) {
    $('textarea,input,select').attr('readonly', 'readonly');
    $('select').attr('disabled', 'fales');
    $('.Is_Hilist').hide(500);
    $('.Is_Hs_XXTJ').show(500);
    $('.xyx_show,.xyx_hide').hide();
    $.post('selxxtj.ashx', { id: id }, function (data) {
        if (data != "-1") {
            $('#num_zq_dw1').val(data[0].z_id);
            $('#xz_').val(data[0].xz);
            $('#yk_').val(data[0].yk);
            $('#jh_').val(data[0].jh);
            $('#ywg_').val(data[0].ywg);
            $('#ywg_dx_').val(data[0].ywg_dx);
            $('#zzsg_').val(data[0].zzsg);
            $('#jrjc_').val(data[0].jrjc);
            $('#ljsg_').val(data[0].ljsg);
            $('#ljdc_').val(data[0].ljdc);

        }
        else {
            mui.toast('数据读取失败');
        }
    })
} 
//信息统计//点修改
function xxtjupdate(id) {
    $('.xyx_show,.xyx_hide').hide();
    $('select').attr('disabled', 'fales');

    $('.Is_HS').show(500);
    $('.update_s').show(500);
    $('.add_s').hide(500);
    $('.Is_Hilist').hide(500);
    $('#hidexxtj').val(id);
    $.post('selxxtj.ashx', { id: id }, function (data) {
        if (data != "-1") {
            $('#num_zq_dw').val(data[0].z_id);
            $('#txtywg').val(data[0].ywg);
            $('#txtzzsg').val(data[0].zzsg);
            $('#txtywg_dx').val(data[0].ywg_dx);
        }
        else {
            mui.toast('数据读取失败');
        }
    })

}
//信息统计//修改 
function update_xxtj() {
    var txtid = $('#hidexxtj').val();
    var zid = $('#num_zq_dw').val();
    var txtywg = $('#txtywg').val();
    var txtzzsg = $('#txtzzsg').val();
    var txtywg_dx = $('#txtywg_dx').val();
    if (!txtywg || !txtzzsg || !txtywg_dx) { mui.toast('请输入完整信息！'); return false; }
    $.post('upxxtj.ashx', { id: txtid, zid: zid, ywg: txtywg, zzsg: txtzzsg, ywg_dx: txtywg_dx }, function (data) {
        if (data == '0') {
            mui.toast('修改成功');
        } else {
            mui.toast(data);
        }
        NumData();
        closes();
    })
}
//信息统计//数据绑定
function NumData() {
    $.post('selxxtj.ashx', {}, function (data) {
        if (data != "-1") {
            NumBind(data);
        } else {
            mui.toast('数据读取失败');
        }

    })
}
//写入检查项目//遍历数据
function NumBind(data) {
    $('#tb7 tbody tr').remove();
    var tr = '';
    var td1 = '';
    var td2 = '';
    var td3 = '';
    var td5 = '';
    var td6 = '';
    var caozuo = ''
    var shenpi = '<i class="ace-icon fa fa-exclamation-triangle bigger-121" style="  cursor:pointer; position:absolute; left:15px; top:11px; color:#D15B47; "  title="审批未通过/被退回/修改后可再次审批"></i> ';
    for (var p in data) {
        caozuo = '<a href="javascript:;"  title="详情" onclick="xxtjdetail(' + data[p].id + ')"><i class="ace-icon glyphicon glyphicon-file"></i></a><a href="javascript:;"  title="修改" onclick="xxtjupdate(' + data[p].id + ')"><i class="ace-icon fa fa-pencil-square-o"></i></a>';
        if (data[p].sp1 == '-1' || data[p].sp2 == '-1' || data[p].sp3 == '-1') {
            td1 = '<td class="OverHideTd" style="position:relative;">' + shenpi + (parseInt(p) + 1) + '</td>    <td class="OverHideTd">' + data[p].dw + '</td>';
        } else {
            td1 = '<td class="OverHideTd">' + (parseInt(p) + 1) + '</td>    <td class="OverHideTd">' + data[p].dw + '</td>';
        }
        td2 = '<td class="OverHideTd  hidden-480">' + data[p].xz + '</td><td class="OverHideTd hidden-480">' + data[p].yk + '</td> <td class="OverHideTd hidden-480">' + data[p].jh + '</td>';
        td3 = '<td class="OverHideTd">' + data[p].ywg + '</td>';
        td5 = '<td class="OverHideTd hidden-480">' + data[p].ywg_dx + '</td><td class="OverHideTd hidden-480">' + data[p].zzsg + '</td><td class="OverHideTd hidden-480">' + data[p].jrjc + '</td>';
        td6 = '<td class="OverHideTd">' + data[p].ljsg + '</td>'; //<td class="OverHideTd hidden-480">' + data[p].ljdc + '</td>
        tr += '<tr>' + td1 + td2 + td3 + td5 + td6 + '<td class="OverHideTd">' + caozuo + '</td></tr>';
    }
    $('#tb7 tbody').append(tr);
}



 
//站区单位//数据绑定
function ZQData() {
    $.post('selZYQINFO.ashx', {}, function (data) {
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
    $('.xrjcxm_zq_dw').append('<select id="xrjcxm_zq_dw" class="form-control input-mask-phone" style="border:1px solid #D5D5D5 !important">' + op + '</select>');
    $('.xzsg_zq_dw').append('<select id="xzsg_zq_dw" class="form-control input-mask-phone" style="border:1px solid #D5D5D5 !important">' + op + '</select>');
    $('.dsf_zq_dw').append('<select id="dsf_zczyq" class="form-control input-mask-phone" style="border:1px solid #D5D5D5 !important">' + op + '</select>');
    $('.jhd_zq_dw').append('<select id="jhd_zq_dw" class="form-control input-mask-phone" style="border:1px solid #D5D5D5 !important">' + op + '</select>');
    $('.num_zq_dw').append('<select id="num_zq_dw" class="form-control input-mask-phone" style="border:1px solid #D5D5D5 !important">' + op + '</select>');
    $('.num_zq_dw1').append('<select id="num_zq_dw1" class="form-control input-mask-phone" style="border:1px solid #D5D5D5 !important">' + op + '</select>');
}



