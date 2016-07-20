$(".page-routes.show").ready(function() {
  window.onload = function() {
    var routeMap = L.map('routemap').fitBounds([
      [gon.min_lat, gon.min_lon],
      [gon.max_lat, gon.max_lon]
    ]);

    googleLayer = new L.Google("ROADMAP");
    routeMap.addLayer(googleLayer);

    var markers = gon.coordinates;

    for (var i= 0; i < markers.length; i++) {
      var lat = markers[i][0];
      var lon = markers[i][1];
      var boardings = markers[i][2];
      var alightings = markers[i][3];
      
      var boardCircle = L.circle([lat, lon], boardings, {
        color: 'red',
        fillColor: '#f03',
        fillOpacity: 0.5
      }).addTo(routeMap);
      boardCircle.bindPopup("Corner of " + markers[i][4] + " and " + markers[i][5])
      
      var alightCirlce = L.circle([lat, lon], alightings, {
        color: 'blue',
        fillColor: 'blue',
        fillOpacity: 0.5
      }).addTo(routeMap);
      alightCirlce.bindPopup("Corner of " + markers[i][4] + " and " + markers[i][5])
    }
  }
});