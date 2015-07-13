<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<%int pagesCount = Model.GetType().GetProperty("PagesCount").GetValue(Model, null);
  if(pagesCount>1){%>
<ul class="b-pager">
 <% 
    
    int currentPage = Model.GetType().GetProperty("Page").GetValue(Model, null);
    var prop = Model.GetType().GetProperty("anchor");
    string anchor = prop == null ? "" : prop.GetValue(Model, null);
    const int showCount = 7;
    const int mid = showCount / 2;

    NameValueCollection queryCollection = HttpUtility.ParseQueryString(Request.Url.Query);
    queryCollection.Remove("page");

    string query = queryCollection.Count > 0
        ? "?" + queryCollection + "&page="
        : "?page=";


    if (currentPage != 1)
    {
        %><li class="b-pager__prev"><a href="<%= query %><%= currentPage - 1 %><%:anchor%>"><i class="b-arrow b-pager__arrow"></i>Предыдущая страница</a></li><%
    }
    int i;

    int maxBound = Math.Min(Math.Max(currentPage + mid, showCount), pagesCount);
    int minBound = Math.Max(maxBound - showCount + 1, 1);

    for (i = minBound; i <= maxBound; i++)
    {
         %> <li><% if (i == currentPage) { %><span><%=i %></span> <%} else{ %> <a href="<%= query %><%= i %><%:anchor%>" title="<%= i %>"><%= i %></a> <%} %></li><%
    }
    
    if (currentPage != pagesCount)
    {
        %><li class="b-pager__next"><a href="<%= query %><%= currentPage + 1 %><%:anchor%>"><i class="b-arrow b-pager__arrow"></i>Следующая страница</a></li><%
    }
    
    %>
</ul>


<%}%>
