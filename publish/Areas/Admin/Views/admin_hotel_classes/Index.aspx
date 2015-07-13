
<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" UICulture="ru-RU" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
            <div style="text-align: right; float: right">
            <a class="_link" href="/admin/admin_hotel_classes/Single">Создать</a></div>
    <%=
        Html.Partial("hotel_classes_grid", ViewData) %>

</asp:Content>
