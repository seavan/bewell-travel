<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<meridian.bewell.proto.news>>" %>

<dl class="b-info__news fl_l">
    <dt>
        <span class="title">что нового</span>
        <span class="b-info__news__link">
            <a href="<%: Url.Action("index", "news") %>">все новости</a> (<%= ViewBag.Count %>)
        </span>
        
    </dt>
    <dd>
        <ul class="b-info__news__list">
            <% if (Model.Any())
               {
                   foreach (var news in Model)
                   { %>
               <li>
                   <span class="b-info__news__list__date"><%= news.publish_date.ToString("dd.MM") %></span>
                   <a href="<%= news.GetNewsNews_categorie().EntityUrl %>"><%= news.GetNewsNews_categorie().title %></a><br />
                   <%--TODO: ссылка на новость--%>
                   <a href="<%= news.EntityUrl %>"><%= news.title %></a> 
               </li>
            <% }
               }
               else
               { %>
                <li>Нет новостей</li>
               <% } %>
        </ul>
    </dd>
</dl>
