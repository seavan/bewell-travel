<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<SNA.Models.SNAEmailModel>" %>
<%@ Import Namespace="bewell.common.HtmlHelpers"%>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <% Html.EnableClientValidation(); %>
    <h2 style="margin:20px 0px;">Авторизация - заключительный этап</h2>
    <p class="infoOAuth">Здравствуйте<%= string.IsNullOrEmpty(Model.UserFirstName) ? "" : ", " + Model.UserFirstName%>.</p>
    <p class="infoOAuth">К сожалению, выбранная вами социальная сеть в рамках своей политики безопасности не предоставляет полный набор данных, необходимый нам для того, чтобы авторизовать вас прямо сейчас.</p>
    <p class="infoOAuth">Пожалуйста, укажите свой электронный адрес. Это необходимо сделать всего один раз. В дальнейшем, авторизация через выбранную вами социальную сеть будет происходить без как-либо вопросов с нашей стороны.</p>
    <br/>

    <div class="searchSiteBlock">
    <form action="<%: Url.Action("SNAGetEmailForm", "SNA")%>" method="post" class="changePasswordForm">
        <div class="cabinetBlock searchParam show">
            <div class="cabinetFields">
                <div class="iForm">
                        
                    <div class="field">
				        <%= Html.LabelFor(m => m.UserEmail, new { @class = "_autohide" })%>: <br/>
                        <%= Html.TextBoxFor(m => m.UserEmail, new { @class = "b-head__search-site__input", style="width:300px;" })%>
                        <input type="submit" value="Войти" class="button"/>
                        
			        </div>
			        <div class="field">
			            <%= Html.ValidationMessageFor(m => m.UserEmail)%>
                       <%: Html.HiddenFor(m => m.ServerAccessToken)%>
                       <%: Html.HiddenFor(m => m.UserFirstName)%>
			        </div>

                </div>
            </div>            
        </div>
       </form>
    </div>

</asp:Content>
