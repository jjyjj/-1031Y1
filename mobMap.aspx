<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mobMap.aspx.cs" Inherits="MarketInfo.mobMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
    <link rel="stylesheet" href="gis/css/style.css">
    <script type="text/javascript" src="gis/js/rem.js"></script>
    <script src="webgis/jquery-2.2.3.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="gis/js/layer/layer.min.js"></script>
    <script src="webgis/echarts.min.js" type="text/javascript"></script>
    <link href="webgis/ol.css" rel="stylesheet" type="text/css" />
    <script src="webgis/ol.js" type="text/javascript"></script>
    <link href="webgis/map.css" rel="stylesheet" type="text/css" />
    <link href="webgis/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="webgis/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="css/main.css" rel="stylesheet" type="text/css" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="apple-mobile-web-app-status-bar-style" content="black" />
	<!--标准mui.css-->
	<link rel="stylesheet" href="lib_Mob/css/mui.min.css" />
	<!--App自定义的css-->
	<link rel="stylesheet" type="text/css" href="lib_Mob/css/app.css" />
    <script type="text/javascript" src="lib_Mob/js/mui.min.js"></script>

    <title>河南省高速公路收费站管制示意图</title>
    <style type="text/css">
        /**
    * 这是有关标记的样式
    */
        .ol-zoom 
        {
            display: none;
        }
        .ol-zoom-out {
            display: none;
        }
         .ol-viewport {
				/*完全透明*/
				background-color: rgba(0, 0, 0, 0);
				/*完全不透明*/
				/*background-color: rgba(0, 28, 77,0.2);*/
		}
        .tooltip
        {
            position: relative;
            background: rgba(0, 0, 0, 0.5);
            border-radius: 4px;
            color: white;
            padding: 4px 8px;
            opacity: 0.7;
            white-space: nowrap;
        }
        .tooltip-measure
        {
            opacity: 1;
            font-weight: bold;
        }
        .tooltip-static
        {
            background-color: #ffcc33;
            color: black;
            border: 1px solid white;
        }
        .tooltip-measure:before, .tooltip-static:before
        {
            border-top: 6px solid rgba(0, 0, 0, 0.5);
            border-right: 6px solid transparent;
            border-left: 6px solid transparent;
            content: "";
            position: absolute;
            bottom: -6px;
            margin-left: -7px;
            left: 50%;
        }
        .tooltip-static:before
        {
            border-top-color: #ffcc33;
        }
       
    </style>
</head>
<body oncontextmenu="self.event.returnValue=false" onselectstart="return false">
    <div class="mui-content">
            <div class="mui-card">
				<div class="mui-card-header mui-card-media">
					<img src="images/sfz/lk.png" />
					<div class="mui-media-body">
						河南省高速公路收费站管制示意图
				    <p>服务总人次：<span id="m_vistcnt">......</span></p>
					</div>
				</div>
				<div class="mui-card-content">
					<div class="container-flex mui-card-content-inner" style="padding: 0px; height: 300px">
                        <div class="box-center" style="z-index: 0">
                           <div id="map" style="width:100%;height:100%; position: absolute; z-index: 0;"></div>
                        </div>
					</div>
				</div>
                <div class="mui-card-footer" style="padding: 0px 0px 0px 10px;">
                    <div class="btn-group" role="group" aria-label="...">
                         <span title="放大" onclick="f_mapzoomin();"  class="glyphicon glyphicon-zoom-in btn btn-primary"></span>
                         <span title="缩小"  onclick="f_mapzoomout();" class="glyphicon glyphicon-zoom-out btn btn-success"></span>
                         <span title="平移"  onclick="map_SetTool(2);"  class="glyphicon glyphicon-move btn btn-info"></span>
                         <span title="测距"  onclick="map_SetTool(3);"  class="glyphicon glyphicon-pencil btn btn-warning"></span>
                         <span title="清除"  onclick="map_SetTool(2);"  class="glyphicon glyphicon-refresh btn progress-bar-info progress-bar-striped"></span>
                         <span title="全图"  onclick="f_MapFull();"  class="glyphicon glyphicon-fullscreen btn btn-danger"></span>
                         <span title="定位"  onclick="f_MapLoc();"  class="glyphicon glyphicon-screenshot btn progress-bar-success progress-bar-striped"></span>
                    </div>
                  </div>
		    </div>

            <div class="mui-card">
				<div class="mui-card-header mui-card-media">
					<img src="images/emap.png" />
					<div class="mui-media-body">
						图例
				    <p>...</p>
					</div>
				</div>
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
                        <div class="box-center" style="z-index: 0;">
                         <table style="border-style: none; border-width: 0px; width: 100%; border-collapse: collapse;
                            padding-top: 5px; padding-left: 5px; height: 100%; font-size: small;">
                            <tr>
                                <td style="vertical-align: middle; text-align: center" height="32">
                                    <img src="images/sfz/xy.png" />
                                </td>
                                <td style="vertical-align: middle; text-align: center" width="30px">
                                    <input id="Button2" type="button" 
                                        style="border-style: none; background-color: #33CC33; width: 20px; height: 6px" /></td>
                                <td style="vertical-align: middle; text-align: left; ">
                                    正常通行</td>
                                         </tr>
                            <tr>
                                <td style="vertical-align: middle; text-align: center" height="32">
                                    <img width="16px" src="images/zl/48/no.png" />
                                </td>
                                <td style="vertical-align: middle; text-align: center" width="30px">
                                    <input id="Button1" type="button" 
                                        style="border-style: none; background-color: #FF0000; width: 20px; height: 6px" /></td>
                                <td style="vertical-align: middle; text-align: left; ">
                                    禁止所有车辆上站或通行
                                </td>
                            </tr>
                            <tr>
                                <td style="vertical-align: middle; text-align: center" height="32">
                                    <img width="26px" src="images/zl/48/x7.png" />
                                </td>
                                <td style="vertical-align: middle; text-align: center" width="30px">
                                    <input id="Button3" type="button" 
                                        style="border-style: none; background-color: #FFFF66; width: 20px; height: 6px" />
                                </td>
                                <td style="vertical-align: middle; text-align: left; ">
                                    禁止7座(含7座)以上车辆上站或通行
                                </td>
                            </tr>
                            <tr>
                                <td style="vertical-align: middle; text-align: center" height="32">
                                    <img width="26px" src="images/zl/48/x8.png" />
                                </td>
                                <td style="vertical-align: middle; text-align: center" width="30px">
                                    <input id="Button4" type="button" 
                                        style="border-style: none; background-color: #CC0066; width: 20px; height: 6px" />
                                </td>
                                <td style="vertical-align: middle; text-align: left; ">
                                    禁止7座(不含7座)以上车辆上站或通行
                                </td>
                            </tr>
                            <tr>
                                <td style="vertical-align: middle; text-align: center" height="32">
                                    <img width="26px" src="images/zl/48/xh.png" />
                                </td>
                                <td style="vertical-align: middle; text-align: center" width="30px">
                                    <input id="Button5" type="button" 
                                        style="border-style: none; background-color: #CC6600; width: 20px; height: 6px" />
                                </td>
                                <td style="vertical-align: middle; text-align: left; ">
                                    禁止货车、危险品车辆上站或通行</td>
                            </tr>
                            <tr>
                                <td style="vertical-align: middle; text-align: center" height="32">
                                    <img width="26px" src="images/zl/48/h7.png" />
                                </td>
                                <td style="vertical-align: middle; text-align: center" width="30px">
                                    <input id="Button6" type="button" 
                                        style="border-style: none; background-color: #FF9900; width: 20px; height: 6px" />
                                </td>
                                <td style="vertical-align: middle; text-align: left; ">
                                    禁止货车、7座(含7座)以上车辆上站或通行
                                </td>
                            </tr>
                            <tr>
                                <td style="vertical-align: middle; text-align: center" height="32">
                                    <img width="26px" src="images/zl/48/h8.png" />
                                </td>
                                <td style="vertical-align: middle; text-align: center" width="30px">
                                    <input id="Button7" type="button" 
                                        style="border-style: none; background-color: #FF6699; width: 20px; height: 6px" />
                                </td>
                                <td style="vertical-align: middle; text-align: left; ">
                                    禁止货车、7座(不含7座)以上车辆上站或通行
                                </td>
                            </tr>
                        </table>   
                        </div>
					</div>
				</div>
                <%--<div class="mui-card-footer">
                    技术支持：景观地理空间信息研究院
                </div>--%>
		    </div>

            <div class="mui-card">
				<div class="mui-card-header mui-card-media">
					<img src="images/UI/car.png" />
					<div class="mui-media-body">
						收费站管制情况
				    <p>发布时间：<span id="m_fbtime">......</span></p>
					</div>
				</div>
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
                        <div class="box-center" style="z-index: 0; max-height:200px; overflow: auto;">
                           <span id="m_infor" style="vertical-align: top; text-align: left; "></span>     
                        </div>
					</div>
				</div>
                <div class="mui-card-footer">信息来源：河南省高速公路路警指挥中心</div>
		    </div>
            <div class="mui-card">
				<div class="mui-card-header mui-card-media">
					<img src="images/ico03.png" />
					<div class="mui-media-body">
						今日服务统计
				    <p>共服务：<span id="m_allnum">...</span> 人次</p>
					</div>
				</div>
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
                        <div class="box-center" style="z-index: 0; max-height:200px; overflow: auto;">
                        <div id="m_rfw"
                                style="height: 180px; "></div>      
                        </div>
					</div>
				</div>
		    </div>

            <div class="mui-card">
				<div class="mui-card-header mui-card-media">
					<img src="images/i07.png" />
					<div class="mui-media-body">
						更多路况，扫码关注“河南高速”微信公众号
				    <p>...</p>
					</div>
				</div>
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
                        <div class="box-center" style="z-index: 0;overflow: auto;">
                         <img src="images/ewm.png" />   
                        </div>
					</div>
				</div>
                <div class="mui-card-footer">技术支持：景观地理空间信息研究院</div>
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
</body>

</html>
<script src="webgis/mapMob.js" type="text/javascript"></script>  
