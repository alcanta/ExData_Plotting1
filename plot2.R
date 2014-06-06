#downloaded and unzipped the file manually on the local computer
#the script reads the data from the unzipped text file
#uses sqldf package for reading the data

library(sqldf)

select_statement<- "select * from file where (Date='1/2/2007'  or Date='2/2/2007')and Global_active_power !='?' "

#read data into df
df <- read.csv.sql("household_power_consumption.txt",select_statement,sep=";")


#create a vector of R objects representing calendar dates and times --(POSIXlt class)

d <- paste(df$Date,df$Time)
date_objects <-strptime(d,"%d/%m/%Y %H:%M:%S")

#creates a png file that will contain the plot
#does not go through the screen first
png("plot2.png",width = 480, height = 480, units = "px")
plot(date_objects,df$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()