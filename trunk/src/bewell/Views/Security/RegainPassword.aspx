<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Site.Master" Inherits="System.Web.Mvc.ViewPage<string>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%bool success = ViewBag.Success != null ? (bool) ViewBag.Success : false;%>
    
    <div class='dop_kroshki'>
	    <div class='dop_kroshki_ab f-right'>
		    <div class='f-left'>Изменение пароля / </div><a class='f-left home' href='/Site'></a>
	    </div>
    </div>
    
    <div class='block-center'>
	    <div class='auth recovery_pass'>
	        <%if(success){%>
            <p><%= Model %>,</p>
		    <div class='auth_login'>
		        <span style="color: #3F4446;">ваш пароль успешно изменён.</span>
            </div>
            <%}else{ %>
            <p>Изменение пароля</p>
		    <div class='auth_login'>
		         <span style="color: #3F4446;">При попытке восстановления пароля возникли ошибки:</span>
                 <span style="color: #3F4446;"><%= Model %></span>
            </div>
            <%} %>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Css" runat="server">
<link href="/content/css/auth.css" rel="stylesheet" type="text/css"/>
</asp:Content>
