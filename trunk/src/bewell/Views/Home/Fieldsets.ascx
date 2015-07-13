<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<System.Collections.Generic.List<meridian.bewell.impl.Classes.FieldInfo>>" %>

<% foreach (var field in Model)
{
    if (!string.IsNullOrEmpty(field.Controller) && !string.IsNullOrEmpty(field.Action))
    {
        var html = Html.Action(field.Action, field.Controller, new {id = ViewBag.Id, protoName = ViewBag.ProtoName}).ToHtmlString();
        if (!string.IsNullOrEmpty(html))
        { %>
            <dt class="title"><%= field.Title %></dt>
            <dd>
                <%= html %>
            </dd>
        <% }
    }
    else
    { %>
        <dt class="title"><%= field.Title %></dt>
            <dd>
                <%= field.Value %>
            </dd>
    <% } %>
<% } %>