#Download and unzip file
temp<-tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp, mode="wb")
unzip(temp, "household_power_consumption.txt")

#Create data table
PowerConsumption <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE, na.strings="?")
PowerConsumptionSub <- PowerConsumption[PowerConsumption$Date %in% c("1/2/2007", "2/2/2007"),]

#Plot 4
datetime <- strptime(paste(PowerConsumptionSub$Date, PowerConsumptionSub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height = 480)

par(mfrow=c(2,2))
plot(datetime, PowerConsumptionSub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(datetime, PowerConsumptionSub$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, PowerConsumptionSub$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, PowerConsumptionSub$Sub_metering_2, type="l", col="red")
lines(datetime, PowerConsumptionSub$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=2.5, cex=0.6, col=c("black", "red", "blue"))
plot(datetime, PowerConsumptionSub$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off
