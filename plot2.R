power_consumption <- read.table('./household_power_consumption.txt', sep = ';', header= TRUE, na.strings = '?', as.is = TRUE)

power_consumption <- power_consumption[((power_consumption$Date == '1/2/2007') | (power_consumption$Date == '2/2/2007')),]

power_consumption$DateTime <- strptime(paste(power_consumption$Date, power_consumption$Time), format = '%d/%m/%Y %H:%M:%S')

png(filename = 'plot2.png', width = 480, height = 480)

plot(x = power_consumption$DateTime, y = power_consumption$Global_active_power, type = 'l', xlab = '', ylab = "Global Active Power (kilowatts)", xaxt = 'n')
axis.POSIXct(1, at = c(min(power_consumption$DateTime), median(power_consumption$DateTime), max(power_consumption$DateTime)), labels = c('Thu', 'Fri', 'Sat'))

dev.off()
