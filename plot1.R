# Read data 
        library(dplyr)
        hpc <- tbl_df(read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                                 na.strings = "?", nrows = 2075259))

                
# Filter data with dates between 1/2/2007 and 2/2/2007        
        hpcsubset <- filter(hpc, Date %in% c("1/2/2007", "2/2/2007"))
        rm(hpc) # remove the original dataset
        

# Create histogram and save to PNG file
        png("ExData_Plotting1/plot1.png", width = 480, height = 480)
        
        hist(hpcsubset$Global_active_power, main = "Global Active Power", 
             xlab = "Global Active Power (kilowatts)", col = "red")
        
        dev.off()


        