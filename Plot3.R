
# Project 1 - Plot 3

# Data file downloaded from the url given below on 7/10/2014.
# dataurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

# Read in Data

originalDf <- read.table("household_power_consumption.txt",
                         header=TRUE,sep=";",quote="",na.strings="?")

# Reformat Date column

originalDf$Date <- as.Date(originalDf$Date,format="%d/%m/%Y")

# Subset dates 2/1/2007 - 2/2/2007

finalDf <- originalDf[originalDf$Date=="2007-02-01" | originalDf$Date=="2007-02-02",]

# Reformat Date/Time 

finalDf$DateTime <- paste(finalDf$Date,' ',finalDf$Time)
finalDf$DateTime2 <- strptime(finalDf$DateTime,format="%Y-%m-%d %H:%M:%S")

# Create Plot 3

png(filename="plot3.png",width=480,height=480)

plot(finalDf$DateTime2,finalDf$Sub_metering_1,type="n",
     ylab="Energy sub metering",
     xlab="")
lines(finalDf$DateTime2,finalDf$Sub_metering_1,col="black",lty=1)
lines(finalDf$DateTime2,finalDf$Sub_metering_2,col="red",lty=1)
lines(finalDf$DateTime2,finalDf$Sub_metering_3,col="blue",lty=1)
legend("topright",col=c("black","red","blue"),lty=1,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
)

dev.off()

