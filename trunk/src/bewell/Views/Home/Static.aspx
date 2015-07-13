<%@ Page Title="Title" Language="C#" Inherits="System.Web.Mvc.ViewPage<bewell.Models.ViewModels.StaticPageViewModel>"
    MasterPageFile="~/Views/Shared/Main.Master" %>
<%@ Import Namespace="bewell.Models.ViewModels" %>

<asp:Content runat="server" ID="Slider" ContentPlaceHolderID="SliderContent">
</asp:Content>
<asp:Content runat="server" ID="Main" ContentPlaceHolderID="MainContent">
    <% Html.RenderAction("StaticPagesPath", "Home", new { id = Model.Id}); %>
    
    <h1><%= Model.Title %></h1>
    <div class="b-middle clearFix">
        <div class="b-middle__left fl_l">
            <div class="b-middle__left__banner">
                <% Html.RenderAction("Banner", "Home"); %>
            </div>
        </div>
        <div class="b-middle__right fl_r">
            <% if (Model.MenuLinks.Any())
               { %>
                <div class="frame b-menu-middle">
                    <ul class="page-menu">
                        <% Html.RenderPartial("Widgets/Menu", Model.MenuLinks, new ViewDataDictionary {{"IsRoot", true}}); %>
                    </ul>
                </div>
            <% } %>
            <div class="b-content clearFix">
                <%= Model.Content %>
            </div>
            <% Html.RenderPartial("Widgets/Social", new SocialViewModel{Title = Model.Title}); %>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ID="Scripts" ContentPlaceHolderID="ScriptsContent">
</asp:Content>
