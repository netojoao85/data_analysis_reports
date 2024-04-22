
# call dataset ------------------------------------------------------------

source(here::here("01_data_clean_script/citi_bikes_clean_script.R"), local = TRUE)$value



# visualisation -----------------------------------------------------------

nyc_bikes_clean %>% 
  index_by(month) %>% 
  group_by(gender) %>% 
  summarise(n_hires = n()) %>% 
  filter(gender %in% c("Male", "Female")) %>% 
  ggplot() +
  aes(x = month, 
      y = n_hires, 
      fill = gender) +
  geom_col(show.legend = FALSE) +
  geom_text(aes(label = n_hires), 
            size = 3, 
            vjust = -0.3) +
  facet_wrap(~gender) +
  scale_fill_manual(values = c(
    "Male"   = "#A6CEE3",
    "Female" = "pink"
  )) +
  labs(title    = NULL,
       x        = NULL,
       y        = NULL) +
  theme_minimal() +
  theme(strip.text = element_text(face = "bold"),
        panel.grid.major.y  = element_line(color = "grey80"),
        panel.grid.minor.y  = element_line(color = "grey90"),
        panel.grid.major.x  = element_blank(),
        panel.grid.minor.x  = element_blank(),
        panel.background = element_rect(fill = "#F7F7F7", colour = "#f7f7f7"),
        plot.background = element_rect(fill = "#F7F7F7", colour = "#f7f7f7"))