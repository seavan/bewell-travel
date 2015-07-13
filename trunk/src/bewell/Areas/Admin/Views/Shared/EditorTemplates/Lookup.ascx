<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<long>" %>
<%@ Import Namespace="admin.db" %>
<%@ Import Namespace="meridian.bewell.proto" %>
<%
    var fname = ViewData.TemplateInfo.GetFullHtmlFieldName(string.Empty);
    var parent = ViewData["parentModel"] as ILookupValueAspectProvider;
%>
<div>
    <%
        if (parent != null)
        {
            var aspect = parent.GetLookupValueAspect(fname);
    %>
    <select name="<%=fname%>">
        <option value="0">не выбрано</option>
        <%
            foreach (var v in aspect.GetValues())
            {
        %>
        <option <%= v.GetLookupValueDisabled() ? "disabled='disabled'" : ""%> value="<%= v.id %>" <%= v.id == Model
                                 ? "selected" : "" %>>
            <%= new String('.', v.GetLookupValueLevel() * 5) %><%= v.title %></option>
        <%
            }
        %>
    </select>
    <%
        }
    %>
</div>
