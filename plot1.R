df <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, na.strings = "?")
df$Date <- as.Date(df$Date, tryFormats = c("%d/%m/%Y"))
d1 <- as.Date("2007-01-31")
d2 <- as.Date("2007-02-03")
df <- df[df$Date > d1 & df$Date < d2,]

# plotting
Sys.setlocale(category = "LC_ALL", locale = "Englisg")
png("plot1.png", width = 480, height = 480)  # Note: if 
hist(df$Global_active_power, xlab='Global active power (kilowatts)', col='red', main='Global active power')
dev.off()