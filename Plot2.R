
# Load in initial Data and replace ? with NA
        library(dplyr)
        householddata <- read.table("household_power_consumption.txt" , sep = ";", 
                                    header = TRUE, na.strings = "?" )

# Tidy Data to create datetime formats and filter dates
        householddata$Datetime <- as.POSIXct(strptime(paste(householddata$Date,
                                        householddata$Time), "%d/%m/%Y %H:%M:%S"))
        
        householddatafilter <- householddata %>%
                filter(Date =="1/2/2007"  | Date == "2/2/2007"   )

# Plot 2
        png(filename = "Plot2.png", width = 480, height = 480,   units = "px")
        with( householddatafilter, plot(Datetime, Global_active_power, type='l', 
                                        xlab = NA, ylab = "Global Active Power (kilowatts)"))
        dev.off()