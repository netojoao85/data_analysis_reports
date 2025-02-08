
stats <- penguins %>%
  group_by(species) %>% 
  summarise(
    mean = mean(bill_length_mm, na.rm = TRUE),
    sd = sd(bill_length_mm, na.rm = TRUE)  
  ) 
  
gentoo <- penguins%>% 
  filter(species == "Gentoo") %>% 
  ggplot() +
  aes(bill_length_mm) + 
  geom_histogram(aes(y = ..density..), fill = "#0E7470", col = "white", alpha = 0.5, bins = 10) +
  theme_minimal() + 
  theme(
    panel.grid = element_blank(),
    axis.text = element_blank(),
    legend.position = "none",
    panel.background = element_rect(fill = "#FFFCF5", color = "#FFFCF5"),
    plot.background = element_rect(fill = "#FFFCF5", color = "#FFFCF5")
  ) +
  labs(x = NULL, y = NULL) +
  stat_function(
    fun = dnorm, 
    args = list(
      mean = stats$mean[stats$species == "Gentoo"],
      sd = stats$sd[stats$species == "Gentoo"]
    ),
    col = "red", size = 2
  )

adelie <- penguins%>% 
  filter(species == "Adelie") %>% 
  ggplot() +
  aes(bill_length_mm) + 
  geom_histogram(aes(y = ..density..), fill = "#FF7B01", col = "white", alpha = 0.5, bins = 10) +
  theme_minimal() + 
  theme(
    panel.grid = element_blank(),
    axis.text = element_blank(),
    legend.position = "none",
    panel.background = element_rect(fill = "#FFFCF5", color = "#FFFCF5"),
    plot.background = element_rect(fill = "#FFFCF5", color = "#FFFCF5")
  ) +
  labs(x = NULL, y = NULL) +
  stat_function(
    fun = dnorm, 
    args = list(
      mean = stats$mean[stats$species == "Adelie"],
      sd = stats$sd[stats$species == "Adelie"]
    ),
    col = "red", size = 2
  )

chinstrap <- penguins %>% 
  filter(species == "Chinstrap") %>% 
  ggplot() +
  aes(bill_length_mm) + 
  geom_histogram(aes(y = ..density..), fill = "#C35BCA", col = "white", alpha = 0.5, bins = 10) +
  theme_minimal() + 
  theme(
    panel.grid = element_blank(),
    axis.text = element_blank(),
    legend.position = "none",
    panel.background = element_rect(fill = "#FFFCF5", color = "#FFFCF5"),
    plot.background = element_rect(fill = "#FFFCF5", color = "#FFFCF5")
  ) +
  labs(x = NULL, y = NULL) +
  stat_function(
    fun = dnorm, 
    args = list(
      mean = stats$mean[stats$species == "Chinstrap"],
      sd = stats$sd[stats$species == "Chinstrap"]
    ),
    col = "red", size = 2
  )

# 
# bill_length_hist_per_specie <- ggplot(penguins) +
#   aes(bill_length_mm, fill = species) + 
#   geom_histogram(aes(y = ..density..), col = "white", alpha = 0.5, bins = 10) +
#   # facet_wrap(~species, nrow = 1, scales = "free") +
#   theme_minimal() + 
#   scale_fill_manual(values = c("#FF7B01", "#C35BCA", "#0E7470")) +
#   theme(
#     strip.text = element_text(size = 10),
#     panel.grid = element_blank(),
#     axis.text = element_blank(),
#     legend.position = "none",
#     panel.background = element_rect(fill = "#FFFCF5", color = "#FFFCF5"),
#     plot.background = element_rect(fill = "#FFFCF5", color = "#FFFCF5")
#     ) +
#   labs(x = NULL, y = NULL) +
#   stat_function(
#     fun = dnorm, 
#     args = list(
#       mean = mean(penguins$bill_length_mm, na.rm = TRUE), 
#       sd = sd(penguins$bill_length_mm, na.rm = TRUE)
#     ),
#     col = "red", size =2
#   )
# 
# 
# 
# 
#   
# 
# bill_length_hist_per_specie + ggh4x::facet_wrap2(
#   ~species,  scales = "free", nrow = 1,
#   strip = strip_themed(
#     background_x = elem_list_rect(
#       fill = c("#FFF1C2", "#FACBFF", "#16D9B5"), 
#       color = c("#FFF1C2", "#FACBFF", "#16D9B5")),
#     text_x = elem_list_text(colour = c("black", "black", "white"))
#   )
# ) 