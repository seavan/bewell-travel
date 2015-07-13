<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<meridian.bewell.proto.hotels>>" %>

<% if (Model.Any())
   { %>
<dl class="b-info__recomend fl_l">
    <dt><span class="title">BeWell рекомендует</span>
    </dt>
    <dd class="clearFix">
        <% foreach (var hotel in Model)
           { %>
            <div class="b-info__recomend__item">
                <a href="<%= hotel.EntityUri().ToString() %>">
                    <img src="<%= hotel.GetListImage() %>" alt="<%= hotel.title %>" />
                    <%= hotel.title %>
                </a>
                <% if (hotel.stars > 0)
                   { %>
                    <span class="stars stars__<%=hotel.stars %>"><%=hotel.stars %></span>
                <% } else if (hotel.GetHotelsHotel_classe() != null && hotel.GetHotelsHotel_classe().stars > 0)
                   { %>
                    <span class="bewell-stars bewell-stars__<%=hotel.GetHotelsHotel_classe().stars %>"><%=hotel.GetHotelsHotel_classe().stars%></span>
                <% } %>
            </div>
        <% } %>
    </dd>
</dl>
<% } %>
