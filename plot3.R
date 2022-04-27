library("dplyr")
library("ggplot2")

NEI = readRDS("D:/Rprogramming/Exploratory data analysis/Exploratory-data-analysis-on-air-pollution-data/summarySCC_PM25.rds")

SSC = readRDS("D:/Rprogramming/Exploratory data analysis/Exploratory-data-analysis-on-air-pollution-data/Source_Classification_Code.rds")

emissions_y <- NEI %>%
  filter(fips == "24510") %>%
  group_by(year,type) %>%
  summarise(total_emissions = sum(Emissions))

emissions_y$year <- as.factor(emissions_y$year)

ggplot(emissions_y, aes(x= year, y = total_emissions)) + geom_bar(stat = "identity") + facet_grid(. ~ type) + labs(x = "Year", y = "PM2.5 Emissions") + ggtitle("Baltimore City PM2.5 Emissions")
dev.copy(png, 'plot3.png')
dev.off()