UK_gdp_breakdown_names <- read_excel("raw_data/data/UK_productivity/UK GDP Estimates - Time Series.xlsx", sheet = "Names")


read_excel("raw_data/data/UK_productivity/UK GDP Estimates - Time Series.xlsx", 
                                           sheet = "Annual") %>%
slice(., 7:n()) %>%
    rename(year = Title) %>% 
    pivot_longer(-year, names_to = "GDP_measure", values_to = "value") %>%
    drop_na() %>% #need to fix tolower
    write_csv(path = "clean_data/UK_gdp_breakdown_annual.csv")
