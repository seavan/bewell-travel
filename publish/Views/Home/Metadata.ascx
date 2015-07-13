<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<meridian.bewell.proto.seo_metadata>" %>

<% if (Model != null) { %>
   <title><%= Model.title %></title>
   <meta name="keywords" content="<%= Model.keywords %>" />
   <meta name="description" content="<%= Model.description %>" />
<% } %>
