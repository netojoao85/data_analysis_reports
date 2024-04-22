

scale_max <- nyc_bikes_clean %>% 
  index_by(week_day) %>% 
  group_by(type) %>% 
  summarise(count = n()) %>% 
  slice_max(count, n = 1) %>% 
  pull()



plot1 <- nyc_bikes_clean %>% 
  index_by(week_day) %>% 
  filter(type == "Customer") %>% 
  summarise(count = n()) %>% 
  ggplot() +
  aes(y = week_day,
      x = count) +
  geom_col(fill = "#1F78B4") +
  theme_minimal() +
  geom_text(aes(label = count),
            size = 4, color = "black",
            vjust = 0.50, hjust = 1.2) +
  labs(title = NULL,
       x = NULL, 
       y = NULL) +
  theme(
    panel.grid = element_blank(),
    legend.title  = element_blank(),
    axis.text = element_blank()
  ) + 
  scale_x_reverse() +
  xlim(scale_max + 60,0)
  


plot2 <- nyc_bikes_clean %>% 
  index_by(week_day) %>% 
  filter(type == "Subscriber") %>% 
  summarise(count = n()) %>% 
  ggplot() +
  aes(y = week_day,
      x = count) +
  geom_col(fill = "#A6CEE3") +
  theme_minimal() +
  geom_text(aes(label = count),
            size = 4, color = "black",
            vjust = 0.50, hjust = -0.20) +
  labs(title = NULL,
       x = NULL, 
       y = NULL) +
  theme(
      panel.grid = element_blank(),
      legend.title  = element_blank(),
      axis.text.x = element_blank(),
      axis.text.y = element_text(color = "black", angle = 0, size = 14, hjust = 0.0),
      
  ) +
  xlim(0, scale_max + 60)

grid.arrange(plot1, plot2, ncol = 2, widths = c(1, 1), padding = 0)
