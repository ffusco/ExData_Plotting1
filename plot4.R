## Reading the file
Data <- read.table("household_power_consumption.txt",sep = ";", header = TRUE)
## Convert the date format 
Data$Date <- as.Date(Data$Date, "%d/%m/%Y")
## Filtering the data
DataFiltered <- Data[which(Data$Date >= "2007-02-01" & Data$Date <= "2007-02-02"), ]
## Convert the value 
DataFiltered$Time <- strptime(paste(DataFiltered$Date,DataFiltered$Time), "%Y-%m-%d %H:%M:%S")
DataFiltered$Global_active_power <- as.numeric(as.character(DataFiltered$Global_active_power))
DataFiltered$Global_reactive_power <- as.numeric(as.character(DataFiltered$Global_reactive_power))
DataFiltered$Voltage <- as.numeric(as.character(DataFiltered$Voltage))
DataFiltered$Sub_metering_1 <- as.numeric(as.character(DataFiltered$Sub_metering_1))
DataFiltered$Sub_metering_2 <- as.numeric(as.character(DataFiltered$Sub_metering_2))
DataFiltered$Sub_metering_3 <- as.numeric(as.character(DataFiltered$Sub_metering_3))

ma <- max(c(DataFiltered$Sub_metering_1, DataFiltered$Sub_metering_2, DataFiltered$Sub_metering_3))

## Change the regional setting to English
Sys.setlocale("LC_TIME", "C");
## Opening the output device
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))
## Plot2
plot(DataFiltered$Time, as.numeric(DataFiltered$Global_active_power), 
     ylab = "Global Active Power", xlab = "", type = "l")
## Plot1
plot(DataFiltered$Time, as.numeric(DataFiltered$Voltage), 
     ylab = "Voltage", xlab = "datetime", type = "l")
## Plot3
plot(DataFiltered$Time, DataFiltered$Sub_metering_1, ylim = c(0, ma),
     ylab = "", xlab = "", type = "l", col = "black")
par(new=T)
plot(DataFiltered$Time, DataFiltered$Sub_metering_2, ylim = c(0, ma),
     ylab = "", xlab = "", axes = F, type = "l", col = "red")
par(new=T)
plot(DataFiltered$Time, DataFiltered$Sub_metering_3, ylim = c(0, ma),
     ylab = "Energy sub metering", xlab = "", axes = F, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=c(1, 1, 1), col=c("black","red", "blue"))
## Plot4
plot(DataFiltered$Time, as.numeric(DataFiltered$Global_reactive_power), 
     ylab = "Global_reactive_power", xlab = "datetime", type = "l")

## Closing the output device
dev.off()