<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<seo_metadata>>" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="admin.db" %>
<%@ Import Namespace="meridian.bewell.proto" %>
<%
    var fname = ViewData.TemplateInfo.GetFullHtmlFieldName(string.Empty);
    var model = Model;
    var aspectProvider = ViewData["parentModel"] as ISeoMetadataAspectProvider;
    var parent = aspectProvider.GetSeoMetadataAspect(fname);
    var urls = parent.GetUrls();
%>
<% if (parent.id > 0)
   { %>
   <div id="seoMetadataAspectEditor">
       <div id="<%= fname %>SeoMetadata"></div>
       <div style="margin:10px 0"><b>Добавление / обновление записи</b></div>
       <div>
           Для обновления записи, выберите соответствующий ей адрес и заполните новые значения.
       </div>
       <div id="seoMetadataForm">
           <input type="hidden" name="id" value="<%=parent.id %>" />
           <input type="hidden" name="protoName" value="<%=parent.ProtoName %>" />
           <input type="hidden" name="fieldname" value="<%=fname %>" />
           <table>
               <tr>
                   <td>Адрес страницы:</td>
                   <td>
                       <select name="url">
                           <% foreach (var url in urls)
                              { %>
                              <option value="<%= url %>"><%= url %></option>
                           <% } %>
                       </select>
                   </td>
               </tr>
               <tr>
                   <td>Заголовок:</td>
                   <td>
                       <input type="text" name="title"/>
                   </td>
               </tr>
               <tr>
                   <td>Ключевые слова:</td>
                   <td>
                       <input type="text" name="keywords"/>
                   </td>
               </tr>
               <tr>
                   <td>Описание:</td>
                   <td>
                       <input type="text" name="description"/>
                   </td>
               </tr>
               <tr>
                   <td colspan="2">
                       <input type="button" class="_action _addSeoMetadata" value="Добавить / Обновить" data-controller="ISeoMetadataAspect"
                           data-action="AddSeoMetadata" />
                   </td>
               </tr>
           </table>
       </div>
   </div>

<script>
    $(function(){
        $('#seoMetadataAspectEditor').delegate('._action', 'click', function() {
                var $this = $(this);
                var url = '/' + $this.attr('data-controller') + '/' + $this.attr('data-action');
                var params = $this.hasClass("_addSeoMetadata") 
                    ? $("#seoMetadataForm :input").serialize() 
                    : $.parseJSON($this.attr('data-params'));

                $.post(url, params, function() {
                    <%= fname %>SeoMetadataUpdate();
                });
                                                   
                return false;
            });
    });

    function <%= fname %>SeoMetadataUpdate() {
        var $prices = $('#<%= fname %>SeoMetadata');
        $prices.load("/ISeoMetadataAspect/SeoMetadataEditList", { id: <%= parent.id %>, protoName: '<%= parent.ProtoName %>', fieldName: '<%= fname %>' });
    };

    <%= fname %>SeoMetadataUpdate();
</script>
<% }
   else
   { %>
   сохраните объект перед редактированием метаданных
<% } %>