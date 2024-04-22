
# call dataset ------------------------------------------------------------

source(here::here("01_data_clean_script/citi_bikes_clean_script.R"), local = TRUE)$value


# visualisation -----------------------------------------------------------

nyc_bikes_clean %>% 
  index_by(month) %>% 
  summarise(count = n()) %>% 
  ggplot(aes(x = month, y = count)) +
  geom_point(size = 4, color = "#1F78B4", shape = 16) + 
  geom_line(group = 1, size = 1) +
  labs(title = NULL,
       subtitle = NULL,
       x = NULL,
       y = NULL) +
  geom_text(aes(label = count),  size = 3, vjust = -0.9, hjust = 1.2) +
  theme_minimal() +
  theme(panel.grid.minor.y = element_blank(),
        panel.background = element_rect(fill = "#F7F7F7", colour = "#f7f7f7"),
        plot.background = element_rect(fill = "#F7F7F7", colour = "#f7f7f7")
       ) +
  geom_vline(xintercept = seq(3, 12, 3),
             linetype    = "longdash",
             size = 0.8) +
  annotate("text", 
           x     = c(1.5, 4.5, 7.5, 10.5), 
           y     = 850, 
           label = c("Winter", "Spring", "Summer", "Autumn"),
           size  = c(4, 4, 4, 4)
  )
