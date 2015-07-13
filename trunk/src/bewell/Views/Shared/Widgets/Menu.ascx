<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<meridian.bewell.proto.pages>>" %>

<% foreach (var page in Model)
    { %>
    <li <%= page.SubPages.Any() ? (ViewBag.IsRoot ? "class=dropdown" : "class=dropdown-submenu") : string.Empty  %>>
        <% if (page.SubPages.Any())
           { %>
           <% if (ViewBag.IsRoot)
              { %>
                <div class="menu-root-caret-wrapper"><i class="menu-root-caret"></i></div>
           <% }
              else
              { %>
                <div class="menu-caret-wrapper"><i class="menu-sub-caret"></i></div>
           <% } %>
           
           <ul class="dropdown-menu">
               <% Html.RenderPartial("Widgets/Menu", page.SubPages, new ViewDataDictionary{{"IsRoot", false}}); %>
           </ul>
        <% } %>
        
        <a href="<%= page.GetPageUrl() %>">
            <%= page.title %>
        </a>
    </li>
<% } %>
