<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Site.Master" Inherits="System.Web.Mvc.ViewPage<bewell.Models.CodeModels.Security.RegainModel>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">


<% if (Model == null || (Model != null && !Model.repeatActivation)) {%>
<div class='dop_kroshki'>
	<div class='dop_kroshki_ab f-right'>
		<div class='f-left'>Восстановление пароля / </div><a class='f-left home' href='/Site'></a>
	</div>
</div>
<div class='block-center'>
	<div class='auth recovery_pass'>
	    
        <% if (Model == null || (Model != null && !Model.Success)) {%>
		<p>Восстановление пароля</p>
		<div class='auth_login'>
		    <form method="post" action="<%: Url.Action("RememberPassword", "Security") %>">
			<p><%= Html.LabelFor(m => m.EMailRem)%></p>
			<%= Html.TextBoxFor(m => m.EMailRem)%>
            <%= Html.ValidationMessageFor(m => m.EMailRem)%>

			<div class='clear'>
				<p><%= Html.LabelFor(m => m.Captcha)%></p>
				<div class='auth_login_captcha f-left'>
					<%= Html.CaptchaImage(31, 102, 5, "/Security/ImageCaptcha")%>
				</div>
				<div class='auth_login_input f-left'>
					<%= Html.TextBoxFor(m => m.Captcha, new {style="height:27px;"})%>
				</div>
                <%= Html.ValidationMessageFor(m => m.Captcha)%>
			</div>
			<div class='clear'></div>
			<div style='margin-top: 4px;'>
				<div class='reg'><a href='<%: Url.Action("Registration", "Security") %>'>регистрация</a></div>
			</div>
			<div class='f-right'>
				<div class='button_orange'>
					<div class='button_orange_l'>
						<div class='button_orange_r'>
							<div class='button_orange_c'>
								<input type="submit" value='Восстановить пароль' />
                                <%: Html.HiddenFor(m=>m.repeatActivation) %>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class='clear'></div>
            </form>
		</div><!-- # auth_login -->
		
        <% } else if(Model != null && Model.Success){%>
        <p>Восстановление пароля</p>
        <div class='auth_login'>
        <span style="color: #3F4446;">На указанный вами электронный адрес были высланы инструкции для дальнейшего действия.</span>
        </div>
        <% }%>
	</div> <!-- # auth -->

	
</div> <!-- #block-center -->

<% }%>

<%if(Model == null || (Model != null && Model.repeatActivation)) {%>

<div class='dop_kroshki'>
	<div class='dop_kroshki_ab f-right'>
		<div class='f-left'>Повторная активация / </div><a class='f-left home' href='/Site'></a>
	</div>
</div>
<div class='block-center'>
	<div class='auth recovery_pass'>
	    
        <% if (Model == null || (Model != null && !Model.Success)) {%>
		<p>Повторная активация</p>
		<div class='auth_login'>
		    <form method="post" action="<%: Url.Action("RepeatActivation", "Security") %>">
			<p><%= Html.LabelFor(m => m.EMailRem)%></p>
			<%= Html.TextBoxFor(m => m.EMailRem)%>
            <%= Html.ValidationMessageFor(m => m.EMailRem)%>

			
			<div class='clear'></div>
			<div style='margin-top: 4px;'>
				<div class='reg'><a href='<%: Url.Action("Registration", "Security") %>'>регистрация</a></div>
			</div>
			<div class='f-right'>
				<div class='button_orange'>
					<div class='button_orange_l'>
						<div class='button_orange_r'>
							<div class='button_orange_c'>
								<input type="submit" value='Получить ссылку для активации' />
                                <%: Html.HiddenFor(m=>m.repeatActivation) %>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class='clear'></div>
            </form>
		</div><!-- # auth_login -->
		
        <% } else if(Model != null && Model.Success){%>
        <p>Повторная активация</p>
        <div class='auth_login'>
        <span style="color: #3F4446;">На указанный вами адрес электронной почты отправлена ссылка, перейдя по которой вы сможете активировать свою страницу.<</span>
        </div>
        <% }%>
	</div> <!-- # auth -->

	
</div> <!-- #block-center -->

<% }%>

</asp:Content>
