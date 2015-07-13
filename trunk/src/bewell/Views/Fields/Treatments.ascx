<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<meridian.bewell.proto.treatment_options>>" %>

<% if (Model.Any())
   {
       var half = Convert.ToInt32(Math.Ceiling(Model.Count/2.0));
%>
    <ul class="b-obj-info__list-ul">
    <% for (int i = 0; i < half; i++)
       { %>
            <li><%= Model[i].title %></li>  
     <% } %>
     </ul>
     <ul class="b-obj-info__list-ul">
     <% for (int i = half; i < Model.Count; i++)
        { %>
            <li><%= Model[i].title %></li>  
     <% } %>  
     </ul>
<% } %>