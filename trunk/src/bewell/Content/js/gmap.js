
var bewellCoords;
var groups;
var myMap;
var need_render = true;
var interval_render;
var zoomMap = 7;
var mapId = "geoMap";
var mapIndex = "";

var pointImg = {
    url: '/content/i/placePoint.png',
    // This marker is 20 pixels wide by 32 pixels tall.
    size: new google.maps.Size(51, 52),
    // The origin for this image is 0,0.
    origin: new google.maps.Point(0, 0),
    // The anchor for this image is the base of the flagpole at 0,32.
    anchor: new google.maps.Point(25, 25)
};



function InitMap(baseCoords, baseGroups, index, zoom) {
    bewellCoords = baseCoords;
    groups = baseGroups;
    if (zoom != "" && typeof(zoom) != "undefined") {
        zoomMap = parseInt(zoom);
    }
    if (index != "" && typeof(index) != "undefined") {
        mapIndex = index;
    }
    
    initGMap();
}



function initGMap() {

    if (typeof (bewellCoords) == "undefined" || typeof (groups) == "undefined") return false;
    if (bewellCoords == "") return false;

    var mapOptions = {
        zoom: zoomMap,
        center: new google.maps.LatLng(bewellCoords[1], bewellCoords[0]) //у нас хранится долгота,широта, а гугл просит наоборот
    }
    myMap = new google.maps.Map(document.getElementById(mapId + mapIndex), mapOptions);

    
    

    if (groups == "") return false;
   

    var groupCounter = 0;
    var itemCounter = 0;
    var collections = [];

    groups.forEach(function (group) {

        // Перебираем элементы группы.
        group.items.forEach(function (item) {
            ++itemCounter;


            var infowindow = new google.maps.InfoWindow({
                content: '<a href="' + item.balloonContentHeaderLink + '">' + item.balloonContentHeader + '</a>'
            });
            // Создаем метку.
            if (itemCounter == group.items.length) {

                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(item.center[1], item.center[0]),
                    map: myMap,
                    icon: pointImg,
                    title: item.balloonContentHeader
                });
                google.maps.event.addListener(marker, 'click', function () {
                    infowindow.open(myMap, marker);
                });
            } else {

                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(item.center[1], item.center[0]),
                    map: myMap,
                    title: item.balloonContentHeader
                });
                google.maps.event.addListener(marker, 'click', function () {
                    infowindow.open(myMap, marker);
                });
            }            

           

        });

        ++groupCounter;
    });

   

    $(window).resize(function () {
        var width = $(window).width();
        var height = $(window).height();

        
    });

   
}

$(function() {

});