# Libraries
library(readxl)
library(tidyverse)
library(janitor)
library(lubridate)
library(zoo)
library(dplyr)
library(TableToLongForm)



europe_prod <-
    read_xls("raw_data/data/country_comparisons/International Labour Productivity - Europe.xls",
             sheet = "Table 1",
             skip = 3) %>% 
    select(-"A*10 (excl L)") %>% 
    head(9) %>%
    pivot_longer(Belgium : Switzerland, names_to = "country") %>% 
    rename("Industry" = "NACE Industry",
           "output_per_hour" = "value") %>% 
    clean_names()


G7_prod_hist <-
    read_excel("raw_data/data/country_comparisons/International Labour Productivity - G7.xls",
                sheet = "Table 3", skip = 4, n_max = 24) %>%
                drop_na() %>% 
    pivot_longer(cols = Canada : `G7 exc. UK`,
                 names_to = "country",
                 values_to = "GDP_per_hour_worked") %>%
    rename("year" = "...1")

    
    
# Output per job

years <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls", sheet = "OpJ (value)", range = "A7:A27") %>% 
    rename(year = ...1)

UK_output_per_job <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls", sheet = "OpJ (value)", range = "A7:R27") %>%
    clean_names() %>%
    rename(year = x1) %>%
    mutate(region = "UK") %>% 
    pivot_longer(cols = c(-year,-region), names_to = "subsector_letter", values_to = "output_per_job")

scotland_output_per_job <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls", sheet = "OpJ (value)", range = "GG7:GW27") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "Scotland") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "output_per_job")


london_output_per_job <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls", sheet = "OpJ (value)", range = "DQ7:EG27") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "Scotland") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "output_per_job")

UK_regional_output_per_job <- rbind(UK_output_per_job, scotland_output_per_job, london_output_per_job) %>%
    mutate(industry =  case_when(subsector_letter %in% natural_res_and_util ~ "natural_resources_and_utilities",
                                 subsector_letter %in% construction ~ "construction",
                                 subsector_letter %in% manufacturing ~ "manufacturing",
                                 subsector_letter %in% telecoms ~ "telecoms",
                                 subsector_letter %in% trade ~ "trade",
                                 subsector_letter %in% leisure_and_entertainment ~ "leisure_and_entertainment",
                                 subsector_letter %in% transport ~ "transport",
                                 subsector_letter %in% ed_and_health ~ "education_and_health",
                                 subsector_letter %in% prof_and_biz_services ~ "prof_and_biz_services",
                                 subsector_letter %in% public_admin_and_def ~ "public_admin_and_defence",
                                 subsector_letter %in% financial_services ~ "financial_services",
                                 subsector_letter %in% other_services ~ "other_services",
                                 TRUE ~ subsector_letter)
    )  %>%
    relocate(industry, .before = subsector_letter)

# Output per hour

UK_output_per_hour <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls", sheet = "OpH (value)", range = "A7:R27") %>%
    clean_names() %>%
    rename(year = x1) %>%
    mutate(region = "UK") %>% 
    pivot_longer(cols = c(-year,-region), names_to = "subsector_letter", values_to = "output_per_job")

scotland_output_per_hour <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls", sheet = "OpH (value)", range = "GG7:GW27") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "Scotland") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "output_per_job")

london_output_per_hour <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls", sheet = "OpH (value)", range = "DQ7:EG27") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "London") %>%
    pivot_longer(cols = c(-year,-region), names_to = "subsector_letter", values_to = "output_per_job")

UK_regional_output_per_hour <- rbind(UK_output_per_hour, scotland_output_per_hour, london_output_per_hour) %>%
    mutate(industry =  case_when(subsector_letter %in% natural_res_and_util ~ "natural_resources_and_utilities",
                                 subsector_letter %in% construction ~ "construction",
                                 subsector_letter %in% manufacturing ~ "manufacturing",
                                 subsector_letter %in% telecoms ~ "telecoms",
                                 subsector_letter %in% trade ~ "trade",
                                 subsector_letter %in% leisure_and_entertainment ~ "leisure_and_entertainment",
                                 subsector_letter %in% transport ~ "transport",
                                 subsector_letter %in% ed_and_health ~ "education_and_health",
                                 subsector_letter %in% prof_and_biz_services ~ "prof_and_biz_services",
                                 subsector_letter %in% public_admin_and_def ~ "public_admin_and_defence",
                                 subsector_letter %in% financial_services ~ "financial_services",
                                 subsector_letter %in% other_services ~ "other_services",
                                 TRUE ~ subsector_letter)
    )  %>%
    relocate(industry, .before = subsector_letter)
