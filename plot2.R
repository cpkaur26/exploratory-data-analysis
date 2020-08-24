#read data
hpcdata <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";", na.strings = "?")
#change class of date
hpcdata$Date<- as.Date(hpcdata$Date, format = "%d/%m/%Y")
#subset data for specified dates
subData<- subset(hpcdata, Date== "2007-02-01" |Date == "2007-02-02")
#create a Date_Time column
subData$Date_Time<- as.POSIXct(paste(subData$Date, subData$Time))
#plot 2
png("plot2.png")
plot(subData$Date_Time, subData$Global_active_power, ylab = "Global Active Power (kilowatts)", type = "l", xlab = "")
dev.off()