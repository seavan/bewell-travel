<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<meridian.bewell.proto.IFieldsetAspect>" %>
<%@ Import Namespace="meridian.bewell.proto" %>
<%
    var prefix = Model.FieldName;
    var id = prefix + "Fieldset";
    var saveFunction = "save" + id;
    var controller = "IFieldsetAspect";
    var method = "Save";
    var parentProto = Model.GetParent().ProtoName;
    var parentId = Model.GetParent().id;
    var passed = new SortedList<long, bool>();

    var availableCategories = Model.GetCategories().ToList();
    var fieldName = String.Format("{0}.value", prefix);
    
%>
<div id="<%= id %>" data-uri="/<%= controller %>/<%= method %>" data-prefix="<%= prefix %>"
    data-parent-id="<%= parentId %>" data-parent-proto="<%= parentProto %>">
    <ul class="js-tabs">
        <% for (var i = 0; i < availableCategories.Count; i++)
           { %>
        <li class="js-tabs-item <%= i == 0 ? "b-active" : string.Empty %>" data-tab="tab-<%= i %>">
            <span>
                <%= availableCategories[i].title%></span> </li>
        <% } %>
    </ul>
    <div class="js-tabs-content">
        <%  for (var index = 0; index < availableCategories.Count; index++)
            {
                var v = availableCategories[index];
                var existingValues = v.GetValues();
                var sortedValues = new SortedList<long, ICategoryItemValue>();
                foreach (var e in existingValues)
                {
                    sortedValues[e.GetEntityId()] = e;
                }
                   
        %>
        <div id="tab-<%= index %>">
            <%
                foreach (var i in v.GetAvailableValues())
                {
                    bool disabled = false;
                    disabled = (passed.ContainsKey(i.id));
                    var cbFieldName = String.Format("{0}.{1}", fieldName, i.id);
                    %>
                    <div style="margin:10px"><b><%= i.title %></b></div>
                    <%
                    if (disabled)
                    { %>
                        <textarea type="text" rows="3" cols="40" disabled="disabled" style="background: #EFEFEF"><%= sortedValues.IndexOfKey(i.id) != -1 ? sortedValues[i.id].Value() : "" %></textarea>
                 <% }
                    else
                    { %>
                        <textarea type="text" rows="3" cols="40" class="_visual" id="<%= cbFieldName %>" name="<%= cbFieldName %>"><%= sortedValues.IndexOfKey(i.id) != -1 ? sortedValues[i.id].Value() : "" %></textarea>
                <%  }
                    
                    passed[i.id] = true;
                }
            %>
        </div>
        <% } %>
    </div>
</div>
<div>
    <a class="_link" href="#" onclick="return saveFunction('#<%= id %>')" style="float: right">
        Сохранить справочник</a>
</div>
<script>
    if (saveCallbacks) {
        saveCallbacks.push(function () {
            saveFunction('#<%= id %>');
        });
    }

    (function () {
        $('.js-tabs-content').children().hide().first().show();

        $(".js-tabs-item").click(function (e) {
            var $tabsItem = $(this);
            $tabsItem.addClass("b-active").siblings().removeClass("b-active");

            $('.js-tabs-content').find('#' + $tabsItem.data("tab")).show().siblings().hide();
        });
    })();

</script>
