#downloaded and unzipped the file manually on the local computer
#the script reads the data from the unzipped text file
#uses sqldf package for reading the data

library(sqldf)

select_statement<- "select * from file where Date='1/2/2007'  or Date='2/2/2007' "
#read data into dataframe df
df <- read.csv.sql("household_power_consumption.txt",select_statement,sep=";")

#create a vector of R objects representing calendar dates and times --(POSIXlt class)
#these objects will be used on the x axis of the plot
d <- paste(df$Date,df$Time)
date_objects <-strptime(d,"%d/%m/%Y %H:%M:%S")


png("plot4.png",width = 480, height = 480, units = "px")
# modifies the mfrow parameter to be able to to put 4 plots into a single image
par(mfrow = c(2,2))

#plot 1
plot(date_objects,df$Global_active_power,type="l",xlab="",ylab="")

#plot 2

plot(date_objects,df$Voltage,type="l",xlab="datetime",ylab="Voltage")

#plot 3
plot(date_objects,df$Sub_metering_1,type="n", xlab="",ylab="Energy sub metering")
points(date_objects,df$Sub_metering_1,type="l")
points(date_objects,df$Sub_metering_2,col="red",type="l")
points(date_objects,df$Sub_metering_3,col="blue",type="l")
legend("topright",pch = "_____",pt.cex=1,cex=0.6,col=c("black","red",'blue'),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot 4
plot(date_objects,df$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")


dev.off()
