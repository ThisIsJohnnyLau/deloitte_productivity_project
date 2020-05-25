OECD_real_minimum_wages <- read_excel("raw_data/data/country_comparisons/Real minimum wages OECD.xlsx", skip = 5) %>%
    select(-...2) %>%
    rename(country = Time) %>% 
    mutate_at(vars("2000":"2017"), as.double) %>% 
    pivot_longer(cols = "2000":"2017", names_to = "year", values_to = "minimum_wage_USD_PPP") %>% 
    drop_na()

write_csv(OECD_real_minimum_wages, "clean_data/OECD_real_minimum_wages.csv")