

## I have saved the dataset in ./data directory in my PC. We need to read that and have to subset
## the data between the dates "1/2/2007"and"2/2/2007"
powerCosumpDataFile <- "./data/household_power_consumption.txt"
powerConsumpdata <- read.table(powerCosumpDataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
powerConsumpSubsetData <- data[powerConsumpdata$Date %in% c("1/2/2007","2/2/2007") ,]
head(powerConsumpSubsetData)

#for plot2 of the project we need to plot global_active_power with data/time. The below code creates a plot2.png 

##Date/time concatenation
#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()