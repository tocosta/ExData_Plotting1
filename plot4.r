## EDIT THE FILE PATH HERE:
filePath <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
##

## Getting data
myData <- read.table(filePath, header=TRUE,  sep=";", na = "?")

## filtering data
filteredData <- myData[(as.Date(myData$Date, "%d/%m/%Y")>=as.Date("2007/02/01", "%Y/%m/%d") & 
                            as.Date(myData$Date, "%d/%m/%Y")<=as.Date("2007/02/02", "%Y/%m/%d")),]

## opening device
png("plot4.png", width =480, height=480, units='px', bg='white')

## plotting the data:

## dividing device workspace
par(mfrow = c(2,2))

## Plot 1
plot(strptime(paste(filteredData$Date, filteredData$Time), "%d/%m/%Y %H:%M:%S"), 
     filteredData$Global_active_power,
     type = "l",
     xaxt = NULL,
     xlab = "",
     ylab = "Global Active Power")

## Plot 2
plot(strptime(paste(filteredData$Date, filteredData$Time), "%d/%m/%Y %H:%M:%S"), 
     filteredData$Voltage,
     xaxt = NULL,
     xlab = "datetime",
     ylab = "Voltage",
     type = "n")

lines(strptime(paste(filteredData$Date, filteredData$Time), "%d/%m/%Y %H:%M:%S"), 
      filteredData$Voltage, 
      type = "S")

## Plot 3
plot(strptime(paste(filteredData$Date, filteredData$Time), "%d/%m/%Y %H:%M:%S"), 
     filteredData$Sub_metering_1, 
     col="black",
     xlab = "",
     xaxt = NULL,
     ylab = "Energy sub metering",
     type = "n")

## Sub_metering_1 line
lines(strptime(paste(filteredData$Date, filteredData$Time), "%d/%m/%Y %H:%M:%S"), 
      filteredData$Sub_metering_1,
      col  = "black", 
      type = "S")

## Sub_metering_2 line
lines(strptime(paste(filteredData$Date, filteredData$Time), "%d/%m/%Y %H:%M:%S"), 
      filteredData$Sub_metering_2, 
      col  = "red", 
      type = "S")

## Sub_metering_3 line
lines(strptime(paste(filteredData$Date, filteredData$Time), "%d/%m/%Y %H:%M:%S"), 
      filteredData$Sub_metering_3, 
      col  = "blue", 
      type = "S")

## Legend Plot 3
legend("topright",
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1,
       box.lwd = 0,
       bty = "n")

## Plot 4
plot(strptime(paste(filteredData$Date, filteredData$Time), "%d/%m/%Y %H:%M:%S"), 
     filteredData$Global_reactive_power,
     type = "l",
     xaxt = NULL,
     xlab = "datetime",
     ylab = "Global_reactive_power")

## closing device
dev.off()