//先检查屏幕的大小，判定是手机还是电脑
function f_IsPCorMobile() {
    var hei = $(window).height();
    var wid = $(document).width();
    var temp = hei;
    if (wid > hei) {
        hei = wid;
        wid = temp;
    }
    if (wid <= 600 && hei <= 800) {
        return true;
    }
    else {
        return false;
    }
}
var iZoomMin = 7;
var yesShouji = f_IsPCorMobile();
if (yesShouji) {
    iZoomMin = 6;
}
var extent = [12284604, 3660520, 12984877, 4325960];
var strpcxq = "http://gis.shuzihenan.com/mktxyz.aspx?T=HENANMKTGIS&z={z}&x={x}&y={y}";
var map_zhq = new ol.layer.Tile({
    source: new ol.source.XYZ({
        url: strpcxq
    }),
    projection: 'EPSG:3857'
});

var view = new ol.View({
    center: [12670926.799, 4023424.989],
    zoom: iZoomMin,
    extent: extent,
    minZoom: iZoomMin,
    maxZoom: 10
});

var map = new ol.Map({
    target: "map",
    layers: [map_zhq],
    loadTilesWhileAnimating: true,
    interactions: ol.interaction.defaults({
        pinchRotate: false
    }),
    view: view
});

var graticule = new ol.Graticule({
    strokeStyle: new ol.style.Stroke({
        color: 'rgba(7,76,191,0.8)',
        width: 1.4,
        lineDash: [0.5, 4]
    }),
    showLabels: true
});

graticule.setMap(map);

var scaleLineControl = new ol.control.ScaleLine({
    units: 'metric',
    target: 'scalebar',
    className: 'ol-scale-line'
});
map.addControl(scaleLineControl);
$(".ol-attribution").remove();
var vector_Lin;

var vector_Lin_j7; var vector_Lin_j8; var vector_Lin_jh; var vector_Lin_h7; var vector_Lin_h8;
var vector_mian;
var vector_CutMian;
var vector_HZ;
var vector_lw;

var vector_poi;
var poisource;
var mianSource;
var cutSource;

var select;
var cur_Tool = 0;
var popup = null;

var draw_vector;
var draw_Line;
var draw_poi;
var modify_poi;

var markerLayer = null;
var markerLayer_Data = null;
var markerLayer_map = null;
var markerLayer_GS = null;

var pos = ol.proj.fromLonLat([113.6684080007, 34.7676365]);

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

var sketch;
var helpTooltipElement;
var helpTooltip;
var measureTooltipElement;
var measureTooltip;
var continuePolygonMsg = '面积测算';
var continueLineMsg = '距离测算';

var pointerMoveHandler = function (evt) {
    if (evt.dragging) {
        return;
    }
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

var draw;
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
                sketch = evt.feature;
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
                sketch = null;
                measureTooltipElement = null;
                createMeasureTooltip();
                ol.Observable.unByKey(listener);
            }, this);
}

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
    createMeasureTooltip();
    createHelpTooltip();
}

f_Init();
function f_Init() {
    vector_lw = new ol.layer.Vector({
        source: new ol.source.Vector({ wrapX: false })
    });

    var objVector_Line = new ol.source.Vector({ wrapX: false });
    vector_Lin = new ol.layer.Vector({
        renderMode: 'image',
        source: objVector_Line,
        style: new ol.style.Style({
            stroke: new ol.style.Stroke({
                color: '#FF0000',
                width: 3
            })
        })
    });

    vector_Lin_j7 = new ol.layer.Vector({
        renderMode: 'image',
        source: new ol.source.Vector({ wrapX: false }),
        style: new ol.style.Style({
            stroke: new ol.style.Stroke({
                color: '#FFFF66',
                width: 3
            })
        })
    });

    vector_Lin_j8 = new ol.layer.Vector({
        renderMode: 'image',
        source: new ol.source.Vector({ wrapX: false }),
        style: new ol.style.Style({
            stroke: new ol.style.Stroke({
                color: '#FF9933',
                width: 3
            })
        })
    });

    vector_Lin_jh = new ol.layer.Vector({
        renderMode: 'image',
        source: new ol.source.Vector({ wrapX: false }),
        style: new ol.style.Style({
            stroke: new ol.style.Stroke({
                color: '#CC6600',
                width: 3
            })
        })
    });

    vector_Lin_h7 = new ol.layer.Vector({
        renderMode: 'image',
        source: new ol.source.Vector({ wrapX: false }),
        style: new ol.style.Style({
            stroke: new ol.style.Stroke({
                color: '#FF9900',
                width: 3
            })
        })
    });

    vector_Lin_h8 = new ol.layer.Vector({
        renderMode: 'image',
        source: new ol.source.Vector({ wrapX: false }),
        style: new ol.style.Style({
            stroke: new ol.style.Stroke({
                color: '#FF6699',
                width: 3
            })
        })
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
                color: 'rgba(255,0,0,0.3)'
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

    markerLayer_GS = new ol.layer.Vector({
        source: new ol.source.Vector()
        ,maxResolution: 1700
    });
    map.addLayer(markerLayer_GS);

    map.addLayer(vector_Lin);
    map.addLayer(vector_Lin_j7); map.addLayer(vector_Lin_j8); map.addLayer(vector_Lin_jh); map.addLayer(vector_Lin_h7); map.addLayer(vector_Lin_h8);

    map.addLayer(vector_mian);
    map.addLayer(vector_CutMian);
    map.addLayer(vector_lw);

    map.addLayer(vector_poi);
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
    map.addInteraction(select);
    map_SetTool(2);
    var sourceMain = new ol.source.Vector({ wrapX: false });
    vector_HZ = new ol.layer.Vector({
        source: sourceMain,
        type: "Polygon",
        style: new ol.style.Style({
            fill: new ol.style.Fill({
                color: 'rgba(255, 214, 172, 0.5)'
            }),
            stroke: new ol.style.Stroke({
                color: 'rgba(255, 0, 0, 1.0)',
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
    map.addLayer(vector_HZ);
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

    draw_Line.on('drawstart', function (evt) {
        map_OjbClear(vector_HZ);
    }, this);

    draw_Line.on('drawend', function (evt) {
        var geom = evt.feature;
        var wkt = map_GetFeatureWKT(geom);
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
                map.getTargetElement().style.cursor = "auto";
            } else {
                var objFt = map.getTargetElement();
                var myid = feature.get("gid");
                var iclass = feature.get("class");
                if (iclass != "2") return;
                var strname = feature.get("name");
                objFt.style.cursor = "pointer";
                if (strname == null) return;
                objFt.title = strname;
            }
        }
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

    map.addLayer(markerLayer);
    markerLayer_Data = new ol.layer.Vector({
        source: new ol.source.Vector()
        ,maxResolution: 500
    });
    markerLayer_map = new ol.layer.Vector({
        source: new ol.source.Vector()
        ,maxResolution: 500
    });

    map.addLayer(markerLayer_map);
    map.addOverlay(markerLayer_Data);

    popup = new ol.Overlay({
        element: document.getElementById("popup")
    });
    map.addOverlay(popup);
}

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
                if (ic == "2") {
                    f_PopupDlgHtml([lonlat[0], lonlat[1]], "<span>" + names + "</span><br>");
                }
            }
            catch (e) {

            }
        }
    }

    if (cur_Tool == 6) { //代表获取地图坐标
        var lonlat = e.coordinate;
        var wktxy = map_GetWKTPoint(lonlat[0], lonlat[1]);
        map_Clear();
        map_AddMarkerByWKT("001", "name", wktxy, "../images/pnt.png");
        parent.f_GetXY(wktxy);
    }

}

function map_GetWKTPoint(x, y) {
    var xy = "POINT(" + x + " " + y + ")";
    return xy;
}

function map_GetFeatrueCenterXY(feature) {
    var extend = feature.getGeometry().getExtent();
    var centerxy = [(extend[0] + extend[2]) / 2, (extend[1] + extend[3]) / 2];
    return centerxy;
}

function map_GetFeatureWKT(feature) {
    var geom = feature;
    var format = new ol.format.WKT();
    var wkt = format.writeFeature(geom);
    return wkt;
}

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
        addInteraction(0);
        return;
    }

    //4表示测面积
    if (iTool == 4) {
        addInteraction(1);
        return;
    }

    if (iTool == 5) {
        map.addInteraction(draw_vector);
        draw_vector.setActive(true);
        return;
    }

    if (iTool == 6) {

        return;
    }

    if (iTool == 7) {
        map.addInteraction(draw_poi);
        draw_poi.setActive(true);
        return;
    }

    if (iTool == 8) {
        map.addInteraction(select);
        map.addInteraction(modify_poi);
        modify_poi.setActive(true);
        return;
    }

    if (iTool == 9) {
        map.addInteraction(draw_Line);
        draw_Line.setActive(true);
        return;
    }

}

function map_Clear() {
    try {
        vector_Lin.getSource().clear();
        vector_mian.getSource().clear();
        vector_lw.getSource().clear();
        vector_poi.getSource().clear();
        vector_HZ.getSource().clear();
        select.getFeatures().clear();
        map_ClearPopup();
        f_ClearCLTooltip();
        f_ClearHZVector();
    }
    catch (e) {
        //alert(e);
    }
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

function map_ZoomIn() {
    var zoom = view.getZoom();
    view.animate({
        zoom: zoom + 2
    });
}

function map_ZoomOut() {
    var zoom = view.getZoom();
    view.animate({
        zoom: zoom - 2
    });
}

//经纬度转米坐标
function map_Wgs2Mkt(x, y) {
    return ol.proj.fromLonLat([x, y]);
}

function _getMercator(poi) {
    var mercator = {};
    var earthRad = 6378137.0;
    mercator.x = poi[0] * Math.PI / 180 * earthRad;
    var a = poi[1] * Math.PI / 180;
    mercator.y = earthRad / 2 * Math.log((1.0 + Math.sin(a)) / (1.0 - Math.sin(a)));
    return mercator;
}

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

function map_ZoomToWKT_ZOOM(wkt, zoom) {
    var format = new ol.format.WKT();
    var geom = format.readGeometry(wkt);
    view.fit(geom.getExtent());
    view.animate({
        zoom: zoom
    });
}

function map_Center_WKT(wkt, is_animate, zoom, itime) {
    var format = new ol.format.WKT();
    var geom = format.readGeometry(wkt);
    var rect = geom.getExtent();
    var z = zoom;
    var m_XYType = 1;
    var x = (rect[0] + rect[2]) / 2;
    var y = (rect[1] + rect[3]) / 2;
    if (m_XYType == 0) {
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

function map_CenterZ(x, y, z, is_animate) {
    var m_XYType = 1;
    if (x >= 0 && x <= 360 & y >= 0 && y <= 90) {
        m_XYType = 0;
    }

    if (m_XYType == 0) {
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

//地图刷新
function map_Fresh() {
    var center = view.getCenter();
    var z = view.getZoom();
    view.setZoom(z + 1);
    view.setCenter(center);
}

function map_Center(x, y, is_animate) {
    var z = view.getZoom();
    var m_XYType = 1;
    if (x >= 0 && x <= 360 & y >= 0 && y <= 90) {
        m_XYType = 0;
    }

    if (m_XYType == 0) {
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
    objlyr.getSource().addFeature(feature);
}

//添加一个矢量对象
function map_AddVector_AndLabel(objlyr, gid, name, wkt) {
    var format = new ol.format.WKT();
    var feature = format.readFeature(wkt);
    feature.setId(gid);
    feature.set("gid", gid, true);
    feature.set("name", name, true);
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

//地图导出图片
function map_output() {
    map.once('postcompose', function (event) {
        var canvas = event.context.canvas;
        if (navigator.msSaveBlob) {
            navigator.msSaveBlob(canvas.msToBlob(), 'map.png');
        } else {
            canvas.toBlob(function (blob) {
                saveAs(blob, 'map.png');
            });
        }
    });
    map.renderSync();
}

function map_AddMarkerByXY(gid, name, x, y, icon_url, m_class) {
    var geom = new ol.geom.Point([x, y]);
    var anchor = new ol.Feature({
        geometry: geom
    });

    anchor.setStyle(new ol.style.Style({
        image: new ol.style.Icon({
            src: icon_url
        })
    }));

    anchor.setId(gid);
    anchor.set("gid", gid, true);
    anchor.set("name", name, true);
    anchor.set("class", m_class, true);
    var ft = markerLayer.getSource().addFeature(anchor);
}

function map_AddMarkerByWKT_SIZE(gid, name, wkt_geom, icon_url, m_class, sizeXY) {
    var format = new ol.format.WKT();
    var geom = format.readGeometry(wkt_geom);
    var anchor = new ol.Feature({
        geometry: geom
    });

    anchor.setStyle(new ol.style.Style({
        image: new ol.style.Icon({
            src: icon_url,
            size: [sizeXY, sizeXY]
        })
    }));
    anchor.setId(gid);
    anchor.set("gid", gid, true);
    anchor.set("name", name, true);
    anchor.set("class", m_class, true); //增加一个类别
    var ft = markerLayer.getSource().addFeature(anchor);
}

function map_AddMarkerByWKT_SIZE_OBJ(gid, name, wkt_geom, icon_url, m_class, sizeXY) {
    var format = new ol.format.WKT();
    var geom = format.readGeometry(wkt_geom);
    var anchor = new ol.Feature({
        geometry: geom
    });
    anchor.setStyle(new ol.style.Style({
        image: new ol.style.Icon({
            src: icon_url,
            size: [sizeXY, sizeXY]
        })
    }));
    anchor.setId(gid);
    anchor.set("gid", gid, true);
    anchor.set("name", name, true);
    anchor.set("class", m_class, true); //增加一个类别
    var ft = markerLayer_Data.getSource().addFeature(anchor);
}

function map_AddMarkerByWKT_OBJLYR(gid, name, wkt_geom, icon_url, m_class, objLyr) {
    var format = new ol.format.WKT();
    var geom = format.readGeometry(wkt_geom);
    var anchor = new ol.Feature({
        geometry: geom
    });

    anchor.setStyle(new ol.style.Style({
        image: new ol.style.Icon({
            src: icon_url
        })
    }));
    anchor.setId(gid);
    anchor.set("gid", gid, true);
    anchor.set("name", name, true);
    anchor.set("class", m_class, true); //增加一个类别
    var ft = objLyr.getSource().addFeature(anchor);
}

function map_AddMarkerByWKT(gid, name, wkt_geom, icon_url, m_class) {
    var format = new ol.format.WKT();
    var geom = format.readGeometry(wkt_geom);
    var anchor = new ol.Feature({
        geometry: geom
    });
    anchor.setStyle(new ol.style.Style({
        image: new ol.style.Icon({
            src: icon_url
        })
    }));
    anchor.setId(gid);
    anchor.set("gid", gid, true);
    anchor.set("name", name, true);
    anchor.set("class", m_class, true);
    var ft = markerLayer.getSource().addFeature(anchor);
}

function map_UnSelect(curVectorLayer) {
    var selectedFeatures = select.getFeatures();
    selectedFeatures.clear();
}

function f_dlg(strmsg) {
    layer.msg("<span style='color: #FFFFFF'>" + strmsg + "<span>");
}

function f_SetOpacity(objLyr, val) {
    objLyr.setOpacity(val);
}

function f_SetLyrVisible(objLyr, val) {
    try {
        objLyr.setVisible(val);
    }
    catch (e) { }
}

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

function STR_GPS() {
    this.gid = 0;
    this.name = "";
    this.x = 0;
    this.y = 0;
    this.time = "";
}

function map_History(arr_str_gps) {
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
}

var cur_reg_type = 0;
function f_AddLwReg(itype) {
    cur_reg_type = itype;
    map_SetTool(5);
}

function f_RemoveFeatureBygid(objlyr, gid) {
    var fts = objlyr.getSource().getFeatures(); //vector_HZ
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
            var r_wkt = map_GetFeatureWKT(ft);
            map_ZoomToWKT_NOANIMATE(r_wkt);
            break;
        }
    }
}

function f_ClearHZVector() {
    try {
        vector_HZ.getSource().clear();
    }
    catch (e) {

    }
}

function map_GetMapCenter() {
    var center = view.getCenter();
    return center;
}

map.on("moveend", function (evt) {

});

function map_PosInReg(feature, coordinate) {
    var geo = feature.getGeometry();
    var isIn = geo.intersectsCoordinate(coordinate);
    return isIn;
}

function f_GetDaoHang(x0, y0, x1, y1) {
    var url = "http://api.tianditu.gov.cn/drive?postStr={'orig':'" + x0
     + "," + y0 + "','dest':'" + x1 + "," + y1 + "','style':'0'}&type=search&tk=221b586ea9d6fe72785d8b56c61aa396";
    $.post(url, {}, function (data) {
        parent.f_AddDaoHang(data);
    });
}
var curTime = "";
function f_mapCenter() {
    var x = 113.6192979265;
    var y = 34.7483837758;
    var z = 7;
    map_CenterZ(x, y, z, true);
}

function f_MoveCenterWKT(wkt) {
    map_ZoomToWKT(wkt);
}

function f_mapzoomin() {
    map_ZoomIn();
}

function f_mapzoomout() {
    map_ZoomOut();
}

function f_MapFull() {
    var wkt = "POLYGON((12284598.1751455 3682981.62126301,12284598.1751455 4350530.57256579,12984786.3063277 4350530.57256579,12984786.3063277 3682981.62126301,12284598.1751455 3682981.62126301))";
    map_Center_WKT(wkt, true, f_GetZoomMinLev(), 2000);
}

function f_GetZoomMinLev() {
    var ilev = 7;
    var hei = $(window).height();
    var wid = $(document).width();
    //alert(hei);
    if (hei > 1600) {
        ilev = 9;
    }
    else if (hei > 1200 && hei <= 1600) {
        ilev = 8.5;
    }
    else if (hei > 1000 && hei <= 1200) {
        ilev = 8;
    }
    else if (hei >= 800 && hei <= 1000) {
        ilev = 7.6;
    }
    else if (hei >= 700 && hei < 800) {
        ilev = 7.2;
    }
    else {
        ilev = 7;
    }
    if (yesShouji) {
        ilev = iZoomMin;
    }
    return ilev;
}

function f_ClearSelect() {
    map_UnSelect(vector_mian);
}

function f_GetDistance(itype) {
    if (itype == 0) {
        map_SetTool(3);
    }
    else {
        map_SetTool(4);
    }
}

function f_Clear() {
    map_Clear();
}

function f_initData() {    
    f_GetUpTime();
    f_MapFull();
    f_SetTimer();
    f_GetGSNamePos();
    f_FwRenShu();
    setInterval(f_GetCnt, 5000);
}

function f_SetTimer() {
    setInterval(f_GetUpTime, 5000);
}

function f_GetUpTime() {
    var strURL = "gis/getMap.aspx?CMD=UPTIME";
    $.post(strURL, null, f_GetTime);
}

function f_GetCnt() {
    var strURL = "gis/getMap.aspx?CMD=CNTER";
    $.post(strURL, null, function (data) {
        if (data == "") return;
        $("#m_vistcnt").html(parseInt(data).toLocaleString());
    });
    f_FwRenShu();
}

function f_GetTime(data) {
    if (data == "") return;
    var strArr = data.split("$");
    var strTime = strArr[0];
    var strinfo = strArr[1];
    var strMsg = strTime;
    $("#m_fbtime").html(strMsg);
    if (curTime != strTime) {
        curTime = strTime;
        f_GetSFZData();
        f_GetAllRoad();
        $("#m_infor").html(strinfo)
    }
}

function f_GetSFZData() {
    var strURL = "gis/getMap.aspx?CMD=SFZDATA";
    $.post(strURL, null, function (data) {
        if (data == "") return;
        f_AddSFZ2Map(data);
    });
}

function f_AddSFZ2Map(data) {
    var objectdata = eval("(" + data + ")");
    try {
        map_OjbClear(markerLayer_Data);
        map_OjbClear(markerLayer_map);
    }
    catch (e) { }
    if (objectdata!=null && objectdata.length != 0) {
        for (var i = 0; i < objectdata.length; i++) {
            var gid = objectdata[i].gid;
            var name = objectdata[i].name;
            var iStatus = objectdata[i].status;
            var mktxy = objectdata[i].geom1;
            var m_img = "images/sfz/" + f_getSFZImg(iStatus);
            if (iStatus == "0") {
                map_AddMarkerByWKT_OBJLYR(gid, name, mktxy, m_img, "2", markerLayer_Data);
            }
            else {
                map_AddMarkerByWKT_OBJLYR(gid, name + "：" + f_getZLInfo(iStatus), mktxy, m_img, "2", markerLayer_map);
            }
        }
    }
}

function f_getZLInfo(iStatus) {
    var ipng = "";
    if (iStatus == "1") {
        ipng = "禁止所有车辆上站";
    }
    else if (iStatus == "2") {
        ipng = "禁止七座(含七座)以上车辆上站";
    }
    else if (iStatus == "4") {
        ipng = "禁止危险品车辆上站";
    }
    else if (iStatus == "5") {
        ipng = "其他";
    }
    else if (iStatus == "8") {
        ipng = "禁止货车上站";
    }
    else if (iStatus == "9") {
        ipng = "禁止七座(不含七座)以上车辆上站";
    }
    else if (iStatus == "10") {
        ipng = "禁止七座(含七座)以上车辆、货车上站";
    }
    else if (iStatus == "17") {
        ipng = "禁止七座(不含七座)以上车辆、货车上站";
    }
    else {
        ipng = "";
    }
    return ipng;
}

function f_getSFZImg(iStatus) {
    var ipng = "";
    if (iStatus == "1") {
        ipng = "no.png";
    }
    else if (iStatus == "2") {
        ipng = "x7.png";
    }
    else if (iStatus == "4") {
        ipng = "xh.png";
    }
    else if (iStatus == "5") {
        ipng = "no.png";
    }
    else if (iStatus == "8") {
        ipng = "xh.png";
    }
    else if (iStatus == "9") {
        ipng = "x8.png";
    }
    else if (iStatus == "10") {
        ipng = "h7.png";
    }
    else if (iStatus == "17") {
        ipng = "h8.png";
    }
    else {
        ipng = "xy.png";
    }
    return ipng;
}

function f_GetGSNamePos() {
    var strURL = "gis/getMap.aspx?CMD=GSNAME";
    $.post(strURL, null, f_GetGSNamePosXY);
}

function f_GetGSNamePosXY(data) {
    if (data == "") return;
    var objectdata = eval("(" + data + ")");
    if (objectdata.length != 0) {
        map_OjbClear(markerLayer_GS);
        for (var i = 0; i < objectdata.length; i++) {
            var gid = objectdata[i].gid;
            var name = objectdata[i].name.toUpperCase();
            var geom = objectdata[i].geom;
            var png = "images/gsname/" + name + ".png";
            map_AddMarkerByWKT_OBJLYR(gid, name, geom, png, "2", markerLayer_GS);
        }
    }
}

function f_MsgDlg(msg) {
    layer.alert(msg);
}

function f_GetAllRoad() {
    var strURL = "gis/getMap.aspx?CMD=GETGZROAD";
    $.post(strURL, null, function (data) {
        map_OjbClear(vector_Lin); map_OjbClear(vector_Lin_j7); map_OjbClear(vector_Lin_j8); map_OjbClear(vector_Lin_jh); map_OjbClear(vector_Lin_h7); map_OjbClear(vector_Lin_h7);
        if (data == "") {
            return;
        }
        f_Add2Map(data);
    });
}

function f_Add2Map(data) {
    var objectdata = eval("(" + data + ")");
    if (objectdata!=null&&objectdata.length != 0) {
        for (var i = 0; i < objectdata.length; i++) {
            var gid = objectdata[i].gid;
            var gsid = objectdata[i].gsid; if (gsid == null) { gsid = ""; }
            var name = objectdata[i].name;
            var wkt = objectdata[i].geom;
            var lk_type = objectdata[i].lk_type;
            if (lk_type == "1" || lk_type == "5") {
                try {
                    map_AddVectorByClass(vector_Lin, gid, gid, wkt, "3");
                }
                catch (e) {
                    var k = e;
                }
            }
            else if (lk_type == "2") {
                try {
                    map_AddVectorByClass(vector_Lin_j7, gid, gid, wkt, "3");
                }
                catch (e) {
                    var k = e;
                }
            }
            else if (lk_type == "8" || lk_type == "4") {
                try {
                    map_AddVectorByClass(vector_Lin_jh, gid, gid, wkt, "3");
                }
                catch (e) {
                    var k = e;
                }
            }
            else if (lk_type == "9") {
                try {
                    map_AddVectorByClass(vector_Lin_j8, gid, gid, wkt, "3");
                }
                catch (e) {
                    var k = e;
                }
            }
            else if (lk_type == "10") {
                try {
                    map_AddVectorByClass(vector_Lin_h7, gid, gid, wkt, "3");
                }
                catch (e) {
                    var k = e;
                }
            }
            else if (lk_type == "17") {
                try {
                    map_AddVectorByClass(vector_Lin_h8, gid, gid, wkt, "3");
                }
                catch (e) {
                    var k = e;
                }
            }
            else {
                try {
                    map_AddVectorByClass(vector_Lin, gid, gid, wkt, "3");
                }
                catch (e) {
                    var k = e;
                }
            }
        }

    }
}
function f_FwRenShu() {
    var strURL = "gis/getMap.aspx?CMD=GETDAY";
    $.post(strURL, null, function (data) {
        if (data == "") {
            return;
        }
        var objectdata = eval("(" + data + ")");
        var m_data = [];
        var m_value = [];
        var allnum = 0;
        if (objectdata.length != 0) {
            for (var i = 0; i < objectdata.length; i++) {
                var name = objectdata[i].m_h;
                var num = objectdata[i].num;
                m_data[i] = name;
                m_value[i] = num;
                allnum = allnum + num;
            }
        }
        var strtitle = allnum.toLocaleString();
        $("#m_allnum").html(strtitle);
        var line_time = echarts.init(document.getElementById("m_rfw"), 'macarons');
        var option = {
            color: ['#0000FF'],
            legend: {
                data: ['访问人次/时'],
                align: 'left',
                textStyle: {
                    color: '#000'
                }
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                }
            },

            grid: {
                x: 40,
                y: 30,
                x2: 5,
                y2: 20

            },
            calculable: true,

            xAxis: [{
                type: 'category',
                data: m_data,
                axisLabel: {
                    color: "#000"
                }
            }],
            yAxis: [{

                type: "value",
                axisLabel: {
                    color: "#000"
                }
            }],
            series: [{
                name: '访问人次/时',
                type: 'bar',
                barWidth: '80%',
                data: m_value
            }
        ]
        };
        line_time.setOption(option);
    });
}

//地图定位
function f_MapLoc() {
    try {
        var ua = navigator.userAgent.toLowerCase();
        var isWeixin = ua.indexOf('micromessenger') != -1;
        if (isWeixin) {
            layer.alert("不支持微信定位!<br>点击：右上角“...”<BR>选择：在浏览器打开！");
            return;
        }
    }
    catch (e) { }
    if (navigator.geolocation) {
        f_dlg("正在启动定位功能！");
        navigator.geolocation.getCurrentPosition(
            function (position) {
                latitude = position.coords.latitude; //获取纬度
                longitude = position.coords.longitude; //获取经度
                var mkt = map_Wgs2Mkt(longitude, latitude);
                var wkt = map_GetWKTPoint(mkt[0], mkt[1]);
                map_ZoomToWKT_NOANIMATE(wkt);
                try {
                    map_OjbClear(markerLayer); 
                    map_AddMarkerByWKT_OBJLYR(0, "我的位置", wkt, "webgis/imges/online.png", "2", markerLayer);
                }
                catch (e) { }
            });
    }
        else 
    {
        f_dlg("不支持定位功能");
    }
      
}

$('document').ready(function () {
    $("body").css('visibility', 'visible');
    f_initData();
})