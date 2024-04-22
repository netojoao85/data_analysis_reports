
# call dataset ------------------------------------------------------------

source(here::here("01_data_clean_script/citi_bikes_clean_script.R"), local = TRUE)$value


start_location <- data.frame(
  start_lat = unique(nyc_bikes_clean$start_lat),
  start_long = unique(nyc_bikes_clean$start_long),
  start_station = unique(nyc_bikes_clean$start_station)
)



count_start_station <- nyc_bikes_clean %>% 
  group_by(start_station) %>%
  count() %>%
  arrange(desc(n))

start_location <- start_location %>% 
  left_join(., count_start_station, by = "start_station") %>% 
  arrange(desc(n))


scale_start_station <- ceiling(seq(1, max(count_start_station$n), length.out = 6))
icon_color <- c("lightgray","blue", "darkred", "orange", "green")

icon_color[1]
icon_label <- ~paste0(
  "<b>Station: </b>", start_location$start_station, "<br>", 
  start_location$n, " hires started from here") %>% 
  lapply(htmltools::HTML)


# Visualisation -----------------------------------------------------------

my_icon <- makeAwesomeIcon(
  icon = "circle",
  iconColor = "whitesmoke",
  markerColor = case_when(
    start_location$n < scale_start_station[2] ~ icon_color[1],
    between(start_location$n, scale_start_station[2], scale_start_station[3]) ~ icon_color[2],
    between(start_location$n, scale_start_station[3] + 1 , scale_start_station[4]) ~ icon_color[3],
    between(start_location$n, scale_start_station[4] + 1 , scale_start_station[5]) ~ icon_color[4],
    .default = icon_color[5]
  ),
  library = "fa"
)


leaflet(data = start_location) %>% 
  addTiles() %>% 
  addAwesomeMarkers(
    lng = ~start_long,
    lat = ~start_lat,
    icon = my_icon,
    label = icon_label,
    popup = icon_label) %>% 
  addLegend(
    title = "Total hires per Station",
    position = "bottomright",
    values = start_location$n, 
    colors = icon_color,
    labels = c(
      paste0("< ", scale_start_station[2]), 
      paste0(scale_start_station[2], " - ", scale_start_station[3]),
      paste0(scale_start_station[3]  + 1, " - ", scale_start_station[4]),
      paste0(scale_start_station[4]  + 1, " - ", scale_start_station[5]),
      paste0("> ", scale_start_station[5])), 
    opacity = 1)
