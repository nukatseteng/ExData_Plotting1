power_consumption <- read.table('./household_power_consumption.txt', sep = ';', header= TRUE, na.strings = '?', as.is = TRUE)

power_consumption <- power_consumption[((power_consumption$Date == '1/2/2007') | (power_consumption$Date == '2/2/2007')),]

power_consumption$DateTime <- strptime(paste(power_consumption$Date, power_consumption$Time), format = '%d/%m/%Y %H:%M:%S')

png(filename = 'plot1.png', width = 480, height = 480)

hist(power_consumption$Global_active_power, col = "red",  xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()
