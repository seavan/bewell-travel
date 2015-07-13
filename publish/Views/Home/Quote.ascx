<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bewell.Models.QuoteViewModel>" %>

<% if(Model!=null){ %>
<div class="b-info__citate fl_l">
    <div class="b-info__citate__bg">
    </div>
    <div class="b-info__citate__in">
        <div class="b-info__citate__pic">
            <img src="<%=Url.Content("~/Content/images/" + Model.ImageName)%>"" alt="" /></div>
        <div class="b-info__citate__text">
            <%=Model.Text %>
        </div>
        <div class="b-info__citate__autor">
            <%=Model.Author %>
        </div>
    </div>
</div>
<%} %>
