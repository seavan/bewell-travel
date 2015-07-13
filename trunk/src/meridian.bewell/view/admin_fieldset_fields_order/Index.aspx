
<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" UICulture="ru-RU" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
            <div style="text-align: right; float: right">
            <a class="_link" href="/admin_fieldset_fields_order/Single">Создать</a></div>
    <%=
        Html.Partial("fieldset_fields_order_grid", ViewData) %>

</asp:Content>
