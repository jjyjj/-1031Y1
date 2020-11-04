$(function () {
    tongzhi();//有关通知
    zaigang();

    XJData('2'); //首次xiujia 数据绑定
    QJData('1'); //绑定请假数量
    QJDatayes('1'); //绑定zuotian请假数量
    CGJLData('3'); //绑定请假数量
    XXPXData('4'); //绑定请假数量
    Yzaigang(); //实际应该在岗人数    
});
function XJData(type) {
    $.post('../wd_tongji/xiujia.ashx?TYPE=' + type, {}, function (data) {
        if (data != "-1") {
            XJBind(data);
        } else {
            //mui.toast('数据读取失败');
            $('.XiujiaS').text('0');
        }
    })
}
function XJBind(data) {
    $('#XiujiaS').text(data[0].num);
    $('.XiujiaS').text(data[0].num);

}
function QJData(type) {
    $.post('../wd_tongji/qingjia.ashx?TYPE=' + type, {}, function (data) {
        if (data != "-1") {
            QXJBind(data);
        } else {
            mui.toast('数据读取失败');
        }
    })
}

//请假昨天数据
function QJDatayes(type) {
    $.post('../wd_tongji/qingjiayes.ashx?TYPE=' + type, {}, function (data) {
        if (data != "-1") {
            $('#Qingjiayes').val(data[0].num);
            // QXJBind(data);
        } else {
            $('#Qingjiayes').val('0');
            // mui.toast('数据读取失败');
        }
    })
}
function QXJBind(data) {
    $('#today').text(data[0].num);
    //$('.Qingjia').text(data[0].num);
    //var today = data[0].num;
    //var yestoday = $('#Qingjiayes').val();
    //if (today > yestoday) {
    //    $('#today').hide();
    //    $('#yesterday').show();
    //}
    //if (today < yestoday) {
    //    $('#today').show();
    //    $('#yesterday').hide();
    //}
}
function XXPXData(type) {
    $.post('../wd_tongji/xuexipeixun.ashx?TYPE=' + type, {}, function (data) {
        if (data != "-1") {
            XXPXBind(data);
        } else {
            mui.toast('数据读取失败');
        }
    })
}
function XXPXBind(data) {
    $('#XXPX').text(data[0].num);
    $('.XXPX').text(data[0].num);
}
function CGJLData(type) {
    $.post('../wd_tongji/canguan.ashx?TYPE=' + type, {}, function (data) {
        if (data != "-1") {
            CGJLBind(data);
        } else {
            mui.toast('数据读取失败');
        }
    })
}
function CGJLBind(data) {
    $('#CGJL').text(data[0].num);
    $('.CGJL').text(data[0].num);
}




function Yzaigang() {
    $.post('../wd_tongji/zaigang.ashx', {}, function (data) {
        if (data != "-1") {
            YzaigangBind(data);
        } else {
            //mui.toast('数据读取失败');
            $('#shijinum').text('0');
        }
    });
}
function YzaigangBind(data) {
    $('#shijinum').text(data[0].num);

}
function tongzhi() {
    $.post('../wd_tongji/tongzhi.ashx', {}, function (data) {
        if (data != "-1") {
            tongzhiBind(data);
        } else {
            //mui.toast('数据读取失败');
            $('#tongzhi').text('0');
        }
    })
}
function tongzhiBind(data) {
    $('#tongzhi').text(data[0].num);
    $(".DIVTONGZHI").text(data[0].num);
}

function zaigang() {
    $.post('../wd_tongji/zaigangying.ashx', {}, function (data) {
        if (data != "-1") {
            zaigangBind(data);
        } else {
            //mui.toast('数据读取失败');
            $('#yingnum').text('0');
        }
    });
}
function zaigangBind(data) {
    $('#yingnum').text(data[0].num);

}