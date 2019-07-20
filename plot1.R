library(dplyr)
hpc <- tbl_df(read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", nrows = 100))
as.Date(hpc$Date, format = "%m/%d/%Y")
