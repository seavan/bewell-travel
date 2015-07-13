<%@ Page Title="Title" Language="C#" Inherits="System.Web.Mvc.ViewPage<bewell.Models.ViewModels.SearchViewModel>" MasterPageFile="~/Views/Shared/Main.Master" %>
<asp:Content runat="server" ID="Styles" ContentPlaceHolderID="HeadContent"></asp:Content>

<asp:Content runat="server" ID="Main" ContentPlaceHolderID="MainContent">
<ul class="b-path">
	<li><a href="#">Главная</a></li>
	<li>Показания к лечению</li>
</ul>
<h1>показания к лечению</h1>
<!--b-illness-->
<div class="b-illness js-illness-box" data-ng-app data-ng-controller="CureProfilesCtrl">
    <ul class="b-illness__tabs-sex js-tabs">
		<li class="js-tabs-item item-gender b-active" data-ng-click="setGender('Мужчина')"><span>Мужчина</span></li>
		<li class="js-tabs-item item-gender" data-ng-click="setGender('Женщина')"><span>Женщина</span></li>
	</ul>
	<div class="b-illness__middle clearFix">
		<div class="b-illness__middle__left fl_l">
			<div class="b-illness__img b-illness__img_{{gender.css}}">
				<div id="js-img-box" class="{{cureInfo.imageClass}}">
					<div class="b-illness__img__text js-img-box-text" id="js-img-box-text">{{cureInfo.title}}</div>
				</div>
			</div>
		</div>
		<div class="b-illness__middle__content fl_r">
			<div class="b-illness__frame">
				<ul class="b-illness__frame__tabs js-tabs js-tabs-illness">
					<li class="b-active js-tabs-item" data-tab="main-deseases"><span>основное заболевание</span></li>
					<li class="js-tabs-item" data-tab="additional-deseases"><span>сопутствующее заболевание</span></li>
				</ul>
				<div class="b-illness__frame__tabs-in">
					<div class="b-illness__frame__tabs-in__scroll js-tabs-content">
					    <ul class="b-illness__list js-tabs-active" id="main-deseases">
                            <li data-ng-repeat="profile in cureProfiles" data-ng-show="profile.gender == gender.title || profile.gender == 'Не важно'"><span class="b-illness__list__group js-popup-illness-door" data-ng-mouseover="setCurrentProfile(profile)" data-ng-mouseleave="resetCureProfile()" data-ng-click="showPopup(profile.id, 'main', profile)">{{profile.title}}</span></li>
                        </ul>
                        <ul class="b-illness__list" id="additional-deseases">
                            <li data-ng-repeat="profile in cureProfiles" data-ng-show="profile.gender == gender.title || profile.gender == 'Не важно'"><span class="b-illness__list__group js-popup-illness-door" data-ng-mouseover="setCurrentProfile(profile)" data-ng-mouseleave="resetCureProfile()" data-ng-click="showPopup(profile.id, 'additional', profile)">{{profile.title}}</span></li>
                        </ul>
					</div>
				</div>
			</div>
			<div class="b-illness__selected js-select-illness-view">
			    <% Html.BeginForm("resortsearch", "home", FormMethod.Get, new { id = "searchForm" }); %> 
                    <input type="hidden" name="CureProfileId" value="{{cureId}}"/>
                    <input type="hidden" name="AdditionalCureProfileId" value="{{additionalDesease.cureProfileId}}"/>
                    <div data-ng-show="mainDesease || additionalDesease">
                        <h2>Вы выбрали заболевания:</h2>
                        <div>
				            <dl class="b-illness__selected__list b-empty js-select-illness-group main-group" data-ng-show="mainDesease">
					            <dt>Основные:</dt>
					            <dd class="js-select-illness-list">
                                    <input type="hidden" name="DeseaseId" value="{{mainDesease.id}}"/>
                                    <span class="b-illness__selected__list__item js-select-illness-list-item"><span>{{mainDesease.title}}</span><i class="b-illness__selected__list__item__del js-item-del" data-ng-click="removeDesease('main')">x</i></span>
					            </dd>
				            </dl>
                        </div>
                        <div>
				            <dl class="b-illness__selected__list b-empty js-select-illness-group additional-group" data-ng-show="additionalDesease">
					            <dt>Сопутствующие:</dt>
					            <dd class="js-select-illness-list">
                                    <input type="hidden" name="AdditionalDeseaseId" value="{{additionalDesease.id}}"/>
					                <span class="b-illness__selected__list__item js-select-illness-list-item"><span>{{additionalDesease.title}}</span><i class="b-illness__selected__list__item__del js-item-del" data-ng-click="removeDesease('additional')">x</i></span>
					            </dd>
				            </dl>
                        </div>
                    </div>
                    
                    <div data-ng-show="territory">
                        <h2>География:</h2>
                        <dl class="b-illness__selected__list js-select-illness-group">
					            <dt></dt>
					            <dd class="js-select-illness-list">
					                <input type="hidden" name="RootTerritoryId" value="{{territory.parent_id == 0 && territory.id || territory.parent_id}}" />
					                <input type="hidden" name="TerritoryId" value="{{territory.parent_id == 0 && '0' || territory.id}}" />
					                <span class="b-illness__selected__list__item js-select-illness-list-item"><span>{{territory.title}}</span><i class="b-illness__selected__list__item__del js-item-del"  data-ng-click="removeTerritory()">x</i></span>
					            </dd>
                        </dl>
                    </div>
			    <input type="submit" class="button js-select-illness-button" data-ng-show="territory || mainDesease || additionalDesease" value="подобрать курорт согласно выбраным показаниям к лечению" />
                <% Html.EndForm(); %>
			</div>
		</div>
	</div>
    <div class="darkness" id="desease-popup-darkness"></div>
    <div class="popup popup_illness js-popup js-popup-illness" id="desease-popup">
        <div class="popup__table">
	    <div class="popup__table__cell">
		    <div class="popup__content">
			    <div class="popup__close js-popup-close" title="Закрыть" data-ng-click="dismiss()">Закрыть</div>
			    <div class="popup__content__in b-content">
				    <h2>{{tempProfile.title}}</h2>
				    <div class="b-form js-select-illness-form">
					    <div class="b-form__scroll">
						    <ul class="b-form__list">
                                <li data-ng-repeat="desease in deseases"><label class="b-form__radio"><input type="radio" name="list" data-ng-click="setDesease(desease)"><span>{{ desease.title }}</span></label></li>
						    </ul>
					    </div>
					    <div class="b-form__button">
						    <input type="submit" value="выбрать" class="button" data-ng-click="closePopup()">
					    </div>
				    </div>
			    </div>
		    </div>
	    </div>
    </div>
    </div>
</div>
</asp:Content>

<asp:Content runat="server" ID="Scripts" ContentPlaceHolderID="ScriptsContent">
    <script src="/Scripts/angular.min.js" type="text/javascript"></script>
    
    <script type="text/javascript">
        function CureProfilesCtrl($scope, $http) {
            $scope.gender = { css: "man", title: "Мужчина" };
            $scope.cureInfo = { imageClass: "", title: "" };
            $scope.cureId = <%=Model.CureProfileId %>;
            $scope.territoryId = <%=Model.TerritoryId %>;
            $scope.tempProfile = null;
            $scope.originalProfile = null;


            //выбор пола
            $scope.setGender = function (gender) {
                $scope.gender.title = gender;
                $scope.gender.css = gender == "Мужчина" ? "man" : "woman";
            };

            //выбор текущего профиля
            $scope.setCurrentProfile = function (profile) {
                $scope.cureProfile = profile;
                $scope.cureInfo.imageClass = profile.css_class ? "b-illness__img__active " + profile.css_class : "";
                $scope.cureInfo.title = profile.title;
                $scope.cureId = profile.id;
            };
            
            //сброс профиля при mouseOver с элемента
            $scope.resetCureProfile = function () {
                $scope.setCurrentProfile($scope.initProfile);
            };

            //выбор заболевания
            $scope.setDesease = function(desease) {
                $scope.desease = desease;
            };

            //удаление заболевания
            $scope.removeDesease = function (type) {
                if (type == 'main') {
                    $scope.mainDesease = null;
                    $scope.initProfile = $scope.originalProfile;
                    $scope.setCurrentProfile($scope.initProfile);
                } else {
                    $scope.additionalDesease = null;
                }

            };

            //удаление территории
            $scope.removeTerritory = function() {
                $scope.territory = null;
            };

            //закрытие popup'a крестиком
            $scope.dismiss = function() {
                if ($scope.deseaseType == "main") {
                    $scope.initProfile = $scope.originalProfile;
                    $scope.setCurrentProfile($scope.initProfile);
                }
                
                $scope.deseases = [];
                $("#desease-popup-darkness").hide();
                $("#desease-popup").hide();
            };

            //открытие popup'a
            $scope.showPopup = function (id, type, currentProfile) {
                $scope.deseaseType = type;
                
                if (type == "main") {
                    $scope.originalProfile = $scope.initProfile;
                    $scope.initProfile = currentProfile;
                }
                
                $scope.tempProfile = currentProfile;
                
                $http.post('/ajax/getdeseases', { id: id }).
                    success(function (data, status, headers, config) {
                        $scope.deseases = data;
                        $("#desease-popup-darkness").show();
                        $("#desease-popup").show();
                    });
            };

            //нажатие кнопки "Выбрать" в popup'e
            $scope.closePopup = function () {
                if ($scope.deseaseType == "main") {
                    $scope.mainDesease = $scope.desease;
                    $scope.setCurrentProfile($scope.initProfile);
                } else {
                    $scope.additionalDesease = $scope.desease;
                }
                
                $scope.deseases = [];
                $scope.desease = null;
                $("#desease-popup-darkness").hide();
                $("#desease-popup").hide();
            };

            //получение территории, если была выбрана в поиске
            if ($scope.territoryId) {
                $http.post('/ajax/getterritory', { id: $scope.territoryId }).
                    success(function (data, status, headers, config) {
                        $scope.territory = data;
                    });
            }

            //получение профилей заболевания
            $http({ method: 'POST', url: '/ajax/getcureprofiles' }).
                success(function (data, status, headers, config) {
                    $scope.cureProfiles = data;
                    $scope.currentCureProfile = data[0];
                    for (var i = 0; i < data.length; i++) {
                        if (data[i].id == $scope.cureId) {
                            $scope.setCurrentProfile(data[i]);
                            $scope.initProfile = data[i];
                            $scope.originalProfile = data[i];
                            $scope.tempProfile = data[i];
                            break;
                        }
                    }

                    if ($scope.originalProfile != null) {
                        $scope.showPopup($scope.originalProfile.id, 'main', $scope.originalProfile);
                    }
                });
        }
    </script>
</asp:Content>
