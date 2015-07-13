<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Dictionary<char, int>>" %>

<div class="b-form b-form__filtr letters rus">
    <% foreach (var letter in Model.Keys)
       { %>
       <% if (Model[letter] > 0)
          { %>
            <a href="<%: Url.RouteUrl("Dictionary", new { letter } ) %>" title="<%= letter %>" <%: letter == ViewBag.CurrentLetter ? "class=cur" : string.Empty %>><%= letter %></a>
       <% }
          else
          { %>
            <span><%= letter %></span>
       <% } %>
       
    <% } %>                                	
</div>