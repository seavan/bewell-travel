<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<System.Collections.Generic.IEnumerable<meridian.bewell.proto.IPriceTable>>" %>
<% if (Model != null)
   { %>
   <table>
       <thead>
           <tr>
               <th>Месяц</th>
               <th>Цена</th>
               <th>Комментарий</th>
               <th></th>
           </tr>
       </thead>
       <tbody>
       <% foreach (var price in Model)
          { %>
            <tr>
                <td>
                    <%= price.Month %>
                </td>
                <td>
                    <%= price.Price %> руб.
                </td>
                <td>
                    <%= price.Comment %>
                </td>
                <td>
                    <a href="javascript:void(0);" data-params='{ "id": "<%= price.id %>", "proto": "<%= price.ProtoName %>" }'
                    data-controller="IPriceTableAspect" data-action="Delete" class="_delete _action">удалить</a>
                </td>
            </tr>
        <% } %>
        </tbody> 
   </table>
<% } %>