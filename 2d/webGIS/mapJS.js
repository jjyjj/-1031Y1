﻿var source_js = new ol.source.Vector();
vector_js = new ol.layer.Vector({
    source: source_js,
    style: new ol.style.Style({
        fill: new ol.style.Fill({
            color: 'rgba(255, 255, 255,0.2)'
        }),
        stroke: new ol.style.Stroke({
            color: '#ffcc33',
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
var continuePolygonMsg = "面积"; //点击开始绘制面


/**
* Message to show when the user is drawing a line.
* @type {string}
*/
var continueLineMsg = "距离"; //点击开始绘制线路


/**
* Handle pointer move.
* @param {ol.MapBrowserEvent} evt The event.
*/
var pointerMoveHandler = function (evt) {
    if (evt.dragging) {
        return;
    }
    /** @type {string} */
    var helpMsg = "开始";

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
    helpTooltipElement.classList.remove("hidden");
};
map.addOverlay(vector_js);
map.on('pointermove', pointerMoveHandler);
map.getViewport().addEventListener('mouseout', function () {
    helpTooltipElement.classList.add('hidden');
});




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
              ' ' + 'km';
    } else {
        output = (Math.round(length * 100) / 100) +
              ' ' + 'm';
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
              ' ' + 'km<sup>2</sup>';
    } else {
        output = (Math.round(area * 100) / 100) +
              ' ' + 'm<sup>2</sup>';
    }
    return output;
};

function addInteraction(type) {
    //'Polygon' : 'LineString'
    if (draw != null) {
        map.removeInteraction(draw);
    }    
    draw = new ol.interaction.Draw({
        source: source_js,
        type: type,
        style: new ol.style.Style({
            fill: new ol.style.Fill({
                color: 'rgba(255, 255, 255, 0.2)'
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
    helpTooltip.set("name", "celiang");
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
    measureTooltip.set("name", "celiang");
    map.addOverlay(measureTooltip);

//    var lyrs = map.getOverlays();
//    alert(lyrs.getLength());
}


function f_ClearToolTip() {
//    measureTooltipElement.classList.add('hidden');
    //    helpTooltipElement.classList.add('hidden');
    var lyrs = map.getOverlays();
    //alert(lyrs.getLength());
    for (var i = 0; i < lyrs.getLength(); i++) {
        var obj = lyrs.item(i);
        var strname = obj.get("name");
        if (strname == "celiang") {
            map.removeOverlay(obj);
        }
    }
    
}

//addInteraction("Polygon"); //LineString,Polygon