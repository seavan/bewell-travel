<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<System.Collections.Generic.Dictionary<string,IEnumerable<meridian.bewell.proto.properties>>>" %>

<% if (Model.Any())
{ %>
    <% foreach (var key in Model.Keys)
       { %>
        <div class="b-obj-info__item">
            <h2 class="title"><%= key %></h2>
           
            <ul class="b-obj-info__list-ul">
            <% foreach (var value in Model[key])
            { %>
                <li><%= value.title %></li>  
            <% } %>
            </ul>
        </div>
        <% } %>
<% } %>
				