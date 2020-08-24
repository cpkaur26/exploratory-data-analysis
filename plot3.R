#read data
hpcdata <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";", na.strings = "?")
#change class of date
hpcdata$Date<- as.Date(hpcdata$Date, format = "%d/%m/%Y")
#subset data for specified dates
subData<- subset(hpcdata, Date== "2007-02-01" |Date == "2007-02-02")
#create a Date_Time column
subData$Date_Time<- as.POSIXct(paste(subData$Date, subData$Time))
#plot 3
png("plot3.png")
with(subData, plot(Date_Time, Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering"))
lines(subData$Date_Time, subData$Sub_metering_2, col = "red", type = "l")
lines(subData$Date_Time, subData$Sub_metering_3, col = "blue", type = "l")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()               
          