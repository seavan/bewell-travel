<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<% Html.RenderAction("SitemapMenu", "Home"); %>
<div class="b-foot">
    <div class="widthSite">
        <div class="b-foot__copy">
            <p class="footer__select__text">
                &copy;&nbsp;Bewell 2013</p>
            <p>
                Все права на материалы, размещенные на сайте, охраняются в соответствии с законодательством
                РФ и международным правом, в том числе, об авторском праве и смежных правах.</p>
        </div>
        <div class="b-foot__contact">
            <div class="b-foot__contact__item">
                звоните<br />
                <span class="footer__select__text">8 (495) 123 45 67</span></div>
            <div class="b-foot__contact__item">
                пишите<br />
                <a href="mailto:info@bewell-travel.ru">info@bewell-travel.ru</a></div>
        </div>
    </div>
</div>
