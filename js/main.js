function f_Center() {
    var windowScreen = document.documentElement;
    // 获取main的div元素 
    var main_div = document.getElementById("Main");
    // 通过窗口宽高和div宽高计算位置 
    var main_left = (windowScreen.clientWidth - main_div.clientWidth) / 2 + "px";
    var main_top = (windowScreen.clientHeight - main_div.clientHeight) / 2 + "px";
    // 位置赋值 
    main_div.style.left = main_left;
    main_div.style.top = main_top;
}

function f_Sel(iType) {
    var iMenu = document.getElementById("IFRM_MENU");
    if (iType == "0") {
        iMenu.src = "../wd_menu/wd_classmenu.aspx";
    }

    if (iType == "1") {
        iMenu.src = "../wd_menu/wd_sysset.aspx";
    }

    if (iType == "2") {
        iMenu.src = "../wd_menu/wd_qyyzmenu.aspx";
    }

    
}

function f_LoadDataByClassType(l_id,l_name) {
    var iData = document.getElementById("IFRDATA");
    iData.src = "../ZSGLInfo/wd_zsMain.aspx?CUR_LID=" + l_id + "&CUR_LNAME=" + l_name;
}

//查看指令信息详情
function f_ShowZSDlg(z_id) {
    var url = "../ZSGLInfo/wd_showzlinfo.aspx?ZL_ID=" + z_id;
    //alert(url);
    $.webox({
        height: 500,
        width: 800,
        bgvisibel: true,
        title: '指令信息详情',
        iframe: url
    });
}
//编辑指令内容
function f_ShowEdit(z_id) {
    // var url = "../ZSGLInfo/wd_Editzl.aspx?ZL_ID=" + z_id;
    var url = "../ZSGLInfo/wd_EditLK.aspx";
    //alert(url);
    $.webox({
        height: 600,
        width: 1000,
        bgvisibel: true,
        title: '编辑指令信息',
        iframe: url
    });
}
//编辑施工信息

function f_Edit_sg(z_id) {
    var url = "../ZSGLInfo/wd_Editsg.aspx";
    //alert(url);
    $.webox({
        height:550,
        width: 1000,
        bgvisibel: true,
        title: '编辑其他信息',
        iframe: url
    });
}
function f_ShowZSFJDlg(z_id) {
    var url = "../ZSGLInfo/wd_fujiandlg.aspx?Z_ID=" + z_id;
    //alert(url);
    $.webox({
        height: 600,
        width: 1024,
        bgvisibel: true,
        title: '查看知识附件信息',
        iframe: url
    });
}
//编辑高速信息
function f_editgs(HW_ID) {
    var url = "../ZSGLInfo/gs_Edit.aspx?HW_ID=" + HW_ID; //wd_gs/gs_Edit.aspx
    $.webox({
        height: 500,
        width: 824,
        bgvisibel: true,
        title: '编辑高速信息',
        iframe: url
    });
}
//添加新的高速信息
function f_Addgs() {
    var url = "../ZSGLInfo/gs_Edit.aspx"; //wd_gs/gs_Edit.aspx
    $.webox({
        height: 300,
        width: 624,
        bgvisibel: true,
        title: '添加高速信息',
        iframe: url
    });
}
function f_IsExit() {
    if (confirm("是否注销登录?")) {
        location.href = "../wd_LoginOut.aspx";
    }
}

function f_ScData() {
    var iName = document.getElementById("m_ssname").value;
    if (iName == "" || iName == " ") {
        alert("没有输入查询条件!");
        return false;
    }
    var iData = document.getElementById("IFRDATA");
    iData.src = "../ZSGLInfo/wd_zsMain.aspx?SC_NAME="+iName;
    return false;
}

//收费站列表（连接postgres）
function f_SFZMgr() {
    var iData = document.getElementById("IFRDATA");
    iData.src = "../ZSGLInfo/wd_sfzMain.aspx";
    return false;
}

//高速公路列表
function f_GSMgr() {
    var iData = document.getElementById("IFRDATA");
    iData.src = "../ZSGLInfo/wd_gsMain.aspx";
    return false;
}
//历史指令
function f_lszl() {
    var iData = document.getElementById("IFRDATA");
    iData.src = "wd_msg/wd_msgmain.aspx";
    return false;
}
//编辑高速信息
function f_editgs(HW_ID) {
    var url = "../ZSGLInfo/gs_Edit.aspx?HW_ID=" + HW_ID; //wd_gs/gs_Edit.aspx
    $.webox({
        height: 300,
        width: 624,
        bgvisibel: true,
        title: '编辑高速信息',
        iframe: url
    });
}
function f_ShowGIS() {
    var iData = document.getElementById("IFRDATA");
    iData.src = "http://wxgis.henangis.com";
    return false;
}
//预览界面
function f_ShowWxTx() {
    var iData = document.getElementById("IFRDATA");
    iData.src = "wd_msg/wd_tongxing_info.aspx";
    return false;
}
//通行信息编辑
function f_Showbianji() {
    var iData = document.getElementById("IFRDATA");
    // iData.src = "http://lwzx.hngslw.com/wechat/service/trafficInfo";
    iData.src = "wd_msg/wd_list.aspx";
    return false;
}
function f_XiaDaZhiLing() {
    var iData = document.getElementById("IFRDATA");
    iData.src = "../wd_msg/wd_add_msg.aspx";
    return false;
}
//一键下发指令
function f_yjxf() {
    var iData = document.getElementById("IFRDATA");
    iData.src = "../wd_msg/wd_yj_msg.aspx";
    return false;
}
function f_ShowWxMap() {
    var iData = document.getElementById("IFRDATA");
    iData.src = "../wd_wxmap/wd_wxmap.aspx";
    return false;
}
//修改密码
function f_MyInfo()
 {
     var iData = document.getElementById("IFRDATA");
     iData.src = "wd_user/wd_upinfo.aspx";    
    return false;
}
//用户管理
function f_UserInfo() {
    var iData = document.getElementById("IFRDATA");
    iData.src = "wd_user/wd_listuser.aspx";
    return false;
}
function f_MyTypeInfo() {
    var iData = document.getElementById("IFRDATA");
    iData.src = "../ZSGLInfo/wd_typemgr.aspx";
    return false;
}


//弹出一个对话框
function f_ShowDlg(wid,hei,url,strName) {
    $.webox({
        height: hei,
        width: wid,
        bgvisibel: true,
        title: strName,
        iframe: url
    });
}

//打开标记窗口
function f_BiaoJi() {
    var iData = document.getElementById("IFRDATA");
    iData.src = "../ZSGLInfo/LicPro/wd_ROUTES.aspx";
    return false;
}

//查看验真企业信息
function f_ShowQYYZDlg(ORG_CERT_NO) {
    var url = "../ZSGLInfo/wd_showzsinfo.aspx?ORG_CERT_NO=" + ORG_CERT_NO;
    //alert(url);
    $.webox({
        height: 600,
        width: 850,
        bgvisibel: true,
        title: '查看验真企业信息',
        iframe: url
    });
}
//许可申请详细信息
function f_ShowxkDlg(REQ_NO) {
    //alert(REQ_NO);
    var url = "../ZSGLInfo/wd_showxkinfo.aspx?REQ_NO=" + REQ_NO;
    //alert(url);
    $.webox({
        height: 600,
        width: 850,
        bgvisibel: true,
        title: '查看申报信息数据',
        iframe: url
    });
}
//查看车辆信息
function f_ShowCLInfoDlg(z_id) {
    var url = "../ZSGLInfo/wd_ShowCLinfo.aspx?REQ_NO=" + z_id;
    //alert(url);
    $.webox({
        height: 600,
        width: 820,
        bgvisibel: true,
        title: '查看车辆信息',
        iframe: url
    });
}

function f_ShowFSFA(req_no) {
    var url = "../ZSGLInfo/wd_showfsinfo.aspx?REQ_NO=" + req_no;
    //alert(url);
    $.webox({
        height: 400,
        width: 600,
        bgvisibel: true,
        title: '查看分省方案',
        iframe: url
    });
}
