# The data-reading code is the same for all plot-generating scripts, so we
# "include" it by sourcing it from the shared file "readData.R". See that file
# for details.
source("readData.R")
df <- readData()

png("plot2.png", width=480, height=480, bg="white")

plot(df$datetime, df$Global_active_power, type="l",
        col="black",
        xlab="",
        ylab = "Global Active Power (kilowatts)"
)

dev.off()
