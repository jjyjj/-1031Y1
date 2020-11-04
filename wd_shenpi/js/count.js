$(function () {
    f_kaiwa();//开挖作业
    f_disan();//第三方施工
    f_dier();//第二方施工
    f_ghg();//高后果区
    f_xuhu();//巡护管理
    f_zoufang();//宣传走访
    f_fushi();//腐蚀控制
    f_shipin();//视频监控
    f_jieduancount();//阶段性工作  jieduannnum


    f_shijianxx();//事件学习
    f_tongzhi();//通知tznum
    
});

//第三方
function f_disan() {
    // var txttid = $('#HideTid').val();
    var tid = $('#hide_tid').val();
    $.post('itface/disan.ashx', { tid: tid }, function (data) {
        if (data != "-1") {
            disanBind(data);
        } else {
            //mui.toast('数据读取失败');
            $('#DISAN').text('0');
        }
    })
}
function disanBind(data) {
    $('.DISAN').text(data[0].num);//
    $('#DISAN').text(data[0].num);

}
//事件学习 
function f_shijianxx() {
    // var txttid = $('#HideTid').val();
    var tid = $('#hide_tid').val();
    $.post('itface/sjxxcount.ashx', { tid: tid }, function (data) {
        if (data != -1) {
            sjxxBind(data);
        } else {
            //mui.toast('数据读取失败');
            $('#shijianxxnum').text('0');
        }
    })
}
function sjxxBind(data) {
    $('.shijianxxnum').text(data);//
    $('#shijianxxnum').text(data);

}
//有关通知
function f_tongzhi() {
    // var txttid = $('#HideTid').val();
    var tid = $('#hide_tid').val();
    $.post('itface/ygtongzhi.ashx', { tid: tid }, function (data) {
        if (data != -1) {
            tzBind(data);
        } else {
            //mui.toast('数据读取失败');
            $('#tznum').text('0');
        }
    })
}
function tzBind(data) {
    
    $('.tznum').text(data);//
    $('#tznum').text(data);
}
//阶段性工作 
function f_jieduancount() {
    // var txttid = $('#HideTid').val();
    var tid = $('#hide_tid').val();
    $.post('itface/jieduancount.ashx', { tid: tid }, function (data) {
        if (data != -1) {
            jdBind(data);
        } else {
            //mui.toast('数据读取失败');
            $('#jieduannnum').text('0');
        }
    })
}
function jdBind(data) {
    $('.jieduannnum').text(data);//
    $('#jieduannnum').text(data);

}
//视频监控
function f_shipin() {
    // var txttid = $('#HideTid').val();
    var tid = $('#hide_tid').val();
    $.post('itface/shipin.ashx', { tid: tid }, function (data) {
        if (data != "-1") {
            shiBind(data);
        } else {
            //mui.toast('数据读取失败');
            $('#shipinnum').text('0');
        }
    })
}
function shiBind(data) {
    $('.shipinnum').text(data[0].num);//
    $('#shipinnum').text(data[0].num);

}
//腐蚀控制
function f_fushi() {

    // var txttid = $('#HideTid').val();
    var tid = $('#hide_tid').val();
    $.post('itface/fushi.ashx', { tid: tid }, function (data) {
        if (data != "-1") {
            fushiBind(data);
        } else {
            //mui.toast('数据读取失败');
            $('#fushinum').text('0');
        }
    })
}
function fushiBind(data) {
    $('.fushinum').text(data[0].num);//
    $('#fushinum').text(data[0].num);

}
//宣传走访
function f_zoufang() {

    // var txttid = $('#HideTid').val();
    var tid = $('#hide_tid').val();
    $.post('itface/zoufang.ashx', { tid: tid }, function (data) {
        if (data != "-1") {
            zoufangBind(data);
        } else {
            //mui.toast('数据读取失败');
            $('#zoufangnum').text('');
        }
    })
}
function zoufangBind(data) {
    $('.zoufangnum').text(data[0].num);//
    $('#zoufangnum').text(data[0].num);

}
//巡护管理
function f_xuhu() {

    // var txttid = $('#HideTid').val();
    var tid = $('#hide_tid').val();
    $.post('itface/xuhu.ashx', { tid: tid }, function (data) {
        if (data != "-1") {
            xuhuBind(data);
        } else {
            //mui.toast('数据读取失败');
            $('#XUNHUnum').text('0');
        }
    })
}
function xuhuBind(data) {
    $('.XUNHU').text(data[0].num);//
    $('#XUNHUnum').text(data[0].num);

}
//高后果区
function f_ghg() {

    // var txttid = $('#HideTid').val();
    var tid = $('#hide_tid').val();
    $.post('itface/ghg.ashx', { tid: tid }, function (data) {
        if (data != "-1") {
            ghgBind(data);
        } else {
            //mui.toast('数据读取失败');
            $('#GHGQnum').text('0');
        }
    })
}
function ghgBind(data) {
    $('.GHGQ').text(data[0].num);//
    $('#GHGQnum').text(data[0].num);

}

//第二方施工
function f_dier() {

    // var txttid = $('#HideTid').val();
    var tid = $('#hide_tid').val();
    $.post('itface/dier.ashx', { tid: tid }, function (data) {
        if (data != "-1") {
            dierBind(data);
        } else {
            //mui.toast('数据读取失败');
            $('#diernum').text('0');
        }
    })
}
function dierBind(data) {
    $('.DIER').text(data[0].num); //
    $('#diernum').text(data[0].num);
    // $('#kaiwanum').text(data[0].num);

}
//开挖作业
function f_kaiwa() {
   
    // var txttid = $('#HideTid').val();
    var tid = $('#hide_tid').val();
    $.post('itface/kaiwa.ashx', { tid :tid }, function (data) {
        if (data != "-1") {
            kwBind(data);
        } else {
            //mui.toast('数据读取失败');
            $('#kaiwanum').text('0');
        }
    })
}
function kwBind(data) {
    $('.kaiwa').text(data[0].num);//
    $('#kaiwanum').text(data[0].num);
    
}