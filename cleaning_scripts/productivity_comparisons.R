europe_prod <-
    read_xls("raw_data/data/country_comparisons/International Labour Productivity - Europe.xls",
             sheet = "Table 1",
             skip = 3) %>% 
    select(-"A*10 (excl L)") %>% 
    head(9) %>%
    pivot_longer(Belgium : Switzerland, names_to = "country", values_to = "output_per_hour_by_industry (EUR)") %>% 
    rename("industry" = "NACE Industry")

europe_prod_growth <-
    read_xls("raw_data/data/country_comparisons/International Labour Productivity - Europe.xls",
             sheet = "Table 2",
             skip = 3) %>% 
    select(-"A*10 (excl L)") %>% 
    head(9) %>%
    pivot_longer(Bulgaria : Norway, names_to = "country", values_to = "productivity_growth_pct") %>% 
    rename("industry" = "NACE Industry")



rbind(
# G7 countries relative to UK at current prices
#       Current price GDP per worker
read_excel("raw_data/data/country_comparisons/International Labour Productivity - G7.xls",
           sheet = "Table 1", skip = 4, n_max = 24) %>% 
mutate(gdp_measure = "per hour",
       price_base = "UK"),
#       Current price GDP per hour
read_excel("raw_data/data/country_comparisons/International Labour Productivity - G7.xls",
               sheet = "Table 2", skip = 4, n_max = 24) %>%
        mutate(gdp_measure = "per job",
               price_base = "UK"),
# G7 countries relative to 2007 prices
#   Constant price GDP per worker
read_excel("raw_data/data/country_comparisons/International Labour Productivity - G7.xls",
           sheet = "Table 3", skip = 4, n_max = 24) %>%
    mutate(gdp_measure = "per hour",
               price_base = "2007"),
    # Constant price GDP perhour
    read_excel("raw_data/data/country_comparisons/International Labour Productivity - G7.xls",
               sheet = "Table 4", skip = 4, n_max = 24) %>%
        mutate(gdp_measure = "per job",
               price_base = "2007")
) %>%
    #pivot into supertable and write clean data
rename("year" = "...1") %>% 
    pivot_longer(cols = Canada : `G7 exc. UK`,
                 names_to = "country",
                 values_to = "index_value") %>%
        drop_na() %>% 
    relocate(gdp_measure, .after = index_value) %>% 
    write_csv("clean_data/G7_comparison.csv")
