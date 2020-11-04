Cesium.Ion.defaultAccessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI1ZTk5NTQ5YS1mNTRkLTQ5MTgtYmUxMS03M2NiOTI1YzkxMTgiLCJpZCI6MjIzMTMsInNjb3BlcyI6WyJhc3IiLCJnYyJdLCJpYXQiOjE1ODE3NjY5MDB9.JVXOmIzjmRRHjNRFeEjj8_KPLHkbfcKzZiMv_vdNijQ";
var m_MaxHeight = 1600000.0;
var worldTerrain = Cesium.createWorldTerrain({
 requestWaterMask : true, 
 requestVertexNormals : true 
 });
var viewer = new Cesium.Viewer("cesiumContainer", {
	animation:false,//左下角控制动画            
	baseLayerPicker:false,//右上角图层选择器            
	fullscreenButton: false,            
	geocoder:false,//右上角搜索            
	homeButton:false,            
	infoBox:false,
	scene3DOnly: true, //仅仅显示3d,可隐藏右上角2d和3d按钮 
	selectionoIndicatr:false,            
	timeline:false,//最下面时间轴            
	navigationHelpButton:false,//右上角帮助按钮 
	navigationInstructionsInitiallyVisibl:false,            
	useDefaultRenderLoop:true,            
	showRenderLoopErrors:true,
	projectionPicker: false
    ,shouldAnimate: true
	//,terrainProvider: worldTerrain
});
// 删除默认的影像图层
viewer.imageryLayers.remove(viewer.imageryLayers.get(0));
// 增加谷歌影像底图
var google_map = viewer.imageryLayers.addImageryProvider(new Cesium.UrlTemplateImageryProvider({ url: "http://www.google.cn/maps/vt?lyrs=s&x={x}&y={y}&z={z}", tilingScheme: new Cesium.WebMercatorTilingScheme() }));
var hn_map = viewer.imageryLayers.addImageryProvider(new Cesium.UrlTemplateImageryProvider({ url: "http://gis.hnrkdt.com/mktxyz.aspx?T=MAPVISTAGIS&z={z}&x={x}&y={y}", tilingScheme: new Cesium.WebMercatorTilingScheme() }));
var china_map=viewer.imageryLayers.addImageryProvider(new Cesium.UrlTemplateImageryProvider({ url:"http://t4.tianditu.com/DataServer?T=cia_w&x={x}&y={y}&l={z}&tk=221b586ea9d6fe72785d8b56c61aa396", tilingScheme: new Cesium.WebMercatorTilingScheme() }));
china_map.show = false;
//google_map.brightness = 0.4;
viewer.camera.setView({
	  // Cesium的坐标是以地心为原点，一向指向南美洲，一向指向亚洲，一向指向北极州
	  // fromDegrees()方法，将经纬度和高程转换为世界坐标
	destination: Cesium.Cartesian3.fromDegrees(113.82, 34.03, m_MaxHeight),
	  orientation:{
	  // 指向
	  //heading:Cesium.Math.toRadians(90,0),
	  // 视角
	  //pitch:Cesium.Math.toRadians(-90),
	  roll:0.0
	  }
});

//viewer.scene.screenSpaceCameraController.minimumZoomDistance = 250000;//相机的高度的最小值
viewer.scene.screenSpaceCameraController.maximumZoomDistance = m_MaxHeight;  //相机高度的最大值
//viewer.scene.screenSpaceCameraController._minimumZoomRate = 30000; // 设置相机缩小时的速率
//viewer.scene.screenSpaceCameraController._maximumZoomRate=5906376272000    //设置相机放大时的速率

f_GetPosition();

function f_GetCamHeight()
{
	var cameraPos = viewer.camera.position;
	// 获取当前坐标系标准
	var ellipsoid = viewer.scene.globe.ellipsoid;
	// 根据坐标系标准，将笛卡尔坐标转换为地理坐标
	var cartographic = ellipsoid.cartesianToCartographic(cameraPos);
	// 获取镜头的高度
	var height = cartographic.height;
	return height;
}

function f_ZoomIn() {
    viewer.camera.zoomIn(f_GetCamHeight() / 1.5);

}


function f_ZoomOut() {
	if (f_GetCamHeight() < m_MaxHeight)
	{
		viewer.camera.zoomOut(f_GetCamHeight() * 1.5);
	}
}

function f_FullMap() {
    MoveTo(113.82, 34.03, m_MaxHeight, 0.0, -90.0);
}

//地图正北
function f_MapN() {
    viewer.camera.setView({
        orientation: {
            heading: Cesium.Math.toRadians(0.0)//, // east, default value is 0.0 (north)
            ,pitch: viewer.camera.pitch    // default value (looking down)
            //roll: 0.0                             // default value
        }
    });
}

function f_Set() {
	/*定义初始缩放，值可以改动，以下括号里的值可以看情况自己设置。*/
	viewer.camera.zoomIn(0);
	/*放大*/
	viewer.camera.zoomIn(1000);
	/*缩小*/
	viewer.camera.zoomOut(1000);
	/*左旋转*/
	viewer.camera.rotateLeft(Cesium.Math.toDegrees(0.005).toFixed(2));
	/*viewer.camera.rotateLeft(0.000001);*/
	/*右旋转*/
	viewer.camera.rotateRight(Cesium.Math.toDegrees(0.005).toFixed(2));
	/*viewer.camera.rotateRight(0.000001);*/
	/*上倾斜，偏左旋转*/
	viewer.camera.twistRight(Cesium.Math.toDegrees(0.005).toFixed(2));
	/*下倾斜，偏右旋转*/
	viewer.camera.twistLeft(Cesium.Math.toDegrees(0.005).toFixed(2)); 
}


var entity = null;
function MoveTo(lon, lat, alt, m_heading, m_pitch) {
	if(entity)
		viewer.entities.remove(entity);
	entity = new Cesium.Entity({
		id : 'flyTmp',
		position : Cesium.Cartesian3.fromDegrees(lon, lat),
		point : {
			pixelSize : 0,
			color : Cesium.Color.RED.withAlpha(0.0),
			outlineColor : Cesium.Color.WHITE.withAlpha(0.0),
			outlineWidth : 0
		}
	});
	viewer.entities.add(entity);
	viewer.flyTo(entity, {
		offset : {
			heading: Cesium.Math.toRadians(m_heading),
			pitch: Cesium.Math.toRadians(m_pitch), //-90
			range : alt
		}
	}).then(function (result) {
		if (result) {
			if (entity)
				viewer.entities.remove(entity);
		}
	}); ;
}

function f_ShowDEM(iSee) { 
	var scene = viewer.scene;
	var terrainProvider;
	if (!iSee) {
		terrainProvider = new Cesium.EllipsoidTerrainProvider({});
	}
	else {
		terrainProvider=worldTerrain;
	}
	scene.terrainProvider = terrainProvider;
}

function f_GetPosition() {
    //得到当前三维场景
    var scene = viewer.scene;
    //得到当前三维场景的椭球体
    var ellipsoid = scene.globe.ellipsoid;
    var entity = viewer.entities.add({
        label: {
            show: false
        }
    });
    var longitudeString = null;
    var latitudeString = null;
    var height = null;
    var cartesian = null;
    // 定义当前场景的画布元素的事件处理
    var handler = new Cesium.ScreenSpaceEventHandler(scene.canvas);
    //设置鼠标移动事件的处理函数，这里负责监听x,y坐标值变化
    handler.setInputAction(function (movement) {
        //通过指定的椭球或者地图对应的坐标系，将鼠标的二维坐标转换为对应椭球体三维坐标
        cartesian = viewer.camera.pickEllipsoid(movement.endPosition, ellipsoid);
        if (cartesian) {
            //将笛卡尔坐标转换为地理坐标
            var cartographic = ellipsoid.cartesianToCartographic(cartesian);
            //将弧度转为度的十进制度表示
            longitudeString = Cesium.Math.toDegrees(cartographic.longitude);
            latitudeString = Cesium.Math.toDegrees(cartographic.latitude);
            //获取相机高度
            height = Math.ceil(viewer.camera.positionCartographic.height);
            //entity.position = cartesian;
            //entity.label.show = true;
            //entity.label.text = '(' + longitudeString + ', ' + latitudeString + "," + height + ')';
            f_SetMapPos(longitudeString, latitudeString, height);
        } else {
            //entity.label.show = false;
        }
    }, Cesium.ScreenSpaceEventType.MOUSE_MOVE);
    //设置鼠标滚动事件的处理函数，这里负责监听高度值变化
    handler.setInputAction(function (wheelment) {
        height = Math.ceil(viewer.camera.positionCartographic.height);
        //entity.position = cartesian;
        //entity.label.show = true;
        //entity.label.text = '(' + longitudeString + ', ' + latitudeString + "," + height + ')';
        f_SetMapPos(longitudeString, latitudeString, height);
    }, Cesium.ScreenSpaceEventType.WHEEL);
}

function f_SetMapPos(x, y, h) {
    try {
        //x = Math.round(x * 1000000) / 1000000;
        //y = Math.round(y * 1000000) / 1000000;
        var iH = "";
        if (h > 1000) {
            h = h / 1000;
            h = Math.round(h * 100) / 100;
            iH = h + "公里";
        }
        else {
            iH = h + "米";
        }
        //parent.$("#map_xy").html("经度：" + x + "&nbsp&nbsp&nbsp&nbsp纬度：" + y + "&nbsp&nbsp&nbsp&nbsp高度：" + iH);
        parent.$("#m_jd").html(x.toFixed(6).toString());
        parent.$("#m_wd").html(y.toFixed(6).toString());
        parent.$("#m_gd").html(iH);
    } catch (e) { }

}

//距离测量接口
var AllEnities = []; //储存所有绘制对象
var tooltip = parent.document.getElementById("toolTip");
var temLine = null;
var handler = viewer.screenSpaceEventHandler;
var isDraw = false;
//测量距离
function f_GetLength() {    
    var polyline = new Cesium.Entity();
    var polylinePath = [];  //点集合    
    var LineEntities = []; //所有折线对象
    var disNums = []; //线路长度之和
    var StartPoint;
    
    //tooltip = parent.document.getElementById("ToolTip");
    /***************************鼠标移动事件***********************************/
    handler.setInputAction(function (movement) {
        var position1;
        var cartographic;
        var ray = viewer.scene.camera.getPickRay(movement.endPosition);
        if (ray)
            position1 = viewer.scene.globe.pick(ray, viewer.scene);
        if (position1)
            cartographic = Cesium.Ellipsoid.WGS84.cartesianToCartographic(position1);
        if (cartographic) {
            //海拔
            var height = viewer.scene.globe.getHeight(cartographic);
            //地理坐标（弧度）转经纬度坐标
            var point = Cesium.Cartesian3.fromDegrees(cartographic.longitude / Math.PI * 180, cartographic.latitude / Math.PI * 180, height);
            if (isDraw) {
                try {
                    tooltip.style.left = movement.endPosition.x + 10 + "px";
                    tooltip.style.top = movement.endPosition.y + 20 + "px";
                    tooltip.style.display = "block";
                } catch (e) { }
                
                if (polylinePath.length < 1) {
                    return;
                }
                if (temLine != null) //清除临时线
                {
                    viewer.entities.remove(temLine);
                }
                if (polylinePath.length == 1 && point.x != null) {
                    temLine = viewer.entities.add({
                        name: "CEJU",
                        polyline: {
                            show: true,
                            positions: [polylinePath[0], point],
                            material: new Cesium.PolylineOutlineMaterialProperty({
                                color: Cesium.Color.RED
                            }),
                            width: 2
                        }
                    });

                    AllEnities.push(temLine);
                    var distance = sum(disNums) + Number(getLineDis(polylinePath[0], point)); //自己实现
                    tooltip.innerHTML = '<p>长度：' + distance.toFixed(2) + '公里</p><p>双击确定终点</p>';

                }
            }
        }

    }, Cesium.ScreenSpaceEventType.MOUSE_MOVE);

    /***************************鼠标移动事件***********************************/


    /***************************鼠标单击事件***********************************/
    //完成画线操作
    handler.setInputAction(function (movement) {
        isDraw = true;
        var position1;
        var cartographic;
        var ray = viewer.scene.camera.getPickRay(movement.position);
        if (ray)
            position1 = viewer.scene.globe.pick(ray, viewer.scene);
        if (position1)
            cartographic = Cesium.Ellipsoid.WGS84.cartesianToCartographic(position1);
        //世界坐标转地理坐标（弧度）
        if (cartographic) {
            //海拔
            var height = viewer.scene.globe.getHeight(cartographic);
            //地理坐标（弧度）转经纬度坐标
            var point = Cesium.Cartesian3.fromDegrees(cartographic.longitude / Math.PI * 180, cartographic.latitude / Math.PI * 180, height);

            polylinePath.push(point); //加点
            if (isDraw && polylinePath.length == 1) {
                StartPoint = point;
                var strartpoint = viewer.entities.add(
                         {
                             name: "CEJU",
                             position: point,
                             point: {
                                 heightReference: Cesium.HeightReference.CLAMP_TO_GROUND,
                                 show: true,
                                 color: Cesium.Color.SKYBLUE,
                                 pixelSize: 3,
                                 outlineColor: Cesium.Color.YELLOW,
                                 outlineWidth: 1
                             },
                             label: {
                                 text: "起点",
                                 font: '13pt 微软雅黑',
                                 color: Cesium.Color.RED,
                                 backgroundColor: Cesium.Color.CORAL,
                                 style: Cesium.LabelStyle.FILL_AND_OUTLINE,
                                 outlineWidth: 2,
                                 //垂直位置
                                 heightReference: Cesium.HeightReference.NONE,
                                 verticalOrigin: Cesium.VerticalOrigin.BOTTOM,
                                 pixelOffset: new Cesium.Cartesian2(0, -5)
                             }
                         }
                     );

                AllEnities.push(strartpoint);

            }

            if (isDraw && polylinePath.length > 1) {
                var text = 0;
                text = sum(disNums) + Number(getLineDis(polylinePath[0], polylinePath[1]));
                disNums.push(getLineDis(polylinePath[0], polylinePath[1]));
                var temppoint = viewer.entities.add(
                              {
                                  name: "CEJU",
                                  position: point,
                                  point: {
                                      heightReference: Cesium.HeightReference.CLAMP_TO_GROUND,
                                      show: true,
                                      color: Cesium.Color.SKYBLUE,
                                      pixelSize: 3,
                                      outlineColor: Cesium.Color.YELLOW,
                                      outlineWidth: 1
                                  },
                                  label: {
                                      text: text.toFixed(2).toString() + '公里',
                                      font: '13pt 微软雅黑',
                                      color: Cesium.Color.RED,
                                      backgroundColor: Cesium.Color.CORAL,
                                      style: Cesium.LabelStyle.FILL_AND_OUTLINE,
                                      outlineWidth: 2,
                                      //垂直位置
                                      heightReference: Cesium.HeightReference.NONE,
                                      verticalOrigin: Cesium.VerticalOrigin.BOTTOM,
                                      pixelOffset: new Cesium.Cartesian2(0, -5)
                                  }
                              }
                          );

                AllEnities.push(temppoint);

                polyline = viewer.entities.add({
                    name: "CEJU",
                    polyline: {                        
                        show: true,
                        positions: polylinePath,
                        material: new Cesium.PolylineOutlineMaterialProperty({
                            color: Cesium.Color.RED
                        }),
                        width: 2
                    }
                });
                AllEnities.push(polyline);
                LineEntities.push(polyline); //加直线
                var lastpoint = polylinePath[polylinePath.length - 1];
                polylinePath = [lastpoint];
            }
        }

    }, Cesium.ScreenSpaceEventType.LEFT_CLICK);

    /***************************鼠标单击事件***********************************/

    /***************************鼠标双击事件***********************************/
    handler.setInputAction(function () {
        handler.removeInputAction(Cesium.ScreenSpaceEventType.LEFT_CLICK);
        handler.removeInputAction(Cesium.ScreenSpaceEventType.LEFT_DOUBLE_CLICK);
        AllEnities.push(polyline);
        viewer.trackedEntity = undefined;
        isDraw = false;
        tooltip.style.display = "none";
        polylinePath = [];
        //LineEntities = [];
        // polyline = null;

    }, Cesium.ScreenSpaceEventType.LEFT_DOUBLE_CLICK);

    /***************************鼠标双击事件***********************************/
}

function f_GetGUID() {
    function S4() {
        return (((1+Math.random())*0x10000)|0).toString(16).substring(1);
    }
    return (S4()+S4()+"-"+S4()+"-"+S4()+"-"+S4()+"-"+S4()+S4()+S4());
}

function f_ClearMap() {
    var entitys = viewer.entities._entities._array;
    for (var i = 0; i < entitys.length; i++) {
    //        console.log(entitys[i]._name);
        //        console.log(entitys[i]._id);
        //alert(entitys[i]._name);
        if (entitys[i]._name == "CEJU") {
            viewer.entities.remove(entitys[i]);
            i--;
        }
            
        }
    handler.removeInputAction(Cesium.ScreenSpaceEventType.LEFT_CLICK);
    handler.removeInputAction(Cesium.ScreenSpaceEventType.LEFT_DOUBLE_CLICK);
    isDraw = false; 
}

//获取俩点的距离，返回公里单位值
function getLineDis(startPoint, endPoint) {
    var x2 = (endPoint.x - startPoint.x) * (endPoint.x - startPoint.x)
    var y2 = (endPoint.y - startPoint.y) * (endPoint.y - startPoint.y);
    var dis = Math.sqrt(x2 + y2) / 1000;
    return dis.toFixed(2);
}

function sum(arr) {
    var s = 0;
    for (var i = arr.length - 1; i >= 0; i--) {
        s += Number(arr[i]);
    }
    return s;
}

try {
    parent.f_MapInit();
}
catch (e) { }


function f_LoadJsonMap(jsonurl) {
    var promise = Cesium.GeoJsonDataSource.load(jsonurl);  //显示管线数据  直接加载json数据 比把json转化成czml在加载 快很多
    promise.then(function (dataSource) {
        viewer.dataSources.add(dataSource);
        var entities = dataSource.entities.values;
        var colorHash = {};
                for (var o = 0; o < entities.length; o++) {
                    var r = entities[o];
                    r.nameID = o;   //给每条线添加一个编号，方便之后对线修改样式
                    r.polyline.width = 10;  //添加默认样式
                    (r.polyline.material = new Cesium.PolylineGlowMaterialProperty({
                        glowPower: .2, //一个数字属性，指定发光强度，占总线宽的百分比。
                        color: Cesium.Color.GREEN.withAlpha(.9)
                    }), 10)

                }
                var temp = new Array();
                window.Hightlightline = function (nameid) {
                    var exists = temp.indexOf(nameid);
                    if (exists <= -1) {
                        Highlight(nameid, 50, 50);
                        temp.push(nameid);  // 添加线nameID到数组，
                    }
                    else  //已经是高亮状态了 再次点击修改为原始状态
                    {
                        Highlight(nameid, 10, 10);
                        temp.splice(exists, 1);  //删除对应的nameID
                    }
                }
                window.Highlight = function (nameid, width1, width2) {
                    for (var o = 0; o < entities.length; o++) {
                        var m = entities[o];
                        if (nameid == o) {
                            m.polyline.width = width1;
                            (m.polyline.material = new Cesium.PolylineGlowMaterialProperty({
                                glowPower: .1, //一个数字属性，指定发光强度，占总线宽的百分比。
                                color: Cesium.Color.ORANGERED.withAlpha(.9)
                            }), width2)
                        }
                    }
                }
    });
    //viewer.flyTo(promise);
}

function f_AddPoint(strName,x,y,h,typeName,fontSize) {
    var point = Cesium.Cartesian3.fromDegrees(x, y, h);
    var strartpoint = viewer.entities.add(
        {
            name: typeName, //"PNT"
            position: point,
            point: {
                heightReference: Cesium.HeightReference.CLAMP_TO_GROUND,
                show: true,
                color: Cesium.Color.SKYBLUE,
                pixelSize: 3,
                outlineColor: Cesium.Color.YELLOW,
                outlineWidth: 1
            },
            label: {
                text: strName,
                font: fontSize+'pt 微软雅黑',
                color: Cesium.Color.RED,
                backgroundColor: Cesium.Color.CORAL,
                style: Cesium.LabelStyle.FILL_AND_OUTLINE,
                outlineWidth: 2,
                //垂直位置
                heightReference: Cesium.HeightReference.NONE,
                verticalOrigin: Cesium.VerticalOrigin.BOTTOM,
                pixelOffset: new Cesium.Cartesian2(0, -5)
            }
        }
    );
    }

    function f_AddMark(strName, x, y, h, typeName, fontSize, imgURL, imgSize) {
        var point = Cesium.Cartesian3.fromDegrees(x, y, h);
        var strartpoint = viewer.entities.add(
        {
            name: typeName, //"PNT"
            position: point,
            point: {
                pixelSize: 0
            },
            label: {
                text: strName,
                font: fontSize + 'pt 微软雅黑',
                color: Cesium.Color.RED,
                backgroundColor: Cesium.Color.CORAL,
                style: Cesium.LabelStyle.FILL_AND_OUTLINE,
                outlineWidth: 2,
                //垂直位置
                heightReference: Cesium.HeightReference.NONE,
                verticalOrigin: Cesium.VerticalOrigin.BOTTOM,
                pixelOffset: new Cesium.Cartesian2(0, (-imgSize/2)-2)
            },
            billboard: { //图标
                image: imgURL,
                width: imgSize,
                height: imgSize
            }
        }
    );
    }

    var handlerVideo = new Cesium.ScreenSpaceEventHandler(viewer.scene.canvas);
    handlerVideo.setInputAction(function (click) {
        var pick = viewer.scene.pick(click.position);
        if (pick && pick.id._name == "CITY") {
            //monitorEntity._billboard._image._value = '../images/marker02.png';
            //monitorEntity._label._text._value = "label";
            alert(pick.id._label._text._value);
        } else {
            return;
        }
    }, Cesium.ScreenSpaceEventType.LEFT_CLICK);