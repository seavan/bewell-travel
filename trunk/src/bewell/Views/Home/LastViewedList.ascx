<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bewell.Models.ViewModels.EntityListViewModel>" %>

<% if (Model.Results.Any())
   { %>
   <dl class="b-info b-info__recomend b-info__recomend_col">
    <dt class="title">Вы смотрели</dt>
    <dd class="clearFix">
        <% foreach (var entity in Model.Results)
           { %>
            <div class="b-info__recomend__item">
                <a href="<%= entity.EntityUrl %>">
                    <img src="<%= entity.ListImageUrl %>" alt="" width="140">
                    <%= entity.Title %>
                </a>
                
                <% if (entity.Stars > 0)
                   { %>
                    <div><span class="stars stars__<%=entity.Stars %>"><%=entity.Stars%></span></div>
                <% }
                   else if (entity.BewellStars > 0)
                   { %>
                    <div><span class="bewell-stars bewell-stars__<%=entity.BewellStars %>"><%=entity.BewellStars%></span></div>
                <% } %>
            </div>
        <% } %>
    </dd>
</dl>
<% } %>

