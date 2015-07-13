<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<meridian.bewell.proto.IGeoLocation>" %>
<%@ Import namespace="meridian.bewell.proto" %>

<%if (Model == null) { %>
<div>Тут будет карта</div>
<%} %>

<%
    string baseCoords = "[37.617671,55.755768]"; //Центр Москвы

    List<IGeoLocation> ListPoints = new List<IGeoLocation>();
    
    if(Model != null )
    {
        ListPoints = Model.GetLinkedEntities().Where(p => p.GeoLocationCoordinates != null && p.GeoLocationCoordinates != "").ToList();
        baseCoords = string.Format("[{0}]", Model.GeoLocationCoordinates);
        
    }

    string groups = "[";
    groups += "\r\n{\"name\": \"" + Model.GeoLocationTitle.ClearGeoLocationData() + "\", \"items\": [";


    groups += string.Join(",", ListPoints.Select(i => "{ \"center\": [" + i.GeoLocationCoordinates + "], " +
                                                    "\"balloonContentHeader\": \"" + i.GeoLocationTitle.ClearGeoLocationData() + "\", " +
                                                    "\"balloonContentHeaderLink\": \"" + i.GetGeoLocationUri() + "\"}\r\n"));

    if (ListPoints.Count() > 0)
    {
        groups += ",";
    }
    groups += "{ \"center\": [" + Model.GeoLocationCoordinates + "], " +
              "\"balloonContentHeader\": \"" + Model.GeoLocationTitle.ClearGeoLocationData() + "\", " +
              "\"balloonContentHeaderLink\": \"" + Model.GetGeoLocationUri() + "\"}\r\n";
    
    groups += "]}";
    groups += "]";
    
%>


<%if(Model.NoYandexYesGoogle){%>
<script type="text/javascript" src="/content/js/gmap.js"></script>
<%}else{%>
<script type="text/javascript" src="/content/js/ymap.js"></script>
<%} %>


<script type="text/javascript">
    $(function () {
        InitMap(<%= baseCoords %>, <%= groups %>,'<%: ViewBag.IndexMap != null ? ViewBag.IndexMap : ""%>', '<%: ViewBag.ZoomMap != null ? ViewBag.ZoomMap : ""%>');
    });
</script>

<div class="map" id="geoMap<%: ViewBag.IndexMap != null ? ViewBag.IndexMap : ""%>"></div>
<input type="hidden" id="baseCoordsField_<%: ViewBag.IndexMap != null ? ViewBag.IndexMap : ""%>" value='<%= baseCoords %>'/>
<input type="hidden" id="groupsField_<%: ViewBag.IndexMap != null ? ViewBag.IndexMap : ""%>" value='<%= groups %>'/>