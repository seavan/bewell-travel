<%@ Page Title="Title" Language="C#" Inherits="System.Web.Mvc.ViewPage<bewell.Models.ViewModels.NewsListViewModel>"
    MasterPageFile="~/Views/Shared/Main.Master" %>
<%@ Import Namespace="meridian.bewell.impl.Classes" %>

<asp:Content runat="server" ID="Slider" ContentPlaceHolderID="SliderContent">
</asp:Content>
<asp:Content runat="server" ID="Main" ContentPlaceHolderID="MainContent">
    <ul class="b-path">
        <li><a href="/">Главная</a></li>
        <li><a href="<%: Url.Action("index", "news") %>">Новости</a></li>
        <% if (Model.Category != null)
           { %>
           <li><%= Model.Category.title %></li>
        <% } %>
    </ul>
    <h1><%= Model.Category != null ? Model.Category.title : "Все новости" %></h1>
    <div class="b-middle clearFix">
        <div class="b-middle__left fl_l">
            <div class="b-middle__left__banner">
                <% Html.RenderAction("Banner", "Home"); %>
            </div>
        </div>
        <div class="b-middle__right fl_r">
            <% Html.RenderPartial("Widgets/MenuLinks", (MenuLinks)ViewBag.Links); %>
            <div class="b-comment">
                <ul class="b-comment__list js-comment-list">
                    <% foreach (var news in Model.News)
                       { %>
                       <li>
                        <div class="b-comment__list__avatar">
                            <img src="<%= news.ListImageUrl %>" alt="<%= news.title %>">
                        </div>
                        <div class="b-comment__list__autor">
                            <a href="<%= news.EntityUrl %>"><%= news.title %></a>
                        </div>
                        <div class="b-comment__list__data">
                            <%= news.publish_date.ToString("dd MMMM yyyy HH:mm") %>
                        </div>
                        <div class="b-comment__list__text">
                            <div class="b-comment__list__text__in">
                                <%= news.announce %>
                            </div>
                        </div>
                    </li>
                    <% } %>
                </ul>
            </div>
            
            <% if (Model.PagesCount > 1)
            {
                Html.RenderPartial("Widgets/Pager", new { Model.PagesCount, Model.Page });
            }
        %>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ID="Scripts" ContentPlaceHolderID="ScriptsContent">
</asp:Content>
