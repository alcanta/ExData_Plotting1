#downloaded and unzipped the file manually on the local computer
#the script reads the data from the unzipped text file
#uses sqldf package for reading the data

library(sqldf)

select_statement<- "select Date,Time,Sub_metering_1,Sub_metering_2,Sub_metering_3 from file where Date='1/2/2007'  or Date='2/2/2007' "

#read data into dataframe df
df <- read.csv.sql("household_power_consumption.txt",select_statement,sep=";")

#create a vector of R objects representing calendar dates and times --(POSIXlt class)
#these objects will be used on the x axis of the plot
d <- paste(df$Date,df$Time)
date_objects <-strptime(d,"%d/%m/%Y %H:%M:%S")

#will plot directly to the png 
png("plot3.png",width = 480, height = 480, units = "px")

#does not plot anything yet
plot(date_objects,df$Sub_metering_1,type="n", xlab="",ylab="Energy sub metering")
#adds in sequence new data to the plot using points() function
points(date_objects,df$Sub_metering_1,type="l")
points(date_objects,df$Sub_metering_2,col="red",type="l")
points(date_objects,df$Sub_metering_3,col="blue",type="l")
legend("topright",pch = "_____",col=c("black","red",'blue'),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()