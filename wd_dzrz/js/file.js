/// <reference path="file.js" />



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




$('#id-input-file-1 , #id-input-file-2').ace_file_input({
    no_file: 'No File ...',
    btn_choose: 'Choose',
    btn_change: 'Change',
    droppable: false,
    onchange: null,
    thumbnail: false
});



$('#file1').ace_file_input({
    style: 'well',
    btn_choose: '点击上传工作交接;',
    btn_change: null,
    no_icon: 'ace-icon fa fa-cloud-upload',
    droppable: true,
    thumbnail: 'small'

					,
    preview_error: function (filename, error_code) {
    }

}).on('change', function () {
});
$('#file_as1,#file2').ace_file_input({
    style: 'well',
    btn_choose: '点击上传工作交接',
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