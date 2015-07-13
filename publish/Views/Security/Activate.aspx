<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<string>" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">
    
    <%bool success = ViewBag.Success != null ? (bool) ViewBag.Success : false;%>
    
	<%if(success){%>
        <p style="margin-top:50px;"><%= Model %>,</p>
        <div>ваш аккаунт активирован. Приветствуем вас на сайте компании bewell-travel!</div>
    <%}else{ %>
    <p style="margin-top:50px;">Активация аккаунта</p>
    <div>
        <span>При попытке активации аккаунта возникли ошибки:</span><br/>
        <span><%= Model %></span>
    </div>
    <%} %>
    
</asp:Content>