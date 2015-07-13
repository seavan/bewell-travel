<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bewell.Models.CodeModels.Security.UserRegistrationModel>" %>


<div class="popup popup_signup js-popup js-popup-signup">
		<div class="popup__table">
			<div class="popup__table__cell">
				<div class="popup__content">
					<div class="popup__close js-popup-close" title="Закрыть">Закрыть</div>
					<div class="popup__content__in b-content">
						<h2>Регистрация</h2>
						
                        <%if(Model == null || (Model != null && !Model.Success)) {%>
						<form action="#" class="b-form b-form_signup ajaxForm" data-action="<%: Url.Action("Registration", "Security")%>" data-target=".popup_signup" data-callback="authCheckErrors">
							<div class="b-form__row">
								<label class="b-form__inline">
									<span class="b-form__label">Имя</span>
                                    <%= Html.TextBoxFor(m => m.FirstName, new { @class = "b-form__field" })%>
								</label>
								<div class="b-form__error"><%= Html.ValidationMessageFor(m => m.FirstName)%></div>
                                
							</div>
							<div class="b-form__row">
								<label class="b-form__inline">
									<span class="b-form__label">Фамилия</span>
									<%= Html.TextBoxFor(m => m.LastName, new { @class = "b-form__field" })%>
								</label>
                                <div class="b-form__error"><%= Html.ValidationMessageFor(m => m.LastName)%></div>
							</div>
							<div class="b-form__row">
								<label class="b-form__inline">
									<span class="b-form__label">E-mail</span>
									<%= Html.TextBoxFor(m => m.EMailReg, new { @class = "b-form__field" })%>
								</label>
                                <div class="b-form__error"><%= Html.ValidationMessageFor(m => m.EMailReg)%></div>
							</div>
							<div class="b-form__row">
								<label class="b-form__inline">
									<span class="b-form__label">Пароль</span>
									<%= Html.PasswordFor(m => m.Password, new { @class = "b-form__field" })%>
								</label>
                                <div class="b-form__error"><%= Html.ValidationMessageFor(m => m.Password)%></div>
							</div>
							<div class="b-form__row">
								<label class="b-form__inline">
									<span class="b-form__label">Повторите пароль</span>
									<%= Html.PasswordFor(m => m.PasswordConfirmation, new { @class = "b-form__field" })%>
								</label>
                                <div class="b-form__error"><%= Html.ValidationMessageFor(m => m.PasswordConfirmation)%></div>
							</div>
							<div class="b-form__button">
							    <input type="submit" value="Зарегистрироваться" class="button" />
							</div>
							<ul class="social">
								<li class="social__title">Регистрация через соцсети:</li>
								<li><a href="<%:SNA.Classes.SNAuthFbService.SignInUrl%>" title="facebook">&#228;</a></li>
								<li><a href="<%:SNA.Classes.SNAuthVkService.SignInUrl%>" title="vkontakte">&#230;</a></li>
								<%--<li><a href="<%:SNA.Classes.SNAuthOdService.SignInUrl%>" title="odnoklassniki">&#233;</a></li>--%>
								<li><a href="<%:SNA.Classes.SNAuthGpService.SignInUrl%>" title="googleplus">&#232;</a></li>
							</ul>
						</form>
                        <% } else if(Model != null && Model.Success) { %>
                            <span>Регистрация завершена успешно. На указанный вами адрес электронной почты отправлена ссылка, перейдя по которой вы сможете активировать свою страницу.</span>
                        <% } %>
					</div>
				</div>
			</div>
		</div>
	</div>