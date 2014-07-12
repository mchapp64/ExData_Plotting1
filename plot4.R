## This code will read in power consumption data and produce a chart.


## Read the data in

temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
df <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, sep = ";", na.strings="?")
unlink(temp)

## subset for dates needed

df2 <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")
df2$DT <- strptime(paste(df2$Date,df2$Time), format="%d/%m/%Y %H:%M:%S")


## Start PNG
png(filename = "plot4.png")

## plot the 4 time series charts in one

par(mfrow=c(2,2))

with(df2, plot(DT, Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = ""))

with(df2, plot(DT, Voltage, type="l", ylab = "Voltage", xlab = "datetime"))

{
with(df2, plot(DT, Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "", col = "black"))
with(df2, lines(DT, Sub_metering_2, col = "red"))
with(df2, lines(DT, Sub_metering_3, col = "blue"))
legend("topright", lty = c(1,1,1), bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
}

with(df2, plot(DT, Global_reactive_power, type="l", ylab = "Global reative power", xlab = "datetime"))


## Make a PNG copy
dev.off()