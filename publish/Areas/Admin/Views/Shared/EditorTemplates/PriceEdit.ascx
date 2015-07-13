<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<IPriceTable>>" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="admin.db" %>
<%@ Import Namespace="meridian.bewell.proto" %>
<%@ Import Namespace="Microsoft.Practices.ObjectBuilder2" %>
<%
    var fname = ViewData.TemplateInfo.GetFullHtmlFieldName(string.Empty);
    var model = Model;
    var parent = ViewData["parentModel"] as IDatabaseEntity;
    var mfi = DateTimeFormatInfo.GetInstance(CultureInfo.CurrentCulture.DateTimeFormat) ?? new DateTimeFormatInfo();
    List<SelectListItem> allMonths = Enumerable.Range(1, 12)
        .Select(month => new SelectListItem
        {
            Text = mfi.GetMonthName(month),
            Value = month.ToString(CultureInfo.InvariantCulture)
        }).ToList();

    //var modelMonths = Model.Select(m => m.Month).ToList();
    //var availableMonths = allMonths.Where(item => !modelMonths.Contains(item.Text));
%>
<% if (parent.id > 0)
   { %>
   <div id="priceAspectEditor">
       <div id="<%= fname %>Price"></div>
       <div style="margin:10px 0"><b>Добавление / обновление записи</b></div>
       <div>
           Для обновления записи, выберите соответствующий ей месяц и заполните новые значения.
       </div>
       <div id="priceForm">
           <input type="hidden" name="id" value="<%=parent.id %>" />
           <input type="hidden" name="protoName" value="<%=parent.ProtoName %>" />
           <input type="hidden" name="fieldname" value="<%=fname %>" />
           <table>
               <tr>
                   <td>Месяц:</td>
                   <td>
                       <select name="month">
                           <% foreach (var option in allMonths)
                              { %>
                              <option value="<%= option.Value %>"><%= option.Text %></option>
                           <% } %>
                       </select>
                   </td>
               </tr>
               <tr>
                   <td>Цена:</td>
                   <td>
                       <input type="text" name="price"/> руб.
                   </td>
               </tr>
               <tr>
                   <td>Комментарий:</td>
                   <td>
                       <input type="text" name="comment"/>
                   </td>
               </tr>
               <tr>
                   <td colspan="2">
                       <input type="button" class="_action _addPrice" value="Добавить / Обновить" data-controller="IPriceTableAspect"
                           data-action="AddPrice" />
                   </td>
               </tr>
           </table>
       </div>
   </div>

<script>
    $(function(){
        $('#priceAspectEditor').delegate('._action', 'click', function() {
                var $this = $(this);
                var url = '/' + $this.attr('data-controller') + '/' + $this.attr('data-action');
                var params = $this.hasClass("_addPrice") 
                    ? $("#priceForm :input").serialize() 
                    : $.parseJSON($this.attr('data-params'));

                $.post(url, params, function() {
                    <%= fname %>PricesUpdate();
                });
                                                   
                return false;
            });
    });

    function <%= fname %>PricesUpdate() {
        var $prices = $('#<%= fname %>Price');
        $prices.load("/IPriceTableAspect/PriceEditList", { id: <%= parent.id %>, protoName: '<%= parent.ProtoName %>', fieldName: '<%= fname %>' });
    };

    <%= fname %>PricesUpdate();
</script>
<% }
   else
   { %>
   сохраните объект перед редактированием цен
<% } %>