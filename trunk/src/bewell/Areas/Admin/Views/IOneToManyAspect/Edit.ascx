<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<meridian.bewell.proto.IOneToManyAspect>" %>
<%@ Import Namespace="meridian.bewell.proto" %>
<%
    string prefix = Model.FieldName;
    string id = prefix + "OneToMany";
    const string controller = "IOneToManyAspect";
    const string method = "Save";
    string parentProto = Model.GetParent().ProtoName;
    long parentId = Model.GetParent().id;
    IEnumerable<ILookupValue> availableValues = Model.GetAvalableValues();
    IEnumerable<ILookupValue> selectedValues = Model.GetSelectedValues();
    Dictionary<string, IEnumerable<ILookupValue>> availableGroupValues = Model.GetAvailableGroupValues();
    string fieldName = string.Format("{0}.value", prefix);
%>
<div id="<%= id %>" data-uri="/<%= controller %>/<%= method %>" data-prefix="<%= prefix %>"
    data-parent-id="<%= parentId %>" data-parent-proto="<%= parentProto %>">
    
    <% if (availableGroupValues != null)
       { %>
           <table>
           <% foreach (var key in availableGroupValues.Keys)
              { %>
              <tr>
                  <td colspan="4"><b><%= key %></b></td>
              </tr>
              <tr>
                  <%Html.RenderPartial("OneToManyList", availableGroupValues[key], new ViewDataDictionary{{"FieldName", fieldName}, {"SelectedValues", selectedValues}}); %>
              </tr>
           <% } %>
           </table>
    <% }
       else
       { %>
        <table>
            <tr>
                <%Html.RenderPartial("OneToManyList", availableValues, new ViewDataDictionary { { "FieldName", fieldName }, { "SelectedValues", selectedValues } }); %>
            </tr>
        </table>
    <% } %>
</div>
<div>
    <a class="_link" href="#" onclick="return saveFunction('#<%= id %>')" style="float: right">
        Сохранить справочник
    </a>
</div>
<script type="text/javascript">
    if (saveCallbacks) {
        saveCallbacks.push(function () {
            saveFunction('#<%= id %>');
        });
    }
</script>
