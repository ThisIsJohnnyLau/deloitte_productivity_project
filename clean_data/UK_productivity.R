# Libraries
library(readxl)
library(tidyverse)
library(janitor)
library(lubridate)
library(zoo)
library(dplyr)
library(TableToLongForm)




    
    
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
    mutate(region = "London") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "output_per_job")

NE_output_per_job <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpJ (value)", range = "S7:AI27") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "North East") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "output_per_job")

NW_output_per_job <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpJ (value)", range = "AJ7:AZ27") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "North West") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "output_per_job")


yorkshire_and_humber_output_per_job <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpJ (value)", range = "BA7:BQ27") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "Yorkshire and the Humber") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "output_per_job")


E_midlands_output_per_job <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpJ (value)", range = "BR7:CH27") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "East Midlands") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "output_per_job")

W_midlands_output_per_job <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpJ (value)", range = "CI7:CY27") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "West Midlands") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "output_per_job")

E_output_per_job <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpJ (value)", range = "CZ7:DP27") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "East") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "output_per_job")

SE_output_per_job <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpJ (value)", range = "EH7:EX27") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "South East") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "output_per_job")

SW_output_per_job <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpJ (value)", range = "EY7:FO27") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "South West") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "output_per_job")

wales_output_per_job <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpJ (value)", range = "FP7:GF27") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "Wales") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "output_per_job")

NI_output_per_job <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpJ (value)", range = "FP7:GF27") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "Northern Ireland") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "output_per_job")

UK_regional_output_per_job <-
    rbind(UK_output_per_job,
          scotland_output_per_job,
          london_output_per_job,
          NE_output_per_job,
          NW_output_per_job,
          yorkshire_and_humber_output_per_job,
          E_midlands_output_per_job,
          W_midlands_output_per_job,
          E_output_per_job,
          SE_output_per_job,
          SW_output_per_job,
          wales_output_per_job,
          NI_output_per_job) %>%
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
                                 TRUE ~ subsector_letter),
           info = "output_per_job"
    )  %>%
    relocate(industry:info, .before = subsector_letter)

# Output per hour

years <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls", sheet = "OpH (value)", range = "A7:A27") %>% 
    rename(year = ...1)

UK_output_per_hour <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls", sheet = "OpH (value)", range = "A7:R27") %>%
    clean_names() %>%
    rename(year = x1) %>%
    mutate(region = "UK") %>% 
    pivot_longer(cols = c(-year,-region), names_to = "subsector_letter", values_to = "output_per_hour")

scotland_output_per_hour <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls", sheet = "OpH (value)", range = "GG7:GW27") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "Scotland") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "output_per_hour")


london_output_per_hour <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls", sheet = "OpH (value)", range = "DQ7:EG27") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "London") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "output_per_hour")

NE_output_per_hour <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpH (value)", range = "S7:AI27") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "North East") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "output_per_hour")

NW_output_per_hour <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpH (value)", range = "AJ7:AZ27") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "North West") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "output_per_hour")


yorkshire_and_humber_output_per_hour <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpH (value)", range = "BA7:BQ27") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "Yorkshire and the Humber") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "output_per_hour")


E_midlands_output_per_hour <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpH (value)", range = "BR7:CH27") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "East Midlands") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "output_per_hour")

W_midlands_output_per_hour <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpH (value)", range = "CI7:CY27") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "West Midlands") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "output_per_hour")

E_output_per_hour <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpH (value)", range = "CZ7:DP27") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "East") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "output_per_hour")

SE_output_per_hour <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpH (value)", range = "EH7:EX27") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "South East") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "output_per_hour")

SW_output_per_hour <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpH (value)", range = "EY7:FO27") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "South West") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "output_per_hour")

wales_output_per_hour <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpH (value)", range = "FP7:GF27") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "Wales") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "output_per_hour")

NI_output_per_hour <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpH (value)", range = "FP7:GF27") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "Northern Ireland") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "output_per_hour")

UK_regional_output_per_hour <-
    rbind(UK_output_per_hour,
          scotland_output_per_hour,
          london_output_per_hour,
          NE_output_per_hour,
          NW_output_per_hour,
          yorkshire_and_humber_output_per_hour,
          E_midlands_output_per_hour,
          W_midlands_output_per_hour,
          E_output_per_hour,
          SE_output_per_hour,
          SW_output_per_hour,
          wales_output_per_hour,
          NI_output_per_hour) %>%
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
                                 TRUE ~ subsector_letter),
           info = "output_per_hour"
    )  %>%
    relocate(industry:info, .before = subsector_letter)


#Jobs

years <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls", sheet = "Jobs", range = "A7:A28") %>% 
    rename(year = ...1)

UK_jobs <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls", sheet = "Jobs", range = "A7:R28") %>%
    clean_names() %>%
    rename(year = x1) %>%
    mutate(region = "UK") %>% 
    pivot_longer(cols = c(-year,-region), names_to = "subsector_letter", values_to = "jobs")

scotland_jobs <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls", sheet = "Jobs", range = "GG7:GW28") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "Scotland") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "jobs")


london_jobs <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls", sheet = "Jobs", range = "DQ7:EG28") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "London") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "jobs")

NE_jobs <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Jobs", range = "S7:AI28") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "North East") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "jobs")

NW_jobs <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Jobs", range = "AJ7:AZ28") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "North West") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "jobs")


yorkshire_and_humber_jobs <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Jobs", range = "BA7:BQ28") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "Yorkshire and the Humber") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "jobs")


E_midlands_jobs <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Jobs", range = "BR7:CH28") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "East Midlands") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "jobs")

W_midlands_jobs <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Jobs", range = "CI7:CY28") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "West Midlands") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "jobs")

E_jobs <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Jobs", range = "CZ7:DP28") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "East") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "jobs")

SE_jobs <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Jobs", range = "EH7:EX28") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "South East") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "jobs")

SW_jobs <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Jobs", range = "EY7:FO28") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "South West") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "jobs")

wales_jobs <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Jobs", range = "FP7:GF28") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "Wales") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "jobs")

NI_jobs <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Jobs", range = "FP7:GF28") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "Northern Ireland") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "jobs")

UK_regional_jobs <-
    rbind(UK_jobs,
          scotland_jobs,
          london_jobs,
          NE_jobs,
          NW_jobs,
          yorkshire_and_humber_jobs,
          E_midlands_jobs,
          W_midlands_jobs,
          E_jobs,
          SE_jobs,
          SW_jobs,
          wales_jobs,
          NI_jobs) %>%
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
                                 TRUE ~ subsector_letter),
           info = "jobs"
    )  %>%
    relocate(industry:info, .before = subsector_letter)


# Hours
years <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls", sheet = "Hours", range = "A7:A28") %>% 
    rename(year = ...1)

UK_hours <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls", sheet = "Hours", range = "A7:R28") %>%
    clean_names() %>%
    rename(year = x1) %>%
    mutate(region = "UK") %>% 
    pivot_longer(cols = c(-year,-region), names_to = "subsector_letter", values_to = "hours")

scotland_hours <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls", sheet = "Hours", range = "GG7:GW28") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "Scotland") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "hours")


london_hours <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls", sheet = "Hours", range = "DQ7:EG28") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "London") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "hours")

NE_hours <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Hours", range = "S7:AI28") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "North East") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "hours")

NW_hours <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Hours", range = "AJ7:AZ28") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "North West") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "hours")


yorkshire_and_humber_hours <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Hours", range = "BA7:BQ28") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "Yorkshire and the Humber") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "hours")


E_midlands_hours <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Hours", range = "BR7:CH28") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "East Midlands") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "hours")

W_midlands_hours <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Hours", range = "CI7:CY28") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "West Midlands") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "hours")

E_hours <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Hours", range = "CZ7:DP28") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "East") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "hours")

SE_hours <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Hours", range = "EH7:EX28") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "South East") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "hours")

SW_hours <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Hours", range = "EY7:FO28") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "South West") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "hours")

wales_hours <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Hours", range = "FP7:GF28") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "Wales") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "hours")

NI_hours <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Hours", range = "FP7:GF28") %>%
    clean_names()  %>%
    cbind(., years) %>% 
    mutate(region = "Northern Ireland") %>%
    pivot_longer(cols = c(-year, -region), names_to = "subsector_letter", values_to = "hours")

UK_regional_hours <-
    rbind(UK_hours,
          scotland_hours,
          london_hours,
          NE_hours,
          NW_hours,
          yorkshire_and_humber_hours,
          E_midlands_hours,
          W_midlands_hours,
          E_hours,
          SE_hours,
          SW_hours,
          wales_hours,
          NI_hours) %>%
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
                                 TRUE ~ subsector_letter),
           info = "hours"
    )  %>%
    relocate(industry:info, .before = subsector_letter)


#Grand Table

UK_regional_output_per_job <-
    rbind(UK_output_per_job,
          scotland_output_per_job,
          london_output_per_job,
          NE_output_per_job,
          NW_output_per_job,
          yorkshire_and_humber_output_per_job,
          E_midlands_output_per_job,
          W_midlands_output_per_job,
          E_output_per_job,
          SE_output_per_job,
          SW_output_per_job,
          wales_output_per_job,
          NI_output_per_job) %>%
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
                                 TRUE ~ subsector_letter),
           info = "output_per_job"
    )  %>%
    relocate(industry:info, .before = subsector_letter)