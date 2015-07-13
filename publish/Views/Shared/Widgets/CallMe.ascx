<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bewell.Models.ViewModels.CallMeViewModel>" %>

<div class="popup popup_callme js-popup js-popup-callme">
	<div class="popup__table">
		<div class="popup__table__cell">
			<div class="popup__content">
				<div class="popup__close js-popup-close" title="Закрыть">Закрыть</div>
				<div class="popup__content__in b-content" style="padding-bottom: 0;">
					<h2>Перезвоните мне</h2>
						
                    <% if (Model == null || (Model != null && !Model.Success)) {%>
					<form action="#" class="b-form b-form_signup ajaxForm" data-action="<%: Url.Action("CallMe", "Home")%>" data-target=".popup_callme" data-callback="callmeCheckErrors">
						<div class="b-form__row">
							<label class="b-form__inline">
								<span class="b-form__label">Телефон</span>
                                <%= Html.TextBoxFor(m => m.Phone, new { @class = "b-form__field" })%>
							</label>
							<div class="b-form__error"><%= Html.ValidationMessageFor(m => m.Phone)%></div>
						</div>
						<div class="b-form__button">
							<input type="submit" value="Перезвоните мне" class="button" />
						</div>
					</form>
                    <% } else if (Model != null && Model.Success) { %>
                        <div>Наш оператор в ближайшее время свяжется с вами.</div>
                        <a href="<%: Url.Action("index", "home") %>" class="button" style="margin:15px 0;">ОК</a>
                    <% } %>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="/Scripts/jquery.maskedinput-1.3.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        $("#Phone").mask("+7(999)-999-99-99");
    })
</script>