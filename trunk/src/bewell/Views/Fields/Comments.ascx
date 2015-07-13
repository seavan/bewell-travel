<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bewell.Models.ViewModels.EntityViewModel>" %>
<%@ Import Namespace="bewell.Extensions" %>
<!---b-content-->
<div class="b-comment">
    
	<ul class="b-comment__list js-comment-list">
        
        <% foreach (var comment in Model.EntityReviews){%>
        <li>
			<div class="b-comment__list__avatar"><img src="/content/images/avatar2.jpg" alt="" /></div>
			<div class="b-comment__list__autor"><%= comment.GetCommentsAccount().NameAndSurname%></div>
			<div class="b-comment__list__data"><%: comment.create_date.ToCommentDate() %></div>
			<div class="b-comment__list__text">
				<div class="b-comment__list__text__in">
					<%= comment.text %>
				</div>
                
                <%if(comment.text!= null && comment.text.Length > 320){%>
				<span class="b-comment__list__text__door js-comment-list-door" data-change="Скрыть полный текст">Читать дальше</span>		
                <%} %>
                					
			</div>
		</li>
        <%} %>
		
	</ul>

    <%if(Model == null || !Model.EntityReviews.Any()){%><p>Отзывов пока нет.</p><%} %>
    
    <% if (Request.IsAuthenticated)
       { %>
	<form class="b-form b-comment__form" action="#" method="post">
		<dl>
			<dt class="title">оставьте отзыв</dt>
			<dd>
				<div class="b-form__row">
					<%--<textarea class="b-form__field b-form__field_textarea" rows="1" cols="1"></textarea>--%>
                    <%= Html.TextArea("CommentText", new {rows = 1, cols = 1, @class = "b-form__field b-form__field_textarea _noempty"}) %>
                    <%= Html.Hidden("ParentId", 0) %>
                    <%= Html.Hidden("MaterialId", Model.Entity.id) %>
                    <%= Html.Hidden("ProtoName", Model.Entity.ProtoName) %>
                    <%= Html.Hidden("pageUrl", Model.EntityUrl) %>
                    <%= Html.Hidden("id", Model.Entity.id) %>
                    
				</div>
				<div class="b-comment__form__button">
					<input type="submit" value="оставить отзыв" class="button" />
				</div>
			</dd>
		</dl>
	</form>
    <% }
       else
       { %>
       <div>Для того, чтобы оставить отзыв <a href="javascript:void(0);" id="login">войдите</a> или <a href="javascript:void(0);" id="signin">зарегистрируйтесь</a></div>
    <% } %>
</div>
<!---/b-content-->


 <% Html.RenderPartial("Widgets/Pager", new { Model.Page, Model.PagesCount }); %>
 
 <script type="text/javascript">
     $(function() {
         $("#signin").on("click", function() {
             $(".js-popup-signup-door").click();
         });

         $("#login").on("click", function () {
             $(".auth__signin__door").removeClass("b-close");
             $(".auth__signin__popup").removeClass("b-close");
             $(".auth__signin__popup #CurrentUrlToReturn").val(window.location.href);
             return false;
         });
     });
 </script>
				