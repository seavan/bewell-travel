<%@ Page Title="Title" Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>"
    MasterPageFile="~/Views/Shared/MainOneCol.Master" %>
<%@ Import Namespace="bewell.common" %>

<asp:Content runat="server" ID="Slider" ContentPlaceHolderID="SliderContent">
</asp:Content>
<asp:Content runat="server" ID="Main" ContentPlaceHolderID="MainContent">
    <ul class="b-path">
        <li><a href="/">Главная</a></li>
        <li>Поиск курорта на карте мира</li>
    </ul>
    <h1>Поиск курорта на карте мира</h1>
    <div class="b-content">
        <form class="b-form b-form_country b-form_country_onPage">
        <div class="b-form_country__content" data-ng-app="map" data-ng-controller="MapCtrl">
            <div class="b-form_country__content__col">
                <div class="b-form_country__content__col__title">
                    Выберите континент:</div>
                <div class="b-form_country__content__col__in">
                    <div class="b-form_country__map js-country-map">
                        <div data-land-id="<%= TerritoryName.NorthAmerica %>" class="js-country-map-item b-form_country__map__item b-form_country__map__item_1">
                        </div>
                        <div data-land-id="<%= TerritoryName.Africa %>" class="js-country-map-item b-form_country__map__item b-form_country__map__item_2">
                        </div>
                        <div data-land-id="<%= TerritoryName.Eurasia %>" class="js-country-map-item b-form_country__map__item b-form_country__map__item_3">
                        </div>
                        <div data-land-id="<%= TerritoryName.Australia %>" class="js-country-map-item b-form_country__map__item b-form_country__map__item_4">
                        </div>
                        <div data-land-id="<%= TerritoryName.SouthAmerica %>" class="js-country-map-item b-form_country__map__item b-form_country__map__item_5">
                        </div>
                        <img src="/Content/i/pix.gif" width="460" height="295" border="0" usemap="#Map">
                        <map name="Map">
                            <area data-land-id="<%= TerritoryName.NorthAmerica %>" shape="poly" coords="55,40,60,36,65,32,70,21,82,14,98,7,114,7,124,1,149,1,154,10,165,10,178,9,190,16,193,33,191,43,188,54,183,62,166,74,157,79,140,86,138,95,137,112,120,120,98,132,102,150,98,162,94,168,79,182,68,174,52,160,39,149,31,123,33,103,30,93,23,78,8,75,3,73,2,40,10,29,23,27"
                                href="#">
                            <area data-land-id="<%= TerritoryName.Africa %>" shape="poly" coords="179,163,191,146,192,131,189,118,196,107,209,104,225,107,230,115,235,133,243,141,256,146,269,155,285,160,286,174,289,189,278,221,263,230,252,240,238,243,225,232,221,209,212,190,187,177"
                                href="#">
                            <area id="default-area" data-land-id="<%= TerritoryName.Eurasia %>" shape="poly" coords="195,106,187,102,192,84,208,76,219,67,226,56,236,51,243,58,248,68,260,64,272,59,280,47,291,36,308,27,326,24,337,29,354,24,364,17,378,17,384,23,402,22,414,22,433,24,440,29,434,39,425,47,422,61,422,77,409,93,410,102,416,116,413,126,407,137,395,146,393,157,395,167,390,179,388,192,382,201,357,204,345,183,335,172,321,178,302,170,296,159,284,159,268,152,257,142,242,138,232,121,230,109,219,102,198,106"
                                href="#">
                            <area data-land-id="<%= TerritoryName.Australia %>" shape="poly" coords="370,223,382,212,394,200,409,185,427,188,430,204,438,215,440,237,446,245,454,248,457,253,455,273,450,285,434,290,419,276,408,270,396,254,387,247,370,249,368,233"
                                href="#">
                            <area data-land-id="<%= TerritoryName.SouthAmerica %>" shape="poly" coords="89,175,104,170,114,169,125,171,134,182,140,188,152,194,159,203,157,209,148,209,147,222,130,239,125,245,123,256,121,271,128,282,125,285,113,281,105,274,103,262,99,248,100,244,96,216,88,205,80,195,79,185"
                                href="#">
                        </map>
                    </div>
                </div>
            </div>
            <div class="b-form_country__content__col b-form_country__content__col_small">
                <div class="b-form_country__content__col__title">
                    Выберите страну:</div>
                <div class="b-form_country__content__col__in b-form_country__content__col__in_scroll b-article-list js-article-list">
                    <ul class="b-country-list js-country-list-box">
                        <li data-land-id="{{continent.Label}}" style="display: none" data-ng-repeat="continent in continents" select-area>
                            <a data-ng-show="continent.Id > 0" href="javascrip:void(0);" data-ng-click="selectTerritory(continent.Id, 0)"
                                title="{{continent.Title}}">{{continent.Title}}
                            </a>
                            <br />
                            <ul class="b-article-list__item">
                                <li data-ng-repeat="sub in continent.Sub">
                                    <span class="b-article-list__item__door js-article-list-door">
                                        <span>
                                            <a href="javascript:void(0);" data-ng-click="selectTerritory(continent.Id, sub.Id)" title="{{sub.Title}}">
                                                {{sub.Title}}
                                            </a>
                                        </span>
                                        <i data-ng-show="sub.Sub.length > 0" class="b-arrow b-article-list__item__arrow"></i>
                                    </span>
                                    <ul class="js-article-list-sub" style="display: none;">
                                        <li data-ng-repeat="subterr in sub.Sub">
                                            <a href="javascript:void(0);" data-ng-click="selectTerritory(sub.Id, subterr.Id)" title="{{subterr.Title}}">
                                                {{subterr.Title}}
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        </form>
    </div>
</asp:Content>
<asp:Content runat="server" ID="Scripts" ContentPlaceHolderID="ScriptsContent">
    <script type="text/javascript" src="/Scripts/angular.min.js"></script>
    <script type="text/javascript">
        function MapCtrl($scope, $http) {
            $scope.continents = [];

            $scope.selectTerritory = function (rootId, subId) {
                if (rootId == 0) {
                    rootId = subId;
                    subId = 0;
                }

                window.location.href = '/home/resortsearch?rootTerritoryId=' + rootId + (subId > 0 ? '&territoryId=' + subId : '');
            };

            //получение континентов со странами
            $http({ method: 'POST', url: '/ajax/getmapterritories' }).
                success(function (data, status, headers, config) {
                    $scope.continents = data;
                });
        }

        angular.module('map', [])
          .directive('selectArea', function () {
              return function (scope, element, attrs) {
                  if (scope.$last) {
                      setTimeout(function () {
                          changeState($("#default-area"), "b-active");
                      }, 1);
                  }
              };
          });

    </script>
</asp:Content>
