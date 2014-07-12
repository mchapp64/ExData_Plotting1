## This code will read in power consumption data and produce a chart.


## Read the data in

temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
df <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, sep = ";", na.strings="?")
unlink(temp)

## df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")


## subset for dates needed

df2 <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

df2$DT <- strptime(paste(df2$Date,df2$Time), format="%d/%m/%Y %H:%M:%S")


## Start PNG
png(filename = "plot2.png")

## plot the time series chart
with(df2, plot(DT, Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = ""))

## Make a PNG copy
dev.off()

