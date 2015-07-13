<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bewell.Models.ViewModels.ModalMessageViewModel>" %>

<%
    string visible = Model.IsVisible ? "display:block;" : "display:none";
%>

<div id="popup-message" class="popup js-popup" style="<%= visible %>">
    <div class="popup__table">
        <div class="popup__table__cell">
            <div class="popup__content" style="width:<%= Model.Width %>">
                <div class="popup__close js-popup-close" title="Закрыть">
                    Закрыть</div>
                <div class="popup__content__in b-content popup-message-content">
                    <h2 id="popup-message-title"><%= Model.Title %></h2>
                    <div>
                        <div id="popup-message-text">
                            <%= Model.Text %>
                        </div>
                    </div>
                    <% if (Model.ShowOkButton)
                       { %>
                           <div class="popup-button-container">
                               <div id="popup-ok-button" class=" button js-popup-close">Ок</div>
                           </div>
                    <% } %>
                </div>
                
            </div>
        </div>
    </div>
</div>

<div class="popup js-popup">
        <div class="popup__table">
	    <div class="popup__table__cell">
		    <div class="popup__content">
			    <div class="popup__close js-popup-close" title="Закрыть" data-ng-click="dismiss()">Закрыть</div>
			    <div class="popup__content__in b-content">
				    <h2 id="H1"><%= Model.Title %></h2>
				    <div class="b-form js-select-illness-form">
					    <div class="b-form__scroll">
						    <ul class="b-form__list">
                                <!-- ngRepeat: desease in deseases --><li data-ng-repeat="desease in deseases" class="ng-scope"><label class="b-form__radio"><input type="radio" name="list" data-ng-click="setDesease(desease)"><span class="ng-binding">Постинфекционные и реактивные артропатии</span></label></li><li data-ng-repeat="desease in deseases" class="ng-scope"><label class="b-form__radio"><input type="radio" name="list" data-ng-click="setDesease(desease)"><span class="ng-binding">Ревматоидный артрит</span></label></li><li data-ng-repeat="desease in deseases" class="ng-scope"><label class="b-form__radio"><input type="radio" name="list" data-ng-click="setDesease(desease)"><span class="ng-binding">Псориатическая артропатия</span></label></li><li data-ng-repeat="desease in deseases" class="ng-scope"><label class="b-form__radio"><input type="radio" name="list" data-ng-click="setDesease(desease)"><span class="ng-binding">Юношеский [ювенильный] артрит</span></label></li><li data-ng-repeat="desease in deseases" class="ng-scope"><label class="b-form__radio"><input type="radio" name="list" data-ng-click="setDesease(desease)"><span class="ng-binding">Идиопатическая подагра</span></label></li>
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



<div class="darkness" style="<%= visible %>"></div>