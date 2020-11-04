<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_objMap.aspx.cs" Inherits="MapVistaGIS.wd_3dMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
<head>
	<meta charset="UTF-8">
	<link rel="shortcut icon" href="images/ico/map.ico" type="image/x-icon" />
	<link rel="icon" href="images/ico/map.ico" type="image/x-icon">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="renderer" content="webkit">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
	<link rel="stylesheet" href="ace/assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="ace/assets/font-awesome/4.5.0/css/font-awesome.min.css" />
	<link rel="stylesheet" href="ace/assets/css/fonts.googleapis.com.css" />
	<link rel="stylesheet" href="ace/assets/css/ace.min.css" class="ace-main-stylesheet"
		id="main-ace-style" />
	<link rel="stylesheet" href="ace/assets/css/ace-skins.min.css" />
	<script type="text/javascript" src="ace/assets/js/ace-extra.min.js"></script>
	<link rel="stylesheet" href="Lib_UI/css/style.css">
	<!--主要背景颜色-->
	<script src="Lib_UI/js/jquery-2.2.3.min.js" type="text/javascript"></script>
    <link href="2d/webGIS/map.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="ace/assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="ace/assets/js/ace-elements.min.js"></script>
	<script type="text/javascript" src="ace/assets/js/ace.min.js"></script>
	<link rel="stylesheet" href="ace/assets/css/ace-rtl.min.css" />
	<link href="Lib_UI/css/main.css" rel="stylesheet" type="text/css" />
	<link href="ace/assets/layer3.0/theme/default/layer.css" rel="stylesheet" type="text/css" />
	<script src="ace/assets/layer3.0/layer.js" type="text/javascript"></script>
	<link href="Lib_UI/css/map.css" rel="stylesheet" type="text/css" />
	<title>西气东输在豫管道可视化大数据地图</title>
	<style type="text/css">
		.layui-layer-load{
			background:none !important;
		}
	</style>
</head>
<body>
	<!--style="visibility: hidden;"-->
	<div id="m_container_flex" class="container-flex" tabindex="0" hidefocus="true" 
		style="overflow: hidden;">
		<div class="box-center" style="z-index: 0;">
			<div id="map" style="position: fixed; top: 0px; right: 0px; bottom: 0px; left: 0px;">
				<iframe id="IFRM_MAP" frameborder="0" width="100%" scrolling="no" height="100%" 
					src="webgis/map.htm"></iframe> 
			</div>
		</div>
		<div id="MapUI" class="UI_MAIN">
			<div id="UIMenu" class="UI_MENU">
				<div id="m_titles" class="UI_MENU_TITLE">
					河南省高速公路通行管制示意地图</div>
			</div>
			<div id="UIL_B" class="UI_LEFT_B">
			</div>
			<div id="UIL_B2" class="UI_LEFT_B_2">
			</div>
			<div id="Div_RT_TOOLBAR" class="UI_RIGHT_TOP">
				<div id="div_right_top_l" class="UI_RIGHT_TOP_LEFT">
				</div>
				<div id="div_right_top_r" class="UI_RIGHT_TOP_RIGHT">
				</div>
				<div id="div_right_top_m" class="UI_RIGHT_TOP_MID" style="width: 280px">
					<!--工具条在这里添加按钮，需要设置div_right_top_m 在外围的style="width: 300px"-->
					<table class="UI_RIGHT_TOP_MID_TABLE">
						<tr>
							<td style="color: #FFFFFF">
								<span onclick="objMapFrm.f_ZoomIn();" class="label label-sm label-primary arrowed arrowed-right"
									style="cursor: pointer" title="放大"><i class="ace-icon glyphicon glyphicon-zoom-in">
									</i></span><span onclick="objMapFrm.f_ZoomOut();" class="label label-sm label-primary arrowed arrowed-right"
										style="cursor: pointer" title="缩小"><i class="ace-icon glyphicon glyphicon-zoom-out">
										</i></span><span onclick="objMapFrm.f_MapN();" class="label label-sm label-primary arrowed arrowed-right"
											style="cursor: pointer" title="地图正北"><i class="ace-icon glyphicon glyphicon-upload">
											</i></span><span onclick="objMapFrm.f_GetLength();" class="label label-sm label-primary arrowed arrowed-right"
												style="cursor: pointer" title="测距"><i class="ace-icon fa fa-flag"></i>
								</span><span onclick="objMapFrm.f_ClearMap();" class="label label-sm label-primary arrowed arrowed-right"
									style="cursor: pointer" title="清除"><i class="ace-icon glyphicon glyphicon-remove">
									</i></span><span onclick="objMapFrm.f_FullMap();" class="label label-sm label-primary arrowed arrowed-right"
										style="cursor: pointer" title="全图"><i class="ace-icon glyphicon glyphicon-home">
										</i></span><span onclick="f_FullWind();" class="label label-sm label-primary arrowed arrowed-right"
											style="cursor: pointer" title="全屏显示"><i class="ace-icon glyphicon glyphicon-th">
											</i></span><span onclick="f_SetLyr();" class="label label-sm label-primary arrowed arrowed-right"
												style="cursor: pointer" title="图层"><i class="ace-icon glyphicon glyphicon-list">
												</i></span>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div id="div_anim_big" onclick="f_SetLogo();" class="UI_RB_BIGAN">
			</div>
			<div id="Div_RB1" class="UI_RB_1">
			</div>
			<div id="Div1" class="UI_RB_2">
			</div>
			<div id="Div2" class="UI_RB_3">
			</div>
			<div id="m_roads" class="UI_POP_BUTT">
			</div>
			<div id="DivPop_Menu" class="UI_POP_MENU">
			</div>
			<!--浮动的工具栏-->
		</div>
		<div id="float_tool">
			<!--所有的浮动工具条-->
			<div id="tool_bt">
				<div class="ace-settings-container" id="ace-settings-container" 
					style="margin-top: 80px">
				<div class="btn btn-app btn-xs btn-primary ace-settings-btn" id="ace-settings-btn" 
						>
					<i title="设置" class="ace-icon fa fa-cog bigger-130"></i>
				</div>
				<div class="ace-settings-box clearfix" id="ace-settings-box" 
						style="background-image: url('css/img/mapbg.png'); background-repeat: repeat; background-color: transparent;">
					<div class="pull-left width-100" id="m_maplyr">
						<div class="ace-settings-item">
							<input type="checkbox" onchange="f_ShowLyr(this.checked,objMapFrm.google_map);" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-navbar"
								autocomplete="off" checked="checked">
							<label class="lbl white" for="ace-settings-navbar">
								卫星地图</label>
						</div>
						<div class="ace-settings-item">
							<input type="checkbox" onchange="f_ShowLyr(this.checked,objMapFrm.hn_map);" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-sidebar"
								autocomplete="off">
							<label class="lbl white" for="ace-settings-sidebar">
								河南省地图</label>
						</div>

						<div class="ace-settings-item">
							<input type="checkbox" onchange="f_ShowLyr(this.checked,objMapFrm.china_map);" class="ace ace-checkbox-2 ace-save-state" id="Radio1"
								autocomplete="off" checked="checked">
							<label class="lbl white" for="ace-settings-sidebar">
								天地图全国</label>
						</div>

						<div class="ace-settings-item">
							<input type="checkbox" onchange="f_ShowDEM(this.checked);" class="ace ace-checkbox-2 ace-save-state" id="Checkbox1"
								autocomplete="off">
							<label class="lbl white" for="ace-settings-sidebar">
								全球地形</label>
						</div>
					</div>
				</div>
				<!-- /.ace-settings-box -->
			</div>
				<div id="right-menu" 
					class="modal aside aside-left aside-vc aside-fixed navbar-offset no-backdrop aside-hidden" 
					data-body-scroll="false" data-offset="true" data-placement="left" 
					data-fixed="true" data-backdrop="false" tabindex="-1" 
					style="display: none; ">
						<div class="modal-dialog" 
										id="div_modal_dlg" style="padding-top: 60px">
								<div  id="div_modal_dlg_content" class="modal-content ace-scroll" style="background-image: url('css/img/mapbg.png'); background-repeat: repeat; background-color: transparent; height: 400px;">
										<div class="scroll-track scroll-dark no-track idle-hide scroll-active" style="display: block; height: 314px;">
										<div class="scroll-bar" style="height: 249px; top: 0px;">
										</div>
										</div>
										<div id="m_scroll_content" class="scroll-content" 
											style="border: 1px solid #006699;  max-height: 500px; border-radius: 5px;">
											<div class="modal-header no-padding" style="height: 38px">
												<div class="table-header">
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
														<span class="white">×</span>
													</button>
													行政区划定位
												</div>
											</div>
											<div class="modal-body" style="padding: 0px;">
												<!--在这里填写代码-->
												<iframe id="ifr_left" frameborder="0" name="ifr_left" 
													src="mapPan/frm_XZQH.aspx" width="100%"></iframe>
											</div>
										</div></div>
										<!-- /.modal-content -->
										<button class="aside-trigger btn btn-info btn-app btn-xs ace-settings-btn" data-target="#right-menu" data-toggle="modal" type="button">
											<i data-icon1="fa-plus" data-icon2="fa-minus" class="ace-icon fa bigger-110 icon-only fa-plus"></i>
										</button>
									</div><!-- /.modal-dialog -->
				</div>
			</div>
<%--			<div id="Div_GHGQ" class="UI_RB_GHGQ">
				<input id="Button7" onclick="f_LoadGHGLine(3);" type="button" value="Ⅲ" class="Button_UI_GHGT" title="高后果区">
				<input id="Button6" onclick="f_LoadGHGLine(2);" type="button" value="Ⅱ" class="Button_UI_GHGT" title="高后果区">
				<input id="Button5" onclick="f_ShowPopDlg('查看详细信息','tab.htm');" type="button" value="弹出" class="Button_UI_GHGT" title="高后果区">
				<input id="Button9" onclick="f_ShowDlg('blank.htm');" type="button" value="查看" class="Button_UI_GHGT" title="查看">
			</div>--%>
			<div id="DIV_STATUS" class="UI_STATUS">
				<span id="map_reserch" class="pull-left" style="color: #FFFFFF; font-size: small">版权所有：河南省高速公路联网管理中心&nbsp&nbsp&nbsp设计开发：景观地理空间信息研究院</span>
				<span id="map_xy" class="pull-right" style="color: #FFFFFF; font-size: small">经度：<span id="m_jd" style="width: 160px"></span>&nbsp&nbsp纬度：<span id="m_wd" style="width: 160px"></span>&nbsp&nbsp高度：<span 
					id="m_gd" style="width: 120px"></span></span>
				
			</div>
		</div>
	</div>
	<div style="display: none;">
		<div id="info">
			&nbsp;</div>
		<!-- Clickable label for Vienna -->
		<a class="overlay" id="vienna" target="_blank" href="http://en.wikipedia.org/wiki/Vienna">
			Vienna</a>
		<div id="marker" title="Marker">
		</div>
		<!-- Popup -->
		<div id="popup" title="查询信息">
		</div>
	</div>
	<div id="toolTip"></div>
	<!--弹出式对话框部分_START-->
	<div id="m_cont" class="container" ondblclick="f_CloseDlg();" 
		style="z-index: 999">
		<div id="m_info1" class="pop-up" style="border: 1px solid #FF0000;">
			<span onclick="f_CloseDlg();" class="close-pop"></span>
			<h2 id="m_dlgtitle" class="title">信息信息页面</h2>
			<div class="pop-data-box">
			<iframe id="FRM_INFO" frameborder="0" width="100%" scrolling="no" height="100%" 
					src=""></iframe> 
			</div>
		</div>
	</div>    
	<!--弹出式对话框部分_END-->
	<script src="Lib_UI/js/rem_3d.js" type="text/javascript" charset="GBK"></script>
	<script src="3d/entity.js" type="text/javascript"></script>
</body>
</html>

