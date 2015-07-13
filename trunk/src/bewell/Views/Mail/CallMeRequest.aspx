<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Mail.Master" Inherits="System.Web.Mvc.ViewPage<bewell.Models.ViewModels.CallMeViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MessageContent" runat="server">
<div>
    Пользователь попросил перезвонить ему по номеру <%: Model.Phone %>
</div>
</asp:Content>
