#Sectors

natural_res_and_util <- c("A", "B", "D", "E", "A, B, D, and E")
construction <- "F"
manufacturing <- "C"
telecoms <- "J"
trade <- "G"
leisure_and_entertainment <- c("I", "R")
transport <- "H"
ed_and_health <- c("P", "Q")
prof_and_biz_services <- c("M", "N")
public_admin_and_def <- "O"
financial_services <- c("K", "L")
other_services <- c("S", "T", "S and T")


read_excel("raw_data/data/UK_productivity/UK Labour Productivity - Region by Industry.xls", 
                                                        sheet = "Jobs", range = "C5:X6") %>%
    write_csv("clean_data/industry_names.csv")
