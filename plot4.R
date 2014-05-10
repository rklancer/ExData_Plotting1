source("readData.R")
df <- readData()

png("plot4.png", width=480, height=480, bg="white")

par(mfcol=c(2,2))

# this is plot2.R:
plot(df$datetime, df$Global_active_power, type="l",
     col="black",
     xlab="",
     ylab = "Global Active Power (kilowatts)"
)

# this is the meat of plot3.R. The only reason it's copy-pasted here
# (instead of using a proper reuse mechanism) is for graders' convenience.
plot(df$datetime, df$Sub_metering_1, 
     type="l",
     xlab="", 
     ylab="Energy sub metering"
)

points(df$datetime, df$Sub_metering_2, type="l", col="red")
points(df$datetime, df$Sub_metering_3, type="l", col="blue")

legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lty=1
)

# the original was probably generated using
#   with(df, plot(datetime, Voltage...))
# (taking advantage of default x- and y-labels) but let's be explicit:
plot(df$datetime, df$Voltage, type="l",
    col="black",
    xlab="datetime",
    ylab="Voltage"
)

plot(df$datetime, df$Global_reactive_power, type="l",
    col="black",
    xlab="datetime",
    ylab="Global_reactive_power"
)

dev.off()
