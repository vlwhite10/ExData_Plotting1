#Download and unzip file
temp<-tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp, mode="wb")
unzip(temp, "household_power_consumption.txt")

#Read text file to table
PowerConsumption <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE, na.strings="?")
PowerConsumptionSub <- PowerConsumption[PowerConsumption$Date %in% c("1/2/2007", "2/2/2007"),]

#Plot 1
globalActivePower <-as.numeric(PowerConsumptionSub$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

dev.off