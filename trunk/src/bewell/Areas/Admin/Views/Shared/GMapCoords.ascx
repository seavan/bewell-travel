<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="admin.db" %>

<%
    var fname = ViewData.TemplateInfo.GetFullHtmlFieldName(string.Empty);
    var geo = ViewData["parentModel"] as meridian.bewell.proto.IGeoLocation;
    var parent = ViewData["parentModel"] as IDatabaseEntity;
%>

<div id="GMapsID" style="width:690px;height:450px" class="GMapsID" 
data-uri="/IMapAspect/Save" data-prefix="<%= fname %>" data-parent-id="<%= parent.id %>" data-parent-proto="<%= parent.ProtoName %>" data-curcoords="<%: geo.GeoLocationCoordinates %>"></div>

<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&language=ru" type="text/javascript"></script>
<script type="text/javascript" src="/content/js/ggetlonglat.js"></script>
<script type="text/javascript">gMapload();</script>