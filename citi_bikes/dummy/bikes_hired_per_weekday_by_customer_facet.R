
# call dataset ------------------------------------------------------------

source(here::here("01_data_clean_script/citi_bikes_clean_script.R"), local = TRUE)$value


# visualisation -----------------------------------------------------------

nyc_bikes_clean %>% 
  index_by(week_day) %>% 
  group_by(type) %>% 
  summarise(count = n()) %>% 
  ggplot() +
  aes(x = week_day,
      y = count,
      fill = type) +
  geom_col() +
  theme_minimal() +
  scale_fill_manual(values = c("grey90", 
                               "lightblue")) +
  geom_text(aes(label = count),
            size = 4,
            position = position_stack(vjust = 0.5),
            vjust = -0.00) +
  labs(title = NULL,
       x = NULL, 
       y = NULL) +
  theme(panel.grid.minor.y = element_blank(),
        legend.position    = "bottom",
        legend.title       = element_blank(),
        panel.grid.major.x = element_blank()
  )