<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<meridian.bewell.proto.resorts>" %>
<% if (Model.cure_profiles_items.Any())
   {
       var half = Convert.ToInt32(Math.Ceiling(Model.cure_profiles_items.Count / 2.0));
%>
    <h2 class="title">Основные </h2>
    <ul class="b-obj-info__list-ul">
        <% for (int i = 0; i < half; i++)
           { %>
        <li>
            <%= Model.cure_profiles_items[i].title %></li>
        <% } %>
    </ul>
    <ul class="b-obj-info__list-ul">
        <% for (int i = half; i < Model.cure_profiles_items.Count; i++)
           { %>
        <li>
            <%= Model.cure_profiles_items[i].title%></li>
        <% } %>
    </ul>
<% } %>

<% if (Model.ad_cure_profiles_items.Any())
   {
       var half = Convert.ToInt32(Math.Ceiling(Model.ad_cure_profiles_items.Count / 2.0));
%>
    <h2 class="title">Сопутствующие </h2>
    <ul class="b-obj-info__list-ul">
        <% for (int i = 0; i < half; i++)
           { %>
        <li>
            <%= Model.ad_cure_profiles_items[i].title %></li>
        <% } %>
    </ul>
    <ul class="b-obj-info__list-ul">
        <% for (int i = half; i < Model.ad_cure_profiles_items.Count; i++)
           { %>
        <li>
            <%= Model.ad_cure_profiles_items[i].title%></li>
        <% } %>
    </ul>
<% } %>