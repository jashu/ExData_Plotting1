data = read.table('household_power_consumption.txt', header=T, 
                  sep=';', na.strings = '?', colClasses = 'character')
data = subset(data, Date %in% c('1/2/2007','2/2/2007'))
data$DateTime = strptime(paste(data$Date, data$Time), "%d/%m/%Y %T")  
png(file = 'plot2.png')
with(data,plot(DateTime,Global_active_power, pch=NA_integer_, 
               xlab='', ylab='Global Active Power (kilowatts)'))
with(data,lines(DateTime,Global_active_power))
dev.off()
