
library(readr)
library(readxl)
library(janitor)
library(tidyverse)


UK_hist <- read_xls("data/UK Labour Productivity - Historical.xls")
UK_sick_abs <- read_xlsx("data/UK Labour Market - Sickness and Absence.xlsx")
UK_ind_div <- read_xls("data/UK Labour Productivity - Industry division.xls")
UK_jobs_by_ind <- read_xls("data/UK Labour Productivity - Jobs in Regions by Industry.xls")
UK_reg_ind <- read_xls("data/UK Labour Productivity - Region by Industry.xls")
UK_prod_ts <- read_xlsx("data/Uk Labour Productivity - Time Series.xlsx")
UK_public_service <- read_xlsx("data/UK Public Service Productivity.xlsx")
europe_prod <- read_xls("data/International Labour Productivity - Europe.xls")
G7_prod <- read_xls("data/International Labour Productivity - G7.xls")

multifactor_prod <- read_xls("data/Multifactor Productivity - OECD Countries.xls")

reg_prod_hours <- read_xls("data/Regional Productivity - Hours and jobs.xls")

UK_agri <- read_xls("data/UK Agriculture Productivity .xls")

UK_ed <- read_xlsx("data/UK Education Productivity.xlsx")