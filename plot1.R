library("dplyr")

NEI = readRDS("D:/Rprogramming/Exploratory data analysis/Exploratory-data-analysis-on-air-pollution-data/summarySCC_PM25.rds")

SSC = readRDS("D:/Rprogramming/Exploratory data analysis/Exploratory-data-analysis-on-air-pollution-data/Source_Classification_Code.rds")

emissions_y <- NEI %>%
  group_by(year) %>%
  summarise(total_emissions = sum(Emissions))

with(emissions_y, barplot(total_emissions, names.arg = year, xlab = "Year", ylab = "PM2.5 Emissions (tons)", main = "Total PM2.5 Emission from All Sources"))

dev.copy(png, 'plot1.png')
dev.off()