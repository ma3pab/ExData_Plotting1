

# Load in initial Data and replace ? with NA
        library(dplyr)
        householddata <- read.table("household_power_consumption.txt" , sep = ";", 
                                    header = TRUE, na.strings = "?" )
        
# Tidy Data to create datetime formats and filter dates
        householddata$Datetime <- as.POSIXct(strptime(paste(householddata$Date,
                                                            householddata$Time), "%d/%m/%Y %H:%M:%S"))
        
        householddatafilter <- householddata %>%
                filter(Date =="1/2/2007"  | Date == "2/2/2007"   )

# Plot 4
        png(filename = "Plot4.png", width = 480, height = 480,   units = "px")
        # Set 2x2 Grid 
        par(mfrow = c(2,2))
        
        # Sub Plot 1
        with( householddatafilter, plot(Datetime, Global_active_power,  type='l', 
                                        xlab = NA, ylab = "Global Active Power"))
        
        # Sub Plot 2
        with( householddatafilter, plot(Datetime, Voltage,  type='l', 
                                        xlab = "datetime", ylab = "Voltage"))
        
        # Sub Plot 3
        with( householddatafilter, plot(Datetime, Sub_metering_1, type='l', 
                                        xlab = NA, ylab = "Energy sub metering"))
        with( householddatafilter, lines(Datetime, Sub_metering_2, col='red'))
        with( householddatafilter, lines(Datetime, Sub_metering_3, col='blue'))
        
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", 
                                      "Sub_metering_3"), pch=20, col = c("black", "red", "blue"))
        
        # Sub Plot 4
        with( householddatafilter, plot(Datetime, Global_reactive_power,  type='l', 
                                        xlab = "datetime"))
        dev.off()