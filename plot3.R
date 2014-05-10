# The data-reading code is the same for all plot-generating scripts, so we
# "include" it by sourcing it from the shared file "readData.R". See that file
# for details.
source("readData.R")
df <- readData()

png("plot3.png", width=480, height=480, bg="white")

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

dev.off()