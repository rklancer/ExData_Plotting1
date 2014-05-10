# The data-reading code is the same for all plot-generating scripts, so we
# "include" it by sourcing it from the shared file "readData.R". See that file
# for details.
source("readData.R")
df <- readData()

png("plot1.png", width=480, height=480, bg="white")

hist(df$Global_active_power,
    col="red",
    border="black",
    main="Global Active Power",
    xlab="Global Active Power (kilowatts)",
    ylab="Frequency",
    # just clarifying the default:
    breaks=nclass.Sturges
)

dev.off()
