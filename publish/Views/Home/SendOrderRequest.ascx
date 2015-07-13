<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bewell.Models.ViewModels.Mail.OrderRequestViewModel>" %>
<form action="" id="order-request-form" class="b-form b-form_left">
    <%: Html.HiddenFor(m => m.Id) %>
    <%: Html.HiddenFor(m => m.ProtoName) %>
    <dl>
        <dt class="title">отправить заявку</dt>
        <dd>
            <div class="b-form__row">
                <label>
                    <span class="b-form__label">Фамилия</span>
                    <%: Html.TextBoxFor(m => m.LastName, new {@class = "b-form__field"}) %>
                    <%: Html.ValidationMessageFor(m => m.LastName) %>
                </label>
            </div>
            <div class="b-form__row">
                <label>
                    <span class="b-form__label">Имя</span>
                    <%: Html.TextBoxFor(m => m.FirstName, new {@class = "b-form__field"}) %>
                    <%: Html.ValidationMessageFor(m => m.FirstName)%>
                </label>
            </div>
            <div class="b-form__row">
                <span class="b-form__label">Период проживания</span>
                <div class="b-form__row-calendar">
                    <span>c</span>
                    <%: Html.TextBoxFor(m => m.FromDate, new { @class = "b-form__field datepicker", @Value = Model.FromDate.ToString("dd.MM.yyyy") })%>
                    <%: Html.ValidationMessageFor(m => m.FromDate)%>
                    <i class="b-form__row-calendar__door"></i>
                </div>
                <div class="b-form__row-calendar">
                    <span>по</span>
                    <%: Html.TextBoxFor(m => m.ToDate, new { @class = "b-form__field datepicker", @Value = Model.ToDate.ToString("dd.MM.yyyy") })%>
                    <%: Html.ValidationMessageFor(m => m.ToDate)%>
                    <i class="b-form__row-calendar__door"></i>
                </div>
            </div>
            <div class="b-form__row">
                <label>
                    <span class="b-form__label">Email</span>
                    <%: Html.TextBoxFor(m => m.Email, new {@class = "b-form__field"}) %>
                    <%: Html.ValidationMessageFor(m => m.Email)%>
                </label>
            </div>
            <div class="b-form__row">
                <label>
                    <span class="b-form__label">Телефон</span>
                    <%: Html.TextBoxFor(m => m.Phone, new {@class = "b-form__field"}) %>
                    <%: Html.ValidationMessageFor(m => m.Phone)%>
                </label>
            </div>
            <div class="b-form__button">
                <input id="btn" type="button" value="отправить" class="button">
            </div>
        </dd>
    </dl>
</form>
<link href="/Content/css/datepicker.css" rel="stylesheet" type="text/css" />
<script src="/Scripts/jquery.ui.datepicker-ru.js" type="text/javascript"></script>
<script src="/Scripts/jquery.ui.datepicker.min.js" type="text/javascript"></script>
 <script type="text/javascript">
     $(function() {
         $(".datepicker").datepicker({ 
            changeMonth: true,
            changeYear: true,
            showOtherMonths: true
         });

         $("#btn").on("click", function(evt) {
             evt.preventDefault();
             var $form = $('#order-request-form');
             if ($form.valid()) {
                 $.ajax({
                     url: '<%= Url.Action("SendOrderRequest", "Home") %>',
                     type: 'POST',
                     data: $form.serialize(),
                     success: function() {
                         showPopupMessage('Запрос на бронирование', 'Ваша заявка отправлена. В ближайшее время с вами свяжется наш менеджер для уточнения деталей бронирования.');
                         $form.find("input[type=text]").val("");
                     }
                 });
             }
         });

         $(".b-form__row-calendar__door").on("click", function() {
             $(this).parent().find(".datepicker").datepicker('show');
         });
     });
     
 </script>