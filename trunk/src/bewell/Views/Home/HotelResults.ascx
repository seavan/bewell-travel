<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bewell.Models.ViewModels.SearchViewModel>" %>
<%@ Import Namespace="bewell.Models.ViewModels" %>

<% var resultsModel = (EntityListViewModel) ViewBag.Results; %>

<div class="frame b-search-info">
	Найдено отелей: <span class="b-search-info__num"><%= resultsModel.TotalCount%></span>
	<span class="b-search-info__on-page">
		Выводить на странице: 							
		<select class="b-search-info__on-page__select" id="selector_count">
        <%
            int pageSize = Request.QueryString["pageSize"] != null
                                ? Convert.ToInt32(Request.QueryString["pageSize"])
                                : bewell.common.Constants.PageSize;
                            
            foreach (int count in bewell.common.Constants.PageSizes)
            {
                string selected = count == pageSize ? "selected" : string.Empty;
                %>
                <option value="<%= count %>" <%= selected %>><%= count %></option>
        <% } %>
        </select>
	</span>
</div>

<div class="b-search-obj">
	<% int counter = 0;
     foreach (EntityViewModel hotel in resultsModel.Results) { %>
       <div class="b-search-obj__item">
		<div class="b-search-obj__item__head">
			<h2>
				<a href="<%= hotel.EntityUrl %>"><%= hotel.Title %></a>
                <% if (hotel.Stars > 0)
                   { %>
                    <span class="stars stars__<%=hotel.Stars %>"><%=hotel.Stars %></span>
                <% } else if (hotel.BewellStars > 0)
                   { %>
                    <span class="bewell-stars bewell-stars__<%=hotel.BewellStars %>"><%=hotel.BewellStars %></span>
                <% } %>
			</h2>

            <% if (!string.IsNullOrEmpty(hotel.EntityMap.GeoLocationCoordinates)) { %>
            <div class="b-search-obj__map-door js-popup-map-door">
                <span>Показать на карте</span>
            </div>
            <div class="popup popup_map js-popup js-popup-map">
                <div class="popup__table">
                    <div class="popup__table__cell">
                        <div class="popup__content">
                            <div class="popup__close js-popup-close" title="Закрыть">
                                Закрыть</div>
                            <div class="popup__content__in b-content">
                                <h2>Курорт “<%= hotel.Title %>” на карте</h2>
                                <div class="on-map">
                                    <% ViewBag.ZoomMap = 14;
                                       ViewBag.IndexMap = counter;
                                       Html.RenderPartial("Widgets/Map", hotel.EntityMap); %></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
			
		</div>
		<div class="b-search-obj__item__in">
			<div class="b-search-obj__item__in__img">
			    <img src="<%=hotel.ListImageUrl %>" alt="<%=hotel.Title %>" />
			</div>
			<div class="b-search-obj__item__in__content">
				<dl class="b-search-obj__info">
				    <% Html.RenderPartial("Fieldsets", hotel.FieldSet.Fields, new ViewDataDictionary { { "Id", hotel.Entity.id }, { "ProtoName", hotel.Entity.ProtoName } }); %>
				</dl>
			</div>
		</div>
    </div>
    <% ++counter;
     } %>
</div>

<% Html.RenderPartial("Widgets/InfoBanner", new InfoBannerViewModel()); %>

<% if (resultsModel.PagesCount > 1)
   {
       Html.RenderPartial("Widgets/Pager", new { resultsModel.PagesCount, resultsModel.Page });
   }
%>