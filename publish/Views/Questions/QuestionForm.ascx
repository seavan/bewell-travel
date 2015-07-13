<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bewell.Models.ViewModels.QuestionViewModel>" %>
<%@ Import Namespace="bewell.common.HtmlHelpers" %>

<% Html.BeginForm("Add", "Questions", FormMethod.Post, new { @class = "b-form b-comment__form", id = "question-form" }); %> 
    <dl>
        <dt class="title">Задать вопрос</dt>
        <dd>
            <div class="b-form__row">
                <% if (!Request.IsAuthenticated)
                   { %>
                    <%= Html.LabelFor(model => model.Name) %>
                    <%= Html.TextBoxFor(model => model.Name, new {@class = "b-form__field _noempty"}) %>
                    <%= Html.ValidationMessageFor(model => model.Name) %>
                    <br/>
                    <%= Html.LabelFor(model => model.Email) %>
                    <%= Html.TextBoxFor(model => model.Email, new {@class = "b-form__field _noempty"}) %>
                    <%= Html.ValidationMessageFor(model => model.Email) %>
                <% }
                   else
                   { %>
                       <%= Html.HiddenFor(model => model.AccountId) %>
                       <%= Html.HiddenFor(model => model.Name) %>
                       <%= Html.HiddenFor(model => model.Email) %>
                       <%= Html.HiddenFor(model => model.Captcha) %>
                <% } %>
                <br/>
                <%= Html.LabelFor(model => model.Question)%>
                <%= Html.TextAreaFor(m => m.Question, new { rows = 1, cols = 1, @class = "b-form__field b-form__field_textarea _noempty" })%>
                <%= Html.ValidationMessageFor(model=> model.Question) %>
                <% if (!Request.IsAuthenticated)
                   { %>
                    <div>
                        <%= Html.CaptchaImage(40, 232, 6) %>            
			        </div>
                    <%= Html.LabelFor(model => model.Captcha)%>
                    <%= Html.TextBoxFor(model => model.Captcha, new { @class = "b-form__field _noempty" })%>
                    <%= Html.ValidationMessageFor(model=> model.Captcha) %>
                    <span class="field-validation-error" id="captcha-message" style="display:none;">Неверный текст</span>
                <% } %>
            </div>
            <div class="b-comment__form__button">
                <input type="submit" id="btn" value="отправить" class="button" />
            </div>
        </dd>
    </dl>
<% Html.EndForm(); %>

<% if (!Request.IsAuthenticated)
   { %>
    <script type="text/javascript">
        $(function () {
            $("#btn").on("click", function (evt) {
                //evt.preventDefault();
                var result = 1;
                var $form = $('#question-form');
                if ($form.valid()) {
                    $.ajax({
                        url: '<%= Url.Action("CheckCaptcha", "Ajax") %>',
                        type: 'POST',
                        async: false,
                        data: { guid: $("#captcha-guid").val(), value: $("#Captcha").val()},
                        success: function (data) {
                            result = data.result;
                            if (result == 0) {
                                $("#captcha-message").show();
                            } else {
                                $("#captcha-message").hide();
                            }
                        }
                    });
                }

                return result > 0;
            });
        });
    </script>
 <% } %>