<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bewell.Models.CodeModels.Security.UserAuthenticationModel>" %>

<div class="auth__signin__popup js-slide-toggle-content b-close">
	<div class="auth__signin__popup__in">
	    
	    <form action="#" class="b-form b-form_login ajaxForm" data-action="<%: Url.Action("SignIn", "Security")%>" data-target=".auth__signin__popup" data-callback="authCheckErrors">
		    <%= Html.HiddenFor(m => m.CurrentUrlToReturn)%>
			<div class="b-form__row">
				<label class="b-form__inline">
					<span class="b-form__label">Логин</span>
                    <%= Html.TextBoxFor(m => m.EMailAuth, new { @class = "b-form__field" })%>
				</label>
			    <div class="b-form__error"><br/><%= Html.ValidationMessageFor(m => m.EMailAuth)%><%= Html.ValidationMessage("AuthenticateError")%></div>
			</div>

			<div class="b-form__row">
				<label class="b-form__inline">
					<span class="b-form__label">Пароль</span>
					<%= Html.PasswordFor(m => m.Password, new { @class = "b-form__field" })%>
				</label>
                <div class="b-form__error"><%= Html.ValidationMessageFor(m => m.Password)%></div>
			</div>

			<div class="b-form_login__button">
			    <input type="submit" value="войти" class="button" />
				<label class="b-form__checkbox"><%: Html.CheckBoxFor(m => m.Remember)%><span>Запомнить пароль</span></label>
			</div>

			<ul class="social">
				<li class="social__title">Войти через соцсети:</li>
				<li><a href="<%:SNA.Classes.SNAuthFbService.SignInUrl%>" title="facebook">&#228;</a></li>
				<li><a href="<%:SNA.Classes.SNAuthVkService.SignInUrl%>" title="vkontakte">&#230;</a></li>
				<li><a href="<%:SNA.Classes.SNAuthGpService.SignInUrl%>" title="googleplus">&#232;</a></li>
			</ul>
		</form>
	</div>
</div>