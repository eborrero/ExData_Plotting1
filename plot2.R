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
png("plot2.png", width = 480, height = 480)
## Generate the plot (x is date and time, y is global active power) with the correct type ("l" for lines), ylab, and xlab ("" for empty)
plot(consumptionData$dateAndTime, as.numeric(as.character(consumptionData$Global_active_power)), type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
##required for saving as png
dev.off()