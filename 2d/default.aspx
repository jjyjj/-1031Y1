<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="MarketInfo._default" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="images/ico/map.ico" type="image/x-icon" />
    <link rel="icon" href="images/ico/map.ico" type="image/x-icon">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
    <script src="js/rem.js" type="text/javascript"></script>
    <link rel="stylesheet" href="css/style.css">
    <script src="webgis/jquery-2.2.3.min.js" type="text/javascript"></script>
    <link href="../assets/layer/skin/layer.css" rel="stylesheet" type="text/css" />
    <script src="../assets/layer/layer.js" type="text/javascript"></script>
    <link href="webgis/ol.css" rel="stylesheet" type="text/css" />
    <script src="webgis/ol.js" type="text/javascript"></script>
    <link href="webgis/map.css" rel="stylesheet" type="text/css" />
    <link href="webgis/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="webgis/bootstrap.min.js" type="text/javascript"></script>
    <link href="css/main.css" rel="stylesheet" type="text/css" />
    <title>河南省产业集聚区·大数据地图</title>
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
<body ><form runat="server"><%--style="visibility: hidden;"--%>
<asp:HiddenField ID="m_ip" runat="server" />
</form>
    <div class="container-flex" tabindex="0" hidefocus="true" 
        style="overflow: hidden">
        <div class="box-center" style="z-index: 0">
           <div id="map" style="width:100%;height:100%; position: absolute; z-index: 0;"></div>
        </div>
        <div id="MapUI" class="UI_MAIN">
            <div id="UIMenu" class="UI_MENU">
            
            </div>
            <div id="UILeft" class="UI_MENU_LEFT">
                <input id="Button8" type="button" value="" class="LEFT_DIV_BUTTON" style="height: 55px" />
                <div id="m_acy">
                </div>
            </div>   
            <div id="UIL_B" class="UI_LEFT_B">
            
            </div>   
            <div id="UIL_B2" class="UI_LEFT_B_2">
            
            </div>  
            <div id="Div_RT1" class="UI_RIGHT_TOP1">
                <table style="width: 90%; height: 40px; position: absolute;">
                    <tr>
                        <td height="0" style="text-align: center; vertical-align: middle">
                           <span id="cur_time" style="color: #FFFFFF">当前时间：</span>
                        </td>
                    </tr>                    
                </table>
                <div onclick="f_FullWind();" id="full_size" class="FULL_SIZE" title="全屏显示"></div>
            </div>  
            <div id="m_ghgqu" class="UI_RIGHT_GHGQ" style="visibility: hidden">
                <div id="bt-close" onclick="f_CloasGGQDlg();" 
                    style="width: 36px; height: 36px; top: -10px; position: absolute; right: -10px; z-index: 66;">
                    <img style="cursor: pointer" title="点击关闭" id="img_warm" src="images/MapUI/warm.png" width="36" /></div>    
                <div id="m_curzhan" 
                    style="width: 100%; height: 36px; position: absolute; left: 16px; color: #FFFFFF; top: 5px;"></div>
                <div id="d_ghglist" 
                    style="position: absolute; left: 14px; color: #FFFFFF; top: 30px; right: 9px; bottom:18px; overflow: scroll;">
                    <table style="width: 100%;" class="table1">
                        <tr>
                            <td>
                                
                            </td>
                            <td>
                                
                            </td>
                            <td>
                                
                            </td>
                        </tr>
                     </table>
                    </div>
            </div>  
            <div id="div_anim_big" class="UI_RB_BIGAN">
            
            </div> 
            <div id="Div_RT2" class="UI_RIGHT_TOP2">
            
            </div>    
            <div id="Div_RB1" class="UI_RB_1">
            
            </div>   
            <div id="Div1" class="UI_RB_2">
                <div style=" top: 28px; position: absolute; left: 38px;width: 98%; height: 100%;">
                    <table style="width: 100%;">
                    <tr>
                        <td style="color: #FFFFFF; font-size:small; vertical-align: middle; text-align: center">
                            <span id="m_days">地图服务：<a style="color: #FF0000; text-decoration: underline;" 
                                href="http://www.tianditu.com" target="_blank">国家天地图</a></span>
                        </td>
                    </tr> 
                </table>
                </div>   
                <div style="position: absolute; top: 64px; left: 52px;">
                    <table style="width: 100%;">
                        <tr>
                            <td style="color: #FFFFFF; font-size:small; vertical-align: middle; text-align: center">
                                <span>主办单位：河南省统计局</span>
                            </td>
                        </tr> 
                    </table>
                </div>           
            </div>  
            <div id="Div2" class="UI_RB_3">
            
            </div>  
            <div id="DivPop" class="UI_POP">
                <input id="cur_sel_title" class="UI_RD_CUR" type="button" value="全省共180个"/>
                <div id="cur_ani" class="UI_RD_CUR_ANI">
                    <table style="width: 100%;">
                        <tr>
                            <td height="60px" 
                                style="color: #FFFFFF; font-size: medium; vertical-align: middle; text-align: center" 
                                width="60px">
                                <span id="cnt_num"></span>
                            </td>
                        </tr>
                    </table>    
                </div>
            </div> 
            <div id="m_roads" class="UI_POP_BUTT">
                <%--<input id="Button1" type="button" value="" class="Button_UI" />--%>
            </div>  
            <div id="DivPop_Menu" class="UI_POP_MENU">
                
            </div>  
        </div>
        <div id="DIV_TOOLS" class="DIV_RIGHT">
            <table style="height: 100%; width: 100%">
            <tr>
                <td style="vertical-align: middle; text-align: center">
                    <img alt="" onclick="f_mapzoomin();" src="images/gis/zoomin.png" class="IMG_SIZE"
                        title="地图放大"  />   
                </td>
                </tr>
                <tr>
                <td style="vertical-align: middle; text-align: center">
                  <img alt="" onclick="f_mapzoomout();" src="images/gis/zoomout.png"  
                        class="IMG_SIZE" title="地图缩小" />    
                </td>
                </tr>
                <tr>
                <td style="vertical-align: middle; text-align: center">
                  <img alt="" onclick="map_SetTool(2);" src="images/gis/pan.png" 
                        class="IMG_SIZE" title="地图平移"  />    
                </td>
                </tr>
                <tr>
                <td style="vertical-align: middle; text-align: center">
                  <img alt="" onclick="map_SetTool(3);" src="images/gis/len.png" 
                        class="IMG_SIZE" title="测距离"  />    
                </td>
                </tr>
                <tr>
                <td style="vertical-align: middle; text-align: center">
                  <img alt="" onclick="f_Clear();" src="images/gis/clear.png" 
                        class="IMG_SIZE" title="清除"  />    
                </td>
                </tr>
                <tr>
                <td style="vertical-align: middle; text-align: center">
                  <img alt="" onclick="f_MapFull();" src="images/gis/fullmap.png"
                        class="IMG_SIZE" title="全图显示"  />    
                </td>
                </tr>
                <tr>
                <td style="vertical-align: middle; text-align: center">
                    <a href="wd_login.aspx" target="_blank">
                  <img alt="" src="images/gis/admin.png"
                        class="IMG_SIZE" title="系统登录"  /></a>    
                </td>
            </tr> 
        </table>  
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
    <script src="webgis/mapObj.js" type="text/javascript"></script>
    <script src="webgis/mapOS.js" type="text/javascript"></script>
    
</body>
</html>