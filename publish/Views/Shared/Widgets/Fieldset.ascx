<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bewell.Models.ViewModels.EntityViewModel>" %>
<% if (Model.FieldSet != null && Model.FieldSet.Fields.Any())
   {
       foreach (var field in Model.FieldSet.Fields)
       {
           if (string.IsNullOrEmpty(field.Controller) && string.IsNullOrEmpty(field.Action) && !string.IsNullOrEmpty(field.Value))
           { %>
            <div class="b-obj-info__item">
                <h2 class="title">
                    <%= field.Title %></h2>
                <%= field.Value %>
            </div>
        <% } 
           if (!string.IsNullOrEmpty(field.Controller) && !string.IsNullOrEmpty(field.Action))
           {
               var html = Html.Action(field.Action, field.Controller, new { Model.Entity.id, protoName = Model.Entity.ProtoName }).ToHtmlString();

               if (!string.IsNullOrEmpty(html))
               { %>
                <div class="b-obj-info__item">
                    <h2 class="title">
                        <%= field.Title %></h2>
                    <%= html %>
                </div>
            <% } %>
        <% } %>
    <% } %>
<% } %>