<%@ Page Title="Title" Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>"
    MasterPageFile="~/Views/Shared/MainOneCol.Master" %>

<asp:Content runat="server" ID="Slider" ContentPlaceHolderID="SliderContent">
</asp:Content>
<asp:Content runat="server" ID="Main" ContentPlaceHolderID="MainContent">
    <ul class="b-path">
        <li><a href="/">Главная</a></li>
        <li>Показания к лечению</li>
    </ul>
    <h1>Показания к лечению</h1>
    
    <div class="js-tabs-content" data-ng-app data-ng-controller="CuresCtrl">
        <div id="heal-tab" class="js-tabs-active">
            <form action="/home/sphinxsearch" method="GET" class="b-form b-form_search-acticle">
                <input type="hidden" name="type" value="treatments"/>
                <label class="b-form_search-acticle__item">
                    <span class="b-form__label">Найти профиль лечения/заболевание:</span>
                    <input type="text" name="q" value="<%= Request["q"] %>" class="b-form__field"/>
                </label>
                <div class="b-form_search-acticle__item">
				    <input type="submit" value="найти" class="button">
			    </div>
            </form>
            <div class="b-middle clearFix">
                <div class="b-article-list clearFix js-article-list">
                    <ul data-ng-repeat="list in cureProfiles" class="b-article-list__item">
                        <li data-ng-repeat="cure in list">
                            <span class="b-article-list__item__name b-article-list__item__door js-article-list-door">
                                <span><a href="{{cure.Label}}">{{cure.Title}} </a></span>
                                <i data-ng-show="cure.Sub.length > 0" class="b-arrow b-article-list__item__arrow"></i>
                            </span>
                            <ul class="b-article-list__item__sub js-article-list-sub" data-ng-show="test > 0">
                                <li data-ng-repeat="sub in cure.Sub">
                                    <a href="{{sub.Label}}">{{sub.Title}}</a>
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
        function CuresCtrl($scope, $http) {
            //получение профилей лечения
            $http({ method: 'POST', url: '/ajax/getcureprofileslist' }).
                success(function (data, status, headers, config) {
                    $scope.cureProfiles = data;
                });

            $scope.cureSearch = function (item) {
                if (item.Title.toLowerCase().indexOf($scope.search.toLowerCase()) != -1 || $scope.checkSubItem(item, $scope.search.toLowerCase())) {
                    return true;
                }
                return false;
            };

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