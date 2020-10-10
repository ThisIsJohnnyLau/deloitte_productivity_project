# 
# 
# #UK Jobs
# 
# UK_Labour_Productivity_Jobs_in_Regions_by_Industry <- read_excel("raw_data/data/UK_productivity/UK Labour Productivity - Jobs in Regions by Industry.xls", 
#                                                                  sheet = "15. United Kingdom", skip = 5) %>% 
#     select(-2, -23, -24) %>% 
#     clean_names() %>% 
#     rename(year_month = sic_2007_section) %>% 
#     mutate(year_month = as.Date(as.yearmon(str_sub(year_month, 0, -4), "%b %y"))) %>%
#     pivot_longer(cols = a:t, names_to = "subsector_letter", values_to = "jobs") %>%
#     mutate(industry =  case_when(subsector_letter %in% natural_res_and_util ~ "natural_resources_and_utilities",
#                                  subsector_letter %in% construction ~ "construction",
#                                  subsector_letter %in% manufacturing ~ "manufacturing",
#                                  subsector_letter %in% telecoms ~ "telecoms",
#                                  subsector_letter %in% trade ~ "trade",
#                                  subsector_letter %in% leisure_and_entertainment ~ "leisure_and_entertainment",
#                                  subsector_letter %in% transport ~ "transport",
#                                  subsector_letter %in% ed_and_health ~ "education_and_health",
#                                  subsector_letter %in% prof_and_biz_services ~ "prof_and_biz_services",
#                                  subsector_letter %in% public_admin_and_def ~ "public_admin_and_defence",
#                                  subsector_letter %in% financial_services ~ "financial_services",
#                                  subsector_letter %in% other_services ~ "other_services",
#                                  TRUE ~ subsector_letter)
#     )  %>%
#     relocate(industry, .before = subsector_letter) %>%
#     drop_na() %>% 
#     print()
# 
# #Scotland Jobs
# 
# scotland_jobs <- read_excel("raw_data/data/UK_productivity/UK Labour Productivity - Jobs in Regions by Industry.xls", 
#                             sheet = "12. Scotland", skip = 5) %>% 
#     select(-2, -23, -24) %>% 
#     clean_names() %>% 
#     rename(year_month = sic_2007_section) %>% 
#     mutate(year_month = as.Date(as.yearmon(str_sub(year_month, 0, -4), "%b %y"))) %>%
#     pivot_longer(cols = a:t, names_to = "subsector_letter", values_to = "jobs") %>%
#     mutate(industry =  case_when(subsector_letter %in% natural_res_and_util ~ "natural_resources_and_utilities",
#                                  subsector_letter %in% construction ~ "construction",
#                                  subsector_letter %in% manufacturing ~ "manufacturing",
#                                  subsector_letter %in% telecoms ~ "telecoms",
#                                  subsector_letter %in% trade ~ "trade",
#                                  subsector_letter %in% leisure_and_entertainment ~ "leisure_and_entertainment",
#                                  subsector_letter %in% transport ~ "transport",
#                                  subsector_letter %in% ed_and_health ~ "education_and_health",
#                                  subsector_letter %in% prof_and_biz_services ~ "prof_and_biz_services",
#                                  subsector_letter %in% public_admin_and_def ~ "public_admin_and_defence",
#                                  subsector_letter %in% financial_services ~ "financial_services",
#                                  subsector_letter %in% other_services ~ "other_services",
#                                  TRUE ~ subsector_letter)
#     ) %>%
#     relocate(industry, .before = subsector_letter) %>%
#     drop_na() %>% 
#     print()