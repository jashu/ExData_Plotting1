data = read.table('household_power_consumption.txt', header=T, 
                  sep=';', na.strings = '?', colClasses = 'character')
data = subset(data, Date %in% c('1/2/2007','2/2/2007'))
data$DateTime = strptime(paste(data$Date, data$Time), "%d/%m/%Y %T")  
png(file = 'plot4.png')
par(mfrow = c(2,2))
#top-left plot
with(data,plot(DateTime,Global_active_power, pch=NA_integer_, 
               xlab='', ylab='Global Active Power'))
with(data,lines(DateTime,Global_active_power))
#top-right plot
with(data,plot(DateTime,Voltage, pch=NA_integer_, 
               xlab='datetime', ylab='Voltage'))
with(data,lines(DateTime,Voltage))
#bottom-left plot
with(data,plot(DateTime,Sub_metering_1, pch=NA_integer_, 
               xlab='', ylab='Energy sub metering'))
with(data,lines(DateTime,Sub_metering_1,col='black'))
with(data,lines(DateTime,Sub_metering_2,col='red'))
with(data,lines(DateTime,Sub_metering_3,col='blue'))
legend("topright", bty = 'n', col = c('black','red','blue'), lty=1,
       legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
#bottom-right plot
with(data, plot(DateTime, Global_reactive_power, pch = NA_integer_,
                xlab = 'datetime'))
with(data,lines(DateTime,Global_reactive_power))
dev.off()
