<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<string>" %>
<%
    var fname = ViewData.TemplateInfo.GetFullHtmlFieldName(string.Empty);
     %>

<div style="float: right">

    <% if (String.IsNullOrEmpty(Model))
       {%>
    изображение отсутствует
    <%
   }
       else
       {
    %>
    <img src="/Content/images/<%= Model %>" alt style="border: 1px solid black; width: 300px"/>
    <input type="hidden" name="<%= fname %>" value="<%= Model %>" />
    <%
   }%>
</div>
<div>
    <span>Загрузить изображение: </span>
    <%= Html.Telerik().Upload()
    .Name(fname)
    .Multiple(false)


     %>
</div>
<div><a class="_link _removeImage" rel="<%= fname %>">удалить изображение</a></div>
