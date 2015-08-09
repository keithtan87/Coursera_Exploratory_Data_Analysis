## import data set for analysis
data_power <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_power$Date <- as.Date(data_power$Date, format="%d/%m/%Y")

## Subset the data set
data_final <- subset(data_power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_power)

## Converting dates
datetime <- paste(as.Date(data_final$Date), data_final$Time)
data_final$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data_final$Global_active_power~data_final$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
