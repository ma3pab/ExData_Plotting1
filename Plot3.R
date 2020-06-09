

# Load in initial Data and replace ? with NA
        library(dplyr)
        householddata <- read.table("household_power_consumption.txt" , sep = ";", 
                                    header = TRUE, na.strings = "?" )

# Tidy Data to create datetime formats and filter dates
        householddata$Datetime <- as.POSIXct(strptime(paste(householddata$Date,
                                        householddata$Time), "%d/%m/%Y %H:%M:%S"))
        
        householddatafilter <- householddata %>%
                filter(Date =="1/2/2007"  | Date == "2/2/2007"   )

# Plot 3
    
        png(filename = "Plot3.png", width = 480, height = 480,   units = "px")
     
        with( householddatafilter, plot(Datetime, Sub_metering_1, type='l', 
                                        xlab = NA, ylab = "Energy sub metering"))
        with( householddatafilter, lines(Datetime, Sub_metering_2, col='red'))
        with( householddatafilter, lines(Datetime, Sub_metering_3, col='blue'))
        
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", 
                                      "Sub_metering_3"), pch=20, col = c("black", "red", "blue"))
        
        dev.off()