
<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Admin.Master" Inherits="System.Web.Mvc.ViewPage<meridian.bewell.proto.comments>"
    ValidateRequest="false" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm())
       {
    %>
    <div class="_controlRow" style="margin-bottom: 12px">
        <input type="submit" value="Сохранить" />
        <div style="text-align: right; float: left">
            <a class="_link" href="/admin/admin_comments?type=<%: Model.proto_name == "hotels" ? "hotel" : "resort" %>">К списку</a></div>


    </div>
    <%= Html.EditorForModel()%>
    <div class="_controlRow">
        <input type="submit" value="Сохранить" />
        <div style="text-align: right; float: left">
            <a class="_link" href="/admin/admin_comments?type=<%: Model.proto_name == "hotels" ? "hotel" : "resort" %>">К списку</a></div>
    </div>
    <%
   } %>
</asp:Content>

