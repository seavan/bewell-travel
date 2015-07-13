<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<div class="adminMenuLeft menu" style="line-height: 23px; ">
    <div><b>Справочники</b></div>
    <a href="/admin/admin_territories">Территории</a> 
    <a href="/admin/admin_territory_categories">Категории территорий</a> 
    <%--<a href="/admin/admin_regions">Регионы</a> 
    <a href="/admin/admin_resort_zones">Зоны отдыха</a> --%>
    <%--<a href="/admin/admin_fieldsets">Категории значений справочника</a> 
    <a href="/admin/admin_entity_fields">Поля категорий значений справочника</a> --%>
    <hr/>
    <a href="/admin/admin_treatment_options">Методы лечения</a> 
    <a href="/admin/admin_cure_profiles">Профили лечения</a> 
    <a href="/admin/admin_deseases">Заболевания</a>
    <a href="/admin/admin_health_factors">Природные лечебные факторы</a> 
    <hr/>
    <a href="/admin/admin_resorts">Курорты</a> 
    <a href="/admin/admin_comments?type=resort">Отзывы</a>
    <%--<a href="/admin/admin_resort_zones">Курортные зоны</a> --%>
    <hr/>
    <a href="/admin/admin_hotels">Отели</a> 
    <a href="/admin/admin_properties">Свойства отелей</a> 
    <a href="/admin/admin_property_categories">Категории свойств отелей</a>
    <a href="/admin/admin_hotel_classes">Классы отелей</a> 
    <a href="/admin/admin_comments?type=hotel">Отзывы</a>
    <hr/>
    <%--<a href="/admin/admin_countries">Страны</a> 
    <hr/>--%>
    <a href="/admin/admin_news_categories">Категории новостей</a> 
    <a href="/admin/admin_news">Новости</a>
    <hr/>
    <a href="/admin/admin_dictionary">Курортный словарь</a> 
    <hr/>
    <a href="/admin/admin_pages">Статические страницы</a> 
    <a href="/admin/admin_citations">Цитаты</a> 
    <a href="/admin/admin_questions">Вопросы и Ответы</a> 
    <hr/>
    <a href="/admin/admin_seo_metadata">SEO метаданные</a> 
</div>
