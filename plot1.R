## Make sure the working directory is the same directory ad the R files and the .txt data file

##read the file
data <- read.csv("household_power_consumption.txt", header = TRUE, sep=";")
##separate the file by the first date, Feb. 1st
dataFebFirst <-data[data$Date=="1/2/2007",] 
##separate the file by the second date, Feb. 2nd
dataFebSec <-data[data$Date=="2/2/2007",]
##rbind the two data frames together
consumptionData <- rbind(dataFebFirst,dataFebSec)

##prepare the graphical display (or in this case, saving as png with 480 width and height)
png("plot1.png", width = 480, height = 480)
## Generate the histogram with the correct color, title (main), and xlabel
hist(as.numeric(as.character(consumptionData$Global_active_power)), col = "red",main = "Global Active Power" ,xlab = "Global Active Power (kilowatts)")
##required for saving as png
dev.off()