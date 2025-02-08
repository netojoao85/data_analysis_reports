
# get data ----------------------------------------------------------------

penguins <- palmerpenguins::penguins

library(ggpubr)

# correlation between bill and flipper length -----------------------------
correlation <- penguins %>% 
  drop_na() %>% 
  summarise(round(cor(bill_length_mm, flipper_length_mm, method = "pearson"), digits = 4)) %>% 
  pull()


# boxplot: bill length distribution ---------------------------------------

penguins_boxplot <- penguins %>% 
  drop_na(bill_length_mm) %>% 
  group_by(species) %>% 
  ggplot() +
  aes(x = bill_length_mm, y = flipper_length_mm) +
  geom_point(shape = 16, aes(color = species)) +
  geom_smooth(method = "lm", se = FALSE, colour = "black") +
  labs(
    x = "Bill length (mm)",
    y = "Flipper length (mm)") + 
  # scale_x_continuous(breaks = seq(25, 60, 10)) +
  scale_color_manual(values = c("Adelie" = "#FF7B01", "Chinstrap" = "#C35BCA", "Gentoo" = "#0E7470")) +
  theme_minimal() +
  theme(
    axis.text.y = element_text(vjust = -1.3),
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = "#FFFCF5", color = "#FFFCF5"),
    plot.background = element_rect(fill = "#FFFCF5", color = "#FFFCF5"),
  ) +
  annotate(
    geom = "text", 
    x = min(penguins$bill_length_mm, na.rm = TRUE) + 5,
    y = max(penguins$flipper_length_mm, na.rm = TRUE),
    label = paste0("r = ", correlation)
    )
  

penguins_boxplot


