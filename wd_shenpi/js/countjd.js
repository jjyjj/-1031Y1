$(function () {
    f_SZFEI();//三桩费发放  
    f_FUCE();//管道光缆复测
    f_fangxu();//防汛管理FANGXUN
});
//FANGXUN
function f_fangxu() {
    var tid = $('#hide_tid').val();
    $.post('itface/fangxu.ashx', { tid: tid }, function (data) {
        if (data != "-1") {
            fangxunBind(data);
        } else {
            //mui.toast('数据读取失败');
            $('#FANGXUN').text('0');
        }
    })
}
function fangxunBind(data) {
    $('.FANGXUN').text(data[0].num);//
    $('#FANGXUN').text(data[0].num);

}
//FUCE
function f_FUCE() {
    var tid = $('#hide_tid').val();
    $.post('itface/fuce.ashx', { tid: tid }, function (data) {
        if (data != "-1") {
            fuceBind(data);
        } else {
            //mui.toast('数据读取失败');
            $('#FUCE').text('0');
        }
    })
}
function fuceBind(data) {
    $('.FUCE').text(data[0].num);//
    $('#FUCE').text(data[0].num);

}
//三桩费发放
function f_SZFEI() {   
    var tid = $('#hide_tid').val();
    //alert(tid);
    $.post('itface/jieduan.ashx', { tid: tid }, function (data) {
        if (data != "-1") {
            shiBind(data);
        } else {
            //mui.toast('数据读取失败');
            $('#SZFEI').text('0');
        }
    })
}
function shiBind(data) {
    $('.SZFEI').text(data[0].num);//
    $('#SZFEI').text(data[0].num);

}