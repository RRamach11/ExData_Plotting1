

## I have saved the dataset in ./data directory in my PC. We need to read that and have to subset
## the data between the dates "1/2/2007"and"2/2/2007"
powerCosumpDataFile <- "./data/household_power_consumption.txt"
powerConsumpdata <- read.table(powerCosumpDataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
powerConsumpSubsetData <- data[powerConsumpdata$Date %in% c("1/2/2007","2/2/2007") ,]
head(powerConsumpSubsetData)

#for plot2 of the project we need to plot global_active_power with data/time. The below code creates a plot2.png 

##Date/time concatenation
pasteDateTime <- paste(powerConsumpSubsetData$Date, powerConsumpSubsetData$Time, sep=" ")
datetime <- strptime(pasteDateTime, "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(powerConsumpSubsetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()