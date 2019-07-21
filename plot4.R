# Read data 
        library(dplyr)
        hpc <- tbl_df(read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                                 na.strings = "?", nrows = 2075259))


# Filter data with dates between 1/2/2007 and 2/2/2007        
        hpcsubset <- filter(hpc, Date %in% c("1/2/2007", "2/2/2007"))
        rm(hpc) # remove the original dataset


# Combine the Date and Time columns into a new column, datetime, and convert to Date class        
        hpc_dt <- mutate(hpcsubset, datetime = paste(Date, Time, sep = " "))
        hpc_dt$datetime <- strptime(hpc_dt$datetime, format = "%d/%m/%Y %H:%M:%S")


# Plot graphs and save to PNG file
        png("ExData_Plotting1/plot4.png", width = 480, height = 480)
        
        par(mfrow = c(2, 2))
        with(hpc_dt, {
                plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
                
                plot(datetime, Voltage, type = "l", ylab = "Voltage")
                
                plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
                lines(datetime, Sub_metering_2, col = "red")
                lines(datetime, Sub_metering_3, col = "blue")
                legend("topright", lty = 1, lwd = 2, bty = "n", col = c("black", "red", "blue"), 
                       legend = c("Sub-metering 1", "Sub-metering 2", "Sub-metering 3"))
                
                plot(datetime, Global_reactive_power, type = "l", ylab = "Global Reactive Power")
        })
        
       dev.off()



