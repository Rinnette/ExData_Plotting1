library(dplyr)
hpc <- tbl_df(read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 2075259))
hpcdata <- filter(hpc, Date %in% c("1/2/2007", "2/2/2007"))
as.Date(hpc$Date, format = "%m/%d/%Y")
