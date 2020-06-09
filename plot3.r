setwd("D:/coursera_DS/exdata_data_household_power_consumption/Project 2")
if (!exists("NEI")){
  NEI <- readRDS("./summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC<- readRDS("Source_Classification_Code.rds")
}

library(ggplot2)
aggregatedTotalByYearandtype <- aggregate(Emissions ~ year + type, subsetNEI, sum)

png("plot3.png", width=640, height=480)
g <- ggplot(aggregatedTotalByYearandtype, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)
dev.off()
