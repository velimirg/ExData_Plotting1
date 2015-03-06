fileName <- './household_power_consumption.txt'
data <- fread(fileName);
DT <- data[data$Date %in% c("1/2/2007", "2/2/2007")]

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

#1,1:
plot(
  strptime(paste(as.Date(DT$Date, format="%d/%m/%Y"), DT$Time, sep=" "), format="%Y-%m-%d %H:%M:%S"), 
  DT$Global_active_power, 
  type="l", 
  ylab="Global Active Power (kilowatts)", 
  xlab=""
)

#1,2:
plot(
  strptime(paste(as.Date(DT$Date, format="%d/%m/%Y"), DT$Time, sep=" "), format="%Y-%m-%d %H:%M:%S"), 
  DT$Voltage, 
  type="l", 
  ylab="Voltage", 
  xlab=""
)
mtext('datetime', side=1, line=3)

#2,1:
plot(  
  strptime(paste(as.Date(DT$Date, format="%d/%m/%Y"), DT$Time, sep=" "), format="%Y-%m-%d %H:%M:%S"), 
  DT$Sub_metering_1, 
  type="l",
  ylab="Energy sub metering", 
  xlab=""
)

lines(
  strptime(paste(as.Date(DT$Date, format="%d/%m/%Y"), DT$Time, sep=" "), format="%Y-%m-%d %H:%M:%S"),    
  DT$Sub_metering_2,
  col="red"
)

lines(
  strptime(paste(as.Date(DT$Date, format="%d/%m/%Y"), DT$Time, sep=" "), format="%Y-%m-%d %H:%M:%S"),    
  DT$Sub_metering_3,
  col="blue"
)

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1,1), bty="n")

#2,2:
plot(  
  strptime(paste(as.Date(DT$Date, format="%d/%m/%Y"), DT$Time, sep=" "), format="%Y-%m-%d %H:%M:%S"), 
  DT$Global_reactive_power, 
  type="l",
  ylab="Global_reactive_power", 
  xlab=""
)
mtext('datetime', side=1, line=3)

dev.off()