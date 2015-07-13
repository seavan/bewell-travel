<%@ Page Title="Title" Language="C#" Inherits="System.Web.Mvc.ViewPage<bewell.Models.ViewModels.DictionaryViewModel>"
    MasterPageFile="~/Views/Shared/Main.Master" %>
<%@ Import Namespace="bewell.Models.ViewModels" %>

<asp:Content runat="server" ID="Slider" ContentPlaceHolderID="SliderContent">
</asp:Content>
<asp:Content runat="server" ID="Main" ContentPlaceHolderID="MainContent">
    <ul class="b-path">
        <li><a href="/">Главная</a></li>
        <li>Курортный словарь</li>
    </ul>
    <h1>Курортный словарь</h1>
    <div class="b-middle clearFix">
        <div class="b-middle__left fl_l">
            <div class="b-middle__left__banner">
                <% Html.RenderAction("Banner", "Home"); %>
            </div>
        </div>
        <div class="b-middle__right fl_r">
            <% Html.RenderAction("Alphabet", "Dictionary", new { currentLetter = Model.CurrentLetter}); %>
            <div class="b-content clearFix">
                <% if (Model.CurrentWord == null)
                   { %>
                <table class="b-content__table word_dic">
                    <thead>
                        <tr>
                            <th>Слово</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <% foreach (var word in Model.Words)
                                   { %>
                                    <div>
                                        <a href="<%: Url.RouteUrl("Dictionary", new {letter = word.word.ToLower()[0],  word.id , entryName = word.EntityName}) %>"><%= word.word %></a>
                                    </div>
                                <% } %>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <% }
                   else
                   { %>
                   <table class="b-content__table word_dic">
                    <thead>
                        <tr>
                            <th>Значение</th>
                            <th>Слово</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="b-content__table__article word_value">
                                <b><%= Model.CurrentWord.word %></b><%= !string.IsNullOrEmpty(Model.CurrentWord.translate) ? string.Format(" ({0})", Model.CurrentWord.translate) : string.Empty %> - 
                                <%= Model.CurrentWord.explanation %>
                            </td>
                            <td>
                                <% foreach (var word in Model.Words)
                                   { %>
                                    <div <%= word.word == Model.CurrentWord.word ? "class=curWord" : string.Empty %>>
                                        <a href="<%: Url.RouteUrl("Dictionary", new {letter = word.word.ToLower()[0],  word.id , entryName = word.EntityName}) %>"><%= word.word %></a>
                                    </div>
                                <% } %>
                            </td>
                        </tr>
                    </tbody>
                </table>
                
                <% Html.RenderPartial("Widgets/Social", new SocialViewModel {Title = Model.CurrentWord.word, Description = Model.CurrentWord.explanation}); %>
                <% } %>
            </div>
        </div>
    </div>
</asp:Content>
