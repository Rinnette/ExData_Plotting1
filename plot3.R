# Read data 
        library(dplyr)
        hpc <- tbl_df(read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                                 na.strings = "?", nrows = 2075259))


# Filter data with dates between 1/2/2007 and 2/2/2007        
        hpcsubset <- filter(hpc, Date %in% c("1/2/2007", "2/2/2007"))
        rm(hpc) # remove the original dataset


# Combine the Date and Time columns into a new column and convert to Date class        
        hpc_dt <- mutate(hpcsubset, datetime = paste(Date, Time, sep = " "))
        hpc_dt$datetime <- strptime(hpc_dt$datetime, format = "%d/%m/%Y %H:%M:%S")


# Plot graphs and save to PNG file
        png("ExData_Plotting1/plot3.png", width = 480, height = 480)
        
        plot(hpc_dt$datetime, hpc_dt$Sub_metering_1, type = "l", xlab = "", 
             ylab = "Energy Sub Metering")
        lines(hpc_dt$datetime, hpc_dt$Sub_metering_2, col = "red")
        lines(hpc_dt$datetime, hpc_dt$Sub_metering_3, col = "blue")
        
        legend("topright", lty = 1, lwd = 2, col = c("black", "red", "blue"), 
               legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))
        
        dev.off()
        


