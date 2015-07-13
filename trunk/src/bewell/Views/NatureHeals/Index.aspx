<%@ Page Title="Title" Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>"
    MasterPageFile="~/Views/Shared/MainOneCol.Master" %>

<asp:Content runat="server" ID="Slider" ContentPlaceHolderID="SliderContent">
</asp:Content>
<asp:Content runat="server" ID="Main" ContentPlaceHolderID="MainContent">
    <ul class="b-path">
        <li><a href="/">Главная</a></li>
        <li>Природа лечит</li>
    </ul>
    <h1>Природа лечит</h1>
    
    <div class="frame b-menu-middle b-menu-middle_short">
        <ul class="b-menu-middle__list js-tabs">
            <li class="js-tabs-item b-active" data-tab="heal-tab">
                <div>
                    <span>Лечебные факторы</span></div>
            </li>
            <li class="js-tabs-item" id="treatments-tab" data-tab="treatment-tab" data-hash="treatments">
                <div>
                    <span>Методы лечения и диагностика</span></div>
            </li>
        </ul>
    </div>
    <div class="js-tabs-content" data-ng-app data-ng-controller="HealsCtrl">
        <div id="heal-tab" class="js-tabs-active">
            <form action="/home/sphinxsearch" method="GET" class="b-form b-form_search-acticle">
                <input type="hidden" name="type" value="natureheals"/>
                <label class="b-form_search-acticle__item">
                    <span class="b-form__label">Найти лечебный фактор:</span>
                    <input type="text" value="<%= Request["q"] %>" name="q" class="b-form__field">
                </label>
                <div class="b-form_search-acticle__item">
				    <input type="submit" value="найти" class="button">
			    </div>
            </form>
            <div class="b-middle clearFix">
                <div class="b-article-list clearFix js-article-list">
                    <ul data-ng-repeat="list in healthFactors" class="b-article-list__item">
                        <li data-ng-repeat="factor in list">
                            <span class="b-article-list__item__name b-article-list__item__door js-article-list-door">
                                <span><a href="{{factor.Label}}">{{factor.Title}}</a></span>
                                <i data-ng-show="factor.Sub.length > 0" class="b-arrow b-article-list__item__arrow"></i>
                            </span>
                            <ul class="b-article-list__item__sub js-article-list-sub" data-ng-show="test > 0">
                                <li data-ng-repeat="sub in factor.Sub">
                                    <a href="{{sub.Label}}">{{sub.Title}}</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div id="treatment-tab">
            <form action="/home/sphinxsearch" method="GET" class="b-form b-form_search-acticle">
                <input type="hidden" name="type" value="natureheals"/>
                <label class="b-form_search-acticle__item">
                    <span class="b-form__label">Найти метод лечения:</span>
                    <input type="text" value="<%= Request["q"] %>" name="q" class="b-form__field">
                </label>
                <div class="b-form_search-acticle__item">
				    <input type="submit" value="найти" class="button">
			    </div>
            </form>
            <div class="b-middle clearFix">
                <div class="b-article-list clearFix js-article-list">
                    <ul data-ng-repeat="list in treatmentCategories" class="b-article-list__item">
                        <li data-ng-repeat="category in list">
                            <span class="b-article-list__item__name b-article-list__item__door js-article-list-door">
                                <span><a href="{{category.Label}}">{{category.Title}}</a></span>
                                <i data-ng-show="category.Sub.length > 0" class="b-arrow b-article-list__item__arrow"></i>
                            </span>
                            <ul class="b-article-list__item__sub js-article-list-sub">
                                <li data-ng-repeat="option in category.Sub">
                                    <a href="{{option.Label}}">{{option.Title}}</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ID="Scripts" ContentPlaceHolderID="ScriptsContent">
    <script src="/Scripts/angular.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function() {
            if (document.location.hash == '#treatments') {
                $("#treatments-tab").click();
            }
        });

        function HealsCtrl($scope, $http) {
            //получение методов лечения
            $http({ method: 'POST', url: '/ajax/gettreatmentoptions' }).
                success(function (data, status, headers, config) {
                    $scope.treatmentCategories = data;
                });

            //получение лечебных факторов
            $http({ method: 'POST', url: '/ajax/gethealthfactors' }).
                success(function (data, status, headers, config) {
                    $scope.healthFactors = data;
                });

            $scope.checkSubItem = function (item, query) {
                for (var i = 0; i < item.Sub.length; i++) {
                    if (item.Sub[i].Title.toLowerCase().indexOf(query.toLowerCase()) != -1) {
                        return true;
                    }
                }
                return false;
            };
        }
    </script>
</asp:Content>
