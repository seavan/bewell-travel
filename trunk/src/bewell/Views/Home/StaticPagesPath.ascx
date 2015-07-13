<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<System.Collections.Generic.Dictionary<string,string>>" %>
<% var keys = Model.Keys.Reverse(); %>

<ul class="b-path">
	<li><a href="/">Главная</a></li>
    <% foreach (var key in keys)
       { %>
       <li>
           <% if (string.IsNullOrEmpty(Model[key]))
              { %>
                <%= key %>
           <% }
              else
              { %>
                <a href="<%= Model[key] %>"><%= key %></a>
           <% } %>
           
       </li>
    <% } %>
</ul>