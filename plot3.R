epc<-read.table("household_power_consumption.txt",sep=";",header=T) ##read data
epc$Date<-as.character(epc$Date)
subset1<-epc[epc$Date=="1/2/2007",]
subset1$Global_active_power<-as.numeric(as.character(subset1$Global_active_power))
subset2<-epc[epc$Date=="2/2/2007",]
subset2$Global_active_power<-as.numeric(as.character(subset2$Global_active_power))
mydata<-rbind(subset1,subset2)
mydata$Date<-paste(mydata$Date,mydata$Time)
mydata$Date<-strptime(mydata$Date,"%d/%m/%Y %H:%M:%S")
mydata$Sub_metering_1<-as.numeric(as.character(mydata$Sub_metering_1))
mydata$Sub_metering_2<-as.numeric(as.character(mydata$Sub_metering_2))
mydata$Sub_metering_3<-as.numeric(as.character(mydata$Sub_metering_3))
plot(mydata$Date,mydata$Sub_metering_1,type="l",xlab=" ",ylab="Energy sub metering",ylim=c(0,40),yaxt="n")
axis(2,at=c(0,10,20,30),lab=c("0","10","20","30"))
lines(mydata$Date,mydata$Sub_metering_2,type="l",col="red")
lines(mydata$Date,mydata$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,cex=0.8,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="plot3.png")
dev.off()