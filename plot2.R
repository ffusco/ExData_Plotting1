## Reading the file
Data <- read.table("household_power_consumption.txt",sep = ";", header = TRUE)
## Convert the date format 
Data$Date <- as.Date(Data$Date, "%d/%m/%Y")
## Filtering the data
DataFiltered <- Data[which(Data$Date >= "2007-02-01" & Data$Date <= "2007-02-02"), ]
## Convert the value 
DataFiltered$Time <- strptime(paste(DataFiltered$Date,DataFiltered$Time), "%Y-%m-%d %H:%M:%S")
DataFiltered$Global_active_power <- as.numeric(as.character(DataFiltered$Global_active_power))
## Change the regional setting to English
Sys.setlocale("LC_TIME", "C");
## Opening the output device
png(filename = "plot2.png", width = 480, height = 480)
## Create the plot
plot(DataFiltered$Time, as.numeric(DataFiltered$Global_active_power), 
      ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
## Closing the output device
dev.off()