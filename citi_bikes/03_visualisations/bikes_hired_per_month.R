

# get libraries -----------------------------------------------------------
source(file = here::here("libraries.R"), local = TRUE)$value



# call dataset ------------------------------------------------------------

source(file = "01_data_clean_script/citi_bikes_clean_script.R", local = TRUE)$value



# visualisation -----------------------------------------------------------

plot<- nyc_bikes_clean %>% 
  index_by(month) %>% 
  summarise(count = n()) %>% 
  ggplot(aes(x = month, y = count)) +
  geom_point(size = 3) + 
  geom_line(group = 1, size = 1) +
  labs(title = "Year 2018",
       subtitle = "",
       x = NULL,
       y = "bike reting per month") +
  geom_text(aes(label = count),  size = 3, vjust = -0.9, hjust = 1.2) +
  theme_minimal() +
  theme(panel.grid.minor.y = element_blank()) +
  geom_vline(xintercept = seq(3, 12, 3),
             linetype    = "longdash",
             size = 0.8) +
  annotate("text", 
           x     = c(1.5, 4.5, 7.5, 10.5), 
           y     = 850, 
           label = c("Winter", "Spring", "Summer", "Autumn"),
           size  = c(4, 4, 4, 4)
  )

print(plot)
