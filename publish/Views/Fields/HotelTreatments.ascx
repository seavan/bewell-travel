<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<System.Collections.Generic.Dictionary<string,System.Collections.Generic.IEnumerable<meridian.bewell.proto.ILookupValue>>>" %>

<% foreach (var treatment in Model.Keys)
   { %>
   <h2 class="title"><%= treatment %></h2>
   <ul class="b-obj-info__list-ul">
       <% foreach (var sub in Model[treatment])
           { %>
       <li>
           <%= sub.title %></li>
       <% } %>
   </ul>
<% } %>