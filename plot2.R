#Download and unzip file
temp<-tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp, mode="wb")
unzip(temp, "household_power_consumption.txt")

#Create tables
PowerConsumption <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE, na.strings="?")
PowerConsumptionSub <- PowerConsumption[PowerConsumption$Date %in% c("1/2/2007", "2/2/2007"),]

#Plot 2
datetime <- strptime(paste(PowerConsumptionSub$Date, PowerConsumptionSub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width = 400, height=480)
plot(datetime, PowerConsumptionSub$Global_active_power, type="l", ylab="Global Active Power (kilowatts)")

dev.off