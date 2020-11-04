$(function () {
    FileData(); //获取文件数
    Kaiwa(); //kaiwa
    Disan(); //第三方施工
    Dier();
    GHG();
    XUNHU();
    XUanchuan();
   var txtcount = "";
    //var kaiwa = $('#XiujiaS').val();
    //var disan = $('#yingnum').val();
    //   $('#count').text($('#XiujiaS').val());
});

function XUanchuan() {
    $.post('../wd_tongji/xuanchuan.ashx', {}, function (data) {
        if (data != "-1") {
            XuanchuanBind(data);
        } else {
            //mui.toast('数据读取失败');
            $('#xuanchuan').text('0');
        }
    })
}
function XuanchuanBind(data) {
    $('#xuanchuan').text(data[0].num);
    $(".DIVxuanchuan").attr("data-percent", data[0].num);
    $('#count1').text(parseInt($('#kaiwa').text()) + parseInt($('#xuanchuan').text()) + parseInt($('#xunhu').text()) + parseInt($('#gaohoug').text()) + parseInt($('#dierfang').text()) + parseInt($('#disan').text()));




}
function XUNHU() {
    $.post('../wd_tongji/xunhu.ashx', {}, function (data) {
        if (data != "-1") {
            XUNHUBind(data);
        } else {
            //mui.toast('数据读取失败');
            $('#xunhu').text('0');
        }
    })
}
function XUNHUBind(data) {
    $('#xunhu').text(data[0].num);
    $(".DIVxunhu").attr("data-percent", data[0].num);
}
function GHG() {
    $.post('../wd_tongji/ghgq.ashx', {}, function (data) {
        if (data != "-1") {
            GHGBind(data);
        } else {
            //mui.toast('数据读取失败');
            $('#gaohoug').text('0');
        }
    })
}
function GHGBind(data) {
    $('#gaohoug').text(data[0].num);
    $(".DIVgaohoug").attr("data-percent", data[0].num);
}

function Dier() {
    $.post('../wd_tongji/dierfang.ashx', {}, function (data) {
        if (data != "-1") {
            DierBind(data);
        } else {
            //mui.toast('数据读取失败');
            $('#dierfang').text('0');
        }
    })
}
function DierBind(data) {
    $('#dierfang').text(data[0].num);
    $(".DIVdierfang").attr("data-percent", data[0].num);
}
function Disan() {
    $.post('../wd_tongji/disanfang.ashx', {}, function (data) {
        if (data != "-1") {
            DisanBind(data);
        } else {
            //mui.toast('数据读取失败');
            $('#disan').text('0');
        }
    })
}
function DisanBind(data) {
    $('#disan').text(data[0].num);
    $(".DIVdisan").attr("data-percent", data[0].num);
  
}
function FileData(type) {
    $.post('../wd_tongji/file.ashx', {}, function (data) {
        if (data != "-1") {
            FileBind(data);
        } else {
            //mui.toast('数据读取失败');
            $('.File1').text('0');
        }
    })
}
function FileBind(data) {
    $('.File1').text(data[0].num);
}

function Kaiwa() {
    // alert("11221");
    $.post('../wd_tongji/getnum.ashx', {}, function (data) {
        if (data != "-1") {
            kaiwaBind(data);
        } else {
            //mui.toast('数据读取失败');
            $('#kaiwa').text('0');
        }
    })
}
function kaiwaBind(data) {
    // $('.DIVkaiwa').append('<div class="pull-right easy-pie-chart percentage " data-size="30" data-color="#ECCB71" data-percent='+data[0].num+'><div class="percent" id="kaiwa">' + data[0].num + '</div></div>');
    $('#kaiwa').html(data[0].num);
    $(".DIVkaiwa").attr("data-percent", $('#kaiwa').text());
   // txtcount = $('#kaiwa').html();
    $('#count').html($('#kaiwa').text());
    // $(".kaiwa").attr("data-percent", data[0].num + "%")

}