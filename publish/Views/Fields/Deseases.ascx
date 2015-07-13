<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<System.Collections.Generic.Dictionary<string,System.Collections.Generic.IEnumerable<meridian.bewell.proto.ILookupValue>>>" %>

<% foreach (var cureProfile in Model.Keys)
   { %>
   <h2 class="title"><%= cureProfile %></h2>
   <ul class="b-obj-info__list-ul">
       <% foreach (var desease in Model[cureProfile])
           { %>
       <li>
           <%= desease.title %></li>
       <% } %>
   </ul>
<% } %>