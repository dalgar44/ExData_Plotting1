data <- read.csv("./data/household_power_consumption.txt", sep=";")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data <- data[!is.na(data$DateTime) & data$DateTime >= as.POSIXct("2007-02-01") & data$DateTime < as.POSIXct("2007-02-03"),]

png(file="plot4.png")
par(mfcol=c(2,2))
hist(as.numeric(data$Global_active_power), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

plot(data$DateTime, data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", pch=c('_','_','_'), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$DateTime, data$Voltage, xlab="datetime", ylab="Voltage", type="n")
lines(data$DateTime, data$Voltage)

plot(data$DateTime, data$Global_reactive_power, xlab="datetime", ylab="Voltage", type="n")
lines(data$DateTime, data$Global_reactive_power)
dev.off()
