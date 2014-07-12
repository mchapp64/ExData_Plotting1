## This code will read in power consumption data and produce a chart.


## Read the data in

temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
df <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, sep = ";", na.strings="?")
unlink(temp)

## df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")


## subset for dates needed

df2 <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")
plotdata <- as.numeric(df2$Global_active_power)


## plot a histogram

hist(plotdata, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")