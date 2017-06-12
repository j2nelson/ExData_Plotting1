data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".", na.strings = "?")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

subSetData$Date <- as.Date(subSetData$Date,"%d/%m/%Y")
subSetData <- cbind(subSetData, "DateTime" = as.POSIXct(paste(subSetData$Date, subSetData$Time)))

png("plot3.png", width = 480, height = 480)
with(subSetData, {plot(Sub_metering_1 ~ DateTime, type = "l", xlab = "", ylab = "Energy sub metering")})
lines(subSetData$Sub_metering_2 ~ subSetData$DateTime, col = 'Red')
lines(subSetData$Sub_metering_3 ~ subSetData$DateTime, col = 'Blue')
legend("topright", lty = 1, lwd = 3, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()