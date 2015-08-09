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

# Draw the plot
png("plot2.png", width = 480, height = 480)
plot(filtered$DateTime, 
     filtered$Global_active_power,
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l")
dev.off()