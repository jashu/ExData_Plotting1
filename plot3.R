data = read.table('household_power_consumption.txt', header=T, 
                  sep=';', na.strings = '?', colClasses = 'character')
data = subset(data, Date %in% c('1/2/2007','2/2/2007'))
data$DateTime = strptime(paste(data$Date, data$Time), "%d/%m/%Y %T")  
png(file = 'plot3.png')
with(data,plot(DateTime,Sub_metering_1, pch=NA_integer_, 
               xlab='', ylab='Energy sub metering'))
with(data,lines(DateTime,Sub_metering_1,col='black'))
with(data,lines(DateTime,Sub_metering_2,col='red'))
with(data,lines(DateTime,Sub_metering_3,col='blue'))
legend("topright", col = c('black','red','blue'), lty=1,
       legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()
