
# get libraries -----------------------------------------------------------
source(file = "libraries.R", local = TRUE)$value



# call dataset ------------------------------------------------------------

source(file = "01_data_clean_script/citi_bikes_clean_script.R", local = TRUE)$value



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
  theme(strip.text = element_text(face = "bold")) +
  facet_wrap(~gender) +
  scale_fill_manual(values = c(
    "Male"   = "steelblue",
    "Female" = "#E69F00"
  )) +
  labs(title    = "Year 2018",
       x        = NULL,
       y        = "count") +
  theme_minimal() +
  theme(strip.text = element_text(face = "bold"),
        panel.grid.major.y  = element_line(color = "grey80"),
        panel.grid.minor.y  = element_line(color = "grey80"),
        panel.grid.major.x  = element_blank(),
        panel.grid.minor.x  = element_blank()
  )