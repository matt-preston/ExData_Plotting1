# Read the data
data <- read.table("household_power_consumption.txt", 
                   sep = ";", 
                   colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                   header = TRUE,
                   na.strings = c("?"))

# Subset to the required date range
filtered <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]

# Draw a histogram
png("plot1.png",width = 480, height = 480)
hist(filtered$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", 
     col = "red")
dev.off()