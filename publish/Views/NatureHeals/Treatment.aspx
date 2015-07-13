﻿<%@ Page Title="Title" Language="C#" Inherits="System.Web.Mvc.ViewPage<bewell.Models.ViewModels.EntityViewModel>"
    MasterPageFile="~/Views/Shared/Main.Master" %>
<%@ Import Namespace="bewell.Models.ViewModels" %>

<asp:Content runat="server" ID="Slider" ContentPlaceHolderID="SliderContent">
</asp:Content>
<asp:Content runat="server" ID="Main" ContentPlaceHolderID="MainContent">
    <ul class="b-path">
        <li><a href="/">Главная</a></li>
        <li><a href="<%: Url.Action("index", "natureheals") %>">Природа лечит</a></li>
        <li><%= Model.Title %></li>
    </ul>
    <h1><%= Model.Title %></h1>
    <div class="b-middle clearFix">
        <div class="b-middle__left fl_l">
            <div class="b-middle__left__banner">
                <% Html.RenderAction("Banner", "Home"); %>
            </div>
            <% Html.RenderAction("RecomendedList", "Home", new { protoName = Model.Entity.ProtoName, Model.Entity.id }); %>
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
                       <% Html.RenderPartial("Widgets/Map", Model.EntityMap); %>
                   </div>
                <% } %>
                
                <div>
                    <a href="<%:Url.Action("hotelsearch", "home", new {TreatmentId = Model.Entity.id}) %>" class="button">Показать отели</a>
                </div>
            </div>
            
            <% Html.RenderPartial("Widgets/Social", new SocialViewModel {Title = string.Format("{0} - {1}", Model.Title, Model.FieldSet.Title)}); %>
        </div>
    </div>
</asp:Content>
