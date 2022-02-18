df <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, na.strings = "?")
df$Date <- as.Date(df$Date, tryFormats = c("%d/%m/%Y"))
d1 <- as.Date("2007-01-31")
d2 <- as.Date("2007-02-03")
df <- df[df$Date > d1 & df$Date < d2,]
df$tformat <- strptime(paste(df$Date, df$Time), "%F %H:%M:%S")

# plotting
Sys.setlocale(category = "LC_ALL", locale = "Englisg")
png("plot3.png", width = 480, height = 480)  # Note: if 
plot(df$tformat, df$Sub_metering_1, type = 'l', xlab='', ylab='Energy submetering',)
lines(df$tformat, df$Sub_metering_2, type = 'l', xlab='', col='blue')
lines(df$tformat, df$Sub_metering_3, type = 'l',  xlab='', col='red')
legend('topright', legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
      col=c("black", "red", "blue"), lty=c(1,1,1))
dev.off()