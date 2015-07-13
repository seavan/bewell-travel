<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Mail.Master" Inherits="System.Web.Mvc.ViewPage<bewell.Models.ViewModels.Mail.CommentViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MessageContent" runat="server">
<div>
    Для <%= Model.EntityType %> "<%= Model.EntityName %>" оставлен отзыв:<br/>
    "<%= Model.Comment %>"
</div>
<div>
    <a href="<%=Model.EntityUrl %>">посмотреть отзыв</a><br/>
    <a href="<%=Model.EntityAdminUrl %>">редактировать отзыв</a>
</div>
</asp:Content>
