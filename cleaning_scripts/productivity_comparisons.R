

# EU28 snapshot
rbind(
# European country productivity
    read_xls("raw_data/data/country_comparisons/International Labour Productivity - Europe.xls",
             sheet = "Table 1",
             skip = 3) %>% 
    mutate(GDP_measure = "output_euros_per_hour") %>% 
    pivot_longer(Belgium : Switzerland, names_to = "country", values_to = "data"),
#  European productivity growth
    read_xls("raw_data/data/country_comparisons/International Labour Productivity - Europe.xls",
             sheet = "Table 2",
             skip = 3) %>%
    mutate(GDP_measure = "productivity_growth_pct") %>% 
    pivot_longer(Bulgaria : Norway, names_to = "country", values_to = "data")
) %>%
    rename("industry" = "NACE Industry",
           "NACE_code" = "A*10 (excl L)") %>% 
    drop_na() %>%
    write_csv("clean_data/EU_comparisons_by_sector.csv")



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
