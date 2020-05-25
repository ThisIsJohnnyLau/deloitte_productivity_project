# Libraries
library(readxl)
library(tidyverse)
library(janitor)
library(lubridate)
library(zoo)
library(dplyr)
library(TableToLongForm)




    
    
# Output per job


UK_output_per_job <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
                              sheet = "OpJ (value)", range = "A7:R27") %>%
    mutate(region = "UK")

...1 <- UK_output_per_job[1]

scotland_output_per_job <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
                            sheet = "OpJ (value)", range = "GG7:GW27") %>%
    cbind(., ...1) %>% 
    mutate(region = "Scotland") 

london_output_per_job <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
                                  sheet = "OpJ (value)", range = "DQ7:EG27") %>%
    cbind(., ...1) %>% 
    mutate(region = "London")

NE_output_per_job <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpJ (value)", range = "S7:AI27") %>%
    cbind(., ...1) %>% 
    mutate(region = "North East") 

NW_output_per_job <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpJ (value)", range = "AJ7:AZ27") %>%
    cbind(., ...1) %>% 
    mutate(region = "North West") 


yorkshire_and_humber_output_per_job <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpJ (value)", range = "BA7:BQ27") %>%
    cbind(., ...1) %>% 
    mutate(region = "Yorkshire and the Humber")


E_midlands_output_per_job <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpJ (value)", range = "BR7:CH27") %>%
    cbind(., ...1) %>% 
    mutate(region = "East Midlands") 


W_midlands_output_per_job <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpJ (value)", range = "CI7:CY27") %>%
    cbind(., ...1) %>% 
    mutate(region = "West Midlands") 


E_output_per_job <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpJ (value)", range = "CZ7:DP27") %>%
    cbind(., ...1) %>% 
    mutate(region = "East") 


SE_output_per_job <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpJ (value)", range = "EH7:EX27") %>%
    cbind(., ...1) %>% 
    mutate(region = "South East")



SW_output_per_job <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpJ (value)", range = "EY7:FO27") %>%
    cbind(., ...1) %>% 
    mutate(region = "South West") 


wales_output_per_job <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpJ (value)", range = "FP7:GF27") %>%
    cbind(., ...1) %>% 
    mutate(region = "Wales") 


NI_output_per_job <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpJ (value)", range = "FP7:GF27") %>%
    cbind(., ...1) %>% 
    mutate(region = "Northern Ireland")


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
    pivot_longer(cols = c(-...1, -region), names_to = "subsector_letter", values_to = "Output per job") %>% 
    pivot_longer("Output per job", names_to = "info_type", values_to = "data")



# Output per hour

UK_output_per_hour <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
                               sheet = "OpH (value)", range = "A7:R27") %>%
    mutate(region = "UK")

...1 <- UK_output_per_hour[1]

scotland_output_per_hour <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls", sheet = "OpH (value)", range = "GG7:GW27") %>%
    cbind(., ...1) %>% 
    mutate(region = "Scotland") 



london_output_per_hour <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls", sheet = "OpH (value)", range = "DQ7:EG27") %>%
    cbind(., ...1) %>% 
    mutate(region = "London") 


NE_output_per_hour <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpH (value)", range = "S7:AI27") %>%
    cbind(., ...1) %>% 
    mutate(region = "North East") 


NW_output_per_hour <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpH (value)", range = "AJ7:AZ27") %>%
    cbind(., ...1) %>% 
    mutate(region = "North West") 



yorkshire_and_humber_output_per_hour <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpH (value)", range = "BA7:BQ27") %>%
    cbind(., ...1) %>% 
    mutate(region = "Yorkshire and the Humber")



E_midlands_output_per_hour <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpH (value)", range = "BR7:CH27") %>%
    cbind(., ...1) %>% 
    mutate(region = "East Midlands") 


W_midlands_output_per_hour <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpH (value)", range = "CI7:CY27") %>%
    cbind(., ...1) %>% 
    mutate(region = "West Midlands") 


E_output_per_hour <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpH (value)", range = "CZ7:DP27") %>%
    cbind(., ...1) %>% 
    mutate(region = "East") 


SE_output_per_hour <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpH (value)", range = "EH7:EX27") %>%
    cbind(., ...1) %>% 
    mutate(region = "South East") 


SW_output_per_hour <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpH (value)", range = "EY7:FO27") %>%
    cbind(., ...1) %>% 
    mutate(region = "South West") 


wales_output_per_hour <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpH (value)", range = "FP7:GF27") %>%
    cbind(., ...1) %>% 
    mutate(region = "Wales")


NI_output_per_hour <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "OpH (value)", range = "FP7:GF27") %>%
    cbind(., ...1) %>% 
    mutate(region = "Northern Ireland")


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
    pivot_longer(cols = c(-...1, -region), names_to = "subsector_letter", values_to = "Output per hour worked") %>% 
    pivot_longer("Output per hour worked", names_to = "info_type", values_to = "data")


#Jobs


UK_jobs <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
                    sheet = "Jobs", range = "A7:R28") %>%
    mutate(region = "UK")

...1 <- UK_jobs[1]

scotland_jobs <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls", sheet = "Jobs", range = "GG7:GW28") %>%
    cbind(., ...1) %>% 
    mutate(region = "Scotland")

london_jobs <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls", sheet = "Jobs", range = "DQ7:EG28") %>%
    cbind(., ...1) %>% 
    mutate(region = "London") 


NE_jobs <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Jobs", range = "S7:AI28") %>%
    cbind(., ...1) %>% 
    mutate(region = "North East")


NW_jobs <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Jobs", range = "AJ7:AZ28") %>%
    cbind(., ...1) %>% 
    mutate(region = "North West") 


yorkshire_and_humber_jobs <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Jobs", range = "BA7:BQ28") %>%
    cbind(., ...1) %>% 
    mutate(region = "Yorkshire and the Humber") 



E_midlands_jobs <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Jobs", range = "BR7:CH28") %>%
    cbind(., ...1) %>% 
    mutate(region = "East Midlands") 


W_midlands_jobs <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Jobs", range = "CI7:CY28") %>%
    cbind(., ...1) %>% 
    mutate(region = "West Midlands") 


E_jobs <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Jobs", range = "CZ7:DP28") %>%
    cbind(., ...1) %>% 
    mutate(region = "East")


SE_jobs <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Jobs", range = "EH7:EX28") %>%
    cbind(., ...1) %>% 
    mutate(region = "South East") 


SW_jobs <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Jobs", range = "EY7:FO28") %>%
    cbind(., ...1) %>% 
    mutate(region = "South West") 


wales_jobs <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Jobs", range = "FP7:GF28") %>%
    cbind(., ...1) %>% 
    mutate(region = "Wales") 


NI_jobs <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Jobs", range = "FP7:GF28") %>%
    cbind(., ...1) %>% 
    mutate(region = "Northern Ireland") 


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
    pivot_longer(cols = c(-...1,-region), names_to = "subsector_letter", values_to = "jobs") %>% 
    pivot_longer(jobs, names_to = "info_type", values_to = "data")

# Hours


UK_hours <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls", sheet = "Hours", range = "A7:R28") %>%
    mutate(region = "UK") 

...1 <- UK_hours[1]

scotland_hours <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls", sheet = "Hours", range = "GG7:GW28") %>%
    cbind(., ...1) %>% 
    mutate(region = "Scotland")



london_hours <- read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls", sheet = "Hours", range = "DQ7:EG28") %>%
    cbind(., ...1) %>% 
    mutate(region = "London") 


NE_hours <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Hours", range = "S7:AI28") %>%
    cbind(., ...1) %>% 
    mutate(region = "North East") 


NW_hours <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Hours", range = "AJ7:AZ28") %>%
    cbind(., ...1) %>% 
    mutate(region = "North West") 



yorkshire_and_humber_hours <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Hours", range = "BA7:BQ28") %>%
    cbind(., ...1) %>% 
    mutate(region = "Yorkshire and the Humber") 



E_midlands_hours <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Hours", range = "BR7:CH28") %>%
    cbind(., ...1) %>% 
    mutate(region = "East Midlands")


W_midlands_hours <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Hours", range = "CI7:CY28") %>%
    cbind(., ...1) %>% 
    mutate(region = "West Midlands") 


E_hours <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Hours", range = "CZ7:DP28") %>%
    cbind(., ...1) %>% 
    mutate(region = "East") 


SE_hours <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Hours", range = "EH7:EX28") %>%
    cbind(., ...1) %>% 
    mutate(region = "South East") 


SW_hours <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Hours", range = "EY7:FO28") %>%
    cbind(., ...1) %>% 
    mutate(region = "South West") 


wales_hours <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Hours", range = "FP7:GF28") %>%
    cbind(., ...1) %>% 
    mutate(region = "Wales") 


NI_hours <-
    read_xls("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls",
             sheet = "Hours", range = "FP7:GF28") %>%
    cbind(., ...1) %>% 
    mutate(region = "Northern Ireland")


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
    pivot_longer(cols = c(-...1, -region), names_to = "subsector_letter", values_to = "Average Total Weekly Hours") %>%
    pivot_longer("Average Total Weekly Hours", names_to = "info_type", values_to = "data")


#Grand Table

UK_regional_productivity_data <-
    rbind(UK_regional_hours,
          UK_regional_jobs,
          UK_regional_output_per_hour,
          UK_regional_output_per_job
          ) %>%
    mutate(industry =  case_when(subsector_letter %in% natural_res_and_util ~ "Natural Resources and Utilities",
                                 subsector_letter %in% construction ~ "Construction",
                                 subsector_letter %in% manufacturing ~ "Manufacturing",
                                 subsector_letter %in% telecoms ~ "Telecoms",
                                 subsector_letter %in% trade ~ "Trade",
                                 subsector_letter %in% leisure_and_entertainment ~ "Leisure and Entertainment",
                                 subsector_letter %in% transport ~ "Transport",
                                 subsector_letter %in% ed_and_health ~ "Education and Health",
                                 subsector_letter %in% prof_and_biz_services ~ "Professional and Business Services",
                                 subsector_letter %in% public_admin_and_def ~ "Public Aadmin and Defence",
                                 subsector_letter %in% financial_services ~ "Financial Services",
                                 subsector_letter %in% other_services ~ "Other Services",
                                 TRUE ~ subsector_letter)
           ) %>%
    relocate(industry, .before = subsector_letter) %>% 
    rename(year = ...1)


write_csv(UK_regional_productivity_data, "clean_data/UK_regional_productivity")

