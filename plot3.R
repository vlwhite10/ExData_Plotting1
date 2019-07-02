#Download and unzip file
temp<-tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp, mode="wb")
unzip(temp, "household_power_consumption.txt")

#Create tables
PowerConsumption <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE, na.strings="?")
PowerConsumptionSub <- PowerConsumption[PowerConsumption$Date %in% c("1/2/2007", "2/2/2007"),]

#Plot 3
datetime <- strptime(paste(PowerConsumptionSub$Date, PowerConsumptionSub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width=400, height = 480)

plot(datetime, PowerConsumptionSub$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, PowerConsumptionSub$Sub_metering_2, type="l", col="red")
lines(datetime, PowerConsumptionSub$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=2.5, col=c("black", "red", "blue"))

dev.off 