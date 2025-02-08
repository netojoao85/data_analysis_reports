#  ////////////////////////////////////////////////////////////////////
#  -> 1. Define the significance level 
#  -> 2. Calculate
#        2.1. null distribution
#        2.2. observed statistic
#        2.3. p-value
#  -> 3. Visualisation
#
#  ////////////////////////////////////////////////////////////////////


# 1. decide significance level (a) -------------------------------------------
a <- 0.05



# 2.1.null sample distribution ------------------------------------------------

null_distribution <- penguins %>%
  filter(species %in% c("Gentoo", "Adelie")) %>%
  specify(bill_length_mm ~ species) %>%
  hypothesize(null = "independence") %>%
  generate(reps = 10000, type = "permute") %>%
  calculate(stat = "diff in means", order = c("Gentoo", "Adelie"))


# 2.2. observed statistic -------------------------------------------------

obs_statistic <- penguins %>%
  filter(species %in% c("Gentoo", "Adelie")) %>%
  specify(bill_length_mm ~ species) %>%
  calculate(stat = "diff in means", order = c("Gentoo", "Adelie"))


# 2.3. p-value ------------------------------------------------------------

# An one-tailed test
p_value <- null_distribution %>%
  get_p_value(direction = "right", obs_stat = obs_statistic)


# 3. Visualisation --------------------------------------------------------

null_distribution %>%
  visualise() +
  shade_p_value(direction = "right", obs_stat = obs_statistic) + 
  theme_minimal() +
  labs(title = "Visualize the null distribution",
       x = "Observed Statistic") +
  scale_x_continuous(breaks = seq(-3, 10, 1)) +
  theme(panel.grid.minor.y = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.background = element_rect(fill = "#FFFCF5", color = "#FFFCF5"),
        plot.background = element_rect(fill = "#FFFCF5", color = "#FFFCF5"))




