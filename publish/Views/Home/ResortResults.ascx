<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bewell.Models.ViewModels.SearchViewModel>" %>
<%@ Import Namespace="System.Web.Mvc.Html" %>
<%@ Import Namespace="bewell.Models.ViewModels" %>

<% 
    var resultsModel = (EntityListViewModel) ViewBag.Results;
    var suggestedResultsModel = (EntityListViewModel)ViewBag.SuggestedResults; 
%>

<div class="frame b-search-info">
    Найдено курортов: <span class="b-search-info__num"><%= resultsModel.TotalCount %></span>
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
    <% if (resultsModel.Results.Any()) { 
           int counter = 0;
           foreach (EntityViewModel resort in resultsModel.Results)
           {
               if (resort.Terriotry != null)
               {
                   var hierarchy = resort.Terriotry.GetTerritoryHierarchy();
                   Model.RootTerritoryId = hierarchy[0];
                   Model.TerritoryId = hierarchy[1];
                   Model.SubTerritoryId = hierarchy[2];
               }

               Model.ResortId = resort.Entity.id; 
    %>
           <div class="b-search-obj__item">
               <div class="b-search-obj__item__head">
                
                    <h2><a href="<%= resort.EntityUrl %>"><%= resort.Title %></a></h2>
            
                    <% if (!string.IsNullOrEmpty(resort.EntityMap.GeoLocationCoordinates)) { %>
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
                                        <h2>Курорт “<%= resort.Title %>” на карте</h2>

                                        <div class="on-map">
                                            <% ViewBag.ZoomMap = 8;
                                               ViewBag.IndexMap = counter;
                                               Html.RenderPartial("Widgets/Map", resort.EntityMap); %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>

                <div class="b-search-obj__item__in">
                    <div class="b-search-obj__item__in__img">
                        <img src="<%= resort.ListImageUrl %>" alt="<%= resort.Title %>" />
                        <a href="<%: Url.Action("hotelsearch", "home", Model) %>" class="b-search-obj__holet-link button">Показать отели</a>
                    </div>
                    <div class="b-search-obj__item__in__content">
                        <dl class="b-search-obj__info">
                            <% Html.RenderPartial("Fieldsets", resort.FieldSet.Fields, new ViewDataDictionary {{"Id", resort.Entity.id}, {"ProtoName", resort.Entity.ProtoName}}); %>
                        </dl>
                        <% if (!string.IsNullOrEmpty(resort.EntityMap.GeoLocationCoordinates)) { %>
                           <div class="b-search-obj__weather">
                            <span class="b-search-obj__weather__door" data-id="<%= resort.Entity.id %>" data-lat="<%= resort.EntityMap.GetLatitude() %>" data-lon="<%= resort.EntityMap.GetLongitude() %>">Погода на курорте</span>
                            <div class="b-search-obj__weather__content" id="weather-content-<%= resort.Entity.id %>">
                                <div class="b-search-obj__weather__content__icon">
                                    <span id="temperature-<%= resort.Entity.id %>">н/д</span>
                                    <img id="weather-icon-<%= resort.Entity.id %>" src="" alt="" />
                                </div>
                                 <div id="weather-description-<%= resort.Entity.id %>">н/д</div>
                                <span id="pressure-<%= resort.Entity.id %>">н/д</span> мм. рт.ст. 
                                Влажность: <span id="humidity-<%= resort.Entity.id %>">н/д</span>%
                                Ветер: <span id="wind-<%= resort.Entity.id %>">н/д</span>м/с
                            </div>
                        </div>
                        <% } %>
                
                    </div>
                </div>
            </div>
        <%++counter;}  
    }
    else if (suggestedResultsModel != null && suggestedResultsModel.TotalCount > 0)
    { %>
    <span>По вашему запросу курортов не найдено. Выбранный профиль лечения эффективно лечат на следующих курортах:</span>
    <div>
        <ul class="b-obj-info__list-ul">
        <% foreach (EntityViewModel resort in suggestedResultsModel.Results) { %>
            <li><a href="<%= resort.EntityUrl %>"><%= resort.Title %></a></li>
        <% } %>
        </ul>
    </div>
    <% } else { %><span>По вашему запросу курортов не найдено</span><% } %>
</div>

<% Html.RenderPartial("Widgets/InfoBanner", new InfoBannerViewModel()); %>

<% if (resultsModel.PagesCount > 1)
   {
       Html.RenderPartial("Widgets/Pager", new { resultsModel.PagesCount, resultsModel.Page });
   }
%>

<script type="text/javascript">
    //для кэширование результатов запроса
    var localCache = [];

    function updateWeather(id, data) {
        //преобразование температуры из кельвинов в градусы
        var temperature = parseInt(data.main.temp - 273.15);
        //преобразование давление из гектопаскалей в мм. рт. ст.
        var pressure = parseInt(data.main.pressure * 0.75006375541921);
        $("#temperature-" + id).html((temperature > 0 ? "+ ":"") + temperature);
        $("#weather-description-" + id).html(data.weather[0].description);
        $("#weather-icon-" + id).attr("src", 'http://openweathermap.org/img/w/' + data.weather[0].icon + '.png');
        $("#pressure-" + id).html(pressure);
        $("#humidity-" + id).html(data.main.humidity);
        $("#wind-" + id).html(data.wind.speed);
    }

    $(function () {
        $(".b-search-obj__weather__door").on("click", function () {
            var id = $(this).data("id");
            var lat = $(this).data("lat");
            var lon = $(this).data("lon");

            if (localCache[id]) {
                updateWeather(id, localCache[id]);
                $("#weather-content-" + id).toggle();
            } else {
                $.ajax({
                    url: 'http://api.openweathermap.org/data/2.5/weather',
                    data: { lat: lat, lon: lon, cnt: 1, lang: 'ru' },
                    type: 'GET',
                    success: function (data) {
                        localCache[id] = data;
                        updateWeather(id, data);
                        $("#weather-content-" + id).toggle();
                    }
                });
            }
        });
    });
</script>