df <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, na.strings = "?")
df$Date <- as.Date(df$Date, tryFormats = c("%d/%m/%Y"))
d1 <- as.Date("2007-01-31")
d2 <- as.Date("2007-02-03")
df <- df[df$Date > d1 & df$Date < d2,]
df$tformat <- strptime(paste(df$Date, df$Time), "%F %H:%M:%S")

# plotting
Sys.setlocale(category = "LC_ALL", locale = "Englisg")
png("plot4.png", width = 640, height = 640)
par(mfrow=c(2,2))
# 1st
plot(df$tformat, df$Global_active_power, type = 'l', ylab='Global active power', xlab='')
# 2nd
plot(df$tformat, df$Voltage, type = 'l', ylab='Voltage', xlab='datetime')
#3 rd
plot(df$tformat, df$Sub_metering_1, type = 'l', xlab='', ylab='Energy submetering',)
lines(df$tformat, df$Sub_metering_2, type = 'l', xlab='', col='blue')
lines(df$tformat, df$Sub_metering_3, type = 'l',  xlab='', col='red')
legend('topright', inset=0.01, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=c(1,1,1), box.lty=0)
# 4 th
plot(df$tformat, df$Global_reactive_power, type = 'l', ylab='Global_reactive_power', xlab='datetime')
dev.off()