<%@ Page Title="Title" Language="C#" Inherits="System.Web.Mvc.ViewPage<meridian.bewell.proto.news>" MasterPageFile="~/Views/Shared/Main.Master" %>
<%@ Import Namespace="meridian.bewell.impl.Classes" %>

<asp:Content runat="server" ID="Slider" ContentPlaceHolderID="SliderContent"></asp:Content>
<asp:Content runat="server" ID="Main" ContentPlaceHolderID="MainContent">
    <% var category = Model.GetNewsNews_categorie(); %>
    <ul class="b-path">
        <li><a href="/">Главная</a></li>
        <li><a href="<%: Url.Action("index", "news") %>">Новости</a></li>
        <li><a href="<%= category.EntityUrl %>"><%= category.title %></a></li>
        <li><%= Model.title %></li>
    </ul>
    <h1><%= Model.title %></h1>
    <div class="b-middle clearFix">
        <div class="b-middle__left fl_l">
            <div class="b-middle__left__banner">
                <% Html.RenderAction("Banner", "Home"); %>
            </div>
        </div>
        <div class="b-middle__right fl_r">
            <% Html.RenderPartial("Widgets/MenuLinks", (MenuLinks)ViewBag.Links); %>
            <div>
                <a href="<%= category.EntityUrl %>">К списку новостей</a>
            </div>
            <%= Model.text %>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ID="Scripts" ContentPlaceHolderID="ScriptsContent"></asp:Content>
