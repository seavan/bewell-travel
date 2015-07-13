<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<meridian.bewell.impl.Classes.MenuLinks>" %>

<% if (Model.Links.Any())
    { %>
    <div class="frame b-menu-middle">
        <ul class="b-menu-middle__list js-tabs">
            <% foreach (var link in Model.Links)
                { %>
                <li class="js-tabs-item <%= link.Url == Model.CurrentUrl ? "b-active" : string.Empty %>">
                    <div>
                        <span>
                             <% if (link.Url == Model.CurrentUrl)
                                { %>
                                <%= link.Title %>
                             <% }
                                else
                                { %>
                                <a href="<%= link.FullUrl %>"><%= link.Title %></a>
                             <% } %>
                             
                         </span>
                    </div>
                </li>
            <% } %>
        </ul>
    </div>
<% } %>

