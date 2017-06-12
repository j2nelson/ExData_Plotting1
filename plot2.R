
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".", na.strings = "?")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

subSetData$Date <- as.Date(subSetData$Date,"%d/%m/%Y")
subSetData <- cbind(subSetData, "DateTime" = as.POSIXct(paste(subSetData$Date, subSetData$Time)))

png("plot2.png", width = 480, height = 480)
plot(subSetData$DateTime, subSetData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()