library(brew)
# call dataset ------------------------------------------------------------

source(here::here("01_data_clean_script/citi_bikes_clean_script.R"), local = TRUE)$value


# visualisation -----------------------------------------------------------

most_frequent_journey <- nyc_bikes_clean %>% 
  index_by(month) %>% 
  group_by(station_travel) %>% 
  summarise(count_travels = n()) %>% 
  ungroup() %>% 
  index_by(month) %>% 
  slice_max(count_travels, 
            n = 1, 
            with_ties = FALSE)


most_frequent_journey %>% 
  ggplot() +
  aes(x = month, y = count_travels, fill = station_travel) +
  geom_col() +
  geom_text(aes(label = station_travel), size = 4, angle = 90, position = position_stack(vjust = 0.5)) +
  geom_text(aes(label = count_travels), size = 4, vjust = -0.3) +
  labs(
    title = NULL,
    x = NULL,
    y = NULL,
  ) +
  theme_minimal() +
  scale_fill_brewer(palette = 4, direction = -1) +
  # scale_fill_manual(values = c(
  #   "3186 - 3203" = "firebrick",
  #   "3203 - 3186" = "orange",
  #   "3213 - 3186" = "darkgreen",
  #   "3276 - 3186" = "#1F78B4"),
  #   name = "from - to"
  # ) +
  theme(
    panel.grid.minor.y = element_blank(),
    panel.grid.major.x = element_blank(),
    legend.position = "bottom",
    legend.title = element_blank(),
    panel.background = element_rect(fill = "#F7F7F7", colour = "#f7f7f7"),
    plot.background = element_rect(fill = "#F7F7F7", colour = "#f7f7f7")
  ) +
  scale_y_continuous(breaks = seq(0, 15, 3))
