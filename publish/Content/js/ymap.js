
var bewellCoords;
var groups;
var myMap;
var need_render = true;
var interval_render;
var zoomMap = 5;
var mapId = "geoMap";
var mapIndex = "";

/*Меняем под нужный спрайт*/
var pointImg = "/content/i/placePoint.png";
/*Размер отдельного изображения в спрайте*/
var pointImgSize = [51, 52];


function InitMap(baseCoords, baseGroups, index, zoom) {
    bewellCoords = baseCoords;
    groups = baseGroups;
    if (zoom != "" && typeof (zoom) != "undefined") {
        zoomMap = parseInt(zoom);
    }
    if (index != "" && typeof (index) != "undefined") {
        mapIndex = index;
    }

    ymaps.ready(initYMap);
}


function initYMap() {

    if (typeof (bewellCoords) == "undefined" || typeof (groups) == "undefined") return false;
    if (bewellCoords == "") return false;

    myMap = new ymaps.Map(mapId + mapIndex, {
        center: bewellCoords, //долгота, широта 
        zoom: zoomMap,
        type: 'yandex#publicMap'
    });
    
        
    myMap.controls
    // Кнопка изменения масштаба.
    .add('zoomControl', { left: 5, top: 5 })
    // Список типов карты
    .add('typeSelector')
    // Стандартный набор кнопок
    .add('mapTools', { left: 35, top: 5 });

    if (groups == "") return false;
   

    var groupCounter = 0;
    var itemCounter = 0;
    var collections = [];

    groups.forEach(function (group) {
        
        // Коллекция для геообъектов группы.
        collection = new ymaps.GeoObjectCollection(null, { preset: group.style });
        //Помещаем в список коллекций
        collections.push(collection);
        // Добавляем коллекцию на карту.
        myMap.geoObjects.add(collection);
        

        // Перебираем элементы группы.
        group.items.forEach(function (item) {
            ++itemCounter;

            // Создаем метку.
            if (itemCounter == group.items.length) {
                placemark = new ymaps.Placemark(
                    item.center,
                    { hintContent: item.balloonContentHeader, balloonContentHeader: '<a href="' + item.balloonContentHeaderLink + '">' + item.balloonContentHeader + '</a>', balloonContent: item.balloonContent },
                    { iconImageHref: pointImg, iconImageSize: pointImgSize }
                );
            } else {
                placemark = new ymaps.Placemark(
                    item.center,
                    { hintContent: item.balloonContentHeader, balloonContentHeader: '<a href="' + item.balloonContentHeaderLink + '">' + item.balloonContentHeader + '</a>', balloonContent: item.balloonContent }
                );
            }            

            // Добавляем метку в коллекцию.
            collection.add(placemark);

        });

        ++groupCounter;
    });

    if (itemCounter > 1) {
    /*myMap.setBounds(myMap.geoObjects.getBounds());
    interval_render = window.setInterval(function () {
        if ($('#yandexMap').is(':visible') && need_render) {
            need_render = false;
            window.clearInterval(interval_render);
            myMap.setBounds(myMap.geoObjects.getBounds());
        }
    }, 500); */
    }

    $(window).resize(function () {
        var width = $(window).width();
        var height = $(window).height();

        myMap.container.fitToViewport();
    });

    
}

$(function() {

});