﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Mail.Master" Inherits="System.Web.Mvc.ViewPage<SendLinkModel>" %>
<%@ Import Namespace="bewell.Models.ViewModels.Mail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MessageContent" runat="server">
<p>Было запрошено восстановление пароля на сайте <a href='http://bewell-travel.com'>bewell-travel.com</a>!</p>
<p>Чтобы восстановить пароль, Вам необходимо пройти по <a href='<%= Model.Link %>'>ссылке</a></p>
<br/><br/>
<hr/>С уважением, редакция портала bewell-travel.com
</asp:Content>
