europe_prod <- europe_prod %>% 
    select(-"A*10 (excl L)") %>% 
    head(9) %>%
    pivot_longer(Belgium : Switzerland, names_to = "country") %>% 
    rename("Industry" = "NACE Industry",
           "output_per_hour" = "value") %>% 
    clean_names()


G7_prod_hist <-
    read_excel("data/International Labour Productivity - G7.xls",
                sheet = "Table 3", skip = 4, n_max = 24) %>%
                drop_na() %>% 
    pivot_longer(cols = Canada : `G7 exc. UK`,
                 names_to = "country",
                 values_to = "GDP_per_hour_worked") %>%
    rename("year" = "...1")

    
    
