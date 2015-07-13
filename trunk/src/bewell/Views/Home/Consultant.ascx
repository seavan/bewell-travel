<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<dl class="b-info__consultant fl_r">
    <dt class="title">Виртуальный консультант</dt>
    <dd>
        <div class="b-info__consultant__in">
            <div class="b-info__consultant__left">
                <img src="/Content/images/avatar.jpg" alt="" />
                <div class="b-info__consultant__left__status b-info__consultant__left__status_online"></div>
            </div>
            Здравствуйте, меня зовут <b>Галина Николаевна</b>.<br />
            Я с удовольствуем отвечу на все Ваши вопросы.
        </div>
        <div class="center-block">
            <input type="button" class="button" id="ask-consultant" value="Задать вопрос" />    
        </div>
    </dd>
</dl>

<script type='text/javascript'>
    (function () {
    	var widget_id = '151396';
        var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true; s.src = '//code.jivosite.com/script/widget/' + widget_id; var ss = document.getElementsByTagName('script')[0]; ss.parentNode.insertBefore(s, ss);
    })();

    function jivo_onLoadCallback() {
        if (jivo_config.chat_mode == "offline") {
            $(".b-info__consultant__left__status").addClass("b-info__consultant__left__status_offline");
        }

        $(".b-info__consultant__left__status").html(jivo_config.chat_mode);

        $("#ask-consultant").on("click", function () {
            jivo_api.open();
            $("#jivo_top_wrap").show();
        });
    }

    function jivo_onClose() {
        $("#jivo_top_wrap").hide();
    }
</script>
