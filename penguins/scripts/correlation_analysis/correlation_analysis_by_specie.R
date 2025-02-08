
# get data ----------------------------------------------------------------

penguins <- palmerpenguins::penguins

# correlation between bill and flipper length -----------------------------
r <- penguins %>% 
  drop_na() %>% 
  group_by(species) %>% 
  summarise(r = round(cor(bill_length_mm, flipper_length_mm, method = "pearson"), digits = 4))


# boxplot: bill length distribution ---------------------------------------

penguins_facet <- penguins %>% 
  drop_na(bill_length_mm) %>% 
  group_by(species) %>% 
  ggplot() +
  aes(x = bill_length_mm, y = flipper_length_mm) +
  geom_point(shape = 21, aes(color = species, fill = species)) +
  geom_smooth(method = "lm", se = FALSE, colour = "#465260") +
  labs(
    x = "Bill length (mm)",
    y = "Flipper length (mm)") + 
  scale_color_manual(values = c("Adelie" = "#FF7B01", "Chinstrap" = "#C35BCA", "Gentoo" = "#0E7470")) +
  scale_fill_manual(values = c("Adelie" = "#FF7B01", "Chinstrap" = "#C35BCA", "Gentoo" = "#0E7470")) +
  theme_minimal() +
  theme(
    panel.background = element_rect(fill = "#FFFCF5", color = "#FFFCF5"),
    plot.background = element_rect(fill = "#FFFCF5", color = "#FFFCF5"),
    panel.grid.minor = element_blank(),
    panel.border = element_blank(),
    axis.line = element_blank(),
    legend.position = "none"
  )
  # annotate(
  #   geom = "text",
  #   x = c(40, 45, 55),
  #   y = 180,
  #   label = c(
  #     r$r[r$species == "Adelie"],
  #     r$r[r$species == "Chinstrap"],
  #     r$r[r$species == "Gentoo"]
  #   )
  # )


penguins_facet + ggh4x::facet_wrap2(
  ~species,  scales = "free", nrow = 1, 
  strip = strip_themed(
    background_x = elem_list_rect(
      fill = c("#FFF1C2", "#FACBFF", "#16D9B5"), 
      color = c("#FFF1C2", "#FACBFF", "#16D9B5")),
    text_x = elem_list_text(colour = c("black", "black", "white"))
  )
)

