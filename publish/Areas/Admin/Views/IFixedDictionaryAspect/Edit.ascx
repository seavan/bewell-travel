<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<meridian.bewell.proto.IDictionaryValuesAspect>" %>

<div>
    <%
        var cats = Model.GetCategories();
        var values = Model.GetValues();
        var prefix = Model.FieldName;
        var id = prefix + "Dictionary";
        var saveFunction = "save" + id;
        var controller = "IFixedDictionaryAspect";
        var method = "Save";
        var parentProto = Model.GetParent().ProtoName;
        var parentId = Model.GetParent().id;
    %>
    <table id="<%= id %>" data-uri="/<%= controller %>/<%= method %>" data-prefix="<%= prefix %>" data-parent-id="<%= parentId %>" data-parent-proto="<%= parentProto %>">
    <%
        foreach (var cat in cats)
        {
            var availableValues = cat.GetAllValues();
            var fieldName = String.Format("{0}.{1}.value", prefix, cat.id);
            %>
            <tr>
                <td><%= cat.title %></td>
                <td>
                    <% if (cat.MultiValue)
                       {
                           foreach (var v in availableValues)
                           {
                               var cbFieldName = String.Format("{0}.{1}", fieldName, v.ValueId);
                    %>
                       <label for="<%= cbFieldName %>" ><%= v.Value %></label><input type="checkbox" id="<%=cbFieldName%>" name="<%=cbFieldName%>" <%= values.Any(s => s.ValueId.Equals(v.ValueId)) ? "checked" : "" %>/>
                       
                    <%
                           }
                       }
                       else
                       { %>
                    <select name="<%=fieldName%>">
                        <option value="0">не выбрано</option>
                        <%
                            
                            foreach (var v in availableValues)
                            {
                        %>
                                <option value="<%= v.id %>" <%= values.Any(s => s.Category != null && s.Category.id.Equals(cat.id) && s.ValueId.Equals(v.id)) 
                                 ? "selected" : "" %>><%= v.Value %></option>
                                    <%
                            }
                                    %>
                        
                    </select>
                    <% } %>
                </td>
            </tr>
            <%
        }
         %>
    </table>
    <div>
        <a class="_link" href="#" onclick="return saveFunction('#<%= id %>')" style="float: right">Сохранить справочник</a>
    </div>
</div>
<script>
    if (saveCallbacks) {
        saveCallbacks.push(function () {
            saveFunction('#<%= id %>');
        });
    }
</script>