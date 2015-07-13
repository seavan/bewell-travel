<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<meridian.bewell.proto.questions>>" %>
<%@ Import Namespace="bewell.Extensions" %>

<dl class="b-info__faq fl_r">
    <dt><span class="title">Вопрос/ответ</span> <span class="b-info__faq__link"><a href="<%: Url.Action("index", "questions") %>">
        все вопросы</a> (<%= ViewBag.Count %>)</span> </dt>
    <dd class="js-faq-lenta">
        <div class="b-info__faq__arrow b-info__faq__arrow_forward button js-prev" title="Вперед">
            <span class="disabled-back-arrow">Вперед</span></div>
        <div class="b-info__faq__arrow b-info__faq__arrow_back button js-next" title="Назад">
            <span>Назад</span></div>
        <div class="b-info__faq__lenta js-lenta">
            <% foreach (var question in Model)
               { %>
               <dl class="b-info__faq__lenta__item js-lenta-item">
                <dt>Вопрос: <%= question.ask_date.ToListShortDate() %>, <%= question.asking_user_name %></dt>
                <dd>
                    <%= question.question %>
                </dd>
                <dt>Ответ: <%= question.GetAnswersAccount() != null && !string.IsNullOrEmpty(question.GetAnswersAccount().post) ? string.Format("{0}, ", question.GetAnswersAccount().post) : string.Empty %><%= question.GetAnswersAccount() == null ? string.Empty : question.GetAnswersAccount().NameAndSurname%></dt>
                <dd>
                    <%= question.reply_text %>    
                </dd>
            </dl>
            <% } %>
        </div>
    </dd>
</dl>
