
# call dataset ------------------------------------------------------------

source(here::here("01_data_clean_script/citi_bikes_clean_script.R"), local = TRUE)$value


end_location <- data.frame(
  end_lat = unique(nyc_bikes_clean$end_lat),
  end_long = unique(nyc_bikes_clean$end_long),
  end_station = unique(nyc_bikes_clean$end_station)
)




count_end_station <- nyc_bikes_clean %>% 
  group_by(end_station) %>%
  count() %>%
  arrange(desc(n))

end_location <- end_location %>% 
  left_join(., count_end_station, by = "end_station") %>% 
  arrange(desc(n))


scale_end_station <- ceiling(seq(1, max(count_end_station$n), length.out = 6))
icon_color <- c("lightgray","green", "orange", "red", "darkred")

icon_color[1]
icon_label <- ~paste0(
  "<b>Station: </b>", end_location$end_station, "<br>", 
  end_location$n, " hires were finalized in this station.") %>% 
  lapply(htmltools::HTML)




# visualisation -----------------------------------------------------------
my_icon <- makeAwesomeIcon(
  icon = "circle",
  iconColor = "whitesmoke",
  markerColor = case_when(
    end_location$n < scale_end_station[2] ~ icon_color[1],
    between(end_location$n, scale_end_station[2], scale_end_station[3]) ~ icon_color[2],
    between(end_location$n, scale_end_station[3] + 1 , scale_end_station[4]) ~ icon_color[3],
    between(end_location$n, scale_end_station[4] + 1 , scale_end_station[5]) ~ icon_color[4],
    .default = icon_color[5]
  ),
  library = "fa"
)

leaflet(data = end_location) %>%
  addTiles() %>%
  addAwesomeMarkers(
    lng = ~end_long,
    lat = ~end_lat,
    icon = my_icon,
    popup = icon_label,
    label = icon_label) %>% 
  addLegend(
    title = "Total Hires Finalized Per Station",
    position = "bottomright",
    values = end_location$n, 
    colors = icon_color,
    labels = c(
      paste0("< ", scale_end_station[2]), 
      paste0(scale_end_station[2], " - ", scale_end_station[3]),
      paste0(scale_end_station[3]  + 1, " - ", scale_end_station[4]),
      paste0(scale_end_station[4]  + 1, " - ", scale_end_station[5]),
      paste0("> ", scale_end_station[5])), 
    opacity = 1)