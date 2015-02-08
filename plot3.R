## plot3 This program produces plot3 for Course projct 1. \
## plot3 is a  of Energy sub metering (1,2,3) over the 48 hour period 
## from 1 February 2007 through 2 February 2007. The data is from the file
## "household_power_consumption.txt" . This data is available from:
## UCI Machine Learning Repository; 
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## The fuction is entirely
## self-contained. It has no arguments.
## Usage: plot3()
## is is assumed that the data is in directory from which the function is invoked.

## functions to load and process data file

getdata<-function(file,dates) {
      dat<-read.delim(file,header=TRUE,
                      sep=";",na.strings="?",
                      stringsAsFactors=F)
      out<-dat[(dat[,1]==dates[1]|dat[,1]==dates[2]),]
}

convertdatetime<-function(dat) {
      fmt<-"%d/%m/%Y %T"
      strptime(paste(dat[,1],dat[,2]),fmt)
}

## functions for reading data.
plot3<-function() {
      par(mfrow=c(1,1))
      filename <- "household_power_consumption.txt"
      dat<-getdata(filename, c("1/2/2007","2/2/2007"))
      dat$convertedTime<-convertdatetime(dat)
      
      png(filename="plot3.png")
      
      plot(dat$convertedTime,dat$Sub_metering_1,
           xlab="",ylab="Energy sub metering",
           type="l")
      points(dat$convertedTime,dat$Sub_metering_2,
             col="Red",type="l")
      points(dat$convertedTime,dat$Sub_metering_3,
             col="Blue",type="l")
      legend("topright",col=c("black","red","blue"),lty=1,
             legend= c("Sub_metering_1","Sub_metering_2",
                       "Sub_metering_3"))
      
      dev.off()
      
      
}