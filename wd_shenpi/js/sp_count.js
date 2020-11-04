$(function () {
    f_dwbg(); //单位变更
    f_kwlzy(); //开挖类作业 kaiwanum

    f_dierfsg(); //第二方施工diernum 

});


//第二方施工
function f_dierfsg() {

   
    $.post('it_sp/sp_dier.ashx', {}, function (data) {
        if (data != "-1") {
            dierBind(data);
        } else {
            //mui.toast('数据读取失败');
            $('#diernum1').text('0');
        }
    })
}
function dierBind(data) {
    $('.diernum1').text(data[0].num); //
    $('#diernum1').text(data[0].num);
    // $('#kaiwanum').text(data[0].num);

}
//开挖类作业 
function f_kwlzy() {  
    $.post('it_sp/sp_kaiwa.ashx', {}, function (data) {
        if (data != "-1") {
            kwBind(data);
        } else {
            //mui.toast('数据读取失败');
            $('#kaiwanum').text('-1');
        }
    })
}
function kwBind(data) {
    $('.kaiwanum').text(data[0].num); //
    $('#kaiwanum').text(data[0].num);

}
//单位变更
function f_dwbg() {
    // var txttid = $('#HideTid').val();
   // it_sp / sp_dwbg.ashx
    $.post('it_sp/sp_dwbg.ashx', {}, function (data) {
        if (data != -1) {
            bgBind(data);
        } else {
            //mui.toast('数据读取失败');
            $('#bgnum').text('0');
        }
    })
}
function bgBind(data) {
  
    $('.bgnum').text(data); //
    $('#bgnum').text(data);
}