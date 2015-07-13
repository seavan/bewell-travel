<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bewell.Models.ViewModels.EntityListViewModel>" %>

<% if (Model.Results.Any())
   { %>
   <dl class="b-info b-info__recomend b-info__recomend_col">
    <dt class="title">BeWell рекомендует</dt>
    <dd class="clearFix">
        <% foreach (var entity in Model.Results)
           { %>
            <div class="b-info__recomend__item">
                <a href="<%= entity.EntityUrl %>">
                    <img src="<%= entity.ListImageUrl %>" alt="">
                    <%= entity.Title %>
                </a>
            </div>
        <% } %>
       
       <% if (!string.IsNullOrEmpty(ViewBag.ShowAll))
          { %>
          <div class="b-info__recomend__link">
               <a href="<%= ViewBag.ShowAll %>" class="button">Показать все</a>
          </div>
       <% } %>
    </dd>
</dl>
<% } %>


