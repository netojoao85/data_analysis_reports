
# get libraries -----------------------------------------------------------
source(file = "libraries.R", local = TRUE)$value



# call dataset ------------------------------------------------------------

citi_bikes <- source(file = "01_data_clean_script/citi_bikes_clean_script.R", local = TRUE)$value


# visualisation -----------------------------------------------------------
my_icon <- makeAwesomeIcon(
  icon = "circle",
  iconColor = "black",
  markerColor = "green",
  library = "fa"
)

leaflet(data = citi_bikes) %>% 
  addTiles() %>% 
  addMarkers(
    lng = ~start_long,
    lat = ~start_lat,
    icon = my_icon,
    popup = citi_bikes$start_station
  )