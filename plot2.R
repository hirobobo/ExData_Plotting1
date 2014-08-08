epc<-read.table("household_power_consumption.txt",sep=";",header=T) ##read data
epc$Date<-as.character(epc$Date)
subset1<-epc[epc$Date=="1/2/2007",]
subset1$Global_active_power<-as.numeric(as.character(subset1$Global_active_power))
subset2<-epc[epc$Date=="2/2/2007",]
subset2$Global_active_power<-as.numeric(as.character(subset2$Global_active_power))
mydata<-rbind(subset1,subset2)
mydata$Date<-paste(mydata$Date,mydata$Time)
mydata$Date<-strptime(mydata$Date,"%d/%m/%Y %H:%M:%S")
plot(mydata$Date,mydata$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=" ")
dev.copy(png,file="plot2.png")
dev.off()