//河南省范围
var ip=$("#m_ip").val();//"http://"+ip+":
var extent = [12284604, 3660520, 12984877, 4325960];
var googlemap = "http://mt0.google.cn/vt/lyrs=s&x={x}&y={y}&z={z}";
var map_wx = new ol.layer.Tile({
    source: new ol.source.XYZ({
        url: googlemap
    }),
    projection: 'EPSG:3857',
    maxResolution: 139
});

var m_hnwxmap = "http://gis.hnrkdt.com/xqds/{z}/{x}/{y}.png";
var map_hn_wx = new ol.layer.Tile({
    source: new ol.source.XYZ({
        url: m_hnwxmap
    }),
    projection: 'EPSG:3857',
    minResolution: 69
});

var strmap = "http://gis.hnrkdt.com/mktxyz.aspx?T=MAPVISTAGIS&z={z}&x={x}&y={y}"; //电子地图
var tdtmap = "http://t4.tianditu.com/DataServer?T=cia_w&x={x}&y={y}&l={z}&tk=221b586ea9d6fe72785d8b56c61aa396";
var map_emap = new ol.layer.Tile({
    source: new ol.source.XYZ({
        url: strmap
    }),
    projection: 'EPSG:3857'
    ,minResolution: 139
});

var map_tdtemap = new ol.layer.Tile({
    source: new ol.source.XYZ({
        url: tdtmap
    }),
    projection: 'EPSG:3857'
    ,maxResolution: 139
});

//////
var view = new ol.View({
    center: [12634692.2407366, 4016756.09],
    zoom: 7,
    extent: extent,
    minZoom: 7,
    maxZoom: 19
});

//rkmap,map_china,map_tdt
var map = new ol.Map({
    target: "map",
    layers: [map_wx, map_hn_wx],
    loadTilesWhileAnimating: true,
    interactions: ol.interaction.defaults({
        pinchRotate: false
    }),
    view: view
});

map.addOverlay(map_emap);
map.addOverlay(map_tdtemap);
var graticule = new ol.Graticule({
    // the style to use for the lines, optional.
    strokeStyle: new ol.style.Stroke({
        color: 'rgba(7,76,191,0.8)',
        width: 1.4,
        lineDash: [0.5, 4]
    }),
    showLabels: true
});

graticule.setMap(map);

var scaleLineControl = new ol.control.ScaleLine({
    //设置度量单位为米                
    units: 'metric',
    target: 'scalebar',
    className: 'ol-scale-line'
});
map.addControl(scaleLineControl);
//取消这个控件
$(".ol-attribution").remove();  


//矢量数据图层
var vector_Lin;
var vector_Lin_Navi;
var vector_Lin_GHG;
//高速公路的颜色
var vector_mian;
var vector_CutMian;

//矢量的点
var vector_poi;
var poisource;
var mianSource;
var cutSource;

//各种工具
var select;
//var MeasureTool;
var cur_Tool = 0;
var popup = null;

//绘制矢量数据
var draw_vector;
var draw_Line; //绘制线
var draw_poi; //绘制矢量数据点
var modify_poi;
//

//marker注记图层
var markerLayer = null;
var markerLayer_Data = null; //标记
var markerLayer_map = null; //标记
var markerLayer_XM = null; //高速LOGO
var markerLayer_XIAN = null;//穿越

/////////////////测距离和面积工具Start////////////////////////////////////////////////////////
var source = new ol.source.Vector();
var vectorCeLiang = new ol.layer.Vector({
    source: source,
    style: new ol.style.Style({
        fill: new ol.style.Fill({
            color: 'rgba(255, 255, 255, 0.5)'
        }),
        stroke: new ol.style.Stroke({
            color: 'rgba(128, 128, 128, 0.99)',
            width: 2
        }),
        image: new ol.style.Circle({
            radius: 7,
            fill: new ol.style.Fill({
                color: '#ffcc33'
            })
        })
    })
});

/**
* Currently drawn feature.
* @type {ol.Feature}
*/
var sketch;
/**
* The help tooltip element.
* @type {Element}
*/
var helpTooltipElement;


/**
* Overlay to show the help messages.
* @type {ol.Overlay}
*/
var helpTooltip;


/**
* The measure tooltip element.
* @type {Element}
*/
var measureTooltipElement;


/**
* Overlay to show the measurement.
* @type {ol.Overlay}
*/
var measureTooltip;


/**
* Message to show when the user is drawing a polygon.
* @type {string}
*/
var continuePolygonMsg = '面积测算';


/**
* Message to show when the user is drawing a line.
* @type {string}
*/
var continueLineMsg = '距离测算';

/**
* Handle pointer move.
* @param {ol.MapBrowserEvent} evt The event.
*/
var pointerMoveHandler = function (evt) {
    if (evt.dragging) {
        return;
    }
    /** @type {string} */
    var helpMsg = '点击开始';

    if (sketch) {
        var geom = (sketch.getGeometry());
        if (geom instanceof ol.geom.Polygon) {
            helpMsg = continuePolygonMsg;
        } else if (geom instanceof ol.geom.LineString) {
            helpMsg = continueLineMsg;
        }
    }

    helpTooltipElement.innerHTML = helpMsg;
    helpTooltip.setPosition(evt.coordinate);
    helpTooltipElement.classList.remove('hidden');
};

//测量绘制工具
var draw; // global so we can remove it later
/**
* Format length output.
* @param {ol.geom.LineString} line The line.
* @return {string} The formatted length.
*/

var formatLength = function (line) {
    var length = ol.Sphere.getLength(line);
    var output;
    if (length > 100) {
        output = (Math.round(length / 1000 * 100) / 100) +
              ' ' + '公里';
    } else {
        output = (Math.round(length * 100) / 100) +
              ' ' + '米';
    }
    return output;
};


/**
* Format area output.
* @param {ol.geom.Polygon} polygon The polygon.
* @return {string} Formatted area.
*/
var formatArea = function (polygon) {
    var area = ol.Sphere.getArea(polygon);
    var output;
    if (area > 10000) {
        output = (Math.round(area / 1000000 * 100) / 100) +
              ' ' + '公里<sup>2</sup>';
    } else {
        output = (Math.round(area * 100) / 100) +
              ' ' + '米<sup>2</sup>';
    }
    return output;
};

function addInteraction(itype) {
    var type = "LineString";
    if (itype == 1) { //表示测面积
        type = "Polygon";
    }
    draw = new ol.interaction.Draw({
        source: source,
        type: type,
        style: new ol.style.Style({
            fill: new ol.style.Fill({
                color: 'rgba(255, 255, 255, 0.3)'
            }),
            stroke: new ol.style.Stroke({
                color: 'rgba(0, 0, 0, 0.5)',
                lineDash: [10, 10],
                width: 2
            }),
            image: new ol.style.Circle({
                radius: 5,
                stroke: new ol.style.Stroke({
                    color: 'rgba(0, 0, 0, 0.7)'
                }),
                fill: new ol.style.Fill({
                    color: 'rgba(255, 255, 255, 0.2)'
                })
            })
        })
    });
    map.addInteraction(draw);
    createMeasureTooltip();
    createHelpTooltip();
    var listener;
    draw.on('drawstart',
            function (evt) {
                // set sketch
                sketch = evt.feature;

                /** @type {ol.Coordinate|undefined} */
                var tooltipCoord = evt.coordinate;

                listener = sketch.getGeometry().on('change', function (evt) {
                    var geom = evt.target;
                    var output;
                    if (geom instanceof ol.geom.Polygon) {
                        output = formatArea(geom);
                        tooltipCoord = geom.getInteriorPoint().getCoordinates();
                    } else if (geom instanceof ol.geom.LineString) {
                        output = formatLength(geom);
                        tooltipCoord = geom.getLastCoordinate();
                    }
                    measureTooltipElement.innerHTML = output;
                    measureTooltip.setPosition(tooltipCoord);
                });
            }, this);

    draw.on('drawend',
            function () {
                measureTooltipElement.className = 'tooltip tooltip-static';
                measureTooltip.setOffset([0, -7]);
                // unset sketch
                sketch = null;
                // unset tooltip so that a new one can be created
                measureTooltipElement = null;
                createMeasureTooltip();
                ol.Observable.unByKey(listener);
            }, this);
}

/**
* Creates a new help tooltip
*/
function createHelpTooltip() {
    if (helpTooltipElement) {
        helpTooltipElement.parentNode.removeChild(helpTooltipElement);
    }
    helpTooltipElement = document.createElement('div');
    helpTooltipElement.className = 'tooltip hidden';
    helpTooltip = new ol.Overlay({
        element: helpTooltipElement,
        offset: [15, 0],
        positioning: 'center-left'
    });
    map.addOverlay(helpTooltip);
}

/**
* Creates a new measure tooltip
*/
function createMeasureTooltip() {
    if (measureTooltipElement) {
        measureTooltipElement.parentNode.removeChild(measureTooltipElement);
    }
    measureTooltipElement = document.createElement('div');
    measureTooltipElement.className = 'tooltip tooltip-measure';
    measureTooltip = new ol.Overlay({
        element: measureTooltipElement,
        offset: [0, -15],
        positioning: 'bottom-center'
    });
    measureTooltip.set("gid", "CELIANG");
    map.addOverlay(measureTooltip);
}

//清空测量的结果
function f_ClearCLTooltip() {
    try {
        vectorCeLiang.getSource().clear();
    }
    catch (e) {

    }

    var arrCol = map.getOverlays().getArray();
    for (var i = 0; i < arrCol.length; i++) {
        if (arrCol[i].get("gid") == "CELIANG") {
            map.removeOverlay(arrCol[i]);
            arrCol = map.getOverlays().getArray();
            i = 0;
            continue;
        }
    }
    //arrCol.clear();


    createMeasureTooltip();
    createHelpTooltip();
}

/////////////////测距离和面积工具End////////////////////////////////////////////////////////
f_Init();
//表示地图的所有操作接口
//初始化
function f_Init() {
    var objVector_Line = new ol.source.Vector({ wrapX: false });
    vector_Lin = new ol.layer.Vector({
        renderMode: 'image',
        source: objVector_Line,
        style: new ol.style.Style({
            stroke: new ol.style.Stroke({
                color: '#FF0000',
                width: 4
            })
        })
    });

    vector_Lin_Navi = new ol.layer.Vector({
        renderMode: 'image',
        source: new ol.source.Vector({ wrapX: false }),
        style: new ol.style.Style({
            stroke: new ol.style.Stroke({
                color: 'rgba(0,0,255,1.0)',
                width: 3
            })
        })
    });

    vector_Lin_GHG = new ol.layer.Vector({
        renderMode: 'image',
        source: new ol.source.Vector({ wrapX: false }),
        style: new ol.style.Style({
            stroke: new ol.style.Stroke({
                color: "#FF0000",//#FF0000
                width: 4,
                lineDash: [4,7]
            })
        })
        ,maxResolution: 200
    });

    mianSource = new ol.source.Vector({ wrapX: false });
    vector_mian = new ol.layer.Vector({
        source: mianSource,
        style: new ol.style.Style({
            fill: new ol.style.Fill({
                color: 'rgba(0,0,255,0.2)'
            }),
            stroke: new ol.style.Stroke({
                color: 'rgba(0,255,0,1)',
                width: 2
            }),
            image: new ol.style.Circle({
                radius: 6,
                fill: new ol.style.Fill({
                    color: 'rgba(255,0,0,1)'
                })
            })
        })
    });

    cutSource = new ol.source.Vector({ wrapX: false });
    vector_CutMian = new ol.layer.Vector({
        source: cutSource,
        style: new ol.style.Style({
            fill: new ol.style.Fill({
                color: 'rgba(255,0,0,0.1)'
            }),
            stroke: new ol.style.Stroke({
                color: 'rgba(255,0,0,0.3)',
                width: 2
            }),
            image: new ol.style.Circle({
                radius: 6,
                fill: new ol.style.Fill({
                    color: 'rgba(255,0,0,1)'
                })
            })
        })
        ,maxResolution: 100
    });

    poisource = new ol.source.Vector();
    vector_poi = new ol.layer.Vector({
        source: poisource,
        style: new ol.style.Style({
            fill: new ol.style.Fill({
                color: 'rgba(255,255,255,1)'
            }),
            stroke: new ol.style.Stroke({
                color: 'rgba(255,0,0,1)',
                width: 2
            }),
            image: new ol.style.Circle({
                radius: 6,
                fill: new ol.style.Fill({
                    color: 'rgba(255,0,0,1)'
                })
            })
        })
    });

    //map.addOverlay(vector_mian);

    markerLayer_XM = new ol.layer.Vector({
        source: new ol.source.Vector()
        ,maxResolution: 300
    });

    

    map.addOverlay(vector_Lin);
    
    
    map.addLayer(vector_mian);
    map.addLayer(vector_CutMian);

    //POI矢量点
    map.addLayer(vector_poi);

    //测量图层

    map.addLayer(vectorCeLiang);
    addInteraction(0);
    select = new ol.interaction.Select({
        layers: [markerLayer],
        style: new ol.style.Style({
            fill: new ol.style.Fill({
                color: 'rgba(255, 255, 0, 0.5)'
            }),
            stroke: new ol.style.Stroke({
                color: 'rgba(255, 255, 0, 1.0)',
                //lineDash: [10, 10],
                width: 2
            }),
            image: new ol.style.Circle({
                radius: 5,
                stroke: new ol.style.Stroke({
                    color: 'rgba(0, 0, 0, 0.7)'
                }),
                fill: new ol.style.Fill({
                    color: 'rgba(255, 255, 255, 0.2)'
                })
            })
        })
    });
    map.addInteraction(select); //map加载该控件，默认是激活可用的

    map_SetTool(2);
    //    var type = "LineString";
    //    if (itype == 1) { //表示测面积
    //        type = "Polygon";
    //    }
    var sourceMain = new ol.source.Vector({ wrapX: false });
        
    draw_vector = new ol.interaction.Draw({
        source: cutSource,
        type: "Polygon",
        style: new ol.style.Style({
            fill: new ol.style.Fill({
                color: 'rgba(255, 0, 0, 0.3)'
            }),
            stroke: new ol.style.Stroke({
                color: 'rgba(255, 0, 0, 1.0)',
                lineDash: [10, 10],
                width: 2
            }),
            image: new ol.style.Circle({
                radius: 5,
                stroke: new ol.style.Stroke({
                    color: 'rgba(0, 0, 0, 0.7)'
                }),
                fill: new ol.style.Fill({
                    color: 'rgba(255, 255, 255, 0.2)'
                })
            })
        })
    });

    draw_Line = new ol.interaction.Draw({
        source: sourceMain,
        type: "LineString",
        style: new ol.style.Style({
            fill: new ol.style.Fill({
                color: 'rgba(255, 255, 255, 0.3)'
            }),
            stroke: new ol.style.Stroke({
                color: 'rgba(255, 0, 0, 1.0)',
                lineDash: [5, 5],
                width: 2
            }),
            image: new ol.style.Circle({
                radius: 5,
                stroke: new ol.style.Stroke({
                    color: 'rgba(0, 0, 0, 0.7)'
                }),
                fill: new ol.style.Fill({
                    color: 'rgba(255, 255, 255, 0.2)'
                })
            })
        })
    });

    draw_poi = new ol.interaction.Draw({
        source: poisource,
        type: "Point",
        style: new ol.style.Style({
            fill: new ol.style.Fill({
                color: 'rgba(255, 255, 255, 0.3)'
            }),
            stroke: new ol.style.Stroke({
                color: 'rgba(0, 0, 0, 0.5)',
                lineDash: [10, 10],
                width: 2
            }),
            image: new ol.style.Circle({
                radius: 5,
                stroke: new ol.style.Stroke({
                    color: 'rgba(0, 0, 0, 0.7)'
                }),
                fill: new ol.style.Fill({
                    color: 'rgba(255, 255, 255, 0.2)'
                })
            })
        })
    });


    draw_poi.on('drawend', function (evt) {
        var geom = evt.feature;
        var wkt = map_GetFeatureWKT(geom);
        parent.f_MapAddEvent(wkt, geom);
    }, this);

    draw_Line.on('drawend', function (evt) {
        var geom = evt.feature;
        var wkt = map_GetFeatureWKT(geom);
        //alert(wkt);
        //parent.f_MapAddEvent(wkt,geom);
    }, this);

    this.modify_poi = new ol.interaction.Modify({
        source: poisource,
        features: select.getFeatures()
    });

    this.modify_poi.on("modifyend", function (e) {
        var geom = e.features.item(0); //me.features.item(0)
        var wkt = map_GetFeatureWKT(geom);
        var gid = geom.get("gid");
        alert(gid);
        return;
        try {
            parent.f_MoveSFZ(gid, wkt);
        }
        catch (e) { }
    }, this);

    //map.addInteraction(draw_vector);

    //    var cur_drawFt;
    draw_vector.on('drawstart',
    function (evt) {
         try {
            cutSource.clear();
        } catch (e) { }           
    }, this);

    draw_vector.on('drawend',
    function (evt) {
        map_SetTool(1);
    }, this);

    map.on("pointermove", function (e) {

        if (cur_Tool == 2) {
            var pixel = map.getEventPixel(e.originalEvent);
            var feature = map.forEachFeatureAtPixel(pixel, function (feature) {
                return feature;
            });
            if (feature == undefined) {
                map.getTargetElement().style.cursor = "auto"
            } else {
                var objFt = map.getTargetElement();
                try {
                    var myid = feature.get("gid");
                    var iclass = feature.get("class");
                    if (iclass == "2" || iclass == "3"|| iclass == "1"|| iclass == "4"|| iclass == "7") {
                        var strname = feature.get("name");
                        objFt.style.cursor = "pointer";
                    }
                }
                catch (e) { }                
            }
        }
        //测量工具
        if (cur_Tool == 3 || cur_Tool == 4) {
            pointerMoveHandler(e);
        }

    });

    map.on('singleclick', mapClick);

    map.getViewport().addEventListener('mouseout', function () {
        helpTooltipElement.classList.add('hidden');
    });


    markerLayer = new ol.layer.Vector({
        source: poisource
    });

   

    markerLayer_Data = new ol.layer.Vector({
        source: new ol.source.Vector()
    });
    markerLayer_map = new ol.layer.Vector({
        source: new ol.source.Vector(),
        maxResolution: 900
    });

    markerLayer_XIAN = new ol.layer.Vector({
        source: new ol.source.Vector(),
        maxResolution: 200
    });


    map.addOverlay(vector_Lin_Navi);
    map.addOverlay(vector_Lin_GHG);

    map.addOverlay(markerLayer_XIAN);
    map.addOverlay(markerLayer_map);
    map.addOverlay(markerLayer_XM);
    map.addOverlay(markerLayer_Data);
    map.addOverlay(markerLayer);
    

    popup = new ol.Overlay({
        element: document.getElementById("popup")
    });
    map.addOverlay(popup);
    map.getView().on('change:resolution', ViewZoomEvent); //checkZoom为调用的函数

}

function ViewZoomEvent() {
    var zoom = map.getView().getZoom();
    
}

//地图点击事件
function mapClick(e) {
    if (cur_Tool == 2) {
        map_ClearPopup();
        var pixel = map.getEventPixel(e.originalEvent);
        var feature = map.forEachFeatureAtPixel(pixel, function (feature) {
            return feature;
        });
        if (feature == undefined) {

        }
        else {
            var gid = feature.get("gid");
            try {
                var lonlat = e.coordinate;
                var ic = feature.get("class");
                var names = feature.get("name");
                var zoom = view.getZoom();
                if (ic == "2") {
                    f_ShowXMByXID(gid,names);
                }
                else if (ic == "3") { 
                    
                    if(zoom>=18){
                        try{
                            f_ShowFSZDlg(gid,names);
                        }catch(e){}
                    }
                    else
                    {
                        var wkt = feature.get("wkt");
                        map_Center_WKT(wkt,true,18,6000);
                    }
                    
                }
                else if (ic == "4") { 
                    var wkt = feature.get("wkt");
                    map_ZoomToWKT(wkt);
                }
                else{
                }
            }
            catch (e) {

            }
        }
    }

    if (cur_Tool == 6) { //代表获取地图坐标
        var lonlat = e.coordinate;
        //var str = "[Map]:" + lonlat[0] + "," + lonlat[1];
        //alert(str);
        var wktxy = map_GetWKTPoint(lonlat[0], lonlat[1]);
        map_Clear();
        map_AddMarkerByWKT("001", "name", wktxy, "webGIS/imges/online.png", "0");
        try {
            parent.f_GetXY(wktxy);
        } catch (e) { }
    }
}

function map_GetWKTPoint(x, y) {
    var xy = "POINT(" + x + " " + y + ")";
    return xy;
}

//实体处理类
function map_GetFeatrueCenterXY(feature) {
    // [minx, miny, maxx, maxy].
    var extend = feature.getGeometry().getExtent();
    var centerxy = [(extend[0] + extend[2]) / 2, (extend[1] + extend[3]) / 2];
    return centerxy;
}

//获取实体的WKT格式
function map_GetFeatureWKT(feature) {
    var geom = feature;
    var format = new ol.format.WKT();
    var wkt = format.writeFeature(geom);
    return wkt;
}

//设置工具
function map_SetTool(iTool) {
    map.removeInteraction(draw);
    map.removeInteraction(draw_vector);
    map.removeInteraction(draw_Line);
    map.removeInteraction(draw_poi);
    map.removeInteraction(select);
    map.removeInteraction(modify_poi);
    cur_Tool = iTool;
    if (iTool == 0) {

        return;
    }

    if (iTool == 1) {
        map.addInteraction(select);
        select.setActive(true);
        return;
    }

    //2表示查询
    if (iTool == 2) {
        f_ClearCLTooltip();
        return;
    }

    //2表示测距离
    if (iTool == 3) {
        //map.addInteraction(draw);
        //draw.setActive(true);
        addInteraction(0);
        return;
    }

    //4表示测面积
    if (iTool == 4) {
        //表示
        //map.addInteraction(draw);
        //draw.setActive(true);
        addInteraction(1);
        return;
    }

    //5表示手动添加禁入和例外区
    if (iTool == 5) {
        //map_Clear()
        map.addInteraction(draw_vector);
        draw_vector.setActive(true);
        return;
    }

    //5表示手动添加禁入和例外区
    if (iTool == 6) {
        //map_Clear()

        return;
    }

    //绘制矢量数据
    if (iTool == 7) {
        //map_Clear()
        map.addInteraction(draw_poi);
        draw_poi.setActive(true);
        return;
    }

    //修改点
    if (iTool == 8) {
        //map_Clear()
        map.addInteraction(select);
        map.addInteraction(modify_poi);
        modify_poi.setActive(true);
        return;
    }

    //修改点
    if (iTool == 9) {
        //map_Clear()
        //map.addInteraction(select);
        map.addInteraction(draw_Line);
        draw_Line.setActive(true);
        return;
    }

}

//清楚所有
function map_Clear() {
    try { vector_Lin.getSource().clear(); } catch (e) { }
    try { vector_Lin_Navi.getSource().clear(); } catch (e) { }
    try { vector_Lin_GHG.getSource().clear(); } catch (e) { }
    try { vector_mian.getSource().clear(); } catch (e) { }
    try { vector_poi.getSource().clear(); } catch (e) { }
    try { select.getFeatures().clear(); } catch (e) { }
    //f_map_ClearMarker();
    try { map_ClearPopup(); } catch (e) { }
    try { f_ClearCLTooltip(); } catch (e) { }
    try { f_ClearHZVector(); } catch (e) { }
}

//清除某个图层的要素
function map_OjbClear(objLyr) {
    try {
        objLyr.getSource().clear();

    }
    catch (e) {
        //alert(e);
    }
}

//清除marker标记
function f_map_ClearMarker() {

    try {
        markerLayer.getSource().clear();
    }
    catch (e) {

    }

}

//地图显示------------------------------------------------------------------------------------
//x=代表横坐标，y代表纵坐标，z代表放大级别(见说明1、地图的级别)
function map_ZoomIn() {
    var zoom = view.getZoom();
    view.animate({
        zoom: zoom + 2
    });
    //view.setZoom(zoom+2);
}

function map_ZoomOut() {
    var zoom = view.getZoom();
    view.animate({
        zoom: zoom - 2
    });
    //view.setZoom(zoom-2);
}

//经纬度转米坐标
function map_Wgs2Mkt(x, y) {
    //return ol.proj.transform([x, y], 'EPSG:4326', 'EPSG:900913');
    return ol.proj.fromLonLat([x, y]);
}


function _getMercator(poi) {//[114.32894, 30.585748]
    var mercator = {};
    var earthRad = 6378137.0;
    // console.log("mercator-poi",poi);
    mercator.x = poi[0] * Math.PI / 180 * earthRad;
    var a = poi[1] * Math.PI / 180;
    mercator.y = earthRad / 2 * Math.log((1.0 + Math.sin(a)) / (1.0 - Math.sin(a)));
    // console.log("mercator",mercator);
    return mercator;
}

//米坐标转经纬度
function map_Mkt2Wgs(x, y) {
    return ol.proj.transform([x, y], 'EPSG:900913', 'EPSG:4326');
}

function map_ZoomToWKT(wkt) {
    var format = new ol.format.WKT();
    var geom = format.readGeometry(wkt);
    view.fit(geom.getExtent());
    var zoom = view.getZoom();
    view.animate({
        zoom: zoom - 1
    });
}

function map_ZoomToWKT_NOANIMATE(wkt) {
    var format = new ol.format.WKT();
    var geom = format.readGeometry(wkt);
    view.fit(geom.getExtent());
}

function map_ZoomToWKT_ZOOM(wkt,zoom) {
    var format = new ol.format.WKT();
    var geom = format.readGeometry(wkt);
    view.fit(geom.getExtent());
    view.animate({
        zoom: zoom
    });
    //alert(geom.getExtent());
    //wkt = format.writeGeometry(yourFeature.getGeometry());
}

function map_CenterZ(x, y, z, is_animate) {
    //自动判定是经纬度还是墨卡托
    var m_XYType = 1; //=0代表墨卡托投影
    if (x >= 0 && x <= 360 & y >= 0 && y <= 90) {
        m_XYType = 0;
    }

    if (m_XYType == 0) {
        //113.6684080007,34.7676365757
        var pos = ol.proj.fromLonLat([x, y]);
        if (is_animate) {
            view.animate({
                zoom: z,
                center: pos,
                duration: 1000
            });
        }
        else {
            view.setZoom(z);
            view.setCenter(pos);
        }

    }
    else {
        var pos = [x, y];
        //alert(pos);
        if (is_animate) {
            view.animate({
                zoom: z,
                center: pos,
                duration: 1000
            });
        }
        else {
            view.setZoom(z);
            view.setCenter(pos);
        }
    }
}

//地图刷新
function map_Fresh() {
    var center = view.getCenter();
    var z = view.getZoom();
    view.setZoom(z + 1);
    view.setCenter(center);
}

function map_Center_WKT(wkt,is_animate,zoom,itime) {
    var format = new ol.format.WKT();
    var geom = format.readGeometry(wkt);
    var rect=geom.getExtent();
    //自动判定是经纬度还是墨卡托
    var z = zoom;
    var m_XYType = 1; //=0代表墨卡托投影
    var x = (rect[0] + rect[2]) / 2;
    var y = (rect[1] + rect[3]) / 2;
    if (m_XYType == 0) {
        //113.6684080007,34.7676365757
        var pos = ol.proj.fromLonLat([x, y]);
        if (is_animate) {
            view.animate({
                zoom: z,
                center: pos,
                duration: itime
            });
        }
        else {
            view.setZoom(z);
            view.setCenter(pos);
        }
    }
    else {
        var pos = [x, y];
        if (is_animate) {
            view.animate({
                zoom: z,
                center: pos,
                duration: 1000
            });
        }
        else {
            view.setZoom(z);
            view.setCenter(pos);
        }
    }
}

function map_Center(x, y, is_animate) {
    //自动判定是经纬度还是墨卡托
    var z = view.getZoom();
    var m_XYType = 1; //=0代表墨卡托投影
    if (x >= 0 && x <= 360 & y >= 0 && y <= 90) {
        m_XYType = 0;
    }

    if (m_XYType == 0) {
        //113.6684080007,34.7676365757
        var pos = ol.proj.fromLonLat([x, y]);
        if (is_animate) {
            view.animate({
                zoom: z,
                center: pos,
                duration: 1000
            });
        }
        else {
            view.setZoom(z);
            view.setCenter(pos);
        }
    }
    else {
        var pos = [x, y];
        if (is_animate) {
            view.animate({
                zoom: z,
                center: pos,
                duration: 1000
            });
        }
        else {
            view.setZoom(z);
            view.setCenter(pos);
        }
    }
}

///矢量数据的处理
//添加一个面对象
function map_AddPolygon(gid, name, wkt) {
    var format = new ol.format.WKT();
    var feature = format.readFeature(wkt);
    feature.setId(gid);
    feature.set("gid", gid, true);
    feature.set("name", name, true);
    vector_mian.getSource().addFeature(feature);
}

//添加一个矢量对象
function map_AddVector(objlyr, gid, name, wkt) {
    var format = new ol.format.WKT();
    var feature = format.readFeature(wkt);
    feature.setId(gid);
    feature.set("gid", gid, true);
    feature.set("name", name, true);
    feature.set("class", "0", true);
    objlyr.getSource().addFeature(feature);
}

//添加一个矢量对象
function map_AddVectorByClass(objlyr, gid, name, wkt,sclass) {
    var format = new ol.format.WKT();
    var feature = format.readFeature(wkt);
    feature.setId(gid);
    feature.set("gid", gid, true);
    feature.set("name", name, true);
    feature.set("class", sclass, true);
    objlyr.getSource().addFeature(feature);
}

//添加一个矢量对象
function map_AddVector_AndLabel(objlyr, gid, name, wkt) {
    var format = new ol.format.WKT();
    var feature = format.readFeature(wkt);
    feature.setId(gid);
    feature.set("gid", gid, true);
    feature.set("name", name, true);
    feature.set("class", "0", true);
    feature.setStyle(createLabelStyle(feature));
    objlyr.getSource().addFeature(feature);
}

//矢量标注样式设置函数，设置image为图标ol.style.Icon
function createLabelStyle(feature) {
    return new ol.style.Style({
         fill: new ol.style.Fill({
                color: 'rgba(0,0,255,0.2)'
            }),
            stroke: new ol.style.Stroke({
                color: 'rgba(0,255,0,1)',
                width: 2
            }),
            image: new ol.style.Circle({
                radius: 6,
                fill: new ol.style.Fill({
                    color: 'rgba(255,0,0,1)'
                })
            }),
        text: new ol.style.Text({
            textAlign: "center",            //位置
            textBaseline: "middle",         //基准线
            font: "normal 16px 微软雅黑",    //文字样式
            text: feature.get("name"),      //文本内容
            fill: new ol.style.Fill({       //文本填充样式（即文字颜色)
                color: "rgb(255,255,255)"
            }),
            stroke: new ol.style.Stroke({
                color: "rgb(158,158,158)",
                width: 0
            })
        })
    });
}

function map_AddVectorByClass(objlyr, gid, name, wkt, m_class) {
    var format = new ol.format.WKT();
    var feature = format.readFeature(wkt);
    feature.setId(gid);
    feature.set("gid", gid, true);
    feature.set("name", name, true);
    feature.set("class", m_class, true);
    objlyr.getSource().addFeature(feature);
}

function map_AddVectorByClass_AndSet(objlyr, gid, name, wkt, m_class,wid,iColor) {
    var format = new ol.format.WKT();
    var feature = format.readFeature(wkt);
    feature.setStyle(
        new ol.style.Style({
            stroke: new ol.style.Stroke({
                color: iColor,//#FF0000
                width: wid
            })        
        })
        
    );
    feature.setId(gid);
    feature.set("gid", gid, true);
    feature.set("name", name, true);
    feature.set("class", m_class, true);
    feature.set("wkt", wkt, true);
    objlyr.getSource().addFeature(feature);
}


///点对象的处理
//gid,name,wkt_geom 编号，名称，坐标
function map_AddMarkerByXY(gid, name, x, y, icon_url, m_class) {
    //gid, name, wkt_geom
    // 创建一个Feature，并设置好在地图上的位置113.6684080007,34.7676365757
    //new ol.geom.Point([12670926.799,4023424.989])
    //var format = new ol.format.WKT();
    //var geom = format.readGeometry(wkt_geom);
    var geom = new ol.geom.Point([x, y]);
    var anchor = new ol.Feature({
        geometry: geom
    });
    // 设置样式，在样式中就可以设置图标
    anchor.setStyle(new ol.style.Style({
        image: new ol.style.Icon({
            src: icon_url
        })
    }));
    // 添加到之前的创建的layer中去
    anchor.setId(gid);
    anchor.set("gid", gid, true);
    anchor.set("name", name, true);
    anchor.set("class", m_class, true); //增加一个类别
    var ft = markerLayer.getSource().addFeature(anchor);
}

///点对象的处理
//gid,name,wkt_geom 编号，名称，坐标，类型
function map_AddMarkerByWKT_SIZE(gid, name, wkt_geom, icon_url, m_class, sizeXY) {
    //gid, name, wkt_geom
    // 创建一个Feature，并设置好在地图上的位置113.6684080007,34.7676365757
    //new ol.geom.Point([12670926.799,4023424.989])
    var format = new ol.format.WKT();
    var geom = format.readGeometry(wkt_geom);
    var anchor = new ol.Feature({
        geometry: geom
    });
    // 设置样式，在样式中就可以设置图标
    anchor.setStyle(new ol.style.Style({
        image: new ol.style.Icon({
            src: icon_url,
            size: [sizeXY, sizeXY]
        })
    }));
    // 添加到之前的创建的layer中去
    anchor.setId(gid);
    anchor.set("gid", gid, true);
    anchor.set("name", name, true);
    anchor.set("class", m_class, true); //增加一个类别
    var ft = markerLayer.getSource().addFeature(anchor);
}

function map_AddMarkerByWKT_SIZE_OBJ(gid, name, wkt_geom, icon_url, m_class, sizeXY) {
    //gid, name, wkt_geom
    // 创建一个Feature，并设置好在地图上的位置113.6684080007,34.7676365757
    //new ol.geom.Point([12670926.799,4023424.989])
    var format = new ol.format.WKT();
    var geom = format.readGeometry(wkt_geom);
    var anchor = new ol.Feature({
        geometry: geom
    });
    // 设置样式，在样式中就可以设置图标
    anchor.setStyle(new ol.style.Style({
        image: new ol.style.Icon({
            src: icon_url,
            size: [sizeXY, sizeXY]
        })
    }));
    // 添加到之前的创建的layer中去
    anchor.setId(gid);
    anchor.set("gid", gid, true);
    anchor.set("name", name, true);
    anchor.set("class", m_class, true); //增加一个类别
    var ft = markerLayer_Data.getSource().addFeature(anchor);
}

function map_AddMarkerByWKT_OBJLYR(gid, name, wkt_geom, icon_url, m_class,objLyr) {
    //gid, name, wkt_geom
    // 创建一个Feature，并设置好在地图上的位置113.6684080007,34.7676365757
    //new ol.geom.Point([12670926.799,4023424.989])
    var format = new ol.format.WKT();
    var geom = format.readGeometry(wkt_geom);
    var anchor = new ol.Feature({
        geometry: geom
    });
    // 设置样式，在样式中就可以设置图标
    anchor.setStyle(new ol.style.Style({
        image: new ol.style.Icon({
            src: icon_url
            //size: [32, 32]
        })
    }));
    // 添加到之前的创建的layer中去
    anchor.setId(gid);
    anchor.set("gid", gid, true);
    anchor.set("name", name, true);
    anchor.set("class", m_class, true); //增加一个类别
    var ft = objLyr.getSource().addFeature(anchor);
}

function map_AddMarkerByWKT_OBJLYR_XY(gid, name, wkt_geom, icon_url, m_class, objLyr) {
    //gid, name, wkt_geom
    // 创建一个Feature，并设置好在地图上的位置113.6684080007,34.7676365757
    //new ol.geom.Point([12670926.799,4023424.989])
    var format = new ol.format.WKT();
    var geom = format.readGeometry(wkt_geom);
    var anchor = new ol.Feature({
        geometry: geom
    });
    // 设置样式，在样式中就可以设置图标
    anchor.setStyle(new ol.style.Style({
        image: new ol.style.Icon({
            src: icon_url
            //size: [32, 32]
        })
    }));
    // 添加到之前的创建的layer中去
    anchor.setId(gid);
    anchor.set("gid", gid, true);
    anchor.set("name", name, true);
    anchor.set("class", m_class, true); //增加一个类别
    anchor.set("wkt", wkt_geom, true); //增加一个类别
    var ft = objLyr.getSource().addFeature(anchor);
}

function map_AddMarkerByWKT(gid, name, wkt_geom, icon_url, m_class) {
    //gid, name, wkt_geom
    // 创建一个Feature，并设置好在地图上的位置113.6684080007,34.7676365757
    //new ol.geom.Point([12670926.799,4023424.989])
    var format = new ol.format.WKT();
    var geom = format.readGeometry(wkt_geom);
    var anchor = new ol.Feature({
        geometry: geom
    });
    // 设置样式，在样式中就可以设置图标
    anchor.setStyle(new ol.style.Style({
        image: new ol.style.Icon({
            src: icon_url
            //size: [32, 32]
        })
    }));
    // 添加到之前的创建的layer中去
    anchor.setId(gid);
    anchor.set("gid", gid, true);
    anchor.set("name", name, true);
    anchor.set("class", m_class, true); //增加一个类别
    var ft = markerLayer.getSource().addFeature(anchor);
}

function map_UnSelect(curVectorLayer) {
    var selectedFeatures = select.getFeatures();
    selectedFeatures.clear();
}

function f_dlg() {
    alert("test");
}


//Start设置图层++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//设置图层透明度
function f_SetOpacity(objLyr, val) {
    //objLyr, val 图层的名称和透明度(0-1)
    objLyr.setOpacity(val);
}

function f_SetLyrVisible(objLyr, val) {
    //objLyr, val 图层的名称和透明度(0-1)
    try {
        objLyr.setVisible(val);
    }
    catch (e) { }
}

//End设置图层++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

function f_PopupDlg(coordinate) {
    popup.setPosition(coordinate);
    var element = popup.getElement();
    var hdms = ol.coordinate.toStringHDMS(ol.proj.transform(
            coordinate, 'EPSG:3857', 'EPSG:4326'));
    $(element).popover('destroy');

    $(element).popover({
        'placement': 'top',
        'animation': false,
        'html': true,
        'content': "<a href='#'>查询信息:</a></p><code>" + hdms + '</code>'
    });
    $(element).popover('show');
    //view.setCenter(coordinate);
}

function f_PopupDlgHtml(xy_arr, html) {
    popup.setPosition(xy_arr);
    var element = popup.getElement();
    var hdms = ol.coordinate.toStringHDMS(ol.proj.transform(
            xy_arr, 'EPSG:3857', 'EPSG:4326'));
    try {
        $(element).popover('destroy');
    }
    catch (e) { }

    $(element).popover({
        'placement': 'top',
        'animation': false,
        'html': true,
        'content': html
    });
    $(element).popover('show');
}

function map_ClearPopup() {
    try {
        var element = popup.getElement();
        $(element).popover('destroy');
    }
    catch (e) { 
    
    }
    
}


/////////////////地图轨迹////////////////////////////////////////////////////////
//结构体数据
function STR_GPS() {
    this.gid = 0; //
    this.name = ""; //名称
    this.x = 0; //经度
    this.y = 0; //纬度
    this.time = ""; //时间
}

//显示轨迹
function map_History(arr_str_gps) {
    //arr_str_gps,STR_GPS结构体数据
    //绘制一条线
    //"MULTILINESTRING((12653069.9643397 4148374.46766785,12653059.965623 4148405.66740658,12653026.6031716 4148508.75724037,12653015.4823545 4148542.66881928))"
    var xy = "";
    for (i = 0; i < arr_str_gps.length; i++) {
        var miXY = map_Wgs2Mkt(arr_str_gps[i].x, arr_str_gps[i].y);
        if (i == 0) {
            xy = miXY[0] + " " + miXY[1];
            map_AddMarkerByXY(arr_str_gps[i].gid, arr_str_gps[i].name, miXY[0], miXY[1], "image/qs.png");
        }
        else {
            xy = xy + "," + miXY[0] + " " + miXY[1];
            if (i == arr_str_gps.length - 1) {
                map_AddMarkerByXY(arr_str_gps[i].gid, arr_str_gps[i].name, miXY[0], miXY[1], "image/jz.png");
            }
            else {
                map_AddMarkerByXY(arr_str_gps[i].gid, arr_str_gps[i].name, miXY[0], miXY[1], "image/ren.png");
            }
        }

    }
    var wkt = "MULTILINESTRING((" + xy + "))";
    map_ZoomToWKT(wkt);
    map_AddVector(vector_Lin, -1, "test", wkt);
    //播放动画
}

///////////////////////手动添加禁入或者例外区域//////////////////////////////////////
var cur_reg_type = 0;
function f_AddLwReg(itype) {
    cur_reg_type = itype; //itype=0为例外，itype=1为禁入区
    map_SetTool(5);
}

//通过gid删除一个对象
function f_RemoveFeatureBygid(objlyr, gid) {
    var fts = objlyr.getSource().getFeatures(); 
    for (var i = 0; i < fts.length; i++) {
        var ft = fts[i];
        if (ft.get("gid") == gid) {
            objlyr.getSource().removeFeature(ft);
            break;
        }
    }
}

function f_MoveToFeatureBygid(objlyr, gid) {
    var fts = objlyr.getSource().getFeatures(); 
    for (var i = 0; i < fts.length; i++) {
        var ft = fts[i];
        if (ft.get("gid") == gid) {
            //objlyr.getSource().removeFeature(ft);
            var r_wkt = map_GetFeatureWKT(ft);
            map_ZoomToWKT_NOANIMATE(r_wkt);
            break;
        }
    }
}


//获取地图中心坐标
function map_GetMapCenter() {
    var center = view.getCenter();
    return center;
}

// 地图拖动事件
map.on("moveend", function (evt) {
    //alert("拖动结束");
});

//判定点是否在区域里面
//feature 代表实体,coordinate 代表坐标
function map_PosInReg(feature, coordinate) {
    var geo = feature.getGeometry(); //feture是几何元素
    var isIn = geo.intersectsCoordinate(coordinate);
    return isIn;
}

//f_GetDaoHang(wgsx, wgsy, x, y); //114.3412672405, 34.7932070658,全部使用经纬度坐标
function f_GetDaoHang(x0, y0, x1, y1) {
    var url = "http://api.tianditu.gov.cn/drive?postStr={'orig':'" + x0
     + "," + y0 + "','dest':'" + x1 + "," + y1 + "','style':'0'}&type=search&tk=221b586ea9d6fe72785d8b56c61aa396";
    $.post(url, {}, function (data) {
        f_AddDaoHang(data);
    });
}


function f_AddDaoHang(data) {
    //mui.toast(data);
    //"MULTILINESTRING((12657177.8992365 4133897.48101337,12657192.9747514 4133897.48101337,12657192.9747514 4133905.8176981))"
    $(data).find("routelatlon").each(function (i) {
        var id = $(this);   //获取id节点
        var xy = id[0].innerHTML.split(";");
        var geom = "";
        for (var i = 0; i < xy.length; i++) {
            var onexy = xy[i].split(",");
            var mktxy = _getMercator(onexy);
            if (mktxy.x == 0 || mktxy.y == 0) continue;
            if (i == 0) {
                geom = mktxy.x + " " + mktxy.y;
            }
            else {
                geom = geom + "," + mktxy.x + " " + mktxy.y;
            }
        }
        var wkt = "MULTILINESTRING((" + geom + "))";
        map_AddVector(vector_Lin_Navi, 0, "test", wkt);
        map_ZoomToWKT(wkt);
        return;
    });

}

function f_AddFeatureByOBJLyr(gid, name, wkt_geom,m_class, vectorlyr, FontCor, FontBorderCor, borderwid, FontSize, m_align, fontXoffsize, fontYoffsize) {
    var format = new ol.format.WKT();
    var geom = format.readGeometry(wkt_geom);
    var anchor = new ol.Feature({
        geometry: geom
    });
    // 设置样式，在样式中就可以设置图标
    anchor.setStyle(
    new ol.style.Style({
        text: new ol.style.Text({
            font: "normal " + FontSize + "px serif",
            text: name,
            textAlign: m_align,
            fill: new ol.style.Fill({
                color: FontCor
            }),
            stroke: new ol.style.Stroke({
                color: FontBorderCor,
                width: borderwid
            }),
            offsetY: fontYoffsize,
            offsetX: fontXoffsize
        })
    })

    );
    // 添加到之前的创建的layer中去
    anchor.setId(gid);
    anchor.set("gid", gid, true);
    anchor.set("name", name, true);
    anchor.set("class", m_class, true); //增加一个类别
    anchor.set("wkt", wkt_geom, true); //增加一个类别
    var ft = vectorlyr.getSource().addFeature(anchor);
}

function f_AddFeatureByOBJLyrIMG(gid, name, wkt_geom, icon_url, m_class, vectorlyr, FontCor, FontBorderCor,borderwid, FontSize, m_align, fontXoffsize, fontYoffsize) {
    var format = new ol.format.WKT();
    var geom = format.readGeometry(wkt_geom);
    var anchor = new ol.Feature({
        geometry: geom
    });
    // 设置样式，在样式中就可以设置图标
    anchor.setStyle(
    new ol.style.Style({
                image: new ol.style.Icon({
                    src: icon_url
                }),
        text: new ol.style.Text({
            font: "normal "+FontSize+"px serif",
            text: name,
            textAlign: m_align,
            fill: new ol.style.Fill({
                color: FontCor
            }),
            stroke: new ol.style.Stroke({
                color: FontBorderCor,
                width: borderwid
            }),
            offsetY: fontYoffsize,
            offsetX: fontXoffsize
            })        
        })
    );
    // 添加到之前的创建的layer中去
    anchor.setId(gid);
    anchor.set("gid", gid, true);
    anchor.set("name", name, true);
    anchor.set("class", m_class, true); //增加一个类别
    anchor.set("wkt", wkt_geom, true); //增加一个类别
    var ft = vectorlyr.getSource().addFeature(anchor);
}

var offsetx=10;
var aniColor="RGBA(255,255,0,1.0)";
function getAnimationStrokeStyle() {
  return new ol.style.Style({
        stroke: new ol.style.Stroke({
                color: aniColor,//#FF0000
                width: 4,
                lineDash: [2,6],
                lineDashOffset:offsetx*4
            })        
        });
}

function f_SetAnimals()
{
//    var zoom = map.getView().getZoom();
//    if(zoom<8)return;
    var fts = vector_Lin_GHG.getSource().getFeatures(); 
    for (var i = 0; i < fts.length; i++) {
        var ft = fts[i];
        ft.setStyle(getAnimationStrokeStyle());
    }

    if(offsetx>0){
        offsetx--;
    }
    else
    {
        offsetx=10;
    }
}