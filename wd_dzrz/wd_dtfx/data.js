$(function () {
    $('#Button2').click(function () {
        var txttype = $('#txttype').val();
        if (txttype == '0') {
            mui.toast("请选择类型！");
            return false;
        }
        var txtxzzh = $('#txtxzzh').val();
        if (txtxzzh == '') {
            mui.toast("请填写行政区域！");
            return false;
        }
        var txtzh = $('#txtzh').val();
        if (txtzh == '') {
            mui.toast("请填写桩号！");
            return false;
        }
        var txtgcm = $('#txtgcm').val();
        if (txtgcm == '') {
            mui.toast("请填写名称！");
            return false;
        }
        var txtgdgl = $('#txtgdgl').val();
        if (txtgdgl == '') {
            mui.toast("请填写管道光缆情况！");
            return false;
        }
        var txtagcqk_and_gdgx = $('#txtagcqk_and_gdgx').val();
        if (txtgdgl == '') {
            mui.toast("请填写工程情况与管道位置关系！");
            return false;
        }
        var txtname = $('#txtname').val();
        if (txtname == '') {
            mui.toast("请填写监护人姓名！");
            return false;
        }
        var txtgcm = $('#txtgcm').val();
        if (txtgcm == '') {
            mui.toast("请填写工程名称！");
            return false;
        }
        var txtjrsg = $('#txtjrsg').val();
        if (txtgcm == '') {
            mui.toast("请填写今日施工内容！");
            return false;
        }
        var txtmrjh = $('#txtmrjh').val();
        if (txtmrjh == '') {
            mui.toast("请填写明日施工计划！");
            return false;
        }

        var txtaremark = $('#txtaremark').val();
        var txtselect = $('#Select2').val();
        if (txtselect == '-1') {
            mui.toast("请选择是否完工2！");
            return false;
        }

        if (txtselect == '-1') {
            mui.toast("请选择是否完工！");
            return false;
        }
        //暂存时施工方案可以先不填
        //var file_as = $('#file1').val().length;
        //if (!file_as > 0) {
        //    mui.toast('请上传方案！');
        //    return false;
        //}
        mui.toast('操作成功！');

    })
})
$(function () {
    $('#Button1').click(function () {
        //var txttype = $('#txttype').val();
        var txttype = $('#txttype').val();
        if (txttype == '0') {
            mui.toast("请选择类型！");
            return false;
        }
        var txtxzzh = $('#txtxzzh').val();
        if (txtxzzh == '') {
            mui.toast("请填写行政区域！");
            return false;
        }
        var txtzh = $('#txtzh').val();
        if (txtzh == '') {
            mui.toast("请填写桩号！");
            return false;
        }
        var txtgcm = $('#txtgcm').val();
        if (txtgcm == '') {
            mui.toast("请填写名称！");
            return false;
        }
        var txtgdgl = $('#txtgdgl').val();
        if (txtgdgl == '') {
            mui.toast("请填写管道光缆情况！");
            return false;
        }
        var txtagcqk_and_gdgx = $('#txtagcqk_and_gdgx').val();
        if (txtgdgl == '') {
            mui.toast("请填写工程情况与管道位置关系！");
            return false;
        }
        var txtname = $('#txtname').val();
        if (txtname == '') {
            mui.toast("请填写监护人姓名！");
            return false;
        }
        var txtgcm = $('#txtgcm').val();
        if (txtgcm == '') {
            mui.toast("请填写工程名称！");
            return false;
        }
        var txtjrsg = $('#txtjrsg').val();
        if (txtgcm == '') {
            mui.toast("请填写今日施工内容！");
            return false;
        }
        var txtmrjh = $('#txtmrjh').val();
        if (txtmrjh == '') {
            mui.toast("请填写明日施工计划！");
            return false;
        }

        var txtaremark = $('#txtaremark').val();
        var txtselect = $('#Select2').val();
        if (txtselect == '-1') {
            mui.toast("请选择是否完工2！");
            return false;
        }

        if (txtselect == '-1') {
            mui.toast("请选择是否完工！");
            return false;
        }
        var file_as = $('#file1').val().length;
        if (!file_as > 0) {
            mui.toast('请上传方案！');
            return false;
        }
        mui.toast('操作成功！');
    })
})

$(function () {
    $('#btn_uptj').click(function () {
        //var txttype = $('#txttype').val();
        var txttype = $('#txttypeup').val();
        if (txttype == '0') {
            mui.toast("请选择类型！");
            return false;
        }
        var txtxzzh = $('#txtxzzhup').val();
        if (txtxzzh == '') {
            mui.toast("请填写行政区域！");
            return false;
        }
        var txtzh = $('#txtzhup').val();
        if (txtzh == '') {
            mui.toast("请填写桩号！");
            return false;
        }
        var txtgcm = $('#txtgcmup').val();
        if (txtgcm == '') {
            mui.toast("请填写名称！");
            return false;
        }
        var txtgdgl = $('#txtgdglup').val();
        if (txtgdgl == '') {
            mui.toast("请填写管道光缆情况！");
            return false;
        }
        var txtagcqk_and_gdgx = $('#txtagcqk_and_gdgxup').val();
        if (txtgdgl == '') {
            mui.toast("请填写工程情况与管道位置关系！");
            return false;
        }
        var txtname = $('#txtnameup').val();
        if (txtname == '') {
            mui.toast("请填写监护人姓名！");
            return false;
        }
        
        var txtjrsg = $('#txtjrsgup').val();
        if (txtgcm == '') {
            mui.toast("请填写今日施工内容！");
            return false;
        }
        var txtmrjh = $('#txtmrjhup').val();
        if (txtmrjh == '') {
            mui.toast("请填写明日施工计划！");
            return false;
        }

        var txtaremark = $('#txtaremark').val();
        var txtselect = $('#Select1').val();
        if (txtselect == '-1') {
            mui.toast("请选择是否完工2！");
            return false;
        }

        
        var file_as = $('#file_as').val().length;
        var file_as1 = $('#file_as1').val().length;
        var file_asf = $('#filefangan').val().length;
        var file_as1m = $('#fileimg').val().length;

        if (!file_as > 0 && !file_asf>0) {
            mui.toast('请上传方案！');
            return false;
        }
        if (!file_as1 > 0 && !file_as1m > 0) {
            mui.toast('请上传现场图片！');
            return false;
        }
        mui.toast('操作成功！');
    })
})


$(function () {
    $('#btn_upzc').click(function () {
        //var txttype = $('#txttype').val();
        var txttype = $('#txttypeup').val();
        if (txttype == '0') {
            mui.toast("请选择类型！");
            return false;
        }
        var txtxzzh = $('#txtxzzhup').val();
        if (txtxzzh == '') {
            mui.toast("请填写行政区域！");
            return false;
        }
        var txtzh = $('#txtzhup').val();
        if (txtzh == '') {
            mui.toast("请填写桩号！");
            return false;
        }
        var txtgcm = $('#txtgcmup').val();
        if (txtgcm == '') {
            mui.toast("请填写名称！");
            return false;
        }
        var txtgdgl = $('#txtgdglup').val();
        if (txtgdgl == '') {
            mui.toast("请填写管道光缆情况！");
            return false;
        }
        var txtagcqk_and_gdgx = $('#txtagcqk_and_gdgxup').val();
        if (txtgdgl == '') {
            mui.toast("请填写工程情况与管道位置关系！");
            return false;
        }
        var txtname = $('#txtnameup').val();
        if (txtname == '') {
            mui.toast("请填写监护人姓名！");
            return false;
        }

        var txtjrsg = $('#txtjrsgup').val();
        if (txtgcm == '') {
            mui.toast("请填写今日施工内容！");
            return false;
        }
        var txtmrjh = $('#txtmrjhup').val();
        if (txtmrjh == '') {
            mui.toast("请填写明日施工计划！");
            return false;
        }

        var txtaremark = $('#txtaremark').val();
        var txtselect = $('#Select1').val();
        if (txtselect == '-1') {
            mui.toast("请选择是否完工2！");
            return false;
        }


        var file_as = $('#file_as').val().length;
        //if (!file_as > 0) {
        //    mui.toast('请上传方案！');
        //    return false;
        //}
        mui.toast('操作成功！');
    })
})