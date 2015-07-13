<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<string>" %>

<%if(Model.Contains("|")) {%>
<a href="<%: Model.Split('|')[0] %>" target="_blank"><%: Model.Split('|')[1] %></a>
<%}else{%>
<a href="<%: Model %>" target="_blank"><%:Model %></a>
<%}%>
