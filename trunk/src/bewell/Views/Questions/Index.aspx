<%@ Page Title="Title" Language="C#" Inherits="System.Web.Mvc.ViewPage<System.Collections.Generic.IEnumerable<meridian.bewell.proto.questions>>"
    MasterPageFile="~/Views/Shared/Main.Master" %>

<%@ Import Namespace="bewell.Extensions" %>
<asp:Content runat="server" ID="Slider" ContentPlaceHolderID="SliderContent">
</asp:Content>
<asp:Content runat="server" ID="Main" ContentPlaceHolderID="MainContent">
    <ul class="b-path">
        <li><a href="/">Главная</a></li>
        <li>Вопросы и ответы</li>
    </ul>
    <h1>
        Вопросы и ответы</h1>
    <div class="b-middle clearFix">
        <div class="b-middle__left fl_l">
            <% Html.RenderAction("Banner", "Home"); %>
        </div>
        <div class="b-middle__right fl_r">
            <%-- прячем форму по просьбе заказчика
			<div class="qa-form">
                <% Html.RenderAction("QuestionForm", "Questions"); %>
            </div>--%>
            <div class="b-comment">
                <ul class="b-qa__list js-comment-list">
                    <% foreach (var question in Model) { %>
                    <li>
                        <div class="b-comment__list__autor">
                            Вопрос:
                            <%= question.asking_user_name %></div>
                        <div class="b-comment__list__data">
                            <%: question.ask_date.ToCommentDate() %></div>
                        <div class="b-comment__list__text">
                            <div class="b-comment__list__text__in">
                                <%= question.question %>
                            </div>
                            <%if (question.question != null && question.question.Length > 320) { %>
                            <span class="b-comment__list__text__door js-comment-list-door" data-change="Скрыть полный текст">
                                Читать дальше</span>
                            <%} %>
                        </div>
                        <% if (!string.IsNullOrEmpty(question.reply_text)) { %>
                        <div class="b-comment__list__autor">
                            Ответ:
                            <%= question.GetAnswersAccount() != null && !string.IsNullOrEmpty(question.GetAnswersAccount().post) ? string.Format("{0}, ", question.GetAnswersAccount().post) : string.Empty %><%= question.GetAnswersAccount() == null ? string.Empty : question.GetAnswersAccount().NameAndSurname%>
                        </div>
                        <div class="b-comment__list__data">
                        </div>
                        <div class="b-comment__list__text">
                            <div class="b-comment__list__text__in">
                                <%= question.reply_text %>
                            </div>
                            <%if (question.reply_text != null && question.reply_text.Length > 320) {%>
                            <span class="b-comment__list__text__door js-comment-list-door" data-change="Скрыть полный текст">
                                Читать дальше</span>
                            <%} %>
                        </div>
                        <% } %>
                    </li>
                    <% } %>
                </ul>
                <%if (Model == null || !Model.Any()) { %>
                    <p>Вопросов пока нет.</p>
                <%} %>
            </div>
            <% Html.RenderPartial("Widgets/Pager", new { ViewBag.Page, ViewBag.PagesCount }); %>
        </div>
    </div>
</asp:Content>
