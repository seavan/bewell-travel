<%@ Page Title="Title" Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>"
    MasterPageFile="~/Views/Shared/Main.Master" %>
<%@ Import Namespace="bewell.Models.ViewModels" %>

<asp:Content runat="server" ID="Slider" ContentPlaceHolderID="SliderContent">
    <% Html.RenderPartial("Slider"); %> 
</asp:Content>
<asp:Content runat="server" ID="Main" ContentPlaceHolderID="MainContent">
    <!---->
    <div class="b-info clearFix">
        <% Html.RenderAction("Recomended", "Home"); %>
        <% Html.RenderAction("Consultant", "Home"); %>
    </div>
    <!--/-->
    <!---->
    <div class="b-info clearFix">
        <% Html.RenderAction("Quote", "Home"); %>
        <% Html.RenderAction("WhatsNew", "Home"); %>
        <% Html.RenderAction("Faq", "Home"); %>
    </div>
    
    <% Html.RenderPartial("Widgets/InfoBanner", new InfoBannerViewModel()); %>
    <!--/-->
</asp:Content>
