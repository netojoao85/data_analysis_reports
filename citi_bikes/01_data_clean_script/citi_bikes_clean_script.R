# Were created 3 new columns:
# 
#
# 'month' - it has the month that the bike was hired (January to December);
#
# 'week_day' - it has the week day that the bike was hired (Monday to Sunday)
#
# 'station_travel' - join the variables 'start_station' and 'end_station' to 
#   have in just one variable started and ended point of travels.
#////////////////////////////////////////////////////////////////////////////

# call libraries ----------------------------------------------------------
source(file = here::here("libraries.R"), local = TRUE)



# get dataset ---------------------------------------------------------------
nyc_bikes <- tsibbledata::nyc_bikes


# script ------------------------------------------------------------------
nyc_bikes_clean <- nyc_bikes %>% 
  mutate(month = month(start_time, label = TRUE),
         week_day = wday(start_time, label = TRUE)) %>% 
  mutate(station_travel = str_c(
    start_station, end_station, sep = " - "), .after = "end_station")

# nyc_bikes_clean %>% 
#   write_csv("02_data_cleaned/nyc_bikes_clean.csv")