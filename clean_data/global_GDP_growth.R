

global_gdp_growth <- read_excel("raw_data/data/country_comparisons/Growth Of Output.xls", 
                               skip = 3) %>%
    select(-"Indicator Name", -"Indicator Code") %>% 
    pivot_longer(cols = "1960":"2018", names_to = "year", values_to = "GDP_growth_rate") %>% 
    drop_na()

write_csv(global_gdp_growth, "clean_data/global_gdp_growth.csv")


