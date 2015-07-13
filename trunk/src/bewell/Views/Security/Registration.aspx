<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Site.Master" Inherits="System.Web.Mvc.ViewPage<multitour.Models.CodeModels.Security.UserRegistrationModel>" %>
<%@ Import Namespace="multitour.common.Captcha" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

	<div class='dop_kroshki'>
		<div class='dop_kroshki_ab f-right'>
			<div class='f-left'>Регистрация в on-line бронировании / </div><a class='f-left home' href='/Site'></a>
		</div>
	</div>

	<div class='block-center'>
		<div class='auth form_registr'>
		    <%if(Model == null || (Model != null && !Model.Success)) {%>
			<p>Форма регистрации нового пользователя</p>
			<div class='auth_login'>
			    <form method="post" action="<%: Url.Action("Registration", "Security") %>">
				<table cellpadding="0" cellspacing="0">
					<tr>
						<td width='95' class='form_name'>
							<p><%= Html.LabelFor(m => m.FirstName)%></p>
						</td>
						<td>
							 <%= Html.TextBoxFor(m => m.FirstName)%>
                             <%= Html.ValidationMessageFor(m => m.FirstName)%>
						</td>
					</tr>
					<tr>
						<td class='form_name'>
							<p><%= Html.LabelFor(m => m.LastName)%></p>
						</td>
						<td>
							<%= Html.TextBoxFor(m => m.LastName)%>
                            <%= Html.ValidationMessageFor(m => m.LastName)%>
						</td>
					</tr>
					<tr>
						<td class='form_name'>
							<p><%= Html.LabelFor(m => m.EMailReg)%></p>
						</td>
						<td>
							<%= Html.TextBoxFor(m => m.EMailReg)%>
                            <%= Html.ValidationMessageFor(m => m.EMailReg)%>
						</td>
					</tr>
					<%--<tr>
						<td class='form_name'>
							<p>Телефон</p>
						</td>
						<td>
							<input type='text' name='name' />
						</td>
					</tr>
					<tr>
						<td class='form_name'>
							<p>Город</p>
						</td>
						<td>
							<input type='text' name='name' />
						</td>
					</tr>--%>
					<tr>
						<td class='form_name'>
							<p><%= Html.LabelFor(m => m.Password)%></p>
						</td>
						<td>
							<%= Html.PasswordFor(m => m.Password)%>
                            <%= Html.ValidationMessageFor(m => m.Password)%>
						</td>
					</tr>
					<tr>
						<td class='form_name'>
							<p><%= Html.LabelFor(m => m.PasswordConfirmation)%></p>
						</td>
						<td>
							<%= Html.PasswordFor(m => m.PasswordConfirmation)%>
                            <%= Html.ValidationMessageFor(m => m.PasswordConfirmation)%>
						</td>
					</tr>
					<tr>
						<td class='form_name'>
							<p><%= Html.LabelFor(m => m.Captcha)%></p>
						</td>
						<td class='clear'>
							<div class='auth_login_captcha f-left'>
                                <%= Html.CaptchaImage(31, 102, 5, "/Security/ImageCaptcha")%>
							</div>
							<div class='auth_login_input f-left'>
								<%= Html.TextBoxFor(m => m.Captcha, new {style="height:27px;"})%>
							</div>
                            <%= Html.ValidationMessageFor(m => m.Captcha)%>
						</td>
					</tr>
				</table>

				<div class='f-right'>
					<div class='button_orange'>
						<div class='button_orange_l'>
							<div class='button_orange_r'>
								<div class='button_orange_c'>
									<input type="submit" value='Зарегистрироваться' />
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class='clear'></div>

			    </form>
			</div><!-- # auth_login -->
            <% } else if(Model != null && Model.Success) { %>
            <p>Регистрация завершена успешно.</p>
            <div class='auth_login'>
            <span style="color: #3F4446;">На указанный вами адрес электронной почты отправлена ссылка, перейдя по которой вы сможете активировать свою страницу.</span>
            </div>
            <% }%>

			<div class='form_registr_bot_bg'></div>
			<div class='registr_info'>
				<div class='f-left registr_info_bg'>
				</div>
				<div class='f-left registr_info_text'>
					<div><strong>Возможности после регистрации:</strong></div>
					<ul class='f-left'>
						<li>- Личный кабинет</li>
						<li>- Как забронировать тур</li>
						<li>- Как оплатить тур</li>
						<li>- Документы</li>
						<li>- Менеджер заявок</li>
					</ul>
					<ul class='f-left f-right'>
						<li>- Сообщения</li>
						<li>- Контроль качества</li>
						<li>- Скидки</li>
						<li>- Служба поддержки</li>
						<li>- Подписка на рассылку</li>
					</ul>

				</div>
				<div class='clear'></div>
			</div>
		</div> <!-- # auth -->

	
	</div> <!-- #block-center -->



</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Css" runat="server">
    <link href="/content/css/auth.css" rel="stylesheet" type="text/css"/>
</asp:Content>

