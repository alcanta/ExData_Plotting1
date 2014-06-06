#downloaded and unzipped the file manually on the local computer
#the script reads the data from the unzipped text file
#uses sqldf package for reading the data

library(sqldf)

select_statement<- "select * from file where (Date='1/2/2007'  or Date='2/2/2007')and Global_active_power !='?' "


#read data into df
df <- read.csv.sql("household_power_consumption.txt",select_statement,sep=";")

#plot the histogram to the screen

hist(df$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

#copy to the file
dev.copy(png,"plot1.png",width=480,height=480,units="px")

dev.off()


