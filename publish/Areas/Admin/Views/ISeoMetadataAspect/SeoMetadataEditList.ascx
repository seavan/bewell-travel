<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<System.Collections.Generic.IEnumerable<meridian.bewell.proto.seo_metadata>>" %>
<% if (Model != null)
   { %>
   <table>
       <thead>
           <tr>
               <th>Адрес страницы</th>
               <th>Заголовок</th>
               <th>Ключевые слова</th>
               <th>Описание</th>
               <th></th>
           </tr>
       </thead>
       <tbody>
       <% foreach (var metadata in Model)
          { %>
            <tr>
                <td>
                    <%= metadata.url %>
                </td>
                <td>
                    <%= metadata.title %>
                </td>
                <td>
                    <%= metadata.keywords %>
                </td>
                <td>
                    <%= metadata.description %>
                </td>
                <td>
                    <a href="javascript:void(0);" data-params='{ "id": "<%= metadata.id %>", "proto": "<%= metadata.ProtoName %>" }'
                    data-controller="ISeoMetadataAspect" data-action="Delete" class="_delete _action">удалить</a>
                </td>
            </tr>
        <% } %>
        </tbody>
   </table>
<% } %>