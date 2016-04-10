

## I have saved the datset in ./data directory in my PC. We need to read that and have to subset
## the data between the dates "1/2/2007"and"2/2/2007"

powerCosumpDataFile <- "./data/household_power_consumption.txt"
powerConsumpdata <- read.table(powerCosumpDataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
powerConsumpSubsetData <- data[powerConsumpdata$Date %in% c("1/2/2007","2/2/2007") ,]
head(powerConsumpSubsetData)

#for plot1 of the project we need to plot only the histogram of global_active_power. The below code subsets data first
## then creates a plot1.png file and then creates teh hsitogram
global_Active_Power <- as.numeric(powerConsumpSubsetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(global_Active_Power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()