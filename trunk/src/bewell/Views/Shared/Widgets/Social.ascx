<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<bewell.Models.ViewModels.SocialViewModel>" %>

<script type="text/javascript">
    var head = document.getElementsByTagName('head')[0],
        meta;

    <% if (!string.IsNullOrEmpty(Model.Title))
       { %>
        meta = document.createElement('meta');
        meta.setAttribute('property', 'og:title');
        meta.content = '<%= Model.Title %>';
        head.appendChild(meta);

        meta = document.createElement('meta');
        meta.setAttribute('name', 'title');
        meta.content = '<%= Model.Title %>';
        head.appendChild(meta);
    <% } %>

    <% if (!string.IsNullOrEmpty(Model.Description))
       { %>
        meta = document.createElement('meta');
        meta.setAttribute('property', 'og:description');
        meta.content = '<%= Model.Description %>';
        head.appendChild(meta);

        meta = document.createElement('meta');
        meta.setAttribute('name', 'description');
        meta.content = '<%= Model.Description %>';
        head.appendChild(meta);
    <% } %>

    <% if (!string.IsNullOrEmpty(Model.Image))
       { %>
        meta = document.createElement('meta');
        meta.setAttribute('property', 'og:image');
        meta.content = '<%= Model.Image %>';
        head.appendChild(meta);

        var link = document.createElement('link');
        link.setAttribute('rel', 'image_src');
        link.setAttribute('href', '<%= Model.Image %>');
        head.appendChild(link);
    <% } %>

    <% if (!string.IsNullOrEmpty(Model.Url))
       { %>
        meta = document.createElement('meta');
        meta.setAttribute('property', 'og:url');
        meta.content = '<%= Model.Url %>';
        head.appendChild(meta);
    <% } %>
</script>

<script type="text/javascript">    (function () {
    if (window.pluso) if (typeof window.pluso.start == "function") return;
    if (window.ifpluso == undefined) {
        window.ifpluso = 1;
        var d = document, s = d.createElement('script'), g = 'getElementsByTagName';
        s.type = 'text/javascript'; s.charset = 'UTF-8'; s.async = true;
        s.src = ('https:' == window.location.protocol ? 'https' : 'http') + '://share.pluso.ru/pluso-like.js';
        var h = d[g]('body')[0];
        h.appendChild(s);
    } 
})();</script>
<div class="pluso" data-background="#ebebeb" data-options="medium,round,line,horizontal,counter,theme=04" data-services="vkontakte,odnoklassniki,facebook,twitter,google,moimir,email,print" data-user="1984304679"></div>