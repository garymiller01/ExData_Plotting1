
# Project 1 - Plot 1

# setwd("F:/Coursera/ExploratoryData/project")

# Data file downloaded from the url given below on 7/10/2014.

# dataurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

# Read in data

originalDf <- read.table("household_power_consumption.txt",
                         header=TRUE,sep=";",quote="",na.strings="?")

# Reformat Date column

originalDf$Date <- as.Date(originalDf$Date,format="%d/%m/%Y")

# Subset dates 2/1/2007 - 2/2/2007

finalDf <- originalDf[originalDf$Date=="2007-02-01" | originalDf$Date=="2007-02-02",]

# Create Plot 1

png(filename="plot1.png",width=480,height=480)

hist(finalDf$Global_active_power,
     col="orangered",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     main="Global Active Power")

dev.off()
