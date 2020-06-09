# Measurements of electric power consumption in one household with a one-minute 
# sampling rate over a period of almost 4 years. Different electrical quantities 
# and some sub-metering values are available.

# Load in initial Data and replace ? with NA
        library(dplyr)
        householddata <- read.table("household_power_consumption.txt" , sep = ";", 
                                    header = TRUE, na.strings = "?" )

# Tidy Data to create datetime formats and filter dates
        householddata$Datetime <- as.POSIXct(strptime(paste(householddata$Date,
                                        householddata$Time), "%d/%m/%Y %H:%M:%S"))
        
        householddatafilter <- householddata %>%
                filter(Date =="1/2/2007"  | Date == "2/2/2007"   )

# Plot 1
        png(filename = "Plot1.png", width = 480, height = 480,   units = "px")
            with( householddatafilter, hist(Global_active_power, 
                        xlab = "Global Active Power (kilowatts)", col = "red", 
                        main = "Global Active Power"))
        dev.off()