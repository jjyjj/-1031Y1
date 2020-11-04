//这个代码需要改写成我们自己的,huang 2020-04-11
$("document").ready(function () {
	$("body").css("visibility", "visible");
	//需要设置工具条的宽度
	f_SetToolbarWid();
	setInterval(f_Animal, 100);
	f_floatToolInit();
	f_initTreeView();    
});

function f_SetToolbarWid() {
	var wid = $("#div_right_top_m").width();
	if (wid < 1) wid = 200;
	wid = 89 + wid + 86;
	$("#Div_RT_TOOLBAR").css("width", wid+"px")
}
(function (doc, win) {
	 var docEl = doc.documentElement,
		 resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
		 recalc = function () {
			 var clientWidth = docEl.clientWidth;
			 if (!clientWidth) return;
			 if (clientWidth >= 1920) {
				 docEl.style.fontSize = '100px'; //1rem  = 100px
			 } else {
				 docEl.style.fontSize = 100 * (clientWidth / 1920) + 'px';
			 }
		 };
	 if (!doc.addEventListener) return;
	 win.addEventListener(resizeEvt, recalc, false);
	 doc.addEventListener('DOMContentLoaded', recalc, false);
 })(document, window);

 //最大化处理
 var isFull = false;
 function f_FullWind() {
	 if (isFull) {
		 f_ExitFullScreen();
	 }
	 else {
		 f_FullScreen();
	 }
	 isFull = !isFull;
 }

 function f_FullScreen() {
	 var el = document.documentElement;
	 var rfs = el.requestFullScreen || el.webkitRequestFullScreen ||
		  el.mozRequestFullScreen || el.msRequestFullScreen;
	 if (typeof rfs != "undefined" && rfs) {
		 rfs.call(el);
	 } else if (typeof window.ActiveXObject != "undefined") {
		 //for IE，这里其实就是模拟了按下键盘的F11，使浏览器全屏
		 var wscript = new ActiveXObject("WScript.Shell");
		 if (wscript != null) {
			 wscript.SendKeys("{F11}");
		 }
	 }
 }

 function f_ExitFullScreen() {
	 var el = document;
	 var cfs = el.cancelFullScreen || el.webkitCancelFullScreen ||
		  el.mozCancelFullScreen || el.exitFullScreen;
	 if (typeof cfs != "undefined" && cfs) {
		 cfs.call(el);
	 } else if (typeof window.ActiveXObject != "undefined") {
		 //for IE，这里和fullScreen相同，模拟按下F11键退出全屏
		 var wscript = new ActiveXObject("WScript.Shell");
		 if (wscript != null) {
			 wscript.SendKeys("{F11}");
		 }
	 }
 }

 var irun = true;
 var deg = 0;
 var m_today = "";
 function f_Animal() {
	 if (!irun) return;
	 var divbig = document.getElementById("div_anim_big");
	 divbig.style.webkitTransform = "rotate(" + deg + "deg)";
	 if (deg >= 360) {
		 deg = 0;
	 }
	 else {
		 deg = deg + 1;
	 }

 }

 
 function f_SetLogo() {
	 irun = !irun;
 }

 function getNowFormatDate() {//获取当前时间
	 var date = new Date();
	 var seperator1 = "-";
	 var seperator2 = ":";
	 var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
	 var strDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();

	 var shi = date.getHours();
	 if (shi < 10) { shi = "0" + shi; }

	 var fen = date.getMinutes();
	 if (fen < 10) { shi = "0" + fen; }

	 var miao = date.getSeconds();
	 if (miao < 10) { miao = "0" + miao; }
	 var m_curday = date.getFullYear() + seperator1 + month + seperator1 + strDate;
	 if (m_today != m_curday) {
		 m_today = m_curday;
	 }
	 var currentdate = m_curday
			+ " " + shi + seperator2 + fen + seperator2 + miao;
	 return currentdate;
 }

 function f_GetDays() {
	 var strURL = "gis/getMap.aspx?CMD=GETDAYS";
	 $.post(strURL, null, function (data) {
		 if (data == "") return;
		 $("#m_days").html("安全生产" + data + "天");
	 });
 }
 var index = null;
 function f_SetLyr() {
	 if (index != null) layer.close(index);
	 index = layer.open({
		 skin: 'layui-layer-molv',
		 type: 2,
		 title: "<i class='ace-icon glyphicon glyphicon-list'></i> 图层管理",
		 shadeClose: true,
		 shade: false,
		 offset: 'r',
		 resize: false,
		 maxmin: false, //开启最大化最小化按钮
		 area: ['240px', '50%'],
		 content: 'blank.htm',
		 anim: 5
	 });

	 
	 $('#layui-layer' + index).css({ right: '10px', left: 'auto', top: '80px' });
	 $('#layui-layer' + index).css("background", "none"); //".layui-layer"
	 $('#layui-layer' + index).css("border", "1px solid #00A9E6");
	 $('#layui-layer' + index).css("border-radius", "5px");
	 $('#layui-layer' + index).css("background", "none");
	 $(".layui-layer-title").css("background", "#428BCA");
 }

 function f_floatToolInit() {
	 $("#ace-settings-btn").click(function () {
		 var val = $('#ace-settings-btn').attr('class')
		 if (val.indexOf("open") >= 0) {
			 $("#ace-settings-btn").removeClass("open");
			 $("#ace-settings-box").removeClass("open");
			 $("#ace-settings-box").css("border", "0px solid #0066CC");
		 }
		 else {
			 $("#ace-settings-btn").addClass("open");
			 $("#ace-settings-box").addClass("open");
			 $("#ace-settings-box").css("border", "2px solid #0066CC");
		 }
	 });
 }

 function f_initTreeView() {
	 var hei = $("#div_modal_dlg_content").height();
	 $("#ifr_left").height(hei-40);
	 $("#m_scroll_content").css("max-height", hei+"px");
 }

 function f_ShowDlg(url) {
	 var dlg = layer.open({
		 skin: 'layui-layer-molv',
		 type: 2,
		 title: "<i class='ace-icon fa fa-cog'></i> 查看详细信息",
		 shadeClose: false,
		 shade: 0.5,
		 resize: false,
		 maxmin: true, //开启最大化最小化按钮
		 area: ['800px', '500px'],
		 content: url
		 , anim: 5
	 });
	 $('#layui-layer' + dlg).css("background", "none"); //".layui-layer"
	 $('#layui-layer' + dlg).css("border", "1px solid RGB(66,139,202)");
	 //$('#layui-layer' + dlg).css("border-radius", "5px");
	 //$(".layui-layer-title").css("background", "#428BCA");
 }

 function f_ShowPopDlg(title,url) {
	 $("#m_dlgtitle").html(title);
	 $("#m_info1").attr('style', 'visibility: visible');
	 $("#FRM_INFO").attr("src", url);
	 $("#m_cont").attr('style', 'visibility: visible');
 }

 function f_CloseDlg() {
	 $("#m_cont").attr('style', 'display: none;');
//     $("#m_info1").attr('style', 'visibility: none');
//     $("#FRM_INFO").attr("src", url);
//     $("#m_cont").attr('style', 'visibility: none');
 }
