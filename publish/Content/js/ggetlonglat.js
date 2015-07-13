var map = null;
var geocoder = null;
var curlat = 0,
	curlng = 0;
var curlatlng = null;
var curZoom = 0;
var MoveEvnt = null;
var Elevtn = null,
	MaxZmLevel = null,
	vMarker = null,
	clickMarker = null,
	ZoomEvnt = null,
	MapTypeEvnt = null,
	largWin = null;


var defCoords = "[37.617671,55.755768]";

function gMapload() {
	var d;
	var b,
		g,
		e;

    var curCoordsObj = document.getElementById("GMapsID");

    if (curCoordsObj.getAttribute('data-curcoords') != null && curCoordsObj.getAttribute('data-curcoords') != "") {
        d = curCoordsObj.getAttribute('data-curcoords');
        b = d.indexOf(",");
        e = d.substring(0, b);
        g = d.substring(b + 1);
    } else {
        g = defCoords[1];
        e = defCoords[0];
    }
	
    
	var h = new google.maps.LatLng(g, e);
	var c = {
			zoom: 10,
			center: h
		};
    map = new google.maps.Map(curCoordsObj, c);

    vMarker = new google.maps.Marker({
        position: h,
        map: map,
        draggable: true
    });
                
	geocoder = new google.maps.Geocoder();
	MaxZmLevel = new google.maps.MaxZoomService();

	MoveEvnt = google.maps.event;
	MoveEvnt.addDomListener(vMarker, "drag", function (i) {
	    //alert(i.latLng.lat());
	    document.getElementById("getlonglat-point-g").value = i.latLng.lng().toString().substring(0, 8) + "," + i.latLng.lat().toString().substring(0, 8);
	});
    

	MapTypeEvnt = google.maps.event;
//	MapTypeEvnt.addDomListener(map, "maptypeid_changed", function() {
//		var i = map.getMapTypeId();
//		switch (i) {
//			case "roadmap":
//			case "terrain":
//				document.getElementById("idChckBox").disabled = true;
//				break;
//			case "satellite":
//			case "hybrid":
//				fIsTilt();
//				break
//		}
//	});
	ZoomEvnt = google.maps.event;
//	ZoomEvnt.addDomListener(map, "zoom_changed", function() {
//		fIsTilt()
//	});
	Elevtn = new google.maps.ElevationService();
//	MoveEvnt.addDomListener(map, "mousemove", function(i) {
//		document.getElementById("idCurLat").value = i.latLng.lat();
//		document.getElementById("idCurLng").value = i.latLng.lng()
//	});
	coordsControls();

	window.setTimeout(function () { 
	    SetCoords(e + "," + g);
	}, 500);
    
}

function SetCoords(coors) {
    try {
        document.getElementById("getlonglat-point-g").value = coors;
    } catch(e) {
        window.setTimeout(function () {
            SetCoords(coors);
        }, 500);
    } 
    
}

function searchAddress(h) {

    geocoder.geocode({
        address: h
    }, function (n, l) {
        var k;
        if (vMarker != null) {
            vMarker.setMap(null)
        }
        var m = {
            map: map,
            visible: true,
            draggable: true
        };
        vMarker = new google.maps.Marker(m);
        if (l == google.maps.GeocoderStatus.OK) {

            k = n[0].geometry.location;
            map.setCenter(k);
            vMarker.setPosition(k);
            MaxZmLevel.getMaxZoomAtLatLng(k, function (o) {
                map.setZoom(o.zoom-7)
            })
            SetCoords(k.lng() + "," + k.lat());
            MoveEvnt.addDomListener(vMarker, "drag", function (i) {
                document.getElementById("getlonglat-point-g").value = i.latLng.lng().toString().substring(0, 8) + "," + i.latLng.lat().toString().substring(0, 8);
            });
        }
        else {
            alert("Geocode was not successful for the following reason: " + l)
        }
    })

}

function coordsControls() {
    $coords = $('<div class="b-getlonglat-view-information" style="margin-right: -108px; margin-top: 35px;"><div class="b-getlonglat-element">Координаты метки:<input id="getlonglat-point-g" name="mapCoords" type="text" readonly="readonly"/><input name="useGoogleMap" type="hidden" value="True"/></div></div>');
    $coords.find(".b-getlonglat-element input").bind("click", function () {
        this.select();
    });

    var ControlDiv = $coords[0];
    ControlDiv.index = 1;
    map.controls[google.maps.ControlPosition.TOP_RIGHT].push(ControlDiv);

    $search = $('<div class="YMaps-btn YMaps-cursor-default" style="margin-left: -100px; margin-top: 5px;"><div class="YMaps-btn-v"><div class="YMaps-btn-h"><div class="YMaps-btn-i" style="width: 240px;"><div class="YMaps-h-search"><table class="YMaps-l-search"><tbody><tr><td class="YMaps-l-search-l"><div class="YMaps-b-search-wrap"><input type="text" name="text" class="YMaps-search-control-text" value=""></div></td><td class="YMaps-l-search-r"><div class="YMaps-search-control-submit"><i>Найти</i></div></td></tr></tbody></table></div></div></div></div></div>');

    $search.find(".YMaps-search-control-submit").bind("click", function () {
        searchAddress($(this).closest('.YMaps-btn').find('.YMaps-search-control-text').val());
    });
    
    var SearchDiv = $search[0];
    SearchDiv.index = 2;
    map.controls[google.maps.ControlPosition.TOP_CENTER].push(SearchDiv);
}
