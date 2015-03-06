fileName <- './household_power_consumption.txt'
data <- fread(fileName);
DT <- data[data$Date %in% c("1/2/2007", "2/2/2007")]
png("plot2.png", width = 480, height = 480)
plot(strptime(paste(as.Date(DT$Date, format="%d/%m/%Y"), DT$Time, sep=" "), format="%Y-%m-%d %H:%M:%S"), DT$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()