

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


#--------------------

library(gridExtra)

female <- incidence_health_board_clean %>% 
  filter(sex == "Female") %>% 
  group_by(hb_name) %>% 
  summarise(nr_crude_rate = round(sum(crude_rate, digits = 0))) %>% 
  ggplot(aes(x = hb_name, y = nr_crude_rate)) +
  geom_col(position = "dodge") +
  labs(
       x = NULL, 
       y = NULL) +
  theme_minimal() +
  theme(
    # panel.grid.major.y = element_blank(),
    # panel.grid.minor.y = element_blank(),
    # legend.position = "bottom", 
    # legend.title = element_blank(),
    # strip.text = element_text(face = "bold")
    panel.grid = element_blank(),
    legend.title  = element_blank(),
    axis.text = element_blank()
    ) +
  coord_flip() +
  geom_text(aes(label = nr_crude_rate), 
            position = position_stack(vjust = 0.5), 
            size = 3, 
            hjust = -0.1) +
  scale_y_reverse()







male <- incidence_health_board_clean %>% 
  filter(sex == "Male") %>% 
  group_by(hb_name) %>% 
  summarise(nr_crude_rate = round(sum(crude_rate, digits = 0))) %>% 
  ggplot(aes(x = hb_name, y = nr_crude_rate)) +
  geom_col(position = "dodge") +
  labs(
    x = NULL, 
    y = NULL) +
  theme_minimal() +
  theme(
    # panel.grid.major.y = element_blank(),
    # panel.grid.minor.y = element_blank(),
    # legend.position = "bottom", 
    # legend.title = element_blank(),
    # strip.text = element_text(face = "bold")

      panel.grid = element_blank(),
      legend.title  = element_blank(),
      axis.text.x = element_blank(),
      axis.text.y = element_text(color = "black", angle = 0, size = 14, hjust = 0.0)

    ) +
  coord_flip() +
  geom_text(aes(label = nr_crude_rate), 
            position = position_stack(vjust = 0.5), 
            size = 3, 
            hjust = -0.1)


grid.arrange(female, male, ncol = 2, widths = c(1, 1), padding = 0)
