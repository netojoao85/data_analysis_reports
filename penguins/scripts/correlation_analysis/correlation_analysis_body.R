
# get data ----------------------------------------------------------------

penguins <- palmerpenguins::penguins



# boxplot: bill length distribution ---------------------------------------

penguins_boxplot <- penguins %>% 
  drop_na(bill_length_mm) %>% 
  group_by(species) %>% 
  ggplot() +
  aes(x = bill_length_mm, y = flipper_length_mm) +
  geom_point(shape = 21, aes(size = body_mass_g, fill = body_mass_g)) +
  # scale_fill_continuous(name = "Body mass (gr.)", type = "viridis") +
  scale_fill_gradient(name = "Body mass (gr.)", low = "#FF7B01", high = "#0E7470") + 
  scale_size_continuous(guide = "none") + 
  labs(
    x = "Bill length (mm)",
    y = "Flipper length (mm)") + 
  theme_minimal() +
  theme(
    axis.text.y = element_text(vjust = -1.3),
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = "#FFFCF5", color = "#FFFCF5"),
    plot.background = element_rect(fill = "#FFFCF5", color = "#FFFCF5")
  ) 
  

penguins_boxplot


