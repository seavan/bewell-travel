<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<System.Collections.Generic.IEnumerable<meridian.bewell.proto.IAttachedPhoto>>" %>
<%
    if (Model != null)
    {%>
<div id="sortable">
    <%
        foreach (var p in Model)
        {
    %>
    <span class='gallery-photo' id="<%= p.id %>" style="background: <%= p.IsMain ? "gold" : "#EFEFEF" %>;" 
    data-params='{ "protoName": "<%= p.AttachedPhotoContainer.ProtoName %>", "entity_id": <%= p.AttachedPhotoContainer.id %>}'>
        <a href="javacript:void(0);" style="position: absolute; top: 0; right: 0; color: red;z-index: 100" 
        data-params='{ "photoId": "<%= p.id %>", "fieldName": "<%= ViewData["fieldName"] %>", "protoName": "<%= p.AttachedPhotoContainer.ProtoName %>", "id": <%= p.AttachedPhotoContainer.id %>}'
        data-controller="IAttachedPhotoAspect" data-action="RemovePhoto" class="_delete _action">
            удалить
        </a>
        <% if (p.IsMain)
           { %>
            <span style="position: absolute; top: 0; left: 0; z-index: 100">главная</span>
        <% }
           else
           { %>
            <a href="javacript:void(0);" style="position: absolute; top: 0; left: 0; z-index: 100"
                data-params=' { "photoId": "<%= p.id %>", "fieldName": "<%= ViewData["fieldName"] %>", "protoName": "<%= p.AttachedPhotoContainer.ProtoName %>", "id": <%= p.AttachedPhotoContainer.id %>}'
                data-controller="IAttachedPhotoAspect" data-action="SetMain" class="_setMain _action">
                сделать главной
            </a>
        <% } %>
        <img width="140px" src="<%= p.ThumbUrl %>" data-id="<%= p.id %>" alt="" />
    </span>
    <% } %>
</div>
<% } %>
<style>
    .sortable-placeholder,
    .gallery-photo {
        display:inline-block;
        background:#efefef; 
        padding: 15px; 
        margin: 10px;
        border: 1px dotted silver; 
        position: relative;
    }
    
    .sortable-placeholder {
        padding-top: 100px;
    }
</style>
<script type="text/javascript">
    var position = 1;
    $(function () {
        $('#sortable').sortable({
            placeholder: 'sortable-placeholder',
            opacity: "0.5",
            start: function(event, ui) {
                position = ui.placeholder.index();
                $(".sortable-placeholder").html('Порядковый номер : ' + position);
            },
            change: function(event, ui) {
                position = ui.placeholder.index();
                $(".sortable-placeholder").html('Порядковый номер: ' + position);
            },
            update: function (event, ui) {
                var order = "";
                $("#sortable").children().each(function (i) {
                    var div = $(this);
                    order += div.attr("id") + '=' + (i + 1) + ';';
                });

                order = order.substr(0, order.length - 1);
                var params = ui.item.data('params');
                params.order = order;

                $.ajax({
                    url: '/IAttachedPhotoAspect/SetOrder',
                    type: 'POST',
                    data: params
                });

            }
        });
        $("#sortable").disableSelection();
    });
</script>
