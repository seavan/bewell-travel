<%@ Page Title="Title" Language="C#" Inherits="System.Web.Mvc.ViewPage<bewell.Models.ViewModels.SearchViewModel>"
    MasterPageFile="~/Views/Shared/Main.Master" %>

<%@ Import Namespace="bewell.common" %>
<asp:Content runat="server" ID="Head" ContentPlaceHolderID="HeadContent">
    <link href="/Content/css/ui-lightness/jquery-ui-1.10.4.custom.min.css" rel="stylesheet"
        type="text/css" />
    <link href="/Content/css/ui-lightness/bewell-slider.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content runat="server" ID="Slider" ContentPlaceHolderID="SliderContent">
</asp:Content>
<asp:Content runat="server" ID="Main" ContentPlaceHolderID="MainContent">
    <ul class="b-path">
        <li><a href="/">Главная</a></li>
        <li>Результат поиска отелей</li>
    </ul>
    <h1>
        результат поиска отелей</h1>
    <div class="b-middle clearFix" data-ng-app="search" data-ng-controller="SearchFormCtrl">
        <div class="b-middle__left fl_l">
            <% Html.BeginForm("hotelsearch", "home", FormMethod.Get, new { @class = "b-form b-form_left" }); %>
            <dl>
                <dt class="title">подобрать отель</dt>
                <dd>
                    <div class="b-form__map-door js-popup-country-door">
                        <div class="b-form__map-door__in">
                            <span>Выбрать на карте мира</span></div>
                    </div>
                    <div class="b-form__row">
                        <span class="b-form__label">{{rootTerritory.Label}}</span>
                        <select class="b-form__field b-form__field_select" data-ng-model="rootTerritory"
                            data-ng-options="r.Title for r in territories" data-ng-change="changeRootTerritory(rootTerritory)">
                        </select>
                        <input type="hidden" name="RootTerritoryId" value="{{rootTerritory.Id}}" />
                    </div>
                    <div class="b-form__row">
                        <span class="b-form__label">{{territory.Label}}</span>
                        <select class="b-form__field b-form__field_select" data-ng-model="territory" data-ng-options="t.Title for t in rootTerritory.Sub"
                            data-ng-change="changeTerritory(territory)">
                        </select>
                        <input type="hidden" name="TerritoryId" value="{{territory.Id}}" />
                    </div>
                    <div class="b-form__row">
							<span class="b-form__label">{{subTerritory.Label}}</span>
							<select class="b-form__field b-form__field_select" data-ng-model="subTerritory" data-ng-options="t.Title for t in territory.Sub" data-ng-change="changeSubTerritory(subTerritory)">
							</select>
                            <input type="hidden" name="SubTerritoryId" value="{{subTerritory.Id}}"/>
						</div>
                    <div class="b-form__row">
                        <span class="b-form__label">Заболевание</span>
                        <select class="b-form__field b-form__field_select" data-ng-model="desease" data-ng-options="d.Title for d in deseases">
                        </select>
                        <input type="hidden" name="DeseaseId" value="{{desease.Id}}" />
                    </div>
                    <div class="b-form__row">
                        <span class="b-form__label">Метод лечения</span>
                        <select class="b-form__field b-form__field_select" data-ng-model="treatment" data-ng-options="t.Title for t in treatments">
                        </select>
                        <input type="hidden" name="TreatmentId" value="{{treatment.Id}}" />
                    </div>
                    <% if (Model.MaxPrice.HasValue && Model.MinPrice.HasValue)
                        { %>
                    <div class="b-form__row">
                        <span class="b-form__label">Стоимость проживания, руб.</span>
                        <div id="slider-wrapper">
                            <span class="slider-tooltip" id="tooltip-from">
                                <%=Model.MinPrice %></span> <span class="slider-tooltip" id="tooltip-to">
                                    <%=Model.MaxPrice %></span>
                            <div id="price-slider">
                            </div>
                        </div>
                        <div class="b-form__row-line">
                            <span>от</span>
                            <input type="text" name="PriceFrom" value="<%=Model.MinPrice %>" class="b-form__field hotel-price"
                                id="price-value-from" style="width: 145px">
                            <span>руб.</span>
                        </div>
                        <div class="b-form__row-line">
                            <span>до</span>
                            <input type="text" name="PriceTo" value="<%=Model.MaxPrice %>" class="b-form__field hotel-price"
                                id="price-value-to" style="width: 145px">
                            <span>руб.</span>
                        </div>
                    </div>
                    <% } %>
                    <div class="b-form__row">
                        <span class="b-form__label">Название отеля</span>
                        <input type="text" name="Title" class="b-form__field" value="<%= Model.Title %>" />
                    </div>
                    <div class="b-form__button">
                        <input type="submit" value="подобрать" class="button">
                    </div>
                </dd>
            </dl>
            <% Html.EndForm(); %>
        </div>
        <div class="b-middle__right fl_r">
            <% Html.BeginForm("hotelsearch", "home", FormMethod.Get, new { @class = "b-form b-form_search js-slide-toggle" }); %>
            <input type="hidden" name="RootTerritoryId" value="{{rootTerritory.Id}}" />
            <input type="hidden" name="TerritoryId" value="{{territory.Id}}" />
            <input type="hidden" name="SubTerritoryId" value="{{subTerritory.Id}}" />
            <input type="hidden" name="ResortId" value="{{resort.Id}}" />
            <input type="hidden" name="DeseaseId" value="{{desease.Id}}" />
            <input type="hidden" name="TreatmentId" value="{{treatment.Id}}" />
            <% if (Model.MaxPrice.HasValue && Model.MinPrice.HasValue)
               { %>
            <input type="hidden" id="hfPriceFrom" name="PriceFrom" value="<%=Model.MinPrice %>" />
            <input type="hidden" id="hfPriceTo" name="PriceTo" value="<%=Model.MaxPrice %>" />
            <% } %>

            <div class="b-form__row">
                <div class="b-form_search__col b-form_search__col_w1">
                    <span class="b-form__label">Количество звезд</span>
                    <%: Html.DropDownListFor(m => m.Stars, Model.HotelStars, new { @class = "b-form__field b-form__field_select"}) %>
                </div>
                <div class="b-form_search__col b-form_search__col_w1">
                    <span class="b-form__label">Класс отеля</span>
                    <%: Html.DropDownListFor(m => m.HotelClass, Model.HotelClasses, new { @class = "b-form__field b-form__field_select"}) %>
                </div>
                <div class="b-form_search__extended-door js-slide-toggle-door b-close">
                    <span class="js-slide-toggle-door-text" data-change="Свернуть">Расширенный поиск</span>
                    <i class="b-arrow b-form_search__extended-door__arrow"></i>
                </div>
            </div>
            <div class="b-form_search__extended js-slide-toggle-content b-close">
                <% foreach (var category in Model.Categories)
                   { %>
                   <div class="b-form__row">
                        <span class="b-form__label"><%= category.title %></span>
                        <ul class="b-form__list">
                            <% foreach (var property in category.Properties)
                                { %>
                                <li class="b-form-li">
                                    <label class="b-form__checkbox">
                                        <input type="checkbox" name="Properties" value="<%= property.id %>" <%= Model.Properties != null && Model.Properties.Contains(property.id) ? "checked" : "" %>><span><%= property.title %></span>
                                    </label>
                                </li>
                            <% } %>
                        </ul>
                    </div>
                <% } %>
                
                <% foreach (var treatment in Model.TreatmentOptions)
                   { %>
                   <div class="b-form__row">
                        <span class="b-form__label"><%= treatment.title %></span>
                        <ul class="b-form__list">
                            <% foreach (var sub in treatment.SubTreatmentOptions)
                                { %>
                                <li class="b-form-li">
                                    <label class="b-form__checkbox">
                                        <input type="checkbox" name="Treatments" value="<%= sub.id %>" <%= Model.Treatments != null && Model.Treatments.Contains(sub.id) ? "checked" : "" %>><span><%= sub.title %></span>
                                    </label>
                                </li>
                            <% } %>
                        </ul>
                    </div>
                <% } %>
                
            </div>
            <div class="b-form__button">
                <input type="submit" value="найти" class="button">
            </div>
            <% Html.EndForm(); %>
            <% Html.RenderAction("HotelResults", "Home", Model); %>
        </div>
        <div class="popup popup_country js-popup js-popup-country" style="display: none;">
            <div class="popup__table">
                <div class="popup__table__cell">
                    <div class="popup__content popup-map">
                        <div class="popup__close js-popup-close" title="Закрыть">
                            Закрыть</div>
                        <div class="popup__content__in b-content">
                            <h2>
                                Поиск курорта на карте мира</h2>
                            <form class="b-form b-form_country b-form_country_onPage">
                            <div class="b-form_country__content">
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
                                                <a data-ng-show="continent.Id > 0" href="javascrip:void(0);" data-ng-click="selectTerritory(continent.Id, 0)" title="{{continent.Title}}">
                                                    {{continent.Title}}
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
                                                            <li data-ng-repeat="subterr in sub.Sub"><a href="javascript:void(0);" data-ng-click="selectTerritory(sub.Id, subterr.Id)"
                                                                title="{{subterr.Title}}">{{subterr.Title}} </a></li>
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ID="Scripts" ContentPlaceHolderID="ScriptsContent">
    <script type="text/javascript" src="/Scripts/jquery-ui-1.10.4.custom.min.js"></script>
    <script src="/Scripts/angular.min.js" type="text/javascript"></script>
    <% if (Model.MaxPrice.HasValue && Model.MinPrice.HasValue)
       { %>
    <script type="text/javascript">
           $(function () {
               var $slider = $('#price-slider'),
                   $tooltipFrom = $("#tooltip-from"),
                   $tooltipTo = $("#tooltip-to"),
                   $priceValueFrom = $("#price-value-from"),
                   $priceValueTo = $("#price-value-to"),
                   $hfpriceValueFrom = $("#hfPriceFrom"),
                   $hfpriceValueTo = $("#hfPriceTo"),
                   minPrice = <%=Model.MinPrice %>,
                   maxPrice = <%=Model.MaxPrice %>;

                function updatePriceValues(from, to) {
                    $tooltipFrom.html(from);
                    $tooltipTo.html(to);
                    $tooltipFrom.css("left", $(".ui-slider-handle-1").css("left"));
                    $tooltipTo.css("right", parseInt($slider.css("width")) - parseInt($(".ui-slider-handle-2").css("left")) + 'px');
                    $priceValueFrom.val(from);
                    $priceValueTo.val(to);
                    $hfpriceValueFrom.val(from);
                    $hfpriceValueTo.val(to);
                }

               $slider.slider({
                   range: true,
                   min: <%=Model.MinPrice %>,
                   max: <%=Model.MaxPrice %>,
                   step: 100,
                   values: [<%= Model.PriceFrom > 0 ? Model.PriceFrom : Model.MinPrice %>, <%= Model.PriceTo > 0 ? Model.PriceTo : Model.MaxPrice %>],
                   slide: function (event, ui) {
                       updatePriceValues(ui.values[0], ui.values[1]);
                   }
               });

               $('.ui-slider-handle').each(function () {
                   $(this).addClass('ui-slider-handle-' + $(this).index());
               });

               $(".hotel-price").on("change", function () {
                   var min = parseInt($priceValueFrom.val());
                   var max = parseInt($priceValueTo.val());

                   if (min < minPrice) {
                       min = minPrice;
                   }

                   if (min > maxPrice) {
                       min = maxPrice;
                   }

                   if (max > maxPrice) {
                       max = maxPrice;
                   }

                   if (max < minPrice) {
                       max = minPrice;
                   }

                   if (min > max) {
                       min = max;
                   }

                   if (max < min) {
                       max = min;
                   }
                   
                   var values = [min, max];
                   $slider.slider("option", "values", values);
                   updatePriceValues(min, max);
               });

               updatePriceValues(<%= Model.PriceFrom > 0 ? Model.PriceFrom : Model.MinPrice %>, <%= Model.PriceTo > 0 ? Model.PriceTo : Model.MaxPrice %>);
           });
    </script>
    <% } %>
    <script type="text/javascript">
        function SearchFormCtrl($scope, $http) {
            //инофрмация о территориях
            $scope.territories = {};
            //информация о континентах
            $scope.continents = [];
            
            //смена территории верхнего уровня
            $scope.changeRootTerritory = function (rootTerritory) {
                $scope.territory = rootTerritory.Sub[0];
                $scope.subTerritory = $scope.territory.Sub[0];
                $scope.resort = $scope.subTerritory.Resorts[0];
            };
            
            //смена территории второго уровня
            $scope.changeTerritory = function (territory) {
                $scope.subTerritory = territory.Sub[0];
                $scope.resort = $scope.subTerritory.Resorts[0];
            };

            //смена территории третьего уровня
            $scope.changeSubTerritory = function (subTerritory) {
                $scope.resort = subTerritory.Resorts[0];
            };

            //выбор страны на карте
            $scope.selectTerritory = function (rootId, subId) {
                if (rootId == 0) {
                    rootId = subId;
                    subId = 0;
                }
                
                for (var i = 0; i < $scope.territories.length; i++) {
                    if ($scope.territories[i].Id == rootId) {
                        $scope.rootTerritory = $scope.territories[i];
                        
                        if (subId == 0) {
                            $scope.territory = $scope.rootTerritory.Sub[0];
                        } else {
                            for (var j = 0; j < $scope.territories[i].Sub.length; j++) {
                                if ($scope.territories[i].Sub[j].Id == subId) {
                                    $scope.territory = $scope.territories[i].Sub[j];
                                    break;
                                }
                            } 
                        }

                        break;
                    }
                }

                $(".js-popup-close").trigger("click");
            };
            
            //получение территорий
            $http.post('/ajax/getterritories', {withResorts:true}).success(function (data) {
                var rootId = <%= Model.RootTerritoryId %>,
                    terrId = <%= Model.TerritoryId %>,
                    subId = <%= Model.SubTerritoryId %>,
                    resortId = <%= Model.ResortId %>,
                    i;

                $scope.territories = data;
                
                for (var i = 0; i < data.length; i++) {
                    if (data[i].Id == rootId) {
                        $scope.rootTerritory = data[i];
                        break;
                    }
                }
                    
                for (i = 0; i < $scope.rootTerritory.Sub.length; i++) {
                    if ($scope.rootTerritory.Sub[i].Id == terrId) {
                        $scope.territory = $scope.rootTerritory.Sub[i];
                        $scope.resort = $scope.territory.Resorts[0];
                        break;
                    }
                }

                for (i = 0; i < $scope.territory.Sub.length; i++) {
                    if ($scope.territory.Sub[i].Id == subId) {
                        $scope.subTerritory = $scope.territory.Sub[i];
                        break;
                    }
                }
                    
                for (i = 0; i < $scope.subTerritory.Resorts.length; i++) {
                    if ($scope.subTerritory.Resorts[i].Id == resortId) {
                        $scope.resort = $scope.subTerritory.Resorts[i];
                        break;
                    }
                }
            });
            
            //получение заболеваний
            $http.post('/ajax/getalldeseases', {}).
                success(function (data) {
                        $scope.deseases = data;
                        var deseaseId = <%= Model.DeseaseId %>;
                    
                        for (var i = 0; i < $scope.deseases.length; i++) {
                            if ($scope.deseases[i].Id == deseaseId) {
                                $scope.desease = $scope.deseases[i];
                                break;
                            }
                        }
                    }
                );
            
            //получение методов лечений
            $http.post('/ajax/gettreatments', {}).
                success(function (data) {
                        $scope.treatments = data;
                        var treatmentId = <%= Model.TreatmentId %>;
                    
                        for (var i = 0; i < $scope.treatments.length; i++) {
                            if ($scope.treatments[i].Id == treatmentId) {
                                $scope.treatment = $scope.treatments[i];
                                break;
                            }
                        }
                    }
                );

            //получение континентов со странами
            $http({ method: 'POST', url: '/ajax/getmapterritories' }).
                success(function (data, status, headers, config) {
                    $scope.continents = data;
                });
        }

        angular.module('search', [])
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
    <%
        NameValueCollection queryCollection = HttpUtility.ParseQueryString(Request.Url.Query);
        queryCollection.Remove("pageSize");
        queryCollection.Remove("page");

        string query = queryCollection.Count > 0
            ? "?" + queryCollection + "&pageSize="
            : "?pageSize=";
    %>
    <script type="text/javascript">
        $(function () {
            $("#selector_count").on("change", function () {
                window.location = "<%= query %>" + $(this).val();
            });
        });
    </script>
</asp:Content>
