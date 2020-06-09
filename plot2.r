setwd("D:/coursera_DS/exdata_data_household_power_consumption/Project 2")
if (!exists("NEI")){
  NEI <- readRDS("./summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC<- readRDS("Source_Classification_Code.rds")
}
subsetNEI <- NEI[NEI$fips=="24510",]

aggregatedTotalByYear <- aggregate(Emissions~year,subsetNEI,sum)

png('plot2.png')
barplot(aggregatedTotalByYear$Emissions,names.arg = aggregatedTotalByYear$year,xlab = "Years",ylab = expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))
dev.off()
