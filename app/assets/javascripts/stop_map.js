colors_array = ["blue", "red", "green", "HotPink", "PaleVioletRed", "Brown", "RosyBrown", "SpringGreen", "Khaki", "Thistle", "DodgerBlue", "DeepSkyBlue", "Azure", "LightCoral", "Magenta", "AntiqueWhite", "MistyRose", "Black", "Teal", "Beige", "DarkGoldenRod", "AliceBlue", "LightYellow", "Crimson", "Turquoise", "Moccasin", "DarkSlateGray", "MintCream", "MediumSlateBlue", "SandyBrown", "MediumSpringGreen", "BlanchedAlmond", "Lavender", "Coral", "Green", "PaleTurquoise", "Wheat", "Tan", "PapayaWhip", "Aquamarine", "DarkKhaki", "LightGreen", "Darkorange", "SeaGreen", "Lime", "LightBlue", "LimeGreen", "DimGrey", "LightSlateGray", "MediumOrchid", "DarkGreen", "DimGray", "LightSalmon", "Chartreuse", "Red", "ForestGreen", "PaleVioletRed", "GreenYellow", "LightGray", "DarkGray", "Cyan", "DarkMagenta", "LightSlateGrey", "DarkSeaGreen", "SkyBlue", "CornflowerBlue", "LawnGreen", "SeaShell", "HoneyDew", "Cornsilk", "Purple", "OldLace", "Maroon", "Chocolate", "Aqua", "DarkGrey", "DeepPink", "MidnightBlue", "LemonChiffon", "MediumAquaMarine", "OliveDrab", "BlueViolet", "Bisque", "Gainsboro", "BurlyWood", "Indigo", "White", "Blue", "Plum", "Snow", "Pink", "Yellow", "LightSteelBlue", "Sienna", "Orchid", "DarkRed", "DarkOliveGreen", "OrangeRed", "DarkViolet", "SlateGrey", "SaddleBrown", "PowderBlue", "Navy", "PaleGreen", "Salmon", "MediumTurquoise", "IndianRed", "DarkSlateGrey", "MediumSeaGreen", "Peru", "DarkSlateBlue", "Fuchsia", "Orange", "LightSkyBlue", "LightSeaGreen", "DarkSalmon", "SteelBlue", "FireBrick", "WhiteSmoke", "FloralWhite", "Silver", "Violet", "SlateGray", "Magenta", "YellowGreen", "SlateBlue", "LightPink", "Tomato", "PaleGoldenRod", "LightGoldenRodYellow", "NavajoWhite", "DarkOrchid", "DarkCyan", "Linen", "CadetBlue", "RoyalBlue", "DarkTurquoise", "GhostWhite", "LightCyan", "Olive", "MediumVioletRed", "LavenderBlush", "Gold", "Ivory", "MediumBlue", "PeachPuff", "GoldenRod", "MediumPurple", "DarkBlue", "Grey", "blue", "red", "green", "HotPink", "LightGrey", "Brown", "RosyBrown", "SpringGreen", "Khaki", "Thistle", "DodgerBlue", "DeepSkyBlue", "Azure", "LightCoral", "Magenta", "AntiqueWhite", "MistyRose", "Black", "Teal", "Beige", "DarkGoldenRod", "AliceBlue"]

window.onload = function() {
  var map = new L.Map('stopmap');
    var googleLayer = new L.Google('ROADMAP');
    map.addLayer(googleLayer);

  map.fitBounds([
    [gon.min_lat, gon.min_lon],
    [gon.max_lat, gon.max_lon]
  ]);

  googleLayer = new L.Google("TERRAIN");
  map.addLayer(googleLayer);
  var coodrinates_array = gon.coordinates_array;
  L.marker([gon.stop[0], gon.stop[1]]).addTo(map)
    .bindPopup(gon.stop[2] + ' and ' + gon.stop[3])
    .openPopup();
  coodrinates_array.forEach(function(markers, idx) {
    for (var i= 0; i < markers.length; i++) {
      var lat = markers[i][0];
      var lon = markers[i][1];
      L.circle([lat, lon], 40, {
          color: colors_array[idx],
          fillColor: colors_array[idx],
          fillOpacity: .1
      }).addTo(map);
    };
  });
};