<%@ Page Title="Title" Language="C#" Inherits="System.Web.Mvc.ViewPage<System.Collections.Generic.IEnumerable<bewell.common.Sphinx.ISphinxDocument>>"
    MasterPageFile="~/Views/Shared/Main.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <ul class="b-path">
            <li><a href="/">Главная</a></li>
            <li><%= ViewBag.Title %></li>
        </ul>
        <h1><%= ViewBag.Title %></h1>
    <div class="b-middle clearFix">
        <div class="b-middle__left fl_l">
            <div class="b-middle__left__banner">
                <% Html.RenderAction("Banner", "Home"); %>
            </div>
        </div>
        <div class="b-middle__right fl_r">
            
            <form action="/home/sphinxsearch" style="position: relative; margin-bottom: 30px">
            <input type="text" value="<%= Request["q"] %>" name="q" id="q" placeholder="поиск по сайту"
                class="b-head__search-site__input" />
                <input type="submit" value="Поиск" class="b-head__search-site__button" />
            </form>
            <% if (Model != null && Model.Any()) {
                    foreach (var item in Model) {
            %>
            <p>
                <b><a href="<%= item.GetUrl() %>">
                    <%= item.GetTitle() %></a></b>
                <br />
                <%= item.GetBody() %>
            </p>
            <%
                    }
            } else { %>
                По вашему запросу материалов не найдено.
            <% } %>
        </div>
    </div>
</asp:Content>
