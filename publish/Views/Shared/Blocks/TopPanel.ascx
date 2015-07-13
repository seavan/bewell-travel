<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@Import namespace="bewell.Services" %>
<%@Import namespace="bewell.Extensions" %>

<div class="panel-top">
	<div class="widthSite">
	    
        <% if (!Request.IsAuthenticated) { %>
		<!--не авторизован-->
		<div class="auth">
			<div class="panel-top__item auth__signin js-slide-toggle">
				<span class="auth__signin__door js-slide-toggle-door b-close">Войти</span>

				<% Html.RenderAction("SignIn", "Security"); %>

			</div>
			<div class="panel-top__item auth__signup">
				<span class="auth__signup__door js-popup-signup-door">Зарегистрироваться на сайте</span>
				<span class="auth__signup__hint"> (После регистрации вы получите возможность получать информацию о последних скидках и акциях)</span>
			</div>
		</div>
		<!--/не авторизован-->
        
        <%} else {
              var user = Html.UserPrincipal();
              var returnUrl = "http://" + bewell.Extensions.Extensions.GetHost(true) + HttpContext.Current.Request.Url.PathAndQuery;
              %>
		
		<div class="user-panel">
			<div class="panel-top__item user-panel__name">Вы вошли как <%= user.NameAndSurname%></div>
			<div class="panel-top__item user-panel__logout"><a href="/Security/SignOut?ReturnUrl=<%= returnUrl %>" class="user-panel__logout__link">Выйти</a></div>
			<div class="panel-top__item user-panel__info">
				<%--<span class="user-panel__info__text">Последние просмотренные отели: «<a href="#">Ривьера</a>», «<a href="#">Неополетано</a>», «<a href="#">Кавказская пленница</a>»</span>--%>
			</div>
		</div>
		
        <%}%>
	</div>
</div>