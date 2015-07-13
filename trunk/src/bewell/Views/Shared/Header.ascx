<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<div class="b-head widthSite">
    <a href="/" class="b-head__logo">
        <img src="/Content/i/head_logo.png" alt="Bewell Medispa & wellnes" />
    </a>
    <%
        NameValueCollection queryCollection = HttpUtility.ParseQueryString(Request.Url.Query);
        Html.RenderAction("Search", "Home", new { cureProfileId = queryCollection["CureProfileId"], territoryId = queryCollection["TerritoryId"] });
     %>
    <!---search-site-->
    <form class="b-head__search-site" action="/home/sphinxsearch">
    <input type="text" value="<%= Request["q"] %>" name="q" id="q" placeholder="поиск по сайту" class="b-head__search-site__input" />
    <input type="submit" value="Поиск" class="b-head__search-site__button" />
    </form>
    <!---/search-site-->
    <ul class="b-head__menu">
        <li><a href="/about">О компании</a></li>
        <li><a href=/contacts>Контакты</a></li>
        <li><a href="/map">Карта проезда</a></li>
    </ul>
    <ul class="b-head__social">
        <li><a href="https://www.facebook.com/pages/Be-Well/190159984519523" title="facebook">&#228;</a></li>
        <li><a href="https://vk.com/id235442885" title="vkontakte">&#230;</a></li>
        <li><a href="http://www.odnoklassniki.ru/profile/571664488207" title="odnoklassniki">&#233;</a></li>
        <li><a href="https://plus.google.com/u/2/100178103567608927863/posts/p/pub" title="googleplus">&#232;</a></li>
    </ul>
    <ul class="b-head__links">
        <li class="b-head__links__mail"><a href="mailto:info@bewell-travel.ru">info@bewell-travel.ru</a></li>
        <li class="b-head__links__map">+7 (499) 215-35-35&nbsp;&nbsp;<a href="javascript:void(0);" class="js-popup-callme-door">Перезвоните мне</a></li>
    </ul>
</div>
<% Html.RenderAction("CallMe", "Home"); %>
