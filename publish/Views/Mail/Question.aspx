<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Mail.Master" Inherits="System.Web.Mvc.ViewPage<bewell.Models.ViewModels.QuestionViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MessageContent" runat="server">
<div>
    Вопрос от пользователя <%= Model.Name %> (<%= Model.Email %>):
</div>
<div>
    <%= Model.Question %>
</div>
<div>
    <a href="http://<%= bewell.Extensions.Extensions.GetHost(true) %>/admin/admin_questions/Single/<%= Model.QuestionId %>">Ответить</a>
</div>

</asp:Content>