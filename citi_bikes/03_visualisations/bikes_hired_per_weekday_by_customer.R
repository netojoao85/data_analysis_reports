
# call dataset ------------------------------------------------------------

source(here::here("01_data_clean_script/citi_bikes_clean_script.R"), local = TRUE)$value


# visualisation -----------------------------------------------------------

nyc_bikes_clean %>% 
  index_by(week_day) %>% 
  group_by(type) %>% 
  summarise(count = n(), .groups = "drop") %>% 
  mutate(
    text_vjust = ifelse(count > 50, 0.5, 0.3),
    text_color = ifelse(count > 70, "white", "black")
  ) %>% 
  ggplot() +
  aes(x = week_day,
      y = count,
      fill = type, 
      group = type) +
  geom_col() +
  theme_minimal() +
  scale_fill_manual(values = c("Customer" = "#A6CEE3", "Subscriber" = "#1F78B4")) +
  geom_text(
    aes(
      label = count,
      color = text_color
      # vjust = text_vjust
    ),
    size = 4,
    position = position_stack(vjust = 0.5)
    # vjust = -0.00
  ) +
  scale_color_identity() +
  labs(title = NULL,
       x = NULL, 
       y = NULL) +
  theme(
    legend.position    = "bottom",
    legend.title       = element_blank(),
    panel.grid = element_blank(),
    axis.text.y = element_blank(),
    panel.background = element_rect(fill = "#F7F7F7", colour = "#f7f7f7"),
    plot.background = element_rect(fill = "#F7F7F7", colour = "#f7f7f7")
  )