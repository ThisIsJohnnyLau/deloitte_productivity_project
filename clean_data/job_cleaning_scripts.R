#Sectors

natural_resources <- c("a", "b")
construction <- "f"
manufacturing <- "c"
telecoms <- "j"
trade <- "g"
leisure_and_entertainment <- c("i", "r")
trans_and_util <- c("d", "e", "h")
ed_and_health <- c("p", "q")
prof_and_biz_services <- c("m", "n")
public_admin_and_def <- "o"
financial_services <- c("k", "l")








# rownames(UK_Labour_Productivity_Jobs_in_Regions_by_Industry)[rownames(UK_Labour_Productivity_Jobs_in_Regions_by_Industry) == "SIC 2007 section"] <- "industry_letter"



# industry_codes <- read_excel("raw_data/data/UK_productivity/UK Labour Productivity - Jobs in Regions by Industry.xls", 
#                              sheet = "15. United Kingdom", skip = 4, 
#                              n_max = 1) %>% 
#     clean_names() %>% 
#     select(-1:-2)
# 
# 
# industry_names <- c("code")
# industry_code_lookup <- cbind(industry_names, industry_codes)


#UK Jobs

UK_Labour_Productivity_Jobs_in_Regions_by_Industry <- read_excel("raw_data/data/UK_productivity/UK Labour Productivity - Jobs in Regions by Industry.xls", 
                                                                 sheet = "15. United Kingdom", skip = 5) %>% 
    select(-2, -23, -24) %>% 
    clean_names() %>% 
    rename(year_month = sic_2007_section) %>% 
    mutate(year_month = as.Date(as.yearmon(str_sub(year_month, 0, -4), "%b %y"))) %>%
    pivot_longer(cols = a:t, names_to = "subsector_letter", values_to = "jobs") %>%
    mutate(industry =  case_when(subsector_letter %in% natural_resources ~ "natural_resources",
                                 subsector_letter %in% construction ~ "construction",
                                 subsector_letter %in% manufacturing ~ "manufacturing",
                                 subsector_letter %in% telecoms ~ "telecoms",
                                 subsector_letter %in% trade ~ "trade",
                                 subsector_letter %in% leisure_and_entertainment ~ "leisure_and_entertainment",
                                 subsector_letter %in% trans_and_util ~ "transport_and_utilities",
                                 subsector_letter %in% ed_and_health ~ "education_and_health",
                                 subsector_letter %in% prof_and_biz_services ~ "prof_and_biz_services",
                                 subsector_letter %in% public_admin_and_def ~ "public_admin_and_defence",
                                 subsector_letter %in% financial_services ~ "financial_services",
                                 TRUE ~ "other")
    ) %>%
    relocate(industry, .before = subsector_letter) %>%
    drop_na() %>% 
    print()

#Scotland Jobs

scotland_jobs <- read_excel("raw_data/data/UK_productivity/UK Labour Productivity - Jobs in Regions by Industry.xls", 
                                                                 sheet = "12. Scotland", skip = 5) %>% 
    select(-2, -23, -24) %>% 
    clean_names() %>% 
    rename(year_month = sic_2007_section) %>% 
    mutate(year_month = as.Date(as.yearmon(str_sub(year_month, 0, -4), "%b %y"))) %>%
    pivot_longer(cols = a:t, names_to = "subsector_letter", values_to = "jobs") %>%
    mutate(industry =  case_when(subsector_letter %in% natural_resources ~ "natural_resources",
                                 subsector_letter %in% construction ~ "construction",
                                 subsector_letter %in% manufacturing ~ "manufacturing",
                                 subsector_letter %in% telecoms ~ "telecoms",
                                 subsector_letter %in% trade ~ "trade",
                                 subsector_letter %in% leisure_and_entertainment ~ "leisure_and_entertainment",
                                 subsector_letter %in% trans_and_util ~ "transport_and_utilities",
                                 subsector_letter %in% ed_and_health ~ "education_and_health",
                                 subsector_letter %in% prof_and_biz_services ~ "prof_and_biz_services",
                                 subsector_letter %in% public_admin_and_def ~ "public_admin_and_defence",
                                 subsector_letter %in% financial_services ~ "financial_services",
                                 TRUE ~ "other")
    ) %>%
    relocate(industry, .before = subsector_letter) %>%
    drop_na() %>% 
    print()