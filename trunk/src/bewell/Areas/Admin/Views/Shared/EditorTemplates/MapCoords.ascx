<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="admin.db" %>

<%
    var fname = ViewData.TemplateInfo.GetFullHtmlFieldName(string.Empty);
    var geo = ViewData["parentModel"] as meridian.bewell.proto.IGeoLocation;
    var parent = ViewData["parentModel"] as IDatabaseEntity;
%>
<style type="text/css">
    .b-getlonglat-view-information {font-size: 10px;font-family: Verdana;position: absolute;line-height: 20px;width: 235px;height: 20px;padding: 5px;background: #fff;border: solid 1px #ccc;cursor : default;}
    .b-getlonglat-view-information .b-getlonglat-element {position: relative;display: block;padding-bottom: 10px;}
    .b-getlonglat-view-information .b-getlonglat-element input {font-size: 10px;position: absolute;right: 0; width: 110px; padding: 2px;}
</style>

<span>Выберите тип карты:</span><br/><br/>
<select name="useGoogleMap" class="_useGoogleMap">
    <option value="Y" <%: geo.NoYandexYesGoogle ? "" : "selected='selected'" %>>Использовать Яндекс-карты</option>
    <option value="G" <%: !geo.NoYandexYesGoogle ? "" : "selected='selected'" %>>Использовать Гугл-карты</option>
</select>
<br/><br/>


<div id="ymap-wrapper" class="Y MapContainer" <%: geo.NoYandexYesGoogle    ? "style=display:none;" : "" %>>
    <%Html.RenderPartial("YMapCoords"); %>
    
    <div>
        <a class="_link" href="#" onclick="return saveFunction('#YMapsID')" style="float: right">
            Сохранить значение
        </a>
    </div>
</div>

<div id="gmap-wrapper" class="G MapContainer" <%: !geo.NoYandexYesGoogle ? "style=display:none;" : "" %>>
    <%Html.RenderPartial("GMapCoords"); %>
    
    <div>
        <a class="_link" href="#" onclick="return saveFunction('#GMapsID')" style="float: right">
            Сохранить значение
        </a>
    </div>
</div>

<script type="text/javascript">
    if (saveCallbacks) {
        saveCallbacks.push(function () {
            saveFunction($("#ymap-wrapper").is(":visible") ? '#YMapsID' : '#GMapsID');
        });
    }
</script>
  
 <script type="text/javascript">

     $(function () {
         $('select._useGoogleMap').change(function (event) {
             $('.MapContainer').hide();
             $('.' + $(this).val() + '.MapContainer').show();
             gMapload();
             yMap.redraw();
         });

         $('.YMaps-search-control-text').live("keydown", function (e) {
             if (e.keyCode == 13) {
                 e.preventDefault();
                 $(this).closest('.YMaps-btn').find('.YMaps-search-control-submit').click();
             }
         });
     });
 </script>

<%--<input class="text-box single-line" id="<%:fname %>" name="<%:fname %>" type="text" value="<%= Model %>" />--%>