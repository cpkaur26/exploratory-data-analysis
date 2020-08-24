#read data
hpcdata <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";", na.strings = "?")
#change class of Date
hpcdata$Date<- as.Date(hpcdata$Date, format = "%d/%m/%Y")
#subset data for specified dates
subData<- subset(hpcdata, Date== "2007-02-01" |Date == "2007-02-02")
# plot 1 
png("plot1.png")
hist(subData$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab="Frequency", main = "Global Active Power", border = "black")
dev.off()