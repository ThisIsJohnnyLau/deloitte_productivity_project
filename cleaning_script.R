europe_prod <- europe_prod %>% 
    select(-"A*10 (excl L)") %>% 
    head(9) %>%
    pivot_longer(Belgium : Switzerland, names_to = "country") %>% 
    rename("Industry" = "NACE Industry",
           "output_per_hour" = "value") %>% 
    clean_names()


