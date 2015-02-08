data = read.table('household_power_consumption.txt', header=T, 
                  sep=';', na.strings = '?')
data = subset(data, Date %in% c('1/2/2007','2/2/2007'))
png(file = 'plot1.png')
with(data,hist(Global_active_power, main = 'Global Active Power',col='red',
               xlab='Global Active Power (kilowatts)'))
dev.off()

