data <- read.csv("./data/household_power_consumption.txt", sep=";")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data_feb <- data[!is.na(data$DateTime) & data$DateTime >= as.POSIXct("2007-02-01") & data$DateTime < as.POSIXct("2007-02-03"),]

png(file="plot1.png")
hist(as.numeric(data_feb$Global_active_power), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()

