

## I have saved the dataset in ./data directory in my PC. We need to read that and have to subset
## the data between the dates "1/2/2007"and"2/2/2007"
powerCosumpDataFile <- "./data/household_power_consumption.txt"
powerConsumpdata <- read.table(powerCosumpDataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
powerConsumpSubsetData <- data[powerConsumpdata$Date %in% c("1/2/2007","2/2/2007") ,]
head(powerConsumpSubsetData)

#for plot4 of the project we need to plot 4 graphs. 
pasteDateTime <- paste(powerConsumpSubsetData$Date, powerConsumpSubsetData$Time, sep=" ")
datetime <- strptime(pasteDateTime, "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(powerConsumpSubsetData$Global_active_power)
globalReactivePower <- as.numeric(powerConsumpSubsetData$Global_reactive_power)
voltage <- as.numeric(powerConsumpSubsetData$Voltage)
subMetering1 <- as.numeric(powerConsumpSubsetData$Sub_metering_1)
subMetering2 <- as.numeric(powerConsumpSubsetData$Sub_metering_2)
subMetering3 <- as.numeric(powerConsumpSubsetData$Sub_metering_3)

## The below code creates a plot4.png which contains 4 graphs
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) ##plot to contain 4 graph positioned in 2 rows and 2 columns

##plot the top left graph
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

##plot the top right graph
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

##plot the lower left graph
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

##plot the lower right graph
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()