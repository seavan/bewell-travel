<%@ Page Title="Title" Language="C#" Inherits="System.Web.Mvc.ViewPage<bewell.Models.ViewModels.EntityViewModel>"
    MasterPageFile="~/Views/Shared/Main.Master" %>
<%@ Import Namespace="bewell.Models.ViewModels" %>

<asp:Content runat="server" ID="Slider" ContentPlaceHolderID="SliderContent">
</asp:Content>
<asp:Content runat="server" ID="Main" ContentPlaceHolderID="MainContent">
    <ul class="b-path">
        <li><a href="/">Главная</a></li>
        <li><a href="<%: Url.Action("ResortSearch", "Home", new SearchViewModel()) %>">Курорты</a></li>
        <li><%= Model.Title %></li>
    </ul>
    <h1><%= Model.Title %></h1>
    <div class="b-middle clearFix">
        <div class="b-middle__left fl_l">
            <!---отправить заявку-->
            <% Html.RenderAction("SendOrderRequest", "Home", Model); %>
            <!---/отправить заявку-->
            <% Html.RenderAction("LastViewedList", "Home", new { protoName = Model.Entity.ProtoName }); %>
        </div>
        <div class="b-middle__right fl_r">
            <!---b-menu-middle-->
            <% Html.RenderPartial("Widgets/MenuLinks", Model.MenuLinks); %>
            <!---/b-menu-middle-->
            <% Html.RenderPartial("Widgets/InfoBanner", new InfoBannerViewModel()); %>
            <!---b-content-->
            <div class="b-obj-info">
                <% if (Model.FieldSet.ShowGallery && Model.Photos.Photos.Any())
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
            <!---/b-content-->
            
            <div>
                <a href="<%:Url.Action("HotelSearch", "Home", (SearchViewModel)ViewBag.SearchModel) %>" class="button">Показать отели</a>
            </div>
            
            <% Html.RenderPartial("Widgets/Social", new SocialViewModel
               {
                   Title = string.Format("{0} - {1}", Model.Title, Model.FieldSet.Title), 
                   Image = Model.ListImageUrl
               }); %>
        </div>
    </div>
</asp:Content>
