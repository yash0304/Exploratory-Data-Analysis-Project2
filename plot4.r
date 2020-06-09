setwd("D:/coursera_DS/exdata_data_household_power_consumption/Project 2")
if (!exists("NEI")){
  NEI <- readRDS("./summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC<- readRDS("Source_Classification_Code.rds")
}

if(!exists("NEISCC")){
  NEISCC <- merge(NEI,SCC,by = "SCC")
}

coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coalMatches, ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)



png("plot4.png", width=640, height=480)
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()
