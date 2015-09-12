## Reading the file
Data <- read.table("household_power_consumption.txt",sep = ";", header = TRUE)
## Convert the date format 
Data$Date <- as.Date(Data$Date, "%d/%m/%Y")
## Filtering the data
DataFiltered <- Data[which(Data$Date >= "2007-02-01" & Data$Date <= "2007-02-02"), ]
## Convert the numeric value 
DataFiltered$Global_active_power <- as.numeric(as.character(DataFiltered$Global_active_power))
## Opening the output device
png(filename = "plot1.png", width = 480, height = 480)
## Create the plot
hist(as.numeric(DataFiltered$Global_active_power), col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
## Closing the output device
dev.off()