# =======================================================================================================  Initialize GOOGLE MAP
initializeGMaps = ->
  lat = 49.847205
  lng = 24.025483
  latlng = new google.maps.LatLng(lat, lng)

  # Create an array of styles.
  styles = [
    {
      elementType: "geometry"
      stylers: [
#        { "visibility": "on" },
        { "weight": 1.2 },
#        { "hue": "#ffd500" },
#        { "lightness": 2 },
#        { "gamma": 0.8 }
        {
          visibility: "simplified"
        }
      ]
    }
    {
      featureType: "road"
      elementType: "labels"
      stylers: [visibility: "off"]
    }
  ]

  # Create a new StyledMapType object, passing it the array of styles,
  # as well as the name to be displayed on the map type control.
  styledMap = new google.maps.StyledMapType(styles,
    name: "Styled Map"
  )

  # Create a map object, and include the MapTypeId to add
  # to the map type control.
  mapOptions =
    zoom: 14
    center: latlng
    scrollwheel: false
    mapTypeControlOptions:
      mapTypeIds: [
        google.maps.MapTypeId.ROADMAP
        "map_style"
      ]

  map = new google.maps.Map(document.getElementById("g-map"), mapOptions)

  #Associate the styled map with the MapTypeId and set it to display.
  map.mapTypes.set "map_style", styledMap
  map.setMapTypeId "map_style"
  #    marker
  marker = new google.maps.Marker(
    position: latlng
    map: map
    title: "«MAGIA OBRUS»"
    icon: '/assets/MO-map-marker.png'
  )
  return

# ======================================================================================================== end GOOGLE MAP
google.maps.event.addDomListener window, "load", initializeGMaps
