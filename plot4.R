## plot4 This program produces plot4 for Course projct 1. \
## plot4 is a plot consisting of four sub plots,
## Global Active Power, Voltage, Energy sub metering, and Global Reactive Power.
## from 1 February 2007 through 2 February 2007. The data is from the file
## "household_power_consumption.txt" . This data is available from:
## UCI Machine Learning Repository; 
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## The fuction is entirely
## self-contained. It has no arguments.
## Usage: plot4()
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

## function to make plot
plot4<-function() {
      
      par(mfrow=c(2,2))
      
      filename <- "household_power_consumption.txt"
      dat<-getdata(filename, c("1/2/2007","2/2/2007"))
      dat$convertedTime<-convertdatetime(dat)
      
      png(filename="plot4.png")
      
      par(mfrow=c(2,2))
      
      plot(dat$convertedTime,dat$Global_active_power,type="l",
           xlab="",ylab="Global Active Power (kilowatts)")
      
      plot(dat$convertedTime,dat$Voltage,type="l",
           xlab="datetime",ylab="Voltage")
      
      plot(dat$convertedTime,dat$Sub_metering_1,
           xlab="",ylab="Energy sub metering",
           type="l")
      points(dat$convertedTime,dat$Sub_metering_2,
             col="Red",type="l")
      points(dat$convertedTime,dat$Sub_metering_3,
             col="Blue",type="l")
      legend("topright",col=c("black","red","blue"),lty=1,bty="n",
             legend= c("Sub_metering_1","Sub_metering_2",
                       "Sub_metering_3"))
      
      with(dat,plot(convertedTime,Global_reactive_power,
                    type="l",xlab="datetime"))
      dev.off()
      
      
}