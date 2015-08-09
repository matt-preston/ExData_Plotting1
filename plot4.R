# Read the data
data <- read.table("household_power_consumption.txt", 
                   sep = ";", 
                   colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                   header = TRUE,
                   na.strings = c("?"))

# Subset to the required date range
filtered <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]

# Construct a Date column
filtered$DateTime <- as.POSIXct(paste(filtered$Date, filtered$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

# Draw the plots
png("plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
with(filtered, {
    plot(Global_active_power ~ DateTime, type = "l", ylab = "Global Active Power", xlab = "")
    plot(Voltage ~ DateTime, type = "l", ylab = "Voltage")
    plot(Sub_metering_1 ~ DateTime, type = "l", ylab = "Energy sub metering", xlab = "")
    lines(Sub_metering_2 ~ DateTime, col = "red")
    lines(Sub_metering_3 ~ DateTime, col = "blue")
    legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n", 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power ~ DateTime, type = "l")
})
dev.off()
