## Make sure the working directory is the same directory ad the R files and the .txt data file

##read the file
data <- read.csv("household_power_consumption.txt", header = TRUE, sep=";")
##separate the file by the first date, Feb. 1st
dataFebFirst <-data[data$Date=="1/2/2007",] 
##separate the file by the second date, Feb. 2nd
dataFebSec <-data[data$Date=="2/2/2007",]
##rbind the two data frames together
consumptionData <- rbind(dataFebFirst,dataFebSec)

##Combine Date and Times into one. From ?strptime, found out to use paste() for dates and times to get strptime(x, "%m/%d/%y %H:%M:%S")
consumptionData$dateAndTime <- strptime(paste(consumptionData$Date, consumptionData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

##prepare the graphical display (or in this case, saving as png with 480 width and height)
png("plot3.png", width = 480, height = 480)

## Generate the plot (x is date and time, y is sub metering) with the correct type ("l" for lines), ylab, and xlab ("" for empty)
plot(consumptionData$dateAndTime, as.numeric(as.character(consumptionData$Sub_metering_1)), type="n", ylab = "Energy sub metering", xlab = "")
## Use points() to add in the three line data with different colors
points(consumptionData$dateAndTime, as.numeric(as.character(consumptionData$Sub_metering_1)), type ="l",col = "black")
points(consumptionData$dateAndTime, as.numeric(as.character(consumptionData$Sub_metering_2)), type ="l",col = "red")
points(consumptionData$dateAndTime, as.numeric(as.character(consumptionData$Sub_metering_3)), type ="l",col = "blue")
##Generate the legend in the top right, with the appropriate labels, symbols (lines), and colors
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

##required for saving as png
dev.off()