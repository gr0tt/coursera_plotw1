df <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, na.strings = "?")
df$Date <- as.Date(df$Date, tryFormats = c("%d/%m/%Y"))
d1 <- as.Date("2007-01-31")
d2 <- as.Date("2007-02-03")
df <- df[df$Date > d1 & df$Date < d2,]
df$tformat <- strptime(paste(df$Date, df$Time), "%F %H:%M:%S")

# plotting
Sys.setlocale(category = "LC_ALL", locale = "Englisg")
png("plot2.png", width = 480, height = 480)  # Note: if 
plot(df$tformat, df$Global_active_power, type = 'l', ylab='Global active power (kilowatts)', xlab='')
dev.off()