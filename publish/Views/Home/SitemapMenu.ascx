<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bewell.Models.ViewModels.SiteMapMenuViewModel>" %>
<%@ Import Namespace="bewell.Models.ViewModels" %>

<!---->
<div class="b-map js-slide-toggle">
    <div class="b-map__door">
        <div class="widthSite">
            <span class="b-map__door__in js-slide-toggle-door">
				<i class="b-arrow b-map__door__arrow"></i>
				<span>карта сайта</span>
			</span>
        </div>
    </div>
    <div class="b-map__content js-slide-toggle-content">
        <div class="b-map__content__bottom">
            <div class="widthSite">
                <!--b-map__content-->
                <div class="b-map__content__in clearFix">
                    <div class="b-map__content__col b-map__content__col_center fl_l">
                        <dl class="b-map__content__item">
                            <dt class="title"><a href="<%: Url.Action("index", "natureheals") %>">Методы лечения</a></dt>
                            <dd class="clearFix">
                                <% foreach (var treatmentList in Model.TreatmentOptions)
                                   { %>
                                    <div class="b-map__content__col fl_l b-map__content__col_new">
                                        <ul class="b-map__content__item__list">
                                            <% foreach (var treatment in treatmentList)
                                               { %>
                                                <li><a href="<%= treatment.EntityUri() %>"><%= treatment.title %></a></li>
                                            <% } %>
                                        </ul>
                                    </div>
                                <% } %>
                            </dd>
                        </dl>
                        <dl class="b-map__content__item">
                            <dt class="title"><a href="<%: Url.Action("index", "natureheals") %>">Лечебные факторы</a></dt>
                            <dd class="clearFix">
                                <% foreach (var healthFactorsList in Model.HealthFactors)
                                   { %>
                                    <div class="b-map__content__col fl_l b-map__content__col_new">
                                        <ul class="b-map__content__item__list">
                                            <% foreach (var healthFactor in healthFactorsList)
                                               { %>
                                                <li><a href="<%= healthFactor.EntityUri() %>"><%= healthFactor.title%></a></li>
                                            <% } %>
                                        </ul>
                                    </div>
                                <% } %>
                            </dd>
                        </dl>
                    </div>
                </div>
                <!--/b-map__content-->
            </div>
        </div>
    </div>
</div>
<!--/-->
