# Read data 
        library(dplyr)
        hpc <- tbl_df(read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                                 na.strings = "?", nrows = 2075259))

        
# Filter data with dates between 1/2/2007 and 2/2/2007        
        hpcsubset <- filter(hpc, Date %in% c("1/2/2007", "2/2/2007"))
        rm(hpc) # remove the original dataset

        
# Combine the Date and Time columns into a new column and convert to Date class        
        hpc_datetime <- mutate(hpcsubset, datetime = paste(Date, Time, sep = " "))
        hpc_datetime$datetime <- strptime(hpc_datetime$datetime, format = "%d/%m/%Y %H:%M:%S")

        
# Plot graph and save to PNG file
        png("ExData_Plotting1/plot2.png", width = 480, height = 480)

        plot(tmp2$datetime, tmp$Global_active_power, type = "l", xlab = "", 
             ylab = "Global Active Power (kilowatts)")
        
        dev.off()


