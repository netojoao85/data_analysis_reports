
r_plot <- penguins %>% 
  select(-year) %>% 
  ggcorr(label = TRUE,
         geom  = "tile",
         label_size  = 4,
         label_round = 2,
         label_color = "white", 
         low = "firebrick", mid = "orange", high = "darkgreen",
         name = "Correlation (r)", 
         color = "black")

r_plot +
  theme(panel.background = element_rect(fill = "#FFFCF5"),
        plot.background = element_rect(fill = "#FFFCF5"),
        legend.background = element_rect(fill = "#FFFCF5"),
        plot.margin = unit(c(0,0,0,0), "cm"))

