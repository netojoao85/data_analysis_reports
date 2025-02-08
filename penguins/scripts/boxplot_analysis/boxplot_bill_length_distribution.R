
# get data ----------------------------------------------------------------

penguins <- palmerpenguins::penguins



# boxplot: bill length distribution ---------------------------------------

penguins_boxplot <- penguins %>% 
  drop_na(bill_length_mm) %>% 
  group_by(species) %>% 
  ggplot() +
  aes(x = bill_length_mm, y = 1) +
  geom_boxplot(outlier.colour = NA) +
  geom_point(position = position_jitter(height = .2), alpha = .3, aes(color = species)) +
  labs(
    # title = "Bill length (mm) by penguin species",
    x     = NULL,
    y     = NULL) + 
  scale_x_continuous(breaks = seq(25, 60, 1)) +
  scale_color_manual(values = c("Adelie" = "#FF7B01", "Chinstrap" = "#C35BCA", "Gentoo" = "#0E7470")) +
  theme_minimal() +
  theme(
    #strip.text       = element_text(face = "bold", color = "black"),
    axis.text.y      = element_blank(),
    panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.background = element_rect(fill = "#FFFCF5", color = "#FFFCF5"),
    plot.background = element_rect(fill = "#FFFCF5", color = "#FFFCF5"),
    panel.border = element_blank(),
    axis.line = element_blank(),
    legend.position = "none"
  )

# Apply different strip backgrounds using facet_theme from ggh4x
# https://teunbrand.github.io/ggh4x/articles/Facets.html
penguins_boxplot + ggh4x::facet_wrap2(
  ~species,  scales = "free", nrow = 3,
  strip = strip_themed(
    background_x = elem_list_rect(
      fill = c("#FFF1C2", "#FACBFF", "#16D9B5"), 
      color = c("#FFF1C2", "#FACBFF", "#16D9B5")),
    text_x = elem_list_text(colour = c("black", "black", "white"))
  )
)
