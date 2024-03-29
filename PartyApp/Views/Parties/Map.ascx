﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PartyApp.Models.Party>" %>
<script src="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6.2"type="text/javascript"></script>
<script src="/Scripts/Map.js" type="text/javascript"></script>
<div id="theMap" 
    style="position:absolute; width:699px; height:260px; top: 116px; left: 576px;" >
</div>
<script type="text/javascript">
$(document).ready(function() {
var latitude = <%=Model.Latitude%>;
var longitude = <%=Model.Longitude%>;
if ((latitude == 0) || (longitude == 0))
LoadMap();
else
LoadMap(latitude, longitude, mapLoaded);
 });

function mapLoaded() {
var title = "<%=Html.Encode(Model.Title) %>";
var address = "<%=Html.Encode(Model.Address) %>";
LoadPin(center, title, address);
map.SetZoomLevel(14);
}
</script>


