library(lubridate)
library(dplyr)
pc <- read.delim("household_power_consumption.txt", sep = ";", na.strings = c("?"), 
                 colClasses = c("character", "character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")) %>%
  filter(dmy(Date) == ymd("2007-02-01") | dmy(Date) == ymd("2007-02-02"))  %>% 
  mutate(DateTime=dmy_hms(paste(pc$Date,pc$Time)))

png(filename="plot2.png")
with(pc, plot(DateTime, Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()