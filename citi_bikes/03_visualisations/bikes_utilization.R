
# call dataset ------------------------------------------------------------

source(here::here("01_data_clean_script/citi_bikes_clean_script.R"), local = TRUE)$value



# visualisation -----------------------------------------------------------

nyc_bikes_clean %>% 
  index_by(month) %>% 
  group_by(bike_id) %>% 
  summarise(count = n()) %>% 
  ungroup() %>% 
  index_by(month) %>% 
  slice_max(count, 
            n = 1, 
            with_ties = FALSE) %>% 
  ggplot() +
  aes(x = month, y = count, fill = bike_id) +
  geom_col() +
  geom_text(aes(label = bike_id), size = 4, angle = 90, position = position_stack(vjust = 0.5)) +
  geom_text(aes(label = count), size = 4, vjust = -0.3) +
  labs(
    title = "Year 2018",
    x = NULL,
    y = NULL,
  ) +
  theme_minimal() +
  # scale_fill_manual(values = c(
  #   "3186 - 3203" = "#ea8a98",
  #   "3203 - 3186" = "#9bbf8d",
  #   "3213 - 3186" = "lightblue",
  #   "3276 - 3186" = "grey50"),
  #   name = "from - to"
  # ) +
  theme(
    # panel.grid.minor.y = element_blank(),
    panel.grid.major.x = element_blank())
  # scale_y_continuous(breaks = seq(0, 15, 3))
