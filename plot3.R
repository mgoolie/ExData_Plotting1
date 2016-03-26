library(lubridate)
library(dplyr)
pc <- read.delim("household_power_consumption.txt", sep = ";", na.strings = c("?"), 
                 colClasses = c("character", "character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")) %>%
  filter(dmy(Date) == ymd("2007-02-01") | dmy(Date) == ymd("2007-02-02"))  %>% 
  mutate(DateTime=dmy_hms(paste(pc$Date,pc$Time)))

png(filename="plot3.png")
with(pc,plot(DateTime,Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering"))
with(pc,points(DateTime, Sub_metering_1, col="black", type="l"))
with(pc,points(DateTime, Sub_metering_2, col="red", type="l"))
with(pc,points(DateTime, Sub_metering_3, col="blue", type="l"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = 1)
dev.off()