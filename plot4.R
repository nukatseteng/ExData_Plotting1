power_consumption <- read.table('./household_power_consumption.txt', sep = ';', header= TRUE, na.strings = '?', as.is = TRUE)

power_consumption <- power_consumption[((power_consumption$Date == '1/2/2007') | (power_consumption$Date == '2/2/2007')),]

power_consumption$DateTime <- strptime(paste(power_consumption$Date, power_consumption$Time), format = '%d/%m/%Y %H:%M:%S')

png(filename = 'plot4.png', width = 480, height = 480)

par(mfrow = c(2,2))
plot(x = power_consumption$DateTime, y = power_consumption$Global_active_power, type = 'l', xlab = '', ylab = "Global Active Power", xaxt = 'n')
plot(x = power_consumption$DateTime, y = power_consumption$Voltage, type = 'l', xlab = 'datetime', ylab = "Voltage", xaxt = 'n')
axis.POSIXct(1, at = c(min(power_consumption$DateTime), median(power_consumption$DateTime), max(power_consumption$DateTime)), labels = c('Thu', 'Fri', 'Sat'))

with(power_consumption, plot(DateTime, Sub_metering_1, type = 'l', xlab = '', ylab = "Energy sub metering", xaxt = 'n'))
with(power_consumption, lines(DateTime, Sub_metering_2, col = 'red'))
with(power_consumption, lines(DateTime, Sub_metering_3, col = 'blue'))
legend('topright', lty = c(1,1,1), col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), bty = 'n')
axis.POSIXct(1, at = c(min(power_consumption$DateTime), median(power_consumption$DateTime), max(power_consumption$DateTime)), labels = c('Thu', 'Fri', 'Sat'))

plot(x = power_consumption$DateTime, y = power_consumption$Global_reactive_power, type = 'l', xlab = 'datetime', ylab = "Global_reactive_power", xaxt = 'n')
axis.POSIXct(1, at = c(min(power_consumption$DateTime), median(power_consumption$DateTime), max(power_consumption$DateTime)), labels = c('Thu', 'Fri', 'Sat'))

dev.off()
