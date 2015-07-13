<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<System.Collections.Generic.IEnumerable<meridian.bewell.proto.ILookupValue>>" %>
<%@ Import Namespace="meridian.bewell.proto" %>

<%  var index = 0;
    foreach (var value in Model)
    {
        var cbFieldName = string.Format("{0}.{1}", ViewBag.FieldName, value.id); %>
        <td style="width: 25%">
        <input type="checkbox" id="<%= cbFieldName %>" name="<%= cbFieldName %>" <%= ((IEnumerable<ILookupValue>)ViewBag.SelectedValues).Any(s => s.id.Equals(value.id)) ? "checked" : "" %> />
        <label for="<%= cbFieldName %>"><%= value.title %></label>
    </td>
    <% if (index++ > 2)
        {
            index = 0; %>
            </tr><tr>
    <% } %>
<% } %>