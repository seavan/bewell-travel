<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Site.Master" Inherits="System.Web.Mvc.ViewPage<multitour.Models.CodeModels.Security.ChangePasswordModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class='dop_kroshki'>
	    <div class='dop_kroshki_ab f-right'>
		    <div class='f-left'>Изменение пароля / </div><a class='f-left home' href='/Site'></a>
	    </div>
    </div>
    
    <div class='block-center'>
	    <div class='auth recovery_pass'>
            <p>Изменение пароля</p>
		    <div class='auth_login'>
		        <form method="post" action="<%: Url.Action("ChangeRegainPassword", "Security") %>">
                <p><%= Html.LabelFor(m => m.Password)%></p>
				<%= Html.PasswordFor(m => m.Password)%>
                <%= Html.ValidationMessageFor(m => m.Password)%>
                
				<p><%= Html.LabelFor(m => m.PasswordConfirmation)%></p>
				<%= Html.PasswordFor(m => m.PasswordConfirmation)%>
                <%= Html.ValidationMessageFor(m => m.PasswordConfirmation)%>
                
                <div class='f-right'>
				    <div class='button_orange'>
					    <div class='button_orange_l'>
						    <div class='button_orange_r'>
							    <div class='button_orange_c'>
								    <input type="submit" value='Изменить пароль' />
							    </div>
						    </div>
					    </div>
				    </div>
			    </div>  
			    <div class='clear'></div>
                </form>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Css" runat="server">
<link href="/content/css/auth.css" rel="stylesheet" type="text/css"/>
</asp:Content>
