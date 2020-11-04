function f_AddPolygonEntity() {
	var wyoming = viewer.entities.add({
		name: 'Wyoming',
		polygon: {
			hierarchy: Cesium.Cartesian3.fromDegreesArray([
							  113.7179772624, 34.7751056210
							  , 113.7193742292, 34.7751601966
							  , 113.7204481744, 34.7749767961
							  , 113.7220528702, 34.7745063106
							  , 113.7226395908, 34.7739182359
							  , 113.7228432567, 34.7731575313
							  , 113.7218403995, 34.7717176063
							  , 113.7197586690, 34.7721481939
							  , 113.7188324887, 34.7729590374
							  , 113.7183060050, 34.7736503124
							  , 113.7180604274, 34.7743452875
							  ]),
			height: 0,
			material: Cesium.Color.GREEN.withAlpha(0.2),
			outline: true,
			outlineColor: Cesium.Color.BLACK
		}
	});
	viewer.zoomTo(wyoming);
}

function f_AddPolyline() {
	var entity = viewer.entities.add({
		polyline: {
			positions: Cesium.Cartesian3.fromDegreesArray(
			[
				113.7011973074, 34.7791079327
				, 113.6668024934, 34.8050759637
			]),
			width: 5,
			material: Cesium.Color.RED
		}
	});
	viewer.zoomTo(viewer.entities);
}

function f_SetPositon(pos) {
    //MULTILINESTRING((113.891544023054 34.0464663036845,113.894623946455 34.0186727349381,113.893944254053 34.008880864552,113.887856889055 33.979205681041))
    pos = pos.replace("MULTILINESTRING((", "");
    pos = pos.replace("))", "");
    pos = pos.replace(/\s+/g, ",");
    var arrpos = pos.split(',');
    var arrpos_long=new Array();
    for(var i=0;i<arrpos.length;i++)
    {
        arrpos_long[i]=Number(arrpos[i]);
    }

    return arrpos_long;
}

function f_AddpolylineVolume() {
	var url = "it/get.aspx?CMD=NODE";
    $.post(url, {}, function (data) {
        if(data=="")return;
        var objectdata = eval(data);
    if (objectdata.length != 0) {
        for (var i = 0; i < objectdata.length; i++) {
            var xy = f_SetPositon(objectdata[i].xy);
            f_AddpolylineVolumeByPos(xy);
        }
    }
    });
    
    
//    var lable = viewer.entities.add({
//		polylineVolume: {
//			positions: Cesium.Cartesian3.fromDegreesArray(
//			[
//				113.7032096532, 34.7778287872
//				, 113.7025276742, 34.7791518986
//                , 113.7020973158, 34.7809206528
//                , 113.6981446132, 34.7809542398
//                , 113.6981054081, 34.7846733385
//                , 113.6981684679, 34.7875993584
//                , 113.6940941725, 34.7875684794
//                , 113.6868001214, 34.7876955845
//                , 113.6865533061, 34.7877913712
//                , 113.6864290316, 34.7879584403
//                , 113.6863900254, 34.7881265781
//                , 113.6863757084, 34.7961126265
//                , 113.6770648056, 34.7978421208
//                , 113.6754717058, 34.7979972729
//                , 113.6746620854, 34.7974303485
//			]),
//			shape: computeCircle(3.0),
//			height: 25,
//			material: Cesium.Color.BLUE.withAlpha(1),
//		}
//	});
    //viewer.zoomTo(lable);
}
function f_AddpolylineVolumeByPos(pos) {
        var lable = viewer.entities.add({
    		polylineVolume: {
    			positions: Cesium.Cartesian3.fromDegreesArray(
    			pos),
    			shape: computeCircle(3.0),
    			height: 25,
    			material: Cesium.Color.BLUE.withAlpha(1),
    		}
    	});
    viewer.zoomTo(lable);
}

function f_AddpolylineVolume2() {
        var lable = viewer.entities.add({
    		polylineVolume: {
    			positions: Cesium.Cartesian3.fromDegreesArray(
    			[
    				113.7032096532, 34.7778287872
    				, 113.7025276742, 34.7791518986
                    , 113.7020973158, 34.7809206528
                    , 113.6981446132, 34.7809542398
                    , 113.6981054081, 34.7846733385
                    , 113.6981684679, 34.7875993584
                    , 113.6940941725, 34.7875684794
                    , 113.6868001214, 34.7876955845
                    , 113.6865533061, 34.7877913712
                    , 113.6864290316, 34.7879584403
                    , 113.6863900254, 34.7881265781
                    , 113.6863757084, 34.7961126265
                    , 113.6770648056, 34.7978421208
                    , 113.6754717058, 34.7979972729
                    , 113.6746620854, 34.7974303485
    			]),
    			shape: computeCircle(3.0),
    			height: 25,
    			material: Cesium.Color.BLUE.withAlpha(1),
    		}
    	});
    viewer.zoomTo(lable);
}

function computeCircle(radius) {
    var positions = [];
    for (var i = 0; i < 360; i++) {
        var radians = Cesium.Math.toRadians(i);
        positions.push(new Cesium.Cartesian2(radius * Math.cos(radians), radius * Math.sin(radians)));
    }
    return positions;
}

function f_AddMod()
{
    viewer.entities.removeAll();
    var url="../src/mod/CesiumAir/Cesium_Air.glb";

    var arrpos=[
    				113.7032096532, 34.7778287872
    				, 113.7025276742, 34.7791518986
                    , 113.7020973158, 34.7809206528
                    , 113.6981446132, 34.7809542398
                    , 113.6981054081, 34.7846733385
                    , 113.6981684679, 34.7875993584
                    , 113.6940941725, 34.7875684794
                    , 113.6868001214, 34.7876955845
                    , 113.6865533061, 34.7877913712
                    , 113.6864290316, 34.7879584403
                    , 113.6863900254, 34.7881265781
                    , 113.6863757084, 34.7961126265
                    , 113.6770648056, 34.7978421208
                    , 113.6754717058, 34.7979972729
                    , 113.6746620854, 34.7974303485
    			];
    for(var i=0;i<arrpos.length;i++)
    {
        var x=arrpos[i];
        i++;
        var y=arrpos[i];
        var position = Cesium.Cartesian3.fromDegrees(x,y,100.0);
        var heading = Cesium.Math.toRadians(180);
        var pitch = 0;
        var roll = 0;
        var hpr = new Cesium.HeadingPitchRoll(heading, pitch, roll);
        var orientation = Cesium.Transforms.headingPitchRollQuaternion(position, hpr);
        var entity = viewer.entities.add({
            name : url,
            position : position,
            orientation : orientation,
            model : {
                uri : url,
                minimumPixelSize : 128,
                maximumScale : 20000
            }
        });
        //viewer.trackedEntity = entity;
        break;
    }
    //视角盯住这个实体去看
    //viewer.trackedEntity = entity;
}

function f_AddShpJson()
{
    var url = "it/get.aspx?CMD=SHP";
    $.post(url, {}, function (data) {
        if(data=="")return;
        alert(data);
//        var objectdata = eval(data);
//        if (objectdata.length != 0) {
//            for (var i = 0; i < objectdata.length; i++) {
//                var xy = f_SetPositon(objectdata[i].xy);
//                f_AddpolylineVolumeByPos(xy);
//            }
//        }
    });
}

//f_AddpolylineVolume2();