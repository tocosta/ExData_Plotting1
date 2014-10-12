## EDIT THE FILE PATH HERE:
filePath <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
##

## Getting data
myData <- read.table(filePath, header=TRUE,  sep=";", na = "?")
## filtering data
filteredData <- myData[(as.Date(myData$Date, "%d/%m/%Y")>=as.Date("2007/02/01", "%Y/%m/%d") & 
                          as.Date(myData$Date, "%d/%m/%Y")<=as.Date("2007/02/02", "%Y/%m/%d")),]

## opening device
png("plot1.png", width =480, height=480, units='px', bg='white')

## plotting the data
hist(filteredData$Global_active_power,
     col="orangered", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", 
     main="Global Active Power")

## closing device
dev.off()