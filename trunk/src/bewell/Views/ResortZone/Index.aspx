<%@ Page Title="Title" Language="C#" Inherits="System.Web.Mvc.ViewPage<bewell.Models.ViewModels.EntityViewModel>"
    MasterPageFile="~/Views/Shared/Main.Master" %>

<asp:Content runat="server" ID="Slider" ContentPlaceHolderID="SliderContent">
</asp:Content>
<asp:Content runat="server" ID="Main" ContentPlaceHolderID="MainContent">
    <ul class="b-path">
        <li><a href="#">Главная</a></li>
        <li><a href="#">Курортные зоны</a></li>
        <li><%= Model.Title %></li>
    </ul>
    <h1><%= Model.Title %></h1>
    <div class="b-middle clearFix">
        <div class="b-middle__left fl_l">
        </div>
        <div class="b-middle__right fl_r">
            <% Html.RenderPartial("Widgets/MenuLinks", Model.MenuLinks); %>
            <div class="b-obj-info">
                <% if (Model.FieldSet.ShowGallery)
                   { %>
                   <div class="b-obj-info__item">
                       <h2 class="title">фотогалерея</h2>
                       <% Html.RenderPartial("Widgets/Gallery", Model.Photos); %>
                   </div>
                <% } %>
                
                <% Html.RenderPartial("Widgets/Fieldset", Model); %>

                <% if (Model.FieldSet.ShowMap)
                   { %>
                   <div class="b-obj-info__item">
                       <h2 class="title">карта</h2>
                       <% ViewBag.ZoomMap = 8; Html.RenderPartial("Widgets/Map", Model.EntityMap); %>
                   </div>
                <% } %>
            </div>
        </div>
    </div>
</asp:Content>
