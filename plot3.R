fileName <- './household_power_consumption.txt'
data <- fread(fileName);
DT <- data[data$Date %in% c("1/2/2007", "2/2/2007")]
png("plot3.png", width = 480, height = 480)

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

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1,1))

dev.off()