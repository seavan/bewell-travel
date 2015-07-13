<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Mail.Master" Inherits="System.Web.Mvc.ViewPage<bewell.Models.ViewModels.Mail.OrderRequestViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MessageContent" runat="server">
<div>
    Запрос на бронирование <%= Model.ProtoName == "hotels" ? " отеля" : " курорта" %> (<a href="<%= Model.Link %>"><%= Model.EntityTitle %></a>)
</div>
<table>
    <tr>
        <td>Имя:</td>
        <td><%= Model.FirstName %></td>
    </tr>
    <tr>
        <td>Фамилия:</td>
        <td><%= Model.LastName %></td>
    </tr>
    <tr>
        <td>Период проживания</td>
        <td><%= Model.FromDate.ToString("dd.MM.yyyy") %> по <%= Model.ToDate.ToString("dd.MM.yyyy")%></td>
    </tr>
    <tr>
        <td>Email</td>
        <td><%= Model.Email %></td>
    </tr>
    <tr>
        <td>Телефон</td>
        <td><%= Model.Phone %></td>
    </tr>
</table>

</asp:Content>
