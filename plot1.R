epc<-read.table("household_power_consumption.txt",sep=";",header=T) ##read data
epc$Date<-as.character(epc$Date)
subset1<-epc[epc$Date=="1/2/2007",]
subset1$Global_active_power<-as.numeric(as.character(subset1$Global_active_power))
subset2<-epc[epc$Date=="2/2/2007",]
subset2$Global_active_power<-as.numeric(as.character(subset2$Global_active_power))
mydata<-rbind(subset1,subset2)
hist(mydata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()